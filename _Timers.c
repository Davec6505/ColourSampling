#include "_Timers.h"


Timers TMR0 ={
  0,
  0,
  0,
  0,
  0
};

void InitTimer1(){
 char txt[6];
  T1CON         = 0x8010;
  T1IP0_bit     = 1;
  T1IP1_bit     = 1;
  T1IP2_bit     = 1;
  T1IF_bit      = 0;
  T1IE_bit      = 1;
  PR1           = 10000;
  TMR1          = 0;
  
/*TMR0.sec = 0;
  TMR0.min = 0;
  TMR0.hr  = 0;
  T0_SP.one_per_sec = 0;*/
}

//run time
void Get_Time(){
char txt[6];
int res;
      TMR0.millis++;
      TMR0.ms++;

       //every second
      if(TMR0.ms > 999){
          TMR0.ms = 0;
          TMR0.sec++;
          T0_SP.sec++;
          //every minute
          if(TMR0.sec > 59){
             T0_SP.sec = 0;
             TMR0.sec = 0;
             TMR0.min++;
             T0_SP.min++;
#ifdef TmrDebug
             sprintf(txt,"%u",T0_SP.min);
             UART1_Write_Text(txt);
             UART1_Write(0x0d);
             UART1_Write(0x0a);
#endif
             //every hour
             if(TMR0.min > 59){
                T0_SP.min = 0;
                TMR0.min = 0;
                TMR0.hr++;
                T0_SP.hr++;
                //every 24hr
                if(TMR0.hr > 23){
                   TMR0.hr = 0;
                   T0_SP.hr = 0;
                }
             }

          }
          T0_SP.one_per_sec = 1;
          LATA10_bit = !LATA10_bit;
      }
      

}



// define callback function
void I2C2_TimeoutCallback(char errorCode) {
int i;
   if (errorCode == _I2C_TIMEOUT_RD) {
     // do something if timeout is caused during read
     for(i = 0;i < 20;i++){
          LATE3_bit = !LATE3_bit;
          Delay_ms(100);
     }
   }

   if (errorCode == _I2C_TIMEOUT_WR) {
     // do something if timeout is caused during write
     for(i = 0;i < 20;i++){
          LATE3_bit = !LATE3_bit;
          Delay_ms(500);
     }
   }

   if (errorCode == _I2C_TIMEOUT_STOP) {
     // do something if timeout is caused during stop
   }

   if (errorCode == _I2C_TIMEOUT_START) {
     // do something if timeout is caused during start
   }

   if (errorCode == _I2C_TIMEOUT_REPEATED_START) {
     // do something if timeout is caused during start
   }

   if (errorCode == _I2C_TIMEOUT_INIT) {
     // do something if timeout is caused during initialization
   }

   if (errorCode == _I2C_TIMEOUT_INIT_ADVANCED) {
     // do something if timeout is caused during advanced initialization
   }

}