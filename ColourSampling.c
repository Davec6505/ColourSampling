#include "Config.h"

char txt[] = "00000";
char txtR[] = "00000";
TCS3472_IntegrationTime_t it;
TCS3472_Gain_t G;
TCS3472x device_Id;
void main() {
unsigned short i;
unsigned int RawData[4];
unsigned int R;
 ConfigPic();
 it = TCS3472_INTEGRATIONTIME_2_4MS;
 G  = TCS3472_GAIN_4X;
 device_Id = TCS3472_1_5;
 i  = 0;
 i = TCS3472_Init(it,G,device_Id);
 UART2_Write_Text("Device Id:= ");
 ByteToStr(i, txt);
 UART2_Write_Text(txt);
 
while(1){

   TCS3472_getRawData(RawData);
  // R = TCS3472_Read16(TCS3472_RDATAL);
   WriteData("C | R | G | B | = ");
   sprintf(txtR,"%d",RawData[0]);
   WriteData(txtR);
   UART2_Write('\t');
   sprintf(txtR,"%d",RawData[1]);
   WriteData(txtR);
   UART2_Write('\t');
   sprintf(txtR,"%d",RawData[2]);
   WriteData(txtR);
   UART2_Write('\t');
   sprintf(txtR,"%d",RawData[3]);
   WriteData(txtR);
   UART2_Write('\r');
   UART2_Write('\n');
  // WriteData(txt);
   Delay_ms(1000);
 }

}

void WriteData(char *_data){
       UART2_Write_Text(_data);
}