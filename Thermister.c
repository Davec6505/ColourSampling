 #include "Thermister.h"

sbit T0 at PORTB.B15; // this is where T0 is fully defined
sbit T0_Dir at TRISB.B15; // this is where T0 is fully defined
//1/T = 1/T0 + 1/B * ln(R/R0)


/*R = R0 * ( ( adcMax / adcVal ) - 1 )

then:

1/T = 1/T0 + 1/B * ln( R0 * ( ( adcMax / adcVal ) - 1 ) / R0 )

R0 cancels out, which leaves:

1/T = 1/T0 + 1/B * ln( ( adcMax / adcVal ) – 1 )

Take the reciprocal of the result to get the temperature in Kelvin.

For example, assume a thermistor voltage divider circuit is connected to a 10 bit ADC. The beta constant for the thermistor is 3380, the thermistor resistance (R0) at 25°C is 10K ohms, and the ADC returns a value 366.

1/T = 1/298.15 + 1/3380 * ln((1023 / 366) - 1 )
1/T = 0.003527
T     = 283.52K – 273.15K = 10.37°C*/

void setup_Thermister()
{
     T0_Dir = 1; //Trisb15 to input ifit isnt already
     
     ADC1_Init();
}

void getTemp(float * t){

    // Converts input from a thermistor voltage divider to a temperature value.
    // The voltage divider consists of thermistor Rt and series resistor R0.
    // The value of R0 is equal to the thermistor resistance at T0.
    // You must set the following constants:
    //                  adcMax  ( ADC full range value )
    //                  analogPin (Arduino analog input pin)
    //                  invBeta  (inverse of the thermistor Beta value supplied by manufacturer).
    // Use Arduino's default reference voltage (5V or 3.3V) with this module.
    //

  const float invT0   = 1.00 / 298.15;   // room temp in Kelvin
  const float invBeta = 1.00 / 4085.00;   // replace "Beta" with beta of thermistor
  const float seriesR = 4700.00;
  const float adcMax  = 1023.00;

  float steinhart = 0.00;
  int adcVal;
  float ave = 0.00;
  int i, numSamples = 5;
  float  K, C, F;

  adcVal = 0;
  for (i = 0; i < numSamples; i++){
     adcVal += (int)ADC1_Get_Sample(15);
     //adcVal = 1024-adcVal;
     Delay_ms(100);
  }
  adcVal = adcVal/5;
  ave = (float)adcVal;
  //convert value to resistance
  ave = (1023 / ave) - 1;
  ave  = seriesR / ave;
  
  //calc steinhart
  steinhart = ave / ThermNominal;
  steinhart = log(steinhart);
  steinhart /= BCOEF;
  steinhart += 1/TEMPNOMINAL;
  steinhart = 1/steinhart;
  K = steinhart;
  steinhart -= 273.15;
  C = steinhart;
  F = ((9.0*C)/5.00) + 32.00;   // convert to Fahrenheit
 // K = 1.00 / (invT0 + invBeta*(log ( adcMax / (float) adcVal - 1.00)));
 // C = K - 273.15;                      // convert to Celsius

  t[0] = K; t[1] = C; t[2] = F; t[3] = (float)adcVal;
  return;
}