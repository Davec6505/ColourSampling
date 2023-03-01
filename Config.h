#ifndef CONFIG_H
#define CONFIG_H

//////////////////////////////////////////
//includes
#include "TCS3472.h"
#include "_Timers.h"
#include "Sim800.h"
#include "built_in.h"
#include "String.h"
//#include "Thermister.h"
#include "LM35.h"
#include "PID.h"
//////////////////////////////////////////
//defines
#define ResetFlash
#define MainDebug
//#define ThermisterDebug
//#define LedDeBug

#define ApplicationDbg
#define MainFlashDebug
//#define MainColDebug
#define MainSigStrengthDebug

#define NULL 0
//////////////////////////////////////////
//constants and vars
extern unsigned short i;
extern char kk;

extern sfr sbit RD;
extern sfr sbit GR;
extern sfr sbit BL;

extern unsigned int current_duty2, current_duty3;
extern unsigned int pwm_period2, pwm_period3;
/////////////////////////////////////////
//structs unions and enums


/////////////////////////////////////////
//function prototypes
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
#endif