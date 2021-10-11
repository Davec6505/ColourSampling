#ifndef _TIMERS_H
#define _TIMERS_H

#include <stdint.h>
#include<time.h>

typedef struct{
 uint32_t millis;
 uint16_t temp_ms;
 uint16_t ms;
 uint8_t sec;
}Timers;


void InitTimer1();
void Get_Time();
void I2C2_TimeoutCallback(char errorCode);
#endif