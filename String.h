#ifndef STRING_H
#define STRING_H

/////////////////////////////////////////////////
//includes
#include "Config.h"
#include "Flash_R_W.h"
#include <stdint.h>
#include "TCS3472.h"
#include "Sim800.h"
#include "LM35.h"
//////////////////////////////////////////////////
//defines
//#define StrDebug

#define enum_num ((ERROR - CONFIG)+1)
#define size 21
#define str_size 64
//structs and enums
extern char string[size][str_size];

enum ControlColorIO{
CONFIG,             //0
SENDC,              //1
SENDR,              //2
SENDG,              //3
SENDB,              //4
SENDA,              //5
READA,              //6
READR,              //7
READG,              //8
READB,              //9
READC,              //10
READT,              //11
READT_DN40,         //12
READA_SCL,          //13
READA_THV,          //14
WRITE_MAN,          //15
WRITE_RAW,          //16
START,              //17
CANCEL,             //18
READA_HUE,          //19
READA_DEG,          //20
ERROR               //21
};

struct Constants{
   unsigned int num_string;
};


typedef struct pstrings_t{
  char* str;
  char  c;
  char string[size][str_size];
  int (*StrSplitFp)(char* str,char c);
}PString;

struct Thresh{
//Threshold values
 uint16_t C_thresh;
 uint16_t R_thresh;
 uint16_t G_thresh;
 uint16_t B_thresh;
 uint16_t time_to_log;
};
extern struct Thresh Threshold;

/////////////////////////////////////////////////
//Variables
extern char readbuff[64];
extern char writebuff[64];

/////////////////////////////////////////////////
//ototypes
int DoStrings(int num);
PString InitString(char cmp);
int StrChecker(char **arr);
char* findnumber(char* str);
int strsplit(char* str,char c);
void strsplit2(char**mdarr,char str[250], char c);
void testStrings(char* writebuff);
char* setstr(char conf[250]);
void clr_str_arrays(char *str[10]);
char* RemoveWhiteSpace(char* str);
char* Read_Send_AllColour(short data_src);
char* Read_Send_OneColour(int colr);
char* ReadHUE();
char* Read_Thresholds();
char* Write_Thresholds(short data_src);
int Get_It();
int Get_Gain();
char* TestFlash();
char* RemoveChars(char* str,char a,char b);
void PrintHandler(char c);
#endif