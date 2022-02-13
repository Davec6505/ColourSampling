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
extern sfr sbit RTS_Dir;
extern sfr sbit CTS;
extern sfr sbit CTS_Dir;
extern sfr sbit RST;
extern sfr sbit RST_Dir;
extern sfr sbit PWR;
extern sfr sbit PWR_Dir;
extern sfr sbit STAT;
extern sfr sbit STAT_Dir;

//////////////////////////////////////////////////////
//defines
#define SimDebug
#define SimConfDebug
#define SMSDebug
#define ThingDebug
#define SigStrengthDebug
//#define RingBuffDeBug
//////////////////////////////////////////////////////
//constants and vars
extern char rcvSimTxt[150];
extern char SimTestTxt[150];
extern char rcvPcTxt[150];


//////////////////////////////////////////////////////
//structs and enuum
typedef struct{
 char  initial_str;
 int  init_inc;
 char  start: 1;
 int rssi;  //signal strength quality in dBm
 int ber;   //bit rate error report in %
 long lastSigMillis;
 int  sigStrength;
}Sim800Vars;
extern Sim800Vars SimVars;

struct RingBuffer{
char rcv_txt_fin;
char buff[1000];
unsigned int head;
unsigned int tail;
unsigned int last_head;
unsigned int last_tail;
short head_overflow;
};
extern struct RingBuffer RB;

struct Sim800Flash{
char SimDate[9];
char SimTime[9];
char SimCelNum[20];
char StartCell[20];
char WriteAPIKey[20];
char ReadAPIKey[20];
char APN[20];
char PWD[20];
};

struct sim_lengths{
  int l1;
  int l2;
  int l3;
  int l4;
  int l5;
  int l6;
  int l7;
  int lTotA;
  int mod;
  int l1l2;
  int l1l2l3;
  int l1l2l3l4;
};


//////////////////////////////////////////////////////
//function prototypes
void InitGSM3();
void WriteToFlashTemp();
char* GetValuesFromFlash();
void GetStrLengths();
int TestRingPointers();
void AT_Initial();
void WaitForResponse(short dly);
void RingToTempBuf();
void Load_Head_Tail_Pointers();
void RcvSimTxt();
void PwrDownGSM3();
void PwrUpGSM3();
char SetupIOT();
char WaitForSetupSMS(unsigned int Indx);
char GetAPI_Key_SMS();
char GetSMSText();
char ReadMSG(int msg_num);
void TestRecievedSMS(int res);
int RemoveSMSText(int sms_cnt);
int Test_Update_ThingSpeak(float degC);
void SendData(unsigned int* rgbc,float* rgbh,float degC);
char SendSMS(char sms_type,char cellNum);
void TestForOK(char c);
int  SignalStrength();
void PWM_SigStrength(int sigstrength);
#endif