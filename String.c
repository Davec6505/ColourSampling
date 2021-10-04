#include "String.h"



struct Constants str_vars;

char string[size][str_size];

const code char *comc[13]={
   "T",
   "G"
};
const code char *com[13]={
   "CONFIG",  //0
   "SETA",  //1
   "SETR",    //2
   "SETG",    //3
   "SETB",    //4
   "SETC",     //5
   "READA", //6
   "READR",   //7
   "READG",   //8
   "READB",   //9
   "READC",   //10
   "READT", //11
   "READT_DN40" //12
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
char *str,err,i;
 char *result,conf[64] = "";
 char txtR[6];
 int res0,res1,Int_Time,Gain;

    //  str = calloc(64,sizeof(char));

      res0 = -1;
      clr_str_arrays(string);     //clear the strings in the array
      memcpy(conf,readbuff,num);  //copy the USB buffer to a temp arrar
      result = setstr(conf);       //look for '\r' '\n' and move result to a string
      res0 = strsplit(result,'+'); //split the string into an array of strings return num of arr's
      res1 = StrChecker(string[1]);//Test current string index for equality return index

      memset(writebuff,0,64);     //empty usb write buffer

#ifdef StrDebug
      sprintf(txtR,"%u",res1);
      strcat(writebuff,txtR);
      strcat(writebuff,":");
      testStrings(&writebuff);
      strcat(writebuff,"\r\n");
      while(!HID_Write(&writebuff,64));
#else
     switch(res1){
        case CONFIG :
             if(!strcmp(string[2],comc[0])){
               if(string[3] != 0){
                  Int_Time = atoi(string[3]);
                  for(i=0;i<Int_Time;i++){
                       LATE3_bit = !LATE3_bit;
                       Delay_ms(100);
                  }
               }
               err = TCS3472_SetIntergration_Time(Int_Time);
               if(err > 0)
               for(i=0;i<err;i++){
                   LATE3_bit = !LATE3_bit;
                   Delay_ms(500);
               }
             }else if(!strcmp(string[2],comc[1])){
                if(string[3] != 0){
                  Gain = atoi(string[3]);
                  for(i=0;i<Gain;i++){
                       LATE3_bit = !LATE3_bit;
                       Delay_ms(100);
                  }
               }
               err = TCS3472_SetGain(Gain);
               if(err > 0)
               for(i=0;i<err;i++){
                   LATE3_bit = !LATE3_bit;
                   Delay_ms(500);
               }
             }
             LATE3_bit = 0;
             break;
        case READA :
             str = Read_Send_AllColour();             
             break;
        case READR :
            str = Read_Send_OneColour(READR);
            break;
        case READG :
            str = Read_Send_OneColour(READG);
            break;
        case READB :
            str = Read_Send_OneColour(READB);
            break;
        case READC :
            str = Read_Send_OneColour(READC);
            break;
        case READT :
            str = Read_Send_OneColour(READT);
            break;
        case READT_DN40 :
            str = Read_Send_OneColour(READT_DN40);
            break;
        default:
           strncat(str,"No data requested!",18);
           break;
      }
         
     //////////////////////////////////////////////////
     //write output to usb
      strncat(writebuff,str,strlen(str));
      while(!HID_Write(&writebuff,64));
#endif
      //free(str);
ret:
   return 0;
}

/*********************************************************************
* Clear the string within the 2D matrix
*********************************************************************/
void clr_str_arrays(char str[20][64]){
int i,j;
    for(i = 0;i < 20;i++){
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
          continue;//goto endb;
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
int StrChecker(char *str){
static int enum_val;
static bit once;
int i;
    if(!once){
       once = 1;
       enum_val = enum_num;
    }
    for(i = 0;i < enum_val;i++){
         if(strncmp(str,com[i],strlen(str)-1)==0)
            break;
    }
   return i;
}

/*********************************************************************
* Write output to USB !! under construction
*********************************************************************/
void WriteData(char *_data){
      // UART2_Write_Text(_data);
      //HID_Write(_data,64) ;
      memset(writebuff,0,64);
      strncpy(writebuff,_data,strlen(_data));
      HID_Write(&writebuff,64);
}

/********************************************************************
* Read TCS3472 and send RGBC Data
********************************************************************/
char* Read_Send_AllColour(){
float c,r,g,b;
char txtR[15];
char str[64];
unsigned int cct;
int err;
       TCS3472_getRawData(RawData);
       c =  (float)RawData[0];
       r =  (float)RawData[1];
       g =  (float)RawData[2];
       b =  (float)RawData[3];
       
       r /= c;
       r *= 256.0;
       g /= c;
       g *= 256.0;
       b /= c;
       b *= 256.0;
       
       strcpy(str,"C || R | G | B | = || ");
       sprintf(txtR,"%u",RawData[0]);
       strcat(str,txtR);
       strcat(str," || ");

       sprintf(txtR,"%3.2f",r);//RawData[1]);
       strcat(str,txtR);
       strcat(str," | ");

       sprintf(txtR,"%3.2f",g);//RawData[2]);
       strcat(str,txtR);
       strcat(str," | ");

       sprintf(txtR,"%3.2f",b);//RawData[3]);
       strcat(str,txtR);
       strcat(str," || ");

      //cct = TCS3472_CalcColTemp_dn40(RawData,it);
       err = TCS3472_C2RGB_Error(RawData);
       sprintf(txtR,"%5d",err);
       strcat(str,txtR);
       strcat(str," ||\r\n");

        return &str;
}

/********************************************************************
* Read TCS3472 and send individual Data
********************************************************************/
char* Read_Send_OneColour(int colr){
unsigned int col;
char txtR[10];
char str[64];
     switch(colr){
        case READR:
           col = TCS3472_Read16(TCS3472_RDATAL);
           strcpy(str,"R = || ");
           sprintf(txtR,"%5u",col);
           strcat(str,txtR);
           strcat(str," ||\r\n");
           break;
        case READG:
           col = TCS3472_Read16(TCS3472_GDATAL);
           strcpy(str,"G = || ");
           sprintf(txtR,"%5u",col);
           strcat(str,txtR);
           strcat(str," ||\r\n");
           break;
        case READB:
           col = TCS3472_Read16(TCS3472_BDATAL);
           strcpy(str,"B = || ");
           sprintf(txtR,"%u",col);
           strcat(str,txtR);
           strcat(str," ||\r\n");
           break;
        case READC:
           col = TCS3472_Read16(TCS3472_CDATAL);
           strcpy(str,"C = || ");
           sprintf(txtR,"%u",col);
           strcat(str,txtR);
           strcat(str," ||\r\n");
           break;
        case READT:
           TCS3472_getRawData(RawData);
           col = TCS3472_CalcColTemp(RawData[1],RawData[3],RawData[3]);
           strcpy(str,"T = || ");
           sprintf(txtR,"%u",col);
           strcat(str,txtR);
           strcat(str," ||\r\n");
           break;
        case READT_DN40:
           TCS3472_getRawData(RawData);
           col = TCS3472_CalcColTemp_dn40(RawData,it);
           strcpy(str,"T_DN40 = || ");
           sprintf(txtR,"%u",col);
           strcat(str,txtR);
           strcat(str," ||\r\n");
           break;
     }
     return &str;
}

int Get_It(){
    return 0;
}

int Get_Gain(){
    return 0;
}

 /*********************************************************************
*Debug feature to write the split strings from the 2D matrix
*********************************************************************/
void testStrings(char* writebuff){
   if(strlen(string[0])!=0){
     strncat(writebuff,string[0],strlen(string[0]));
     strcat(writebuff,":");
   }
   if(strlen(string[1])!=0){
     strncat(writebuff,string[1],strlen(string[1]));
     strcat(writebuff,":");
   }
   if(strlen(string[2])!=0){
     strncat(writebuff,string[2],strlen(string[2]));
     strcat(writebuff,":");
   }
   if(strlen(string[3])!=0){
     strncat(writebuff,string[3],strlen(string[3]));
     strcat(writebuff,":");
   }
   if(strlen(string[4])!=0){
     strncat(writebuff,string[4],strlen(string[4]));
     strcat(writebuff,":");
   }
   if(strlen(string[5])!=0){
     strncat(writebuff,string[5],strlen(string[5]));
     strcat(writebuff,":");
   }
  // while(!HID_Write(&writebuff,64)) ;
}