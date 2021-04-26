#include "Config.h"

char txt[] = "00000";

TCS3472_IntegrationTime_t it;
TCS3472_Gain_t G;

void main() {
unsigned short i;
 ConfigPic();
 it = TCS3472_INTEGRATIONTIME_2_4MS;
 G  = TCS3472_GAIN_4X;
 i  = 0;
 
while(1){
    ByteToStr(i, txt);
   //sprintf(txt,"%X",i);
   WriteData(txt);
   LATE3_bit = i;
   i = TCS3472_Init(it,G);
   Delay_ms(1000);
 }

}

void WriteData(char *_data){
       UART2_Write_Text(_data);
}