_InitTimers:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
JAL	_InitTimer1+0
NOP	
L_end_InitTimers:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _InitTimers
_InitTimer1:
ORI	R2, R0, 32784
SW	R2, Offset(T1CON+0)(GP)
LUI	R2, BitMask(T1IP0_bit+0)
ORI	R2, R2, BitMask(T1IP0_bit+0)
_SX	
LUI	R2, BitMask(T1IP1_bit+0)
ORI	R2, R2, BitMask(T1IP1_bit+0)
_SX	
LUI	R2, BitMask(T1IP2_bit+0)
ORI	R2, R2, BitMask(T1IP2_bit+0)
_SX	
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
LUI	R2, BitMask(T1IE_bit+0)
ORI	R2, R2, BitMask(T1IE_bit+0)
_SX	
ORI	R2, R0, 10000
SW	R2, Offset(PR1+0)(GP)
SW	R0, Offset(TMR1+0)(GP)
L_end_InitTimer1:
JR	RA
NOP	
; end of _InitTimer1
_InitTimer2_3:
ORI	R2, R0, 32776
SW	R2, Offset(T2CON+0)(GP)
SW	R0, Offset(T3CON+0)(GP)
SW	R0, Offset(TMR2+0)(GP)
SW	R0, Offset(TMR3+0)(GP)
LUI	R2, BitMask(T3IP0_bit+0)
ORI	R2, R2, BitMask(T3IP0_bit+0)
_SX	
LUI	R2, BitMask(T3IP1_bit+0)
ORI	R2, R2, BitMask(T3IP1_bit+0)
_SX	
LUI	R2, BitMask(T3IP2_bit+0)
ORI	R2, R2, BitMask(T3IP2_bit+0)
_SX	
LUI	R2, BitMask(T3IF_bit+0)
ORI	R2, R2, BitMask(T3IF_bit+0)
_SX	
LUI	R2, BitMask(T3IE_bit+0)
ORI	R2, R2, BitMask(T3IE_bit+0)
_SX	
ORI	R2, R0, 46080
SW	R2, Offset(PR2+0)(GP)
ORI	R2, R0, 1220
SW	R2, Offset(PR3+0)(GP)
L_end_InitTimer2_3:
JR	RA
NOP	
; end of _InitTimer2_3
_Get_Time:
ADDIU	SP, SP, -16
SW	RA, 0(SP)
SW	R25, 4(SP)
LW	R2, Offset(_TMR0+0)(GP)
ADDIU	R2, R2, 1
SW	R2, Offset(_TMR0+0)(GP)
LHU	R2, Offset(_TMR0+4)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR0+4)(GP)
LHU	R2, Offset(_T0_SP+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_T0_SP+0)(GP)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__Get_Time33
NOP	
J	L_Get_Time0
NOP	
L__Get_Time33:
SH	R0, Offset(_T0_SP+0)(GP)
LHU	R2, Offset(_T0_SP+2)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_T0_SP+2)(GP)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 60
BEQ	R2, R0, L__Get_Time34
NOP	
J	L_Get_Time1
NOP	
L__Get_Time34:
SH	R0, Offset(_T0_SP+2)(GP)
LHU	R2, Offset(_T0_SP+4)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_T0_SP+4)(GP)
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
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
LHU	R2, Offset(_T0_SP+4)(GP)
SLTIU	R2, R2, 60
BEQ	R2, R0, L__Get_Time35
NOP	
J	L_Get_Time2
NOP	
L__Get_Time35:
SH	R0, Offset(_T0_SP+4)(GP)
LHU	R2, Offset(_T0_SP+6)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_T0_SP+6)(GP)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 24
BEQ	R2, R0, L__Get_Time36
NOP	
J	L_Get_Time3
NOP	
L__Get_Time36:
SH	R0, Offset(_T0_SP+6)(GP)
L_Get_Time3:
L_Get_Time2:
L_Get_Time1:
L_Get_Time0:
LHU	R3, Offset(_Threshold+8)(GP)
LHU	R2, Offset(_T0_SP+4)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__Get_Time37
NOP	
J	L_Get_Time4
NOP	
L__Get_Time37:
LBU	R2, Offset(_T0_SP+10)(GP)
ORI	R2, R2, 2
SB	R2, Offset(_T0_SP+10)(GP)
L_Get_Time4:
LHU	R2, Offset(_TMR0+4)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__Get_Time38
NOP	
J	L_Get_Time5
NOP	
L__Get_Time38:
SH	R0, Offset(_TMR0+4)(GP)
LHU	R2, Offset(_TMR0+6)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR0+6)(GP)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 60
BEQ	R2, R0, L__Get_Time39
NOP	
J	L_Get_Time6
NOP	
L__Get_Time39:
SH	R0, Offset(_TMR0+6)(GP)
LHU	R2, Offset(_TMR0+8)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR0+8)(GP)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 60
BEQ	R2, R0, L__Get_Time40
NOP	
J	L_Get_Time7
NOP	
L__Get_Time40:
SH	R0, Offset(_TMR0+8)(GP)
LHU	R2, Offset(_TMR0+10)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_TMR0+10)(GP)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 24
BEQ	R2, R0, L__Get_Time41
NOP	
J	L_Get_Time8
NOP	
L__Get_Time41:
SH	R0, Offset(_TMR0+10)(GP)
L_Get_Time8:
L_Get_Time7:
L_Get_Time6:
_LX	
EXT	R2, R2, BitPos(LATA10_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATA10_bit+0), 1
_SX	
L_Get_Time5:
L_end_Get_Time:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _Get_Time
_Day_Month:
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_Day_Month9:
; i start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, 6
BNE	R2, R0, L__Day_Month43
NOP	
J	L_Day_Month10
NOP	
L__Day_Month43:
ADDIU	R2, R3, 1
SEH	R3, R2
; i end address is: 12 (R3)
J	L_Day_Month9
NOP	
L_Day_Month10:
L_end_Day_Month:
JR	RA
NOP	
; end of _Day_Month
_I2C2_TimeoutCallback:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BEQ	R3, R2, L__I2C2_TimeoutCallback45
NOP	
J	L_I2C2_TimeoutCallback12
NOP	
L__I2C2_TimeoutCallback45:
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_I2C2_TimeoutCallback13:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__I2C2_TimeoutCallback46
NOP	
J	L_I2C2_TimeoutCallback14
NOP	
L__I2C2_TimeoutCallback46:
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
LUI	R24, 40
ORI	R24, R24, 45226
L_I2C2_TimeoutCallback16:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C2_TimeoutCallback16
NOP	
ADDIU	R2, R4, 1
SEH	R4, R2
; i end address is: 16 (R4)
J	L_I2C2_TimeoutCallback13
NOP	
L_I2C2_TimeoutCallback14:
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
L_I2C2_TimeoutCallback12:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BEQ	R3, R2, L__I2C2_TimeoutCallback47
NOP	
J	L_I2C2_TimeoutCallback18
NOP	
L__I2C2_TimeoutCallback47:
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_I2C2_TimeoutCallback19:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__I2C2_TimeoutCallback48
NOP	
J	L_I2C2_TimeoutCallback20
NOP	
L__I2C2_TimeoutCallback48:
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
LUI	R24, 203
ORI	R24, R24, 29524
L_I2C2_TimeoutCallback22:
ADDIU	R24, R24, -1
BNE	R24, R0, L_I2C2_TimeoutCallback22
NOP	
NOP	
NOP	
ADDIU	R2, R4, 1
SEH	R4, R2
; i end address is: 16 (R4)
J	L_I2C2_TimeoutCallback19
NOP	
L_I2C2_TimeoutCallback20:
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
L_I2C2_TimeoutCallback18:
ANDI	R3, R25, 255
ORI	R2, R0, 7
BEQ	R3, R2, L__I2C2_TimeoutCallback49
NOP	
J	L_I2C2_TimeoutCallback24
NOP	
L__I2C2_TimeoutCallback49:
L_I2C2_TimeoutCallback24:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BEQ	R3, R2, L__I2C2_TimeoutCallback50
NOP	
J	L_I2C2_TimeoutCallback25
NOP	
L__I2C2_TimeoutCallback50:
L_I2C2_TimeoutCallback25:
ANDI	R3, R25, 255
ORI	R2, R0, 6
BEQ	R3, R2, L__I2C2_TimeoutCallback51
NOP	
J	L_I2C2_TimeoutCallback26
NOP	
L__I2C2_TimeoutCallback51:
L_I2C2_TimeoutCallback26:
ANDI	R3, R25, 255
ORI	R2, R0, 8
BEQ	R3, R2, L__I2C2_TimeoutCallback52
NOP	
J	L_I2C2_TimeoutCallback27
NOP	
L__I2C2_TimeoutCallback52:
L_I2C2_TimeoutCallback27:
ANDI	R3, R25, 255
ORI	R2, R0, 9
BEQ	R3, R2, L__I2C2_TimeoutCallback53
NOP	
J	L_I2C2_TimeoutCallback28
NOP	
L__I2C2_TimeoutCallback53:
L_I2C2_TimeoutCallback28:
L_end_I2C2_TimeoutCallback:
JR	RA
NOP	
; end of _I2C2_TimeoutCallback
