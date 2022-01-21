_setup_Thermister:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
ORI	R2, R0, 32768
SW	R2, Offset(TRISB+8)(GP)
SH	R25, Offset(Thermister_sample_count+0)(GP)
ADDIU	R2, R25, 1
SH	R2, Offset(Thermister_divisor+0)(GP)
JAL	_ADC1_Init+0
NOP	
L_end_setup_Thermister:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _setup_Thermister
_Adc_Average:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
LHU	R3, Offset(Thermister_sample_count+0)(GP)
LH	R2, Offset(Adc_Average_count_L0+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__Adc_Average4
NOP	
J	L_Adc_Average0
NOP	
L__Adc_Average4:
LH	R2, 0(R25)
SEH	R3, R2
LHU	R2, Offset(Thermister_divisor+0)(GP)
DIVU	R3, R2
MFLO	R2
SH	R2, 0(R25)
SH	R0, Offset(Adc_Average_count_L0+0)(GP)
ORI	R2, R0, 65535
J	L_end_Adc_Average
NOP	
L_Adc_Average0:
SW	R25, 4(SP)
ORI	R25, R0, 15
JAL	_ADC1_Get_Sample+0
NOP	
LW	R25, 4(SP)
LH	R3, 0(R25)
ADDU	R2, R3, R2
SH	R2, 0(R25)
LH	R2, Offset(Adc_Average_count_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Adc_Average_count_L0+0)(GP)
ORI	R2, R0, 1
L_end_Adc_Average:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Adc_Average
_getTemp:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
SEH	R4, R26
JAL	__SignedIntegralToFloat+0
NOP	
; temp start address is: 64 (R16)
MOVZ	R16, R2, R0
LUI	R4, 17535
ORI	R4, R4, 49152
MOVZ	R6, R2, R0
JAL	__Div_FP+0
NOP	
LUI	R6, 16256
ORI	R6, R6, 0
MOVZ	R4, R2, R0
JAL	__Sub_FP+0
NOP	
LUI	R4, 17810
ORI	R4, R4, 57344
MOVZ	R6, R2, R0
JAL	__Div_FP+0
NOP	
LUI	R6, 18371
ORI	R6, R6, 20480
MOVZ	R4, R2, R0
JAL	__Div_FP+0
NOP	
SW	R25, 4(SP)
MOVZ	R25, R2, R0
JAL	_log+0
NOP	
LW	R25, 4(SP)
LUI	R6, 17791
ORI	R6, R6, 20480
MOVZ	R4, R2, R0
JAL	__Div_FP+0
NOP	
LUI	R4, 15195
ORI	R4, R4, 53007
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
LUI	R4, 16256
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Div_FP+0
NOP	
; K start address is: 12 (R3)
MOVZ	R3, R2, R0
LUI	R6, 17288
ORI	R6, R6, 37683
MOVZ	R4, R2, R0
JAL	__Sub_FP+0
NOP	
; C start address is: 68 (R17)
MOVZ	R17, R2, R0
LUI	R4, 16656
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
LUI	R6, 16544
ORI	R6, R6, 0
MOVZ	R4, R2, R0
JAL	__Div_FP+0
NOP	
LUI	R4, 16896
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; F start address is: 16 (R4)
MOVZ	R4, R2, R0
SW	R3, 0(R25)
; K end address is: 12 (R3)
ADDIU	R2, R25, 4
SW	R17, 0(R2)
; C end address is: 68 (R17)
ADDIU	R2, R25, 8
SW	R4, 0(R2)
; F end address is: 16 (R4)
ADDIU	R2, R25, 12
SW	R16, 0(R2)
; temp end address is: 64 (R16)
L_end_getTemp:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _getTemp
