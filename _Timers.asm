_InitTimer1:
;_Timers.c,12 :: 		void InitTimer1(){
;_Timers.c,14 :: 		T1CON         = 0x8010;
ORI	R2, R0, 32784
SW	R2, Offset(T1CON+0)(GP)
;_Timers.c,15 :: 		T1IP0_bit     = 1;
LUI	R2, BitMask(T1IP0_bit+0)
ORI	R2, R2, BitMask(T1IP0_bit+0)
_SX	
;_Timers.c,16 :: 		T1IP1_bit     = 1;
LUI	R2, BitMask(T1IP1_bit+0)
ORI	R2, R2, BitMask(T1IP1_bit+0)
_SX	
;_Timers.c,17 :: 		T1IP2_bit     = 1;
LUI	R2, BitMask(T1IP2_bit+0)
ORI	R2, R2, BitMask(T1IP2_bit+0)
_SX	
;_Timers.c,18 :: 		T1IF_bit      = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;_Timers.c,19 :: 		T1IE_bit      = 1;
LUI	R2, BitMask(T1IE_bit+0)
ORI	R2, R2, BitMask(T1IE_bit+0)
_SX	
;_Timers.c,20 :: 		PR1           = 10000;
ORI	R2, R0, 10000
SW	R2, Offset(PR1+0)(GP)
;_Timers.c,21 :: 		TMR1          = 0;
SW	R0, Offset(TMR1+0)(GP)
;_Timers.c,27 :: 		}
L_end_InitTimer1:
JR	RA
NOP	
; end of _InitTimer1
_Get_Time:
;_Timers.c,30 :: 		void Get_Time(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;_Timers.c,33 :: 		TMR0.millis++;
SW	R25, 4(SP)
LW	R2, Offset(_TMR0+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_TMR0+0)(GP)
;_Timers.c,34 :: 		TMR0.ms++;
LHU	R2, Offset(_TMR0+4)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR0+4)(GP)
;_Timers.c,37 :: 		if(TMR0.ms > 999){
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__Get_Time23
NOP	
J	L_Get_Time0
NOP	
L__Get_Time23:
;_Timers.c,38 :: 		TMR0.ms = 0;
SH	R0, Offset(_TMR0+4)(GP)
;_Timers.c,39 :: 		TMR0.sec++;
LHU	R2, Offset(_TMR0+6)(GP)
ADDIU	R3, R2, 1
SH	R3, Offset(_TMR0+6)(GP)
;_Timers.c,40 :: 		T0_SP.sec++;
LHU	R2, Offset(_T0_SP+2)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_T0_SP+2)(GP)
;_Timers.c,42 :: 		if(TMR0.sec > 59){
ANDI	R2, R3, 65535
SLTIU	R2, R2, 60
BEQ	R2, R0, L__Get_Time24
NOP	
J	L_Get_Time1
NOP	
L__Get_Time24:
;_Timers.c,43 :: 		T0_SP.sec = 0;
SH	R0, Offset(_T0_SP+2)(GP)
;_Timers.c,44 :: 		TMR0.sec = 0;
SH	R0, Offset(_TMR0+6)(GP)
;_Timers.c,45 :: 		TMR0.min++;
LHU	R2, Offset(_TMR0+8)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR0+8)(GP)
;_Timers.c,46 :: 		T0_SP.min++;
LHU	R2, Offset(_T0_SP+4)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_T0_SP+4)(GP)
;_Timers.c,48 :: 		sprintf(txt,"%u",T0_SP.min);
ADDIU	R3, SP, 8
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_1__Timers+0)
ORI	R2, R2, lo_addr(?lstr_1__Timers+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;_Timers.c,49 :: 		UART1_Write_Text(txt);
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;_Timers.c,50 :: 		UART1_Write(0x0d);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;_Timers.c,51 :: 		UART1_Write(0x0a);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;_Timers.c,54 :: 		if(TMR0.min > 59){
LHU	R2, Offset(_TMR0+8)(GP)
SLTIU	R2, R2, 60
BEQ	R2, R0, L__Get_Time25
NOP	
J	L_Get_Time2
NOP	
L__Get_Time25:
;_Timers.c,55 :: 		T0_SP.min = 0;
SH	R0, Offset(_T0_SP+4)(GP)
;_Timers.c,56 :: 		TMR0.min = 0;
SH	R0, Offset(_TMR0+8)(GP)
;_Timers.c,57 :: 		TMR0.hr++;
LHU	R2, Offset(_TMR0+10)(GP)
ADDIU	R3, R2, 1
SH	R3, Offset(_TMR0+10)(GP)
;_Timers.c,58 :: 		T0_SP.hr++;
LHU	R2, Offset(_T0_SP+6)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_T0_SP+6)(GP)
;_Timers.c,60 :: 		if(TMR0.hr > 23){
ANDI	R2, R3, 65535
SLTIU	R2, R2, 24
BEQ	R2, R0, L__Get_Time26
NOP	
J	L_Get_Time3
NOP	
L__Get_Time26:
;_Timers.c,61 :: 		TMR0.hr = 0;
SH	R0, Offset(_TMR0+10)(GP)
;_Timers.c,62 :: 		T0_SP.hr = 0;
SH	R0, Offset(_T0_SP+6)(GP)
;_Timers.c,63 :: 		}
L_Get_Time3:
;_Timers.c,64 :: 		}
L_Get_Time2:
;_Timers.c,66 :: 		}
L_Get_Time1:
;_Timers.c,67 :: 		T0_SP.one_per_sec = 1;
ORI	R2, R0, 1
SB	R2, Offset(_T0_SP+8)(GP)
;_Timers.c,68 :: 		LATA10_bit = !LATA10_bit;
_LX	
EXT	R2, R2, BitPos(LATA10_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATA10_bit+0), 1
_SX	
;_Timers.c,69 :: 		}
L_Get_Time0:
;_Timers.c,72 :: 		}
L_end_Get_Time:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Get_Time
_I2C2_TimeoutCallback:
;_Timers.c,77 :: 		void I2C2_TimeoutCallback(char errorCode) {
;_Timers.c,79 :: 		if (errorCode == _I2C_TIMEOUT_RD) {
ANDI	R3, R25, 255
ORI	R2, R0, 3
BEQ	R3, R2, L__I2C2_TimeoutCallback28
NOP	
J	L_I2C2_TimeoutCallback4
NOP	
L__I2C2_TimeoutCallback28:
;_Timers.c,81 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_I2C2_TimeoutCallback5:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__I2C2_TimeoutCallback29
NOP	
J	L_I2C2_TimeoutCallback6
NOP	
L__I2C2_TimeoutCallback29:
;_Timers.c,82 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;_Timers.c,83 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_I2C2_TimeoutCallback8:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C2_TimeoutCallback8
NOP	
;_Timers.c,81 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;_Timers.c,84 :: 		}
; i end address is: 16 (R4)
J	L_I2C2_TimeoutCallback5
NOP	
L_I2C2_TimeoutCallback6:
;_Timers.c,85 :: 		}
L_I2C2_TimeoutCallback4:
;_Timers.c,87 :: 		if (errorCode == _I2C_TIMEOUT_WR) {
ANDI	R3, R25, 255
ORI	R2, R0, 4
BEQ	R3, R2, L__I2C2_TimeoutCallback30
NOP	
J	L_I2C2_TimeoutCallback10
NOP	
L__I2C2_TimeoutCallback30:
;_Timers.c,89 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_I2C2_TimeoutCallback11:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__I2C2_TimeoutCallback31
NOP	
J	L_I2C2_TimeoutCallback12
NOP	
L__I2C2_TimeoutCallback31:
;_Timers.c,90 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;_Timers.c,91 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_I2C2_TimeoutCallback14:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C2_TimeoutCallback14
NOP	
NOP	
NOP	
;_Timers.c,89 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;_Timers.c,92 :: 		}
; i end address is: 16 (R4)
J	L_I2C2_TimeoutCallback11
NOP	
L_I2C2_TimeoutCallback12:
;_Timers.c,93 :: 		}
L_I2C2_TimeoutCallback10:
;_Timers.c,95 :: 		if (errorCode == _I2C_TIMEOUT_STOP) {
ANDI	R3, R25, 255
ORI	R2, R0, 7
BEQ	R3, R2, L__I2C2_TimeoutCallback32
NOP	
J	L_I2C2_TimeoutCallback16
NOP	
L__I2C2_TimeoutCallback32:
;_Timers.c,97 :: 		}
L_I2C2_TimeoutCallback16:
;_Timers.c,99 :: 		if (errorCode == _I2C_TIMEOUT_START) {
ANDI	R3, R25, 255
ORI	R2, R0, 5
BEQ	R3, R2, L__I2C2_TimeoutCallback33
NOP	
J	L_I2C2_TimeoutCallback17
NOP	
L__I2C2_TimeoutCallback33:
;_Timers.c,101 :: 		}
L_I2C2_TimeoutCallback17:
;_Timers.c,103 :: 		if (errorCode == _I2C_TIMEOUT_REPEATED_START) {
ANDI	R3, R25, 255
ORI	R2, R0, 6
BEQ	R3, R2, L__I2C2_TimeoutCallback34
NOP	
J	L_I2C2_TimeoutCallback18
NOP	
L__I2C2_TimeoutCallback34:
;_Timers.c,105 :: 		}
L_I2C2_TimeoutCallback18:
;_Timers.c,107 :: 		if (errorCode == _I2C_TIMEOUT_INIT) {
ANDI	R3, R25, 255
ORI	R2, R0, 8
BEQ	R3, R2, L__I2C2_TimeoutCallback35
NOP	
J	L_I2C2_TimeoutCallback19
NOP	
L__I2C2_TimeoutCallback35:
;_Timers.c,109 :: 		}
L_I2C2_TimeoutCallback19:
;_Timers.c,111 :: 		if (errorCode == _I2C_TIMEOUT_INIT_ADVANCED) {
ANDI	R3, R25, 255
ORI	R2, R0, 9
BEQ	R3, R2, L__I2C2_TimeoutCallback36
NOP	
J	L_I2C2_TimeoutCallback20
NOP	
L__I2C2_TimeoutCallback36:
;_Timers.c,113 :: 		}
L_I2C2_TimeoutCallback20:
;_Timers.c,115 :: 		}
L_end_I2C2_TimeoutCallback:
JR	RA
NOP	
; end of _I2C2_TimeoutCallback
