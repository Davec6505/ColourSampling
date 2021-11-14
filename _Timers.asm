_InitTimer1:
;_Timers.c,14 :: 		void InitTimer1(){
;_Timers.c,16 :: 		T1CON         = 0x8010;
ORI	R2, R0, 32784
SW	R2, Offset(T1CON+0)(GP)
;_Timers.c,17 :: 		T1IP0_bit     = 1;
LUI	R2, BitMask(T1IP0_bit+0)
ORI	R2, R2, BitMask(T1IP0_bit+0)
_SX	
;_Timers.c,18 :: 		T1IP1_bit     = 1;
LUI	R2, BitMask(T1IP1_bit+0)
ORI	R2, R2, BitMask(T1IP1_bit+0)
_SX	
;_Timers.c,19 :: 		T1IP2_bit     = 1;
LUI	R2, BitMask(T1IP2_bit+0)
ORI	R2, R2, BitMask(T1IP2_bit+0)
_SX	
;_Timers.c,20 :: 		T1IF_bit      = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;_Timers.c,21 :: 		T1IE_bit      = 1;
LUI	R2, BitMask(T1IE_bit+0)
ORI	R2, R2, BitMask(T1IE_bit+0)
_SX	
;_Timers.c,22 :: 		PR1           = 10000;
ORI	R2, R0, 10000
SW	R2, Offset(PR1+0)(GP)
;_Timers.c,23 :: 		TMR1          = 0;
SW	R0, Offset(TMR1+0)(GP)
;_Timers.c,24 :: 		}
L_end_InitTimer1:
JR	RA
NOP	
; end of _InitTimer1
_Get_Time:
;_Timers.c,27 :: 		void Get_Time(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;_Timers.c,30 :: 		TMR0.millis++;
SW	R25, 4(SP)
LW	R2, Offset(_TMR0+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_TMR0+0)(GP)
;_Timers.c,31 :: 		TMR0.ms++;
LHU	R2, Offset(_TMR0+4)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR0+4)(GP)
;_Timers.c,32 :: 		T0_SP.ms++;
LHU	R2, Offset(_T0_SP+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_T0_SP+0)(GP)
;_Timers.c,35 :: 		if(T0_SP.ms > 999){
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__Get_Time31
NOP	
J	L_Get_Time0
NOP	
L__Get_Time31:
;_Timers.c,36 :: 		T0_SP.ms = 0;
SH	R0, Offset(_T0_SP+0)(GP)
;_Timers.c,37 :: 		T0_SP.sec++;
LHU	R2, Offset(_T0_SP+2)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_T0_SP+2)(GP)
;_Timers.c,38 :: 		if(T0_SP.sec > 59){
ANDI	R2, R2, 65535
SLTIU	R2, R2, 60
BEQ	R2, R0, L__Get_Time32
NOP	
J	L_Get_Time1
NOP	
L__Get_Time32:
;_Timers.c,39 :: 		T0_SP.sec = 0;
SH	R0, Offset(_T0_SP+2)(GP)
;_Timers.c,40 :: 		T0_SP.min++;
LHU	R2, Offset(_T0_SP+4)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_T0_SP+4)(GP)
;_Timers.c,42 :: 		sprintf(txt,"%u",T0_SP.min);
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
;_Timers.c,43 :: 		UART1_Write_Text(txt);
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;_Timers.c,44 :: 		UART1_Write(0x0d);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;_Timers.c,45 :: 		UART1_Write(0x0a);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;_Timers.c,47 :: 		if(T0_SP.min > 59){
LHU	R2, Offset(_T0_SP+4)(GP)
SLTIU	R2, R2, 60
BEQ	R2, R0, L__Get_Time33
NOP	
J	L_Get_Time2
NOP	
L__Get_Time33:
;_Timers.c,48 :: 		T0_SP.min = 0;
SH	R0, Offset(_T0_SP+4)(GP)
;_Timers.c,49 :: 		T0_SP.hr++;
LHU	R2, Offset(_T0_SP+6)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_T0_SP+6)(GP)
;_Timers.c,50 :: 		if(T0_SP.hr > 23){
ANDI	R2, R2, 65535
SLTIU	R2, R2, 24
BEQ	R2, R0, L__Get_Time34
NOP	
J	L_Get_Time3
NOP	
L__Get_Time34:
;_Timers.c,51 :: 		T0_SP.hr = 0;
SH	R0, Offset(_T0_SP+6)(GP)
;_Timers.c,52 :: 		}
L_Get_Time3:
;_Timers.c,53 :: 		}
L_Get_Time2:
;_Timers.c,54 :: 		}
L_Get_Time1:
;_Timers.c,55 :: 		}
L_Get_Time0:
;_Timers.c,57 :: 		if(T0_SP.min > Threshold.time_to_log ){
LHU	R3, Offset(_Threshold+8)(GP)
LHU	R2, Offset(_T0_SP+4)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__Get_Time35
NOP	
J	L_Get_Time4
NOP	
L__Get_Time35:
;_Timers.c,58 :: 		T0_SP.one_per_sec = 1;
ORI	R2, R0, 1
SB	R2, Offset(_T0_SP+10)(GP)
;_Timers.c,59 :: 		}
L_Get_Time4:
;_Timers.c,62 :: 		if(TMR0.ms > 999){
LHU	R2, Offset(_TMR0+4)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__Get_Time36
NOP	
J	L_Get_Time5
NOP	
L__Get_Time36:
;_Timers.c,63 :: 		TMR0.ms = 0;
SH	R0, Offset(_TMR0+4)(GP)
;_Timers.c,64 :: 		TMR0.sec++;
LHU	R2, Offset(_TMR0+6)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR0+6)(GP)
;_Timers.c,65 :: 		if(TMR0.sec > 59){
ANDI	R2, R2, 65535
SLTIU	R2, R2, 60
BEQ	R2, R0, L__Get_Time37
NOP	
J	L_Get_Time6
NOP	
L__Get_Time37:
;_Timers.c,66 :: 		TMR0.sec = 0;
SH	R0, Offset(_TMR0+6)(GP)
;_Timers.c,67 :: 		TMR0.min++;
LHU	R2, Offset(_TMR0+8)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR0+8)(GP)
;_Timers.c,69 :: 		if(TMR0.min > 59){
ANDI	R2, R2, 65535
SLTIU	R2, R2, 60
BEQ	R2, R0, L__Get_Time38
NOP	
J	L_Get_Time7
NOP	
L__Get_Time38:
;_Timers.c,70 :: 		TMR0.min = 0;
SH	R0, Offset(_TMR0+8)(GP)
;_Timers.c,71 :: 		TMR0.hr++;
LHU	R2, Offset(_TMR0+10)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR0+10)(GP)
;_Timers.c,73 :: 		if(TMR0.hr > 23){
ANDI	R2, R2, 65535
SLTIU	R2, R2, 24
BEQ	R2, R0, L__Get_Time39
NOP	
J	L_Get_Time8
NOP	
L__Get_Time39:
;_Timers.c,74 :: 		TMR0.hr = 0;
SH	R0, Offset(_TMR0+10)(GP)
;_Timers.c,75 :: 		}
L_Get_Time8:
;_Timers.c,76 :: 		}
L_Get_Time7:
;_Timers.c,78 :: 		}
L_Get_Time6:
;_Timers.c,79 :: 		LATA10_bit = !LATA10_bit;
_LX	
EXT	R2, R2, BitPos(LATA10_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATA10_bit+0), 1
_SX	
;_Timers.c,80 :: 		}
L_Get_Time5:
;_Timers.c,81 :: 		}
L_end_Get_Time:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Get_Time
_Day_Month:
;_Timers.c,86 :: 		void Day_Month(int hr,int day,int mnth){
;_Timers.c,88 :: 		for(i=0;i<6;i++){
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Day_Month9:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 6
BNE	R2, R0, L__Day_Month41
NOP	
J	L_Day_Month10
NOP	
L__Day_Month41:
ADDIU	R2, R3, 1
SEH	R3, R2
;_Timers.c,90 :: 		}
; i end address is: 12 (R3)
J	L_Day_Month9
NOP	
L_Day_Month10:
;_Timers.c,91 :: 		}
L_end_Day_Month:
JR	RA
NOP	
; end of _Day_Month
_I2C2_TimeoutCallback:
;_Timers.c,97 :: 		void I2C2_TimeoutCallback(char errorCode) {
;_Timers.c,99 :: 		if (errorCode == _I2C_TIMEOUT_RD) {
ANDI	R3, R25, 255
ORI	R2, R0, 3
BEQ	R3, R2, L__I2C2_TimeoutCallback43
NOP	
J	L_I2C2_TimeoutCallback12
NOP	
L__I2C2_TimeoutCallback43:
;_Timers.c,101 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_I2C2_TimeoutCallback13:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__I2C2_TimeoutCallback44
NOP	
J	L_I2C2_TimeoutCallback14
NOP	
L__I2C2_TimeoutCallback44:
;_Timers.c,102 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;_Timers.c,103 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_I2C2_TimeoutCallback16:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C2_TimeoutCallback16
NOP	
;_Timers.c,101 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;_Timers.c,104 :: 		}
; i end address is: 16 (R4)
J	L_I2C2_TimeoutCallback13
NOP	
L_I2C2_TimeoutCallback14:
;_Timers.c,105 :: 		}
L_I2C2_TimeoutCallback12:
;_Timers.c,107 :: 		if (errorCode == _I2C_TIMEOUT_WR) {
ANDI	R3, R25, 255
ORI	R2, R0, 4
BEQ	R3, R2, L__I2C2_TimeoutCallback45
NOP	
J	L_I2C2_TimeoutCallback18
NOP	
L__I2C2_TimeoutCallback45:
;_Timers.c,109 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_I2C2_TimeoutCallback19:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__I2C2_TimeoutCallback46
NOP	
J	L_I2C2_TimeoutCallback20
NOP	
L__I2C2_TimeoutCallback46:
;_Timers.c,110 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;_Timers.c,111 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_I2C2_TimeoutCallback22:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C2_TimeoutCallback22
NOP	
NOP	
NOP	
;_Timers.c,109 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;_Timers.c,112 :: 		}
; i end address is: 16 (R4)
J	L_I2C2_TimeoutCallback19
NOP	
L_I2C2_TimeoutCallback20:
;_Timers.c,113 :: 		}
L_I2C2_TimeoutCallback18:
;_Timers.c,115 :: 		if (errorCode == _I2C_TIMEOUT_STOP) {
ANDI	R3, R25, 255
ORI	R2, R0, 7
BEQ	R3, R2, L__I2C2_TimeoutCallback47
NOP	
J	L_I2C2_TimeoutCallback24
NOP	
L__I2C2_TimeoutCallback47:
;_Timers.c,117 :: 		}
L_I2C2_TimeoutCallback24:
;_Timers.c,119 :: 		if (errorCode == _I2C_TIMEOUT_START) {
ANDI	R3, R25, 255
ORI	R2, R0, 5
BEQ	R3, R2, L__I2C2_TimeoutCallback48
NOP	
J	L_I2C2_TimeoutCallback25
NOP	
L__I2C2_TimeoutCallback48:
;_Timers.c,121 :: 		}
L_I2C2_TimeoutCallback25:
;_Timers.c,123 :: 		if (errorCode == _I2C_TIMEOUT_REPEATED_START) {
ANDI	R3, R25, 255
ORI	R2, R0, 6
BEQ	R3, R2, L__I2C2_TimeoutCallback49
NOP	
J	L_I2C2_TimeoutCallback26
NOP	
L__I2C2_TimeoutCallback49:
;_Timers.c,125 :: 		}
L_I2C2_TimeoutCallback26:
;_Timers.c,127 :: 		if (errorCode == _I2C_TIMEOUT_INIT) {
ANDI	R3, R25, 255
ORI	R2, R0, 8
BEQ	R3, R2, L__I2C2_TimeoutCallback50
NOP	
J	L_I2C2_TimeoutCallback27
NOP	
L__I2C2_TimeoutCallback50:
;_Timers.c,129 :: 		}
L_I2C2_TimeoutCallback27:
;_Timers.c,131 :: 		if (errorCode == _I2C_TIMEOUT_INIT_ADVANCED) {
ANDI	R3, R25, 255
ORI	R2, R0, 9
BEQ	R3, R2, L__I2C2_TimeoutCallback51
NOP	
J	L_I2C2_TimeoutCallback28
NOP	
L__I2C2_TimeoutCallback51:
;_Timers.c,133 :: 		}
L_I2C2_TimeoutCallback28:
;_Timers.c,135 :: 		}
L_end_I2C2_TimeoutCallback:
JR	RA
NOP	
; end of _I2C2_TimeoutCallback
