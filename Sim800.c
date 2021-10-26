#include "Sim800.h"

/******************************************************
*Flash memory region for Sim800 module
******************************************************/
unsigned long  FLASH_Settings_VAddr_Sim800 = 0x9D07A100;
unsigned long  FLASH_Settings_PAddr_Sim800 = 0x1D07A100;



/*****************************************************
*
*****************************************************/
sbit RTS at LATB1_bit;
sbit CTS at  RE9_bit;
sbit RST at LATB2_bit;
sbit PWR at LATG7_bit;     //LATD0_bit;
sbit STAT at RB4_bit;      //Status input


char rcvSimTxt[150];
char SimTestTxt[150];
char rcvPcTxt[150];

Sim800Vars SimVars = {
   0,
   9,
   0,
   0
};

struct RingBuffer RB;
struct Sim800Flash SF;
/*************************************************
*initialize the variables
*************************************************/
void InitGSM3(){
   SimVars.initial_str = 0;
   SimVars.init_inc    = 0;
   *SimTestTxt = "Hello World this is a test";
   RB.head = 0;
   RB.tail = 0;
   RB.rcv_txt_fin = -1;
   SF.SimFlashPtr = 0;
}

/*************************************************
*function pointe called from ISR Uart2
*************************************************/
void RcvSimTxt(){
unsigned char txt;
    while(UART2_Data_Ready()) {     // If data is received
       txt = U2RXREG;
       U1TXREG = txt;
       if(txt >= 0x20){
          RB.buff[RB.head] = txt;
          RB.head++;
       }else if(U2RXREG == 0x0A){
          RB.buff[RB.head] = ',';
          RB.head++;
       }
       if(RB.head > 999)
           RB.head = 0;             //rest head when buffer is full
       
    }
    RB.rcv_txt_fin = 1;
}

/*******************************************************
*keep trying until power up
*******************************************************/
void PwrUpGSM3(){
 RST = 0;
 PWR = 0;
 Delay_ms(1000);
 PWR = 1;
 
 while(STAT){
    LATE3_bit = !LATE3_bit;
     Delay_ms(100);
 }
 Delay_ms(5000);
}

/*******************************************************
*Setup GSM IOT by sending Initial SMS
*and waiting for responses from
*******************************************************/
char SetupIOT(){
int num_strs,res,i;
char txtA[6];
char* str_rcv;
////////////////////////////////////////////////////////
//check to see if network is registered AT+CREG? = 0,[1/5]
//1= home / 5 = Roaming network wait in a loop until reg

    res = -1;
    UART1_Write_Text("ATE0");
    UART1_Write(0x0D);
    UART1_Write(0x0A);
    
    RB.rcv_txt_fin = 0;
    RB.last_head = RB.head;
    do{
        LATE3_bit = !LATE3_bit;
        UART2_Write_Text("ATE0");
        UART2_Write(0x0D);
        UART2_Write(0x0A);
        Delay_ms(1000);
    }while(!RB.rcv_txt_fin);
    Delay_ms(4000);
    i=0;
    RB.tail = RB.last_tail++;
    if(RB.head > RB.last_head){
      while(RB.tail <= RB.head){
         SimTestTxt[i] = RB.buff[RB.tail];
         UART1_Write(SimTestTxt[i]);
         UART1_Write(0x3A);
         i++;
         RB.tail++;
         RB.tail = (RB.tail > 999)? 0: RB.tail;
      };
      SimTestTxt[i++] = 0;
    }
    RB.last_tail = RB.tail;
    
#ifdef SimConfDebug
     UART1_Write_Text("1st Result:= ");
     UART1_Write_Text(SimTestTxt);
     UART1_Write(0x0D);
     UART1_Write(0x0A);
     UART1_Write_Text("Check if Sim is Registered");
     UART1_Write(0x0D);
     UART1_Write(0x0A);
#endif
wait:

   RB.rcv_txt_fin   = 0;
   RB.last_head     = RB.head;
   do{
       LATE3_bit = !LATE3_bit;
       UART2_Write_Text("AT+CREG?");
       UART2_Write(0x0D);
       UART2_Write(0x0A);
       Delay_ms(500);
   }while(!RB.rcv_txt_fin);
   Delay_ms(5000);
   i=0;
   RB.tail = RB.last_tail++;
   if(RB.head > RB.last_head){
      while(RB.tail <= RB.head){
         SimTestTxt[i] = RB.buff[RB.tail];
         i++;
         RB.tail++;
         RB.tail = (RB.tail > 999)? 0: RB.tail;
      };
      SimTestTxt[i++] = 0;
   }
   RB.last_tail = RB.tail;
#ifdef SimConfDebug
      UART1_Write_Text("2n Result:= ");
      UART1_Write_Text(SimTestTxt);//string[0]);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
#endif
 // Delay_ms(5000);

  if(RB.head > RB.last_head){//(SimVars.num_of_sms_bytes > 0){
     str_rcv = setstr(SimTestTxt);
     num_strs = strsplit(str_rcv,',');

#ifdef SimConfDebug
      sprintf(txtA,"%d",num_strs);
      UART1_Write_Text("num_strs:= ");
      UART1_Write_Text(txtA);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
      UART1_Write_Text("string[0]");
      UART1_Write_Text(string[0]);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
       UART1_Write_Text("string[1]");
      UART1_Write_Text(string[1]);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
      UART1_Write_Text("string[2]");
      UART1_Write_Text(string[2]);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
#endif
     str_rcv = findnumber(string[1]);
     res = atoi(str_rcv);
   if(res == 1){
#ifdef SimConfDebug
     sprintf(txtA,"%d",res);
     UART1_Write_Text("Registered with:= ");
     UART1_Write_Text(txtA);
     UART1_Write(0x0D);
     UART1_Write(0x0A);
#endif

   }else{
#ifdef SimConfDebug
     UART1_Write_Text("Sim Not Registered");
     UART1_Write(0x0D);
     UART1_Write(0x0A);
#endif
     Delay_ms(500);
     goto wait;
   }
  }
#ifdef SimConfDebug
     UART1_Write_Text("Sim Registered");
     UART1_Write(0x0D);
     UART1_Write(0x0A);
#endif
  return 1;
}

/*******************************************************
*Once sim has been registered wait for incoming text to
*complete setup of the application an register the cell
*phone that the device need to talk to
*******************************************************/
char WaitForSetupSMS(){
int i,num_strs,res;
char* str_rcv;
char txtA[6];
char sms[4];
  //Set sms to text mode = 1
  UART2_Write_Text("AT+CMGF=1");
  UART2_Write(0x0D);
  UART2_Write(0x0A);

 //let OK inc pointers
  RB.rcv_txt_fin = 0;
  RB.last_head   = RB.head++;
  do{
     LATE3_bit = !LATE3_bit;
     Delay_ms(150);
  }while(!RB.rcv_txt_fin);
  i=0;
  RB.tail = RB.last_tail++;
  if(RB.head > RB.last_head){
     while(RB.tail <= RB.head){
         RB.tail = (RB.tail > 999)? 0: RB.tail;
         SimTestTxt[i] = RB.buff[RB.tail];
         RB.tail++;
         i++;
     };
     SimTestTxt[i++] = 0;
  }
   RB.last_tail = RB.tail;
  
  Delay_ms(1000);
  //wait for sms
  RB.rcv_txt_fin = 0;
  RB.last_head   = RB.head++;
  do{
     LATE3_bit = !LATE3_bit;
     Delay_ms(150);
  }while(!RB.rcv_txt_fin);
  Delay_ms(1000);
  
  i=0;
  RB.tail = RB.last_tail++;
  if(RB.head > RB.last_head){
     while(RB.tail <= RB.head){
         RB.tail = (RB.tail > 999)? 0: RB.tail;
         SimTestTxt[i] = RB.buff[RB.tail];
         RB.tail++;
         i++;
     };
     SimTestTxt[i++] = 0;
  }
   RB.last_tail = RB.tail;
     //clr_str_arrays(string);
     //str_rcv = setstr(SimTestTxt);
     num_strs = strsplit(SimTestTxt,',');

#ifdef SimConfDebug
      sprintf(txtA,"%d",num_strs);
      UART1_Write_Text("num_strs:= ");
      UART1_Write_Text(txtA);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
      UART1_Write_Text("string[0]");
      UART1_Write_Text(string[0]);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
      UART1_Write_Text("string[1]");
      UART1_Write_Text(string[1]);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
      UART1_Write_Text("string[2]");
      UART1_Write_Text(string[2]);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
      UART1_Write_Text("string[3]");
      UART1_Write_Text(string[3]);
      UART1_Write(0x0D);
      UART1_Write(0x0A);

#endif
   //get the phone number from a response;
     res = atoi(string[1]);
     sprintf(sms,"%d",res);
     UART1_Write_Text("res= ");
     UART1_Write_Text(sms);
  //wait for sms to register phone number

     UART2_Write_Text("AT+CMGR=");
     UART2_Write_Text(sms);
     UART2_Write(0x0D);
     UART2_Write(0x0A);

     RB.rcv_txt_fin = 0; //reset bit and wait for response
     RB.last_head   = RB.head;
  do{
     LATE3_bit = !LATE3_bit;
     Delay_ms(350);
  }while(!RB.rcv_txt_fin);
  Delay_ms(500);
  i=0;
  RB.tail = RB.last_tail;
  if(RB.head > RB.last_head){
     while(RB.tail <= RB.head){
         RB.tail = (RB.tail > 999)? 0: RB.tail;
         SimTestTxt[i] = RB.buff[RB.tail];
         RB.tail++;
         i++;
     };
     SimTestTxt[i++] = 0;
  }
   RB.last_tail = RB.tail++;
     str_rcv = setstr(SimTestTxt);
     num_strs = strsplit(str_rcv,',');
 #ifdef SimConfDebug
      sprintf(txtA,"%d",num_strs);
      UART1_Write_Text("num_strs:= ");
      UART1_Write_Text(txtA);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
      UART1_Write_Text("string[0]");
      UART1_Write_Text(string[0]);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
      UART1_Write_Text("string[1]");
      UART1_Write_Text(string[1]);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
      UART1_Write_Text("string[2]");
      UART1_Write_Text(string[2]);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
      UART1_Write_Text("string[3]");
      UART1_Write_Text(string[3]);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
      UART1_Write_Text("string[4]");
      UART1_Write_Text(string[4]);
      UART1_Write(0x0D);
      UART1_Write(0x0A);

#endif
//save cell number to flash buffer
  SF.SimFlashPtr = strlen(string[1])+1;
  memcpy(SF.SimFlashBuff,string[1],SF.SimFlashPtr);
  strncpy(SF.SimCelNum,string[1],strlen(string[1])+1);
  strncpy(SF.SimDate,string[3]+1,strlen(string[3]));
  strncpy(SF.SimTime,string[4],8);
  SF.SimFlashPtr++;


#ifdef SimConfDebug
    PrintOut(PrintHandler, "\r\n"
                           " * SF.SimCelNum: %s\r\n"
                           " * SF.SimDate: %s\r\n"
                           " * SF.SimTime: %s\r\n"
                           ,SF.SimCelNum,SF.SimDate,SF.SimTime);
#endif
  
//delete sms from sm
  Delay_ms(1000);
  UART2_Write_Text("AT+CMGD=");
  UART2_Write_Text(sms);
  UART2_Write(0x0D);
  UART2_Write(0x0A);

 //let OK inc pointers
  RB.rcv_txt_fin = 0;
  RB.last_head   = RB.head++;
  do{
     LATE3_bit = !LATE3_bit;
     Delay_ms(150);
  }while(!RB.rcv_txt_fin);
  i=0;
  RB.tail = RB.last_tail++;
  if(RB.head > RB.last_head){
     while(RB.tail <= RB.head){
         RB.tail = (RB.tail > 999)? 0: RB.tail;
         SimTestTxt[i] = RB.buff[RB.tail];
         RB.tail++;
         i++;
     };
     SimTestTxt[i++] = 0;
  }
   RB.last_tail = RB.tail;
  return 2;
}

/**********************************************************************
*Next phase of Sim setup
**********************************************************************/
char SendResponseSMS(){

   return 3;
}

/***********************************************************************
*test to update thingspeak at req interval
***********************************************************************/
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