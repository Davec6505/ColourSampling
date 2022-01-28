#include "Config.h"

sbit RD at LATB0_bit;
sbit GR at LATG13_bit;
sbit BL at LATD4_bit;

unsigned int current_duty1,current_duty2;
unsigned int pwm_period1, pwm_period2;

void ConfigPic(){

   CHECON = 30;
   AD1PCFG = 0xFFFFFFFF;
   JTAGEN_bit = 0;

  TRISA = 0X0200;
  TRISB = 0X0010;
  TRISC = 0X0000;
  TRISD = 0X0000;
  TRISE = 0X0210;
  TRISF = 0X0000;
  TRISG = 0X0200;
  
  LATD = 0;
 

  USBIE_bit = 0;
  IPC11bits.USBIP = 7;
   HID_Enable(&readbuff,&writebuff);

   I2C2_Init_Advanced(80000,100000);//INIT I2C AT 100KHZ
   I2C_Set_Active(&I2C2_Start, &I2C2_Restart, &I2C2_Read, &I2C2_Write,
                  &I2C2_Stop,&I2C2_Is_Idle); // Sets the I2C2 module active
   I2C2_SetTimeoutCallback(1000, I2C2_TimeoutCallback);
   Delay_ms(100);
   InitUart1();
   Delay_ms(100);
   InitUart2();

   //Initialize PWMs and set duty cycle
   current_duty1  = 2000;                        // initial value for current_duty
   current_duty2 = 10000;                        // initial value for current_duty1
   pwm_period1 = PWM_Init(5000 , 1, 0, 3);//pwm frk,pwm pin 1-latd0,pre-scal,tmr2
   pwm_period2 = PWM_Init(5000 , 2, 0, 3); //pwm frk,pwm pin 1-latd1,pre-scal,tmr5
   PWM_Set_Duty(current_duty1,  1);            // Set current duty for PWM1
   PWM_Set_Duty(current_duty2, 2);            // Set current duty for PWM2
   PWM_Stop(1);
   PWM_Stop(2);
   

   MM_Init();


  LATA10_bit = 0;
  LATE3_bit = 0;
  InitTimers();
  InitISR();
  InitGSM3();
  PwrUpGSM3();
  setup_LM35(5);
}

void InitUart1(){
     UART1_Init(9600);              // Initialize UART module at 9600 bps
     URXISEL0_bit  = 0;
     URXISEL1_bit  = 0;
     IPC6CLR = 0X1F;
     IPC6SET = 0X1B;                //PRIORITY LEVEL 6  recieve
     U1RXIE_bit = 1;
     U1RXIF_bit = 0;
}

void InitUart2(){
     UART2_Init(9600);              // Initialize UART module at 9600 bps
     IPC8CLR = 0X1F;
     IPC8SET = 0X1A;                //PRIORITY LEVEL 6 recieve
     U2RXIE_bit = 1;
     U2RXIF_bit = 0;
}

void SetLedPWM(){
int err;
     TCS3472_getRawData(RawData);
     err = TCS3472_C2RGB_Error(RawData);
    do{
      current_duty2 += err;
      PWM_Set_Duty(current_duty2, 2);
      Delay_ms(500);
      TCS3472_getRawData(RawData);
      err = TCS3472_C2RGB_Error(RawData);
    }while(err < -50 || err > 50);

}