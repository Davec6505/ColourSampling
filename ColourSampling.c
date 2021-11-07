#include "Config.h"


int (*Update_Test)(uint16_t s,uint16_t m, uint16_t h);

PString str_t;
Timer_Setpoint T0_SP={
 0,
 0,
 0,
 0,
 0
};
char* (*testStr)(int i);
//USB
char cnt;
char kk;
char readbuff[64];
char writebuff[64];

//Serial
char txt[] = "00000";
char sub_txt[] = "\"+44";


//program
void main() {
unsigned char cel_num[20];
char num,res;
unsigned short i;
unsigned int R,str_num;
unsigned int deg;
char txtR[6];


   Update_Test = Test_Update_ThingSpeak;
   //testStr = StrChecker;
   ConfigPic();

   Delay_ms(2000);

   it = TCS3472_INTEGRATIONTIME_24MS;//TCS3472_INTEGRATIONTIME_2_4MS;
   G  = TCS3472_GAIN_1X;
   device_Id = TCS3472_1_5;  //TCS347_11_15;
   i = 0;
   i = TCS3472_Init(it,G,device_Id);
   sprintf(txtR,"%2x",i);
   strcat(writebuff,txtR);
   while(!HID_Write(&writebuff,64));

 // RD = GR = BL = 1;

#ifdef MainDebug
  UART1_Write_Text("Start");
  UART1_Write(13);
  UART1_Write(10);
#endif
  T0_SP.sec = 0;
  T0_SP.min = 0;
  T0_SP.hr  = 0;
               
               
/*************************************************
*check if simcard is registered and setup the sim
*for logging
*************************************************/
    strcpy(cel_num,GetValuesFromFlash());
    str_num = strncmp(cel_num,sub_txt,4);
 #ifdef MainDebug
    sprintf(txtR,"%u",str_num);
    PrintOut(PrintHandler, "\r\n"
                           " *Cell number:   %s\r\n"
                           " *Result of cmp: %s\r\n"
                           ,cel_num,txtR);
 #endif
   if(str_num > 0){
     SimVars.init_inc = SetupIOT();           //ret 1
     SimVars.init_inc = WaitForSetupSMS(0);   //ret 2
     SimVars.init_inc = GetAPI_Key_SMS();     //ret 3
     if(SimVars.init_inc != 0)
         SimVars.init_inc = SendSMS(SimVars.init_inc);
     else
         SimVars.init_inc = SendSMS(SimVars.init_inc);
   }else{
     SimVars.init_inc = 5;
   }
/*************************************************
*main => loop forever and call all functions*
*keep main free from code
*************************************************/
   PrintOut(PrintHandler, "\r\n"
                           " *Run");
   while(1){
   int res;
     ///////////////////////////////////////////////
     //Get input from USB to set up thresholds
     num = HID_Read();
     if(num != 0){
        DoStrings(num);
     }
     //////////////////////////////////////////////
     //Get sms input
     if(SimVars.init_inc >= 5){
       if(T0_SP.one_per_sec){
           T0_SP.one_per_sec = 0;
           res =  Update_Test(T0_SP.sec,T0_SP.min,T0_SP.hr);
           if(res >= 1){
                 T0_SP.sec = 0;
                 T0_SP.min = 0;
                 T0_SP.hr = 0;
           }
       }
     }

     //test for incoming SMS from
     res = TestRingPointers();
     if(res > 1){
#ifdef MainDebug
       sprintf(txtR,"d",res);
       PrintOut(PrintHandler, "\r\n"
                              " *Diff in pointers"
                              ,txtR);
       GetSMSText();
#endif
     }


     if(!RG9_bit)
        NVMErasePage(FLASH_Settings_PAddr);//SendSMS(100);
     if(!RE4_bit){
        GetValuesFromFlash();
        TCS3472_getRawData(RawData);
        SendData(RawData);
     }
   }
}