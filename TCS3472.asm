_TCS3472_Init:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
SW	R25, 4(SP)
SB	R27, 8(SP)
SB	R26, 9(SP)
SB	R25, 10(SP)
ORI	R25, R0, 18
JAL	_TCS3472_Read8+0
NOP	
LBU	R25, 10(SP)
LBU	R26, 9(SP)
LBU	R27, 8(SP)
SB	R2, 11(SP)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L__TCS3472_Init76
NOP	
J	L_TCS3472_Init0
NOP	
L__TCS3472_Init76:
MOVZ	R2, R0, R0
J	L_end_TCS3472_Init
NOP	
L_TCS3472_Init0:
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_Init77
NOP	
J	L_TCS3472_Init1
NOP	
L__TCS3472_Init77:
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_TCS3472_Bits+0)(GP)
SB	R26, 8(SP)
JAL	_TCS3472_SetIntergration_Time+0
NOP	
LBU	R26, 8(SP)
ANDI	R25, R26, 255
JAL	_TCS3472_SetGain+0
NOP	
JAL	_TCS3472_Enable+0
NOP	
L_TCS3472_Init1:
LBU	R2, 11(SP)
L_end_TCS3472_Init:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Init
_SetColourThresholds:
SH	R25, Offset(_Col_Thresh+6)(GP)
SH	R26, Offset(_Col_Thresh+0)(GP)
SH	R27, Offset(_Col_Thresh+2)(GP)
SH	R28, Offset(_Col_Thresh+4)(GP)
L_end_SetColourThresholds:
JR	RA
NOP	
; end of _SetColourThresholds
_TCS3472_Write:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
SB	R25, 4(SP)
JAL	_I2C2_Start+0
NOP	
ORI	R25, R0, 82
JAL	_I2C2_Write+0
NOP	
LBU	R25, 4(SP)
JAL	_I2C2_Write+0
NOP	
JAL	_I2C2_Stop+0
NOP	
L_end_TCS3472_Write:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TCS3472_Write
_TCS3472_Write8:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
SW	R25, 4(SP)
SB	R26, 8(SP)
SB	R25, 9(SP)
JAL	_I2C2_Start+0
NOP	
ORI	R25, R0, 82
JAL	_I2C2_Write+0
NOP	
LBU	R25, 9(SP)
ORI	R2, R25, 128
ANDI	R25, R2, 255
JAL	_I2C2_Write+0
NOP	
LBU	R26, 8(SP)
ANDI	R25, R26, 255
JAL	_I2C2_Write+0
NOP	
JAL	_I2C2_Stop+0
NOP	
L_end_TCS3472_Write8:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Write8
_TCS3472_Read8:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
SW	R25, 4(SP)
SB	R25, 8(SP)
JAL	_I2C2_Start+0
NOP	
ORI	R25, R0, 82
JAL	_I2C2_Write+0
NOP	
LBU	R25, 8(SP)
ORI	R2, R25, 128
ANDI	R25, R2, 255
JAL	_I2C2_Write+0
NOP	
JAL	_I2C2_Stop+0
NOP	
JAL	_I2C2_Start+0
NOP	
ORI	R25, R0, 83
JAL	_I2C2_Write+0
NOP	
ORI	R25, R0, 1
JAL	_I2C2_Read+0
NOP	
SB	R2, 9(SP)
JAL	_I2C2_Stop+0
NOP	
LBU	R2, 9(SP)
L_end_TCS3472_Read8:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Read8
_TCS3472_Read16:
ADDIU	SP, SP, -16
SW	RA, 0(SP)
SW	R25, 4(SP)
SB	R25, 8(SP)
JAL	_I2C2_Start+0
NOP	
ORI	R25, R0, 82
JAL	_I2C2_Write+0
NOP	
LBU	R25, 8(SP)
ORI	R2, R25, 160
ANDI	R25, R2, 255
JAL	_I2C2_Write+0
NOP	
JAL	_I2C2_Restart+0
NOP	
ORI	R25, R0, 83
JAL	_I2C2_Write+0
NOP	
ADDIU	R2, SP, 9
SW	R2, 12(SP)
MOVZ	R25, R0, R0
JAL	_I2C2_Read+0
NOP	
LW	R3, 12(SP)
SB	R2, 0(R3)
ADDIU	R2, SP, 9
ADDIU	R2, R2, 1
SW	R2, 12(SP)
ORI	R25, R0, 1
JAL	_I2C2_Read+0
NOP	
LW	R3, 12(SP)
SB	R2, 0(R3)
JAL	_I2C2_Stop+0
NOP	
ADDIU	R4, SP, 9
LBU	R2, 0(R4)
; reslt start address is: 12 (R3)
ANDI	R3, R2, 255
ANDI	R2, R3, 65535
; reslt end address is: 12 (R3)
SLL	R3, R2, 8
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
L_end_TCS3472_Read16:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _TCS3472_Read16
_TCS3472_Enable:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
LUI	R24, 1
ORI	R24, R24, 14463
L_TCS3472_Enable2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TCS3472_Enable2
NOP	
NOP	
ORI	R26, R0, 3
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
L_end_TCS3472_Enable:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Enable
_TCS3472_Disable:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
MOVZ	R25, R0, R0
JAL	_TCS3472_Read8+0
NOP	
ORI	R3, R0, 252
AND	R2, R2, R3
ANDI	R26, R2, 255
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
L_end_TCS3472_Disable:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Disable
_TCS3472_SetIntergration_Time:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_SetIntergration_Time86
NOP	
J	L_TCS3472_SetIntergration_Time4
NOP	
L__TCS3472_SetIntergration_Time86:
MOVZ	R2, R0, R0
J	L_end_TCS3472_SetIntergration_Time
NOP	
L_TCS3472_SetIntergration_Time4:
ANDI	R26, R25, 255
ORI	R25, R0, 1
JAL	_TCS3472_Write8+0
NOP	
ORI	R2, R0, 1
L_end_TCS3472_SetIntergration_Time:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_SetIntergration_Time
_TCS3472_SetGain:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_SetGain88
NOP	
J	L_TCS3472_SetGain5
NOP	
L__TCS3472_SetGain88:
MOVZ	R2, R0, R0
J	L_end_TCS3472_SetGain
NOP	
L_TCS3472_SetGain5:
ANDI	R26, R25, 255
ORI	R25, R0, 15
JAL	_TCS3472_Write8+0
NOP	
ORI	R2, R0, 1
L_end_TCS3472_SetGain:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_SetGain
_TCS3472_getRawData:
ADDIU	SP, SP, -16
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
LW	R25, 8(SP)
SH	R2, 0(R25)
ADDIU	R2, R25, 2
SW	R2, 12(SP)
SW	R25, 8(SP)
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
LW	R25, 8(SP)
LW	R3, 12(SP)
SH	R2, 0(R3)
ADDIU	R2, R25, 4
SW	R2, 12(SP)
SW	R25, 8(SP)
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
LW	R25, 8(SP)
LW	R3, 12(SP)
SH	R2, 0(R3)
ADDIU	R2, R25, 6
SW	R2, 12(SP)
ORI	R25, R0, 26
JAL	_TCS3472_Read16+0
NOP	
LW	R3, 12(SP)
SH	R2, 0(R3)
L_end_TCS3472_getRawData:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _TCS3472_getRawData
_TCS3472_getRawDataOnce:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
SW	R25, 4(SP)
JAL	_TCS3472_Enable+0
NOP	
LW	R25, 4(SP)
JAL	_TCS3472_getRawData+0
NOP	
JAL	_TCS3472_Disable+0
NOP	
L_end_TCS3472_getRawDataOnce:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TCS3472_getRawDataOnce
_TCS3472_CalcColTemp:
ADDIU	SP, SP, -28
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
ANDI	R2, R25, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp92
NOP	
J	L__TCS3472_CalcColTemp58
NOP	
L__TCS3472_CalcColTemp92:
ANDI	R2, R26, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp93
NOP	
J	L__TCS3472_CalcColTemp57
NOP	
L__TCS3472_CalcColTemp93:
ANDI	R2, R27, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp94
NOP	
J	L__TCS3472_CalcColTemp56
NOP	
L__TCS3472_CalcColTemp94:
L__TCS3472_CalcColTemp55:
MOVZ	R2, R0, R0
J	L_end_TCS3472_CalcColTemp
NOP	
L__TCS3472_CalcColTemp58:
L__TCS3472_CalcColTemp57:
L__TCS3472_CalcColTemp56:
ANDI	R4, R25, 65535
JAL	__Unsigned16IntToFloat+0
NOP	
SW	R2, 24(SP)
LUI	R4, 48839
ORI	R4, R4, 27787
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
ANDI	R4, R26, 65535
JAL	__Unsigned16IntToFloat+0
NOP	
SW	R2, 20(SP)
LUI	R4, 16319
ORI	R4, R4, 9332
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
SW	R2, 12(SP)
ANDI	R4, R27, 65535
JAL	__Unsigned16IntToFloat+0
NOP	
SW	R2, 16(SP)
LUI	R4, 48457
ORI	R4, R4, 7445
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; X start address is: 64 (R16)
MOVZ	R16, R2, R0
LUI	R6, 48632
ORI	R6, R6, 14261
LW	R4, 24(SP)
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
LUI	R6, 16227
ORI	R6, R6, 38273
LW	R4, 20(SP)
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
SW	R2, 12(SP)
LUI	R6, 48636
ORI	R6, R6, 7130
LW	R4, 16(SP)
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; Y start address is: 12 (R3)
MOVZ	R3, R2, R0
LUI	R6, 15628
ORI	R6, R6, 32296
LW	R4, 24(SP)
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
LUI	R6, 48776
ORI	R6, R6, 2517
LW	R4, 20(SP)
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
SW	R2, 12(SP)
LUI	R6, 16241
ORI	R6, R6, 40160
LW	R4, 16(SP)
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; Z start address is: 60 (R15)
MOVZ	R15, R2, R0
MOVZ	R4, R16, R0
MOVZ	R6, R3, R0
JAL	__Add_FP+0
NOP	
MOVZ	R4, R2, R0
MOVZ	R6, R15, R0
JAL	__Add_FP+0
NOP	
; Z end address is: 60 (R15)
SW	R2, 12(SP)
MOVZ	R6, R2, R0
MOVZ	R4, R16, R0
JAL	__Div_FP+0
NOP	
; X end address is: 64 (R16)
; xc start address is: 64 (R16)
MOVZ	R16, R2, R0
LW	R6, 12(SP)
MOVZ	R4, R3, R0
JAL	__Div_FP+0
NOP	
; Y end address is: 12 (R3)
; yc start address is: 12 (R3)
MOVZ	R3, R2, R0
LUI	R6, 16041
ORI	R6, R6, 64487
MOVZ	R4, R16, R0
JAL	__Sub_FP+0
NOP	
; xc end address is: 64 (R16)
SW	R2, 12(SP)
LUI	R4, 15934
ORI	R4, R4, 16987
MOVZ	R6, R3, R0
JAL	__Sub_FP+0
NOP	
; yc end address is: 12 (R3)
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Div_FP+0
NOP	
; n start address is: 76 (R19)
MOVZ	R19, R2, R0
LUI	R26, 16448
ORI	R26, R26, 0
MOVZ	R25, R2, R0
JAL	_pow+0
NOP	
LUI	R4, 17376
ORI	R4, R4, 32768
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
LUI	R26, 16384
ORI	R26, R26, 0
MOVZ	R25, R19, R0
JAL	_pow+0
NOP	
LUI	R4, 17756
ORI	R4, R4, 20480
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
SW	R2, 12(SP)
LUI	R4, 17877
ORI	R4, R4, 14950
MOVZ	R6, R19, R0
JAL	__Mul_FP+0
NOP	
; n end address is: 76 (R19)
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
LUI	R4, 17836
ORI	R4, R4, 33444
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
MOVZ	R4, R2, R0
JAL	__FloatToUnsignedIntegral+0
NOP	
L_end_TCS3472_CalcColTemp:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _TCS3472_CalcColTemp
_TCS3472_CalcColTemp_dn40:
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp_dn4096
NOP	
J	L_TCS3472_CalcColTemp_dn409
NOP	
L__TCS3472_CalcColTemp_dn4096:
MOVZ	R2, R0, R0
J	L_end_TCS3472_CalcColTemp_dn40
NOP	
L_TCS3472_CalcColTemp_dn409:
ANDI	R3, R26, 255
ORI	R2, R0, 256
SUBU	R2, R2, R3
SEH	R2, R2
SLTI	R2, R2, 64
BEQ	R2, R0, L__TCS3472_CalcColTemp_dn4097
NOP	
J	L_TCS3472_CalcColTemp_dn4010
NOP	
L__TCS3472_CalcColTemp_dn4097:
; sat start address is: 16 (R4)
ORI	R4, R0, 65535
; sat end address is: 16 (R4)
J	L_TCS3472_CalcColTemp_dn4011
NOP	
L_TCS3472_CalcColTemp_dn4010:
ANDI	R3, R26, 255
ORI	R2, R0, 256
SUBU	R2, R2, R3
SEH	R2, R2
SLL	R2, R2, 10
; sat start address is: 16 (R4)
SEH	R4, R2
; sat end address is: 16 (R4)
L_TCS3472_CalcColTemp_dn4011:
; sat start address is: 16 (R4)
ANDI	R3, R26, 255
ORI	R2, R0, 256
SUBU	R2, R2, R3
SEH	R2, R2
SLTI	R2, R2, 64
BNE	R2, R0, L__TCS3472_CalcColTemp_dn4098
NOP	
J	L__TCS3472_CalcColTemp_dn4059
NOP	
L__TCS3472_CalcColTemp_dn4098:
ANDI	R2, R4, 65535
SRL	R2, R2, 2
SUBU	R2, R4, R2
ANDI	R4, R2, 65535
; sat end address is: 16 (R4)
J	L_TCS3472_CalcColTemp_dn4012
NOP	
L__TCS3472_CalcColTemp_dn4059:
L_TCS3472_CalcColTemp_dn4012:
; sat start address is: 16 (R4)
LHU	R2, 0(R25)
ANDI	R3, R2, 65535
ANDI	R2, R4, 65535
; sat end address is: 16 (R4)
SLTU	R2, R3, R2
BEQ	R2, R0, L__TCS3472_CalcColTemp_dn4099
NOP	
J	L_TCS3472_CalcColTemp_dn4013
NOP	
L__TCS3472_CalcColTemp_dn4099:
MOVZ	R2, R0, R0
J	L_end_TCS3472_CalcColTemp_dn40
NOP	
L_TCS3472_CalcColTemp_dn4013:
ADDIU	R2, R25, 2
LHU	R3, 0(R2)
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDU	R3, R3, R2
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDU	R3, R3, R2
LHU	R2, 0(R25)
ANDI	R3, R3, 65535
ANDI	R2, R2, 65535
SLTU	R2, R2, R3
BNE	R2, R0, L__TCS3472_CalcColTemp_dn40100
NOP	
J	L_TCS3472_CalcColTemp_dn4014
NOP	
L__TCS3472_CalcColTemp_dn40100:
ADDIU	R2, R25, 2
LHU	R3, 0(R2)
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDU	R3, R3, R2
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDU	R3, R3, R2
LHU	R2, 0(R25)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
; ?FLOC___TCS3472_CalcColTemp_dn40?T124 start address is: 20 (R5)
ANDI	R5, R2, 65535
; ?FLOC___TCS3472_CalcColTemp_dn40?T124 end address is: 20 (R5)
J	L_TCS3472_CalcColTemp_dn4015
NOP	
L_TCS3472_CalcColTemp_dn4014:
; ?FLOC___TCS3472_CalcColTemp_dn40?T124 start address is: 20 (R5)
MOVZ	R5, R0, R0
; ?FLOC___TCS3472_CalcColTemp_dn40?T124 end address is: 20 (R5)
L_TCS3472_CalcColTemp_dn4015:
; ?FLOC___TCS3472_CalcColTemp_dn40?T124 start address is: 20 (R5)
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
SUBU	R3, R2, R5
; r2 start address is: 16 (R4)
ANDI	R4, R3, 65535
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
SUBU	R2, R2, R5
; ?FLOC___TCS3472_CalcColTemp_dn40?T124 end address is: 20 (R5)
; b2 start address is: 20 (R5)
ANDI	R5, R2, 65535
ANDI	R2, R3, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp_dn40101
NOP	
J	L_TCS3472_CalcColTemp_dn4016
NOP	
L__TCS3472_CalcColTemp_dn40101:
; r2 end address is: 16 (R4)
; b2 end address is: 20 (R5)
MOVZ	R2, R0, R0
J	L_end_TCS3472_CalcColTemp_dn40
NOP	
L_TCS3472_CalcColTemp_dn4016:
; b2 start address is: 20 (R5)
; r2 start address is: 16 (R4)
ORI	R2, R0, 3810
MULTU	R2, R5
MFLO	R2
; b2 end address is: 20 (R5)
ANDI	R3, R2, 65535
ANDI	R2, R4, 65535
; r2 end address is: 16 (R4)
DIVU	R3, R2
MFLO	R2
ADDIU	R2, R2, 1391
L_end_TCS3472_CalcColTemp_dn40:
JR	RA
NOP	
; end of _TCS3472_CalcColTemp_dn40
_TCS3472_Calc_Lux:
L_end_TCS3472_Calc_Lux:
JR	RA
NOP	
; end of _TCS3472_Calc_Lux
_TCS3472_SetInterrupt:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_SetInterrupt104
NOP	
J	L_TCS3472_SetInterrupt17
NOP	
L__TCS3472_SetInterrupt104:
MOVZ	R2, R0, R0
J	L_end_TCS3472_SetInterrupt
NOP	
L_TCS3472_SetInterrupt17:
MOVZ	R25, R0, R0
JAL	_TCS3472_Read8+0
NOP	
ORI	R25, R0, 1
ORI	R2, R2, 16
; r start address is: 8 (R2)
L_TCS3472_SetInterrupt19:
ANDI	R26, R2, 255
; r end address is: 8 (R2)
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
ORI	R2, R0, 1
L_end_TCS3472_SetInterrupt:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_SetInterrupt
_TCS3472_ClearInterrupt:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
SW	R25, 4(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_ClearInterrupt106
NOP	
J	L_TCS3472_ClearInterrupt20
NOP	
L__TCS3472_ClearInterrupt106:
MOVZ	R2, R0, R0
J	L_end_TCS3472_ClearInterrupt
NOP	
L_TCS3472_ClearInterrupt20:
ORI	R25, R0, 230
JAL	_TCS3472_Write+0
NOP	
ORI	R2, R0, 1
L_end_TCS3472_ClearInterrupt:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TCS3472_ClearInterrupt
_TCS3472_SetInterrupt_Limits:
ADDIU	SP, SP, -16
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_SetInterrupt_Limits108
NOP	
J	L_TCS3472_SetInterrupt_Limits21
NOP	
L__TCS3472_SetInterrupt_Limits108:
MOVZ	R2, R0, R0
J	L_end_TCS3472_SetInterrupt_Limits
NOP	
L_TCS3472_SetInterrupt_Limits21:
ANDI	R2, R25, 255
SH	R26, 12(SP)
SH	R25, 14(SP)
ANDI	R26, R2, 255
ORI	R25, R0, 4
JAL	_TCS3472_Write8+0
NOP	
LHU	R25, 14(SP)
ANDI	R2, R25, 65535
SRL	R2, R2, 8
ANDI	R26, R2, 65535
ORI	R25, R0, 5
JAL	_TCS3472_Write8+0
NOP	
LHU	R26, 12(SP)
ANDI	R2, R26, 255
SH	R26, 12(SP)
ANDI	R26, R2, 255
ORI	R25, R0, 6
JAL	_TCS3472_Write8+0
NOP	
LHU	R26, 12(SP)
ANDI	R2, R26, 65535
SRL	R2, R2, 8
ANDI	R26, R2, 65535
ORI	R25, R0, 7
JAL	_TCS3472_Write8+0
NOP	
ORI	R2, R0, 1
L_end_TCS3472_SetInterrupt_Limits:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _TCS3472_SetInterrupt_Limits
_TCS3472_C2RGB_Error:
LHU	R3, 0(R25)
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
SUBU	R3, R3, R2
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
SUBU	R3, R3, R2
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
SUBU	R2, R3, R2
; err start address is: 12 (R3)
ANDI	R3, R2, 65535
SEH	R2, R2
SLTI	R2, R2, -32600
BEQ	R2, R0, L__TCS3472_C2RGB_Error110
NOP	
J	L__TCS3472_C2RGB_Error62
NOP	
L__TCS3472_C2RGB_Error110:
SEH	R2, R3
SLTI	R2, R2, 32601
BNE	R2, R0, L__TCS3472_C2RGB_Error111
NOP	
J	L__TCS3472_C2RGB_Error61
NOP	
L__TCS3472_C2RGB_Error111:
J	L_TCS3472_C2RGB_Error24
NOP	
; err end address is: 12 (R3)
L__TCS3472_C2RGB_Error62:
L__TCS3472_C2RGB_Error61:
ORI	R2, R0, 32870
J	L_end_TCS3472_C2RGB_Error
NOP	
L_TCS3472_C2RGB_Error24:
; err start address is: 12 (R3)
SEH	R2, R3
; err end address is: 12 (R3)
L_end_TCS3472_C2RGB_Error:
JR	RA
NOP	
; end of _TCS3472_C2RGB_Error
_GetScaledValues:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
SW	R25, 4(SP)
LH	R2, 0(R25)
SEH	R4, R2
JAL	__SignedIntegralToFloat+0
NOP	
; c start address is: 64 (R16)
MOVZ	R16, R2, R0
ADDIU	R2, R25, 2
LH	R2, 0(R2)
SEH	R4, R2
JAL	__SignedIntegralToFloat+0
NOP	
; r start address is: 36 (R9)
MOVZ	R9, R2, R0
ADDIU	R2, R25, 4
LH	R2, 0(R2)
SEH	R4, R2
JAL	__SignedIntegralToFloat+0
NOP	
; g start address is: 68 (R17)
MOVZ	R17, R2, R0
ADDIU	R2, R25, 6
LH	R2, 0(R2)
SEH	R4, R2
JAL	__SignedIntegralToFloat+0
NOP	
; b start address is: 72 (R18)
MOVZ	R18, R2, R0
MOVZ	R6, R16, R0
MOVZ	R4, R9, R0
JAL	__Div_FP+0
NOP	
; r end address is: 36 (R9)
LUI	R4, 17279
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
MOVZ	R3, R26, R0
SW	R3, 8(SP)
MOVZ	R25, R2, R0
JAL	_fabs+0
NOP	
LW	R3, 8(SP)
SW	R2, 0(R3)
MOVZ	R6, R16, R0
MOVZ	R4, R17, R0
JAL	__Div_FP+0
NOP	
; g end address is: 68 (R17)
LUI	R4, 17279
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
ADDIU	R3, R26, 4
SW	R3, 8(SP)
MOVZ	R25, R2, R0
JAL	_fabs+0
NOP	
LW	R3, 8(SP)
SW	R2, 0(R3)
MOVZ	R6, R16, R0
MOVZ	R4, R18, R0
JAL	__Div_FP+0
NOP	
; c end address is: 64 (R16)
; b end address is: 72 (R18)
LUI	R4, 17279
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
ADDIU	R3, R26, 8
SW	R3, 8(SP)
MOVZ	R25, R2, R0
JAL	_fabs+0
NOP	
LW	R3, 8(SP)
SW	R2, 0(R3)
L_end_GetScaledValues:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _GetScaledValues
_TCS3472_CalcHue:
ADDIU	SP, SP, -20
SW	RA, 0(SP)
LW	R2, 0(R25)
; rR start address is: 64 (R16)
MOVZ	R16, R2, R0
ADDIU	R2, R25, 4
LW	R2, 0(R2)
; gG start address is: 68 (R17)
MOVZ	R17, R2, R0
ADDIU	R2, R25, 8
LW	R2, 0(R2)
; bB start address is: 72 (R18)
MOVZ	R18, R2, R0
JAL	_max_+0
NOP	
; maxF start address is: 44 (R11)
MOVZ	R11, R2, R0
JAL	_min_+0
NOP	
; minF start address is: 12 (R3)
MOVZ	R3, R2, R0
MOVZ	R4, R11, R0
MOVZ	R6, R2, R0
JAL	__Compare_FP+0
NOP	
SLTIU	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue116
NOP	
J	L_TCS3472_CalcHue26
NOP	
L__TCS3472_CalcHue116:
; ?FLOC___TCS3472_CalcHue?T211 start address is: 8 (R2)
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___TCS3472_CalcHue?T211 end address is: 8 (R2)
J	L_TCS3472_CalcHue27
NOP	
L_TCS3472_CalcHue26:
; ?FLOC___TCS3472_CalcHue?T211 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___TCS3472_CalcHue?T211 end address is: 8 (R2)
L_TCS3472_CalcHue27:
; ?FLOC___TCS3472_CalcHue?T211 start address is: 8 (R2)
MOVZ	R4, R11, R0
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; maxF end address is: 44 (R11)
; ?FLOC___TCS3472_CalcHue?T211 end address is: 8 (R2)
; maxF start address is: 76 (R19)
MOVZ	R19, R2, R0
MOVZ	R6, R17, R0
MOVZ	R4, R16, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
XORI	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue119
NOP	
J	L__TCS3472_CalcHue69
NOP	
L__TCS3472_CalcHue119:
MOVZ	R6, R18, R0
MOVZ	R4, R16, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
XORI	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue122
NOP	
J	L__TCS3472_CalcHue68
NOP	
L__TCS3472_CalcHue122:
; rR end address is: 64 (R16)
L__TCS3472_CalcHue67:
MOVZ	R4, R17, R0
MOVZ	R6, R18, R0
JAL	__Compare_FP+0
NOP	
SLTIU	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue125
NOP	
J	L_TCS3472_CalcHue31
NOP	
L__TCS3472_CalcHue125:
; ?FLOC___TCS3472_CalcHue?T217 start address is: 8 (R2)
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___TCS3472_CalcHue?T217 end address is: 8 (R2)
J	L_TCS3472_CalcHue32
NOP	
L_TCS3472_CalcHue31:
; ?FLOC___TCS3472_CalcHue?T217 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___TCS3472_CalcHue?T217 end address is: 8 (R2)
L_TCS3472_CalcHue32:
; ?FLOC___TCS3472_CalcHue?T217 start address is: 8 (R2)
MOVZ	R4, R17, R0
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; gG end address is: 68 (R17)
; ?FLOC___TCS3472_CalcHue?T217 end address is: 8 (R2)
MOVZ	R6, R18, R0
MOVZ	R4, R2, R0
JAL	__Sub_FP+0
NOP	
; bB end address is: 72 (R18)
SW	R2, 16(SP)
MOVZ	R6, R3, R0
MOVZ	R4, R19, R0
JAL	__Sub_FP+0
NOP	
; minF end address is: 12 (R3)
; maxF end address is: 76 (R19)
LW	R4, 16(SP)
MOVZ	R6, R2, R0
JAL	__Div_FP+0
NOP	
LUI	R4, 17008
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
J	L_TCS3472_CalcHue33
NOP	
L__TCS3472_CalcHue69:
; maxF start address is: 76 (R19)
; minF start address is: 12 (R3)
; bB start address is: 72 (R18)
; gG start address is: 68 (R17)
; rR start address is: 64 (R16)
L__TCS3472_CalcHue68:
MOVZ	R6, R16, R0
MOVZ	R4, R17, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
XORI	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue128
NOP	
J	L__TCS3472_CalcHue71
NOP	
L__TCS3472_CalcHue128:
MOVZ	R6, R18, R0
MOVZ	R4, R17, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
XORI	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue131
NOP	
J	L__TCS3472_CalcHue70
NOP	
L__TCS3472_CalcHue131:
; gG end address is: 68 (R17)
L__TCS3472_CalcHue66:
MOVZ	R4, R16, R0
MOVZ	R6, R18, R0
JAL	__Compare_FP+0
NOP	
SLTIU	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue134
NOP	
J	L_TCS3472_CalcHue37
NOP	
L__TCS3472_CalcHue134:
; ?FLOC___TCS3472_CalcHue?T227 start address is: 8 (R2)
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___TCS3472_CalcHue?T227 end address is: 8 (R2)
J	L_TCS3472_CalcHue38
NOP	
L_TCS3472_CalcHue37:
; ?FLOC___TCS3472_CalcHue?T227 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___TCS3472_CalcHue?T227 end address is: 8 (R2)
L_TCS3472_CalcHue38:
; ?FLOC___TCS3472_CalcHue?T227 start address is: 8 (R2)
MOVZ	R4, R18, R0
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; bB end address is: 72 (R18)
; ?FLOC___TCS3472_CalcHue?T227 end address is: 8 (R2)
MOVZ	R6, R16, R0
MOVZ	R4, R2, R0
JAL	__Sub_FP+0
NOP	
; rR end address is: 64 (R16)
SW	R2, 16(SP)
MOVZ	R6, R3, R0
MOVZ	R4, R19, R0
JAL	__Sub_FP+0
NOP	
; minF end address is: 12 (R3)
; maxF end address is: 76 (R19)
LW	R4, 16(SP)
MOVZ	R6, R2, R0
JAL	__Div_FP+0
NOP	
LUI	R4, 16384
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
LUI	R4, 17008
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
J	L_TCS3472_CalcHue39
NOP	
L__TCS3472_CalcHue71:
; maxF start address is: 76 (R19)
; minF start address is: 12 (R3)
; bB start address is: 72 (R18)
; gG start address is: 68 (R17)
; rR start address is: 64 (R16)
L__TCS3472_CalcHue70:
MOVZ	R6, R16, R0
MOVZ	R4, R18, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
XORI	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue137
NOP	
J	L__TCS3472_CalcHue73
NOP	
L__TCS3472_CalcHue137:
MOVZ	R6, R17, R0
MOVZ	R4, R18, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
XORI	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue140
NOP	
J	L__TCS3472_CalcHue72
NOP	
L__TCS3472_CalcHue140:
L__TCS3472_CalcHue65:
MOVZ	R4, R16, R0
MOVZ	R6, R18, R0
JAL	__Compare_FP+0
NOP	
SLTIU	R2, R2, 1
; bB end address is: 72 (R18)
BNE	R2, R0, L__TCS3472_CalcHue143
NOP	
J	L_TCS3472_CalcHue43
NOP	
L__TCS3472_CalcHue143:
; ?FLOC___TCS3472_CalcHue?T238 start address is: 8 (R2)
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___TCS3472_CalcHue?T238 end address is: 8 (R2)
J	L_TCS3472_CalcHue44
NOP	
L_TCS3472_CalcHue43:
; ?FLOC___TCS3472_CalcHue?T238 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___TCS3472_CalcHue?T238 end address is: 8 (R2)
L_TCS3472_CalcHue44:
; ?FLOC___TCS3472_CalcHue?T238 start address is: 8 (R2)
MOVZ	R4, R16, R0
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; rR end address is: 64 (R16)
; ?FLOC___TCS3472_CalcHue?T238 end address is: 8 (R2)
MOVZ	R6, R17, R0
MOVZ	R4, R2, R0
JAL	__Sub_FP+0
NOP	
; gG end address is: 68 (R17)
SW	R2, 16(SP)
MOVZ	R6, R3, R0
MOVZ	R4, R19, R0
JAL	__Sub_FP+0
NOP	
; minF end address is: 12 (R3)
; maxF end address is: 76 (R19)
LW	R4, 16(SP)
MOVZ	R6, R2, R0
JAL	__Div_FP+0
NOP	
LUI	R4, 16512
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
LUI	R4, 17008
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
L__TCS3472_CalcHue73:
L__TCS3472_CalcHue72:
L_TCS3472_CalcHue39:
L_TCS3472_CalcHue33:
LW	R6, 12(SP)
MOVZ	R4, R0, R0
JAL	__Compare_FP+0
NOP	
SLT	R2, R0, R2
BNE	R2, R0, L__TCS3472_CalcHue146
NOP	
J	L_TCS3472_CalcHue45
NOP	
L__TCS3472_CalcHue146:
; ?FLOC___TCS3472_CalcHue?T246 start address is: 8 (R2)
LUI	R2, 17332
ORI	R2, R2, 0
; ?FLOC___TCS3472_CalcHue?T246 end address is: 8 (R2)
J	L_TCS3472_CalcHue46
NOP	
L_TCS3472_CalcHue45:
; ?FLOC___TCS3472_CalcHue?T246 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___TCS3472_CalcHue?T246 end address is: 8 (R2)
L_TCS3472_CalcHue46:
; ?FLOC___TCS3472_CalcHue?T246 start address is: 8 (R2)
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; ?FLOC___TCS3472_CalcHue?T246 end address is: 8 (R2)
L_end_TCS3472_CalcHue:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _TCS3472_CalcHue
_max_:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
LW	R2, 0(R25)
; temp1 start address is: 40 (R10)
MOVZ	R10, R2, R0
; i start address is: 12 (R3)
ORI	R3, R0, 1
; temp1 end address is: 40 (R10)
; i end address is: 12 (R3)
L_max_47:
; i start address is: 12 (R3)
; temp1 start address is: 40 (R10)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L__max_148
NOP	
J	L_max_48
NOP	
L__max_148:
SEH	R2, R3
SLL	R2, R2, 2
ADDU	R2, R25, R2
LW	R4, 0(R2)
MOVZ	R6, R10, R0
JAL	__Compare_FP+0
NOP	
SLT	R2, R0, R2
BNE	R2, R0, L__max_151
NOP	
J	L__max_63
NOP	
L__max_151:
; temp1 end address is: 40 (R10)
SEH	R2, R3
SLL	R2, R2, 2
ADDU	R2, R25, R2
LW	R2, 0(R2)
; temp1 start address is: 16 (R4)
MOVZ	R4, R2, R0
; temp1 end address is: 16 (R4)
MOVZ	R10, R4, R0
J	L_max_50
NOP	
L__max_63:
L_max_50:
; temp1 start address is: 40 (R10)
ADDIU	R2, R3, 1
SEH	R3, R2
; i end address is: 12 (R3)
J	L_max_47
NOP	
L_max_48:
MOVZ	R2, R10, R0
; temp1 end address is: 40 (R10)
L_end_max_:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _max_
_min_:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
LW	R2, 0(R25)
; temp1 start address is: 40 (R10)
MOVZ	R10, R2, R0
; i start address is: 12 (R3)
ORI	R3, R0, 1
; temp1 end address is: 40 (R10)
; i end address is: 12 (R3)
L_min_51:
; i start address is: 12 (R3)
; temp1 start address is: 40 (R10)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L__min_153
NOP	
J	L_min_52
NOP	
L__min_153:
SEH	R2, R3
SLL	R2, R2, 2
ADDU	R2, R25, R2
LW	R4, 0(R2)
MOVZ	R6, R10, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
BNE	R2, R0, L__min_156
NOP	
J	L__min_64
NOP	
L__min_156:
; temp1 end address is: 40 (R10)
SEH	R2, R3
SLL	R2, R2, 2
ADDU	R2, R25, R2
LW	R2, 0(R2)
; temp1 start address is: 16 (R4)
MOVZ	R4, R2, R0
; temp1 end address is: 16 (R4)
MOVZ	R10, R4, R0
J	L_min_54
NOP	
L__min_64:
L_min_54:
; temp1 start address is: 40 (R10)
ADDIU	R2, R3, 1
SEH	R3, R2
; i end address is: 12 (R3)
J	L_min_51
NOP	
L_min_52:
MOVZ	R2, R10, R0
; temp1 end address is: 40 (R10)
L_end_min_:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _min_
