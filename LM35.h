#ifndef LM35_H
#define LM35_H

//////////////////////////////////////////
//includes

/////////////////////////////////////////
//sfr's
extern sfr sbit LM35_Pin; // Abit is precisely defined in some external file, for example in the main program unit
extern sfr sbit LM35_Pin_Dir;

//////////////////////////////////////////
//defines
#define LM35Pin 15

 //////////////////////////////////////////
//constants and vars


/////////////////////////////////////////
//structs unions and enums



/////////////////////////////////////////
//function prototypes
void setup_LM35(int count);
int LM35_Adc_Average(int* adc,int adc_pin);
int LM35_Adc_Single(int adc,int adc_pin);
void getLM35Temp(float * t,int adc_ave);
#endif