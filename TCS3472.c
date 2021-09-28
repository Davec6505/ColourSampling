#include "TCS3472.h"

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

//TCS3472_IntegrationTime_t _tcs34725IntegrationTime;

unsigned short TCS3472_Init(TCS3472_IntegrationTime_t It,TCS3472_Gain_t gain, TCS3472x Id ){
unsigned short id;

   id = TCS3472_Read8(TCS3472_ID);
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
  I2C2_Start();                      // issue I2C start signal
  I2C2_Write(TCS3472_ADDW);          // send byte via I2C  (slave address)
  I2C2_Write(cmd);                  // send byte (command reg MSB)
  I2C2_Stop();
}

void TCS3472_Write8(unsigned short reg_add, unsigned short value){
  I2C2_Start();                      // issue I2C start signal
  I2C2_Write(TCS3472_ADDW);          // send byte via I2C  (slave address)
  I2C2_Write(TCS3472_CMD_BIT | reg_add);       // send byte (command reg MSB)
  I2C2_Write(value);                 // send byte (data to be written)
  I2C2_Stop();                       // issue I2C stop signal

}

unsigned short TCS3472_Read8(unsigned short reg_add){
unsigned short temp;
  I2C2_Start();                   // issue I2C start signal
  I2C2_Write(TCS3472_ADDW);       // send byte via I2C  (device address + W)
  I2C2_Write(TCS3472_CMD_BIT | reg_add);            // send byte (data address)
  I2C2_Stop();
  I2C2_Start();
  I2C2_Write(TCS3472_ADDR);
  temp = I2C2_Read(1);   // Read the data (NO acknowledge)
  I2C2_Stop();
  return temp;
}

unsigned int TCS3472_Read16(unsigned short reg_add){
 unsigned char temp[2];
 unsigned int reslt;
  I2C2_Start();              // issue I2C start signal
  I2C2_Write(TCS3472_ADDW);          // send byte via I2C  (device address + W)
  I2C2_Write(TCS3472_CMD_AUTO_INC | reg_add);       // send byte (command reg MSB)
  I2C_ReStart();           // issue I2C signal repeated start
  I2C2_Write(TCS3472_ADDR);          // send byte (device address + R)
  temp[0] = I2C2_Read(_I2C_ACK);      // Read the data (NO acknowledge)
  temp[1] = I2C2_Read(_I2C_NACK);
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

unsigned short TCS3472_SetIntergration_Time(TCS3472_IntegrationTime_t It){
   if(!TCS3472_Initialised)
      return 0x00;
       
   TCS3472_Write8(TCS3472_ATIME, It);
    return 0x01;
}

unsigned short TCS3472_SetGain(TCS3472_Gain_t gain){
     if(!TCS3472_Initialised)
       return 0x00;
     TCS3472_Write8(TCS3472_CONTROL, gain);
     return 0x01;
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
  float X, Y, Z; /* RGB to XYZ correlation      */
  float xc, yc;  /* Chromaticity co-ordinates   */
  float n;       /* McCamy's formula            */
  float cct;

  if (r == 0 && g == 0 && b == 0) {
    return 0;
  }

  /* 1. Map RGB values to their XYZ counterparts.    */
  /* Based on 6500K fluorescent, 3000K fluorescent   */
  /* and 60W incandescent values for a wide range.   */
  /* Note: Y = Illuminance or lux                    */
  X = (-0.14282F * r) + (1.54924F * g) + (-0.95641F * b);
  Y = (-0.32466F * r) + (1.57837F * g) + (-0.73191F * b);
  Z = (-0.68202F * r) + (0.77073F * g) + (0.56332F * b);

  /* 2. Calculate the chromaticity co-ordinates      */
  xc = (X) / (X + Y + Z);
  yc = (Y) / (X + Y + Z);

  /* 3. Use McCamy's formula to determine the CCT    */
  n = (xc - 0.3320F) / (0.1858F - yc);

  /* Calculate the final CCT */
  cct =
      (449.0F * pow(n, 3)) + (3525.0F * pow(n, 2)) + (6823.3F * n) + 5520.33F;

  /* Return the results in degrees Kelvin */
  return (unsigned int)cct;
}

unsigned int TCS3472_CalcColTemp_dn40(unsigned int *RGBC,TCS3472_IntegrationTime_t It){
  unsigned int r2, b2,g2; /* RGB values minus IR component */
  unsigned int sat;    /* Digital saturation level */
  unsigned int ir;     /* Inferred IR content */
  unsigned int cct;
  if (RGBC[0] == 0) {
    return 0;
  }

  /* Analog/Digital saturation:
   *
   * (a) As light becomes brighter, the clear channel will tend to
   *     saturate first since R+G+B is approximately equal to C.
   * (b) The TCS34725 accumulates 1024 counts per 2.4ms of integration
   *     time, up to a maximum values of 65535. This means analog
   *     saturation can occur up to an integration time of 153.6ms
   *     (64*2.4ms=153.6ms).
   * (c) If the integration time is > 153.6ms, digital saturation will
   *     occur before analog saturation. Digital saturation occurs when
   *     the count reaches 65535.
   */
  if ((256 - It) > 63) {
    /* Track digital saturation */
    sat = 65535;
  } else {
    /* Track analog saturation */
    sat = 1024 * (256 - It);
  }

  /* Ripple rejection:
   *
   * (a) An integration time of 50ms or multiples of 50ms are required to
   *     reject both 50Hz and 60Hz ripple.
   * (b) If an integration time faster than 50ms is required, you may need
   *     to average a number of samples over a 50ms period to reject ripple
   *     from fluorescent and incandescent light sources.
   *
   * Ripple saturation notes:
   *
   * (a) If there is ripple in the received signal, the value read from C
   *     will be less than the max, but still have some effects of being
   *     saturated. This means that you can be below the 'sat' value, but
   *     still be saturating. At integration times >150ms this can be
   *     ignored, but <= 150ms you should calculate the 75% saturation
   *     level to avoid this problem.
   */
  if ((256 - It) <= 63) {
    /* Adjust sat to 75% to avoid analog saturation if atime < 153.6ms */
    sat -= sat / 4;
  }

  /* Check for saturation and mark the sample as invalid if true */
  if (RGBC[0] >= sat) {
    return 0;
  }

  /* AMS RGB sensors have no IR channel, so the IR content must be */
  /* calculated indirectly. */
  ir = (RGBC[1] + RGBC[2] + RGBC[3] > RGBC[0]) ? (RGBC[1] + RGBC[2] + RGBC[3] - RGBC[0]) / 2 : 0;

  /* Remove the IR component from the raw RGB values */
  r2 = RGBC[1] - ir;
  g2 = RGBC[2] - ir;
  b2 = RGBC[3] - ir;

  if (r2 == 0) {
    return 0;
  }

  /* A simple method of measuring color temp is to use the ratio of blue */
  /* to red light, taking IR cancellation into account. */
  cct = (3810 * b2 / r2 + 1391); /** Color temp offset. */  //** Color temp coefficient. */

  return cct;
}

unsigned int TCS3472_Calc_Lux(unsigned int R,unsigned int G,unsigned int B){

}

unsigned short TCS3472_SetInterrupt(char i){
unsigned short r;
    if(!TCS3472_Initialised)
      return 0x00;
      
    r = TCS3472_Read8(TCS3472_EN);
    
    if(i = 1)
        r |= TCS3472_EN_AIEN;
    else
        r &= ~TCS3472_EN_AIEN;

    TCS3472_Write8(TCS3472_EN, r);
    return 0x01;
}

unsigned short TCS3472_ClearInterrupt(){
   if(!TCS3472_Initialised)
      return 0x00;
    TCS3472_Write(TCS3472_CMD_BIT | 0x66);
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