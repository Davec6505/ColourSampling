#include "Config.h"

sbit RD at LATB0_bit;
sbit GR at LATG13_bit;
sbit BL at LATD4_bit;

unsigned int current_duty2,current_duty3;
unsigned int pwm_period2, pwm_period3;

#ifdef LedDeBug
char txtLed[15];
#endif


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
 
  FSCM_SetUP();
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
  current_duty2  = 5000;                     // initial value for current_duty
  current_duty3  = 500;                     // initial value for current_duty1
  pwm_period2 = PWM_Init(5000 , 2, 0, 2);    //pwm frk,pwm pin 1-latd0,pre-scal,tmr2
  pwm_period3 = PWM_Init(5000 , 3, 4, 3);    //pwm frk,pwm pin 1-latd1,pre-scal,tmr5
  PWM_Set_Duty(current_duty2,  2);           // Set current duty for PWM1
  PWM_Set_Duty(current_duty3, 3);            // Set current duty for PWM2
  PWM_Stop(2);
  PWM_Stop(3);
  MM_Init();

  LATA10_bit = 0;
  LATE3_bit = 0;
  InitTimers();
  InitISR();
  InitGSM3();
  PwrDownGSM3();
  PwrUpGSM3();
  setup_LM35(5);
  Init_PID(65.25, 24.00, 1.25, 0, 3780,0); //kp,ki,kd,min,max,offset
  PID_Control("PID");
}

void FSCM_SetUP(){
  if (OSCCON & 0x0008){ // check for a FSCM during start-up
  // user handler for a FSCM event occurred during start-up
  }
  else{ // normal start-up
    IPC8CLR = 0x1F << 8; // clear the FSCM priority bits
    IPC8SET = 1 << 10; // set the FSCM interrupt priority
    IPC8SET = 1 << 8; // set the FSCM interrupt subpriority
    IFS1CLR = 1 << 14; // clear the FSCM interrupt bit
    IEC1SET = 1 << 14; // enable the FSCM interrupt
  }

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
int err,error_counter;

     error_counter = 0;
     TCS3472_getRawData(RawData);
     err = abs(TCS3472_C2RGB_Error(RawData));
     
    do{
#ifdef LedDeBug
        sprintf(txtLed,"%d",err);
        PrintOut(PrintHandler, "\r\n"
                               " *err:=   %s\r\n"
                               ,txtLed);
#endif
      current_duty2 += err;
      PWM_Set_Duty(current_duty2, 2);
      Delay_ms(500);
      TCS3472_getRawData(RawData);
      err = TCS3472_C2RGB_Error(RawData);
    //  error_counter++;
    //  if(error_counter > 1000)
    //      break;
    }while(err < -150 || err > 150);

}