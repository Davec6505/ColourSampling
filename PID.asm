_PID_Control:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
JAL	_strlen+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__PID_Control11
NOP	
J	L_PID_Control0
NOP	
L__PID_Control11:
ORI	R2, R0, 1
SB	R2, Offset(_PID_+0)(GP)
L_PID_Control0:
JAL	_strlen+0
NOP	
SEH	R3, R2
ORI	R2, R0, 2
BEQ	R3, R2, L__PID_Control12
NOP	
J	L_PID_Control1
NOP	
L__PID_Control12:
ORI	R2, R0, 2
SB	R2, Offset(_PID_+0)(GP)
L_PID_Control1:
JAL	_strlen+0
NOP	
SEH	R3, R2
ORI	R2, R0, 3
BEQ	R3, R2, L__PID_Control13
NOP	
J	L_PID_Control2
NOP	
L__PID_Control13:
ORI	R2, R0, 3
SB	R2, Offset(_PID_+0)(GP)
L_PID_Control2:
JAL	_strlen+0
NOP	
L_end_PID_Control:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _PID_Control
_Reset_PID:
SW	R0, Offset(_PID_+20)(GP)
SW	R0, Offset(_PID_+32)(GP)
LBU	R2, Offset(_PID_+52)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_PID_+52)(GP)
L_end_Reset_PID:
JR	RA
NOP	
; end of _Reset_PID
_Init_PID:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
; MaxOutput start address is: 36 (R9)
LH	R9, 4(SP)
; Offset start address is: 40 (R10)
LH	R10, 6(SP)
SW	R25, Offset(_PID_+4)(GP)
SW	R26, Offset(_PID_+8)(GP)
SW	R27, Offset(_PID_+12)(GP)
SEH	R4, R28
JAL	__SignedIntegralToFloat+0
NOP	
SW	R2, Offset(_PID_+36)(GP)
SEH	R4, R9
JAL	__SignedIntegralToFloat+0
NOP	
; MaxOutput end address is: 36 (R9)
SW	R2, Offset(_PID_+40)(GP)
SH	R10, Offset(_PID_+48)(GP)
; Offset end address is: 40 (R10)
SW	R0, Offset(_PID_+20)(GP)
SW	R0, Offset(_PID_+24)(GP)
SW	R0, Offset(_PID_+32)(GP)
LBU	R2, Offset(_PID_+52)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_PID_+52)(GP)
L_end_Init_PID:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Init_PID
_PID_Calculate:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
MOVZ	R6, R26, R0
MOVZ	R4, R25, R0
JAL	__Sub_FP+0
NOP	
SW	R2, Offset(_PID_+44)(GP)
LW	R4, Offset(_PID_+4)(GP)
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, Offset(_PID_+16)(GP)
LBU	R2, Offset(_PID_+0)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L__PID_Calculate17
NOP	
J	L_PID_Calculate3
NOP	
L__PID_Calculate17:
LW	R6, Offset(_PID_+8)(GP)
LW	R4, Offset(_PID_+44)(GP)
JAL	__Mul_FP+0
NOP	
LW	R4, Offset(_PID_+20)(GP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
SW	R2, Offset(_PID_+20)(GP)
LW	R4, Offset(_PID_+36)(GP)
MOVZ	R6, R2, R0
JAL	__Compare_FP+0
NOP	
SLT	R2, R0, R2
BNE	R2, R0, L__PID_Calculate20
NOP	
J	L_PID_Calculate4
NOP	
L__PID_Calculate20:
LW	R2, Offset(_PID_+36)(GP)
SW	R2, Offset(_PID_+20)(GP)
L_PID_Calculate4:
LW	R6, Offset(_PID_+40)(GP)
LW	R4, Offset(_PID_+20)(GP)
JAL	__Compare_FP+0
NOP	
SLT	R2, R0, R2
BNE	R2, R0, L__PID_Calculate23
NOP	
J	L_PID_Calculate5
NOP	
L__PID_Calculate23:
LW	R2, Offset(_PID_+40)(GP)
SW	R2, Offset(_PID_+20)(GP)
L_PID_Calculate5:
LBU	R2, Offset(_PID_+0)(GP)
SLTIU	R2, R2, 3
BEQ	R2, R0, L__PID_Calculate24
NOP	
J	L_PID_Calculate6
NOP	
L__PID_Calculate24:
LBU	R2, Offset(_PID_+52)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__PID_Calculate26
NOP	
J	L_PID_Calculate7
NOP	
L__PID_Calculate26:
LBU	R2, Offset(_PID_+52)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_PID_+52)(GP)
SW	R26, Offset(_PID_+32)(GP)
L_PID_Calculate7:
LW	R6, Offset(_PID_+32)(GP)
MOVZ	R4, R26, R0
JAL	__Sub_FP+0
NOP	
LW	R4, Offset(_PID_+4)(GP)
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, Offset(_PID_+24)(GP)
SW	R26, Offset(_PID_+32)(GP)
L_PID_Calculate6:
L_PID_Calculate3:
LW	R6, Offset(_PID_+20)(GP)
LW	R4, Offset(_PID_+16)(GP)
JAL	__Add_FP+0
NOP	
LW	R4, Offset(_PID_+24)(GP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
MOVZ	R4, R2, R0
JAL	__FloatToSignedIntegral+0
NOP	
LH	R3, Offset(_PID_+48)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_PID_+50)(GP)
SEH	R4, R2
JAL	__SignedIntegralToFloat+0
NOP	
LW	R4, Offset(_PID_+36)(GP)
MOVZ	R6, R2, R0
JAL	__Compare_FP+0
NOP	
SLT	R2, R0, R2
BNE	R2, R0, L__PID_Calculate29
NOP	
J	L_PID_Calculate8
NOP	
L__PID_Calculate29:
LW	R4, Offset(_PID_+36)(GP)
JAL	__FloatToSignedIntegral+0
NOP	
SH	R2, Offset(_PID_+50)(GP)
L_PID_Calculate8:
LH	R4, Offset(_PID_+50)(GP)
JAL	__SignedIntegralToFloat+0
NOP	
LW	R4, Offset(_PID_+40)(GP)
MOVZ	R6, R2, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
BNE	R2, R0, L__PID_Calculate32
NOP	
J	L_PID_Calculate9
NOP	
L__PID_Calculate32:
LW	R4, Offset(_PID_+40)(GP)
JAL	__FloatToSignedIntegral+0
NOP	
SH	R2, Offset(_PID_+50)(GP)
L_PID_Calculate9:
LH	R2, Offset(_PID_+50)(GP)
L_end_PID_Calculate:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _PID_Calculate
