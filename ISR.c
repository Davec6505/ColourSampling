#include "Config.h"


void (*Get_Timer_Values)();
void (*Sim800Text)();

void USB1Interrupt() iv IVT_USB_1 ilevel 7 ics ICS_SRS{
  USB_Interrupt_Proc();
}

void InitISR(){
   Get_Timer_Values = &Get_Time;
   Sim800Text = &RcvSimTxt;
   EI();
}

void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_SRS {
  T1IF_bit         = 0;
  //Enter your code here
    Get_Timer_Values();
}

void Timer2_3Interrupt() iv IVT_TIMER_3 ilevel 7 ics ICS_SRS{
  T3IF_bit		 = 0;
  //Enter your code here
}

void PC_Uart1() iv IVT_UART_1 ilevel 6 ics ICS_AUTO {
int i,j;
    U1RXIF_bit = 0;
    i = 0;
    while (UART1_Data_Ready()) {  // If data is received
        rcvPcTxt[i] = U1RXREG;     //  rxPc = UART1_Read();   // read the received data
        i++;
    }
    rcvPcTxt[i] = 0;
    for(j= 0; j<i ;j++){
         U2TXREG =  rcvPcTxt[j];
         while(!TRMT_bit);
    }
}

void Sim800_Uart2() iv IVT_UART_2 ilevel 6 ics ICS_AUTO {

    U2RXIF_bit = 0;
    Sim800Text();
    
}