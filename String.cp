#line 1 "C:/Users/Git/ColourSampling/String.c"
#line 1 "c:/users/git/coloursampling/string.h"










extern char string[ 10 ][ 64 ];

struct Constants{
 unsigned int num_string;
};


typedef struct pstrings_t{
 char* str;
 char c;
 char string[ 10 ][ 64 ];
 int (*StrSplitFp)(char* str,char c);
}PString;



PString InitString(char cmp);
char* StrChecker(int i);
int strsplit(char* str,char c);
void testStrings(char* writebuff);
char* setstr(char conf[64]);
void clr_str_arrays(char *str[10]);
#line 2 "C:/Users/Git/ColourSampling/String.c"
struct Constants str_vars;

char string[ 10 ][ 64 ];



PString InitString(char cmp){
 PString str_t;
 str_t.c = cmp;
 str_t.StrSplitFp = strsplit;
}

void clr_str_arrays(char str[10][64]){
int i,j;
 for(i = 0;i < 10;i++){
 for(j = 0;j<64;j++){
 str[i][j] = 0;
 }
 }
}

char* setstr(char conf[64]){
 int i;
 for(i=0;i < 64;i++){
 if((conf[i] == 0x0D)|| (conf[i] == 0x0A))
 break;
 }
 conf[i+1] = 0;

 return conf;
}

void testStrings(char* writebuff){
 if(strlen(string[0])!=0)strncat(writebuff,string[0],strlen(string[0]));
 if(strlen(string[1])!=0)strncat(writebuff,string[1],strlen(string[1]));
 if(strlen(string[2])!=0)strncat(writebuff,string[2],strlen(string[2]));
 if(strlen(string[3])!=0)strncat(writebuff,string[3],strlen(string[3]));
 if(strlen(string[4])!=0)strncat(writebuff,string[4],strlen(string[4]));
 if(strlen(string[5])!=0)strncat(writebuff,string[5],strlen(string[5]));

}

void WriteData(char *_data){

 HID_Write(_data,64) ;
}

int strsplit(char str[64], char c){
int i,ii,kk;
 ii=kk=0;
 for (i = 0; i < 64;i++){

 if(str[i] == c){
 string[kk][ii] = 0;
 kk++;
 ii=0;
 goto endb;
 }else{
 string[kk][ii] = str[i];
 ii++;
 }

endb:
 if(str[i]==0)
 break;
 }
 return kk;
}

char* StrChecker(int i){
 switch(i){
 case 0:
 return "AT";
 break;
 case 1:
 return "SET";
 break;
 case 2:
 return "CONF";
 break;
 case 3:
 return "GET";
 break;
 default:
 return " ";
 break;
 }
 return " ";
}
