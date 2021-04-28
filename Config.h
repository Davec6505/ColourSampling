#ifndef CONFIG_H
#define CONFIG_H

#include "TCS3472.h"
#include "_Timers.h"
#include "built_in.h"

extern unsigned short i;


void ConfigPic();
void InitISR();
void WriteData(char *_data);
#endif