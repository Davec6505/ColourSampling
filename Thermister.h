#ifndef THERMISTER_H
#define THERMISTER_H

/////////////////////////////////////////
//sfr's
extern sfr sbit T0; // Abit is precisely defined in some external file, for example in the main program unit
extern sfr sbit T0_Dir;

/////////////////////////////////////////
//defines
#define T0_Pin 15;
#define ThermNominal 100000
#define BCOEF 4085
#define TEMPNOMINAL (25.00 + 273.15)


////////////////////////////////////////
//function prototypes
void setup_Thermister(int count);
int Adc_Average(int* adc);
void getTemp(float * t,int adc_ave);
#endif