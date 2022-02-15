#line 1 "C:/Users/Git/ColourSampling/String.c"
#line 1 "c:/users/git/coloursampling/string.h"
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
 TCS3472_3_7 = 0x4D,
 TCS347_11_15 = 0x14,
 TCS347_13_17 = 0x1D
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
extern float FltData[8];
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
void GetScaledValues(int* CRGB,float rgb[3]);
void TCS3472_CalcHSL(float* RGBC);
float max_(float *rgb);
float min_(float *rgb);
#line 1 "c:/users/git/coloursampling/_timers.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/time.h"



struct tm {
 unsigned long tm_sec;
 unsigned long tm_min;
 unsigned long tm_hour;
 unsigned long tm_mday;
 unsigned long tm_mon;
 unsigned long tm_year;
 unsigned long tm_wday;
 unsigned long tm_yday;
 unsigned long tm_isdst;
};









 typedef unsigned long size_t;


typedef unsigned long clock_t;
typedef unsigned long time_t;
#line 1 "c:/users/git/coloursampling/sim800.h"
#line 1 "c:/users/git/coloursampling/string.h"
#line 1 "c:/users/git/coloursampling/_timers.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 13 "c:/users/git/coloursampling/sim800.h"
extern sfr sbit RTS;
extern sfr sbit RTS_Dir;
extern sfr sbit CTS;
extern sfr sbit CTS_Dir;
extern sfr sbit RST;
extern sfr sbit RST_Dir;
extern sfr sbit PWR;
extern sfr sbit PWR_Dir;
extern sfr sbit STAT;
extern sfr sbit STAT_Dir;
#line 36 "c:/users/git/coloursampling/sim800.h"
extern char rcvSimTxt[150];
extern char SimTestTxt[150];
extern char rcvPcTxt[150];




typedef struct{
 char initial_str;
 int init_inc;
 char start: 1;
 int rssi;
 int ber;
 long lastSigMillis;
 int sigStrength;
}Sim800Vars;
extern Sim800Vars SimVars;

struct RingBuffer{
char rcv_txt_fin;
char buff[1000];
unsigned int head;
unsigned int tail;
unsigned int last_head;
unsigned int last_tail;
short head_overflow;
};
extern struct RingBuffer RB;

struct Sim800Flash{
char SimDate[9];
char SimTime[9];
char SimCelNum[20];
char StartCell[20];
char WriteAPIKey[20];
char ReadAPIKey[20];
char APN[20];
char PWD[20];
};

struct sim_lengths{
 int l1;
 int l2;
 int l3;
 int l4;
 int l5;
 int l6;
 int l7;
 int lTotA;
 int mod;
 int l1l2;
 int l1l2l3;
 int l1l2l3l4;
};




void InitGSM3();
void WriteToFlashTemp();
char* GetValuesFromFlash();
void GetStrLengths();
int TestRingPointers();
void AT_Initial();
void WaitForResponse(short dly);
void RingToTempBuf();
void Load_Head_Tail_Pointers();
void RcvSimTxt();
void PwrDownGSM3();
void PwrUpGSM3();
char SetupIOT();
char WaitForSetupSMS(unsigned int Indx);
char GetAPI_Key_SMS();
char GetSMSText();
char ReadMSG(int msg_num);
void TestRecievedSMS(int res);
int RemoveSMSText(int sms_cnt);
int Test_Update_ThingSpeak(float degC);
void SendData(unsigned int* rgbc,float* rgbh,float degC);
char SendSMS(char sms_type,char cellNum);
void TestForOK(char c);
int SignalStrength();
void PWM_SigStrength(int sigstrength);
#line 20 "c:/users/git/coloursampling/_timers.h"
typedef struct{
unsigned long millis;
unsigned int ms;
unsigned int sec;
unsigned int min;
unsigned int hr;
unsigned int day;
unsigned int month;
}Timers;

extern Timers TMR0;

typedef struct{
unsigned int ms;
unsigned int sec;
unsigned int min;
unsigned int hr;
unsigned int lastMin;
unsigned short one_per_sec : 1;
unsigned short one_per_Xmin : 1;
}Timer_Setpoint;

extern Timer_Setpoint T0_SP;



void InitTimers();
void InitTimer1();
void InitTimer4_5();
void Get_Time();
void Day_Month(int hr,int day,int mnth);
void I2C2_TimeoutCallback(char errorCode);
#line 1 "c:/users/git/coloursampling/sim800.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 1 "c:/users/git/coloursampling/string.h"
#line 1 "c:/users/git/coloursampling/lm35.h"








extern sfr sbit LM35_Pin;
extern sfr sbit LM35_Pin_Dir;
#line 27 "c:/users/git/coloursampling/lm35.h"
void setup_LM35(int count);
int LM35_Adc_Average(int* adc,int adc_pin);
int LM35_Adc_Single(int adc,int adc_pin);
void getLM35Temp(float * t,int adc_ave);
#line 1 "c:/users/git/coloursampling/pid.h"
#line 29 "c:/users/git/coloursampling/pid.h"
typedef struct{
 char control;
 float PID_Kp, PID_Ki, PID_Kd;
 float PID_Err;
 float PID_Integrated;
 float PID_DiffValue;
 float PID_Prev_Integrated;
 float PID_Prev_Input;
 float PID_MinOutput, PID_MaxOutput;
 float Err;
 int PID_OffSet;
 int Result;
 unsigned short PID_First_Time:1;
}_PID;

extern _PID PID_;







char PID_Control(char *PID);




void Init_PID(float Kp, float Ki, float Kd, int MinOutput, int MaxOutput,int Offset);









void Reset_PID();


int PID_Calculate(float Sp, float Pv);
#line 25 "c:/users/git/coloursampling/config.h"
extern unsigned short i;
extern char kk;

extern sfr sbit RD;
extern sfr sbit GR;
extern sfr sbit BL;

extern unsigned int current_duty2, current_duty3;
extern unsigned int pwm_period2, pwm_period3;






void ConfigPic();
void FSCM_SetUP();
void InitUart1();
void InitUart2();
void InitISR();
void WriteData(char *_data);
void I2C2_SetTimeoutCallback(unsigned long timeout, void (*I2C_timeout)(char));
void SetLedPWM();
#line 1 "c:/users/git/coloursampling/flash_r_w.h"
#line 1 "c:/users/git/coloursampling/string.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 20 "c:/users/git/coloursampling/flash_r_w.h"
extern unsigned long FLASH_Settings_VAddr;
extern unsigned long FLASH_Settings_PAddr;


unsigned int NVMWriteWord (void* address, unsigned long _data);
unsigned int NVMWriteRow (void* address, void* _data);
unsigned int NVMErasePage(void* address);
unsigned int NVMUnlock(unsigned int nvmop);
void NVMRead(void* addr,struct Thresh *vals);
unsigned long ReadFlashWord();
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"
#line 1 "c:/users/git/coloursampling/tcs3472.h"
#line 1 "c:/users/git/coloursampling/sim800.h"
#line 1 "c:/users/git/coloursampling/lm35.h"
#line 20 "c:/users/git/coloursampling/string.h"
extern char string[ 21 ][ 64 ];

enum ControlColorIO{
CONFIG,
SENDC,
SENDR,
SENDG,
SENDB,
SENDA,
READA,
READR,
READG,
READB,
READC,
READT,
READT_DN40,
READA_SCL,
READA_THV,
WRITE_MAN,
WRITE_RAW,
START,
CANCEL,
READA_HUE,
READA_DEG,
ERROR
};

struct Constants{
 unsigned int num_string;
};


typedef struct pstrings_t{
 char* str;
 char c;
 char string[ 21 ][ 64 ];
 int (*StrSplitFp)(char* str,char c);
}PString;

struct Thresh{

 uint16_t C_thresh;
 uint16_t R_thresh;
 uint16_t G_thresh;
 uint16_t B_thresh;
 uint16_t time_to_log;
};
extern struct Thresh Threshold;



extern char readbuff[64];
extern char writebuff[64];



int DoStrings(int num);
PString InitString(char cmp);
int StrChecker(char **arr);
char* findnumber(char* str);
int strsplit(char* str,char c);
void strsplit2(char**mdarr,char str[250], char c);
void testStrings(char* writebuff);
char* setstr(char conf[250]);
void clr_str_arrays(char *str[10]);
char* RemoveWhiteSpace(char* str);
char* Read_Send_AllColour(short data_src);
char* Read_Send_OneColour(int colr);
char* ReadHUE();
char* Read_Thresholds();
char* Write_Thresholds(short data_src);
int Get_It();
int Get_Gain();
char* TestFlash();
char* RemoveChars(char* str,char a,char b);
void PrintHandler(char c);
#line 5 "C:/Users/Git/ColourSampling/String.c"
int ave_adc_;
float temp_[4];
char txt_[15];

struct Constants str_vars;
struct Thresh Threshold;
char string[ 21 ][ 64 ];

const code char *comc[13]={
 "T",
 "G"
};

const code char *com[22]={
 "CONFIG"
 ,"SENDC"
 ,"SENDR"
 ,"SENDG"
 ,"SENDB"
 ,"SENDA"
 ,"READA"
 ,"READR"
 ,"READG"
 ,"READB"
 ,"READC"
 ,"READT"
 ,"READT_DN40"
 ,"READA_SCL"
 ,"READA_THV"
 ,"WRITE_MAN"
 ,"WRITE_RAW"
 ,"START"
 ,"CANCEL"
 ,"READA_HUE"
 ,"READA_DEG"
 ,"ERROR"
};

PString InitString(char cmp){
 PString str_t;
 str_t.c = cmp;
 str_t.StrSplitFp = strsplit;
}
#line 52 "C:/Users/Git/ColourSampling/String.c"
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
 if(res0 > 0)
 res1 = StrChecker(string[1]);
 else
 res1 =  ((ERROR - CONFIG)+1) ;
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
 case SENDA :
 break;
 case READA :
 str = Read_Send_AllColour(0);
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
 case READA_SCL :
 str = Read_Send_AllColour(1);
 break;
 case READA_THV :
 str = Read_Thresholds();
 break;
 case WRITE_MAN :
 str = Write_Thresholds(1);
 break;
 case WRITE_RAW :
 str = Write_Thresholds(0);
 break;
 case START :
 SimVars.init_inc = 5;
 break;
 case CANCEL :
 SimVars.init_inc = 3;
 break;
 case READA_HUE :
 str = ReadHUE();
 break;
 case READA_DEG :
 LM35_Adc_Average(&ave_adc_, 15 );
 getLM35Temp(temp_,ave_adc_);
 ave_adc_ = 0;
 sprintf(txt_,"%3.2f",temp_[1]);
 str = txt_;


 break;
 default:
 str = "No data requested!\r\n";
 break;
 }



 strncat(writebuff,str,strlen(str));
 while(!HID_Write(&writebuff,64));



ret:
 return 0;
}
#line 184 "C:/Users/Git/ColourSampling/String.c"
void clr_str_arrays(char str[ 21 ][ 64 ]){
int i,j;
 for(i = 0;i < 20;i++){
 for(j = 0;j<64;j++){
 str[i][j] = 0;
 }

 }
}
#line 197 "C:/Users/Git/ColourSampling/String.c"
char* setstr(char conf[250]){
 int i;
 for(i=0;i < strlen(conf);i++){
 if(conf[i] == '\0')
 break;
 }
 conf[i] = 0;

 return conf;
}
#line 211 "C:/Users/Git/ColourSampling/String.c"
int strsplit(char str[250], char c){
int i,ii,kk,err,lasti;
 ii=kk=err=lasti=0;
 for (i = 0; i < 250;i++){
 err = i - lasti;
 if(str[i] == c || err > 62){
 string[kk][ii] = 0;
 kk++;
 ii=err=0;
 lasti = i;
 continue;
 }else{
 string[kk][ii] = str[i];
 ii++;
 }

 if(str[i]==0)
 break;
 }
 return kk;
}
#line 236 "C:/Users/Git/ColourSampling/String.c"
char* findnumber(char* str){
char* temp;
int i,j;

 temp = (char*)Malloc(strlen(str));

 for(i = 0;i < strlen(str);i++){
 if((str[i] > 0x29)&& (str[i] < 0x40)){
 temp[i] = str[i];
 }
 }
 temp[i] = 0;
 Free(temp,sizeof(temp));
 return temp;
}
#line 256 "C:/Users/Git/ColourSampling/String.c"
int StrChecker(char *str){
static int enum_val;
static bit once;
int i,length;
 if(!once){
 once = 1;
 enum_val =  ((ERROR - CONFIG)+1) ;
 }
 length = strlen(str);
 if(length < 5){
 return 21;
 }
 for(i = 0;i < enum_val;i++){
 if(strncmp(str,com[i],length)==0)
 break;
 }
 return i;
}
#line 278 "C:/Users/Git/ColourSampling/String.c"
char* RemoveWhiteSpace(char* str){
char* temp;
int i,j;
j=0;
 for(i=0;i<strlen(str)+1;i++){
 if(str[i] == 0x20)
 continue;
 temp[j] = str[i];
 j++;
 }
 return temp;
}
#line 294 "C:/Users/Git/ColourSampling/String.c"
char* RemoveChars(char* str,char a,char b){
char *temp;
int i=0;
 temp = (char*)Malloc(100*sizeof(char*));


 if(a != 0x02){
 temp = strchr(str,a);
 strcpy(str,temp+1);
 }else{
 strncpy(temp,str,strlen(temp)+1);
 }
 for(i=0;i<strlen(temp)+1;i++){
 if(*(temp+i)==b)
 break;
 *(temp+i) = *(str+i);
 }
 *(temp+i) = 0;

 Free(temp,100*sizeof(char*));
 return temp;
}
#line 320 "C:/Users/Git/ColourSampling/String.c"
void WriteData(char *_data){


 memset(writebuff,0,64);
 strncpy(writebuff,_data,strlen(_data));
 HID_Write(&writebuff,64);
}
#line 331 "C:/Users/Git/ColourSampling/String.c"
char* Read_Send_AllColour(short data_src){
char txtR[15];
char str[64];
unsigned int cct;
int err;

 PWM_Start(2);
 Delay_ms(500);


 TCS3472_getRawData(RawData);

 if(data_src)
 GetScaledValues(RawData,FltData);


 if(!data_src ){
 strcpy(str,"C || R | G | B | = || ");
 sprintf(txtR,"%u",RawData[0]);

 }else{
 strcpy(str,"|| R | G | B | = || ");
 sprintf(txtR,"%3.2f",FltData[0]);
 }
 strcat(str,txtR);
 strcat(str," || ");

 if(!data_src )
 sprintf(txtR,"%u",RawData[1]);
 else
 sprintf(txtR,"%3.2f",FltData[1]);
 strcat(str,txtR);
 strcat(str," | ");

 if(!data_src )
 sprintf(txtR,"%u",RawData[2]);
 else
 sprintf(txtR,"%3.2f",FltData[2]);
 strcat(str,txtR);
 strcat(str," | ");

 if(!data_src ) {
 sprintf(txtR,"%u",RawData[3]);
 strcat(str,txtR);
 strcat(str," || ");

 err = TCS3472_C2RGB_Error(RawData);
 sprintf(txtR,"%5d",err);
 strcat(str,txtR);
 strcat(str," || \r\n");
 }else
 strcat(str,"\r\n");


 PWM_Stop(2);
 return &str;
}
#line 392 "C:/Users/Git/ColourSampling/String.c"
char* Read_Send_OneColour(int colr){
unsigned int col;
char txtR[10];
char str[64];

 PWM_Start(2);
 Delay_ms(500);
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
 PWM_Stop(2);
 return &str;
}
#line 452 "C:/Users/Git/ColourSampling/String.c"
char* ReadHUE(){
char str[64];
char txtF[15];
char txtG[15];
char txtH[15];
float HUE,LUMENANCE,SATURATION;

 PWM_Start(2);
 Delay_ms(500);
 memset(str,0,64);

 TCS3472_getRawData(RawData);
 GetScaledValues(RawData,&FltData);
 TCS3472_CalcHSL(&FltData);

 sprintf(txtF,"%3.2f",FltData[4]);
 sprintf(txtG,"%3.2f",FltData[5]);
 sprintf(txtH,"%3.2f",FltData[6]);

 strcpy(str,"HUE, SAT, LUM  || ");
 strcat(str,txtF);
 strcat(str," | ");
 strcat(str,txtG);
 strcat(str," | ");
 strcat(str,txtH);
 strcat(str," ||\r\n ");
 PWM_Stop(2);
 return &str;
}


int Get_It(){
 return 0;
}

int Get_Gain(){
 return 0;
}
#line 494 "C:/Users/Git/ColourSampling/String.c"
char* Read_Thresholds(){
char txtR[25];
char str[64];
unsigned long Val;

 NVMRead(FLASH_Settings_VAddr,&Threshold);

 strcpy(str,"Cth || Rth | Gth | Bth | = || ");
 sprintf(txtR,"%u",Threshold.C_thresh);
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
 strcat(str," | ");

 sprintf(txtR,"%u",Threshold.time_to_log);
 strcat(str,txtR);
 strcat(str," ||\r\n ");

 return &str;
}
#line 528 "C:/Users/Git/ColourSampling/String.c"
char* Write_Thresholds(short data_src){
unsigned long val[128];
unsigned long pos;
int i,err;
char txtR[15];
char str[64];
 pos = FLASH_Settings_PAddr;
 for(i=1;i<128;i++)
 val[i] = 0x00000000;


 if(!data_src)
 TCS3472_getRawData(RawData);

 if(data_src){
 if(string[2] != 0)
 val[0] = atol(string[2]);
 }
 else
 val[0] = RawData[0];
 err = NVMWriteWord(pos,val[0]);

 pos += 4;
 if(data_src){
 if(string[3] != 0)
 val[1] = atol(string[3]);
 }else
 val[1] = RawData[1];
 err = NVMWriteWord(pos,val[1]);

 pos += 4;
 if(data_src){
 if(string[4] != 0)
 val[2] = atol(string[4]);
 }
 else
 val[2] = RawData[2];
 err = NVMWriteWord(pos,val[2]);

 pos += 4;
 if(data_src){
 if(string[5] != 0)
 val[3] = atol(string[5]);
 }
 else
 val[3] = RawData[3];
 err = NVMWriteWord(pos,val[3]);

 pos += 4;
 if(!data_src){
 if(string[5] !=  ((void *)0) )
 val[4] = atol(string[5]);
 err = NVMWriteWord(pos,val[4]);
 }




 sprintf(txtR,"%x",err);
 strcpy(str,txtR);
 strcat(str," \r\n ");
 return str;
}
#line 595 "C:/Users/Git/ColourSampling/String.c"
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
 char* tr = "112233";







 Val = ReadFlashWord();


 strcpy(str,"Val || ");
 LongWordToHex(Val,txtR);

 strcat(str,txtR);
 strcat(str," || ");

 sprintf(txtR,"%u",res);
 strcat(str,txtR);
 strcat(str," ||\r\n ");

 return &str;
}
#line 662 "C:/Users/Git/ColourSampling/String.c"
void PrintHandler(char c){

 UART1_Write(c);

}
