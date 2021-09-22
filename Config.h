#ifndef CONFIG_H
#define CONFIG_H

#include "TCS3472.h"
#include "_Timers.h"
#include "built_in.h"
#include "String.h"

extern unsigned short i;
extern char kk;
extern char readbuff[64];
extern char writebuff[64];

void ConfigPic();
void InitISR();
void WriteData(char *_data);

#endif