_InitTimer1:
;_Timers.c,4 :: 		void InitTimer1(){
;_Timers.c,6 :: 		T1CON         = 0x8010;
ORI	R2, R0, 32784
SW	R2, Offset(T1CON+0)(GP)
;_Timers.c,7 :: 		T1IP0_bit         = 1;
LUI	R2, BitMask(T1IP0_bit+0)
ORI	R2, R2, BitMask(T1IP0_bit+0)
_SX	
;_Timers.c,8 :: 		T1IP1_bit         = 1;
LUI	R2, BitMask(T1IP1_bit+0)
ORI	R2, R2, BitMask(T1IP1_bit+0)
_SX	
;_Timers.c,9 :: 		T1IP2_bit         = 1;
LUI	R2, BitMask(T1IP2_bit+0)
ORI	R2, R2, BitMask(T1IP2_bit+0)
_SX	
;_Timers.c,10 :: 		T1IF_bit         = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;_Timers.c,11 :: 		T1IE_bit         = 1;
LUI	R2, BitMask(T1IE_bit+0)
ORI	R2, R2, BitMask(T1IE_bit+0)
_SX	
;_Timers.c,12 :: 		PR1                 = 10000;
ORI	R2, R0, 10000
SW	R2, Offset(PR1+0)(GP)
;_Timers.c,13 :: 		TMR1                 = 0;
SW	R0, Offset(TMR1+0)(GP)
;_Timers.c,14 :: 		}
L_end_InitTimer1:
JR	RA
NOP	
; end of _InitTimer1
_Get_Time:
;_Timers.c,17 :: 		void Get_Time(){
;_Timers.c,18 :: 		TMR0.millis++;
LW	R2, Offset(_TMR0+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_TMR0+0)(GP)
;_Timers.c,19 :: 		TMR0.ms++;
LHU	R2, Offset(_TMR0+10)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR0+10)(GP)
;_Timers.c,20 :: 		if(TMR0.ms > 999){
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__Get_Time23
NOP	
J	L_Get_Time0
NOP	
L__Get_Time23:
;_Timers.c,21 :: 		TMR0.ms = 0;
SH	R0, Offset(_TMR0+10)(GP)
;_Timers.c,22 :: 		TMR0.sec++;
LBU	R2, Offset(_TMR0+12)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(_TMR0+12)(GP)
;_Timers.c,23 :: 		if(TMR0.sec > 59){
ANDI	R2, R2, 255
SLTIU	R2, R2, 60
BEQ	R2, R0, L__Get_Time24
NOP	
J	L_Get_Time1
NOP	
L__Get_Time24:
;_Timers.c,24 :: 		TMR0.sec = 0;
SB	R0, Offset(_TMR0+12)(GP)
;_Timers.c,25 :: 		TMR0.min++;
LBU	R2, Offset(_TMR0+13)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(_TMR0+13)(GP)
;_Timers.c,26 :: 		if(TMR0.min > 590){
ANDI	R2, R2, 255
SLTI	R2, R2, 591
BEQ	R2, R0, L__Get_Time25
NOP	
J	L_Get_Time2
NOP	
L__Get_Time25:
;_Timers.c,27 :: 		TMR0.min = 0;
SB	R0, Offset(_TMR0+13)(GP)
;_Timers.c,28 :: 		TMR0.hr++;
LBU	R2, Offset(_TMR0+14)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(_TMR0+14)(GP)
;_Timers.c,29 :: 		if(TMR0.hr > 23)
ANDI	R2, R2, 255
SLTIU	R2, R2, 24
BEQ	R2, R0, L__Get_Time26
NOP	
J	L_Get_Time3
NOP	
L__Get_Time26:
;_Timers.c,30 :: 		TMR0.hr = 0;
SB	R0, Offset(_TMR0+14)(GP)
L_Get_Time3:
;_Timers.c,31 :: 		}
L_Get_Time2:
;_Timers.c,32 :: 		}
L_Get_Time1:
;_Timers.c,33 :: 		LATA10_bit = !LATA10_bit;
_LX	
EXT	R2, R2, BitPos(LATA10_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATA10_bit+0), 1
_SX	
;_Timers.c,34 :: 		}
L_Get_Time0:
;_Timers.c,35 :: 		}
L_end_Get_Time:
JR	RA
NOP	
; end of _Get_Time
_Update_ThingSpeak:
;_Timers.c,37 :: 		void Update_ThingSpeak(unsigned int* rgbc){
;_Timers.c,39 :: 		}
L_end_Update_ThingSpeak:
JR	RA
NOP	
; end of _Update_ThingSpeak
_I2C2_TimeoutCallback:
;_Timers.c,42 :: 		void I2C2_TimeoutCallback(char errorCode) {
;_Timers.c,44 :: 		if (errorCode == _I2C_TIMEOUT_RD) {
ANDI	R3, R25, 255
ORI	R2, R0, 3
BEQ	R3, R2, L__I2C2_TimeoutCallback29
NOP	
J	L_I2C2_TimeoutCallback4
NOP	
L__I2C2_TimeoutCallback29:
;_Timers.c,46 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_I2C2_TimeoutCallback5:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__I2C2_TimeoutCallback30
NOP	
J	L_I2C2_TimeoutCallback6
NOP	
L__I2C2_TimeoutCallback30:
;_Timers.c,47 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;_Timers.c,48 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_I2C2_TimeoutCallback8:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C2_TimeoutCallback8
NOP	
;_Timers.c,46 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;_Timers.c,49 :: 		}
; i end address is: 16 (R4)
J	L_I2C2_TimeoutCallback5
NOP	
L_I2C2_TimeoutCallback6:
;_Timers.c,50 :: 		}
L_I2C2_TimeoutCallback4:
;_Timers.c,52 :: 		if (errorCode == _I2C_TIMEOUT_WR) {
ANDI	R3, R25, 255
ORI	R2, R0, 4
BEQ	R3, R2, L__I2C2_TimeoutCallback31
NOP	
J	L_I2C2_TimeoutCallback10
NOP	
L__I2C2_TimeoutCallback31:
;_Timers.c,54 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_I2C2_TimeoutCallback11:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__I2C2_TimeoutCallback32
NOP	
J	L_I2C2_TimeoutCallback12
NOP	
L__I2C2_TimeoutCallback32:
;_Timers.c,55 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;_Timers.c,56 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_I2C2_TimeoutCallback14:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C2_TimeoutCallback14
NOP	
NOP	
NOP	
;_Timers.c,54 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;_Timers.c,57 :: 		}
; i end address is: 16 (R4)
J	L_I2C2_TimeoutCallback11
NOP	
L_I2C2_TimeoutCallback12:
;_Timers.c,58 :: 		}
L_I2C2_TimeoutCallback10:
;_Timers.c,60 :: 		if (errorCode == _I2C_TIMEOUT_STOP) {
ANDI	R3, R25, 255
ORI	R2, R0, 7
BEQ	R3, R2, L__I2C2_TimeoutCallback33
NOP	
J	L_I2C2_TimeoutCallback16
NOP	
L__I2C2_TimeoutCallback33:
;_Timers.c,62 :: 		}
L_I2C2_TimeoutCallback16:
;_Timers.c,64 :: 		if (errorCode == _I2C_TIMEOUT_START) {
ANDI	R3, R25, 255
ORI	R2, R0, 5
BEQ	R3, R2, L__I2C2_TimeoutCallback34
NOP	
J	L_I2C2_TimeoutCallback17
NOP	
L__I2C2_TimeoutCallback34:
;_Timers.c,66 :: 		}
L_I2C2_TimeoutCallback17:
;_Timers.c,68 :: 		if (errorCode == _I2C_TIMEOUT_REPEATED_START) {
ANDI	R3, R25, 255
ORI	R2, R0, 6
BEQ	R3, R2, L__I2C2_TimeoutCallback35
NOP	
J	L_I2C2_TimeoutCallback18
NOP	
L__I2C2_TimeoutCallback35:
;_Timers.c,70 :: 		}
L_I2C2_TimeoutCallback18:
;_Timers.c,72 :: 		if (errorCode == _I2C_TIMEOUT_INIT) {
ANDI	R3, R25, 255
ORI	R2, R0, 8
BEQ	R3, R2, L__I2C2_TimeoutCallback36
NOP	
J	L_I2C2_TimeoutCallback19
NOP	
L__I2C2_TimeoutCallback36:
;_Timers.c,74 :: 		}
L_I2C2_TimeoutCallback19:
;_Timers.c,76 :: 		if (errorCode == _I2C_TIMEOUT_INIT_ADVANCED) {
ANDI	R3, R25, 255
ORI	R2, R0, 9
BEQ	R3, R2, L__I2C2_TimeoutCallback37
NOP	
J	L_I2C2_TimeoutCallback20
NOP	
L__I2C2_TimeoutCallback37:
;_Timers.c,78 :: 		}
L_I2C2_TimeoutCallback20:
;_Timers.c,80 :: 		}
L_end_I2C2_TimeoutCallback:
JR	RA
NOP	
; end of _I2C2_TimeoutCallback
