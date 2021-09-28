#include "Config.h"


void ConfigPic(){
   CHECON = 30;
   AD1PCFG = 0xFFFFFFFF;
   JTAGEN_bit = 0;

  TRISA = 0X0200;
  TRISB = 0X0000;
  TRISC = 0X0000;
  TRISD = 0X0000;
  TRISE = 0X0010;
  TRISF = 0X0000;
  TRISG = 0X0000;


   I2C2_Init_Advanced(80000,100000);//INIT I2C AT 100KHZ
   I2C_Set_Active(&I2C2_Start, &I2C2_Restart, &I2C2_Read, &I2C2_Write,
                  &I2C2_Stop,&I2C2_Is_Idle); // Sets the I2C2 module active
   Delay_ms(100);
   UART2_Init(115200);              // Initialize UART module at 9600 bps
   //ADC1_Init();
   
   USBIE_bit = 0;
   IPC11bits.USBIP = 7;
   HID_Enable(&readbuff,&writebuff);


  LATA10_bit = 0;
  LATE3_bit = 0;
  InitTimer1();
  InitISR();
}

void InitVars(){

}


