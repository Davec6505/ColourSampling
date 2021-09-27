#line 1 "C:/Users/Git/ColourSampling/TCS3472.c"
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
#line 3 "C:/Users/Git/ColourSampling/TCS3472.c"
unsigned int RawData[4];
unsigned int CCT;

TCS3472_IntegrationTime_t it;
TCS3472_Gain_t G;
TCS3472x device_Id;
TCS3472_Error device_Error;
TCS3472x_Threshold Col_Thresh;

unsigned short TCS3472_Bits;
sbit TCS3472_Initialised at TCS3472_Bits.B0;
unsigned short _i2caddr,_i2caddw;


unsigned short TCS3472_Init(TCS3472_IntegrationTime_t It,TCS3472_Gain_t gain, TCS3472x Id ){
unsigned short id;

 id = TCS3472_Read8( 0x12 );
 if(id != Id)
 return 0x00;
 if(!TCS3472_Initialised){
 TCS3472_Initialised = 1;
 TCS3472_SetIntergration_Time(It);
 TCS3472_SetGain(gain);
 TCS3472_Enable();
 }
 return id;
}

void SetColourThresholds(uint16_t C,uint16_t R,uint16_t G,uint16_t B){
 Col_Thresh.C_Thresh = C;
 Col_Thresh.R_Thresh = R;
 Col_Thresh.G_Thresh = G;
 Col_Thresh.B_Thresh = B;
}

void TCS3472_Write(unsigned short cmd){
 I2C2_Start();
 I2C2_Write( 0x52 );
 I2C2_Write(cmd);
 I2C2_Stop();
}

void TCS3472_Write8(unsigned short reg_add, unsigned short value){
 I2C2_Start();
 I2C2_Write( 0x52 );
 I2C2_Write( 0x80  | reg_add);
 I2C2_Write(value);
 I2C2_Stop();

}

unsigned short TCS3472_Read8(unsigned short reg_add){
unsigned short temp;
 I2C2_Start();
 I2C2_Write( 0x52 );
 I2C2_Write( 0x80  | reg_add);
 I2C2_Stop();
 I2C2_Start();
 I2C2_Write( 0x53 );
 temp = I2C2_Read(1);
 I2C2_Stop();
 return temp;
}

unsigned int TCS3472_Read16(unsigned short reg_add){
 unsigned char temp[2];
 unsigned int reslt;
 I2C2_Start();
 I2C2_Write( 0x52 );
 I2C2_Write( 0xA0  | reg_add);
 I2C_ReStart();
 I2C2_Write( 0x53 );
 temp[0] = I2C2_Read(_I2C_ACK);
 temp[1] = I2C2_Read(_I2C_NACK);
 I2C2_Stop();
 reslt = temp[0];
 reslt = (reslt << 8) | temp[1];
 return reslt;
}

void TCS3472_Enable(){
 TCS3472_Write8( 0x00 ,  0x01 );
 Delay_ms(3);
 TCS3472_Write8( 0x00 ,  0x01  |  0x02 );
}

void TCS3472_Disable(){
 unsigned short read;
 read = TCS3472_Read8( 0x00 );
 TCS3472_Write8( 0x00 , read & ~( 0x01  |  0x02 ));
}

unsigned short TCS3472_SetIntergration_Time(TCS3472_IntegrationTime_t It){
 if(!TCS3472_Initialised)
 return 0x00;

 TCS3472_Write8( 0x01 , It);
 return 0x01;
}

unsigned short TCS3472_SetGain(TCS3472_Gain_t gain){
 if(!TCS3472_Initialised)
 return 0x00;
 TCS3472_Write8( 0x0F , gain);
 return 0x01;
}

void TCS3472_getRawData(unsigned int *RGBC){
 *(RGBC) = TCS3472_Read16( 0x14 );
 *(RGBC + 1) = TCS3472_Read16( 0x16 );
 *(RGBC + 2) = TCS3472_Read16( 0x18 );
 *(RGBC + 3) = TCS3472_Read16( 0x1A );
}

void TCS3472_getRawDataOnce(unsigned int *RGBC){
 TCS3472_Enable();
 TCS3472_getRawData(RGBC);
 TCS3472_Disable();
}

unsigned int TCS3472_CalcColTemp(unsigned int R,unsigned int G,unsigned int B){
 float X, Y, Z;
 float xc, yc;
 float n;
 float cct;

 if (r == 0 && g == 0 && b == 0) {
 return 0;
 }





 X = (-0.14282F * r) + (1.54924F * g) + (-0.95641F * b);
 Y = (-0.32466F * r) + (1.57837F * g) + (-0.73191F * b);
 Z = (-0.68202F * r) + (0.77073F * g) + (0.56332F * b);


 xc = (X) / (X + Y + Z);
 yc = (Y) / (X + Y + Z);


 n = (xc - 0.3320F) / (0.1858F - yc);


 cct =
 (449.0F * pow(n, 3)) + (3525.0F * pow(n, 2)) + (6823.3F * n) + 5520.33F;


 return (unsigned int)cct;
}

unsigned int TCS3472_CalcColTemp_dn40(unsigned int *RGBC,TCS3472_IntegrationTime_t It){
 unsigned int r2, b2,g2;
 unsigned int sat;
 unsigned int ir;
 unsigned int cct;
 if (RGBC[0] == 0) {
 return 0;
 }
#line 178 "C:/Users/Git/ColourSampling/TCS3472.c"
 if ((256 - It) > 63) {

 sat = 65535;
 } else {

 sat = 1024 * (256 - It);
 }
#line 203 "C:/Users/Git/ColourSampling/TCS3472.c"
 if ((256 - It) <= 63) {

 sat -= sat / 4;
 }


 if (RGBC[0] >= sat) {
 return 0;
 }



 ir = (RGBC[1] + RGBC[2] + RGBC[3] > RGBC[0]) ? (RGBC[1] + RGBC[2] + RGBC[3] - RGBC[0]) / 2 : 0;


 r2 = RGBC[1] - ir;
 g2 = RGBC[2] - ir;
 b2 = RGBC[3] - ir;

 if (r2 == 0) {
 return 0;
 }



 cct = (3810 * b2 / r2 + 1391);

 return cct;
}

unsigned int TCS3472_Calc_Lux(unsigned int R,unsigned int G,unsigned int B){

}

unsigned short TCS3472_SetInterrupt(char i){
unsigned short r;
 if(!TCS3472_Initialised)
 return 0x00;

 r = TCS3472_Read8( 0x00 );

 if(i = 1)
 r |=  0x10 ;
 else
 r &= ~ 0x10 ;

 TCS3472_Write8( 0x00 , r);
 return 0x01;
}

unsigned short TCS3472_ClearInterrupt(){
 if(!TCS3472_Initialised)
 return 0x00;
 TCS3472_Write( 0x80  | 0x66);
 return 0x01;
}

unsigned short TCS3472_SetInterrupt_Limits(unsigned int Lo,unsigned int Hi){
 if(!TCS3472_Initialised)
 return 0x00;
 TCS3472_Write8(0x04, Lo & 0xFF);
 TCS3472_Write8(0x05, Lo >> 8);
 TCS3472_Write8(0x06, Hi & 0xFF);
 TCS3472_Write8(0x07, Hi >> 8);
 return 0x01;
}
