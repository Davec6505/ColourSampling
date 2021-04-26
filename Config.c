#include "Config.h"


void ConfigPic(){
   CHECON = 30;
   AD1PCFG = 0xFFFFFFFF;
   JTAGEN_bit = 0;

  TRISA = 0X020C;
  TRISB = 0X0000;
  TRISC = 0X0000;
  TRISD = 0X0000;
  TRISE = 0X0010;
  TRISF = 0X0000;
  TRISG = 0X0000;


   I2C2_Init(100000);//_Advanced(80000,400000);//INIT I2C AT 100KHZ
   I2C_Set_Active(&I2C2_Start, &I2C2_Restart, &I2C2_Read, &I2C2_Write,
                  &I2C2_Stop,&I2C2_Is_Idle); // Sets the I2C2 module active
   Delay_ms(100);
   UART2_Init(56000);              // Initialize UART module at 9600 bps
   //ADC1_Init();


  LATA10_bit = 0;
  
  LATE3_bit = 0;
  InitTimer1();
  InitISR();
}