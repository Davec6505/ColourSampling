#ifndef PID_H
#define PID_H
 /*
----------------------------------------------------------
---- PID library with fixed calculation time interval ----
----------------------------------------------------------
*/
//////////////////////////////////////////
//includes

/////////////////////////////////////////
//sfr's


//////////////////////////////////////////
//defines

#define Uint unsigned int
#define BOOL bit
#define TRUE 1
#define FALSE 0

 //////////////////////////////////////////
//constants and vars


/////////////////////////////////////////
//structs unions and enums
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

//extern  BOOL PID_First_Time;


/////////////////////////////////////////
//function prototypes

char PID_Control(char *PID);
//write 'P" for proportional only
//write "PI" for proportional and intergral control
//write "PID" for proportional intergral and derivative control

void Init_PID(float Kp, float Ki, float Kd, int MinOutput, int MaxOutput,int Offset);
// Initialises the PID engine
// Kp = the "proportional" error multiplier
// Ki = the "integrated value" error multiplier
// Kd = the "derivative" error multiplier
// MinOutput = the minimal value the output value can have (should be < 0)
// MaxOutput = the maximal value the output can have (should be > 0)
// PID_OffSet = Offset
// IntergralTime = the intergral and derivative calculation time

void Reset_PID();
// Re-initialises the PID engine without change of settings

int PID_Calculate(float Sp, float Pv);
// To be called at a regular time interval (e.g. every 100 msec)
// Setpoint: the target value for "InputValue" to be reached
// InputValue: the actual value measured in the system
// Functionresult: PID function of (SetPoint - InputValue),
//   a positive value means "InputValue" is too low (< SetPoint), the process should take action to increase it
//   a negative value means "InputValue" is too high (> SetPoint), the process should take action to decrease it



#endif