#ifndef _TIMERS_H
#define _TIMERS_H

#include <stdint.h>
typedef struct{
 uint32_t millis;
 uint16_t temp_ms;
 uint16_t ms;
 uint8_t sec;
}Timers;


void InitTimer1();
void Get_Time();

#endif