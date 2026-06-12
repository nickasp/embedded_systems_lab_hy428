#include "i2c.h"
#include "nvic.h"

//
// global variables used by TWI1_Handler()
//
static volatile uint32_t glen = 0U, gcount = 0U;
static volatile uint8_t *gdata = NULL;
static volatile uint8_t dma_write = 0U, dma_read = 0U;

volatile uint8_t t_done = 0U;

volatile i2c_mode_t i2c_mode = I2C_IDLE;

//
// TWI1 interface interrupt handler 
// (used when either i2c_write_async(),
// or i2c_read_async() is used)
//
void TWI1_Handler(void)
{
	uint32_t status;

	//
	// an interrupt has occurred
	//
	
	status = TWI1->TWI_SR & TWI1->TWI_IMR; // stores status register value
	
	switch(i2c_mode) 
	{
    		case I2C_WRITE:
        		if(status & TWI_SR_TXRDY) 
			{
            			if(gcount < glen) 
				{
                			TWI1->TWI_THR = gdata[gcount++];
            			} 
            			else 
	    			{
                			TWI1->TWI_CR = TWI_CR_STOP;
                			TWI1->TWI_IDR = TWI_IDR_TXRDY;
                			TWI1->TWI_IER = TWI_IER_TXCOMP;
            			}
        		}
        		break;

    		case I2C_READ:
        		if(status & TWI_SR_RXRDY) 
			{
            			if(glen == 1) 
	    			{
                			gdata[gcount++] = TWI1->TWI_RHR;
                			TWI1->TWI_IDR = TWI_IDR_RXRDY;
                			TWI1->TWI_IER = TWI_IER_TXCOMP;
            			} 
            			else if(gcount == glen - 2) 
				{
                			TWI1->TWI_CR = TWI_CR_STOP;
                			gdata[gcount++] = TWI1->TWI_RHR;
            			}
            			else if(gcount < glen - 1) 
	    			{
                			gdata[gcount++] = TWI1->TWI_RHR;
            			}
            			else 
				{
                			gdata[gcount++] = TWI1->TWI_RHR;
                			TWI1->TWI_IDR = TWI_IDR_RXRDY;
                			TWI1->TWI_IER = TWI_IER_TXCOMP;
            			}
        		}
        		break;

    		case I2C_WRITE_DMA:
        		if(status & TWI_SR_ENDTX) 
			{
            			TWI1->TWI_IDR = TWI_IDR_ENDTX;
            			if(glen > 1) 
	    			{
                			TWI1->TWI_CR = TWI_CR_STOP;
            			}        
            			TWI1->TWI_IER = TWI_IER_TXCOMP;
        		}
        		break;

    		case I2C_READ_DMA:
        		if(status & TWI_SR_ENDRX) 
			{
            			TWI1->TWI_PTCR = PERIPH_PTCR_RXTDIS; 
            			TWI1->TWI_IDR = TWI_IDR_ENDRX;
            			TWI1->TWI_IER = TWI_IER_RXRDY; 
        		}
        		if(status & TWI_SR_RXRDY) 
			{
            			if(glen == 1) 
	    			{	 
	                		gdata[0] = TWI1->TWI_RHR;
                			TWI1->TWI_IDR = TWI_IDR_RXRDY;
                			TWI1->TWI_IER = TWI_IER_TXCOMP;
            			}
            			else if(gcount == glen - 2) 
	    			{ 
					TWI1->TWI_CR = TWI_CR_STOP;
                			gdata[gcount++] = TWI1->TWI_RHR;
            			} 
            			else if(gcount == glen - 1) 
	    			{ 
					gdata[gcount++] = TWI1->TWI_RHR;
                			TWI1->TWI_IDR = TWI_IDR_RXRDY;
                			TWI1->TWI_IER = TWI_IER_TXCOMP;
            			}
        		}
        		break;

    		default:
        		break;
    	}

    	if(status & TWI_SR_TXCOMP) 
	{       
		// executed both with and without DMA
        	t_done = 1;
        	TWI1->TWI_PTCR = PERIPH_PTCR_TXTDIS | PERIPH_PTCR_RXTDIS;
        	TWI1->TWI_IDR = TWI_IDR_TXCOMP | TWI_IDR_NACK | TWI_IDR_ENDTX | TWI_IDR_ENDRX | TWI_IDR_RXRDY | TWI_IDR_TXRDY;
        	i2c_mode = I2C_IDLE;
    	}

   	if(status & TWI_SR_NACK) 
	{
        	t_done = 1;
        	TWI1->TWI_PTCR = PERIPH_PTCR_TXTDIS | PERIPH_PTCR_RXTDIS;
        	TWI1->TWI_IDR = TWI_IDR_TXCOMP | TWI_IDR_NACK | TWI_IDR_ENDTX | TWI_IDR_ENDRX | TWI_IDR_RXRDY | TWI_IDR_TXRDY;
        	i2c_mode = I2C_IDLE;
    	}

}

void i2c_init(void)
{ 
    PMC->PMC_PCER0 |= (1U<<ID_TWI1) | (1U<<ID_PIOB);    
    PIOB->PIO_ABSR &= (~PIO_PB12 & ~PIO_PB13);          
    PIOB->PIO_PUER |= PIO_PUER_P12 | PIO_PUER_P13;      
    PIOB->PIO_MDER |= PIO_MDER_P12 | PIO_MDER_P13;      
    PIOB->PIO_PDR |=  PIO_PDR_P12 | PIO_PDR_P13;        
    TWI1->TWI_CR = TWI_CR_SWRST;                       
    TWI1->TWI_CR |= TWI_CR_SVDIS | TWI_CR_MSEN;         
    TWI1->TWI_CWGR = (1U << 16) | (208U << 8) | 208U;
    TWI1->TWI_IDR  = TWI_IDR_TXCOMP | TWI_IDR_NACK | TWI_IDR_RXRDY | TWI_IDR_TXRDY;    
    nvic_enable(TWI1_IRQn);
    (void)TWI1->TWI_SR;                                           
    return;
}

// synchronous write
void i2c_write(uint8_t address, uint8_t *data, uint32_t len)
{
	// checks for invalid parameters 
	if(!data || !len) return;

	// sets slave address and no internal address (no iaddr)
	// data-transfer direction bit (R/W bit) is set to W by default
	TWI1->TWI_MMR = TWI_MMR_DADR(address) | TWI_MMR_IADRSZ_NONE;
	TWI1->TWI_IADR = 0U; // no internal address (no iaddr)
	
	// clears old status
	(void)TWI1->TWI_SR;
	
	// starts transmitting
	TWI1->TWI_THR = data[0]; // transmits first data byte
	for(uint32_t i=1U; i<len; i++)
        {
		// more data to be sent
		
		// waits until TXRDY==1 (until next data byte can be sent) 
		// or NACK==1 (slave device did not acknowledge the msg reception)
		while(!(TWI1->TWI_SR & (TWI_SR_TXRDY | TWI_SR_NACK)));	
		// checks whether NACK==1
		if(TWI1->TWI_SR & TWI_SR_NACK)
		{
			// stops transmition
			TWI1->TWI_CR = TWI_CR_STOP;
			return;
		}		
		
		// transmits next data byte
		TWI1->TWI_THR = data[i];
        }

	// waits (for the successful transmition of the last sent byte) before STOP
	while(!(TWI1->TWI_SR & (TWI_SR_TXRDY | TWI_SR_NACK)));
	// checks whether NACK==1
	if(TWI1->TWI_SR & TWI_SR_NACK)
	{
		// stops transmition
		TWI1->TWI_CR = TWI_CR_STOP;
		return;
	}	

	// writes stop condition
	TWI1->TWI_CR = TWI_CR_STOP;
	
	// waits until transmition has been completed
	while(!(TWI1->TWI_SR & TWI_SR_TXCOMP));
}

// synchronous read
void i2c_read(uint8_t address, uint8_t *data, uint32_t len)
{
	// checks for invalid parameters
	if(!data || !len) return;

	// sets slave address and no internal address (no iaddr)
	// data-transfer direction bit (R/W bit) is set to R 
	TWI1->TWI_MMR = TWI_MMR_DADR(address) | TWI_MMR_IADRSZ_NONE | TWI_MMR_MREAD;
	TWI1->TWI_IADR = 0U; // no internal address (no iaddr)

	// clears old status
	(void)TWI1->TWI_SR;

	// starts transfer
	if(len == 1)
	{
		// only one data byte is to be read
		// START and STOP conditions are sent simultaneously
		TWI1->TWI_CR = TWI_CR_START | TWI_CR_STOP;

		// waits until either RXRDY is set (data byte has been received),
		// or NACK is set (slave device has not acknowledged the transmit)
		while(!(TWI1->TWI_SR & (TWI_SR_RXRDY | TWI_SR_NACK)));

		if(TWI1->TWI_SR & TWI_SR_NACK)
		{
			// not acknowledged
			// stops transfer
			TWI1->TWI_CR = TWI_CR_STOP;
			return;
		}
		
		// reads data byte received into receive holding register (TWI_RHR)
		data[0] = (uint8_t)TWI1->TWI_RHR;
	}
	else
	{
		// multiple data bytes to be read
		// sends START condition only 
		TWI1->TWI_CR = TWI_CR_START;

        	for(uint32_t i=0; i<len; i++)
		{
			// waits until either RXRDY is set (data byte has been received),
			// or NACK is set (slave device has not acknowledged the transmit)
			while(!(TWI1->TWI_SR & (TWI_SR_RXRDY | TWI_SR_NACK)));

			if(TWI1->TWI_SR & TWI_SR_NACK)
			{
				// not acknowledged 
				// stops transfer
				TWI1->TWI_CR = TWI_CR_STOP;
				return;
			}

			// reads data byte received into receive holding register (TWI_RHR)
			data[i] = (uint8_t)TWI1->TWI_RHR;

			if(i == len - 2U)
			{
				// next-to-last data byte was read
				// prepares NACK and STOP signal to be sent 
				// right after next-to-last data byte is read
				TWI1->TWI_CR = TWI_CR_STOP;
			}
		}	

		// waits until transmition has been completed
		while(!(TWI1->TWI_SR & TWI_SR_TXCOMP));
	}
}


void i2c_write_async(uint8_t address, uint8_t *data, uint32_t len)
{
    // signal (for interrupt handler) that we are into async write mode
    i2c_mode = I2C_WRITE;
   
    gdata = data;
    glen = len;
    gcount = 0;
    t_done = 0; // flag to signal the end of the transmission

    // sets slave address and no internal address (no iaddr)
    // data-transfer direction bit (R/W bit) is set to W by default
    TWI1->TWI_MMR = TWI_MMR_DADR(address) | TWI_MMR_IADRSZ_NONE;
    TWI1->TWI_IADR = 0U; // no internal address (no iaddr) 

    // reads (clears) status register
    (void)TWI1->TWI_SR;
    
    if(len == 1) 
    {
        TWI1->TWI_CR = TWI_CR_START | TWI_CR_STOP;      //sends start and stop condition together
        TWI1->TWI_THR = gdata[gcount++];                // writes first byte and increments gcount 
        TWI1->TWI_IER = TWI_IER_TXCOMP;                 //enable transmission complete interrupt
    }
    else 
    {
        TWI1->TWI_CR |= TWI_CR_START;                   // sends start condition only
        TWI1->TWI_THR = gdata[gcount++];                // writes first byte and increments gcount
        TWI1->TWI_IER = TWI_IER_TXRDY | TWI_IER_NACK;   // enables Transmit Holding Register Ready interrupt and NACK interrupt
    }
    
    return;
}

void i2c_read_async(uint8_t address, uint8_t *data, uint32_t len)
{ 
    // signal (for interrupt handler) that we are into read mode
    i2c_mode = I2C_READ;

    gdata = data;
    glen = len;
    gcount = 0;
    t_done = 0; // flag to signal the end of the transmission

    // sets slave address and no internal address (no iaddr)
    // data-transfer direction bit (R/W bit) is set to R
    TWI1->TWI_MMR = TWI_MMR_DADR(address) | TWI_MMR_IADRSZ_NONE | TWI_MMR_MREAD;
    TWI1->TWI_IADR = 0U; // no internal address (no iaddr) 

    // reads (clears) status register
    (void)TWI1->TWI_SR;

    if(len == 1) 
    {
        TWI1->TWI_CR = TWI_CR_START | TWI_CR_STOP;
        TWI1->TWI_IER = TWI_IER_RXRDY | TWI_IER_NACK;
    }
    else 
    {
        TWI1->TWI_CR = TWI_CR_START;                   
        TWI1->TWI_IER = TWI_IER_RXRDY | TWI_IER_NACK;           
    }

    return;
}

void i2c_write_async_dma(uint8_t address, uint8_t *data, uint32_t len)
{
    //t_done = 0;
    //glen = len;

    // signal (for interrupt handler) that we are into write-dma mode
    i2c_mode = I2C_WRITE_DMA; 

    glen = len;
    t_done = 0U;

    //TWI1->TWI_SR;
    //TWI1->TWI_MMR = (address << 16);
    
    // sets slave address and no internal address (no iaddr)
    // data-transfer direction bit (R/W bit) is set to W by default
    TWI1->TWI_MMR = TWI_MMR_DADR(address) | TWI_MMR_IADRSZ_NONE;
    TWI1->TWI_IADR = 0U; // no internal address (no iaddr) 

    // reads (clears) status register
    (void)TWI1->TWI_SR;

    // sets configuration for dma (data pointer and transmit counter)
    TWI1->TWI_TPR = (uint32_t)data;
    TWI1->TWI_TCR = len;  

    // enables PDC transmitter (dma peripheral starts transfer 
    // (in cooperation with the twi peripheral)
    TWI1->TWI_PTCR = PERIPH_PTCR_TXTEN; 

    // enables dma related interrupts
    TWI1->TWI_IER = TWI_IER_ENDTX | TWI_IER_NACK;

    if (len == 1) 
    {
        TWI1->TWI_CR = TWI_CR_START | TWI_CR_STOP;
    }
    else 
    {
        TWI1->TWI_CR = TWI_CR_START;
    }
}

void i2c_read_async_dma(uint8_t address, uint8_t *data, uint32_t len)
{    
    // signal (for interrupt handler) that we are into read-dma mode 
    i2c_mode = I2C_READ_DMA;

    t_done = 0;
    glen = len;
    gdata = data;
    gcount = len - 2U;

    //TWI1->TWI_SR;
    //TWI1->TWI_MMR = (address << 16) | TWI_MMR_MREAD;
    
    // sets slave address and no internal address (no iaddr)
    // data-transfer direction bit (R/W bit) is set to R
    TWI1->TWI_MMR = TWI_MMR_DADR(address) | TWI_MMR_IADRSZ_NONE | TWI_MMR_MREAD;
    TWI1->TWI_IADR = 0U; // no internal address (no iaddr) 

    // reads (clears) status register
    (void)TWI1->TWI_SR;
    
    if (len <= 2) 
    {
	// all bytes are handled manually (no dma)   
	// (same logic as read async) 
        gcount = 0;
        
	if(len == 1)
	{       	
		TWI1->TWI_CR = TWI_CR_START | TWI_CR_STOP;
	}
	else 
	{
		TWI1->TWI_CR = TWI_CR_START;
	}

	TWI1->TWI_IER = TWI_IER_NACK | TWI_IER_RXRDY;
    }
    else 
    {
	// more than 2 bytes in total ==> dma usage + manual handling of the 2 last bytes
        gcount = len - 2U;

        TWI1->TWI_RPR = (uint32_t)data;
        TWI1->TWI_RCR = len - 2U;      

        TWI1->TWI_PTCR = PERIPH_PTCR_RXTEN;
        TWI1->TWI_IER = TWI_IER_ENDRX | TWI_IER_NACK;
        TWI1->TWI_CR = TWI_CR_START;
    }
}
