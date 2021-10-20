#ifndef _TIMERS_H
#define _TIMERS_H

#include <stdint.h>
#include<time.h>

typedef struct{
 uint32_t millis;
 uint16_t temp_ms;
 uint8_t temp_sec;
 uint8_t temp_min;
 uint8_t temp_hr;
 uint16_t ms;
 uint8_t sec;
 uint8_t min;
 uint8_t hr;
}Timers;


void InitTimer1();
void Get_Time();
void Update_ThingSpeak(unsigned int* rgbc);
void I2C2_TimeoutCallback(char errorCode);
#endif