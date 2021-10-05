#ifndef STRING_H
#define STRING_H

/////////////////////////////////////////////////
//includes
#include "Flash_R_W.h"
#include <stdint.h>
#include "TCS3472.h"

//////////////////////////////////////////////////
//defines
#define enum_num (WRITE_SCL - CONFIG)+1
//#define StrDebug

#define size 20
#define str_size 64
//structs and enums
extern char string[size][str_size];//={"HELLO WORLD","HELLO WORLD","HELLO WORLD","HELLO WORLD","HELLO WORLD"};

enum ControlColorIO{
CONFIG,             //0
SETA,
SETR,
SETG,
SETB,
SETC,
READA,              //6
READR,              //7
READG,              //8
READB,              //9
READC,              //10
READT,              //11
READT_DN40,         //12
READA_SCL,          //13
WRITE_SCL           //14
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
 uint16_t C_thresh;
 uint16_t R_thresh;
 uint16_t G_thresh;
 uint16_t B_thresh;
};


/////////////////////////////////////////////////
//Variables
extern char readbuff[64];
extern char writebuff[64];

/////////////////////////////////////////////////
//ototypes
int DoStrings(int num);
PString InitString(char cmp);
int StrChecker(char **arr);
int strsplit(char* str,char c);
void testStrings(char* writebuff);
char* setstr(char conf[64]);
void clr_str_arrays(char *str[10]);
char* Read_Send_AllColour();
char* Read_Send_OneColour(int colr);
char* Read_Thresholds();
char* Write_Thresholds();
int Get_It();
int Get_Gain();
#endif