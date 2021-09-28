#include "Config.h"
PString str_t;
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
char num;
unsigned short i;
unsigned int R,str_num;
unsigned int deg;
char txtR[6];
 //testStr = StrChecker;
 ConfigPic();
 Delay_ms(5000);
 it = TCS3472_INTEGRATIONTIME_24MS;//TCS3472_INTEGRATIONTIME_2_4MS;
 G  = TCS3472_GAIN_1X;
 device_Id = TCS3472_1_5;
 i = 0;
 i = TCS3472_Init(it,G,device_Id);
  sprintf(txtR,"%2x",i);
  strcat(writebuff,txtR);
  while(!HID_Write(&writebuff,64));


 while(1){
   ///////////////////////////////////////////////
   //Get input from USB to set up thresholds
   num = HID_Read();
   if(num != 0){
      DoStrings(num);
   }
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