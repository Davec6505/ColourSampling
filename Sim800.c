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

#ifdef SimConfDebug
 char a[6], b[6], c[6], d[6], e[6], f[6];
#endif



/*****************************************************
*  buffers for flash write char to dbl-word
*****************************************************/

char buff[512];
unsigned long temp[128];

/****************************************************
* string buffers for conditioning in and out strings
****************************************************/
char rcvSimTxt[200];
char SimTestTxt[200];
char rcvPcTxt[200];
char sms[6];

/***********************************************
* buffers to write for Debugging
***********************************************/
char txtA[6];
char txtS[6];
char txtM[6];
char txtH[20];

/************************************************
* bufers for Colour sampling and logging
************************************************/
char txtC[15];
char txtR[15];
char txtG[15];
char txtB[15];
char txtLen[6];

Sim800Vars SimVars = {
   0,
   0, //setup sequence
   0  //Start / Stop
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
   memset(SF.SimCelNum,0,sizeof(SF.SimCelNum));
   memset(SF.StartCell,0,sizeof(SF.StartCell));
   memset(SF.WriteAPIKey,0,sizeof(SF.WriteAPIKey));
   memset(SF.ReadAPIKey,0,sizeof(SF.ReadAPIKey));
   memset(SF.APN,0,sizeof(SF.APN));
   memset(SF.PWD,0,sizeof(SF.PWD));
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
*write the Sim800 values to flash memory
*************************************************/
void WriteToFlashTemp(){
unsigned long pos;
static int i,j;

  GetStrLengths();

  memset(buff,0,512);                  //make every byte NULL
  memcpy(buff,SF.SimCelNum,SL.l1);          //Save Cell num
  memcpy(buff+SL.l1,SF.WriteAPIKey,SL.l2);//Save API Wr Key
  memcpy(buff+SL.l1l2,SF.ReadAPIKey,SL.l3); //Save API Rd Key
  memcpy(buff+SL.l1l2l3,SF.APN,SL.l4);        //Save APN
  memcpy(buff+SL.l1l2l3l4,SF.PWD,SL.l5);        //Save PWD
  
  memcpy(temp,buff,SL.lTotA+4);

  pos = FLASH_Settings_PAddr;
  j = NVMErasePage(pos);
  if(j==0){
    pos += 20 ;
    for(i=0;i<100;i++){
         j = NVMWriteWord(pos,temp[i]);
         pos += 4;
         Delay_ms(5);
    }
   }
   // j = NVMWriteRow(pos,&temp);

#ifdef SimConfDebug
      sprintf(a,"%d",i);
      sprintf(b,"%d",j);
      PrintOut(PrintHandler, "\r\n"
                             " * flash write: %s*\r\n"
                             " * flash err:   %s\r\n"
                             ,a,b);
#endif
}

/*************************************************
*read values to flash memory
*************************************************/
char* GetValuesFromFlash(){
unsigned long i,j;
char *ptr;
   GetStrLengths();
   ptr = (unsigned char*)FLASH_Settings_VAddr;
   ptr += 20;

   for(i=0;i<SL.lTotA;i++){
       buff[i] = ptr[i];
#ifdef SimConfDebug
       UART1_Write(buff[i]);
       UART1_Write(0x3A);
#endif
   }
   strncpy(SF.SimCelNum,buff,SL.l1);
   strncpy(SF.WriteAPIKey,buff+SL.l1,SL.l2);
   strncpy(SF.ReadAPIKey,buff+SL.l1l2,SL.l3);
   strncpy(SF.APN,buff+SL.l1l2l3,SL.l4);
   strncpy(SF.PWD,buff+SL.l1l2l3l4,SL.l5);
#ifdef SimConfDebug
      PrintOut(PrintHandler, " * Flash Read        \r\n"
                             " * SF.SimCelNum:   %s\r\n"
                             " * SF.WriteAPIKey: %s\r\n"
                             " * SF.ReadAPIKey:  %s\r\n"
                             " * SF.APN:         %s\r\n"
                             " * SF.PWD:         %s\r\n"
                             ,SF.SimCelNum,SF.WriteAPIKey
                             ,SF.ReadAPIKey,SF.APN,SF.PWD);
#endif
  return SF.SimCelNum;
}

/*************************************************
*get the string lengths for flash memory offsets
*************************************************/
void GetStrLengths(){

  SL.l1 = sizeof(SF.SimCelNum)-1;   //len of cell num
  SL.l2 = sizeof(SF.WriteAPIKey)-1; //len of API Write key
  SL.l3 = sizeof(SF.ReadAPIKey)-1;  //len of API Read Key
  SL.l4 = sizeof(SF.APN)-1;         //len of APN
  SL.l5 = sizeof(SF.PWD)-1;         //len of PWD
  
  //len Cell + API Wr + API rd + APN + PWD
  SL.lTotA     = SL.l1 + SL.l2 + SL.l3 + SL.l4 + SL.l5;
  SL.l1l2      = SL.l1 + SL.l2;
  SL.l1l2l3    = SL.l1l2 + SL.l3;
  SL.l1l2l3l4  = SL.l1l2l3 + SL.l4;
  
  SL.mod = SL.lTotA % 4;  //total divisable by 4 = flash Wrd size
  SL.mod = 4 - SL.mod;
  SL.lTotA += SL.mod;
  
#ifdef SimConfDebug
  sprintf(a,"%d",SL.l1);
  sprintf(b,"%d",SL.l2);
  sprintf(c,"%d",SL.l3);
  sprintf(d,"%d",SL.l4);
  sprintf(e,"%d",SL.l5);
  sprintf(f,"%d",SL.lTotA);
  PrintOut(PrintHandler, "\r\n"
                         " * l1: %s\r\n"
                         " * l2: %s\r\n"
                         " * l3: %s\r\n"
                         " * l4: %s\r\n"
                         " * l5: %s\r\n"
                         " * lTotA: %s\r\n"
                         ,a,b,c,d,e,f);
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
      if(newMillis > 59000)
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
char *str_rcv;
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
  
     num_strs = strsplit(SimTestTxt,',');

#ifdef SimConfDebug
     sprintf(txtA,"%d",num_strs);
     PrintOut(PrintHandler, "\r\n"
                            " *num_strs:= %s\r\n"
                            " *string[0]  %s\r\n"
                            " *string[1]  %s\r\n"
                            " *string[2]  %s\r\n"
                            " *string[3]  %s\r\n"
                            " *string[4]  %s\r\n"
                            ,txtA,string[0]
                            ,string[1],string[2]
                            ,string[3],string[4]);
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
    num_strs = strsplit(SimTestTxt,',');
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
                           " *string[7]  %s\r\n"
                           " *string[8]  %s\r\n"
                           ,txtA,string[0],string[1]
                           ,string[2],string[3]
                           ,string[4],string[5]
                           ,string[6],string[7]
                           ,string[8]);
#endif
//save cell number to flash buffer
    if(Indx == 0){

        strncpy(SF.SimCelNum,string[1],strlen(string[1])+11);
        strncpy(SF.SimDate,string[3],strlen(string[3])+1);
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
        strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);

      //read API keys to Flash buff first
        strncpy(SF.ReadAPIKey,string[6],strlen(string[6])+1);

      //network APN to Flash buff first
        strncpy(SF.APN,string[7],strlen(string[7])+1);

      //network Password to Flash buff first
        strncpy(SF.PWD,string[8],strlen(string[8])+1);

#ifdef SimConfDebug
        PrintOut(PrintHandler, "\r\n"
                               " * SF.WriteAPIKey: %s\r\n"
                               " * SF.ReadAPIKey:  %s\r\n"
                               " * SF.APN:         %s\r\n"
                               " * SF.PWD:         %s\r\n"
                               ,SF.WriteAPIKey,SF.ReadAPIKey
                               ,SF.APN,SF.PWD);

#endif
    }

//delete sms from sm
    Delay_ms(500);
    RemoveSMSText(res);
    res = strcmp(SimTestTxt,"OK,");
#ifdef SimConfDebug
    sprintf(txtA,"%d",res);
    PrintOut(PrintHandler, "\r\n"
                           " * SimTestTxt: %s\r\n"
                           " * OK-0: %s\r\n"
                           ,SimTestTxt,txtA);
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
char SendSMS(char sms_type,char cellNum){
static short onecA;
int res;
char b[64];
char tempCellNum[20];
char *str;
     str = (char*)Malloc(100*sizeof(char*));
     if(!cellNum)
        strcpy(tempCellNum,string[1]);
     else
        strcpy(tempCellNum,SF.SimCelNum);
        
    if(!onecA){
      onecA = 1;
      AT_Initial();
    }
    
    UART2_Write_Text("AT+CMGF=1");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    Delay_ms(1000);
    UART2_Write_Text("AT+CMGS=");
    UART2_Write_Text(tempCellNum);//SF.SimCelNum);
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
      case 6: //read the set points
             str = Read_Thresholds();
             strncpy(b,str,strlen(str)-4);
             UART2_Write_Text(b);
             break;
      case 7: //read raw values
             str = Read_Send_AllColour(0);
             strncpy(b,str,strlen(str));
             UART2_Write_Text(b);
             break;
      case 8: //read scaled values
             str = Read_Send_AllColour(1);
             strncpy(b,str,strlen(str));
             UART2_Write_Text(b);
             break;
      case 9:
             UART2_Write_Text("Test Started!");
             break;
      case 10:
             UART2_Write_Text("Test Stopped!");
             break;
      case 11:
             UART2_Write_Text("You are not permitted to set the threshold contact the supplier!");
             break;
      case 12:
             UART2_Write_Text("Not a recognised command!");
             break;
      case 13:
             UART2_Write_Text("You cannot stop this test contact the owner of this test!");
             break;
      case 14:
             UART2_Write_Text("Test already started contact owner of this test!");
             break;
      case 15:
             UART2_Write_Text("Test has not been started!");
             break;
      default:
             UART2_Write_Text("Error Power cycle the device!");
             break;
    }
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    UART2_Write(0x1A);
    Delay_ms(5000);
    
    Free(str,100*sizeof(char*));

}

/***********************************************************************
*Get SMS if recieved during run
***********************************************************************/
char* GetSMSText(){

int num_strs,res,err;
    UART1_Write_Text("=================\r\n");
    RingToTempBuf();

  //ask sim800 for the sms text
    //str_rcv = setstr(SimTestTxt);
    num_strs = strsplit(SimTestTxt,',');
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
                           " *string[7]  %s\r\n"
                           " *string[8]  %s\r\n"
                           ,txtA,txtB,string[0]
                           ,string[1],string[2]
                           ,string[3],string[4]
                           ,string[5],string[6]
                           ,string[7],string[8]);
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
         SendSMS(5,0);
         res = 1;
       }
      return RemoveSMSText(res);
   }

   return -1;
}

/**********************************************************************
*read the msg that was recieved from the sim memory
*[sim can only store 20 messages ]
**********************************************************************/
char* ReadMSG(int msg_num){
int i,num_strs,res;
char *text;
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
     
     for(i = 0;i<strlen(SimTestTxt);i++){
          SimTestTxt[i] =  toupper(SimTestTxt[i]);
      }
    //str_rcv = setstr(SimTestTxt);
    num_strs = strsplit(SimTestTxt,',');
    text = strchr(string[4], '"');
    strcpy(string[6], RemoveChars(text,'"','O'));
    strcpy(string[3], RemoveChars(string[3],'"',0x0A));
    memset(string[4]+8,0,1);
    strncpy(string[4],string[4],8);//RemoveChars(string[4],0x02,'+'));


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
                           " *string[6]  %s\r\n"
                           ,sms,string[0],string[1]
                           ,string[2],string[3]
                           ,string[4],string[5]
                           ,string[6]);
#endif
        if(string[6] != NULL){
          strcpy(string[6],RemoveWhiteSpace(string[6]));
          res = StrChecker(string[6]);
          
          //if configuration msg and not primary cell no return
          if((res == 16) && (strncmp(string[1],SF.SimCelNum,15))){
             SendSMS(11,0);
             return 255;
          }

          if(res == 18){
             if((SimVars.start)&&
               (!strncmp(string[1],SF.StartCell,15)||
                !strncmp(string[1],SF.SimCelNum,15))){
                    SimVars.start = 0;
 #ifdef SMSDebug
                    PrintOut(PrintHandler,       "\r\n"
                             " *SimVars.start:=  0\r\n"
                             " *SF.StartCell:=   %s\r\n"
                             " *string[1]:=      %s\r\n"
                             ,SF.StartCell,string[1]);
 #endif
                    goto next; //if cell matches allow to CANCEL
             }else{
                  if(!SimVars.start){
                       SendSMS(15,0);
                        return 15;
                  }
                  else{
                    SendSMS(13,0);
                    return 13;
                  }
                 }
         }else if(res == 17 && !SimVars.start){
               strncpy(SF.StartCell,string[1],15);
               SimVars.start = 1;
         }else if(res == 17 && SimVars.start){
               SendSMS(14,0);
               return 14;
         }else
             goto next;

          next:
          TestRecievedSMS(res);
        }
     return 0;
}

/**********************************************************************
* test the recieved sms for reaction
**********************************************************************/
void TestRecievedSMS(int res){
char *t,B[64],txtDig[9];

#ifdef SMSDebug
            // strncat(b,t,strlen(t));
     sprintf(B,"%d",res);
     PrintOut(PrintHandler, "\r\n"
                            " *Str check result:= %s\r\n"
                               ,B);
#endif

    switch(res){
      case 6:
           SendSMS(7,0);
           break;
      case 7: //R
           SendSMS(12,0);
           break;
      case 8: //G
           SendSMS(12,0);
           break;
      case 9: //B
           SendSMS(12,0);
           break;
      case 10: //C
           SendSMS(12,0);
           break;
      case 13:
           SendSMS(8,0);
           break;
      case 14:
           SendSMS(6,0);
           break;
      case 15: //write,
           SendSMS(12,0);
           break;
      case 16:
            GetValuesFromFlash();
            NVMErasePage(FLASH_Settings_PAddr);
            if(string[5] != NULL){
               strcpy(B,string[5]);
               Threshold.time_to_log = atoi(B);
               Threshold.time_to_log -= 1;
            }
            WriteToFlashTemp();
            t =  Write_Thresholds(0);
#ifdef SMSDebug
              // strncpy(b,t,strlen(t));
               PrintOut(PrintHandler, "\r\n"
                               " *CRGB:= %s\r\n"
                               ,t);
#endif
                SendSMS(6,0);
           break;
      case 17:
           SimVars.init_inc = 5;  //Test started
           T0_SP.sec = T0_SP.min = T0_SP.hr = 0;
           SendSMS(9,0);
           break;
      case 18:
           SimVars.init_inc = 3;  //Test Stopped
           SendSMS(10,0);
           break;
       case 20:
           SendSMS(12,0);
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
int Test_Update_ThingSpeak(){

       TCS3472_getRawData(RawData);
       SendData(RawData);
       return 2;
}

/****************************************************
*Send the data to thingspeak
****************************************************/
void SendData(unsigned int* rgbc){
int len;
char *str;
    
    str = (char*)Malloc(200*sizeof(char*));
    //get the colour valuse prior to sending to ThingSpek
    sprintf(txtC,"%u",rgbc[0]);
    sprintf(txtR,"%u",rgbc[1]);
    sprintf(txtG,"%u",rgbc[2]);
    sprintf(txtB,"%u",rgbc[3]);
    
    
    UART2_Write_Text("AT+CIPSHUT");
    UART2_Write(0x0D);
    UART2_Write(0x0A);
    TestForOK(0);
    Delay_ms(50);
    
    //allocate memory for string
    //ensure 1st byte is a null terminating value
    str[0]  = 0;
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
    UART2_Write_Text("AT+CSTT=");//\"data.uk\",\"user\",\"one2one\"");
    UART2_Write_Text(SF.APN);
    UART2_Write_Text(",\"user\",");
    UART2_Write_Text(SF.PWD);
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
    
    Free(str,200*sizeof(char*));
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