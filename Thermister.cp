#line 1 "C:/Users/Git/ColourSampling/Thermister.c"
#line 1 "c:/users/git/coloursampling/thermister.h"





extern sfr sbit T0;
extern sfr sbit T0_Dir;
#line 19 "c:/users/git/coloursampling/thermister.h"
void setup_Thermister(int count);
int Adc_Average(int* adc);
void getTemp(float * t,int adc_ave);
#line 3 "C:/Users/Git/ColourSampling/Thermister.c"
sbit T0 at PORTB.B15;
sbit T0_Dir at TRISB.B15;
#line 20 "C:/Users/Git/ColourSampling/Thermister.c"
static unsigned int sample_count;
static unsigned int divisor;
void setup_Thermister(int count)
{
 T0_Dir = 1;
 sample_count = count;
 divisor = sample_count +1;
 ADC1_Init();
}

int Adc_Average(int* adc){
static int count = 0;

 if(count > sample_count){
 *adc /= divisor;
 count = 0;
 return -1;
 }else{
 *adc += (int)ADC1_Get_Sample(15);
 count++;
 }
 return 1;
}

void getTemp(float * t,int adc_ave){





 const float invT0 = 1.00 / 298.15;
 const float invBeta = 1.00 / 4085.00;
 const float seriesR = 4700.00;
 const float adcMax = 1023.00;

 float steinhart = 0.00;
 float ave = 0.00;
 float temp = 0.00;
 float K, C, F;

 ave = (float)adc_ave;
 temp = ave;

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



 t[0] = K; t[1] = C; t[2] = F; t[3] = temp;
 return;
}
