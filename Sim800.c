#include "Sim800.h"



sbit RTS at LATB1_bit;
sbit CTS at  RE9_bit;
sbit RST at LATB2_bit;
sbit PWR at LATG7_bit;     //LATD0_bit;
sbit STAT at RB4_bit;      //Status input


char rcvSimTxt[250];
char rcvPcTxt[150];

Sim800Vars SimVars = {
   0,
   9,
   0
};
///////////////////////////////////////
//initialize the variables
void InitGSM3(){
   SimVars.initial_str = 0;
}

////////////////////////////////////////
//keep trying until poer up
void PwrUpGSM3(){
 RST = 0;
start:
 PWR = 0;
 Delay_ms(1000);
 PWR = 1;
 
 while(STAT){
    LATE3_bit = !LATE3_bit;
     Delay_ms(100);
 }
 Delay_ms(5000);

 if(SimVars.initial_str == -1)
        goto start;
}

////////////////////////////////////////
//Setup GSM IOT by sending Initial SMS
//and waiting for responses from
char SetupIOT(){
static unsigned long last_millis;
int test,res;
char txt[6];
/*******************************************************
*check to see if network is registered AT+CREG? = 0,[1/5]
* 1= home / 5 = Roaming network wait in a loop until reg
*******************************************************/
#ifdef SimConfDebug
     UART1_Write_Text("Check if Sim is Registered");
     UART1_Write(0x0D);
     UART1_Write(0x0A);
#endif
wait:
   LATE3_bit = !LATE3_bit;
   UART2_Write_Text("AT+CREG?");
   UART2_Write(0x0D);
   UART2_Write(0x0A);
   T0_SP.sec = 0;
   SimVars.num_of_sms_bytes = 0;
   while(!SimVars.num_of_sms_bytes){
       if(TMR0.millis > last_millis){
           last_millis = TMR0.millis + 20000;
           test = 0;
           break;
       }
   }

#ifdef SimConfDebug
  UART2_Write_Text("string[1]");
  UART2_Write_Text(string[1]);
  UART2_Write(0x0D);
  UART2_Write(0x0A);
#endif
     test = strsplit(rcvSimTxt,',');
   if(test > 0){
     res = atoi(string[1]);
#ifdef SimConfDebug
     sprintf(txt,"u",res);
     UART1_Write_Text("Registered with:= ");
     UART1_Write_Text(txt);
     UART1_Write(0x0D);
     UART1_Write(0x0A);
#endif
   }
   else{
#ifdef SimConfDebug
     UART1_Write_Text("Sim Not Registered");
     UART1_Write(0x0D);
     UART1_Write(0x0A);
#endif

     goto wait;
   }
#ifdef SimConfDebug
     UART1_Write_Text("Sim Registered");
     UART1_Write(0x0D);
     UART1_Write(0x0A);
#endif

}

int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
char txtS[6];
char txtM[6];
char txtH[6];
static unsigned short sLast;
static unsigned short mLast;
static unsigned short hLast;

    if(s != sLast){
       sLast = s;
#ifdef SimDebug
       sprintf(txtS,"%u",s);
       UART1_Write_Text(txtS);
       UART1_Write(0x3A);
#endif
    }
    if(m != mLast){
       mLast = m;
#ifdef SimDebug
       sprintf(txtM,"%u",m);
       UART1_Write_Text(txtM);
       UART1_Write(0x3A);
#endif
    }
    if(h != hLast){
      hLast = h;
#ifdef SimDebug
      sprintf(txtH,"%u",h);
      UART1_Write_Text(txtH);
      UART1_Write(0x3A);
#endif
    }
    
    if(s == 1 &&
       m > SimVars.time_to_log){
       TCS3472_getRawData(RawData);
       SendData(RawData);
       return 2;
    }
    
    return -1;
}

void SendData(unsigned int* rgbc){
char txtC[15];
char txtR[15];
char txtG[15];
char txtB[15];

    sprintf(txtC,"%u",rgbc[0]);
    sprintf(txtR,"%u",rgbc[1]);
    sprintf(txtG,"%u",rgbc[2]);
    sprintf(txtB,"%u",rgbc[3]);
    
    UART2_Write_Text("AT+CPIN?");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(1000);
    UART2_Write_Text("AT+CREG?");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(1000);
    UART2_Write_Text("AT+CGATT?");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(1000);
    UART2_Write_Text("AT+CIPSHUT");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(3000);
    UART2_Write_Text("AT+CIPSTATUS");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(3000);
    UART2_Write_Text("AT+CIPMUX=0");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(1000);
    UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(3000);
    UART2_Write_Text("AT+CIICR");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(4000);
    UART2_Write_Text("AT+CIFSR");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(1000);
    UART2_Write_Text("AT+CIPSPRT=1");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(1000);
    UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(4000);
    UART2_Write_Text("AT+CIPSEND");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(1000);
    UART2_Write_Text("GET https://api.thingspeak.com/update?api_key=W2NO15EASX7P7CDK&field1=");
    UART2_Write_Text(txtC);
    UART2_Write_Text("&field2=");
    UART2_Write_Text(txtR);
    UART2_Write_Text("&field3=");
    UART2_Write_Text(txtG);
    UART2_Write_Text("&field4=");
    UART2_Write_Text(txtB);
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(5000);
    UART2_Write(0x1A);
    Delay_ms(500);
    UART2_Write_Text("AT+CIPSHUT");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
}

char SendSMS(char sms_type){
int res;
char txt[6];
    UART2_Write_Text("AT+CNMI=2,2,0,0,0");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(1000);
    UART2_Write_Text("AT+CMGF=1");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(1000);
    UART2_Write_Text("AT+CMGS=\"+447946455348\"");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(2000);
    switch(sms_type){
      case 0:
             UART2_Write_Text("Reply Start");
             break;
      case 1:
             UART2_Write_Text("Reply WebSite");
             break;
       case 2:
             UART2_Write_Text("Reply API Key");
             break;
    }
    UART2_Write(0x1A);

}