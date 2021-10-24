#line 1 "C:/Users/Git/ColourSampling/Sim800.c"
#line 1 "c:/users/git/coloursampling/sim800.h"
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
#line 1 "c:/users/git/coloursampling/sim800.h"
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
WRITE_RAW
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
void remove_whitespaces(char* str);
int strsplit(char* str,char c);
void testStrings(char* writebuff);
char* setstr(char conf[250]);
void clr_str_arrays(char *str[10]);
char* Read_Send_AllColour(short data_src);
char* Read_Send_OneColour(int colr);
char* Read_Thresholds();
char* Write_Thresholds(short data_src);
int Get_It();
int Get_Gain();
char* TestFlash();
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
}Timers;

extern Timers TMR0;

typedef struct{
unsigned int ms;
unsigned int sec;
unsigned int min;
unsigned int hr;
unsigned short one_per_sec;
}Timer_Setpoint;





extern Timer_Setpoint T0_SP;
void InitTimer1();
void Get_Time();

void I2C2_TimeoutCallback(char errorCode);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/built_in.h"
#line 13 "c:/users/git/coloursampling/sim800.h"
extern sfr sbit RTS;
extern sfr sbit CRS;
extern sfr sbit RST;
extern sfr sbit PWR;
extern sfr sbit STAT;








extern char rcvSimTxt[150];
extern char SimTestTxt[150];
extern char rcvPcTxt[150];




typedef struct{
 uint8_t initial_str;
 uint16_t time_to_log;
 uint16_t num_of_sms_bytes;
 char init_inc;
}Sim800Vars;
extern Sim800Vars SimVars;

struct RingBuffer{
char rcv_txt_fin;
char buff[1000];
unsigned int head;
unsigned int tail;
unsigned int last_head;
unsigned int last_tail;
};

extern struct RingBuffer RB;





void InitGSM3();
void RcvSimTxt();
void PwrUpGSM3();
char SetupIOT();
char WaitForSetupSMS();
int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h);
void SendData(unsigned int* rgbc);
char SendSMS(char sms_type);
#line 5 "C:/Users/Git/ColourSampling/Sim800.c"
sbit RTS at LATB1_bit;
sbit CTS at RE9_bit;
sbit RST at LATB2_bit;
sbit PWR at LATG7_bit;
sbit STAT at RB4_bit;


char rcvSimTxt[150];
char SimTestTxt[150];
char rcvPcTxt[150];

Sim800Vars SimVars = {
 0,
 9,
 0,
 0
};

struct RingBuffer RB;
#line 28 "C:/Users/Git/ColourSampling/Sim800.c"
void InitGSM3(){
 SimVars.initial_str = 0;
 SimVars.init_inc = 0;
 *SimTestTxt = "Hello World this is a test";
 RB.head = 0;
 RB.tail = 0;
 RB.rcv_txt_fin = -1;
}
#line 40 "C:/Users/Git/ColourSampling/Sim800.c"
void RcvSimTxt(){

 while(UART2_Data_Ready()) {
 U1TXREG = U2RXREG;

 if(U2RXREG >= 0x20){
 RB.buff[RB.head] = U2RXREG;
 RB.head++;
 }else if(U2RXREG == 0x0A){
 RB.buff[RB.head] = ',';
 RB.head++;
 }

 if(RB.head > 999)
 RB.head = 0;

 }
 RB.buff[RB.head] = U2RXREG;
 RB.rcv_txt_fin = 1;
}
#line 64 "C:/Users/Git/ColourSampling/Sim800.c"
void PwrUpGSM3(){
 RST = 0;
 PWR = 0;
 Delay_ms(1000);
 PWR = 1;

 while(STAT){
 LATE3_bit = !LATE3_bit;
 Delay_ms(100);
 }
 Delay_ms(5000);
}




char SetupIOT(){
int num_strs,res,i;
char txtA[6];
char* str_rcv;
#line 88 "C:/Users/Git/ColourSampling/Sim800.c"
 res = -1;
 UART1_Write_Text("ATE0");
 UART1_Write(0x0D);
 UART1_Write(0x0A);

 RB.rcv_txt_fin = 0;
 RB.last_head = RB.head;
 do{
 LATE3_bit = !LATE3_bit;
 UART2_Write_Text("ATE0");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(1000);
 }while(!RB.rcv_txt_fin);
 Delay_ms(4000);
 i=0;
 RB.tail = RB.last_tail;
 if(RB.head > RB.last_head){
 while(RB.tail != RB.head){
 SimTestTxt[i] = RB.buff[RB.tail];
 UART1_Write(SimTestTxt[i]);
 UART1_Write(0x3A);
 i++;
 RB.tail++;
 RB.tail = (RB.tail > 999)? 0: RB.tail;
 };
 SimTestTxt[i] = 0;
 }
 RB.last_tail = RB.tail++;


 UART1_Write_Text("1st Result:= ");
 UART1_Write_Text(SimTestTxt);
 UART1_Write(0x0D);
 UART1_Write(0x0A);
 UART1_Write_Text("Check if Sim is Registered");
 UART1_Write(0x0D);
 UART1_Write(0x0A);

wait:

 RB.rcv_txt_fin = 0;
 RB.last_head = RB.head;
 do{
 LATE3_bit = !LATE3_bit;
 UART2_Write_Text("AT+CREG?");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(500);
 }while(!RB.rcv_txt_fin);
 Delay_ms(5000);
 i=0;
 RB.tail = RB.last_tail++;
 if(RB.head > RB.last_head){
 while(RB.tail != RB.head){
 SimTestTxt[i] = RB.buff[RB.tail];
 i++;
 RB.tail++;
 RB.tail = (RB.tail > 999)? 0: RB.tail;
 };
 SimTestTxt[i] = 0;
 }
 RB.last_tail = RB.tail++;

 UART1_Write_Text("2n Result:= ");
 UART1_Write_Text(SimTestTxt);
 UART1_Write(0x0D);
 UART1_Write(0x0A);



 if(RB.head > RB.last_head){
 str_rcv = setstr(SimTestTxt);

 num_strs = strsplit(str_rcv,',');


 UART1_Write_Text("string[3]");
 UART1_Write_Text(string[3]);
 UART1_Write(0x0D);
 UART1_Write(0x0A);
 sprintf(txtA,"%d",num_strs);
 UART1_Write_Text("num_strs:= ");
 UART1_Write_Text(txtA);
 UART1_Write(0x0D);
 UART1_Write(0x0A);


 res = atoi(string[3]);
 if(res == 1){

 sprintf(txtA,"%d",res);
 UART1_Write_Text("Registered with:= ");
 UART1_Write_Text(txtA);
 UART1_Write(0x0D);
 UART1_Write(0x0A);

 SimVars.init_inc = 0;
 }else{

 UART1_Write_Text("Sim Not Registered");
 UART1_Write(0x0D);
 UART1_Write(0x0A);

 Delay_ms(500);
 goto wait;
 }
 }

 UART1_Write_Text("Sim Registered");
 UART1_Write(0x0D);
 UART1_Write(0x0A);

 return 1;
}
#line 209 "C:/Users/Git/ColourSampling/Sim800.c"
char WaitForSetupSMS(){
int i,num_strs;
char* str_rcv;
char txtA[6];

 RB.rcv_txt_fin = 0;
 RB.last_head = RB.head;


 do{
 LATE3_bit = !LATE3_bit;
 Delay_ms(150);
 }while(!RB.rcv_txt_fin);
 clr_str_arrays(string);
 Delay_ms(2000);

 i=0;
 RB.tail = RB.last_tail++;
 if(RB.head > RB.last_head){
 while(RB.tail != RB.head){
 RB.tail++;
 RB.tail = (RB.tail > 999)? 0: RB.tail;
 SimTestTxt[i] = RB.buff[RB.tail];
 i++;
 };
 SimTestTxt[i] = 0;
 }
 RB.last_tail = RB.tail++;
 str_rcv = setstr(SimTestTxt);

 num_strs = strsplit(str_rcv,',');


 sprintf(txtA,"%d",num_strs);
 UART1_Write_Text("num_strs:= ");
 UART1_Write_Text(txtA);
 UART1_Write(0x0D);
 UART1_Write(0x0A);
 UART1_Write_Text("string[0]");
 UART1_Write_Text(string[0]);
 UART1_Write(0x0D);
 UART1_Write(0x0A);
 UART1_Write_Text("string[1]");
 UART1_Write_Text(string[1]);
 UART1_Write(0x0D);
 UART1_Write(0x0A);
 UART1_Write_Text("string[2]");
 UART1_Write_Text(string[2]);
 UART1_Write(0x0D);
 UART1_Write(0x0A);
 UART1_Write_Text("string[3]");
 UART1_Write_Text(string[3]);
 UART1_Write(0x0D);
 UART1_Write(0x0A);


 return 2;
}

int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
char txtS[6];
char txtM[6];
char txtH[6];
static unsigned short sLast;
static unsigned short mLast;
static unsigned short hLast;

 if(s != sLast){
 sLast = s;
#line 283 "C:/Users/Git/ColourSampling/Sim800.c"
 }
 if(m != mLast){
 mLast = m;
#line 291 "C:/Users/Git/ColourSampling/Sim800.c"
 }
 if(h != hLast){
 hLast = h;
#line 299 "C:/Users/Git/ColourSampling/Sim800.c"
 }

 if(s == 1 &&
 m > SimVars.time_to_log){
 TCS3472_getRawData(RawData);
 SendData(RawData);
 return 2;
 }

 return -1;
}

void SendData(unsigned int* rgbc){
char txtC[15];
char txtR[15];
char txtG[15];
char txtB[15];

 sprintf(txtC,"%u",rgbc[0]);
 sprintf(txtR,"%u",rgbc[1]);
 sprintf(txtG,"%u",rgbc[2]);
 sprintf(txtB,"%u",rgbc[3]);

 UART2_Write_Text("AT+CPIN?");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(1000);
 UART2_Write_Text("AT+CREG?");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(1000);
 UART2_Write_Text("AT+CGATT?");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(1000);
 UART2_Write_Text("AT+CIPSHUT");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(3000);
 UART2_Write_Text("AT+CIPSTATUS");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(3000);
 UART2_Write_Text("AT+CIPMUX=0");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(1000);
 UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(3000);
 UART2_Write_Text("AT+CIICR");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(4000);
 UART2_Write_Text("AT+CIFSR");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(1000);
 UART2_Write_Text("AT+CIPSPRT=1");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(1000);
 UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(4000);
 UART2_Write_Text("AT+CIPSEND");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(1000);
 UART2_Write_Text("GET https://api.thingspeak.com/update?api_key=W2NO15EASX7P7CDK&field1=");
 UART2_Write_Text(txtC);
 UART2_Write_Text("&field2=");
 UART2_Write_Text(txtR);
 UART2_Write_Text("&field3=");
 UART2_Write_Text(txtG);
 UART2_Write_Text("&field4=");
 UART2_Write_Text(txtB);
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(5000);
 UART2_Write(0x1A);
 Delay_ms(500);
 UART2_Write_Text("AT+CIPSHUT");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
}

char SendSMS(char sms_type){
int res;
char txt[6];
 UART2_Write_Text("AT+CNMI=2,2,0,0,0");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(1000);
 UART2_Write_Text("AT+CMGF=1");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(1000);
 UART2_Write_Text("AT+CMGS=\"+447946455348\"");
 UART2_Write(0x0D);
 UART2_Write(0x0A);
 Delay_ms(2000);
 switch(sms_type){
 case 0:
 UART2_Write_Text("Reply Start");
 break;
 case 1:
 UART2_Write_Text("Reply WebSite");
 break;
 case 2:
 UART2_Write_Text("Reply API Key");
 break;
 }
 UART2_Write(0x1A);

}
