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
BEQ	R2, R0, L__Get_Time3
NOP	
J	L_Get_Time0
NOP	
L__Get_Time3:
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
