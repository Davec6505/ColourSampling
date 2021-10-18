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

void PC_Uart2() iv IVT_UART_2 ilevel 6 ics ICS_AUTO {
int i,j;

    U2RXIF_bit = 0;
    i = 0;
    while(UART2_Data_Ready()) {     // If data is received
       rcvSimTxt[i] = U2RXREG;
       i++;
    }
    rcvSimTxt[i] = 0;
    for(j= 0; j<i;j++){
         U1TXREG =  rcvSimTxt[j];
         while(!TRMT_bit);
    }
    if(SimVars.initial_str == 1)
       goto end;
       
    if((SimVars.initial_str == 0) && (i != 0))
         SimVars.initial_str = -1;    //in initialisation
    else if(SimVars.initial_str == -1)// && (i == 0))
         SimVars.initial_str = 1;     //initialised
         
end:
    return;
}