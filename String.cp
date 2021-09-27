#line 1 "C:/Users/Git/ColourSampling/String.c"
#line 1 "c:/users/git/coloursampling/string.h"
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
#line 5 "C:/Users/Git/ColourSampling/String.c"
struct Constants str_vars;

char string[ 10 ][ 64 ];
int enum_val;
const code char *com[12]={
 "CONFIG",
 "SETALL",
 "SETR",
 "SETG",
 "SETB",
 "SETC"
 "READALL",
 "READR",
 "READG",
 "READB",
 "READC",
 "READTEMP"
};


PString InitString(char cmp){
 PString str_t;
 str_t.c = cmp;
 str_t.StrSplitFp = strsplit;
}
#line 34 "C:/Users/Git/ColourSampling/String.c"
int DoStrings(int num){
char *str;
 char *result,conf[64] = "";
 char txtR[6];
 int res;
 res = -1;
 clr_str_arrays(string);
 memcpy(conf,readbuff,num);
 result = setstr(conf);
 res = strsplit(result,'+');
 res = StrChecker(string[1]);

 memset(writebuff,0,64);

 sprintf(txtR,"%u",res);
 strcat(writebuff,txtR);
 testStrings(&writebuff);
 strcat(writebuff,"\r\n");
 while(!HID_Write(&writebuff,64));
#line 77 "C:/Users/Git/ColourSampling/String.c"
ret:
 return 0;
}
#line 84 "C:/Users/Git/ColourSampling/String.c"
void clr_str_arrays(char str[10][64]){
int i,j;
 for(i = 0;i < 10;i++){
 for(j = 0;j<64;j++){
 str[i][j] = 0;
 }
 }
}
#line 96 "C:/Users/Git/ColourSampling/String.c"
char* setstr(char conf[64]){
 int i;
 for(i=0;i < 64;i++){
 if((conf[i] == 0x0D)|| (conf[i] == 0x0A))
 break;
 }
 conf[i+1] = 0;

 return conf;
}
#line 110 "C:/Users/Git/ColourSampling/String.c"
int strsplit(char str[64], char c){
int i,ii,kk;
 ii=kk=0;
 for (i = 0; i < 64;i++){

 if(str[i] == c){
 string[kk][ii] = 0;
 kk++;
 ii=0;
 goto endb;
 }else{
 string[kk][ii] = str[i];
 ii++;
 }

endb:
 if(str[i]==0)
 break;
 }
 return kk;
}
#line 135 "C:/Users/Git/ColourSampling/String.c"
int StrChecker(char str[64]){
 int i;
 for(i = 0;i < 12;i++){
 if(strncmp(str,com[i],strlen(com[i]))==0)
 break;
 }
 return i;
}
#line 147 "C:/Users/Git/ColourSampling/String.c"
void testStrings(char* writebuff){
 if(strlen(string[0])!=0)strncat(writebuff,string[0],strlen(string[0]));
 if(strlen(string[1])!=0)strncat(writebuff,string[1],strlen(string[1]));
 if(strlen(string[2])!=0)strncat(writebuff,string[2],strlen(string[2]));
 if(strlen(string[3])!=0)strncat(writebuff,string[3],strlen(string[3]));
 if(strlen(string[4])!=0)strncat(writebuff,string[4],strlen(string[4]));
 if(strlen(string[5])!=0)strncat(writebuff,string[5],strlen(string[5]));

}
#line 160 "C:/Users/Git/ColourSampling/String.c"
void WriteData(char *_data){


 memset(writebuff,0,64);
 strncat(writebuff,_data,strlen(_data));
 HID_Write(&writebuff,64);
}
#line 171 "C:/Users/Git/ColourSampling/String.c"
char* Read_Send_AllColour(){
char txtR[6];
char *str;
 TCS3472_getRawData(RawData);

 str = "C || R | G | B | = || ";
 sprintf(txtR,"%u",RawData[0]);
 strcat(str,txtR);
 strcat(str," || ");

 sprintf(txtR,"%u",RawData[1]);
 strcat(str,txtR);
 strcat(str," | ");

 sprintf(txtR,"%u",RawData[2]);
 strcat(str,txtR);
 strcat(str," | ");

 sprintf(txtR,"%u",RawData[3]);
 strcat(str,txtR);
 strcat(str," || ");

 CCT =TCS3472_CalcColTemp_dn40(&RawData,it);
 sprintf(txtR,"%u",CCT);
 strcat(str,txtR);
 strcat(str," ||\r\n");

 return str;
}

void Read_Send_OneColour(int colr){
unsigned int col;
char txtR;
char str[64];
 memset(str,'_',64);

 switch(colr){
 case 7:
 col = TCS3472_Read16( 0x16 );
 sprintf(txtR,"%u",col);
 break;
 case 8:
 col = TCS3472_Read16( 0x18 );
 sprintf(txtR,"%u",col);
 break;
 case 9:
 col = TCS3472_Read16( 0x1A );
 sprintf(txtR,"%u",col);
 break;
 case 10:
 col = TCS3472_Read16( 0x14 );
 sprintf(txtR,"%u",col);
 break;
 }
 WriteData(str);
 WriteData("\r\n");
}
