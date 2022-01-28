_setup_LM35:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
ORI	R2, R0, 32768
SW	R2, Offset(TRISB+8)(GP)
SH	R25, Offset(LM35_sample_count+0)(GP)
ADDIU	R2, R25, 1
SH	R2, Offset(LM35_divisor+0)(GP)
JAL	_ADC1_Init+0
NOP	
L_end_setup_LM35:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _setup_LM35
_LM35_Adc_Average:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
LHU	R3, Offset(LM35_sample_count+0)(GP)
LH	R2, Offset(LM35_Adc_Average_count_L0+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__LM35_Adc_Average4
NOP	
J	L_LM35_Adc_Average0
NOP	
L__LM35_Adc_Average4:
LH	R2, 0(R25)
SEH	R3, R2
LHU	R2, Offset(LM35_divisor+0)(GP)
DIVU	R3, R2
MFLO	R2
SH	R2, 0(R25)
SH	R0, Offset(LM35_Adc_Average_count_L0+0)(GP)
ORI	R2, R0, 65535
J	L_end_LM35_Adc_Average
NOP	
L_LM35_Adc_Average0:
SW	R25, 4(SP)
SEH	R25, R26
JAL	_ADC1_Get_Sample+0
NOP	
LW	R25, 4(SP)
LH	R3, 0(R25)
ADDU	R2, R3, R2
SH	R2, 0(R25)
LH	R2, Offset(LM35_Adc_Average_count_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(LM35_Adc_Average_count_L0+0)(GP)
ORI	R2, R0, 1
L_end_LM35_Adc_Average:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _LM35_Adc_Average
_LM35_Adc_Single:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
SW	R25, 4(SP)
SEH	R25, R26
JAL	_ADC1_Get_Sample+0
NOP	
L_end_LM35_Adc_Single:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _LM35_Adc_Single
_getLM35Temp:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
; ratio start address is: 36 (R9)
LUI	R9, 16038
ORI	R9, R9, 63124
SEH	R4, R26
JAL	__SignedIntegralToFloat+0
NOP	
; ave start address is: 12 (R3)
MOVZ	R3, R2, R0
MOVZ	R4, R2, R0
MOVZ	R6, R9, R0
JAL	__Mul_FP+0
NOP	
; ratio end address is: 36 (R9)
; C start address is: 64 (R16)
MOVZ	R16, R2, R0
LUI	R4, 17288
ORI	R4, R4, 37683
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; K start address is: 68 (R17)
MOVZ	R17, R2, R0
LUI	R4, 16358
ORI	R4, R4, 26214
MOVZ	R6, R16, R0
JAL	__Mul_FP+0
NOP	
LUI	R4, 16896
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; F start address is: 16 (R4)
MOVZ	R4, R2, R0
SW	R17, 0(R25)
; K end address is: 68 (R17)
ADDIU	R2, R25, 4
SW	R16, 0(R2)
; C end address is: 64 (R16)
ADDIU	R2, R25, 8
SW	R4, 0(R2)
; F end address is: 16 (R4)
ADDIU	R2, R25, 12
SW	R3, 0(R2)
; ave end address is: 12 (R3)
L_end_getLM35Temp:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _getLM35Temp
