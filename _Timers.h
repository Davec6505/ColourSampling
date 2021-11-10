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
unsigned int secSP;
unsigned int minSP;
unsigned int hrSP;
unsigned short one_per_sec;
}Timer_Setpoint;

extern  Timer_Setpoint T0_SP;

//////////////////////////////////////////////////////
//function prototypes

void InitTimer1();
void Get_Time();
void Day_Month(int hr,int day,int mnth);
void I2C2_TimeoutCallback(char errorCode);
#endif