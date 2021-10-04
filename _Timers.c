#include "_Timers.h"

Timers TMR0;
void InitTimer1(){

  T1CON         = 0x8010;
  T1IP0_bit         = 1;
  T1IP1_bit         = 1;
  T1IP2_bit         = 1;
  T1IF_bit         = 0;
  T1IE_bit         = 1;
  PR1                 = 10000;
  TMR1                 = 0;
}

void Get_Time(){
      TMR0.ms++;
      if(TMR0.ms > 999){
          TMR0.ms = 0;
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