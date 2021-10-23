#ifndef CONFIG_H
#define CONFIG_H

//////////////////////////////////////////
//includes
#include "TCS3472.h"
#include "_Timers.h"
#include "Sim800.h"
#include "built_in.h"
#include "String.h"

//////////////////////////////////////////
//defines
#define MainDebug



//////////////////////////////////////////
//constants and vars
extern unsigned short i;
extern char kk;

extern sfr sbit RD;
extern sfr sbit GR;
extern sfr sbit BL;


/////////////////////////////////////////
//structs unions and enums


/////////////////////////////////////////
//function prototypes
void ConfigPic();
void InitUart1();
void InitUart2();
void InitVars();
void InitISR();
void WriteData(char *_data);
void I2C2_SetTimeoutCallback(unsigned long timeout, void (*I2C_timeout)(char));

#endif