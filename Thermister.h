#ifndef THERMISTER_H
#define THERMISTER_H


extern sfr sbit T0; // Abit is precisely defined in some external file, for example in the main program unit
extern sfr sbit T0_Dir;

#define T0_Pin 15;
#define ThermNominal 100000
#define BCOEF 4085
#define TEMPNOMINAL (25.00 + 273.15)


void setup_Thermister();
void getTemp(float * t);
#endif