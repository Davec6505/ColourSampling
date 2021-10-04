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
;_Timers.c,16 :: 		void Get_Time(){
;_Timers.c,17 :: 		TMR0.ms++;
LHU	R2, Offset(_TMR0+6)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR0+6)(GP)
;_Timers.c,18 :: 		if(TMR0.ms > 999){
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__Get_Time20
NOP	
J	L_Get_Time0
NOP	
L__Get_Time20:
;_Timers.c,19 :: 		TMR0.ms = 0;
SH	R0, Offset(_TMR0+6)(GP)
;_Timers.c,20 :: 		LATA10_bit = !LATA10_bit;
_LX	
EXT	R2, R2, BitPos(LATA10_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATA10_bit+0), 1
_SX	
;_Timers.c,21 :: 		}
L_Get_Time0:
;_Timers.c,22 :: 		}
L_end_Get_Time:
JR	RA
NOP	
; end of _Get_Time
_I2C2_TimeoutCallback:
;_Timers.c,25 :: 		void I2C2_TimeoutCallback(char errorCode) {
;_Timers.c,27 :: 		if (errorCode == _I2C_TIMEOUT_RD) {
ANDI	R3, R25, 255
ORI	R2, R0, 3
BEQ	R3, R2, L__I2C2_TimeoutCallback22
NOP	
J	L_I2C2_TimeoutCallback1
NOP	
L__I2C2_TimeoutCallback22:
;_Timers.c,29 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_I2C2_TimeoutCallback2:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__I2C2_TimeoutCallback23
NOP	
J	L_I2C2_TimeoutCallback3
NOP	
L__I2C2_TimeoutCallback23:
;_Timers.c,30 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;_Timers.c,31 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_I2C2_TimeoutCallback5:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C2_TimeoutCallback5
NOP	
;_Timers.c,29 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;_Timers.c,32 :: 		}
; i end address is: 16 (R4)
J	L_I2C2_TimeoutCallback2
NOP	
L_I2C2_TimeoutCallback3:
;_Timers.c,33 :: 		}
L_I2C2_TimeoutCallback1:
;_Timers.c,35 :: 		if (errorCode == _I2C_TIMEOUT_WR) {
ANDI	R3, R25, 255
ORI	R2, R0, 4
BEQ	R3, R2, L__I2C2_TimeoutCallback24
NOP	
J	L_I2C2_TimeoutCallback7
NOP	
L__I2C2_TimeoutCallback24:
;_Timers.c,37 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_I2C2_TimeoutCallback8:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__I2C2_TimeoutCallback25
NOP	
J	L_I2C2_TimeoutCallback9
NOP	
L__I2C2_TimeoutCallback25:
;_Timers.c,38 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;_Timers.c,39 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_I2C2_TimeoutCallback11:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C2_TimeoutCallback11
NOP	
NOP	
NOP	
;_Timers.c,37 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;_Timers.c,40 :: 		}
; i end address is: 16 (R4)
J	L_I2C2_TimeoutCallback8
NOP	
L_I2C2_TimeoutCallback9:
;_Timers.c,41 :: 		}
L_I2C2_TimeoutCallback7:
;_Timers.c,43 :: 		if (errorCode == _I2C_TIMEOUT_STOP) {
ANDI	R3, R25, 255
ORI	R2, R0, 7
BEQ	R3, R2, L__I2C2_TimeoutCallback26
NOP	
J	L_I2C2_TimeoutCallback13
NOP	
L__I2C2_TimeoutCallback26:
;_Timers.c,45 :: 		}
L_I2C2_TimeoutCallback13:
;_Timers.c,47 :: 		if (errorCode == _I2C_TIMEOUT_START) {
ANDI	R3, R25, 255
ORI	R2, R0, 5
BEQ	R3, R2, L__I2C2_TimeoutCallback27
NOP	
J	L_I2C2_TimeoutCallback14
NOP	
L__I2C2_TimeoutCallback27:
;_Timers.c,49 :: 		}
L_I2C2_TimeoutCallback14:
;_Timers.c,51 :: 		if (errorCode == _I2C_TIMEOUT_REPEATED_START) {
ANDI	R3, R25, 255
ORI	R2, R0, 6
BEQ	R3, R2, L__I2C2_TimeoutCallback28
NOP	
J	L_I2C2_TimeoutCallback15
NOP	
L__I2C2_TimeoutCallback28:
;_Timers.c,53 :: 		}
L_I2C2_TimeoutCallback15:
;_Timers.c,55 :: 		if (errorCode == _I2C_TIMEOUT_INIT) {
ANDI	R3, R25, 255
ORI	R2, R0, 8
BEQ	R3, R2, L__I2C2_TimeoutCallback29
NOP	
J	L_I2C2_TimeoutCallback16
NOP	
L__I2C2_TimeoutCallback29:
;_Timers.c,57 :: 		}
L_I2C2_TimeoutCallback16:
;_Timers.c,59 :: 		if (errorCode == _I2C_TIMEOUT_INIT_ADVANCED) {
ANDI	R3, R25, 255
ORI	R2, R0, 9
BEQ	R3, R2, L__I2C2_TimeoutCallback30
NOP	
J	L_I2C2_TimeoutCallback17
NOP	
L__I2C2_TimeoutCallback30:
;_Timers.c,61 :: 		}
L_I2C2_TimeoutCallback17:
;_Timers.c,63 :: 		}
L_end_I2C2_TimeoutCallback:
JR	RA
NOP	
; end of _I2C2_TimeoutCallback
