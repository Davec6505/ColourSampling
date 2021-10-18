#line 1 "C:/Users/Git/ColourSampling/Sim800.c"
#line 1 "c:/users/git/coloursampling/sim800.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 11 "c:/users/git/coloursampling/sim800.h"
extern sfr sbit RTS;
extern sfr sbit CRS;
extern sfr sbit RST;
extern sfr sbit PWR;
extern sfr sbit STAT;






extern char rcvSimTxt[50];
extern char rcvPcTxt[50];




typedef struct{
int initial_str;
}Sim800Vars;

extern Sim800Vars SimVars;


void InitGSM3();
void PwrUpGSM3();
void SendData();
#line 4 "C:/Users/Git/ColourSampling/Sim800.c"
sbit RTS at LATB1_bit;
sbit CTS at RE9_bit;
sbit RST at LATB2_bit;
sbit PWR at LATG7_bit;
sbit STAT at RB4_bit;

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
