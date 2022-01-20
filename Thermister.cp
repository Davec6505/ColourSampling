#line 1 "C:/Users/Git/ColourSampling/Thermister.c"
#line 1 "c:/users/git/coloursampling/thermister.h"




extern sfr sbit T0;
extern sfr sbit T0_Dir;







void setup_Thermister();
void getTemp(float * t);
#line 3 "C:/Users/Git/ColourSampling/Thermister.c"
sbit T0 at PORTB.B15;
sbit T0_Dir at TRISB.B15;
#line 26 "C:/Users/Git/ColourSampling/Thermister.c"
void setup_Thermister()
{
 T0_Dir = 1;

 ADC1_Init();
}

void getTemp(float * t){
#line 45 "C:/Users/Git/ColourSampling/Thermister.c"
 const float invT0 = 1.00 / 298.15;
 const float invBeta = 1.00 / 4085.00;
 const float seriesR = 4700.00;
 const float adcMax = 1023.00;

 float steinhart = 0.00;
 int adcVal;
 float ave = 0.00;
 int i, numSamples = 5;
 float K, C, F;

 adcVal = 0;
 for (i = 0; i < numSamples; i++){
 adcVal += (int)ADC1_Get_Sample(15);

 Delay_ms(100);
 }
 adcVal = adcVal/5;
 ave = (float)adcVal;

 ave = (1023 / ave) - 1;
 ave = seriesR / ave;


 steinhart = ave /  100000 ;
 steinhart = log(steinhart);
 steinhart /=  4085 ;
 steinhart += 1/ (25.00 + 273.15) ;
 steinhart = 1/steinhart;
 K = steinhart;
 steinhart -= 273.15;
 C = steinhart;
 F = ((9.0*C)/5.00) + 32.00;



 t[0] = K; t[1] = C; t[2] = F; t[3] = (float)adcVal;
 return;
}
