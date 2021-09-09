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
          //LATA10_bit = !LATA10_bit;
      }
}