#include "TCS3472.h"


unsigned short TCS3472_Bits;
sbit TCS3472_Initialised at TCS3472_Bits.B0;

unsigned short TCS3472_Init(TCS3472_IntegrationTime_t It,TCS3472_Gain_t gain ){
unsigned short x;
     x = TCS3472_Read8(TCS3472_ID);
      /*if((x != 0x44) || (x != 0x4D))
         return x;*/
   
   TCS3472_Initialised = 1;
   
   TCS3472_SetIntergration_Time(It);
   TCS3472_SetGain(gain);
   TCS3472_Enable();
   

   return 2;//TCS3472_Bits;
}

void TCS3472_Write(unsigned short cmd){
  I2C2_Start();                      // issue I2C start signal
  I2C2_Write(TCS3472_ADDR);          // send byte via I2C  (slave address)
  I2C2_Write(cmd);                  // send byte (command reg MSB)
  I2C2_Stop();
}

void TCS3472_Write8(unsigned short reg_add, unsigned short value){
  I2C2_Start();                      // issue I2C start signal
  I2C2_Write(TCS3472_ADDR);          // send byte via I2C  (slave address)
  I2C2_Write(TCS3472_CMD_BIT | reg_add);       // send byte (command reg MSB)
  I2C2_Write(value);                 // send byte (data to be written)
  I2C2_Stop();                       // issue I2C stop signal

}

unsigned short TCS3472_Read8(unsigned short reg_add){
unsigned short temp;
  I2C2_Start();                   // issue I2C start signal
  I2C2_Write(TCS3472_ADDR);       // send byte via I2C  (device address + W)
  I2C2_Write(reg_add);            // send byte (data address)
  temp = I2C2_Read(_I2C_NACK);   // Read the data (NO acknowledge)
  I2C2_Stop();
  return temp;
}

unsigned int TCS3472_Read16(unsigned short reg_add){
 unsigned short temp[2];
 unsigned int reslt;
  I2C2_Start();              // issue I2C start signal
  I2C2_Write(TCS3472_ADDR);          // send byte via I2C  (device address + W)
  I2C2_Write(TCS3472_CMD_BIT | reg_add);       // send byte (command reg MSB)
  I2C2_Restart();            // issue I2C signal repeated start
  I2C2_Write(TCS3472_ADDR);          // send byte (device address + R)
  temp[0] = I2C2_Read(_I2C_ACK);      // Read the data (NO acknowledge)
  temp[1] = I2C2_Read(_I2C_ACK);
  I2C2_Stop();
  reslt = temp[0];
  reslt = (reslt << 8) | temp[1];
  return reslt;
}

void TCS3472_Enable(){
   TCS3472_Write8(TCS3472_EN, TCS3472_EN_PON);
   Delay_ms(3);
   TCS3472_Write8(TCS3472_EN, TCS3472_EN_PON | TCS3472_EN_AEN);
}

void TCS3472_Disable(){
 unsigned short read;
    read = TCS3472_Read8(TCS3472_EN);
    TCS3472_Write8(TCS3472_EN, read & ~(TCS3472_EN_PON | TCS3472_EN_AEN));
}

void TCS3472_SetIntergration_Time(TCS3472_IntegrationTime_t It){
short cnt;
   TCS3472_Write8(TCS3472_ATIME, It);
}

void TCS3472_SetGain(TCS3472_Gain_t gain){
     TCS3472_Write8(TCS3472_CONTROL, gain);
}

void TCS3472_getRawData(unsigned int *RGBC){
  *(RGBC) = TCS3472_Read16(TCS3472_CDATAL);
  *(RGBC + 1) = TCS3472_Read16(TCS3472_RDATAL);
  *(RGBC + 2) = TCS3472_Read16(TCS3472_GDATAL);
  *(RGBC + 3) = TCS3472_Read16(TCS3472_BDATAL);
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
    r = TCS3472_Read8(TCS3472_EN);
    
    if(i = 1)
        r |= TCS3472_EN_AIEN;
    else
        r &= ~TCS3472_EN_AIEN;

    TCS3472_Write8(TCS3472_EN, r);
}

void TCS3472_ClearInterrupt(){
    TCS3472_Write(TCS3472_CMD_BIT | 0x66);
}

void TCS3472_SetInterrupt_Limits(unsigned int Lo,unsigned int Hi){
  TCS3472_Write8(0x04, Lo & 0xFF);
  TCS3472_Write8(0x05, Lo >> 8);
  TCS3472_Write8(0x06, Hi & 0xFF);
  TCS3472_Write8(0x07, Hi >> 8);
}