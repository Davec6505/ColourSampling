#include "Sim800.h"

/******************************************************
*Flash memory region for Sim800 module
*V =  Read Virtual address
*P =  Write Physical address
******************************************************/

const char str_api[] = "GET https://api.thingspeak.com/update?api_key=";
const char field1[]   = "&field1=";
const char field2[]   = "&field2=";
const char field3[]   = "&field3=";
const char field4[]   = "&field4=";
const char sms_test[] = "+CMTI";
const char sms_test1[] = "WRITE_RAW";
const char sms_test2[] = "READA";
const char sms_test3[] = "READA_SCL";
#ifdef SimConfDebug
 char a[6]; char b[6]; char c[6]; char d[6]; char e[6];
#endif
unsigned long temp[128];
struct sim_lengths SL ={
  0,0,0,0,0,0
};

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

char holding_buff[64];
char buff[200];
char *text;
char *str_rcv;
char *ptr;
char *str;
char sms[6];

char txtA[6];
char txtS[6];
char txtM[6];
char txtH[20];


char txtC[15];
char txtR[15];
char txtG[15];
char txtB[15];
char txtLen[6];

Sim800Vars SimVars = {
   "",
   0,
   9,
   0,
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
   SimVars.init_sms    = 0;
   *SimTestTxt = "Hello World this is a test";
   RB.head = 0;
   RB.tail = 0;
   RB.rcv_txt_fin = -1;
   SF.SimFlashPtr = 0;
   strcpy(SF.SimCelNum,"\"***************\"");
   strcpy(SF.WriteAPIKey,"\"****************\"");
   strcpy(SF.ReadAPIKey,"\"****************\"");
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

/*************************************************
*get the Sim800 values to and from flash memory
*************************************************/
void WriteToFlashTemp(){
unsigned long pos;
static int i,j;

  if(SL.l1 <= 0)
     GetStrLengths();

  memset(holding_buff,0,SL.l5+5);
  memcpy(holding_buff,SF.SimCelNum,SL.l1);
  memcpy(holding_buff+SL.l1+1,SF.WriteAPIKey,SL.l2);
  memcpy(holding_buff+SL.l3+1,SF.ReadAPIKey,SL.l4);
  memcpy(temp,holding_buff,SL.l5+3);

  pos = FLASH_Settings_PAddr;
  j = NVMErasePage(pos);
  if(j==0){
    pos += 16 ;
    for(i=0;i<SL.l4;i++){
         j = NVMWriteWord(pos,temp[i]);
         pos += 4;
         Delay_ms(5);
    }
   }
   // j = NVMWriteRow(pos,&temp);
     sprintf(c,"%d",j);
#ifdef SimConfDebug
      PrintOut(PrintHandler, "\r\n"
                             " * flash write *\r\n"
                             " * flash err: %s\r\n"
                             ,c);
#endif
}

char* GetValuesFromFlash(){
unsigned long i,j;



   if(SL.l1 <= 0)
      GetStrLengths();

   ptr = (unsigned char*)FLASH_Settings_VAddr;
   ptr += 16;

   for(i=0;i<SL.l5;i++){
       buff[i] = ptr[i];
#ifdef SimConfDebug
       UART1_Write(buff[i]);
       UART1_Write(0x3A);
#endif
   }
   strncpy(SF.SimCelNum,buff,SL.l1);
   strncpy(SF.WriteAPIKey,buff+SL.l1+1,SL.l2);
   strncpy(SF.ReadAPIKey,buff+SL.l3+1,SL.l4);

#ifdef SimConfDebug
      PrintOut(PrintHandler, " * Flash Read        \r\n"
                             " * SF.SimCelNum:   %s\r\n"
                             " * SF.WriteAPIKey: %s\r\n"
                             " * SF.ReadAPIKey:  %s\r\n"
                             ,SF.SimCelNum,SF.WriteAPIKey,SF.ReadAPIKey);
#endif
  return SF.SimCelNum;
}

void GetStrLengths(){
  SL.l1 = strlen(SF.SimCelNum)+1;   //len of cell num
  SL.l2 = strlen(SF.WriteAPIKey)+1; //len of API Write key
  SL.l3 = SL.l1 + SL.l2;            //len Cell + API Wr k
  SL.l4 = strlen(SF.ReadAPIKey)+1;  //len of API Read Key
  SL.l5 = SL.l1 + SL.l2 + SL.l4;             //total length
  SL.mod = SL.l5 % 4;
  SL.l5 += SL.mod;
 #ifdef SimConfDebug
  sprintf(a,"%d",SL.l1);
  sprintf(b,"%d",SL.l2);
  sprintf(c,"%d",SL.l3);
  sprintf(d,"%d",SL.l4);
  sprintf(e,"%d",SL.l5);
  PrintOut(PrintHandler, "\r\n"
                         " * l1: %s\r\n"
                         " * l2: %s\r\n"
                         " * l3: %s\r\n"
                         " * l4: %s\r\n"
                         " * l5: %s\r\n"
                         ,a,b,c,d,e);
#endif
}

/*************************************************
*function pointer called from ISR Uart2
*************************************************/
void RcvSimTxt(){
char txt;
    while(UART2_Data_Ready()) {     // If data is received
      if (U2STAbits.FERR || U2STAbits.OERR){
          if (U2STAbits.FERR ){
              U2STAbits.FERR = 0;
              goto m0;
          }
          if(U2STAbits.OERR)
              U2STAbits.OERR = 0;
      }
 m0:
       txt = U2RXREG;
       U1TXREG = txt;
       if(txt >= 0x20){
          RB.buff[RB.head] = txt;
          RB.head++;
       }else if(U2RXREG == 0x0A){
          RB.buff[RB.head] = ',';
          RB.head++;
       }
       if(RB.head > 999){
           RB.head = 0;             //rest head when buffer is full
       }
    }
    RB.rcv_txt_fin = 1;
}

/******************************************************
* Check ring buffer pointers for recieved data
******************************************************/
int TestRingPointers(){
int diff;
     if(RB.tail > RB.head){
        diff = 1000 - RB.tail;
        diff += RB.head;
     }else{
        diff = RB.head - RB.tail;
     }
     return diff;
}

/*******************************************************
*wait for a response from Sim800
*******************************************************/
void WaitForResponse(short dly){
unsigned long lastMillis,newMillis;
   lastMillis = TMR0.millis;
   RB.rcv_txt_fin   = 0;
   RB.last_head     = RB.head;
   do{
     LATE3_bit = !LATE3_bit;
     if(dly == 0)
      Delay_ms(100);
     else if(dly == 1)
      Delay_ms(500);
     else if(dly == 3){
      UART2_Write_Text("ATE0");
      UART2_Write(0x0D);
      UART2_Write(0x0A);
      Delay_ms(2000);
     }
     else
      Delay_ms(1000);

      //break if no reply
      newMillis = TMR0.millis - lastMillis;
      if(newMillis > 25000)
           break;
   }while(!RB.rcv_txt_fin);
}

/******************************************************
*Move new data from ring buffer to temp buffer
******************************************************/
void RingToTempBuf(){
int i;
    i=0;
    RB.tail = RB.last_tail;
   // if(RB.head > RB.last_head){
      while(RB.tail != RB.head){
         SimTestTxt[i] = RB.buff[RB.tail];
#ifdef RingBuffDeBug
         UART1_Write(SimTestTxt[i]);
         UART1_Write(0x3A);
#endif
         i++;
         RB.tail++;
         if(RB.tail > 999)
            RB.tail = 0;
      };
      SimTestTxt[i++] = 0;
   // }
    RB.last_tail = RB.tail;
}

/*******************************************************
*Setup GSM IOT by sending Initial SMS
*and waiting for responses from
*******************************************************/
char SetupIOT(){
int res,i,num_strs;

/*******************************************************
*check to see if network is registered AT+CREG? = 0,[1/5]
*1= home / 5 = Roaming network wait in a loop until reg
*******************************************************/
    res = -1;
#ifdef SimConfDebug
  PrintOut(PrintHandler, "\r\n"
                         " * ATE0\r\n");
#endif
    //ATE0 at startup
    WaitForResponse(3);
    Delay_ms(4000);
    RingToTempBuf();

#ifdef SimConfDebug
  PrintOut(PrintHandler, "\r\n"
                         " * %s\r\n"
                         " * Check if Sim is Registered\r\n"
                         ,SimTestTxt);
#endif
wait:

   UART2_Write_Text("AT+CREG?");
   UART2_Write(0x0D);
   UART2_Write(0x0A);
   WaitForResponse(1);
   Delay_ms(5000);
   RingToTempBuf();

#ifdef SimConfDebug
      PrintOut(PrintHandler, "\r\n"
                             " * %s\r\n"
                            ,SimTestTxt);
#endif
 // Delay_ms(5000);

  if(RB.head > RB.last_head){
     str_rcv = setstr(SimTestTxt);
     num_strs = strsplit(str_rcv,',');

#ifdef SimConfDebug
     sprintf(txtA,"%d",num_strs);
     PrintOut(PrintHandler, "\r\n"
                            " *num_strs:= %s\r\n"
                            " *string[0]  %s\r\n"
                            " *string[1]  %s\r\n"
                            " *string[2]  %s\r\n"
                            " *string[3]  %s\r\n"
                            " *string[4]  %s\r\n"
                            ,txtA,string[0],string[1],string[2],string[3],string[4]);
#endif
     str_rcv = findnumber(string[1]);
     res = atoi(str_rcv);  //get the sms rec number
   if(res == 1){
#ifdef SimConfDebug
     sprintf(txtA,"%d",res);
     PrintOut(PrintHandler, "\r\n"
                            " *Registered with:= %s\r\n"
                           ,txtA);
#endif

   }else{
#ifdef SimConfDebug
     PrintOut(PrintHandler, "\r\n"
                            " *Sim Not Registered\r\n");
#endif
     Delay_ms(500);
     goto wait;
   }
  }
#ifdef SimConfDebug
     PrintOut(PrintHandler, "\r\n"
                            " *Sim Registered\r\n");
#endif


  return 1;
}

/*******************************************************
*Once sim has been registered wait for incoming text to
*complete setup of the application an register the cell
*phone that the device need to talk to
*******************************************************/
char WaitForSetupSMS(unsigned int Indx){
int i,res,num_strs;


  //Set sms to text mode = 1
  UART2_Write_Text("AT+CMGF=1");
  UART2_Write(0x0D);
  UART2_Write(0x0A);

 //let OK inc pointers
  WaitForResponse(0);
  RingToTempBuf();

  Delay_ms(1000);
  //wait for sms
  WaitForResponse(0);
  Delay_ms(1000);
  RingToTempBuf();

  num_strs = strsplit(SimTestTxt,',');

#ifdef SimConfDebug
     sprintf(txtA,"%d",num_strs);
     sprintf(txtA,"%d",num_strs);
     PrintOut(PrintHandler, "\r\n"
                           " *num_strs:= %s\r\n"
                           " *string[0]  %s\r\n"
                           " *string[1]  %s\r\n"
                           " *string[2]  %s\r\n"
                           " *string[3]  %s\r\n"
                           " *string[4]  %s\r\n"
                           " *string[5]  %s\r\n"
                           ,txtA,string[0],string[1],
                           string[2],string[3],
                           string[4],string[5]);
#endif
   //get the  number of sms;
    res = atoi(string[1]);
    sprintf(sms,"%d",res);
 #ifdef SimConfDebug
    PrintOut(PrintHandler, "\r\n"
                           " *sms no:= %s\r\n"
                           ,sms);
 #endif
  //wait for sms to register phone number

    UART2_Write_Text("AT+CMGR=");
    UART2_Write_Text(sms);
    UART2_Write(0x0D);
    UART2_Write(0x0A);

    WaitForResponse(1);
    Delay_ms(1000);
    RingToTempBuf();
    str_rcv = setstr(SimTestTxt);
    num_strs = strsplit(str_rcv,',');
 #ifdef SimConfDebug
    sprintf(txtA,"%d",num_strs);
    PrintOut(PrintHandler, "\r\n"
                           " *num_strs:= %s\r\n"
                           " *string[0]  %s\r\n"
                           " *string[1]  %s\r\n"
                           " *string[2]  %s\r\n"
                           " *string[3]  %s\r\n"
                           " *string[4]  %s\r\n"
                           " *string[5]  %s\r\n"
                           " *string[6]  %s\r\n"
                           ,txtA,string[0],string[1],
                           string[2],string[3],
                           string[4],string[5],
                           string[6]);
#endif
//save cell number to flash buffer
    if(Indx == 0){
        SF.SimFlashPtr = strlen(string[1])+1;
        SF.SimFlashCellByteCount = SF.SimFlashPtr;
        memcpy(SF.SimFlashBuff,string[1],SF.SimFlashPtr);
        strncpy(SF.SimCelNum,string[1],strlen(string[1])+1);
        strncpy(SF.SimDate,string[3],strlen(string[3]));
        strncpy(SF.SimTime,string[4],8);

#ifdef SimConfDebug
      PrintOut(PrintHandler, "\r\n"
                             " * SF.SimCelNum: %s\r\n"
                             " * SF.SimDate: %s\r\n"
                             " * SF.SimTime: %s\r\n"
                             ,SF.SimCelNum,SF.SimDate,SF.SimTime);
#endif
    }else if(Indx == 1){
    //write API keys to Flash buff first
      SF.SimFlashAPIWriteIndx = SF.SimFlashPtr;
      SF.SimFlashAPIWriteCount = strlen(string[5])+1;
      memcpy(SF.SimFlashBuff+SF.SimFlashPtr,string[5],strlen(string[5])+1);
      strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);
      SF.SimFlashPtr += strlen(string[5])+1;

    //read API keys to Flash buff first
      SF.SimFlashAPIReadIndx = SF.SimFlashPtr;
      memcpy(SF.SimFlashBuff+SF.SimFlashPtr,string[6],strlen(string[6]));
      strncpy(SF.ReadAPIKey,string[6],strlen(string[6])+1);
      SF.SimFlashPtr += strlen(string[6])+1;
      SF.SimFlashAPIReadCount = strlen(string[6])+1;
#ifdef SimConfDebug
      PrintOut(PrintHandler, "\r\n"
                             " * SF.WriteAPIKey: %s\r\n"
                             " * SF.ReadAPIKey:  %s\r\n"
                             ,SF.WriteAPIKey,SF.ReadAPIKey);

      //print out the flash buffer to check locations
      for(i=0;i<SF.SimFlashPtr;i++){
         UART1_Write(SF.SimFlashBuff[i]);
         UART1_Write(0x3A);
      }
      UART1_Write(0x0D);
      UART1_Write(0x0A);
#endif
    }

//delete sms from sm
    Delay_ms(500);
    RemoveSMSText(res);
    str_rcv = setstr(SimTestTxt);
    res     = strcmp(str_rcv,"OK,");
    sprintf(txtA,"%d",res);
#ifdef SimConfDebug
    PrintOut(PrintHandler, "\r\n"
                           " * SimTestTxt: %s\r\n"
                           " * str_rcv: %s\r\n"
                           " * OK-0: %s\r\n"
                           ,SimTestTxt,str_rcv,txtA);
#endif
   if((res == 0)&&(Indx == 1)){
      WriteToFlashTemp();
      return 3;
   }
   else if ((res == 0)&&(Indx == 0))
       return 2;
   else
       return res;
}


/**********************************************************************
*
**********************************************************************/
void AT_Initial(){
    //Set sms delivery option to deliver index
    //2=buffer,1=deliver index,0=?,0=?,0=?
    UART2_Write_Text("AT&W+CNMI=2,1,0,0,0");
    UART2_Write(0x0D);
    UART2_Write(0x0A);

   //let OK inc pointers
    WaitForResponse(0);
    Delay_ms(1000);
    RingToTempBuf();
}

/**********************************************************************
*Ask for the API key and wait for it
**********************************************************************/
char GetAPI_Key_SMS(){
int i;

char response;
  //set up a send sms
  UART2_Write_Text("AT+CMGS=");
  UART2_Write_Text(SF.SimCelNum);
  UART2_Write(0x0D);
  UART2_Write(0x0A);

  //let '>' inc pointers
  WaitForResponse(0);
  RingToTempBuf();
  Delay_ms(500);
#ifdef SimConfDebug
    PrintOut(PrintHandler, "\r\n"
                           " * %s\r\n"
                           ,SimTestTxt);
#endif
  //one the '>' has been recieved send msg and wait the response
  UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
  UART2_Write(0x0D);
  UART2_Write(0x0A);
  UART2_Write(0x1A);
  //index 1 is to save to cell no and api to flash
  response = WaitForSetupSMS(1);

  return response;
}

/**********************************************************************
* Send SMS
***********************************************************************/
char SendSMS(char sms_type){
static short onecA;
int res;
char b[64];

    if(!onecA){
      onecA = 1;
      AT_Initial();
    }
    UART2_Write_Text("AT+CMGF=1");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(1000);
    UART2_Write_Text("AT+CMGS=");
    UART2_Write_Text(SF.SimCelNum);
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(2000);
    switch(sms_type){
      case 0:
             UART2_Write_Text("ERROR in setup Power down and start again!");
             break;
      case 1:
             UART2_Write_Text("Reply WebSite");
             break;
      case 2:
             UART2_Write_Text("Reply API Key");
             break;
      case 3:
             UART2_Write_Text("Setup Complete!");
             break;
      case 4:
             UART2_Write_Text("Device Powered up!");
             break;
      case 5:
             UART2_Write_Text("SMS Not recieved!");
             break;
      case 6:
             str = Read_Thresholds();
             strncpy(b,str,strlen(str));
             UART2_Write_Text(b);
             break;
      case 7:
             str = Read_Send_AllColour(0);
             strncpy(b,str,strlen(str));
             UART2_Write_Text(b);
             break;
      case 8:
             str = Read_Send_AllColour(1);
             strncpy(b,str,strlen(str));
             UART2_Write_Text(b);
             break;
      default:
             UART2_Write_Text("Error Power cycle the device!");
             break;
    }
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    UART2_Write(0x1A);
    Delay_ms(5000);

}

/***********************************************************************
*Get SMS if recieved during run
***********************************************************************/
char* GetSMSText(){

int num_strs,res,err;
    UART1_Write_Text("=================\r\n");
    RingToTempBuf();

  //ask sim800 for the sms text
    str_rcv = setstr(SimTestTxt);
    num_strs = strsplit(str_rcv,',');
    //test if an sms was recieved
    err = strncmp(sms_test,string[0],4);
 #ifdef SMSDebug
    sprintf(txtA,"%d",num_strs);
    sprintf(txtB,"%d",err);
    PrintOut(PrintHandler, "\r\n"
                           " *num_strs:= %s\r\n"
                           " *err     := %s\r\n"
                           " *string[0]  %s\r\n"
                           " *string[1]  %s\r\n"
                           " *string[2]  %s\r\n"
                           " *string[3]  %s\r\n"
                           " *string[4]  %s\r\n"
                           " *string[5]  %s\r\n"
                           " *string[6]  %s\r\n"
                           ,txtA,txtB,string[0],
                           string[1],string[2],
                           string[3],string[4],
                           string[5],string[6]);
#endif

   if(!err){
   unsigned int is_digit;
       is_digit = isdigit(*string[1]);
       if(is_digit == 1){
         res = atoi(string[1]);
#ifdef SMSDebug
     sprintf(sms,"%d",res);
     PrintOut(PrintHandler, "\r\n"
                           " *no of sms's:= %s\r\n"
                           ,sms);
#endif
         ReadMSG(res);
       }else{
         SendSMS(5);
         res = 1;
       }
       RemoveSMSText(res);
   }


}

/**********************************************************************
*read the msg that was recieved from the sim memory
*[sim can only store 20 messages ]
**********************************************************************/
char* ReadMSG(int msg_num){
int i,num_strs,res;

    sprintf(sms,"%d",msg_num);
    Delay_ms(1000);
#ifdef SMSDebug
     PrintOut(PrintHandler, "\r\n"
                           " *num_sms's:= %s\r\n"
                           ,sms);
#endif

    UART2_Write_Text("AT+CMGF=1");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    WaitForResponse(1);
    RingToTempBuf();
    Delay_ms(1000);


    UART2_Write_Text("AT+CMGR=");
    UART2_Write_Text(sms);
    UART2_Write(0x0D);
    UART2_Write(0x0A);

    WaitForResponse(1);
    RingToTempBuf();
    Delay_ms(1000);

#ifdef SMSDebug
     PrintOut(PrintHandler, "\r\n"
                           "************** \r\n");
#endif

    str_rcv = setstr(SimTestTxt);
    num_strs = strsplit(str_rcv,',');
    text = strchr(string[4], '"');
    strcpy(string[3], RemoveChars(string[3],'"',0x0A));
    strcpy(string[4], RemoveChars(string[4],0x02,'+'));
    strcpy(string[5], RemoveChars(text,'"','O'));

 #ifdef SMSDebug
    sprintf(sms,"%d",num_strs);
    PrintOut(PrintHandler, "\r\n"
                           " *num_strs:= %s\r\n"
                           " *string[0]  %s\r\n"
                           " *string[1]  %s\r\n"
                           " *string[2]  %s\r\n"
                           " *string[3]  %s\r\n"
                           " *string[4]  %s\r\n"
                           " *string[5]  %s\r\n"
                           ,sms,string[0],string[1],
                           string[2],string[3],
                           string[4],string[5]);
#endif
        if(string[5] != NULL){
          res = StrChecker(string[5]);
            TestRecievedSMS(res);
        }

}

/**********************************************************************
* test the recieved sms for reaction
**********************************************************************/
void TestRecievedSMS(int res){
char *t,B[64];

#ifdef SMSDebug
            // strncat(b,t,strlen(t));
     sprintf(B,"%d",res);
     PrintOut(PrintHandler, "\r\n"
                            " *CRGB:= %s\r\n"
                               ,B);
#endif

    switch(res){
      case 6:
             SendSMS(7);
             break;
      case 13:
             SendSMS(8);
             break;
      case 14:
             SendSMS(6);
             break;
      case 16:
            GetValuesFromFlash();
            NVMErasePage(FLASH_Settings_PAddr);

               //t =  Read_Send_AllColour(0);
               WriteToFlashTemp();
               t =  Write_Thresholds(0);
#ifdef SMSDebug
               strncat(b,t,strlen(t));
               PrintOut(PrintHandler, "\r\n"
                               " *CRGB:= %s\r\n"
                               ,t);
#endif
                SendSMS(6);
            break;
      default:
            break;
    }

}


/**********************************************************************
* remove sms from sim800
**********************************************************************/
int RemoveSMSText(int sms_cnt){

#ifdef SMSDebug
     sprintf(sms,"%d",sms_cnt);
     PrintOut(PrintHandler, "\r\n"
                           " *num_strs:= %s\r\n"
                           ,sms);
#endif
    do{
      sprintf(sms,"%d",sms_cnt);
      UART2_Write_Text("AT+CMGD=");
      UART2_Write_Text(sms);
      UART2_Write(0x0D);
      UART2_Write(0x0A);

   //let OK inc pointers
      WaitForResponse(1);
      Delay_ms(1000);
      RingToTempBuf();
      sms_cnt--;
    }while(sms_cnt > 0);
    
    return sms_cnt;
}

/***********************************************************************
*TCP connection
*test to update thingspeak at req interval
***********************************************************************/
int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
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

/****************************************************
*Send the data to thingspeak
****************************************************/
void SendData(unsigned int* rgbc){
int len;

    //get the colour valuse prior to sending to ThingSpek
    sprintf(txtC,"%u",rgbc[0]);
    sprintf(txtR,"%u",rgbc[1]);
    sprintf(txtG,"%u",rgbc[2]);
    sprintf(txtB,"%u",rgbc[3]);
    
    //allocate memory for string
    str = (char*)Malloc(200*sizeof(char));
    //ensure 1st byte is a null terminating value
    *str  = 0;
    //build string
    strcat(str,str_api);
    strcat(str,SF.WriteAPIKey);
    strcat(str,field1);
    strcat(str,txtC);
    strcat(str,field2);
    strcat(str,txtR);
    strcat(str,field3);
    strcat(str,txtG);
    strcat(str,field4);
    strcat(str,txtB);
    
    //start the send sequence
    UART2_Write_Text("AT+CPIN?");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    TestForOK(0);
    Delay_ms(50);
    UART2_Write_Text("AT+CREG?");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    TestForOK(0);
    Delay_ms(50);
    UART2_Write_Text("AT+CGATT?");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    TestForOK(0);
    Delay_ms(50);
    UART2_Write_Text("AT+CIPSHUT");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    TestForOK(0);
    Delay_ms(50);
    UART2_Write_Text("AT+CIPSTATUS");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    TestForOK(0);
    Delay_ms(50);
    UART2_Write_Text("AT+CIPMUX=0");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    TestForOK(0);
    Delay_ms(50);
    UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    TestForOK(0);
    Delay_ms(50);
    UART2_Write_Text("AT+CIICR");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    TestForOK(0);
    UART2_Write_Text("AT+CIFSR");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(1000);
    UART2_Write_Text("AT+CIPSPRT=1");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    TestForOK(0);
    Delay_ms(50);
    UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    TestForOK(0);
    Delay_ms(1000);
    UART2_Write_Text("AT+CIPSEND");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(1000);
    UART2_Write_Text(str);
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    UART2_Write(0x1A);
    TestForOK(1);
    Delay_ms(50);
    UART2_Write_Text("AT+CIPSHUT");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    TestForOK(0);
    Delay_ms(50);
    
    Free(str,150*sizeof(char*));
}

/**************************************************************
*General functions to test Sim800 responses
*this function test for "OK"
**************************************************************/
void TestForOK(char c){
unsigned long lastMillis,newMillis;
    WaitForResponse(1);
    Delay_ms(100);
    RingToTempBuf();
#ifdef SimConfDebug
    PrintOut(PrintHandler, "\r\n"
                           " * %s\r\n"
                           ,SimTestTxt);
#endif
    lastMillis = TMR0.millis;
    if(c == 0)
        while(!strstr(SimTestTxt, "OK")){
          newMillis = TMR0.millis - lastMillis;
          if(newMillis > 5000)
              break;
        }
    else if(c == 1)
        while(!strstr(SimTestTxt, "CONNECT")){
           newMillis = TMR0.millis - lastMillis;
           if(newMillis > 5000)
              break;
        }
}