#line 1 "C:/Users/Git/ColourSampling/Flash_R_W.c"
#line 1 "c:/users/git/coloursampling/flash_r_w.h"
#line 1 "c:/users/git/coloursampling/string.h"
#line 1 "c:/users/git/coloursampling/flash_r_w.h"
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
extern float FltData[4];
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
float TCS3472_CalcHue(float* RGBC);
float max_(float *rgb);
float min_(float *rgb);
#line 1 "c:/users/git/coloursampling/sim800.h"
#line 1 "c:/users/git/coloursampling/string.h"
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
void InitTimer2_3();
void Get_Time();
void Day_Month(int hr,int day,int mnth);
void I2C2_TimeoutCallback(char errorCode);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 13 "c:/users/git/coloursampling/sim800.h"
extern sfr sbit RTS;
extern sfr sbit CRS;
extern sfr sbit RST;
extern sfr sbit PWR;
extern sfr sbit STAT;
#line 29 "c:/users/git/coloursampling/sim800.h"
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
int Test_Update_ThingSpeak();
void SendData(unsigned int* rgbc,float* rgbh);
char SendSMS(char sms_type,char cellNum);
void TestForOK(char c);
int SignalStrength();
void PWM_SigStrength(int sigstrength);
#line 19 "c:/users/git/coloursampling/string.h"
extern char string[ 20 ][ 64 ];

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
ERROR
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
#line 4 "C:/Users/Git/ColourSampling/Flash_R_W.c"
unsigned long FLASH_Settings_VAddr = 0x9D07A000;
unsigned long FLASH_Settings_PAddr = 0x1D07A000;

void NVMRead(void* addr,struct Thresh *vals){
unsigned char buff[512];
unsigned int i,j;
unsigned char *ptr;
unsigned long Val;

 ptr = (unsigned char*)addr;
 i = 0;

 for(j = 0;j < 512;j++){
 buff[j] = ptr[j];
 }
 Val = buff[3];
 Val =(Val<<8)| buff[2];
 Val =(Val<<8)| buff[1];
 Val =(Val<<8)| buff[0];
 vals->C_thresh = Val;

 Val = buff[7];
 Val =(Val<<8)| buff[6];
 Val =(Val<<8)| buff[5];
 Val =(Val<<8)| buff[4];
 vals->R_thresh = Val;

 Val = buff[11];
 Val =(Val<<8)| buff[10];
 Val =(Val<<8)| buff[9];
 Val =(Val<<8)| buff[8];
 vals->G_thresh = Val;

 Val = buff[15];
 Val =(Val<<8)| buff[14];
 Val =(Val<<8)| buff[13];
 Val =(Val<<8)| buff[12];
 vals->B_thresh = Val;

 Val = buff[19];
 Val =(Val<<8)| buff[18];
 Val =(Val<<8)| buff[17];
 Val =(Val<<8)| buff[16];
 vals->time_to_log = Val;


}

unsigned int NVMWriteWord (void* address, unsigned long _data){
unsigned int res;


NVMADDR = (unsigned long) address;


NVMDATA = _data;


res = NVMUnlock (0x4001);

return res;
}


unsigned int NVMWriteRow (void* address, void* _data){
unsigned int res;

NVMADDR = (unsigned long) address;


NVMSRCADDR = (unsigned long) _data;


res = NVMUnlock(0x4003);

return res;
}

unsigned int NVMErasePage(void* address){
unsigned int res;

NVMADDR = (unsigned long) address;

res = NVMUnlock(0x4004);

return res;
}

unsigned int NVMUnlock (unsigned int nvmop){
unsigned int status;

 status = (unsigned int)DI();


NVMCON = nvmop & 0x00004007;


NVMKEY = 0xAA996655;
NVMKEY = 0x556699AA;


NVMCONSET = 0x8000;


while (NVMCON & 0x8000);


if (status & 0x0001)
 EI();
else
 DI();


NVMCONCLR = 0x0004000;


return (NVMCON & 0x3000);
}

unsigned long ReadFlashWord(){
unsigned char buff[512];
unsigned long i;
unsigned char *ptr;
unsigned long Val;




 ptr = (unsigned char*)(FLASH_Settings_VAddr);
 for(i=0;i<512;i++){
 buff[i] = *ptr;
 ptr++;
 }

 Val = buff[3];
 Val =(Val<<8)| buff[2];
 Val =(Val<<8)| buff[1];
 Val =(Val<<8)| buff[0];

 return Val;
}
