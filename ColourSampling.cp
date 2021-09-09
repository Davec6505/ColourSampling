#line 1 "C:/Users/GIT/ColourSampling/ColourSampling.c"
#line 1 "c:/users/git/coloursampling/config.h"
#line 1 "c:/users/git/coloursampling/tcs3472.h"




extern sfr TCS3472_Initialised;
#line 60 "c:/users/git/coloursampling/tcs3472.h"
typedef enum {
 TCS3472_INTEGRATIONTIME_2_4MS = 0xFF,
 TCS3472_INTEGRATIONTIME_24MS = 0xF6,
 TCS3472_INTEGRATIONTIME_50MS = 0xEB,
 TCS3472_INTEGRATIONTIME_101MS = 0xD5,
 TCS3472_INTEGRATIONTIME_154MS = 0xC0,
 TCS3472_INTEGRATIONTIME_700MS = 0x00
} TCS3472_IntegrationTime_t;



typedef enum {
 TCS3472_GAIN_1X = 0x00,
 TCS3472_GAIN_4X = 0x01,
 TCS3472_GAIN_16X = 0x02,
 TCS3472_GAIN_60X = 0x03
} TCS3472_Gain_t;


typedef enum{
 TCS3472_1_5 = 0x44,
 TCS3472_3_7 = 0x4D
} TCS3472x;

typedef enum{
 error = 0,
 Ok
 }TCS3472_Error;

extern TCS3472_IntegrationTime_t it;
extern TCS3472_Gain_t G;
extern TCS3472x device_Id;
extern TCS3472_Error device_Error;

unsigned short TCS3472_Init(TCS3472_IntegrationTime_t It,TCS3472_Gain_t gain , TCS3472x Id );
void TCS3472_Write(unsigned short cmd);
void TCS3472_Write8(unsigned short reg_add,unsigned short value);
unsigned short TCS3472_Read8(unsigned short reg_add);
unsigned int TCS3472_Read16(unsigned short reg_add);
void TCS3472_Enable();
void TCS3472_Disable();
unsigned short TCS3472_SetIntergration_Time(TCS3472_IntegrationTime_t It);
unsigned short TCS3472_SetGain(TCS3472_Gain_t gain);
void TCS3472_getRawData(unsigned int *RGBC);
void TCS3472_getRawDataOnce(unsigned int *RGBC);
unsigned int TCS3472_CalcColTemp(unsigned int R,unsigned int G,unsigned int B);
unsigned int TCS3472_CalcColTemp_dn40(unsigned int *RGBC,TCS3472_IntegrationTime_t It);
unsigned int TCS3472_Calc_Lux(unsigned int R,unsigned int G,unsigned int B);
unsigned short TCS3472_SetInterrupt(char i);
unsigned short TCS3472_SetInterrupt_Limits(unsigned int Lo,unsigned int Hi);
#line 1 "c:/users/git/coloursampling/_timers.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 5 "c:/users/git/coloursampling/_timers.h"
typedef struct{
 uint32_t millis;
 uint16_t temp_ms;
 uint16_t ms;
 uint8_t sec;
}Timers;


void InitTimer1();
void Get_Time();
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 8 "c:/users/git/coloursampling/config.h"
extern unsigned short i;
extern char kk;
extern char readbuff[64];
extern char writebuff[64];

void ConfigPic();
void InitISR();
void WriteData(char *_data);
char* StrChecker(int i);
#line 3 "C:/Users/GIT/ColourSampling/ColourSampling.c"
char* (*testStr)(int i);

char cnt;
char kk;
char readbuff[64];
char writebuff[64];


char txt[] = "00000";
char txtR[] = "00000";
char conf[64] = "";



void main() {
unsigned short i;
unsigned int RawData[4];
unsigned int R,str_num;
unsigned int deg;
unsigned int CCT;
 testStr = StrChecker;
 ConfigPic();
<<<<<<< HEAD
 it = TCS3472_INTEGRATIONTIME_101MS;
=======
 it = TCS3472_INTEGRATIONTIME_24MS;
>>>>>>> 7e24bf2d4ce34742f65f984d34496582df719418
 G = TCS3472_GAIN_1X;
 device_Id = TCS3472_1_5;
 i = 0;
 i = TCS3472_Init(it,G,device_Id);
 UART2_Write_Text("Device Id:= ");
 ByteToStr(i, txt);
 UART2_Write_Text(txt);

while(1){
char num,res;
 num = HID_Read();
 res = -1;
 if(num != 0)
 {


<<<<<<< HEAD
 WriteData("C | R | G | B | = ");
 sprintf(txtR,"%u",RawData[0]);
 WriteData(txtR);
 WriteData("|");

 sprintf(txtR,"%u",RawData[1]);
 WriteData(txtR);
 WriteData("|");

 sprintf(txtR,"%u",RawData[2]);
=======
 memcpy(writebuff,readbuff,num);
 memcpy(conf,readbuff,num);

 str_num = 0;
 res = -1;
 for(i=0;i < 64;i++){
 if(conf[i] == '\r')
 break;
 str_num++;
 }
 memset(conf+str_num+1,'\0',1);

 sprintf(txtR,"%u",str_num);
>>>>>>> 7e24bf2d4ce34742f65f984d34496582df719418
 WriteData(txtR);
 WriteData("\r\n");
 if(str_num == 3 || str_num == 6){
 for(i = 0;i < 5;i++){
 res = strncmp(conf,testStr(i),str_num);

<<<<<<< HEAD
 sprintf(txtR,"%u",RawData[3]);
=======
 sprintf(txtR,"%u",res);
>>>>>>> 7e24bf2d4ce34742f65f984d34496582df719418
 WriteData(txtR);
 WriteData("\r\n");
 if(res == 0)
 break;
 }
 }


 if(res == 0){
 WriteData(conf);
 WriteData("\r\n");
 }
 }
#line 103 "C:/Users/GIT/ColourSampling/ColourSampling.c"
 }

}

void WriteData(char *_data){

 HID_Write(_data,64) ;
}


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
