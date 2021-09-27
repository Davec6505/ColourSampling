#include "Config.h"

char* (*testStr)(int i);
//USB
char cnt;
char kk;
char readbuff[64];
char writebuff[64];

//Serial
char txt[] = "00000";
char txtR[] = "00000";
char conf[64] = "";


//program
void main() {
unsigned short i;
unsigned int RawData[4];
unsigned int R,str_num;
unsigned int deg;
unsigned int CCT;
 testStr = StrChecker;
 ConfigPic();
 it = TCS3472_INTEGRATIONTIME_24MS;//2_4MS;
 G  = TCS3472_GAIN_1X;
 device_Id = TCS3472_1_5;
 i = 0;
 i = TCS3472_Init(it,G,device_Id);
 UART2_Write_Text("Device Id:= ");
 ByteToStr(i, txt);
 UART2_Write_Text(txt);
 
while(1){
char num,res;
    USB_Polling_Proc();               // Call this routine periodically
    num = HID_Read();
    res = 0;
    



    if(num != 0)
    {
      //for(cnt=0;cnt<64;cnt++)
      //  writebuff[cnt]=readbuff[cnt];
      //memcpy(writebuff,readbuff,num);
      memcpy(conf,readbuff,num);

      str_num = 0;
      res = -1;
      for(i=2;i < 63;i++){
          if((conf[i] == 0x0A)||(conf[i] == 0x0D))
            break;
          str_num++;
      }
      //memcpy(conf+str_num+1,'\0',1);
      sprintf(txtR,"%u",str_num);
      memcpy(writebuff,txtR,3);

      HID_Write(writebuff,64);
      // sprintf(txtR,"%d",res);
      /* if(res == 0){
         WriteData(conf);
         WriteData("\r\n");
       }  */
    }
/*if(!res){
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
   }
   Delay_ms(1000);*/
 }

}

void WriteData(char *_data){
      // UART2_Write_Text(_data);
      HID_Write(_data,64) ;
}

//check dtrings for diffeences
char* StrChecker(int i){
    switch(i){
       case 0:
           return "AT?";
           break;
       case 1:
            return "AT+SET";
            break;
       case 2:
            return "AT+CONF";
            break;
       case 3:
            return "AT!";
            break;
       default:
            return " ";
            break;
    }
    return " ";
}