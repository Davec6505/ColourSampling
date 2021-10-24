#ifndef SIM800_H
#define SIM800_H


//////////////////////////////////////////////////////
//includes
#include "String.h"
#include "_Timers.h"
#include "built_in.h"

/////////////////////////////////////////////////////
//sfr's
extern sfr sbit RTS;
extern sfr sbit CRS;
extern sfr sbit RST;
extern sfr sbit PWR;
extern sfr sbit STAT;

//////////////////////////////////////////////////////
//defines
//#define SimDebug
#define SimConfDebug

//////////////////////////////////////////////////////
//constants and vars
extern char rcvSimTxt[150];
extern char SimTestTxt[150];
extern char rcvPcTxt[150];


//////////////////////////////////////////////////////
//structs and enuum
typedef struct{
 uint8_t  initial_str;
 uint16_t time_to_log;
 uint16_t num_of_sms_bytes;
 char  init_inc;
}Sim800Vars;
extern Sim800Vars SimVars;

struct RingBuffer{
char rcv_txt_fin;
char buff[1000];
unsigned int head;
unsigned int tail;
unsigned int last_head;
unsigned int last_tail;
};

extern struct RingBuffer RB;



//////////////////////////////////////////////////////
//function prototypes
void InitGSM3();
void RcvSimTxt();
void PwrUpGSM3();
char SetupIOT();
char WaitForSetupSMS();
int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h);
void SendData(unsigned int* rgbc);
char SendSMS(char sms_type);
#endif