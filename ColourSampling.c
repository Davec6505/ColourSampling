#include "Config.h"


int (*Update_Test)();

PString str_t;
Timer_Setpoint T0_SP={
 0,
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
char num;
unsigned short i;
unsigned int cell_ok,str_num,deg;
char txtR[6],txtH[6],txtT[6],txtI[6];
int resA=0, resB=0, diff = 0;;

   Update_Test = Test_Update_ThingSpeak;

   ConfigPic();

   Delay_ms(500);

   it = TCS3472_INTEGRATIONTIME_24MS;//TCS3472_INTEGRATIONTIME_2_4MS;
   G  = TCS3472_GAIN_1X;
   device_Id = TCS3472_1_5;          //TCS347_11_15;
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
   if(str_num != 0){
     SimVars.init_inc = SetupIOT();           //ret 1
     SimVars.init_inc = WaitForSetupSMS(0);   //ret 2
     SimVars.init_inc = GetAPI_Key_SMS();     //ret 3
     if(SimVars.init_inc != 0)
       SendSMS(SimVars.init_inc,1);
     else
       SendSMS(SimVars.init_inc,1);
     cell_ok = 0;
   }else{
     WaitForResponse(3);
     SimVars.init_inc = 3;
     cell_ok = 1;
   }
/**************************************************************
*main => loop forever and call all functions*
*keep main free from code
**************************************************************/
   if(cell_ok == 1){ //only if primary cell num has been saved
       Read_Thresholds();
       Delay_ms(3000);
       SendSMS(4,1);
   }
   
   PrintOut(PrintHandler, "\r\n"
                           " *Run");
   resA = resB = 0;
/***************************************************
* main loop forever!!
***************************************************/
   while(1){
     ///////////////////////////////////////////////
     //Get input from USB to set up thresholds
     num = HID_Read();
     if(num != 0){
        DoStrings(num);
     }
     
     //Update Thingspeak
     if(SimVars.init_inc >= 5){
       if(T0_SP.one_per_sec){
         Update_Test();
         T0_SP.sec = T0_SP.min = T0_SP.hr = 0; //start timming again
         T0_SP.one_per_sec = 0;
       }
     }
     
     //test for incoming SMS using difference in ring ptr
     if(!T0_SP.one_per_sec){
       diff = TestRingPointers();
       if(diff > 1){
         SimVars.init_inc = 3;
#ifdef MainDebug
         sprintf(txtI,"%d",resB);
         sprintf(txtR,"%d",diff);
         sprintf(txtT,"%d",RB.tail);
         sprintf(txtH,"%d",RB.head);
         PrintOut(PrintHandler, "\r\n"
                                " *Tail:= %s\r\n"
                                " *Head:= %s\r\n"
                                " *Diff in pointers:= %s\r\n"
                                " *Reply from GetSmsTxt():= %s\r\n"
                                ,txtT,txtH,txtR,txtI);
#endif
          resB = GetSMSText();
         Delay_ms(500);
       }
       SimVars.init_inc = 5;
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