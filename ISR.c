#include "Config.h"

void (*Get_Timer_Values)();

void USB1Interrupt() iv IVT_USB_1 ilevel 7 ics ICS_SRS{
  USB_Interrupt_Proc();
}

void InitISR(){
   Get_Timer_Values = &Get_Time;
   EI();
}

void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_SRS {
  T1IF_bit         = 0;
  //Enter your code here
    Get_Timer_Values();
}