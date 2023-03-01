#line 1 "C:/Users/Git/ColourSampling/PID.c"
#line 1 "c:/users/git/coloursampling/pid.h"
#line 29 "c:/users/git/coloursampling/pid.h"
typedef struct{
 char control;
 float PID_Kp, PID_Ki, PID_Kd;
 float PID_Err;
 float PID_Integrated;
 float PID_DiffValue;
 float PID_Prev_Integrated;
 float PID_Prev_Input;
 float PID_MinOutput, PID_MaxOutput;
 float Err;
 int PID_OffSet;
 int Result;
 unsigned short PID_First_Time:1;
}_PID;

extern _PID PID_;







char PID_Control(char *PID);




void Init_PID(float Kp, float Ki, float Kd, int MinOutput, int MaxOutput,int Offset);









void Reset_PID();


int PID_Calculate(float Sp, float Pv);
#line 3 "C:/Users/Git/ColourSampling/PID.c"
_PID PID_;

static char control;

char PID_Control(char *PID){
 if(1 == strlen(PID))PID_.control = 1;
 if(2 == strlen(PID))PID_.control = 2;
 if(3 == strlen(PID))PID_.control = 3;
 return strlen(PID);
}

 void Reset_PID()
{
 PID_.PID_Integrated = 0;
 PID_.PID_Prev_Input = 0;
 PID_.PID_First_Time =  1 ;
}


void Init_PID(float Kp, float Ki, float Kd, int MinOutput, int MaxOutput,int Offset)
{
 PID_.PID_Kp = Kp;
 PID_.PID_Ki = Ki;
 PID_.PID_Kd = Kd;
 PID_.PID_MinOutput = (float)MinOutput;
 PID_.PID_MaxOutput = (float)MaxOutput;
 PID_.PID_OffSet = Offset;
 PID_.PID_Integrated = 0;
 PID_.PID_DiffValue = 0;
 PID_.PID_Prev_Input = 0;
 PID_.PID_First_Time =  1 ;
}



int PID_Calculate( float Sp, float Pv){


 PID_.Err = Sp - Pv;


 PID_.PID_Err = PID_.Err * PID_.PID_Kp ;


 if(PID_.control >= 2){

 PID_.PID_Integrated = PID_.PID_Integrated + (PID_.Err * PID_.PID_Ki);

 if (PID_.PID_Integrated < PID_.PID_MinOutput)
 PID_.PID_Integrated = PID_.PID_MinOutput;
 if (PID_.PID_Integrated > PID_.PID_MaxOutput)
 PID_.PID_Integrated = PID_.PID_MaxOutput;


 if(PID_.control >=3){
 if (PID_.PID_First_Time){
 PID_.PID_First_Time =  0 ;
 PID_.PID_Prev_Input = Pv;
 }
 PID_.PID_DiffValue = (Pv - PID_.PID_Prev_Input) * PID_.PID_Kp;
 PID_.PID_Prev_Input = Pv;
 }

 }

 PID_.Result = (int)(PID_.PID_Err + PID_.PID_Integrated + PID_.PID_DiffValue)+PID_.PID_OffSet;


 if (PID_.Result < PID_.PID_MinOutput)
 PID_.Result = PID_.PID_MinOutput;
 if (PID_.Result > PID_.PID_MaxOutput)
 PID_.Result = PID_.PID_MaxOutput;
 return PID_.Result;
}
