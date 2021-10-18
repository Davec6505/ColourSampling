#ifndef TCS3472_H
#define TCS3472_H

/////////////////////////////////////////////////
//includes
#include <stdint.h>

extern sfr TCS3472_Initialised;

////////////////////////////////////////////////
//Defines

#define  LED
//#define Flourescent//

#define TCS3472_ADDW 0x52
#define TCS3472_ADDR 0x53      /**< I2C address || 0x19 = TCS34725/7 || 0x39 = TCS34721/3  || **/
#define TCS3472_CMD_BIT 0x80   /**< Command bit **/
#define TCS3472_CMD_AUTO_INC 0xA0  /**<Auto incrament protocol transaction>**/
#define TCS3472_CMD_SF 0xE0    /**<Special function>**/
#define TCS3472_EN  0x00       /**< Interrupt Enable register */
#define TCS3472_EN_AIEN 0x10   /**< RGBC Interrupt Enable */
#define TCS3472_EN_WEN  0x08   /**< Wait Enable - Writing 1 activates the wait timer */
#define TCS3472_EN_AEN  0x02   /**< RGBC Enable - Writing 1 actives the ADC, 0 disables it */
#define TCS3472_EN_PON  0x01   /**< Power on - Writing 1 activates the internal oscillator, 0 disables it */
#define TCS3472_ATIME   0x01   /**< Integration time */
#define TCS3472_WTIME   0x03   /**< Wait time (if TCS34725_ENABLE_WEN is asserted) */
#define TCS3472_WTIME_2_4MS 0xFF /**< WLONG0 = 2.4ms   WLONG1 = 0.029s */
#define TCS3472_WTIME_204MS 0xAB /**< WLONG0 = 204ms   WLONG1 = 2.45s  */
#define TCS3472_WTIME_614MS 0x00 /**< WLONG0 = 614ms   WLONG1 = 7.4s   */
#define TCS3472_AILTL 0x04 /**< Clear channel lower interrupt threshold (lower byte) */
#define TCS3472_AILTH 0x05 /**< Clear channel lower interrupt threshold (higher byte) */
#define TCS3472_AIHTL 0x06 /**< Clear channel upper interrupt threshold (lower byte) */
#define TCS3472_AIHTH 0x07 /**< Clear channel upper interrupt threshold (higher byte) */
#define TCS3472_PERS  0x0C /**< Persistence register - basic SW filtering mechanism for interrupts */
#define TCS3472_PERS_NONE 0b0000 /**< Every RGBC cycle generates an interrupt */
#define TCS3472_PERS_1_CYCLE 0b0001 /**< 1 clean channel value outside threshold range generates an interrupt */
#define TCS3472_PERS_2_CYCLE 0b0010 /**< 2 clean channel values outside threshold range generates an interrupt */
#define TCS3472_PERS_3_CYCLE 0b0011 /**< 3 clean channel values outside threshold range generates an interrupt */
#define TCS3472_PERS_5_CYCLE 0b0100 /**< 5 clean channel values outside threshold range generates an interrupt */
#define TCS3472_PERS_10_CYCLE 0b0101 /**< 10 clean channel values outside threshold range generates an interrupt*/
#define TCS3472_PERS_15_CYCLE 0b0110 /**< 15 clean channel values outside threshold range generates an interrupt*/
#define TCS3472_PERS_20_CYCLE 0b0111 /**< 20 clean channel values outside threshold range generates an interrupt*/
#define TCS3472_PERS_25_CYCLE 0b1000 /**< 25 clean channel values outside threshold range generates an interrupt*/
#define TCS3472_PERS_30_CYCLE 0b1001 /**< 30 clean channel values outside threshold range generates an interrupt*/
#define TCS3472_PERS_35_CYCLE 0b1010 /**< 35 clean channel values outside threshold range generates an interrupt*/
#define TCS3472_PERS_40_CYCLE 0b1011 /**< 40 clean channel values outside threshold range generates an interrupt*/
#define TCS3472_PERS_45_CYCLE 0b1100 /**< 45 clean channel values outside threshold range generates an interrupt*/
#define TCS3472_PERS_50_CYCLE 0b1101 /**< 50 clean channel values outside threshold range generates an interrupt*/
#define TCS3472_PERS_55_CYCLE 0b1110 /**< 55 clean channel values outside threshold range generates an interrupt*/
#define TCS3472_PERS_60_CYCLE 0b1111 /**< 60 clean channel values outside threshold range generates an interrupt*/
#define TCS3472_CONFIG 0x0D          /**< Configuration **/
#define TCS3472_CONFIG_WLONG 0x02    /**< Choose between short and long (12x) wait times via TCS3472_WTIME */
#define TCS3472_CONTROL 0x0F         /**< Set the gain level for the sensor */
#define TCS3472_ID 0x12              /**< 0x44 = TCS34721/TCS34725, 0x4D = TCS34723/TCS34727 , 0x14 = TCS34711 & TCS34715,0x1D = TCS34713 & TCS34717 */
#define TCS3472_STATUS 0x13          /**< Device status **/
#define TCS3472_STATUS_AINT 0x10     /**< RGBC Clean channel interrupt */
#define TCS3472_STATUS_AVALID 0x01   /**< Indicates that the RGBC channels have completed an integration cycle */
#define TCS3472_CDATAL 0x14          /**< Clear channel data low byte */
#define TCS3472_CDATAH 0x15          /**< Clear channel data high byte */
#define TCS3472_RDATAL 0x16          /**< Red channel data low byte */
#define TCS3472_RDATAH 0x17          /**< Red channel data high byte */
#define TCS3472_GDATAL 0x18          /**< Green channel data low byte */
#define TCS3472_GDATAH 0x19          /**< Green channel data high byte */
#define TCS3472_BDATAL 0x1A          /**< Blue channel data low byte */
#define TCS3472_BDATAH 0x1B          /**< Blue channel data high byte */


/////////////////////////////////////////////////////
//Structs and enums

/** Integration time settings for TCS34725 */
typedef enum {
  TCS3472_INTEGRATIONTIME_2_4MS = 0xFF, /**<  2.4ms - 1 cycle    - Max Count: 1024  */
  TCS3472_INTEGRATIONTIME_24MS  = 0xF6, /**<  24ms  - 10 cycles  - Max Count: 10240 */
  TCS3472_INTEGRATIONTIME_50MS  = 0xEB, /**<  50ms  - 20 cycles  - Max Count: 20480 */
  TCS3472_INTEGRATIONTIME_101MS = 0xD5, /**<  101ms - 42 cycles  - Max Count: 43008 */
  TCS3472_INTEGRATIONTIME_154MS = 0xC0, /**<  154ms - 64 cycles  - Max Count: 65535 */
  TCS3472_INTEGRATIONTIME_700MS = 0x00  /**<  700ms - 256 cycles - Max Count: 65535 */
} TCS3472_IntegrationTime_t;


/** Gain settings for TCS34725  */
typedef enum {
  TCS3472_GAIN_1X  = 0x00,  /**<  No gain  */
  TCS3472_GAIN_4X  = 0x01,  /**<  4x gain  */
  TCS3472_GAIN_16X = 0x02, /**<  16x gain */
  TCS3472_GAIN_60X = 0x03  /**<  60x gain */
} TCS3472_Gain_t;

/** Device ID **/
typedef enum{
  TCS3472_1_5  = 0x44,
  TCS3472_3_7  = 0x4D,
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

////////////////////////////////////////////////////////
//Vars and Consts
extern unsigned int RawData[4];
extern unsigned int CCT;


////////////////////////////////////////////////////////
//function prototypes
unsigned short TCS3472_Init(TCS3472_IntegrationTime_t It,TCS3472_Gain_t gain , TCS3472x Id  );
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
#endif