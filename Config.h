#ifndef CONFIG_H
#define CONFIG_H

#include "TCS3472.h"
#include "_Timers.h"
#include "built_in.h"
#include "String.h"

extern unsigned short i;
extern char kk;


void ConfigPic();
void InitVars();
void InitISR();
void WriteData(char *_data);

#endif