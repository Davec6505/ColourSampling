#include "Sim800.h"


sbit RTS at LATB1_bit;
sbit CTS at  RE9_bit;
sbit RST at LATB2_bit;
sbit PWR at LATG7_bit;     //LATD0_bit;
sbit STAT at RB4_bit;      //Status input

Sim800Vars SimVars;
char rcvSimTxt[50];
char rcvPcTxt[50];


void InitGSM3(){
   SimVars.initial_str = 0;
}

void PwrUpGSM3(){
 RST = 0;
start:
 PWR = 0;
 Delay_ms(1000);
 PWR = 1;
 
 Delay_ms(5000);

 if(SimVars.initial_str == -1)
        goto start;
}

void SendData(){

    UART2_Write_Text("AT+CPIN?");
}