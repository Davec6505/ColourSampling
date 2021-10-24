#include "String.h"



struct Constants str_vars;
struct Thresh Threshold;
char string[size][str_size];

const code char *comc[13]={
   "T",
   "G"
};
const code char *com[17]={
   "CONFIG",      //0
   "SENDC",        //1
   "SENDR",        //2
   "SENDG",        //3
   "SENDB",        //4
   "SENDA",        //5
   "READA",       //6
   "READR",       //7
   "READG",       //8
   "READB",       //9
   "READC",       //10
   "READT",       //11
   "READT_DN40",  //12
   "READA_SCL",   //13
   "READA_THV",    //14
   "WRITE_MAN",   //15
   "WRITE_RAW"   //16
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
      if(res0 > 0)
         res1 = StrChecker(string[1]);//Test current string index for equality return index
      else
          res1 = enum_num + 1;
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
        case SENDA :
             SendData(RawData);
             break;
        case READA :
             str = Read_Send_AllColour(0);
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
        case READA_SCL :
            str = Read_Send_AllColour(1);
            break;
        case READA_THV :
            str =  Read_Thresholds(); //TestFlash();//
            break;
        case WRITE_MAN :
            str = Write_Thresholds(1);
            break;
        case WRITE_RAW :
            str = Write_Thresholds(0);
            break;
        default:
            str = "No data requested!\r\n";
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
char* setstr(char conf[250]){
 int i;
      for(i=0;i < 64;i++){
         if((conf[i] == 0x0D)|| (conf[i] == 0x0A))
             break;
      }
      conf[i+1] = 0;

      return conf;
}

void remove_whitespaces(char* src){
char* dst = src;
int i,j;

      for(i=0,j=0;i<strlen(dst);i++){
          if(dst[j] == 0x32){
             j++;
             continue;
          }
          src[i] = dst[j];
      };
      src[i] = 0;
      UART1_Write_Text("White Space:= ");
      UART1_Write_Text(src);
      UART1_Write(0x0D);
      UART1_Write(0x0A);
}

/*********************************************************************
* Split the string according to the char
*********************************************************************/
int strsplit(char str[250], char c){
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
//endb:
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
char* Read_Send_AllColour(short data_src){
float FltData[3];//c,r,g,b;
char txtR[15];
char str[64];
unsigned int cct;
int err;
      // FltData = (float*)Malloc(3);
       //0 = get raw data 1 = get scaled data
       TCS3472_getRawData(RawData);
       if(data_src)
         GetScaledValues(RawData,&FltData);

       strcpy(str,"C || R | G | B | = || ");
       if(!data_src )
          sprintf(txtR,"%u",RawData[0]); //C
       else
          sprintf(txtR,"%3.2f",FltData[0]); //R
       strcat(str,txtR);
       strcat(str," || ");

       if(!data_src )
          sprintf(txtR,"%u",RawData[1]);  //R
       else
          sprintf(txtR,"%3.2f",FltData[1]); //G
       strcat(str,txtR);
       strcat(str," | ");

       if(!data_src )
          sprintf(txtR,"%u",RawData[2]);  //G
       else
          sprintf(txtR,"%3.2f",FltData[2]);  //B
       strcat(str,txtR);
       strcat(str," | ");

       if(!data_src ) {
          sprintf(txtR,"%u",RawData[3]);  //ERR
          strcat(str,txtR);
          strcat(str," || ");
      //cct = TCS3472_CalcColTemp_dn40(RawData,it);
         err = TCS3472_C2RGB_Error(RawData);
         sprintf(txtR,"%5d",err);
         strcat(str,txtR);
       }
       strcat(str," ||\r\n");
      // Free(FltData,sizeof(FltData));
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

/**********************************************************************
*Read flash memory for Threshold values
**********************************************************************/
char* Read_Thresholds(){
char txtR[15];
char str[64];
unsigned long Val;

       NVMRead(FLASH_Settings_VAddr,&Threshold);

       strcpy(str,"Cth || Rth | Gth | Bth | = || ");
       sprintf(txtR,"%u",Threshold.C_thresh);
       strcat(str,txtR);
       strcat(str," || ");

       sprintf(txtR,"%u",Threshold.R_thresh);
       strcat(str,txtR);
       strcat(str," | ");

       sprintf(txtR,"%u",Threshold.G_thresh);
       strcat(str,txtR);
       strcat(str," | ");

       sprintf(txtR,"%u",Threshold.B_thresh);
       strcat(str,txtR);
       strcat(str," ||\r\n ");

        return &str;
}

/*********************************************************************
*write the Threshold values to flash and ream for use
*********************************************************************/
char* Write_Thresholds(short data_src){
unsigned long val[128];
unsigned long pos;
int i,err;
char txtR[15];
char str[64];
         pos =  FLASH_Settings_PAddr;
        for(i=1;i<128;i++)
           val[i] = 0x00000000;
        err = NVMErasePage(pos);
        
        //0 = get the values for thresholds from the sensor
         if(!data_src)
             TCS3472_getRawData(RawData);
             
         if(data_src){
             if(string[2] != 0)
                 val[0] = atol(string[2]);
         }
         else
            val[0] = RawData[0];
         err = NVMWriteWord(pos,val[0]);

        pos += 4;
        if(data_src){
            if(string[3] != 0)
               val[1] = atol(string[3]);
        }else
             val[1] = RawData[1];
        err = NVMWriteWord(pos,val[1]);

        pos += 4;
        if(data_src){
            if(string[4] != 0)
               val[2] = atol(string[4]);
        }
        else
             val[2] = RawData[2];
        err = NVMWriteWord(pos,val[2]);

        pos += 4;
        if(data_src){
            if(string[5] != 0)
                val[3] = atol(string[5]);
        }
         else
              val[3] = RawData[3];
         err = NVMWriteWord(pos,val[3]);


       //  err = NVMWriteRow(FLASH_Settings_PAddr,val);
       
       sprintf(txtR,"%x",err);
       strcpy(str,txtR);
       strcat(str," ||\r\n ");
       return str;
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
   if(strlen(string[6])!=0){
     strncat(writebuff,string[6],strlen(string[6]));
     strcat(writebuff,":");
   }
  // while(!HID_Write(&writebuff,64)) ;
}

char* TestFlash(){
char txtR[20];
char str[64];
unsigned long val[128];
unsigned long Val;
unsigned int res,i;
 char* tr = "112233";
      // val[0] = atol(tr);//0x1234afaf;
      // for(i=1;i<128;i++)
      //     val[i] = 0xabcdef98;

      // res = NVMErasePage(FLASH_Settings_PAddr);
      // res = NVMWriteRow(FLASH_Settings_PAddr,val);
      // res = NVMWriteWord(FLASH_Settings_PAddr,val[0]);
       Val =  ReadFlash();


       strcpy(str,"Val || ");
       LongWordToHex(Val,txtR);
      // sprintf(txtR,"%8x",Val);//Threshold.C_thresh);
       strcat(str,txtR);
       strcat(str," || ");

       sprintf(txtR,"%u",res);//Threshold.R_thresh);
       strcat(str,txtR);
       strcat(str," ||\r\n ");

        return &str;
}