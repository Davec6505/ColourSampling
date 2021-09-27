#include "String.h"



struct Constants str_vars;

char string[size][str_size];
int enum_val;
const code char *com[12]={
   "CONFIG",  //0
   "SETALL",  //1
   "SETR",    //2
   "SETG",    //3
   "SETB",    //4
   "SETC"     //5
   "READALL", //6
   "READR",   //7
   "READG",   //8
   "READB",   //9
   "READC",   //10
   "READTEMP" //11
};


PString InitString(char cmp){
    PString str_t;
    str_t.c = cmp;
    str_t.StrSplitFp = strsplit;
}

/*********************************************************************
* Get the request from the USB buffer and sort accordingly
*********************************************************************/
int DoStrings(int num){
char *str;
 char *result,conf[64] = "";
 char txtR[6];
 int res;
      res = -1;
      clr_str_arrays(string);     //clear the strings in the array
      memcpy(conf,readbuff,num);  //copy the USB buffer to a temp arrar
      result = setstr(conf);      //look for '\r' '\n' and move result to a string
      res = strsplit(result,'+'); //split the string into an array of strings
      res = StrChecker(string[1]);//Test current string index for equality return index

      memset(writebuff,0,64);     //empty usb write buffer
#ifdef StrDebug
      sprintf(txtR,"%u",res);
      strcat(writebuff,txtR);
      testStrings(&writebuff);
      strcat(writebuff,"\r\n");
      while(!HID_Write(&writebuff,64));
#endif
/*if(res == READALL){
          str = Read_Send_AllColour();
      }
      else if(res == READR){
          Read_Send_OneColour(READR);
          return READR;
      }
      else if(res == READG){
          Read_Send_OneColour(READG);
          return READG;
      }
      else if(res == READB){
          Read_Send_OneColour(READB);
          return READB;
      }
      else if(res == READC){
          Read_Send_OneColour(READC);
          return READC;
      }
      else
          return -1;*/
      //strncat(writebuff,str,strlen(str));
      //while(!HID_Write(&writebuff,64));
ret:
   return 0;
}

/*********************************************************************
* Clear the string within the 2D matrix
*********************************************************************/
void clr_str_arrays(char str[10][64]){
int i,j;
    for(i = 0;i < 10;i++){
       for(j = 0;j<64;j++){
           str[i][j] = 0;
       }
    }
}

/**********************************************************************
* check the usb buffer and test for line feed or carrage return
**********************************************************************/
char* setstr(char conf[64]){
 int i;
      for(i=0;i < 64;i++){
         if((conf[i] == 0x0D)|| (conf[i] == 0x0A))
             break;
      }
      conf[i+1] = 0;

      return conf;
}

/*********************************************************************
* Split the string according to the char
*********************************************************************/
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

/*********************************************************************
* check strings for equality and return the index
*********************************************************************/
int StrChecker(char str[64]){
 int i;
    for(i = 0;i < 12;i++){
         if(strncmp(str,com[i],strlen(com[i]))==0)
            break;
    }
   return i;
}

/*********************************************************************
*Debug feature to write the split strings from the 2D matrix
*********************************************************************/
void testStrings(char* writebuff){
   if(strlen(string[0])!=0)strncat(writebuff,string[0],strlen(string[0]));
   if(strlen(string[1])!=0)strncat(writebuff,string[1],strlen(string[1]));
   if(strlen(string[2])!=0)strncat(writebuff,string[2],strlen(string[2]));
   if(strlen(string[3])!=0)strncat(writebuff,string[3],strlen(string[3]));
   if(strlen(string[4])!=0)strncat(writebuff,string[4],strlen(string[4]));
   if(strlen(string[5])!=0)strncat(writebuff,string[5],strlen(string[5]));
  // while(!HID_Write(&writebuff,64)) ;
}

/*********************************************************************
* Write output to USB !! under construction
*********************************************************************/
void WriteData(char *_data){
      // UART2_Write_Text(_data);
      //HID_Write(_data,64) ;
      memset(writebuff,0,64);
      strncat(writebuff,_data,strlen(_data));
      HID_Write(&writebuff,64);
}

/********************************************************************
* Read TCS3472 and send Data
********************************************************************/
char* Read_Send_AllColour(){
char txtR[6];
char *str;
       TCS3472_getRawData(RawData);

       str = "C || R | G | B | = || ";
       sprintf(txtR,"%u",RawData[0]);
       strcat(str,txtR);
       strcat(str," || ");

       sprintf(txtR,"%u",RawData[1]);
       strcat(str,txtR);
       strcat(str," | ");

       sprintf(txtR,"%u",RawData[2]);
       strcat(str,txtR);
       strcat(str," | ");

       sprintf(txtR,"%u",RawData[3]);
       strcat(str,txtR);
       strcat(str," || ");

      CCT =TCS3472_CalcColTemp_dn40(&RawData,it);
       sprintf(txtR,"%u",CCT);
       strcat(str,txtR);
       strcat(str," ||\r\n");

        return str;
}

void Read_Send_OneColour(int colr){
unsigned int col;
char txtR;
char str[64];
     memset(str,'_',64);
     //WriteData(str);
     switch(colr){
        case 7:
           col = TCS3472_Read16(TCS3472_RDATAL);
           sprintf(txtR,"%u",col);
           break;
        case 8:
           col = TCS3472_Read16(TCS3472_GDATAL);
           sprintf(txtR,"%u",col);
           break;
        case 9:
           col = TCS3472_Read16(TCS3472_BDATAL);
           sprintf(txtR,"%u",col);
           break;
        case 10:
           col = TCS3472_Read16(TCS3472_CDATAL);
           sprintf(txtR,"%u",col);
           break;
     }
         WriteData(str);
         WriteData("\r\n");
}