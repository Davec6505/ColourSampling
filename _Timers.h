#ifndef _TIMERS_H
#define _TIMERS_H


/////////////////////////////////////////////
//includes
#include <stdint.h>
#include<time.h>
#include "Sim800.h"

////////////////////////////////////////////
//defines
#define TmrDebug



///////////////////////////////////////////
//Structs Enums and unions

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
unsigned short one_per_sec  : 1;
unsigned short one_per_Xmin : 1;
}Timer_Setpoint;

extern  Timer_Setpoint T0_SP;

//////////////////////////////////////////////////////
//function prototypes
void InitTimers();
void InitTimer1();
void InitTimer2_3();
void Get_Time();
void Day_Month(int hr,int day,int mnth);
void I2C2_TimeoutCallback(char errorCode);
#endif