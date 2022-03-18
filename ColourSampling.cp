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
#line 1 "c:/users/git/coloursampling/config.h"
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








extern sfr sbit LM35_Pin;
extern sfr sbit LM35_Pin_Dir;
#line 27 "c:/users/git/coloursampling/lm35.h"
void setup_LM35(int count);
int LM35_Adc_Average(int* adc,int adc_pin);
int LM35_Adc_Single(int adc,int adc_pin);
void getLM35Temp(float * t,int adc_ave);
#line 21 "c:/users/git/coloursampling/string.h"
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
#line 37 "c:/users/git/coloursampling/sim800.h"
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
#line 27 "c:/users/git/coloursampling/config.h"
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
void Initialize_Led_On();
void SetLedPWM();
void ApplicationDebug();
#line 4 "C:/Users/Git/ColourSampling/ColourSampling.c"
int (*Update_Test)(float deg);

PString str_t;
Timer_Setpoint T0_SP={
 0,
 0,
 0,
 0,
 0,
 0
};
char* (*testStr)(int i);

char cnt;
char kk;
char readbuff[64];
char writebuff[64];


char txt[] = "00000";
char sub_txt[] = "\"+44";


const int temp_pwm_max = 3780;
#line 32 "C:/Users/Git/ColourSampling/ColourSampling.c"
void main() {

char cel_num[20];
char num,last_rec_inc;
unsigned short i;
unsigned int cell_ok,str_num,deg;
float _temp[4];
int resA=0, resB=0, diff = 0;
long res_millis_sigstr = 0;


static int ave_adc = 0;
static long last_millis_sigstr = 0;
static long millis_sigstr_sp = 0;
static long last_millis_thermister = 0;
static long millis_thermister_sp = 0;
static long millis_thermister = 0;

static char last_start = 0;
int sample_test = 0;
unsigned int pid_out = 0;


char txtInit[6],txtR[6],txtH[6],txtT[6],txtI[6],txtK[15],txtC[15],txtF[15],txtRaw[15],txtPid[15];



 Update_Test = Test_Update_ThingSpeak;


 ConfigPic();

 Delay_ms(500);


 it = TCS3472_INTEGRATIONTIME_24MS;
 G = TCS3472_GAIN_1X;
 device_Id = TCS3472_1_5;
 i = 0;
 i = TCS3472_Init(it,G,device_Id);
#line 76 "C:/Users/Git/ColourSampling/ColourSampling.c"
 T0_SP.sec = 0;
 T0_SP.min = 0;
 T0_SP.hr = 0;
#line 87 "C:/Users/Git/ColourSampling/ColourSampling.c"
 strcpy(cel_num,GetValuesFromFlash());
 str_num = strncmp(cel_num,sub_txt,4);


 sprintf(txtR,"%u",str_num);
 PrintOut(PrintHandler, "\r\n"
 " *Cell number:   %s\r\n"
 " *Result of cmp: %s\r\n"
 ,cel_num,txtR);
#line 106 "C:/Users/Git/ColourSampling/ColourSampling.c"
 if(str_num != 0){
 SimVars.init_inc = SetupIOT();
 SimVars.init_inc = WaitForSetupSMS(0);
 SimVars.init_inc = GetAPI_Key_SMS();
 if(SimVars.init_inc != 0)
 SendSMS(SimVars.init_inc,1);
 else
 SendSMS(SimVars.init_inc,1);
 cell_ok = 0;
 }else{
 WaitForResponse(3);
 SimVars.init_inc = 3;
 cell_ok = 1;
 }

 if(cell_ok == 1){
 Read_Thresholds();
 Delay_ms(3000);
 SendSMS(4,1);
 SimVars.init_inc = 3;
 }


 sprintf(txtInit,"%d",SimVars.init_inc);
 PrintOut(PrintHandler, "\r\n"
 " *Run      \r\n"
 " *Initial Incrament:= %s\r\n"
 ,txtInit);
#line 138 "C:/Users/Git/ColourSampling/ColourSampling.c"
 T0_SP.one_per_Xmin = 0;
 resA = resB = 0;
 last_millis_sigstr = TMR0.millis;
 millis_sigstr_sp = 5000;
#line 154 "C:/Users/Git/ColourSampling/ColourSampling.c"
 while(1){


 num = HID_Read();
 if(num != 0){
 DoStrings(num);
 }



 if(SimVars.start && !last_start){
 last_start = 1;
 Initialize_Led_On();
 PWM_Start(3);
 }else if(!SimVars.start && (last_start > 0)){
 last_start = 0;
 PWM_Stop(3);
 }



 millis_thermister = TMR0.millis - last_millis_thermister;
 if(millis_thermister > millis_thermister_sp){
 millis_thermister_sp = 999;
 last_millis_thermister = TMR0.millis;
 millis_thermister = 0;
 sample_test = LM35_Adc_Average(&ave_adc, 15 );
 if(sample_test < 0){
 getLM35Temp(_temp,ave_adc);
 ave_adc = 0;
 current_duty3 = PID_Calculate( 35.00, _temp[1]);
 PWM_Set_Duty(current_duty3, 3);


 sprintf(txtK,"%3.2f",_temp[0]);
 sprintf(txtC,"%3.2f",_temp[1]);
 sprintf(txtF,"%3.2f",_temp[2]);
 sprintf(txtRaw,"%3.2f",_temp[3]);
 sprintf(txtPid,"%d",current_duty3);
 PrintOut(PrintHandler, "\r\n"
 " *Kelvin:=      %s\r\n"
 " *deg. C:=      %s\r\n"
 " *deg. F:=      %s\r\n"
 " *ADC:=         %s\r\n"
 " *PID:=         %s\r\n"
 ,txtK,txtC,txtF,txtRaw,txtPid);
#line 203 "C:/Users/Git/ColourSampling/ColourSampling.c"
 }

 }



 res_millis_sigstr = TMR0.millis - last_millis_sigstr;
 if(res_millis_sigstr >= millis_sigstr_sp){
 millis_sigstr_sp = 600000;
 last_millis_sigstr = TMR0.millis;
 res_millis_sigstr = 0;
 if(STAT)
 SignalStrength();
 }



 if(SimVars.init_inc >= 5){
 if(T0_SP.one_per_Xmin){
 PWM_Start(2);
 Delay_ms(500);

 Update_Test(_temp[1]);
 T0_SP.sec = T0_SP.min = T0_SP.hr = 0;
 T0_SP.one_per_Xmin = 0;
 PWM_Stop(2);
 }
 }



 if(!T0_SP.one_per_sec){
 diff = TestRingPointers();
 if(diff > 1){
 last_rec_inc = SimVars.init_inc;
 SimVars.init_inc = 3;

 sprintf(txtI,"%d",resB);
 sprintf(txtR,"%d",diff);
 sprintf(txtT,"%d",RB.tail);
 sprintf(txtH,"%d",RB.head);
 PrintOut(PrintHandler, "\r\n"
 " *Tail:= %s\r\n"
 " *Head:= %s\r\n"
 " *Diff in pointers:= %s\r\n"
 " *Reply from GetSmsTxt():= %s\r\n"
 ,txtT,txtH,txtR,txtI);
#line 253 "C:/Users/Git/ColourSampling/ColourSampling.c"
 GetSMSText();
 Delay_ms(500);
 if(SimVars.init_inc != 5)
 SimVars.init_inc = last_rec_inc;
 }

 }








 if(!RE4_bit){
#line 272 "C:/Users/Git/ColourSampling/ColourSampling.c"
 }



 if (RCON & 0x0010) {

 Reset();
 }



 WDTCLR_bit = 1;
 }
}
