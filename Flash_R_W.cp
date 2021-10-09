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
#line 6 "C:/Users/Git/ColourSampling/Flash_R_W.c"
unsigned long FLASH_Settings_VAddr = 0xBD079ff6;
unsigned long FLASH_Settings_PAddr = 0x1D079ff6;

void NVMRead(void* addr,struct Thresh *vals){
unsigned char *ptrC;
unsigned char Val[4];

 ptrC = FLASH_Settings_VAddr;
 Val[0] = *ptrC;
 vals->C_thresh = (unsigned int)Val;
#line 22 "C:/Users/Git/ColourSampling/Flash_R_W.c"
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


NVMSRCADDR = (unsigned int) _data;


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

unsigned long ReadFlash(){
unsigned char buff[512];
unsigned long i;
unsigned char *ptr;
unsigned long Val;




 ptr = (char*)(FLASH_Settings_VAddr);
 for(i=0;i<sizeof(buff);i++){
 buff[i] = ptr[i];
 }

 Val = buff[1];
 Val =(Val<<8)| buff[0];
 Val =(Val<<8)| buff[3];
 Val =(Val<<8)| buff[2];
 return Val;
}
