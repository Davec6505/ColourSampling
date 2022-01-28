#include "LM35.h"

sbit LM35_Pin at PORTB.B15; // this is where T0 is fully defined
sbit LM35_Pin_Dir at TRISB.B15; // this is where T0 is fully defined

static unsigned int sample_count;
static unsigned int divisor;

void setup_LM35(int count)
{
     LM35_Pin_Dir = 1; //Trisb15 to input ifit isnt already
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

    // Converts input from a thermistor voltage divider to a temperature value.
    // The voltage divider consists of thermistor Rt and series resistor R0.
    // The value of R0 is equal to the thermistor resistance at T0.

  const float TempMax     = 150.00;         // Max temp
  const float AdcMax      = 465.00;         // Max ADC at Max Temp
  const float TempOffset  = 2.00;

  float ratio = 0.3261;   //0.3233
  float ave = 0.00;
  float temp = 0.00;
  float K,C,F;

  ave = (float)adc_ave;
  //convert value to temp
  C =  ave * ratio;
  K = C+273.15;
  F =  (C*(9.0/5.00)) + 32.00;
  

  t[0] = K; t[1] = C; t[2] = F; t[3] = ave;
  return;
}