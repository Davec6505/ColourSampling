#include "PID.h"

_PID PID_;

static char control;

char PID_Control(char *PID){
     if(1 == strlen(PID))PID_.control = 1;
     if(2 == strlen(PID))PID_.control = 2;
     if(3 == strlen(PID))PID_.control = 3;
  return strlen(PID);
}
//Rest_PID to null values of retained values/////////
 void Reset_PID()
{
  PID_.PID_Integrated = 0;
  PID_.PID_Prev_Input = 0;
  PID_.PID_First_Time = TRUE;
}

//Initialize the PID Loop/////////////////////////////
void Init_PID(float Kp, float Ki, float Kd, int MinOutput, int MaxOutput,int Offset)
{
  PID_.PID_Kp         = Kp;
  PID_.PID_Ki         = Ki;
  PID_.PID_Kd         = Kd;
  PID_.PID_MinOutput  = (float)MinOutput;
  PID_.PID_MaxOutput  = (float)MaxOutput;
  PID_.PID_OffSet     = Offset;
  PID_.PID_Integrated = 0;
  PID_.PID_DiffValue  = 0;
  PID_.PID_Prev_Input = 0;
  PID_.PID_First_Time = TRUE;
}


//calculate the PID output///////////////////////////
int PID_Calculate( float Sp, float Pv){

  //calculate Error value////////////////////////////
   PID_.Err = Sp - Pv;
  //calculate proportional value/////////////////////

   PID_.PID_Err = PID_.Err  * PID_.PID_Kp  ;

  //Calculate integrated value at Ti interval////////
   if(PID_.control >= 2){
     //Calculate integrated value /////////////////////
      PID_.PID_Integrated = PID_.PID_Integrated + (PID_.Err * PID_.PID_Ki);
     // limit it to output minimum and maximum
      if (PID_.PID_Integrated < PID_.PID_MinOutput)
        PID_.PID_Integrated = PID_.PID_MinOutput;
      if (PID_.PID_Integrated > PID_.PID_MaxOutput)
        PID_.PID_Integrated = PID_.PID_MaxOutput;

     //calculate derivative value/////////////////////
      if(PID_.control >=3){
         if (PID_.PID_First_Time){      // to avoid a huge DiffValue the first time (PID_Prev_Input = 0)
           PID_.PID_First_Time = FALSE;
           PID_.PID_Prev_Input = Pv;
         }
        PID_.PID_DiffValue =  (Pv - PID_.PID_Prev_Input) * PID_.PID_Kp;
         PID_.PID_Prev_Input = Pv;
      }

   }
   //calculate total///////////////////////////////
   PID_.Result = (int)(PID_.PID_Err + PID_.PID_Integrated  + PID_.PID_DiffValue)+PID_.PID_OffSet; // mind the minus sign!!!

   // limit it to output minimum and maximum
   if (PID_.Result < PID_.PID_MinOutput)
      PID_.Result = PID_.PID_MinOutput;
   if (PID_.Result > PID_.PID_MaxOutput)
      PID_.Result = PID_.PID_MaxOutput;
   return PID_.Result;
}