#line 1 "C:/Users/Git/ColourSampling/LM35.c"
#line 1 "c:/users/git/coloursampling/lm35.h"








extern sfr sbit LM35_Pin;
extern sfr sbit LM35_Pin_Dir;
#line 27 "c:/users/git/coloursampling/lm35.h"
void setup_LM35(int count);
int LM35_Adc_Average(int* adc,int adc_pin);
int LM35_Adc_Single(int adc,int adc_pin);
void getLM35Temp(float * t,int adc_ave);
#line 3 "C:/Users/Git/ColourSampling/LM35.c"
sbit LM35_Pin at PORTB.B15;
sbit LM35_Pin_Dir at TRISB.B15;

static unsigned int sample_count;
static unsigned int divisor;

void setup_LM35(int count)
{
 LM35_Pin_Dir = 1;
 sample_count = count;
 divisor = sample_count +1;
 ADC1_Init();
}


int LM35_Adc_Average(int* adc,int adc_pin){
static int count = 0;

 if(count > sample_count){
 *adc /= divisor;
 count = 0;
 return -1;
 }else{
 *adc += (int)ADC1_Get_Sample(adc_pin);
 count++;
 }
 return 1;
}


int LM35_Adc_Single(int adc,int adc_pin){
int temp_ = 0;

 temp_ = (int)ADC1_Get_Sample(adc_pin);

 return temp_;
}


void getLM35Temp(float * t,int adc_ave){





 const float TempMax = 150.00;
 const float AdcMax = 465.00;
 const float TempOffset = 2.00;

 float ratio = 0.3261;
 float ave = 0.00;
 float temp = 0.00;
 float K,C,F;

 ave = (float)adc_ave;

 C = ave * ratio;
 K = C+273.15;
 F = (C*(9.0/5.00)) + 32.00;


 t[0] = K; t[1] = C; t[2] = F; t[3] = ave;
 return;
}
