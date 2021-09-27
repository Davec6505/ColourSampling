#line 1 "C:/Users/Git/ColourSampling/ColourSampling.c"
#line 1 "c:/users/git/coloursampling/config.h"
#line 1 "c:/users/git/coloursampling/tcs3472.h"
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
#line 8 "c:/users/git/coloursampling/tcs3472.h"
extern sfr TCS3472_Initialised;
#line 69 "c:/users/git/coloursampling/tcs3472.h"
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

typedef struct{
 uint16_t R_Thresh;
 uint16_t G_Thresh;
 uint16_t B_Thresh;
 uint16_t C_Thresh;
}TCS3472x_Threshold;




extern TCS3472_IntegrationTime_t it;
extern TCS3472_Gain_t G;
extern TCS3472x device_Id;
extern TCS3472_Error device_Error;



extern unsigned int RawData[4];
extern unsigned int CCT;




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
void SetColourThresholds(uint16_t C,uint16_t R,uint16_t G,uint16_t B);
#line 1 "c:/users/git/coloursampling/_timers.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
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
#line 1 "c:/users/git/coloursampling/string.h"
#line 1 "c:/users/git/coloursampling/tcs3472.h"
#line 15 "c:/users/git/coloursampling/string.h"
extern char string[ 10 ][ 64 ];

enum ControlColorIO{
CONFIG,
SETALL,
SETR,
SETG,
SETB,
SETC,
READALL,
READR,
READG,
READB,
READC,
READTEMP
};

struct Constants{
 unsigned int num_string;
};


typedef struct pstrings_t{
 char* str;
 char c;
 char string[ 10 ][ 64 ];
 int (*StrSplitFp)(char* str,char c);
}PString;



extern char readbuff[64];
extern char writebuff[64];



int DoStrings(int num);
PString InitString(char cmp);
int StrChecker(char **arr);
int strsplit(char* str,char c);
void testStrings(char* writebuff);
char* setstr(char conf[64]);
void clr_str_arrays(char *str[10]);
char* Read_Send_AllColour();
void Read_Send_OneColour(int colr);
#line 9 "c:/users/git/coloursampling/config.h"
extern unsigned short i;
extern char kk;


void ConfigPic();
void InitVars();
void InitISR();
void WriteData(char *_data);
#line 2 "C:/Users/Git/ColourSampling/ColourSampling.c"
PString str_t;
char* (*testStr)(int i);

char cnt;
char kk;
char readbuff[64];
char writebuff[64];


char txt[] = "00000";




void main() {
char num;
unsigned short i;
unsigned int R,str_num;
unsigned int deg;


 ConfigPic();
 it = TCS3472_INTEGRATIONTIME_101MS;
 it = TCS3472_INTEGRATIONTIME_24MS;
 G = TCS3472_GAIN_1X;
 device_Id = TCS3472_1_5;
 i = 0;
 i = TCS3472_Init(it,G,device_Id);
 UART2_Write_Text("Device Id:= ");
 ByteToStr(i, txt);
 UART2_Write_Text(txt);
 str_t = InitString('+');

<<<<<<< HEAD
while(1){
char num,res;
 USB_Polling_Proc();
 num = HID_Read();
 res = 0;




 if(num != 0)
 {



 memcpy(conf,readbuff,num);

 str_num = 0;
 res = -1;
 for(i=2;i < 63;i++){
 if((conf[i] == 0x0A)||(conf[i] == 0x0D))
 break;
 str_num++;
 }

 sprintf(txtR,"%u",str_num);
 memcpy(writebuff,txtR,3);

 HID_Write(writebuff,64);
#line 67 "C:/Users/GIT/ColourSampling/ColourSampling.c"
 }
#line 96 "C:/Users/GIT/ColourSampling/ColourSampling.c"
=======
 while(1){


 num = HID_Read();
 if(num != 0){
 DoStrings(num);
>>>>>>> f89cda3564d913438379992919d5bbdc0ff5f024
 }
 }
}
