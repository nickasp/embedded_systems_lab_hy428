#include "gyro.h"
#include "bmx160.h"
#include "tc.h"
#include "i2c.h"
#include "led.h"

/* Global state the header promises to define. */
struct gyroscope gyro;

/* ---- Low-level register helpers ---------------------------------------
 * The ONLY functions in this file that touch I2C. Everything else is
 * built on top of them, so swapping i2c_write -> i2c_write_async ->
 * i2c_write_async_dma in milestones 5 and 6 is a one-line change.
 * ---------------------------------------------------------------------- */

void gyro_regwrite(uint8_t addr, uint8_t val)
{
    /* A BMX160 register write is a 2-byte I2C write: [reg_addr, value]. */
    static uint8_t buf[2];
    buf[0] = addr;
    buf[1] = val;
    i2c_write_async(BMX160_I2CADDR, buf, 2);
    while(!t_done);
}

void gyro_regread(uint8_t addr, uint8_t *val, uint32_t len)
{
    /* Two-phase register read:
     *   1) Write 1 byte telling the device which register we want.
     *   2) Read `len` bytes starting from that register — the BMX160
     *      auto-increments its internal pointer on burst reads.
     */
    static uint8_t addr1; 
    addr1 = addr;
    i2c_write_async(BMX160_I2CADDR, &addr1, 1);
    while(!t_done);
    i2c_read_async(BMX160_I2CADDR, val,   len);
    while(!t_done);
}

/* ---- Identity check ---------------------------------------------------- */

uint8_t gyro_idread(void)
{
    /* CHIP_ID register is at 0x00. Expected value: 0xD8 (BMX160) or
     * 0xD1 (BMI160). This is your fastest sanity check that I2C is
     * wired and configured correctly — call it once at startup.
     */
    uint8_t id = 0;
    gyro_regread(BMX160_CHIP_ID_ADDR, &id, 1);
    return id;
}

/* ---- Init -------------------------------------------------------------- */

void gyro_init(void)
{
    /* Soft reset: clears all registers to defaults. */
    gyro_regwrite(BMX160_COMMAND_REG_ADDR, 0xB6);
    tc_spinuns(TC0, 1, 15000000);         /* ~15 ms — datasheet says >=1 ms */

    /* Power up the gyroscope: CMD = 0x15 sets gyro PMU to normal mode.
     * Encoding: class 00010 (set_pmu_mode) | target 101 (gyro normal).
     */
    gyro_regwrite(BMX160_COMMAND_REG_ADDR, 0x15);
    tc_spinuns(TC0, 1, 100000000);        /* ~100 ms gyro start-up time */

    /* GYR_CONF (0x42): 0x06 = ODR 25 Hz, normal filter. Raise this
     * (e.g. 0x28 for 100 Hz) once the basic pipeline works.
     */
    gyro_regwrite(BMX160_GYRO_CONFIG_ADDR, 0x06);
    tc_spinuns(TC0, 1, 10000000);

    /* GYR_RANGE (0x43) is left at its power-on default of 0x00 = ±2000 dps,
     * which matches BMX160_GSENS_2000DPS used in gyro_read(). If you ever
     * write this register, update the sensitivity constant to match.
     */

    gyro_regwrite(BMX160_GYRO_RANGE_ADDR, 0x03);
    tc_spinuns(TC0, 1, 10000000);
}

/* ---- Read gyro data ---------------------------------------------------- */

struct gyroscope gyro_read(void)
{
    /* Gyro data lives in six consecutive registers starting at 0x0C:
     *   X_LSB, X_MSB, Y_LSB, Y_MSB, Z_LSB, Z_MSB
     * Each axis is a signed 16-bit little-endian value.
     *
     * Burst-read all 6 bytes in one transaction — three separate 2-byte
     * reads would risk tearing (different axes from different samples).
     */
    uint8_t raw[6];
    gyro_regread(BMX160_GYRO_DATA_ADDR, raw, 6);

    int16_t x = (int16_t)((raw[1] << 8) | raw[0]);
    int16_t y = (int16_t)((raw[3] << 8) | raw[2]);
    int16_t z = (int16_t)((raw[5] << 8) | raw[4]);

    /* Store raw bit patterns. int16 -> uint16 preserves the bits; if you
     * later need the signed value back, cast through int16_t.
     */
    gyro.xraw = (uint16_t)x;
    gyro.yraw = (uint16_t)y;
    gyro.zraw = (uint16_t)z;

    /* Convert to degrees/second. The header's GSENS macros are in units
     * of dps-per-LSB, so this is a MULTIPLY (not a divide). Using the
     * wrong direction gives values ~269x too large — a common bug.
     */
    gyro.x = (float)x * BMX160_GSENS_250DPS;
    gyro.y = (float)y * BMX160_GSENS_250DPS;
    gyro.z = (float)z * BMX160_GSENS_250DPS;

    //gyro.x = 0;
    //gyro.y = 0;
    //gyro.z = 0;

    return gyro;
}
