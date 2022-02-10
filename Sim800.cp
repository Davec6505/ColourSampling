#line 1 "C:/Users/Git/ColourSampling/Sim800.c"
#line 1 "c:/users/git/coloursampling/sim800.h"
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
#line 24 "c:/users/git/coloursampling/config.h"
extern unsigned short i;
extern char kk;

extern sfr sbit RD;
extern sfr sbit GR;
extern sfr sbit BL;

extern unsigned int current_duty2, current_duty3;
extern unsigned int pwm_period2, pwm_period3;






void ConfigPic();
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
#line 34 "c:/users/git/coloursampling/sim800.h"
extern char rcvSimTxt[150];
extern char SimTestTxt[150];
extern char rcvPcTxt[150];




typedef struct{
 char initial_str;
 char init_inc;
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
#line 26 "C:/Users/Git/ColourSampling/Sim800.c"
const char str_api[] = "GET https://api.thingspeak.com/update?api_key=";
const char field1[] = "&field1=";
const char field2[] = "&field2=";
const char field3[] = "&field3=";
const char field4[] = "&field4=";
const char field5[] = "&field5=";
const char field6[] = "&field6=";
const char field7[] = "&field7=";
const char field8[] = "&field8=";
const char sms_test[] = "+CMTI";

struct sim_lengths SL ={
 0,0,0,0,0,0
};
#line 44 "C:/Users/Git/ColourSampling/Sim800.c"
sbit RTS at LATB1_bit;

sbit CTS at RE9_bit;

sbit RST at LATB2_bit;

sbit PWR at LATD0_bit;

sbit STAT at RB4_bit;



 char a[6], b[6], c[6], d[6], e[6], f[6];
#line 65 "C:/Users/Git/ColourSampling/Sim800.c"
char buff[512];
unsigned long temp[128];
#line 71 "C:/Users/Git/ColourSampling/Sim800.c"
char rcvSimTxt[200];
char SimTestTxt[200];
char rcvPcTxt[200];
char sms[6];
#line 80 "C:/Users/Git/ColourSampling/Sim800.c"
char txtA[6];
char txtS[6];
char txtM[6];
char txtH[20];
#line 88 "C:/Users/Git/ColourSampling/Sim800.c"
char txtC[15];
char txtR[15];
char txtG[15];
char txtB[15];
char txtR_Scl[15];
char txtG_Scl[15];
char txtB_Scl[15];
char txtHUE[15];
char txtLUM[15];
char txtSAT[15];
char txtDegC[15];
char txtLen[6];

Sim800Vars SimVars = {
 0,
 0,
 0
};

struct RingBuffer RB;
struct Sim800Flash SF;
#line 113 "C:/Users/Git/ColourSampling/Sim800.c"
void InitGSM3(){

 SimVars.initial_str = 0;
 SimVars.init_inc = 0;
 *SimTestTxt = "Hello World this is a test";
 RB.head = 0;
 RB.tail = 0;
 RB.rcv_txt_fin = -1;
 memset(SF.SimCelNum,0,sizeof(SF.SimCelNum));
 memset(SF.StartCell,0,sizeof(SF.StartCell));
 memset(SF.WriteAPIKey,0,sizeof(SF.WriteAPIKey));
 memset(SF.ReadAPIKey,0,sizeof(SF.ReadAPIKey));
 memset(SF.APN,0,sizeof(SF.APN));
 memset(SF.PWD,0,sizeof(SF.PWD));
}
#line 132 "C:/Users/Git/ColourSampling/Sim800.c"
void PwrUpGSM3(){
 RST = 0;
 PWR = 1;
 Delay_ms(1000);
 PWR = 0;

 while(STAT){
 LATE3_bit = !LATE3_bit;
 Delay_ms(100);
 }
 LATA10_bit = STAT;
 LATE3_bit = 0;
 Delay_ms(5000);

}
#line 151 "C:/Users/Git/ColourSampling/Sim800.c"
void WriteToFlashTemp(){
unsigned long pos;
static int i,j;

 GetStrLengths();

 memset(buff,0,512);
 memcpy(buff,SF.SimCelNum,SL.l1);
 memcpy(buff+SL.l1,SF.WriteAPIKey,SL.l2);
 memcpy(buff+SL.l1l2,SF.ReadAPIKey,SL.l3);
 memcpy(buff+SL.l1l2l3,SF.APN,SL.l4);
 memcpy(buff+SL.l1l2l3l4,SF.PWD,SL.l5);

 for(i=1;i<128;i++)
 temp[i] = 0x00000000;

 memcpy(temp,buff,SL.lTotA+4);

 pos = FLASH_Settings_PAddr;



 j = NVMErasePage(pos);
 if(j==0){
 pos += 20;
 for(i=0;i<128;i++){

 j = NVMWriteWord(pos,temp[i]);
 pos += 4;

 }

 }



 sprintf(a,"%d",i);
 sprintf(b,"%d",j);
 PrintOut(PrintHandler, "\r\n"
 " * flash write: %s*\r\n"
 " * flash err:   %s\r\n"
 ,a,b);

}
#line 199 "C:/Users/Git/ColourSampling/Sim800.c"
char* GetValuesFromFlash(){
unsigned long i,j;
char *ptr;
 GetStrLengths();
 ptr = (unsigned char*)FLASH_Settings_VAddr;
 ptr += 20;

 for(i=0;i<SL.lTotA;i++){
 buff[i] = ptr[i];

 UART1_Write(buff[i]);
 UART1_Write(0x3A);

 }
 strncpy(SF.SimCelNum,buff,SL.l1);
 strncpy(SF.WriteAPIKey,buff+SL.l1,SL.l2);
 strncpy(SF.ReadAPIKey,buff+SL.l1l2,SL.l3);
 strncpy(SF.APN,buff+SL.l1l2l3,SL.l4);
 strncpy(SF.PWD,buff+SL.l1l2l3l4,SL.l5);

 PrintOut(PrintHandler, " * Flash Read        \r\n"
 " * SF.SimCelNum:   %s\r\n"
 " * SF.WriteAPIKey: %s\r\n"
 " * SF.ReadAPIKey:  %s\r\n"
 " * SF.APN:         %s\r\n"
 " * SF.PWD:         %s\r\n"
 ,SF.SimCelNum,SF.WriteAPIKey
 ,SF.ReadAPIKey,SF.APN,SF.PWD);

 return SF.SimCelNum;
}
#line 234 "C:/Users/Git/ColourSampling/Sim800.c"
void GetStrLengths(){

 SL.l1 = sizeof(SF.SimCelNum)-1;
 SL.l2 = sizeof(SF.WriteAPIKey)-1;
 SL.l3 = sizeof(SF.ReadAPIKey)-1;
 SL.l4 = sizeof(SF.APN)-1;
 SL.l5 = sizeof(SF.PWD)-1;


 SL.lTotA = SL.l1 + SL.l2 + SL.l3 + SL.l4 + SL.l5;
 SL.l1l2 = SL.l1 + SL.l2;
 SL.l1l2l3 = SL.l1l2 + SL.l3;
 SL.l1l2l3l4 = SL.l1l2l3 + SL.l4;

 SL.mod = SL.lTotA % 4;
 SL.mod = 4 - SL.mod;
 SL.lTotA += SL.mod;


 sprintf(a,"%d",SL.l1);
 sprintf(b,"%d",SL.l2);
 sprintf(c,"%d",SL.l3);
 sprintf(d,"%d",SL.l4);
 sprintf(e,"%d",SL.l5);
 sprintf(f,"%d",SL.lTotA);
 PrintOut(PrintHandler, "\r\n"
 " * l1: %s\r\n"
 " * l2: %s\r\n"
 " * l3: %s\r\n"
 " * l4: %s\r\n"
 " * l5: %s\r\n"
 " * lTotA: %s\r\n"
 ,a,b,c,d,e,f);

}
#line 273 "C:/Users/Git/ColourSampling/Sim800.c"
void RcvSimTxt(){
char txt;
 while(UART2_Data_Ready()) {
 if (U2STAbits.FERR || U2STAbits.OERR){
 if (U2STAbits.FERR ){
 U2STAbits.FERR = 0;
 goto m0;
 }
 if(U2STAbits.OERR)
 U2STAbits.OERR = 0;
 }
 m0:
 txt = U2RXREG;
 U1TXREG = txt;
 if(txt >= 0x20){
 RB.buff[RB.head] = txt;
 RB.head++;
 }else if(U2RXREG == 0x0A){
 RB.buff[RB.head] = ',';
 RB.head++;
 }
 if(RB.head > 999){
 RB.head = 0;
 }
 }
 RB.rcv_txt_fin = 1;
}
#line 304 "C:/Users/Git/ColourSampling/Sim800.c"
int TestRingPointers(){
int diff;
 if(RB.tail > RB.head){
 diff = 1000 - RB.tail;
 diff += RB.head;
 }else{
 diff = RB.head - RB.tail;
 }
 return diff;
}
#line 318 "C:/Users/Git/ColourSampling/Sim800.c"
void WaitForResponse(short dly){
unsigned long lastMillis,newMillis;
 lastMillis = TMR0.millis;
 RB.rcv_txt_fin = 0;
 RB.last_head = RB.head;
 do{
 LATE3_bit = !LATE3_bit;
 if(dly == 0)
 Delay_ms(100);
 else if(dly == 1)
 Delay_ms(500);
 else if(dly == 3){
 UART2_Write_Text("ATE0");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(2000);
 }
 else
 Delay_ms(1000);


 newMillis = TMR0.millis - lastMillis;
 if(newMillis > 59000)
 break;
 }while(!RB.rcv_txt_fin);
 LATE3_bit = 0;
}
#line 349 "C:/Users/Git/ColourSampling/Sim800.c"
void RingToTempBuf(){
int i;
 i=0;
 RB.tail = RB.last_tail;

 while(RB.tail != RB.head){

 if(RB.tail > RB.head && RB.head > 150)
 RB.tail = RB.head;

 SimTestTxt[i] = RB.buff[RB.tail];
#line 364 "C:/Users/Git/ColourSampling/Sim800.c"
 i++;
 RB.tail++;
 if(RB.tail > 999)
 RB.tail = 0;
 };
 SimTestTxt[i++] = 0;

 RB.last_tail = RB.tail;
}
#line 378 "C:/Users/Git/ColourSampling/Sim800.c"
char SetupIOT(){
int res,i,num_strs;
char *str_rcv;
#line 385 "C:/Users/Git/ColourSampling/Sim800.c"
 res = -1;

 PrintOut(PrintHandler, "\r\n"
 " * ATE0\r\n");


 WaitForResponse(3);
 Delay_ms(4000);
 RingToTempBuf();


 PrintOut(PrintHandler, "\r\n"
 " * %s\r\n"
 " * Check if Sim is Registered\r\n"
 ,SimTestTxt);

wait:

 UART2_Write_Text("AT+CREG?");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 WaitForResponse(1);
 Delay_ms(5000);
 RingToTempBuf();


 PrintOut(PrintHandler, "\r\n"
 " * %s\r\n"
 ,SimTestTxt);



 if(RB.head > RB.last_head){

 num_strs = strsplit(SimTestTxt,',');


 sprintf(txtA,"%d",num_strs);
 PrintOut(PrintHandler, "\r\n"
 " *num_strs:= %s\r\n"
 " *string[0]  %s\r\n"
 " *string[1]  %s\r\n"
 " *string[2]  %s\r\n"
 " *string[3]  %s\r\n"
 " *string[4]  %s\r\n"
 ,txtA,string[0]
 ,string[1],string[2]
 ,string[3],string[4]);

 str_rcv = findnumber(string[1]);
 res = atoi(str_rcv);
 if(res == 1){

 sprintf(txtA,"%d",res);
 PrintOut(PrintHandler, "\r\n"
 " *Registered with:= %s\r\n"
 ,txtA);


 }else{

 PrintOut(PrintHandler, "\r\n"
 " *Sim Not Registered\r\n");

 Delay_ms(500);
 goto wait;
 }
 }

 PrintOut(PrintHandler, "\r\n"
 " *Sim Registered\r\n");



 return 1;
}
#line 467 "C:/Users/Git/ColourSampling/Sim800.c"
char WaitForSetupSMS(unsigned int Indx){
int i,res,num_strs;


 UART2_Write_Text("AT+CMGF=1");
 UART2_Write(0x0D);
 UART2_Write(0x0A);


 WaitForResponse(0);
 RingToTempBuf();

 Delay_ms(1000);

 WaitForResponse(0);
 Delay_ms(1000);
 RingToTempBuf();

 num_strs = strsplit(SimTestTxt,',');


 sprintf(txtA,"%d",num_strs);
 sprintf(txtA,"%d",num_strs);
 PrintOut(PrintHandler, "\r\n"
 " *num_strs:= %s\r\n"
 " *string[0]  %s\r\n"
 " *string[1]  %s\r\n"
 " *string[2]  %s\r\n"
 " *string[3]  %s\r\n"
 " *string[4]  %s\r\n"
 " *string[5]  %s\r\n"
 ,txtA,string[0],string[1],
 string[2],string[3],
 string[4],string[5]);


 res = atoi(string[1]);
 sprintf(sms,"%d",res);

 PrintOut(PrintHandler, "\r\n"
 " *sms no:= %s\r\n"
 ,sms);



 UART2_Write_Text("AT+CMGR=");
 UART2_Write_Text(sms);
 UART2_Write(0x0D);
 UART2_Write(0x0A);

 WaitForResponse(1);
 Delay_ms(1000);
 RingToTempBuf();
 num_strs = strsplit(SimTestTxt,',');

 sprintf(txtA,"%d",num_strs);
 PrintOut(PrintHandler, "\r\n"
 " *num_strs:= %s\r\n"
 " *string[0]  %s\r\n"
 " *string[1]  %s\r\n"
 " *string[2]  %s\r\n"
 " *string[3]  %s\r\n"
 " *string[4]  %s\r\n"
 " *string[5]  %s\r\n"
 " *string[6]  %s\r\n"
 " *string[7]  %s\r\n"
 " *string[8]  %s\r\n"
 ,txtA,string[0],string[1]
 ,string[2],string[3]
 ,string[4],string[5]
 ,string[6],string[7]
 ,string[8]);


 if(Indx == 0){

 strncpy(SF.SimCelNum,string[1],strlen(string[1])+11);
 strncpy(SF.SimDate,string[3],strlen(string[3])+1);
 strncpy(SF.SimTime,string[4],8);


 PrintOut(PrintHandler, "\r\n"
 " * SF.SimCelNum: %s\r\n"
 " * SF.SimDate: %s\r\n"
 " * SF.SimTime: %s\r\n"
 ,SF.SimCelNum,SF.SimDate,SF.SimTime);

 }else if(Indx == 1){

 strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);


 strncpy(SF.ReadAPIKey,string[6],strlen(string[6])+1);


 strncpy(SF.APN,string[7],strlen(string[7])+1);


 strncpy(SF.PWD,string[8],strlen(string[8])+1);


 PrintOut(PrintHandler, "\r\n"
 " * SF.WriteAPIKey: %s\r\n"
 " * SF.ReadAPIKey:  %s\r\n"
 " * SF.APN:         %s\r\n"
 " * SF.PWD:         %s\r\n"
 ,SF.WriteAPIKey,SF.ReadAPIKey
 ,SF.APN,SF.PWD);


 }


 Delay_ms(500);
 RemoveSMSText(res);
 res = strcmp(SimTestTxt,"OK,");

 sprintf(txtA,"%d",res);
 PrintOut(PrintHandler, "\r\n"
 " * SimTestTxt: %s\r\n"
 " * OK-0: %s\r\n"
 ,SimTestTxt,txtA);


 if((res == 0)&&(Indx == 1)){
 WriteToFlashTemp();
 return 3;
 }
 else if ((res == 0)&&(Indx == 0))
 return 2;
 else
 return res;
}
#line 605 "C:/Users/Git/ColourSampling/Sim800.c"
void AT_Initial(){


 UART2_Write_Text("AT&W+CNMI=2,1,0,0,0");
 UART2_Write(0x0D);
 UART2_Write(0x0A);


 WaitForResponse(0);
 Delay_ms(1000);
 RingToTempBuf();
}
#line 621 "C:/Users/Git/ColourSampling/Sim800.c"
char GetAPI_Key_SMS(){
int i;

char response;

 UART2_Write_Text("AT+CMGS=");
 UART2_Write_Text(SF.SimCelNum);
 UART2_Write(0x0D);
 UART2_Write(0x0A);


 WaitForResponse(0);
 RingToTempBuf();
 Delay_ms(500);

 PrintOut(PrintHandler, "\r\n"
 " * %s\r\n"
 ,SimTestTxt);


 UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 UART2_Write(0x1A);

 response = WaitForSetupSMS(1);

 return response;
}
#line 654 "C:/Users/Git/ColourSampling/Sim800.c"
 int aveadc_;
char SendSMS(char sms_type,char cellNum){
static short onecA;
float temp_[4];
int res;
char b[64];
char txt_[15];
char tempCellNum[20];
char *str_;

 str_ = (char*)Malloc(100*sizeof(char*));

 if(!cellNum)
 strcpy(tempCellNum,string[1]);
 else
 strcpy(tempCellNum,SF.SimCelNum);

 if(!onecA){
 onecA = 1;
 AT_Initial();
 }

 UART2_Write_Text("AT+CMGF=1");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(1000);
 UART2_Write_Text("AT+CMGS=");
 UART2_Write_Text(tempCellNum);
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(2000);
 switch(sms_type){
 case 0:
 UART2_Write_Text("ERROR in setup Power down and start again!");
 break;
 case 1:
 UART2_Write_Text("Reply WebSite");
 break;
 case 2:
 UART2_Write_Text("Reply API Key");
 break;
 case 3:
 UART2_Write_Text("Setup Complete!");
 break;
 case 4:
 UART2_Write_Text("Device Powered up!");
 break;
 case 5:
 UART2_Write_Text("SMS Not recieved!");
 break;
 case 6:
 str_ = Read_Thresholds();
 strncpy(b,str_,strlen(str_)-4);
 UART2_Write_Text(b);
 break;
 case 7:
 str_ = Read_Send_AllColour(0);
 strncpy(b,str_,strlen(str_));
 UART2_Write_Text(b);
 break;
 case 8:
 str_ = Read_Send_AllColour(1);
 strncpy(b,str_,strlen(str_));
 UART2_Write_Text(b);
 break;
 case 9:
 UART2_Write_Text("Test Started!");
 break;
 case 10:
 UART2_Write_Text("Test Stopped!");
 break;
 case 11:
 UART2_Write_Text("You are not permitted to set the threshold contact the supplier!");
 break;
 case 12:
 UART2_Write_Text("Not a recognised command!");
 break;
 case 13:
 UART2_Write_Text("You are not permitted to stop this test contact ");
 UART2_Write_Text(SF.StartCell);
 break;
 case 14:
 UART2_Write_Text("Test already started contact ");
 UART2_Write_Text(SF.StartCell);
 break;
 case 15:
 UART2_Write_Text("Test has not been started!");
 break;
 case 16:
 str_ = ReadHUE();
 strncpy(b,str_,strlen(str_));
 UART2_Write_Text(b);
 break;
 case 17:
 LM35_Adc_Average(&aveadc_, 15 );
 getLM35Temp(temp_,aveadc_);
 aveadc_ = 0;
 sprintf(txt_,"%3.2f",temp_[1]);
 str_ = txt_;
 strcat(txt_,"*C");
 UART2_Write_Text(txt_);
 break;
 default:
 UART2_Write_Text("Error Power cycle the device!");
 break;
 }
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 UART2_Write(0x1A);
 Delay_ms(5000);

 Free(str_,100*sizeof(char*));

}
#line 772 "C:/Users/Git/ColourSampling/Sim800.c"
char GetSMSText(){
int num_strs,res,err;
 UART1_Write_Text("=================\r\n");
 RingToTempBuf();



 num_strs = strsplit(SimTestTxt,',');

 err = strncmp(sms_test,string[0],4);

 sprintf(txtA,"%d",num_strs);
 sprintf(txtB,"%d",err);
 PrintOut(PrintHandler, "\r\n"
 " *num_strs:= %s\r\n"
 " *err     := %s\r\n"
 " *string[0]  %s\r\n"
 " *string[1]  %s\r\n"
 " *string[2]  %s\r\n"
 " *string[3]  %s\r\n"
 " *string[4]  %s\r\n"
 " *string[5]  %s\r\n"
 " *string[6]  %s\r\n"
 " *string[7]  %s\r\n"
 " *string[8]  %s\r\n"
 ,txtA,txtB,string[0]
 ,string[1],string[2]
 ,string[3],string[4]
 ,string[5],string[6]
 ,string[7],string[8]);


 if(!err){
 unsigned int is_digit;
 is_digit = isdigit(*string[1]);

 if(is_digit == 1){
 res = atoi(string[1]);

 sprintf(sms,"%d",res);
 PrintOut(PrintHandler, "\r\n"
 " *no of sms's:= %s\r\n"
 ,sms);

 ReadMSG(res);
 }else{
 SendSMS(5,0);
 res = 1;
 }
 return RemoveSMSText(res);
 }

 return -1;
}
#line 831 "C:/Users/Git/ColourSampling/Sim800.c"
char ReadMSG(int msg_num){
int i,num_strs,res;
char *text;
 sprintf(sms,"%d",msg_num);
 Delay_ms(1000);

 PrintOut(PrintHandler, "\r\n"
 " *num_sms's:= %s\r\n"
 ,sms);


 UART2_Write_Text("AT+CMGF=1");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 WaitForResponse(1);
 RingToTempBuf();
 Delay_ms(1000);


 UART2_Write_Text("AT+CMGR=");
 UART2_Write_Text(sms);
 UART2_Write(0x0D);
 UART2_Write(0x0A);

 WaitForResponse(1);
 RingToTempBuf();
 Delay_ms(1000);


 PrintOut(PrintHandler, "\r\n"
 "************** \r\n");


 for(i = 0;i<strlen(SimTestTxt);i++){
 SimTestTxt[i] = toupper(SimTestTxt[i]);
 }

 num_strs = strsplit(SimTestTxt,',');
 text = strchr(string[4], '"');
 strcpy(string[6], RemoveChars(text,'"','O'));
 strcpy(string[3], RemoveChars(string[3],'"',0x0A));
 memset(string[4]+8,0,1);
 strncpy(string[4],string[4],8);



 sprintf(sms,"%d",num_strs);
 PrintOut(PrintHandler, "\r\n"
 " *num_strs:= %s\r\n"
 " *string[0]  %s\r\n"
 " *string[1]  %s\r\n"
 " *string[2]  %s\r\n"
 " *string[3]  %s\r\n"
 " *string[4]  %s\r\n"
 " *string[5]  %s\r\n"
 " *string[6]  %s\r\n"
 " *string[7]  %s\r\n"
 " *string[8]  %s\r\n"
 ,sms,string[0],string[1]
 ,string[2],string[3]
 ,string[4],string[5]
 ,string[6],string[7]
 ,string[8]);

 if(string[6] !=  ((void *)0) ){
 strcpy(string[6],RemoveWhiteSpace(string[6]));
 res = StrChecker(string[6]);


 if(res == 6){
 goto next;
 }
 else if(res == 10){
 goto next;
 }
 else if(res == 11){
 goto next;
 }
 else if(res == 13){
 goto next;
 }
 else if(res == 14){
 goto next;
 }
 else if(res == 16){
 if((res == 16) && (strncmp(string[1],SF.SimCelNum,15))){
 SendSMS(11,0);
 return 11;
 }
 }else if(res == 17){
 if(res == 17 && !SimVars.start){
 strncpy(SF.StartCell,string[1],15);
 SimVars.start = 1;
 }else if(res == 17 && SimVars.start){
 SendSMS(14,0);
 return 14;
 }else
 goto next;
 }else if(res == 18){
 if((SimVars.start)&&
 (!strncmp(string[1],SF.StartCell,15)||
 !strncmp(string[1],SF.SimCelNum,15))){
 SimVars.start = 0;

 PrintOut(PrintHandler, "\r\n"
 " *SimVars.start:=  0\r\n"
 " *SF.StartCell:=   %s\r\n"
 " *string[1]:=      %s\r\n"
 ,SF.StartCell,string[1]);

 goto next;
 }else{
 if(!SimVars.start){
 SendSMS(15,0);
 return 15;
 }else{
 SendSMS(13,0);
 return 13;
 }
 }
 }else if(res == 19){
 goto next;
 }else if(res == 20){

 goto next;
 }else{
 SendSMS(12,0);
 return 12;
 }
next:
 TestRecievedSMS(res);
 }
 return 0;
}
#line 969 "C:/Users/Git/ColourSampling/Sim800.c"
void TestRecievedSMS(int res){
char *t,B[64],txtDig[9];



 sprintf(B,"%d",res);
 PrintOut(PrintHandler, "\r\n"
 " *Str check result:= %s\r\n"
 ,B);


 switch(res){
 case 6:
 SendSMS(7,0);
 break;
 case 7:
 SendSMS(12,0);
 break;
 case 8:
 SendSMS(12,0);
 break;
 case 9:
 SendSMS(12,0);
 break;
 case 10:
 SendSMS(12,0);
 break;
 case 13:
 SendSMS(8,0);
 break;
 case 14:
 SendSMS(6,0);
 break;
 case 15:
 SendSMS(12,0);
 break;
 case 16:
 GetValuesFromFlash();
 NVMErasePage(FLASH_Settings_PAddr);
 if(string[5] !=  ((void *)0) ){
 strcpy(B,string[5]);
 Threshold.time_to_log = atoi(B);
 Threshold.time_to_log -= 1;
 }
 WriteToFlashTemp();
 t = Write_Thresholds(0);


 PrintOut(PrintHandler, "\r\n"
 " *CRGB:= %s\r\n"
 ,t);

 SendSMS(6,0);
 break;
 case 17:
 SimVars.init_inc = 5;
 T0_SP.sec = T0_SP.min = T0_SP.hr = 0;
 SendSMS(9,0);
 break;
 case 18:
 SimVars.init_inc = 3;
 SendSMS(10,0);
 break;
 case 19:
 SendSMS(16,0);
 break;
 case 20:
 SendSMS(17,0);
 break;
 default:
 break;
 }

}
#line 1048 "C:/Users/Git/ColourSampling/Sim800.c"
int RemoveSMSText(int sms_cnt){


 sprintf(sms,"%d",sms_cnt);
 PrintOut(PrintHandler, "\r\n"
 " *num_strs:= %s\r\n"
 ,sms);

 do{
 sprintf(sms,"%d",sms_cnt);
 UART2_Write_Text("AT+CMGD=");
 UART2_Write_Text(sms);
 UART2_Write(0x0D);
 UART2_Write(0x0A);


 WaitForResponse(1);
 Delay_ms(1000);
 RingToTempBuf();
 sms_cnt--;
 }while(sms_cnt > 0);

 return sms_cnt;
}
#line 1077 "C:/Users/Git/ColourSampling/Sim800.c"
int Test_Update_ThingSpeak(float degC){

 TCS3472_getRawData(RawData);
 GetScaledValues(RawData,FltData);
 TCS3472_CalcHSL(FltData);
 SendData(RawData,FltData,degC);
 return 2;
}
#line 1089 "C:/Users/Git/ColourSampling/Sim800.c"
void SendData(unsigned int* rgbc,float* rgbh,float degC){
int len;
char _str_[200];

 memset(_str_,0,sizeof(_str_));

 sprintf(txtC,"%u",rgbc[0]);
 sprintf(txtR,"%u",rgbc[1]);
 sprintf(txtG,"%u",rgbc[2]);
 sprintf(txtB,"%u",rgbc[3]);
 sprintf(txtR_Scl,"%3.2f",rgbh[0]);
 sprintf(txtG_Scl,"%3.2f",rgbh[1]);
 sprintf(txtB_Scl,"%3.2f",rgbh[2]);
 sprintf(txtHUE ,"%3.2f",rgbh[4]);
 sprintf(txtSAT ,"%3.2f",rgbh[5]);
 sprintf(txtLUM ,"%3.2f",rgbh[6]);
 sprintf(txtDegC,"%3.2f",degC);

 strncpy(_str_,str_api,46);
 strncat(_str_,SF.WriteAPIKey,strlen(SF.WriteAPIKey));

 strncat(_str_,field1,strlen(field1));
 strncat(_str_,txtR_Scl,strlen(txtR_Scl));
 strncat(_str_,field2,strlen(field2));
 strncat(_str_,txtG_Scl,strlen(txtG_Scl));
 strncat(_str_,field3,strlen(field3));
 strncat(_str_,txtB_Scl,strlen(txtB_Scl));
 strncat(_str_,field4,strlen(field4));
 strncat(_str_,txtHUE,strlen(txtHUE));
 strncat(_str_,field5,strlen(field5));
 strncat(_str_,txtSAT,strlen(txtSAT));
 strncat(_str_,field6,strlen(field6));
 strncat(_str_,txtLUM,strlen(txtLUM));
 strncat(_str_,field7,strlen(field7));
 strncat(_str_,txtC,strlen(txtC));
 strncat(_str_,field8,strlen(field8));
 strncat(_str_,txtDegC,strlen(txtDegC));


 PrintOut(PrintHandler, "String for ThingSpeak: \r\n"
 " *    %s\r\n"
 ,_str_);

 UART2_Write_Text("AT+CIPSHUT");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 TestForOK(0);
 Delay_ms(500);

 UART2_Write_Text("AT+CPIN?");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 TestForOK(0);
 Delay_ms(150);
 UART2_Write_Text("AT+CREG?");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 TestForOK(0);
 Delay_ms(150);
 UART2_Write_Text("AT+CGATT?");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 TestForOK(0);
 Delay_ms(150);
 UART2_Write_Text("AT+CIPSHUT");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 TestForOK(0);
 Delay_ms(150);
 UART2_Write_Text("AT+CIPSTATUS");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 TestForOK(0);
 Delay_ms(150);
 UART2_Write_Text("AT+CIPMUX=0");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 TestForOK(0);
 Delay_ms(150);
 UART2_Write_Text("AT+CSTT=");
 UART2_Write_Text(SF.APN);
 UART2_Write_Text(",\"user\",");
 UART2_Write_Text(SF.PWD);
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 TestForOK(0);
 Delay_ms(150);
 UART2_Write_Text("AT+CIICR");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 TestForOK(0);
 Delay_ms(150);
 UART2_Write_Text("AT+CIFSR");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(1000);
 UART2_Write_Text("AT+CIPSPRT=1");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 TestForOK(0);
 Delay_ms(150);
 UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 TestForOK(0);
 Delay_ms(1000);
 UART2_Write_Text("AT+CIPSEND");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(1000);
 UART2_Write_Text(_str_);
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 UART2_Write(0x1A);
 TestForOK(1);
 Delay_ms(50);
 UART2_Write_Text("AT+CIPSHUT");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 TestForOK(0);
 Delay_ms(50);


}
#line 1219 "C:/Users/Git/ColourSampling/Sim800.c"
int SignalStrength(){
int i,num_strs,res,is_digit;
char *text;


 clr_str_arrays(string);

 UART2_Write_Text("AT+CSQ");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 WaitForResponse(1);
 RingToTempBuf();
 Delay_ms(250);


 PrintOut(PrintHandler, "\r\n"
 "**Signal Strength** \r\n");




 num_strs = strsplit(SimTestTxt,',');

 strncpy(string[0],RemoveChars(string[0],':','\0'),2);

 for(i=0;i<10;i++){
 if(!isdigit(*(string[1]+i))){
 string[1][i] = '\0';
 break;
 }
 }

 is_digit = isdigit(string[0][1]);
 if(is_digit)
 SimVars.rssi = atoi(string[0]);
 else
 SimVars.rssi = 0;

 sprintf(sms,"%d",num_strs);
 sprintf(txtA,"%d",is_digit);
 sprintf(txtS,"%d",SimVars.rssi);
 PrintOut(PrintHandler, "\r\n"
 " *num_strs:= %s\r\n"
 " *string[0]  %s\r\n"
 " *string[1]  %s\r\n"
 " *string[2]  %s\r\n"
 " *string[3]  %s\r\n"
 " *string[4]  %s\r\n"
 " *string[5]  %s\r\n"
 " *string[6]  %s\r\n"
 " *is_digit:= %s\r\n"
 " *rssi:=     %s\r\n"
 ,sms,string[0],string[1]
 ,string[2],string[3]
 ,string[4],string[5]
 ,string[6],txtA,txtS);

 PWM_SigStrength(SimVars.rssi);
 return SimVars.rssi;
}
#line 1283 "C:/Users/Git/ColourSampling/Sim800.c"
void PWM_SigStrength(int sigstrength){
 T2CONCLR = 0x8008;
 if(sigstrength < 6){
 PR4 = 46080; PR5 = 1220;
 }else if(sigstrength >= 6 && sigstrength < 11){
 PR4 = 32256; PR5 = 854;
 }else if(sigstrength >= 11 && sigstrength < 16){
 PR4 = 23040; PR5 = 610;
 }else if(sigstrength >= 16 && sigstrength < 22){
 PR4 = 11520; PR5 = 305;
 }else if(sigstrength >= 22 && sigstrength < 26){
 PR4 = 4608; PR5 = 122;
 }else if(sigstrength >= 26 && sigstrength < 30){
 PR4 = 2304; PR5 = 61;
 }else{
 PR4 = 14464; PR5 = 1;
 }
 TMR4 = 0;
 TMR5 = 0;
 T4CONSET = 0x8008;
 T4IF_bit = 0;
 T5IE_bit = 1;
}
#line 1312 "C:/Users/Git/ColourSampling/Sim800.c"
void TestForOK(char c){
unsigned long lastMillis,newMillis;
 WaitForResponse(1);
 Delay_ms(100);
 RingToTempBuf();

 PrintOut(PrintHandler, "Test for OK:"
 " *    %s\r\n"
 ,SimTestTxt);

 lastMillis = TMR0.millis;
 if(c == 0)
 while(!strstr(SimTestTxt, "OK")){
 newMillis = TMR0.millis - lastMillis;
 if(newMillis > 5000)
 break;
 }
 else if(c == 1)
 while(!strstr(SimTestTxt, "CONNECT")){
 newMillis = TMR0.millis - lastMillis;
 if(newMillis > 5000)
 break;
 }
}
