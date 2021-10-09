#line 1 "C:/Users/Git/ColourSampling/String.c"
#line 1 "c:/users/git/coloursampling/string.h"
#line 1 "c:/users/git/coloursampling/flash_r_w.h"
#line 1 "c:/users/git/coloursampling/string.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 17 "c:/users/git/coloursampling/flash_r_w.h"
extern unsigned long FLASH_Settings_VAddr;
extern unsigned long FLASH_Settings_PAddr;


unsigned int NVMWriteWord (void* address, unsigned long _data);
unsigned int NVMWriteRow (void* address, void* _data);
unsigned int NVMErasePage(void* address);
unsigned int NVMUnlock(unsigned int nvmop);
void NVMRead(void* addr,struct Thresh *vals);
unsigned long ReadFlash();
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
#line 1 "c:/users/git/coloursampling/tcs3472.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 8 "c:/users/git/coloursampling/tcs3472.h"
extern sfr TCS3472_Initialised;
#line 73 "c:/users/git/coloursampling/tcs3472.h"
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
int TCS3472_C2RGB_Error(unsigned int* RGBC);
void GetScaledValues(char* CRGB);
#line 18 "c:/users/git/coloursampling/string.h"
extern char string[ 20 ][ 64 ];

enum ControlColorIO{
CONFIG,
SETA,
SETR,
SETG,
SETB,
SETC,
READA,
READR,
READG,
READB,
READC,
READT,
READT_DN40,
READA_SCL,
WRITE_SCL
};

struct Constants{
 unsigned int num_string;
};


typedef struct pstrings_t{
 char* str;
 char c;
 char string[ 20 ][ 64 ];
 int (*StrSplitFp)(char* str,char c);
}PString;

struct Thresh{
 uint16_t C_thresh;
 uint16_t R_thresh;
 uint16_t G_thresh;
 uint16_t B_thresh;
};




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
char* Read_Send_OneColour(int colr);
char* Read_Thresholds();
char* Write_Thresholds();
int Get_It();
int Get_Gain();
char* TestFlash();
#line 5 "C:/Users/Git/ColourSampling/String.c"
struct Constants str_vars;
struct Thresh Threshold;
char string[ 20 ][ 64 ];

const code char *comc[13]={
 "T",
 "G"
};
const code char *com[15]={
 "CONFIG",
 "SETA",
 "SETR",
 "SETG",
 "SETB",
 "SETC",
 "READA",
 "READR",
 "READG",
 "READB",
 "READC",
 "READT",
 "READT_DN40",
 "READA_SCL",
 "WRITE_SCL"
};


PString InitString(char cmp){
 PString str_t;
 str_t.c = cmp;
 str_t.StrSplitFp = strsplit;
}
#line 41 "C:/Users/Git/ColourSampling/String.c"
int DoStrings(int num){
char *str,err,i;
 char *result,conf[64] = "";
 char txtR[6];
 int res0,res1,Int_Time,Gain;



 res0 = -1;
 clr_str_arrays(string);
 memcpy(conf,readbuff,num);
 result = setstr(conf);
 res0 = strsplit(result,'+');
 res1 = StrChecker(string[1]);

 memset(writebuff,0,64);









 switch(res1){
 case CONFIG :
 if(!strcmp(string[2],comc[0])){
 if(string[3] != 0){
 Int_Time = atoi(string[3]);
 for(i=0;i<Int_Time;i++){
 LATE3_bit = !LATE3_bit;
 Delay_ms(100);
 }
 }
 err = TCS3472_SetIntergration_Time(Int_Time);
 if(err > 0)
 for(i=0;i<err;i++){
 LATE3_bit = !LATE3_bit;
 Delay_ms(500);
 }
 }else if(!strcmp(string[2],comc[1])){
 if(string[3] != 0){
 Gain = atoi(string[3]);
 for(i=0;i<Gain;i++){
 LATE3_bit = !LATE3_bit;
 Delay_ms(100);
 }
 }
 err = TCS3472_SetGain(Gain);
 if(err > 0)
 for(i=0;i<err;i++){
 LATE3_bit = !LATE3_bit;
 Delay_ms(500);
 }
 }
 LATE3_bit = 0;
 break;
 case READA :
 str = Read_Send_AllColour();
 break;
 case READR :
 str = Read_Send_OneColour(READR);
 break;
 case READG :
 str = Read_Send_OneColour(READG);
 break;
 case READB :
 str = Read_Send_OneColour(READB);
 break;
 case READC :
 str = Read_Send_OneColour(READC);
 break;
 case READT :
 str = Read_Send_OneColour(READT);
 break;
 case READT_DN40 :
 str = Read_Send_OneColour(READT_DN40);
 break;
 case READT_DN40 :
 str = Read_Send_OneColour(READT_DN40);
 break;
 case READA_SCL :
 str = TestFlash();
 break;
 case WRITE_SCL :
 str = Write_Thresholds();
 break;
 default:
 strncat(str,"No data requested!",18);
 break;
 }



 strncat(writebuff,str,strlen(str));
 while(!HID_Write(&writebuff,64));


ret:
 return 0;
}
#line 147 "C:/Users/Git/ColourSampling/String.c"
void clr_str_arrays(char str[20][64]){
int i,j;
 for(i = 0;i < 20;i++){
 for(j = 0;j<64;j++){
 str[i][j] = 0;
 }

 }
}
#line 160 "C:/Users/Git/ColourSampling/String.c"
char* setstr(char conf[64]){
 int i;
 for(i=0;i < 64;i++){
 if((conf[i] == 0x0D)|| (conf[i] == 0x0A))
 break;
 }
 conf[i+1] = 0;

 return conf;
}
#line 174 "C:/Users/Git/ColourSampling/String.c"
int strsplit(char str[64], char c){
int i,ii,kk;
 ii=kk=0;
 for (i = 0; i < 64;i++){
 if(str[i] == c){
 string[kk][ii] = 0;
 kk++;
 ii=0;
 continue;
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
#line 198 "C:/Users/Git/ColourSampling/String.c"
int StrChecker(char *str){
static int enum_val;
static bit once;
int i;
 if(!once){
 once = 1;
 enum_val =  (WRITE_SCL - CONFIG)+1 ;
 }
 for(i = 0;i < enum_val;i++){
 if(strncmp(str,com[i],strlen(str)-1)==0)
 break;
 }
 return i;
}
#line 216 "C:/Users/Git/ColourSampling/String.c"
void WriteData(char *_data){


 memset(writebuff,0,64);
 strncpy(writebuff,_data,strlen(_data));
 HID_Write(&writebuff,64);
}
#line 227 "C:/Users/Git/ColourSampling/String.c"
char* Read_Send_AllColour(){
float c,r,g,b;
char txtR[15];
char str[64];
unsigned int cct;
int err;
 TCS3472_getRawData(RawData);

 strcpy(str,"C || R | G | B | = || ");
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


 err = TCS3472_C2RGB_Error(RawData);
 sprintf(txtR,"%5d",err);
 strcat(str,txtR);
 strcat(str," ||\r\n");

 return &str;
}
#line 264 "C:/Users/Git/ColourSampling/String.c"
char* Read_Send_OneColour(int colr){
unsigned int col;
char txtR[10];
char str[64];
 switch(colr){
 case READR:
 col = TCS3472_Read16( 0x16 );
 strcpy(str,"R = || ");
 sprintf(txtR,"%5u",col);
 strcat(str,txtR);
 strcat(str," ||\r\n");
 break;
 case READG:
 col = TCS3472_Read16( 0x18 );
 strcpy(str,"G = || ");
 sprintf(txtR,"%5u",col);
 strcat(str,txtR);
 strcat(str," ||\r\n");
 break;
 case READB:
 col = TCS3472_Read16( 0x1A );
 strcpy(str,"B = || ");
 sprintf(txtR,"%u",col);
 strcat(str,txtR);
 strcat(str," ||\r\n");
 break;
 case READC:
 col = TCS3472_Read16( 0x14 );
 strcpy(str,"C = || ");
 sprintf(txtR,"%u",col);
 strcat(str,txtR);
 strcat(str," ||\r\n");
 break;
 case READT:
 TCS3472_getRawData(RawData);
 col = TCS3472_CalcColTemp(RawData[1],RawData[3],RawData[3]);
 strcpy(str,"T = || ");
 sprintf(txtR,"%u",col);
 strcat(str,txtR);
 strcat(str," ||\r\n");
 break;
 case READT_DN40:
 TCS3472_getRawData(RawData);
 col = TCS3472_CalcColTemp_dn40(RawData,it);
 strcpy(str,"T_DN40 = || ");
 sprintf(txtR,"%u",col);
 strcat(str,txtR);
 strcat(str," ||\r\n");
 break;
 }
 return &str;
}

int Get_It(){
 return 0;
}

int Get_Gain(){
 return 0;
}
#line 328 "C:/Users/Git/ColourSampling/String.c"
char* Read_Thresholds(){
char txtR[15];
char str[64];
unsigned long Val;


 Val = 321;
 Val = ReadFlash();


 strcpy(str,"Cth || Rth | Gth | Bth | = || ");
 sprintf(txtR,"%u",Val);
 strcat(str,txtR);
 strcat(str," || ");

 sprintf(txtR,"%u",Threshold.R_thresh);
 strcat(str,txtR);
 strcat(str," | ");

 sprintf(txtR,"%u",Threshold.G_thresh);
 strcat(str,txtR);
 strcat(str," | ");

 sprintf(txtR,"%u",Threshold.B_thresh);
 strcat(str,txtR);
 strcat(str," ||\r\n ");

 return &str;
}
#line 361 "C:/Users/Git/ColourSampling/String.c"
char* Write_Thresholds(){
unsigned int PtrPos;
int i,err;
char txtR[15];
char str[64];


 PtrPos = FLASH_Settings_PAddr;

 if(string[2] != 0){
 Threshold.R_thresh = atoi(string[2]);
 err = NVMWriteWord(FLASH_Settings_PAddr,Threshold.C_thresh);
 }
#line 394 "C:/Users/Git/ColourSampling/String.c"
 sprintf(txtR,"%x",err);
 strcpy(str,txtR);
 strcat(str," ||\r\n ");
 return str;
}
#line 403 "C:/Users/Git/ColourSampling/String.c"
void testStrings(char* writebuff){
 if(strlen(string[0])!=0){
 strncat(writebuff,string[0],strlen(string[0]));
 strcat(writebuff,":");
 }
 if(strlen(string[1])!=0){
 strncat(writebuff,string[1],strlen(string[1]));
 strcat(writebuff,":");
 }
 if(strlen(string[2])!=0){
 strncat(writebuff,string[2],strlen(string[2]));
 strcat(writebuff,":");
 }
 if(strlen(string[3])!=0){
 strncat(writebuff,string[3],strlen(string[3]));
 strcat(writebuff,":");
 }
 if(strlen(string[4])!=0){
 strncat(writebuff,string[4],strlen(string[4]));
 strcat(writebuff,":");
 }
 if(strlen(string[5])!=0){
 strncat(writebuff,string[5],strlen(string[5]));
 strcat(writebuff,":");
 }
 if(strlen(string[6])!=0){
 strncat(writebuff,string[6],strlen(string[6]));
 strcat(writebuff,":");
 }

}

char* TestFlash(){
char txtR[20];
char str[64];
unsigned long val[128];
unsigned long Val;
unsigned int res,i;

Val = 0x1234afaf;
 for(i=0;i<128;i++)
 val[i] = 0x1234bfaf;

 res = NVMErasePage(FLASH_Settings_PAddr);

 res = NVMWriteWord(FLASH_Settings_PAddr,Val);
 Val = ReadFlash();


 strcpy(str,"Val || ");
 LongWordToHex(Val,txtR);

 strcat(str,txtR);
 strcat(str," || ");

 sprintf(txtR,"%u",res);
 strcat(str,txtR);
 strcat(str," ||\r\n ");

 return &str;
}
