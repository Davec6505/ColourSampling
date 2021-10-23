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



//program
void main() {
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

/*************************************************
*check if simcard is registered and setup the sim
*for logging
*************************************************/
 SetupIOT();
 
/*************************************************
*main => loop forever and call all functions*
*keep main free from code
*************************************************/

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
   if(T0_SP.one_per_sec){
       T0_SP.one_per_sec = 0;
       res =  Update_Test(T0_SP.sec,T0_SP.min,T0_SP.hr);
       if(res >= 1){
             T0_SP.sec = 0;
             T0_SP.min = 0;
             T0_SP.hr = 0;
       }
   }
   
   if(!RG9_bit)
      SendSMS(0);
 }
}




/*   WriteData(txtR);
      WriteData("\r\n");
      if(str_num == 3 || str_num == 6){
         for(i = 0;i < 5;i++){
           res = strncmp(conf,testStr(i),str_num);

           sprintf(txtR,"%u",res);
           WriteData(txtR);
           WriteData("\r\n");
           if(res == 0)
              break;
         }
       }  */
      // sprintf(txtR,"%d",res);
     /*  if(res == 0){
         WriteData(conf);
         WriteData("\r\n");
       } */

   /* if(!res){
       TCS3472_getRawData(RawData);
      // R = TCS3472_Read16(TCS3472_RDATAL);
       WriteData("C || R | G | B | = || ");
       sprintf(txtR,"%u",RawData[0]);
       WriteData(txtR);
       WriteData(" || ");
      // UART2_Write('\t');
       sprintf(txtR,"%u",RawData[1]);
       WriteData(txtR);
       WriteData(" | ");
      // UART2_Write('\t');
       sprintf(txtR,"%u",RawData[2]);
       WriteData(txtR);
       WriteData(" | ");
      // UART2_Write('\t');
       sprintf(txtR,"%u",RawData[3]);
       WriteData(txtR);
       WriteData(" || ");
      // UART2_Write('\r');
      // UART2_Write('\n');
      // WriteData(txt);
      CCT =TCS3472_CalcColTemp_dn40(&RawData,it);
       sprintf(txtR,"%u",CCT);
       WriteData(txtR);
       WriteData(" ||\r\n");
<<<<<<< HEAD
   }
   Delay_ms(1000);*/