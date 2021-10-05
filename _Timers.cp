#line 1 "C:/Users/GIT/ColourSampling/_Timers.c"
#line 1 "c:/users/git/coloursampling/_timers.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic32/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 5 "c:/users/git/coloursampling/_timers.h"
typedef struct{
 uint32_t millis;
 uint16_t temp_ms;
 uint16_t ms;
 uint8_t sec;
}Timers;


void InitTimer1();
void Get_Time();
void I2C2_TimeoutCallback(char errorCode);
#line 3 "C:/Users/GIT/ColourSampling/_Timers.c"
Timers TMR0;
void InitTimer1(){

 T1CON = 0x8010;
 T1IP0_bit = 1;
 T1IP1_bit = 1;
 T1IP2_bit = 1;
 T1IF_bit = 0;
 T1IE_bit = 1;
 PR1 = 10000;
 TMR1 = 0;
}

void Get_Time(){
 TMR0.ms++;
 if(TMR0.ms > 999){
 TMR0.ms = 0;
 LATA10_bit = !LATA10_bit;
 }
}


void I2C2_TimeoutCallback(char errorCode) {
int i;
 if (errorCode == _I2C_TIMEOUT_RD) {

 for(i = 0;i < 20;i++){
 LATE3_bit = !LATE3_bit;
 Delay_ms(100);
 }
 }

 if (errorCode == _I2C_TIMEOUT_WR) {

 for(i = 0;i < 20;i++){
 LATE3_bit = !LATE3_bit;
 Delay_ms(500);
 }
 }

 if (errorCode == _I2C_TIMEOUT_STOP) {

 }

 if (errorCode == _I2C_TIMEOUT_START) {

 }

 if (errorCode == _I2C_TIMEOUT_REPEATED_START) {

 }

 if (errorCode == _I2C_TIMEOUT_INIT) {

 }

 if (errorCode == _I2C_TIMEOUT_INIT_ADVANCED) {

 }

}
