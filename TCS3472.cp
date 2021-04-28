#line 1 "C:/Users/GIT/ColourSampling/TCS3472.c"
#line 1 "c:/users/git/coloursampling/tcs3472.h"




extern sfr TCS3472_Initialised;
#line 60 "c:/users/git/coloursampling/tcs3472.h"
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


unsigned short TCS3472_Init(TCS3472_IntegrationTime_t It,TCS3472_Gain_t gain , TCS3472x Id );
void TCS3472_Write(unsigned short cmd);
void TCS3472_Write8(unsigned short reg_add,unsigned short value);
unsigned short TCS3472_Read8(unsigned short reg_add);
unsigned int TCS3472_Read16(unsigned short reg_add);
void TCS3472_Enable();
void TCS3472_Disable();
void TCS3472_SetIntergration_Time(TCS3472_IntegrationTime_t It);
void TCS3472_SetGain(TCS3472_Gain_t gain);
void TCS3472_getRawData(unsigned int *RGBC);
void TCS3472_getRawDataOnce(unsigned int *RGBC);
unsigned int TCS3472_CalcColTemp(unsigned int R,unsigned int G,unsigned int B);
unsigned int TCS3472_CalcColTemp_dn40(unsigned int *RGBC);
unsigned int TCS3472_Calc_Lux(unsigned int R,unsigned int G,unsigned int B);
void TCS3472_SetInterrupt(char i);
void TCS3472_SetInterrupt_Limits(unsigned int Lo,unsigned int Hi);
#line 4 "C:/Users/GIT/ColourSampling/TCS3472.c"
unsigned short TCS3472_Bits;
sbit TCS3472_Initialised at TCS3472_Bits.B0;

unsigned short TCS3472_Init(TCS3472_IntegrationTime_t It,TCS3472_Gain_t gain, TCS3472x Id ){
unsigned short id;

 id = TCS3472_Read8( 0x12 );
 if(id != Id)
 return 255;

 if(!TCS3472_Initialised){
 TCS3472_Initialised = 1;
 TCS3472_SetIntergration_Time(It);
 TCS3472_SetGain(gain);
 TCS3472_Enable();
 }
 return id;
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

void TCS3472_SetIntergration_Time(TCS3472_IntegrationTime_t It){
short cnt;
 TCS3472_Write8( 0x01 , It);
}

void TCS3472_SetGain(TCS3472_Gain_t gain){
 TCS3472_Write8( 0x0F , gain);
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

}

unsigned int TCS3472_CalcColTemp_dn40(unsigned int *RGBC){

}

unsigned int TCS3472_Calc_Lux(unsigned int R,unsigned int G,unsigned int B){

}

void TCS3472_SetInterrupt(char i){
unsigned short r;
 r = TCS3472_Read8( 0x00 );

 if(i = 1)
 r |=  0x10 ;
 else
 r &= ~ 0x10 ;

 TCS3472_Write8( 0x00 , r);
}

void TCS3472_ClearInterrupt(){
 TCS3472_Write( 0x80  | 0x66);
}

void TCS3472_SetInterrupt_Limits(unsigned int Lo,unsigned int Hi){
 TCS3472_Write8(0x04, Lo & 0xFF);
 TCS3472_Write8(0x05, Lo >> 8);
 TCS3472_Write8(0x06, Hi & 0xFF);
 TCS3472_Write8(0x07, Hi >> 8);
}
