#include "display.h"
#include "font.h"
#include "spi.h"
#include "tc.h"
#include "led.h"

#define CD   PIO_PC21 // set to 1/0 to send data/command
#define RST  PIO_PC22
#define BL   PIO_PC23

uint8_t FrameBuffer[PAGES][WIDTH]; // Constants defined in display.h, 8 pages of 128 columns each 

void display_init(){
       //necessary; need to uncomment 
	spi_init();
    //setup display PIO pins
	PIOC->PIO_PER  = CD;
    PIOC->PIO_OER  = CD;
    PIOC->PIO_IFDR = CD;
    PIOC->PIO_CODR = CD;
    PIOC->PIO_IDR  = CD;
    PIOC->PIO_MDDR = CD;
    PIOC->PIO_PUDR = CD;
    PIOC->PIO_OWDR = CD;

    PIOC->PIO_PER  = RST;
    PIOC->PIO_OER  = RST;
    PIOC->PIO_IFDR = RST;
    PIOC->PIO_CODR = RST;
    PIOC->PIO_IDR  = RST;
    PIOC->PIO_MDDR = RST;
    PIOC->PIO_PUDR = RST;
    PIOC->PIO_OWDR = RST;

    PIOC->PIO_PER  = BL;
    PIOC->PIO_OER  = BL;

    PIOC->PIO_SODR = BL;

	spi_setcs(0);  		   // select/enable the display	
    PIOC->PIO_CODR = RST;  // reset the display
    tc_spinus(TC0,1, 1);
    led_on();
    PIOC->PIO_SODR = RST;  // clear the reset signal 
    PIOC->PIO_CODR = CD;   // set command mode

    

	//necessary for initialization; need to uncomment
    spi_writebyte(0xaf); //0xaf/0xae: display ON/OFF
    spi_writebyte(0x2f); //0x2f: set all power circuits (booster, regulator, follower) ON
    spi_writebyte(0xa1); //0xa0/0xa1: set display column addresses to reverse/normal

	//other commands
    spi_writebyte(0xe2); //0xe2: internal reset
    spi_writebyte(0xa2); //0xa2/0xa3: set LCD bias to 1/9 or 1/7
    spi_writebyte(0x27); //0x27: set V5 voltage resistor ratio to large
    spi_writebyte(0x81); spi_writebyte(0x00); //0x81+00xxxxxx: set contrast (electronic volume value) to 00xxxxxx
    spi_writebyte(0xf8); spi_writebyte(0x00); //0xf8+0x00: set booster ratio to 4x
    spi_writebyte(0x40); //b01xxxxxx: set display RAM start line to xxxxxx
    spi_writebyte(0xb0); //0xb0: set page address 0
    spi_writebyte(0x10); spi_writebyte(0x00); //0x10+0x00: set column address 0
    spi_writebyte(0xc0); //0xc0/0xc1: set scan direction to normal/reverse
    spi_writebyte(0xa6); //0xa6/0xa7: set display to normal/reverse pixels 
    spi_writebyte(0xac); //0xac/0xad: set flushing OFF/ON
    spi_writebyte(0xe0); //0xe0/0xee: set/clear address auto-increment
    spi_writebyte(0xa4); //0xa4/0xa5: set all pixels OFF/ON

	return;
}

void display_update(void) {
    spi_setcs(0);

    for (uint8_t page = 0; page < 8; page++) {
        PIOC->PIO_CODR = CD;               // command mode
        spi_writebyte(0xB0 | page);        // set page address
        spi_writebyte(0x10);               // column address high nibble
        spi_writebyte(0x00);               // column address low nibble

        PIOC->PIO_SODR = CD;                 // data mode
        spi_write(FrameBuffer[page], WIDTH); // send WIDTH bytes for this page
    }

    spi_setcs(1);
}

void display_clear(void) {
    for (uint8_t page = 0; page < 8; page++) {
        for (uint8_t column = 0; column < WIDTH; column++) {
            FrameBuffer[page][column] = 0;
        }
    }
}

void display_setpixel(uint8_t i, uint8_t j, uint8_t value) {
    // i = row 0..63, j = column 0..127
    uint8_t page = i >> 3;          // i / 8
    uint8_t bit  = i & 7;           // i % 8
    if (value != 0) {
        FrameBuffer[page][j + 4] |=  (1u << bit);
    } else {
        FrameBuffer[page][j + 4] &= ~(1u << bit);
    }
}

void display_char(uint8_t i, uint8_t j, char c) {
    if (j > 122) return;                    // clip
    uint8_t idx = c-32;                     // cast to unsigned

    for (uint8_t k = 0; k < FONTX; k++) {   // FONTX=6
        FrameBuffer[i][j + k + 4] = font[idx * FONTX + k];
    }
}

void display_str(uint8_t i, uint8_t j, char *str){
    int count = 0;

    while(str[count] != '\0'){
        display_char(i, j + count*6, str[count]);
        count++;
    }
}

// converts first width digits of integer num into a string and returns it
static inline void itoa(int num, char *s, uint32_t width) 
{
    int i, initial_num;
    char tmp;

    // holds initial num
    initial_num = num;

    // converts integer to string 
    // e.g. ((123) ---> ("321")) OR ((-123) ---> ("321-"))
    if (num < 0)
        num = -num;

    i = 0;
    do 
    {
        if(i > width)
            break;

        s[i] = ('0' + num%10);
	i++;
	num = num/10;
    }while(num);

    if(initial_num < 0)
    {
        s[i] = '-';
        i++;
    }

    s[i] = '\0';

    // reverses string 
    for (int j = 0, k = i - 1; j < k; j++, k--) 
    {
        tmp = s[j];
        s[j] = s[k];
        s[k] = tmp;
    }
}

void display_num(uint8_t i, uint8_t j, uint32_t num, uint8_t width)
{
	char buffer[width + 1];
	
	itoa(num, buffer, width);
	buffer[width] = '\0';
	
	display_str(i, j, buffer);
}
