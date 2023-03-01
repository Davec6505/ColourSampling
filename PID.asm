_PID_Control:
;PID.c,7 :: 		char PID_Control(char *PID){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;PID.c,8 :: 		if(1 == strlen(PID))PID_.control = 1;
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
;PID.c,9 :: 		if(2 == strlen(PID))PID_.control = 2;
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
;PID.c,10 :: 		if(3 == strlen(PID))PID_.control = 3;
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
;PID.c,11 :: 		return strlen(PID);
JAL	_strlen+0
NOP	
;PID.c,12 :: 		}
L_end_PID_Control:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _PID_Control
_Reset_PID:
;PID.c,14 :: 		void Reset_PID()
;PID.c,16 :: 		PID_.PID_Integrated = 0;
SW	R0, Offset(_PID_+20)(GP)
;PID.c,17 :: 		PID_.PID_Prev_Input = 0;
SW	R0, Offset(_PID_+32)(GP)
;PID.c,18 :: 		PID_.PID_First_Time = TRUE;
LBU	R2, Offset(_PID_+52)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_PID_+52)(GP)
;PID.c,19 :: 		}
L_end_Reset_PID:
JR	RA
NOP	
; end of _Reset_PID
_Init_PID:
;PID.c,22 :: 		void Init_PID(float Kp, float Ki, float Kd, int MinOutput, int MaxOutput,int Offset)
ADDIU	SP, SP, -4
SW	RA, 0(SP)
; MaxOutput start address is: 36 (R9)
LH	R9, 4(SP)
; Offset start address is: 40 (R10)
LH	R10, 6(SP)
;PID.c,24 :: 		PID_.PID_Kp         = Kp;
SW	R25, Offset(_PID_+4)(GP)
;PID.c,25 :: 		PID_.PID_Ki         = Ki;
SW	R26, Offset(_PID_+8)(GP)
;PID.c,26 :: 		PID_.PID_Kd         = Kd;
SW	R27, Offset(_PID_+12)(GP)
;PID.c,27 :: 		PID_.PID_MinOutput  = (float)MinOutput;
SEH	R4, R28
JAL	__SignedIntegralToFloat+0
NOP	
SW	R2, Offset(_PID_+36)(GP)
;PID.c,28 :: 		PID_.PID_MaxOutput  = (float)MaxOutput;
SEH	R4, R9
JAL	__SignedIntegralToFloat+0
NOP	
; MaxOutput end address is: 36 (R9)
SW	R2, Offset(_PID_+40)(GP)
;PID.c,29 :: 		PID_.PID_OffSet     = Offset;
SH	R10, Offset(_PID_+48)(GP)
; Offset end address is: 40 (R10)
;PID.c,30 :: 		PID_.PID_Integrated = 0;
SW	R0, Offset(_PID_+20)(GP)
;PID.c,31 :: 		PID_.PID_DiffValue  = 0;
SW	R0, Offset(_PID_+24)(GP)
;PID.c,32 :: 		PID_.PID_Prev_Input = 0;
SW	R0, Offset(_PID_+32)(GP)
;PID.c,33 :: 		PID_.PID_First_Time = TRUE;
LBU	R2, Offset(_PID_+52)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_PID_+52)(GP)
;PID.c,34 :: 		}
L_end_Init_PID:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _Init_PID
_PID_Calculate:
;PID.c,38 :: 		int PID_Calculate( float Sp, float Pv){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;PID.c,41 :: 		PID_.Err = Sp - Pv;
MOVZ	R6, R26, R0
MOVZ	R4, R25, R0
JAL	__Sub_FP+0
NOP	
SW	R2, Offset(_PID_+44)(GP)
;PID.c,44 :: 		PID_.PID_Err = PID_.Err  * PID_.PID_Kp  ;
LW	R4, Offset(_PID_+4)(GP)
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, Offset(_PID_+16)(GP)
;PID.c,47 :: 		if(PID_.control >= 2){
LBU	R2, Offset(_PID_+0)(GP)
SLTIU	R2, R2, 2
BEQ	R2, R0, L__PID_Calculate17
NOP	
J	L_PID_Calculate3
NOP	
L__PID_Calculate17:
;PID.c,49 :: 		PID_.PID_Integrated = PID_.PID_Integrated + (PID_.Err * PID_.PID_Ki);
LW	R6, Offset(_PID_+8)(GP)
LW	R4, Offset(_PID_+44)(GP)
JAL	__Mul_FP+0
NOP	
LW	R4, Offset(_PID_+20)(GP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
SW	R2, Offset(_PID_+20)(GP)
;PID.c,51 :: 		if (PID_.PID_Integrated < PID_.PID_MinOutput)
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
;PID.c,52 :: 		PID_.PID_Integrated = PID_.PID_MinOutput;
LW	R2, Offset(_PID_+36)(GP)
SW	R2, Offset(_PID_+20)(GP)
L_PID_Calculate4:
;PID.c,53 :: 		if (PID_.PID_Integrated > PID_.PID_MaxOutput)
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
;PID.c,54 :: 		PID_.PID_Integrated = PID_.PID_MaxOutput;
LW	R2, Offset(_PID_+40)(GP)
SW	R2, Offset(_PID_+20)(GP)
L_PID_Calculate5:
;PID.c,57 :: 		if(PID_.control >=3){
LBU	R2, Offset(_PID_+0)(GP)
SLTIU	R2, R2, 3
BEQ	R2, R0, L__PID_Calculate24
NOP	
J	L_PID_Calculate6
NOP	
L__PID_Calculate24:
;PID.c,58 :: 		if (PID_.PID_First_Time){      // to avoid a huge DiffValue the first time (PID_Prev_Input = 0)
LBU	R2, Offset(_PID_+52)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__PID_Calculate26
NOP	
J	L_PID_Calculate7
NOP	
L__PID_Calculate26:
;PID.c,59 :: 		PID_.PID_First_Time = FALSE;
LBU	R2, Offset(_PID_+52)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_PID_+52)(GP)
;PID.c,60 :: 		PID_.PID_Prev_Input = Pv;
SW	R26, Offset(_PID_+32)(GP)
;PID.c,61 :: 		}
L_PID_Calculate7:
;PID.c,62 :: 		PID_.PID_DiffValue =  (Pv - PID_.PID_Prev_Input) * PID_.PID_Kp;
LW	R6, Offset(_PID_+32)(GP)
MOVZ	R4, R26, R0
JAL	__Sub_FP+0
NOP	
LW	R4, Offset(_PID_+4)(GP)
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, Offset(_PID_+24)(GP)
;PID.c,63 :: 		PID_.PID_Prev_Input = Pv;
SW	R26, Offset(_PID_+32)(GP)
;PID.c,64 :: 		}
L_PID_Calculate6:
;PID.c,66 :: 		}
L_PID_Calculate3:
;PID.c,68 :: 		PID_.Result = (int)(PID_.PID_Err + PID_.PID_Integrated  + PID_.PID_DiffValue)+PID_.PID_OffSet; // mind the minus sign!!!
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
;PID.c,71 :: 		if (PID_.Result < PID_.PID_MinOutput)
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
;PID.c,72 :: 		PID_.Result = PID_.PID_MinOutput;
LW	R4, Offset(_PID_+36)(GP)
JAL	__FloatToSignedIntegral+0
NOP	
SH	R2, Offset(_PID_+50)(GP)
L_PID_Calculate8:
;PID.c,73 :: 		if (PID_.Result > PID_.PID_MaxOutput)
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
;PID.c,74 :: 		PID_.Result = PID_.PID_MaxOutput;
LW	R4, Offset(_PID_+40)(GP)
JAL	__FloatToSignedIntegral+0
NOP	
SH	R2, Offset(_PID_+50)(GP)
L_PID_Calculate9:
;PID.c,75 :: 		return PID_.Result;
LH	R2, Offset(_PID_+50)(GP)
;PID.c,76 :: 		}
L_end_PID_Calculate:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _PID_Calculate
