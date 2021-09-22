#ifndef STRING_H
#define STRING_H

/////////////////////////////////////////////////

//////////////////////////////////////////////////
//defines
#define size 10
#define str_size 64
//structs and enums
extern char string[size][str_size];//={"HELLO WORLD","HELLO WORLD","HELLO WORLD","HELLO WORLD","HELLO WORLD"};

struct Constants{
   unsigned int num_string;
};


typedef struct pstrings_t{
  char* str;
  char  c;
  char string[size][str_size];
  int (*StrSplitFp)(char* str,char c);
}PString;

/////////////////////////////////////////////////
//function prototypes
PString InitString(char cmp);
char* StrChecker(int i);
int strsplit(char* str,char c);
void testStrings(char* writebuff);
char* setstr(char conf[64]);
void clr_str_arrays(char *str[10]);
#endif