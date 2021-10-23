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
}Timers;

extern Timers TMR0;

typedef struct{
unsigned int ms;
unsigned int sec;
unsigned int min;
unsigned int hr;
unsigned short one_per_sec;
}Timer_Setpoint;



//////////////////////////////////////////////////////
//function prototypes
extern  Timer_Setpoint T0_SP;
void InitTimer1();
void Get_Time();

void I2C2_TimeoutCallback(char errorCode);
#endif