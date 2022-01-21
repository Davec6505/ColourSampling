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
char cel_num[20];
char num,last_rec_inc;
unsigned short i;
unsigned int cell_ok,str_num,deg;

static long last_millis_sigstr = 0;
static long millis_sigstr_sp = 0;
long res_millis_sigstr = 0;

static long last_millis_thermister = 0;
static long millis_thermister_sp = 0;
static long millis_thermister = 0;
static int ave_adc = 0;
float temp[4];
int resA=0, resB=0, diff = 0;
#ifdef MainDebug
char txtR[6],txtH[6],txtT[6],txtI[6],txtK[15],txtC[15],txtF[15],txtRaw[15];
#endif


   Update_Test = Test_Update_ThingSpeak;

   ConfigPic();

   Delay_ms(500);

   it = TCS3472_INTEGRATIONTIME_24MS;//TCS3472_INTEGRATIONTIME_2_4MS;
   G  = TCS3472_GAIN_1X;
   device_Id = TCS3472_1_5;          //TCS347_11_15;
   i = 0;
   i = TCS3472_Init(it,G,device_Id);
  // sprintf(txtR,"%2x",i);
  // strcat(writebuff,txtR);
  // while(!HID_Write(&writebuff,64));

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
       SimVars.init_inc = 3;
   }
   
#ifdef MainDebug
         sprintf(txtR,"%d",SimVars.init_inc);
         PrintOut(PrintHandler, "\r\n"
                                " *Run      \r\n"
                                " *Initial Incrament:= %s\r\n"
                                ,txtR);
#endif
   T0_SP.one_per_Xmin = 0;
   resA = resB = 0;
   //check for signal strength on START tmr2-3
  // SignalStrength();
   last_millis_sigstr = TMR0.millis;
   millis_sigstr_sp = 5000;
   
   PWM_Start(2);
   Delay_ms(500);
   SetLedPWM();
   PWM_Stop(2);
/***************************************************
* main loop forever!!
***************************************************/
   while(1){
   int sample_test = 0;

     ////////////////////////////////////////////////
     //Get input from USB to set up thresholds
     num = HID_Read();
     if(num != 0){
        DoStrings(num);
     }
     
     
     ////////////////////////////////////////////////
     //test millis for time to check thermister
     millis_thermister = TMR0.millis - last_millis_thermister;
      if(millis_thermister > millis_thermister_sp){
         millis_thermister_sp   = 999;
         last_millis_thermister = TMR0.millis;
         millis_thermister  = 0;
         sample_test = Adc_Average(&ave_adc);
         if(sample_test < 0){
           getTemp(temp,ave_adc);
           ave_adc = 0;
#ifdef ThermisterDebug
           sprintf(txtK,"%3.2f",temp[0]);
           sprintf(txtC,"%3.2f",temp[1]);
           sprintf(txtF,"%3.2f",temp[2]);
           sprintf(txtRaw,"%3.2f",temp[3]);
           PrintOut(PrintHandler, "\r\n"
                                  " *Kelvin:=      %s\r\n"
                                  " *deg. C:=      %s\r\n"
                                  " *deg. F:=      %s\r\n"
                                  " *ADC:=         %s\r\n"
                                  ,txtK,txtC,txtF,txtRaw);
#endif
         }
      }

     //////////////////////////////////////////////////
     //test millis for time to check signal strength
     res_millis_sigstr = TMR0.millis - last_millis_sigstr;
      if(res_millis_sigstr >= millis_sigstr_sp){
         millis_sigstr_sp   = 600000;
         last_millis_sigstr = TMR0.millis;
         res_millis_sigstr  = 0;
         SignalStrength();
      }

     //////////////////////////////////////////////////
     //Update Thingspeak
     if(SimVars.init_inc >= 5){
       if(T0_SP.one_per_Xmin){
         PWM_Start(2);
         Delay_ms(500);
        // SetLedPWM();
         Update_Test();
         T0_SP.sec = T0_SP.min = T0_SP.hr = 0; //start timming again
         T0_SP.one_per_Xmin = 0;
         PWM_Stop(2);
       }
     }
     
     ////////////////////////////////////////////////////
     //test for incoming SMS using difference in ring ptr
     if(!T0_SP.one_per_sec){
       diff = TestRingPointers();
       if(diff > 1){
         last_rec_inc = SimVars.init_inc;
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
         GetSMSText();
         Delay_ms(500);
         if(SimVars.init_inc != 5)
             SimVars.init_inc = last_rec_inc;
       }

     }

     ///////////////////////////////////////////////////////////
     //reset flash
     if(!RG9_bit)
        NVMErasePage(FLASH_Settings_PAddr);//SendSMS(100);
        
    ////////////////////////////////////////////////////////////
    //use onboard switch to debug
     if(!RE4_bit){
#ifdef MainFlashDebug
        GetValuesFromFlash();
#endif
#ifdef MainColDebug
        TCS3472_getRawData(RawData);
        GetScaledValues(RawData,&FltData);
        FltData[3] = TCS3472_CalcHue(&FltData);
        SendData(RawData,FltData);
#endif
#ifdef MainSigStrengthDebug
        SignalStrength();
#endif
     }
   }
}