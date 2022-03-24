#include "Config.h"


int (*Update_Test)(float deg);

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

//minimum out put of contol is max value pwm can attain
const int temp_pwm_max = 3780;

/******************************************************
*main program START
******************************************************/
void main() {
//non static fields
char cel_num[20];
char num,last_rec_inc;
unsigned short i;
unsigned int cell_ok,str_num,deg;
float _temp[4];
int resA=0, resB=0, diff = 0;
long res_millis_sigstr = 0;

//static fields
static int ave_adc = 0;
static long last_millis_sigstr = 0;
static long millis_sigstr_sp = 0;
static long last_millis_thermister = 0;
static long millis_thermister_sp = 0;
static long millis_thermister = 0;

static char last_start = 0;
int sample_test = 0;
unsigned int pid_out = 0;

#ifdef MainDebug
char txtInit[6],txtR[6],txtH[6],txtT[6],txtI[6],txtK[15],txtC[15],txtF[15],txtRaw[15],txtPid[15];
#endif

   //funct ptr  setup;
   Update_Test = Test_Update_ThingSpeak;
   
   //Execution of code starts here
   ConfigPic();

   Delay_ms(500);

   //setup Color sampling properties
   it = TCS3472_INTEGRATIONTIME_24MS;//TCS3472_INTEGRATIONTIME_2_4MS;
   G  = TCS3472_GAIN_1X;
   device_Id = TCS3472_1_5;          //TCS347_11_15;
   i = 0;
   i = TCS3472_Init(it,G,device_Id);
   
/**************************************************
*Setup timer values
**************************************************/
   T0_SP.sec = 0;
   T0_SP.min = 0;
   T0_SP.hr  = 0;
               
               
/*************************************************
*check if simcard is registered and setup the sim
*for logging to thingspeak, and get the saved
*values from flash memory,check the 1st 4 char's
*for differences this will show if no sim is reg
*************************************************/
   strcpy(cel_num,GetValuesFromFlash());
   str_num = strncmp(cel_num,sub_txt,4);
   
#ifdef MainDebug  //display saved values
   sprintf(txtR,"%u",str_num);
   PrintOut(PrintHandler, "\r\n"
                          " *Cell number:   %s\r\n"
                          " *Result of cmp: %s\r\n"
                          ,cel_num,txtR);
#else
     Delay_ms(10);
#endif
/***************************************************************
*if the sim shows up as not registered with this device, the
*setup phase will be entered and the device will wait for a
*simple test msg to be sent from a cell phone to this sim's
*number, once it recieves a sms, the device will ask for
*thingspeak details and will save this sms to primary cell flash
***************************************************************/
  if(str_num != 0){   //value will be 0 if
     SimVars.init_inc = SetupIOT();           //ret 1
     SimVars.init_inc = WaitForSetupSMS(0);   //ret 2
     SimVars.init_inc = GetAPI_Key_SMS();     //ret 3
     if(SimVars.init_inc != 0)
       SendSMS(SimVars.init_inc,1);  //Device not setup
     else
       SendSMS(SimVars.init_inc,1); //Device setup
     cell_ok = 0;
   }else{
     WaitForResponse(3);
     SimVars.init_inc = 3;
     cell_ok = 1;
   }
   
   if(cell_ok == 1){ //only if primary cell num has been saved
       Read_Thresholds();
       Delay_ms(3000);
       SendSMS(4,1); //"Device powered up" =>msg is sent
       SimVars.init_inc = 3;
   }
   
#ifdef MainDebug
         sprintf(txtInit,"%d",SimVars.init_inc);
         PrintOut(PrintHandler, "\r\n"
                                " *Run      \r\n"
                                " *Initial Incrament:= %s\r\n"
                                ,txtInit);
#else
     Delay_ms(10);
#endif

   T0_SP.one_per_Xmin = 0;
   resA = resB = 0;
   last_millis_sigstr = TMR0.millis;
   millis_sigstr_sp = 5000;
   last_start = 0;
/***************************************************************
*reset the led for error Threshold to get accurate readings
*from the colour chip
***************************************************************/
 // Initialize_Led_On();
 //  PWM_Start(3); //start temp control

/**************************************************************
*main => loop forever and call all functions*
*keep main free from code
**************************************************************/
   while(1){
     ////////////////////////////////////////////////
     //Get input from USB to set up thresholds
     num = HID_Read();
     if(num != 0){
        DoStrings(num);
     }
     
     ////////////////////////////////////////////////
     //use  START sent from sms to START anything here
    if(SimVars.start && !last_start){
        last_start = 1;
        Initialize_Led_On(); //At START cmd Init LED intensity
        PWM_Start(3); //start temp control
    }else if(!SimVars.start && (last_start > 0)){
        last_start = 0;
        PWM_Stop(3); //stop temp control
    }
    
     ////////////////////////////////////////////////
     //test millis for time to check thermister
     millis_thermister = TMR0.millis - last_millis_thermister;
     if(millis_thermister > millis_thermister_sp){
         millis_thermister_sp   = 999;
         last_millis_thermister = TMR0.millis;
         millis_thermister  = 0;
         sample_test = LM35_Adc_Average(&ave_adc,LM35Pin);
         if(sample_test < 0){
           getLM35Temp(_temp,ave_adc);
           ave_adc = 0;
           current_duty3 = PID_Calculate( 35.00, _temp[1]);
           PWM_Set_Duty(current_duty3, 3);
           
#ifdef ThermisterDebug
           sprintf(txtK,"%3.2f",_temp[0]);
           sprintf(txtC,"%3.2f",_temp[1]);
           sprintf(txtF,"%3.2f",_temp[2]);
           sprintf(txtRaw,"%3.2f",_temp[3]);
           sprintf(txtPid,"%d",current_duty3);
           PrintOut(PrintHandler, "\r\n"
                                  " *Kelvin:=      %s\r\n"
                                  " *deg. C:=      %s\r\n"
                                  " *deg. F:=      %s\r\n"
                                  " *ADC:=         %s\r\n"
                                  " *PID:=         %s\r\n"
                                  ,txtK,txtC,txtF,txtRaw,txtPid);
#else
         Delay_ms(50);
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
         if(STAT)
           SignalStrength();
     }

     //////////////////////////////////////////////////
     //Update Thingspeak
     if(SimVars.init_inc >= 5 && last_start > 0){
       if(T0_SP.one_per_Xmin){
         PWM_Start(2);
         Delay_ms(500);
        // SetLedPWM();
         Update_Test(_temp[1]);
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
#else
         Delay_ms(50);
#endif
         GetSMSText();
         Delay_ms(500);
         if(SimVars.init_inc != 5)
             SimVars.init_inc = last_rec_inc;
       }

     }

     ///////////////////////////////////////////////////////////
     //reset flash
#ifdef ResetFlash
     if(!RG9_bit)
       NVMErasePage(FLASH_Settings_PAddr);//SendSMS(100);
#endif
        
    ////////////////////////////////////////////////////////////
    //use onboard switch to debug various features
     if(!RE4_bit){
#ifdef  ApplicationDbg
       ApplicationDebug();
#endif
     }
     
     ///////////////////////////////////////////////////////////
     //Reset the mcu if a watchdog time out occurs
     if (RCON & 0x0010) {
     // execute Watchdog Time-out Reset handler ...
        Reset();
     }
     
     ///////////////////////////////////////////////////////////
     //Service the whatchdog timer
     WDTCLR_bit = 1;
   }
}