#include "Config.h"


//USB
char cnt;
char kk;
char readbuff[64];
char writebuff[64];

//Serial
char txt[] = "00000";
char txtR[] = "00000";

//Color
TCS3472_IntegrationTime_t it;
TCS3472_Gain_t G;
TCS3472x device_Id;
<<<<<<< HEAD
TCS3472_Error device_Error;
=======

//program
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
void main() {
unsigned short i;
unsigned int RawData[4];
unsigned int R;
unsigned int deg;
 ConfigPic();
 it = TCS3472_INTEGRATIONTIME_2_4MS;
 G  = TCS3472_GAIN_4X;
 device_Id = TCS3472_1_5;
 i = 0;
 i = TCS3472_Init(it,G,device_Id);
 UART2_Write_Text("Device Id:= ");
 ByteToStr(i, txt);
 UART2_Write_Text(txt);
 
while(1){

    if(HID_Read() != 0)
    {
      for(cnt=0;cnt<64;cnt++)
        writebuff[cnt]=readbuff[cnt];
       while(!HID_Write(&writebuff,64)) ;
    }

   TCS3472_getRawData(RawData);
  // R = TCS3472_Read16(TCS3472_RDATAL);
   WriteData("C | R | G | B |  | deg | =   ");
   sprintf(txtR,"%d",RawData[0]);
   WriteData(txtR);
<<<<<<< HEAD
   UART2_Write(9);
   sprintf(txtR,"%d",RawData[1]);
   WriteData(txtR);
   UART2_Write(9);
   sprintf(txtR,"%d",RawData[2]);
   WriteData(txtR);
   UART2_Write(9);
   sprintf(txtR,"%d",RawData[3]);
   WriteData(txtR);
   UART2_Write(9);
   UART2_Write(9);
   
  //deg = TCS3472_CalcColTemp_dn40(RawData);//TCS3472_CalcColTemp(RawData[1],RawData[2],RawData[3]);
   sprintf(txtR,"%d",deg);
   WriteData(txtR);
   UART2_Write(13);
   UART2_Write(10);
=======
   WriteData("|");
  // UART2_Write('\t');
   sprintf(txtR,"%d",RawData[1]);
   WriteData(txtR);
   WriteData("|");
  // UART2_Write('\t');
   sprintf(txtR,"%d",RawData[2]);
   WriteData(txtR);
   WriteData("|");
  // UART2_Write('\t');
   sprintf(txtR,"%d",RawData[3]);
   WriteData(txtR);
   WriteData("| \r\n");
  // UART2_Write('\r');
  // UART2_Write('\n');
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
  // WriteData(txt);
   Delay_ms(1000);
 }

}

void WriteData(char *_data){
      // UART2_Write_Text(_data);
      HID_Write(_data,64) ;
}