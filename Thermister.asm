_setup_Thermister:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
ORI	R2, R0, 32768
SW	R2, Offset(TRISB+8)(GP)
JAL	_ADC1_Init+0
NOP	
L_end_setup_Thermister:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _setup_Thermister
_getTemp:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
; numSamples start address is: 16 (R4)
ORI	R4, R0, 5
; adcVal start address is: 64 (R16)
MOVZ	R16, R0, R0
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; numSamples end address is: 16 (R4)
; i end address is: 20 (R5)
; adcVal end address is: 64 (R16)
L_getTemp0:
; i start address is: 20 (R5)
; adcVal start address is: 64 (R16)
; numSamples start address is: 16 (R4)
SEH	R3, R5
SEH	R2, R4
SLT	R2, R3, R2
BNE	R2, R0, L__getTemp7
NOP	
J	L_getTemp1
NOP	
L__getTemp7:
SW	R25, 4(SP)
ORI	R25, R0, 15
JAL	_ADC1_Get_Sample+0
NOP	
LW	R25, 4(SP)
ADDU	R2, R16, R2
SEH	R16, R2
LUI	R24, 40
ORI	R24, R24, 45226
L_getTemp3:
ADDIU	R24, R24, -1
BNE	R24, R0, L_getTemp3
NOP	
ADDIU	R2, R5, 1
SEH	R5, R2
; numSamples end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_getTemp0
NOP	
L_getTemp1:
SEH	R3, R16
; adcVal end address is: 64 (R16)
ORI	R2, R0, 5
DIV	R3, R2
MFLO	R2
; adcVal start address is: 64 (R16)
SEH	R16, R2
SEH	R4, R2
JAL	__SignedIntegralToFloat+0
NOP	
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
SW	R2, 8(SP)
SEH	R4, R16
JAL	__SignedIntegralToFloat+0
NOP	
; adcVal end address is: 64 (R16)
LW	R3, 8(SP)
SW	R2, 0(R3)
L_end_getTemp:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _getTemp
