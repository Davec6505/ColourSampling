_InitGSM3:
ADDIU	SP, SP, -16
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R0, Offset(_SimVars+0)(GP)
SB	R0, Offset(_SimVars+1)(GP)
ORI	R2, R0, lo_addr(?lstr_1_Sim800+0)
ANDI	R2, R2, 255
SB	R2, Offset(_SimTestTxt+0)(GP)
SH	R0, Offset(_RB+1002)(GP)
SH	R0, Offset(_RB+1004)(GP)
ORI	R2, R0, 255
SB	R2, Offset(_RB+0)(GP)
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_memset+0
NOP	
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_memset+0
NOP	
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_memset+0
NOP	
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_memset+0
NOP	
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_memset+0
NOP	
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+118)
ORI	R25, R25, lo_addr(_SF+118)
JAL	_memset+0
NOP	
L_end_InitGSM3:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _InitGSM3
_PwrUpGSM3:
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM30
NOP	
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
L_PwrUpGSM32:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrUpGSM3298
NOP	
J	L_PwrUpGSM33
NOP	
L__PwrUpGSM3298:
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM34
NOP	
J	L_PwrUpGSM32
NOP	
L_PwrUpGSM33:
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM36
NOP	
NOP	
NOP	
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_WriteToFlashTemp:
ADDIU	SP, SP, -20
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_GetStrLengths+0
NOP	
ORI	R27, R0, 512
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_buff+0)
ORI	R25, R25, lo_addr(_buff+0)
JAL	_memset+0
NOP	
LH	R27, Offset(_SL+0)(GP)
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
LUI	R25, hi_addr(_buff+0)
ORI	R25, R25, lo_addr(_buff+0)
JAL	_memcpy+0
NOP	
LH	R3, Offset(_SL+0)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+2)(GP)
LUI	R26, hi_addr(_SF+58)
ORI	R26, R26, lo_addr(_SF+58)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
LH	R3, Offset(_SL+18)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+4)(GP)
LUI	R26, hi_addr(_SF+78)
ORI	R26, R26, lo_addr(_SF+78)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
LH	R3, Offset(_SL+20)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+6)(GP)
LUI	R26, hi_addr(_SF+98)
ORI	R26, R26, lo_addr(_SF+98)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
LH	R3, Offset(_SL+22)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+8)(GP)
LUI	R26, hi_addr(_SF+118)
ORI	R26, R26, lo_addr(_SF+118)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
LH	R2, Offset(_SL+14)(GP)
ADDIU	R2, R2, 4
SEH	R27, R2
LUI	R26, hi_addr(_buff+0)
ORI	R26, R26, lo_addr(_buff+0)
LUI	R25, hi_addr(_temp+0)
ORI	R25, R25, lo_addr(_temp+0)
JAL	_memcpy+0
NOP	
; pos start address is: 12 (R3)
LW	R3, Offset(_FLASH_Settings_PAddr+0)(GP)
SW	R3, 16(SP)
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R3, 16(SP)
SH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
SEH	R2, R2
BEQ	R2, R0, L__WriteToFlashTemp300
NOP	
J	L_WriteToFlashTemp8
NOP	
L__WriteToFlashTemp300:
ADDIU	R2, R3, 20
; pos end address is: 12 (R3)
; pos start address is: 16 (R4)
MOVZ	R4, R2, R0
SH	R0, Offset(WriteToFlashTemp_i_L0+0)(GP)
; pos end address is: 16 (R4)
L_WriteToFlashTemp9:
; pos start address is: 16 (R4)
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLTI	R2, R2, 100
BNE	R2, R0, L__WriteToFlashTemp301
NOP	
J	L_WriteToFlashTemp10
NOP	
L__WriteToFlashTemp301:
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_temp+0)
ORI	R2, R2, lo_addr(_temp+0)
ADDU	R2, R2, R3
SW	R4, 16(SP)
LW	R26, 0(R2)
MOVZ	R25, R4, R0
JAL	_NVMWriteWord+0
NOP	
LW	R4, 16(SP)
SH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
LUI	R24, 2
ORI	R24, R24, 2260
L_WriteToFlashTemp12:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WriteToFlashTemp12
NOP	
NOP	
NOP	
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
; pos end address is: 16 (R4)
J	L_WriteToFlashTemp9
NOP	
L_WriteToFlashTemp10:
L_WriteToFlashTemp8:
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_2_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_2_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_3_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_4_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
L_end_WriteToFlashTemp:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _WriteToFlashTemp
_GetValuesFromFlash:
ADDIU	SP, SP, -16
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_GetStrLengths+0
NOP	
LW	R2, Offset(_FLASH_Settings_VAddr+0)(GP)
ADDIU	R2, R2, 20
; ptr start address is: 16 (R4)
MOVZ	R4, R2, R0
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_GetValuesFromFlash14:
; i start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
LH	R2, Offset(_SL+14)(GP)
SLTU	R2, R5, R2
BNE	R2, R0, L__GetValuesFromFlash303
NOP	
J	L_GetValuesFromFlash15
NOP	
L__GetValuesFromFlash303:
; ptr end address is: 16 (R4)
; ptr start address is: 16 (R4)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R3, R2, R5
ADDU	R2, R4, R5
LBU	R2, 0(R2)
SB	R2, 0(R3)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R5
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
; ptr end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_GetValuesFromFlash14
NOP	
L_GetValuesFromFlash15:
LH	R27, Offset(_SL+0)(GP)
LUI	R26, hi_addr(_buff+0)
ORI	R26, R26, lo_addr(_buff+0)
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_strncpy+0
NOP	
LH	R3, Offset(_SL+0)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+2)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_strncpy+0
NOP	
LH	R3, Offset(_SL+18)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+4)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_strncpy+0
NOP	
LH	R3, Offset(_SL+20)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+6)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_strncpy+0
NOP	
LH	R3, Offset(_SL+22)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+8)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+118)
ORI	R25, R25, lo_addr(_SF+118)
JAL	_strncpy+0
NOP	
LUI	R2, hi_addr(_SF+118)
ORI	R2, R2, lo_addr(_SF+118)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LUI	R2, hi_addr(_SF+98)
ORI	R2, R2, lo_addr(_SF+98)
SW	R2, 20(SP)
LUI	R2, hi_addr(_SF+78)
ORI	R2, R2, lo_addr(_SF+78)
SW	R2, 16(SP)
LUI	R2, hi_addr(_SF+58)
ORI	R2, R2, lo_addr(_SF+58)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_5_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 28
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
L_end_GetValuesFromFlash:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _GetValuesFromFlash
_GetStrLengths:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
ORI	R2, R0, 19
SH	R2, Offset(_SL+0)(GP)
ORI	R2, R0, 19
SH	R2, Offset(_SL+2)(GP)
ORI	R2, R0, 19
SH	R2, Offset(_SL+4)(GP)
ORI	R2, R0, 19
SH	R2, Offset(_SL+6)(GP)
ORI	R2, R0, 19
SH	R2, Offset(_SL+8)(GP)
ORI	R2, R0, 95
SH	R2, Offset(_SL+14)(GP)
ORI	R2, R0, 38
SH	R2, Offset(_SL+18)(GP)
ORI	R2, R0, 57
SH	R2, Offset(_SL+20)(GP)
ORI	R2, R0, 76
SH	R2, Offset(_SL+22)(GP)
ORI	R2, R0, 3
SH	R2, Offset(_SL+16)(GP)
ORI	R2, R0, 1
SH	R2, Offset(_SL+16)(GP)
ORI	R2, R0, 96
SH	R2, Offset(_SL+14)(GP)
ORI	R2, R0, 19
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_6_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_6_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LH	R2, Offset(_SL+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_7_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LH	R2, Offset(_SL+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_8_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_8_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_c+0)
ORI	R2, R2, lo_addr(_c+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LH	R2, Offset(_SL+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_9_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_9_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_d+0)
ORI	R2, R2, lo_addr(_d+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LH	R2, Offset(_SL+8)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_10_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_10_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_e+0)
ORI	R2, R2, lo_addr(_e+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LH	R2, Offset(_SL+14)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_11_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_11_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_f+0)
ORI	R2, R2, lo_addr(_f+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R2, hi_addr(_f+0)
ORI	R2, R2, lo_addr(_f+0)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
LUI	R2, hi_addr(_e+0)
ORI	R2, R2, lo_addr(_e+0)
SW	R2, 24(SP)
LUI	R2, hi_addr(_d+0)
ORI	R2, R2, lo_addr(_d+0)
SW	R2, 20(SP)
LUI	R2, hi_addr(_c+0)
ORI	R2, R2, lo_addr(_c+0)
SW	R2, 16(SP)
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_12_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_12_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
L_end_GetStrLengths:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _GetStrLengths
_RcvSimTxt:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
L_RcvSimTxt17:
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__RcvSimTxt307
NOP	
J	L_RcvSimTxt18
NOP	
L__RcvSimTxt307:
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__RcvSimTxt308
NOP	
J	L__RcvSimTxt255
NOP	
L__RcvSimTxt308:
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__RcvSimTxt309
NOP	
J	L__RcvSimTxt254
NOP	
L__RcvSimTxt309:
J	L_RcvSimTxt21
NOP	
L__RcvSimTxt255:
L__RcvSimTxt254:
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BNE	R2, R0, L__RcvSimTxt311
NOP	
J	L_RcvSimTxt22
NOP	
L__RcvSimTxt311:
ORI	R2, R0, 4
SW	R2, Offset(U2STAbits+4)(GP)
J	___RcvSimTxt_m0
NOP	
L_RcvSimTxt22:
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__RcvSimTxt313
NOP	
J	L_RcvSimTxt23
NOP	
L__RcvSimTxt313:
ORI	R2, R0, 2
SW	R2, Offset(U2STAbits+4)(GP)
L_RcvSimTxt23:
L_RcvSimTxt21:
___RcvSimTxt_m0:
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt314
NOP	
J	L_RcvSimTxt24
NOP	
L__RcvSimTxt314:
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
SB	R4, 0(R2)
; txt end address is: 16 (R4)
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
J	L_RcvSimTxt25
NOP	
L_RcvSimTxt24:
LW	R3, Offset(U2RXREG+0)(GP)
ORI	R2, R0, 10
BEQ	R3, R2, L__RcvSimTxt315
NOP	
J	L_RcvSimTxt26
NOP	
L__RcvSimTxt315:
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
ORI	R2, R0, 44
SB	R2, 0(R3)
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
L_RcvSimTxt26:
L_RcvSimTxt25:
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RcvSimTxt316
NOP	
J	L_RcvSimTxt27
NOP	
L__RcvSimTxt316:
SH	R0, Offset(_RB+1002)(GP)
L_RcvSimTxt27:
J	L_RcvSimTxt17
NOP	
L_RcvSimTxt18:
ORI	R2, R0, 1
SB	R2, Offset(_RB+0)(GP)
L_end_RcvSimTxt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RcvSimTxt
_TestRingPointers:
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__TestRingPointers318
NOP	
J	L_TestRingPointers28
NOP	
L__TestRingPointers318:
LHU	R3, Offset(_RB+1004)(GP)
ORI	R2, R0, 1000
SUBU	R3, R2, R3
LHU	R2, Offset(_RB+1002)(GP)
ADDU	R2, R3, R2
; diff start address is: 8 (R2)
; diff end address is: 8 (R2)
J	L_TestRingPointers29
NOP	
L_TestRingPointers28:
LHU	R3, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SUBU	R2, R2, R3
; diff start address is: 12 (R3)
ANDI	R3, R2, 65535
; diff end address is: 12 (R3)
SEH	R2, R3
L_TestRingPointers29:
; diff start address is: 8 (R2)
; diff end address is: 8 (R2)
L_end_TestRingPointers:
JR	RA
NOP	
; end of _TestRingPointers
_WaitForResponse:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
; lastMillis start address is: 20 (R5)
LW	R5, Offset(_TMR0+0)(GP)
SB	R0, Offset(_RB+0)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
J	L_WaitForResponse30
NOP	
L__WaitForResponse256:
L_WaitForResponse30:
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
SEB	R2, R25
BEQ	R2, R0, L__WaitForResponse320
NOP	
J	L_WaitForResponse33
NOP	
L__WaitForResponse320:
; lastMillis end address is: 20 (R5)
; lastMillis start address is: 20 (R5)
LUI	R24, 40
ORI	R24, R24, 45226
L_WaitForResponse34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse34
NOP	
J	L_WaitForResponse36
NOP	
L_WaitForResponse33:
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForResponse321
NOP	
J	L_WaitForResponse37
NOP	
L__WaitForResponse321:
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForResponse38:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse38
NOP	
NOP	
NOP	
J	L_WaitForResponse40
NOP	
L_WaitForResponse37:
SEB	R3, R25
ORI	R2, R0, 3
BEQ	R3, R2, L__WaitForResponse322
NOP	
J	L_WaitForResponse41
NOP	
L__WaitForResponse322:
ORI	R30, R0, 65
SB	R30, 5(SP)
ORI	R30, R0, 84
SB	R30, 6(SP)
ORI	R30, R0, 69
SB	R30, 7(SP)
ORI	R30, R0, 48
SB	R30, 8(SP)
MOVZ	R30, R0, R0
SB	R30, 9(SP)
ADDIU	R2, SP, 5
SB	R25, 4(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LB	R25, 4(SP)
LUI	R24, 813
ORI	R24, R24, 52564
L_WaitForResponse42:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse42
NOP	
NOP	
NOP	
J	L_WaitForResponse44
NOP	
L_WaitForResponse41:
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse45:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse45
NOP	
L_WaitForResponse44:
L_WaitForResponse40:
L_WaitForResponse36:
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R3, R2, R5
ORI	R2, R0, 59000
SLTU	R2, R2, R3
BNE	R2, R0, L__WaitForResponse323
NOP	
J	L_WaitForResponse47
NOP	
L__WaitForResponse323:
; lastMillis end address is: 20 (R5)
J	L_WaitForResponse31
NOP	
L_WaitForResponse47:
; lastMillis start address is: 20 (R5)
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForResponse325
NOP	
J	L__WaitForResponse256
NOP	
L__WaitForResponse325:
; lastMillis end address is: 20 (R5)
L_WaitForResponse31:
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
L_end_WaitForResponse:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WaitForResponse
_RingToTempBuf:
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
; i end address is: 20 (R5)
L_RingToTempBuf48:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
BNE	R2, R3, L__RingToTempBuf328
NOP	
J	L_RingToTempBuf49
NOP	
L__RingToTempBuf328:
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__RingToTempBuf329
NOP	
J	L__RingToTempBuf259
NOP	
L__RingToTempBuf329:
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 151
BEQ	R2, R0, L__RingToTempBuf330
NOP	
J	L__RingToTempBuf258
NOP	
L__RingToTempBuf330:
L__RingToTempBuf257:
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1004)(GP)
L__RingToTempBuf259:
L__RingToTempBuf258:
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R4, R2, R3
LHU	R3, Offset(_RB+1004)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
ADDIU	R2, R5, 1
SEH	R5, R2
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RingToTempBuf331
NOP	
J	L_RingToTempBuf53
NOP	
L__RingToTempBuf331:
SH	R0, Offset(_RB+1004)(GP)
L_RingToTempBuf53:
J	L_RingToTempBuf48
NOP	
L_RingToTempBuf49:
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
L_end_RingToTempBuf:
JR	RA
NOP	
; end of _RingToTempBuf
_SetupIOT:
ADDIU	SP, SP, -24
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(?lstr_14_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_14_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT54:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT54
NOP	
JAL	_RingToTempBuf+0
NOP	
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_15_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_15_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
___SetupIOT_wait:
ADDIU	R23, SP, 12
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr16_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr16_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT56:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT56
NOP	
NOP	
NOP	
JAL	_RingToTempBuf+0
NOP	
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_17_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_17_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT333
NOP	
J	L_SetupIOT58
NOP	
L__SetupIOT333:
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_18_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_18_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_19_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_19_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT334
NOP	
J	L_SetupIOT59
NOP	
L__SetupIOT334:
ADDIU	SP, SP, -12
SH	R4, 8(SP)
; res end address is: 16 (R4)
LUI	R2, hi_addr(?lstr_20_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_20_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_21_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_21_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
J	L_SetupIOT60
NOP	
L_SetupIOT59:
LUI	R2, hi_addr(?lstr_22_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_22_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT61:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT61
NOP	
NOP	
NOP	
J	___SetupIOT_wait
NOP	
L_SetupIOT60:
L_SetupIOT58:
LUI	R2, hi_addr(?lstr_23_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_23_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
ORI	R2, R0, 1
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
ADDIU	SP, SP, -40
SW	RA, 0(SP)
SW	R26, 4(SP)
SW	R27, 8(SP)
ADDIU	R23, SP, 16
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr24_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr24_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 16
SH	R25, 12(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
JAL	_RingToTempBuf+0
NOP	
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS63:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS63
NOP	
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS65:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS65
NOP	
JAL	_RingToTempBuf+0
NOP	
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 84 (R21)
SEH	R21, R2
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_25_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_25_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
; num_strs end address is: 84 (R21)
ADDIU	SP, SP, -12
SH	R21, 8(SP)
LUI	R2, hi_addr(?lstr_26_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_26_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_27_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_27_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 14(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_28_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_28_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_29_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_29_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R23, SP, 26
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr30_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr30_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 26
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS67:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS67
NOP	
JAL	_RingToTempBuf+0
NOP	
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_31_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_31_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R2, hi_addr(_string+512)
ORI	R2, R2, lo_addr(_string+512)
ADDIU	SP, SP, -48
SW	R2, 44(SP)
LUI	R2, hi_addr(_string+448)
ORI	R2, R2, lo_addr(_string+448)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 36(SP)
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_32_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_32_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 48
LHU	R25, 12(SP)
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS336
NOP	
J	L_WaitForSetupSMS69
NOP	
L__WaitForSetupSMS336:
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 11
SEH	R27, R2
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_strncpy+0
NOP	
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+192)
ORI	R26, R26, lo_addr(_string+192)
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strncpy+0
NOP	
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+9)
ORI	R25, R25, lo_addr(_SF+9)
JAL	_strncpy+0
NOP	
LUI	R2, hi_addr(_SF+9)
ORI	R2, R2, lo_addr(_SF+9)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
LUI	R2, hi_addr(_SF+0)
ORI	R2, R2, lo_addr(_SF+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_33_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_33_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
J	L_WaitForSetupSMS70
NOP	
L_WaitForSetupSMS69:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS337
NOP	
J	L_WaitForSetupSMS71
NOP	
L__WaitForSetupSMS337:
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_strncpy+0
NOP	
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+384)
ORI	R26, R26, lo_addr(_string+384)
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_strncpy+0
NOP	
LUI	R25, hi_addr(_string+448)
ORI	R25, R25, lo_addr(_string+448)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+448)
ORI	R26, R26, lo_addr(_string+448)
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_strncpy+0
NOP	
LUI	R25, hi_addr(_string+512)
ORI	R25, R25, lo_addr(_string+512)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+512)
ORI	R26, R26, lo_addr(_string+512)
LUI	R25, hi_addr(_SF+118)
ORI	R25, R25, lo_addr(_SF+118)
JAL	_strncpy+0
NOP	
LUI	R2, hi_addr(_SF+118)
ORI	R2, R2, lo_addr(_SF+118)
ADDIU	SP, SP, -24
SW	R2, 20(SP)
LUI	R2, hi_addr(_SF+98)
ORI	R2, R2, lo_addr(_SF+98)
SW	R2, 16(SP)
LUI	R2, hi_addr(_SF+78)
ORI	R2, R2, lo_addr(_SF+78)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+58)
ORI	R2, R2, lo_addr(_SF+58)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_34_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_34_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 24
LHU	R25, 12(SP)
L_WaitForSetupSMS71:
L_WaitForSetupSMS70:
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS72:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS72
NOP	
NOP	
NOP	
SH	R25, 12(SP)
LH	R25, 14(SP)
JAL	_RemoveSMSText+0
NOP	
ORI	R30, R0, 79
SB	R30, 35(SP)
ORI	R30, R0, 75
SB	R30, 36(SP)
ORI	R30, R0, 44
SB	R30, 37(SP)
MOVZ	R30, R0, R0
SB	R30, 38(SP)
ADDIU	R2, SP, 35
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strcmp+0
NOP	
SH	R2, 14(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_36_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_36_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_37_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_37_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LHU	R25, 12(SP)
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS338
NOP	
J	L__WaitForSetupSMS263
NOP	
L__WaitForSetupSMS338:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS339
NOP	
J	L__WaitForSetupSMS262
NOP	
L__WaitForSetupSMS339:
L__WaitForSetupSMS261:
JAL	_WriteToFlashTemp+0
NOP	
ORI	R2, R0, 3
J	L_end_WaitForSetupSMS
NOP	
L__WaitForSetupSMS263:
L__WaitForSetupSMS262:
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS340
NOP	
J	L__WaitForSetupSMS265
NOP	
L__WaitForSetupSMS340:
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS341
NOP	
J	L__WaitForSetupSMS264
NOP	
L__WaitForSetupSMS341:
L__WaitForSetupSMS260:
ORI	R2, R0, 2
J	L_end_WaitForSetupSMS
NOP	
L__WaitForSetupSMS265:
L__WaitForSetupSMS264:
LH	R2, 14(SP)
L_end_WaitForSetupSMS:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _WaitForSetupSMS
_AT_Initial:
ADDIU	SP, SP, -28
SW	RA, 0(SP)
SW	R25, 4(SP)
ADDIU	R23, SP, 8
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr38_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr38_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LUI	R24, 406
ORI	R24, R24, 59050
L_AT_Initial82:
ADDIU	R24, R24, -1
BNE	R24, R0, L_AT_Initial82
NOP	
JAL	_RingToTempBuf+0
NOP	
L_end_AT_Initial:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _AT_Initial
_GetAPI_Key_SMS:
ADDIU	SP, SP, -80
SW	RA, 0(SP)
SW	R25, 4(SP)
ADDIU	R23, SP, 8
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr39_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr39_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
JAL	_RingToTempBuf+0
NOP	
LUI	R24, 203
ORI	R24, R24, 29524
L_GetAPI_Key_SMS84:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetAPI_Key_SMS84
NOP	
NOP	
NOP	
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_40_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_40_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R23, SP, 17
ADDIU	R22, R23, 63
LUI	R24, hi_addr(?ICS?lstr41_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr41_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 1
JAL	_WaitForSetupSMS+0
NOP	
L_end_GetAPI_Key_SMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _GetAPI_Key_SMS
_SendSMS:
ADDIU	SP, SP, -500
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R25, 16(SP)
ORI	R25, R0, 400
JAL	_Malloc+0
NOP	
LBU	R25, 16(SP)
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
BEQ	R26, R0, L__SendSMS345
NOP	
J	L_SendSMS86
NOP	
L__SendSMS345:
ADDIU	R2, SP, 81
SB	R25, 16(SP)
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LBU	R25, 16(SP)
J	L_SendSMS87
NOP	
L_SendSMS86:
ADDIU	R2, SP, 81
SB	R25, 16(SP)
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LBU	R25, 16(SP)
L_SendSMS87:
LB	R2, Offset(SendSMS_onecA_L0+0)(GP)
BEQ	R2, R0, L__SendSMS346
NOP	
J	L_SendSMS88
NOP	
L__SendSMS346:
ORI	R2, R0, 1
SB	R2, Offset(SendSMS_onecA_L0+0)(GP)
JAL	_AT_Initial+0
NOP	
L_SendSMS88:
ADDIU	R23, SP, 101
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr42_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr42_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 101
SB	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS89:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS89
NOP	
ADDIU	R23, SP, 111
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr43_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr43_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 111
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ADDIU	R2, SP, 81
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 16(SP)
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS91:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS91
NOP	
NOP	
NOP	
J	L_SendSMS93
NOP	
L_SendSMS95:
ADDIU	R23, SP, 120
ADDIU	R22, R23, 43
LUI	R24, hi_addr(?ICS?lstr44_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr44_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 120
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
L_SendSMS96:
ADDIU	R23, SP, 163
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr45_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr45_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 163
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
L_SendSMS97:
ADDIU	R23, SP, 177
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr46_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr46_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 177
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
L_SendSMS98:
ADDIU	R23, SP, 191
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr47_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr47_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 191
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
L_SendSMS99:
ADDIU	R23, SP, 207
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr48_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr48_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 207
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
L_SendSMS100:
ADDIU	R23, SP, 226
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr49_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr49_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 226
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS94
NOP	
L_SendSMS101:
JAL	_Read_Thresholds+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, R2, -4
ADDIU	R2, SP, 17
SEH	R27, R3
MOVZ	R26, R6, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS94
NOP	
L_SendSMS102:
MOVZ	R25, R0, R0
JAL	_Read_Send_AllColour+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 17
SEH	R27, R2
MOVZ	R26, R6, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS94
NOP	
L_SendSMS103:
ORI	R25, R0, 1
JAL	_Read_Send_AllColour+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 17
SEH	R27, R2
MOVZ	R26, R6, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
L_SendSMS104:
ADDIU	R23, SP, 244
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr50_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr50_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 244
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
L_SendSMS105:
ADDIU	R23, SP, 258
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr51_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr51_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 258
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
L_SendSMS106:
ADDIU	R23, SP, 272
ADDIU	R22, R23, 65
LUI	R24, hi_addr(?ICS?lstr52_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr52_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 272
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
L_SendSMS107:
ADDIU	R23, SP, 337
ADDIU	R22, R23, 26
LUI	R24, hi_addr(?ICS?lstr53_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr53_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 337
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
L_SendSMS108:
ADDIU	R23, SP, 363
ADDIU	R22, R23, 49
LUI	R24, hi_addr(?ICS?lstr54_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr54_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 363
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
L_SendSMS109:
ADDIU	R23, SP, 412
ADDIU	R22, R23, 30
LUI	R24, hi_addr(?ICS?lstr55_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr55_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 412
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
L_SendSMS110:
ADDIU	R23, SP, 442
ADDIU	R22, R23, 27
LUI	R24, hi_addr(?ICS?lstr56_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr56_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 442
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS94
NOP	
L_SendSMS111:
JAL	_ReadHUE+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 17
SEH	R27, R2
MOVZ	R26, R6, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
L_SendSMS112:
ADDIU	R23, SP, 469
ADDIU	R22, R23, 30
LUI	R24, hi_addr(?ICS?lstr57_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr57_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 469
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
L_SendSMS93:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS348
NOP	
J	L_SendSMS95
NOP	
L__SendSMS348:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS350
NOP	
J	L_SendSMS96
NOP	
L__SendSMS350:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS352
NOP	
J	L_SendSMS97
NOP	
L__SendSMS352:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__SendSMS354
NOP	
J	L_SendSMS98
NOP	
L__SendSMS354:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__SendSMS356
NOP	
J	L_SendSMS99
NOP	
L__SendSMS356:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__SendSMS358
NOP	
J	L_SendSMS100
NOP	
L__SendSMS358:
ANDI	R3, R25, 255
ORI	R2, R0, 6
BNE	R3, R2, L__SendSMS360
NOP	
J	L_SendSMS101
NOP	
L__SendSMS360:
ANDI	R3, R25, 255
ORI	R2, R0, 7
BNE	R3, R2, L__SendSMS362
NOP	
J	L_SendSMS102
NOP	
L__SendSMS362:
ANDI	R3, R25, 255
ORI	R2, R0, 8
BNE	R3, R2, L__SendSMS364
NOP	
J	L_SendSMS103
NOP	
L__SendSMS364:
ANDI	R3, R25, 255
ORI	R2, R0, 9
BNE	R3, R2, L__SendSMS366
NOP	
J	L_SendSMS104
NOP	
L__SendSMS366:
ANDI	R3, R25, 255
ORI	R2, R0, 10
BNE	R3, R2, L__SendSMS368
NOP	
J	L_SendSMS105
NOP	
L__SendSMS368:
ANDI	R3, R25, 255
ORI	R2, R0, 11
BNE	R3, R2, L__SendSMS370
NOP	
J	L_SendSMS106
NOP	
L__SendSMS370:
ANDI	R3, R25, 255
ORI	R2, R0, 12
BNE	R3, R2, L__SendSMS372
NOP	
J	L_SendSMS107
NOP	
L__SendSMS372:
ANDI	R3, R25, 255
ORI	R2, R0, 13
BNE	R3, R2, L__SendSMS374
NOP	
J	L_SendSMS108
NOP	
L__SendSMS374:
ANDI	R3, R25, 255
ORI	R2, R0, 14
BNE	R3, R2, L__SendSMS376
NOP	
J	L_SendSMS109
NOP	
L__SendSMS376:
ANDI	R3, R25, 255
ORI	R2, R0, 15
BNE	R3, R2, L__SendSMS378
NOP	
J	L_SendSMS110
NOP	
L__SendSMS378:
ANDI	R3, R25, 255
ORI	R2, R0, 16
BNE	R3, R2, L__SendSMS380
NOP	
J	L_SendSMS111
NOP	
L__SendSMS380:
J	L_SendSMS112
NOP	
; str_ end address is: 24 (R6)
L_SendSMS94:
; str_ start address is: 12 (R3)
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendSMS113:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS113
NOP	
NOP	
NOP	
ORI	R26, R0, 400
MOVZ	R25, R3, R0
; str_ end address is: 12 (R3)
JAL	_Free+0
NOP	
L_end_SendSMS:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 500
JR	RA
NOP	
; end of _SendSMS
_GetSMSText:
ADDIU	SP, SP, -40
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 20
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr58_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr58_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
JAL	_RingToTempBuf+0
NOP	
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 20 (R5)
SEH	R5, R2
ORI	R27, R0, 4
LUI	R26, hi_addr(_string+0)
ORI	R26, R26, lo_addr(_string+0)
LUI	R25, hi_addr(_sms_test+0)
ORI	R25, R25, lo_addr(_sms_test+0)
JAL	_strncmp+0
NOP	
SH	R2, 18(SP)
ADDIU	SP, SP, -12
SH	R5, 8(SP)
; num_strs end address is: 20 (R5)
LUI	R2, hi_addr(?lstr_59_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_59_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LH	R2, 18(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_60_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_60_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtB+0)
ORI	R2, R2, lo_addr(_txtB+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R2, hi_addr(_string+512)
ORI	R2, R2, lo_addr(_string+512)
ADDIU	SP, SP, -52
SW	R2, 48(SP)
LUI	R2, hi_addr(_string+448)
ORI	R2, R2, lo_addr(_string+448)
SW	R2, 44(SP)
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 36(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 28(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 20(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 16(SP)
LUI	R2, hi_addr(_txtB+0)
ORI	R2, R2, lo_addr(_txtB+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_61_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_61_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 52
LH	R2, 18(SP)
BEQ	R2, R0, L__GetSMSText382
NOP	
J	L_GetSMSText115
NOP	
L__GetSMSText382:
LBU	R25, Offset(_string+64)(GP)
JAL	_isdigit+0
NOP	
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__GetSMSText383
NOP	
J	L_GetSMSText116
NOP	
L__GetSMSText383:
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 16(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_62_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_62_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_63_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_63_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 16(SP)
JAL	_ReadMSG+0
NOP	
J	L_GetSMSText117
NOP	
L_GetSMSText116:
MOVZ	R26, R0, R0
ORI	R25, R0, 5
JAL	_SendSMS+0
NOP	
ORI	R2, R0, 1
SH	R2, 16(SP)
L_GetSMSText117:
LH	R25, 16(SP)
JAL	_RemoveSMSText+0
NOP	
J	L_end_GetSMSText
NOP	
L_GetSMSText115:
ORI	R2, R0, 255
L_end_GetSMSText:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _GetSMSText
_ReadMSG:
ADDIU	SP, SP, -44
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_64_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_64_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG118:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG118
NOP	
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_65_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_65_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R23, SP, 20
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr66_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr66_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
JAL	_RingToTempBuf+0
NOP	
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG120:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG120
NOP	
ADDIU	R23, SP, 30
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr67_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr67_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 30
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
JAL	_RingToTempBuf+0
NOP	
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG122:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG122
NOP	
LUI	R2, hi_addr(?lstr_68_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_68_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_ReadMSG124:
; i start address is: 20 (R5)
SH	R25, 16(SP)
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strlen+0
NOP	
LH	R25, 16(SP)
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__ReadMSG385
NOP	
J	L_ReadMSG125
NOP	
L__ReadMSG385:
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SW	R2, 40(SP)
SH	R25, 16(SP)
LBU	R25, 0(R2)
JAL	_toupper+0
NOP	
LH	R25, 16(SP)
LW	R3, 40(SP)
SB	R2, 0(R3)
ADDIU	R2, R5, 1
SEH	R5, R2
; i end address is: 20 (R5)
J	L_ReadMSG124
NOP	
L_ReadMSG125:
SH	R25, 16(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
LH	R25, 16(SP)
; num_strs start address is: 12 (R3)
SEH	R3, R2
SH	R3, 16(SP)
SH	R25, 18(SP)
ORI	R26, R0, 34
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strchr+0
NOP	
ORI	R27, R0, 79
ORI	R26, R0, 34
MOVZ	R25, R2, R0
JAL	_RemoveChars+0
NOP	
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strcpy+0
NOP	
ORI	R27, R0, 10
ORI	R26, R0, 34
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_RemoveChars+0
NOP	
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strcpy+0
NOP	
ORI	R27, R0, 1
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_string+264)
ORI	R25, R25, lo_addr(_string+264)
JAL	_memset+0
NOP	
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strncpy+0
NOP	
LH	R25, 18(SP)
LH	R3, 16(SP)
SH	R25, 16(SP)
; num_strs end address is: 12 (R3)
ADDIU	SP, SP, -12
SH	R3, 8(SP)
LUI	R2, hi_addr(?lstr_69_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_69_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_70_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_70_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 40
LH	R25, 16(SP)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
BNE	R3, R2, L__ReadMSG387
NOP	
J	L_ReadMSG127
NOP	
L__ReadMSG387:
SH	R25, 16(SP)
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_RemoveWhiteSpace+0
NOP	
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strcpy+0
NOP	
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_StrChecker+0
NOP	
LH	R25, 16(SP)
; res start address is: 16 (R4)
SEH	R4, R2
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__ReadMSG388
NOP	
J	L_ReadMSG128
NOP	
L__ReadMSG388:
J	___ReadMSG_next
NOP	
L_ReadMSG128:
SEH	R3, R4
ORI	R2, R0, 10
BEQ	R3, R2, L__ReadMSG389
NOP	
J	L_ReadMSG130
NOP	
L__ReadMSG389:
J	___ReadMSG_next
NOP	
L_ReadMSG130:
SEH	R3, R4
ORI	R2, R0, 11
BEQ	R3, R2, L__ReadMSG390
NOP	
J	L_ReadMSG132
NOP	
L__ReadMSG390:
J	___ReadMSG_next
NOP	
L_ReadMSG132:
SEH	R3, R4
ORI	R2, R0, 13
BEQ	R3, R2, L__ReadMSG391
NOP	
J	L_ReadMSG134
NOP	
L__ReadMSG391:
J	___ReadMSG_next
NOP	
L_ReadMSG134:
SEH	R3, R4
ORI	R2, R0, 14
BEQ	R3, R2, L__ReadMSG392
NOP	
J	L_ReadMSG136
NOP	
L__ReadMSG392:
J	___ReadMSG_next
NOP	
L_ReadMSG136:
SEH	R3, R4
ORI	R2, R0, 16
BEQ	R3, R2, L__ReadMSG393
NOP	
J	L_ReadMSG138
NOP	
L__ReadMSG393:
SEH	R3, R4
ORI	R2, R0, 16
BEQ	R3, R2, L__ReadMSG394
NOP	
J	L__ReadMSG272
NOP	
L__ReadMSG394:
SH	R4, 16(SP)
SH	R25, 18(SP)
ORI	R27, R0, 15
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strncmp+0
NOP	
LH	R25, 18(SP)
LH	R4, 16(SP)
BNE	R2, R0, L__ReadMSG396
NOP	
J	L__ReadMSG271
NOP	
L__ReadMSG396:
; res end address is: 16 (R4)
L__ReadMSG270:
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 11
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
ORI	R2, R0, 11
J	L_end_ReadMSG
NOP	
L__ReadMSG272:
; res start address is: 16 (R4)
L__ReadMSG271:
J	L_ReadMSG142
NOP	
L_ReadMSG138:
SEH	R3, R4
ORI	R2, R0, 17
BEQ	R3, R2, L__ReadMSG397
NOP	
J	L_ReadMSG143
NOP	
L__ReadMSG397:
SEH	R3, R4
ORI	R2, R0, 17
BEQ	R3, R2, L__ReadMSG398
NOP	
J	L__ReadMSG274
NOP	
L__ReadMSG398:
LBU	R2, Offset(_SimVars+2)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__ReadMSG399
NOP	
J	L__ReadMSG273
NOP	
L__ReadMSG399:
L__ReadMSG269:
SH	R4, 16(SP)
SH	R25, 18(SP)
ORI	R27, R0, 15
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strncpy+0
NOP	
LH	R25, 18(SP)
LH	R4, 16(SP)
LBU	R2, Offset(_SimVars+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SimVars+2)(GP)
J	L_ReadMSG147
NOP	
L__ReadMSG274:
L__ReadMSG273:
SEH	R3, R4
ORI	R2, R0, 17
BEQ	R3, R2, L__ReadMSG400
NOP	
J	L__ReadMSG276
NOP	
L__ReadMSG400:
LBU	R2, Offset(_SimVars+2)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__ReadMSG402
NOP	
J	L__ReadMSG275
NOP	
L__ReadMSG402:
; res end address is: 16 (R4)
L__ReadMSG268:
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 14
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
ORI	R2, R0, 14
J	L_end_ReadMSG
NOP	
L__ReadMSG276:
; res start address is: 16 (R4)
L__ReadMSG275:
J	___ReadMSG_next
NOP	
L_ReadMSG147:
J	L_ReadMSG152
NOP	
L_ReadMSG143:
SEH	R3, R4
ORI	R2, R0, 18
BEQ	R3, R2, L__ReadMSG403
NOP	
J	L_ReadMSG153
NOP	
L__ReadMSG403:
LBU	R2, Offset(_SimVars+2)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__ReadMSG405
NOP	
J	L__ReadMSG279
NOP	
L__ReadMSG405:
SH	R4, 16(SP)
SH	R25, 18(SP)
ORI	R27, R0, 15
LUI	R26, hi_addr(_SF+38)
ORI	R26, R26, lo_addr(_SF+38)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strncmp+0
NOP	
LH	R25, 18(SP)
LH	R4, 16(SP)
BNE	R2, R0, L__ReadMSG407
NOP	
J	L__ReadMSG278
NOP	
L__ReadMSG407:
SH	R4, 16(SP)
SH	R25, 18(SP)
ORI	R27, R0, 15
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strncmp+0
NOP	
LH	R25, 18(SP)
LH	R4, 16(SP)
BNE	R2, R0, L__ReadMSG409
NOP	
J	L__ReadMSG277
NOP	
L__ReadMSG409:
; res end address is: 16 (R4)
J	L_ReadMSG158
NOP	
L__ReadMSG278:
; res start address is: 16 (R4)
L__ReadMSG277:
L__ReadMSG266:
LBU	R2, Offset(_SimVars+2)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_SimVars+2)(GP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SH	R4, 16(SP)
SH	R25, 18(SP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+38)
ORI	R2, R2, lo_addr(_SF+38)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_71_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_71_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LH	R25, 18(SP)
LH	R4, 16(SP)
J	___ReadMSG_next
NOP	
; res end address is: 16 (R4)
L_ReadMSG158:
L__ReadMSG279:
LBU	R2, Offset(_SimVars+2)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__ReadMSG410
NOP	
J	L_ReadMSG160
NOP	
L__ReadMSG410:
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 15
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
ORI	R2, R0, 15
J	L_end_ReadMSG
NOP	
L_ReadMSG160:
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 13
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
ORI	R2, R0, 13
J	L_end_ReadMSG
NOP	
L_ReadMSG153:
; res start address is: 16 (R4)
SEH	R3, R4
ORI	R2, R0, 19
BEQ	R3, R2, L__ReadMSG411
NOP	
J	L_ReadMSG163
NOP	
L__ReadMSG411:
J	___ReadMSG_next
NOP	
; res end address is: 16 (R4)
L_ReadMSG163:
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
ORI	R2, R0, 12
J	L_end_ReadMSG
NOP	
L_ReadMSG152:
; res start address is: 16 (R4)
L_ReadMSG142:
___ReadMSG_next:
SH	R25, 16(SP)
; res end address is: 16 (R4)
SEH	R25, R4
JAL	_TestRecievedSMS+0
NOP	
LH	R25, 16(SP)
L_ReadMSG127:
MOVZ	R2, R0, R0
L_end_ReadMSG:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of _ReadMSG
_TestRecievedSMS:
ADDIU	SP, SP, -80
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R3, SP, 14
SH	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_72_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_72_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R2, SP, 14
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_73_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_73_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 12(SP)
J	L_TestRecievedSMS165
NOP	
L_TestRecievedSMS167:
MOVZ	R26, R0, R0
ORI	R25, R0, 7
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS166
NOP	
L_TestRecievedSMS168:
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS166
NOP	
L_TestRecievedSMS169:
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS166
NOP	
L_TestRecievedSMS170:
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS166
NOP	
L_TestRecievedSMS171:
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS166
NOP	
L_TestRecievedSMS172:
MOVZ	R26, R0, R0
ORI	R25, R0, 8
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS166
NOP	
L_TestRecievedSMS173:
MOVZ	R26, R0, R0
ORI	R25, R0, 6
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS166
NOP	
L_TestRecievedSMS174:
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS166
NOP	
L_TestRecievedSMS175:
JAL	_GetValuesFromFlash+0
NOP	
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__TestRecievedSMS414
NOP	
J	L_TestRecievedSMS176
NOP	
L__TestRecievedSMS414:
ADDIU	R2, SP, 14
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
ADDIU	R2, SP, 14
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, Offset(_Threshold+8)(GP)
ADDIU	R2, R2, -1
SH	R2, Offset(_Threshold+8)(GP)
L_TestRecievedSMS176:
JAL	_WriteToFlashTemp+0
NOP	
MOVZ	R25, R0, R0
JAL	_Write_Thresholds+0
NOP	
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_74_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_74_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
MOVZ	R26, R0, R0
ORI	R25, R0, 6
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS166
NOP	
L_TestRecievedSMS177:
ORI	R2, R0, 5
SB	R2, Offset(_SimVars+1)(GP)
SH	R0, Offset(_T0_SP+6)(GP)
SH	R0, Offset(_T0_SP+4)(GP)
SH	R0, Offset(_T0_SP+2)(GP)
MOVZ	R26, R0, R0
ORI	R25, R0, 9
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS166
NOP	
L_TestRecievedSMS178:
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
MOVZ	R26, R0, R0
ORI	R25, R0, 10
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS166
NOP	
L_TestRecievedSMS179:
MOVZ	R26, R0, R0
ORI	R25, R0, 16
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS166
NOP	
L_TestRecievedSMS180:
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS166
NOP	
L_TestRecievedSMS181:
J	L_TestRecievedSMS166
NOP	
L_TestRecievedSMS165:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__TestRecievedSMS416
NOP	
J	L_TestRecievedSMS167
NOP	
L__TestRecievedSMS416:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__TestRecievedSMS418
NOP	
J	L_TestRecievedSMS168
NOP	
L__TestRecievedSMS418:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__TestRecievedSMS420
NOP	
J	L_TestRecievedSMS169
NOP	
L__TestRecievedSMS420:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__TestRecievedSMS422
NOP	
J	L_TestRecievedSMS170
NOP	
L__TestRecievedSMS422:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__TestRecievedSMS424
NOP	
J	L_TestRecievedSMS171
NOP	
L__TestRecievedSMS424:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__TestRecievedSMS426
NOP	
J	L_TestRecievedSMS172
NOP	
L__TestRecievedSMS426:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__TestRecievedSMS428
NOP	
J	L_TestRecievedSMS173
NOP	
L__TestRecievedSMS428:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__TestRecievedSMS430
NOP	
J	L_TestRecievedSMS174
NOP	
L__TestRecievedSMS430:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__TestRecievedSMS432
NOP	
J	L_TestRecievedSMS175
NOP	
L__TestRecievedSMS432:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__TestRecievedSMS434
NOP	
J	L_TestRecievedSMS177
NOP	
L__TestRecievedSMS434:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__TestRecievedSMS436
NOP	
J	L_TestRecievedSMS178
NOP	
L__TestRecievedSMS436:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L__TestRecievedSMS438
NOP	
J	L_TestRecievedSMS179
NOP	
L__TestRecievedSMS438:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__TestRecievedSMS440
NOP	
J	L_TestRecievedSMS180
NOP	
L__TestRecievedSMS440:
J	L_TestRecievedSMS181
NOP	
L_TestRecievedSMS166:
L_end_TestRecievedSMS:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _TestRecievedSMS
_RemoveSMSText:
ADDIU	SP, SP, -16
SW	RA, 0(SP)
SH	R25, 4(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_75_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_75_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_76_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_76_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 4(SP)
L_RemoveSMSText182:
SH	R25, 4(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_77_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_77_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R23, SP, 6
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr78_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr78_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LH	R25, 4(SP)
LUI	R24, 406
ORI	R24, R24, 59050
L_RemoveSMSText185:
ADDIU	R24, R24, -1
BNE	R24, R0, L_RemoveSMSText185
NOP	
JAL	_RingToTempBuf+0
NOP	
ADDIU	R2, R25, -1
SEH	R25, R2
SEH	R2, R2
SLTI	R2, R2, 1
BNE	R2, R0, L__RemoveSMSText442
NOP	
J	L_RemoveSMSText182
NOP	
L__RemoveSMSText442:
SEH	R2, R25
L_end_RemoveSMSText:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _RemoveSMSText
_Test_Update_ThingSpeak:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_GetScaledValues+0
NOP	
LUI	R25, hi_addr(_FltData+0)
ORI	R25, R25, lo_addr(_FltData+0)
JAL	_TCS3472_CalcHue+0
NOP	
SW	R2, Offset(_FltData+12)(GP)
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
ORI	R2, R0, 2
L_end_Test_Update_ThingSpeak:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
ADDIU	SP, SP, -412
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R2, SP, 24
SW	R26, 16(SP)
SW	R25, 20(SP)
ORI	R27, R0, 200
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LW	R25, 20(SP)
LHU	R2, 0(R25)
SW	R25, 20(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_79_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_79_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtC+0)
ORI	R2, R2, lo_addr(_txtC+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 20(SP)
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
SW	R25, 20(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_80_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_80_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR+0)
ORI	R2, R2, lo_addr(_txtR+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 20(SP)
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
SW	R25, 20(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_81_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_81_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtG+0)
ORI	R2, R2, lo_addr(_txtG+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 20(SP)
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_82_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_82_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtB+0)
ORI	R2, R2, lo_addr(_txtB+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R26, 16(SP)
LW	R2, 0(R26)
SW	R26, 16(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_83_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_83_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR_Scl+0)
ORI	R2, R2, lo_addr(_txtR_Scl+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R26, 16(SP)
ADDIU	R2, R26, 4
LW	R2, 0(R2)
SW	R26, 16(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_84_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_84_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtG_Scl+0)
ORI	R2, R2, lo_addr(_txtG_Scl+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R26, 16(SP)
ADDIU	R2, R26, 8
LW	R2, 0(R2)
SW	R26, 16(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_85_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_85_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtB_Scl+0)
ORI	R2, R2, lo_addr(_txtB_Scl+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R26, 16(SP)
ADDIU	R2, R26, 12
LW	R2, 0(R2)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_86_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_86_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtHUE+0)
ORI	R2, R2, lo_addr(_txtHUE+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R2, SP, 24
ORI	R27, R0, 46
LUI	R26, hi_addr(_str_api+0)
ORI	R26, R26, lo_addr(_str_api+0)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_SF+58)
ORI	R26, R26, lo_addr(_SF+58)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field1+0)
ORI	R25, R25, lo_addr(_field1+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field1+0)
ORI	R26, R26, lo_addr(_field1+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtC+0)
ORI	R25, R25, lo_addr(_txtC+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtC+0)
ORI	R26, R26, lo_addr(_txtC+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field2+0)
ORI	R25, R25, lo_addr(_field2+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field2+0)
ORI	R26, R26, lo_addr(_field2+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtR+0)
ORI	R26, R26, lo_addr(_txtR+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field3+0)
ORI	R25, R25, lo_addr(_field3+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field3+0)
ORI	R26, R26, lo_addr(_field3+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtG+0)
ORI	R25, R25, lo_addr(_txtG+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtG+0)
ORI	R26, R26, lo_addr(_txtG+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field4+0)
ORI	R25, R25, lo_addr(_field4+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field4+0)
ORI	R26, R26, lo_addr(_field4+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtB+0)
ORI	R26, R26, lo_addr(_txtB+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field5+0)
ORI	R25, R25, lo_addr(_field5+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field5+0)
ORI	R26, R26, lo_addr(_field5+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtR_Scl+0)
ORI	R25, R25, lo_addr(_txtR_Scl+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtR_Scl+0)
ORI	R26, R26, lo_addr(_txtR_Scl+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field6+0)
ORI	R25, R25, lo_addr(_field6+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field6+0)
ORI	R26, R26, lo_addr(_field6+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtG_Scl+0)
ORI	R25, R25, lo_addr(_txtG_Scl+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtG_Scl+0)
ORI	R26, R26, lo_addr(_txtG_Scl+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field7+0)
ORI	R25, R25, lo_addr(_field7+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field7+0)
ORI	R26, R26, lo_addr(_field7+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtB_Scl+0)
ORI	R25, R25, lo_addr(_txtB_Scl+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtB_Scl+0)
ORI	R26, R26, lo_addr(_txtB_Scl+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field8+0)
ORI	R25, R25, lo_addr(_field8+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field8+0)
ORI	R26, R26, lo_addr(_field8+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtHUE+0)
ORI	R25, R25, lo_addr(_txtHUE+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtHUE+0)
ORI	R26, R26, lo_addr(_txtHUE+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
ADDIU	R2, SP, 24
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_87_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_87_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R23, SP, 224
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr88_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr88_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 224
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
LUI	R24, 203
ORI	R24, R24, 29524
L_SendData187:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData187
NOP	
NOP	
NOP	
ADDIU	R23, SP, 235
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr89_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr89_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 235
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData189:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData189
NOP	
NOP	
ADDIU	R23, SP, 244
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr90_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr90_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 244
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData191:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData191
NOP	
NOP	
ADDIU	R23, SP, 253
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr91_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr91_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 253
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData193:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData193
NOP	
NOP	
ADDIU	R23, SP, 263
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr92_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr92_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 263
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData195:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData195
NOP	
NOP	
ADDIU	R23, SP, 274
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr93_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr93_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 274
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData197:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData197
NOP	
NOP	
ADDIU	R23, SP, 287
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr94_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr94_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 287
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData199:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData199
NOP	
NOP	
ADDIU	R23, SP, 299
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr95_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr95_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 299
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_UART2_Write_Text+0
NOP	
ADDIU	R23, SP, 308
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr96_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr96_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 308
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
LUI	R25, hi_addr(_SF+118)
ORI	R25, R25, lo_addr(_SF+118)
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData201:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData201
NOP	
NOP	
ADDIU	R23, SP, 317
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr97_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr97_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 317
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData203:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData203
NOP	
NOP	
ADDIU	R23, SP, 326
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr98_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr98_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 326
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData205:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData205
NOP	
ADDIU	R23, SP, 335
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr99_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr99_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 335
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData207:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData207
NOP	
NOP	
ADDIU	R23, SP, 348
ADDIU	R22, R23, 42
LUI	R24, hi_addr(?ICS?lstr100_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr100_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 348
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData209:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData209
NOP	
ADDIU	R23, SP, 390
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr101_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr101_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 390
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData211:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData211
NOP	
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 1
JAL	_TestForOK+0
NOP	
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData213:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData213
NOP	
NOP	
NOP	
ADDIU	R23, SP, 401
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr102_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr102_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 401
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData215:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData215
NOP	
NOP	
NOP	
L_end_SendData:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 412
JR	RA
NOP	
; end of _SendData
_SignalStrength:
ADDIU	SP, SP, -28
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 65
SB	R30, 18(SP)
ORI	R30, R0, 84
SB	R30, 19(SP)
ORI	R30, R0, 43
SB	R30, 20(SP)
ORI	R30, R0, 67
SB	R30, 21(SP)
ORI	R30, R0, 83
SB	R30, 22(SP)
ORI	R30, R0, 81
SB	R30, 23(SP)
MOVZ	R30, R0, R0
SB	R30, 24(SP)
ADDIU	R2, SP, 18
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
JAL	_RingToTempBuf+0
NOP	
LUI	R24, 61
ORI	R24, R24, 2303
L_SignalStrength217:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SignalStrength217
NOP	
NOP	
LUI	R2, hi_addr(?lstr_104_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_104_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
SH	R2, 16(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 58
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_RemoveChars+0
NOP	
ORI	R27, R0, 2
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strncpy+0
NOP	
ORI	R27, R0, 79
ORI	R26, R0, 2
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_RemoveChars+0
NOP	
ORI	R27, R0, 2
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strncpy+0
NOP	
LBU	R25, Offset(_string+1)(GP)
JAL	_isdigit+0
NOP	
; is_digit start address is: 84 (R21)
ANDI	R21, R2, 65535
BNE	R2, R0, L__SignalStrength447
NOP	
J	L_SignalStrength219
NOP	
L__SignalStrength447:
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_atoi+0
NOP	
SH	R2, Offset(_SimVars+4)(GP)
J	L_SignalStrength220
NOP	
L_SignalStrength219:
SH	R0, Offset(_SimVars+4)(GP)
L_SignalStrength220:
LH	R2, 16(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_105_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_105_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	SP, SP, -12
SH	R21, 8(SP)
; is_digit end address is: 84 (R21)
LUI	R2, hi_addr(?lstr_106_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_106_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LH	R2, Offset(_SimVars+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_107_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_107_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtS+0)
ORI	R2, R2, lo_addr(_txtS+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R2, hi_addr(_txtS+0)
ORI	R2, R2, lo_addr(_txtS+0)
ADDIU	SP, SP, -48
SW	R2, 44(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 36(SP)
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_108_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_108_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 48
LH	R2, Offset(_SimVars+4)(GP)
L_end_SignalStrength:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _SignalStrength
_PWM_SigStrength:
SEH	R2, R25
SLTI	R2, R2, 29
BEQ	R2, R0, L__PWM_SigStrength449
NOP	
J	L_PWM_SigStrength221
NOP	
L__PWM_SigStrength449:
ORI	R2, R0, 46080
SW	R2, Offset(PR2+0)(GP)
ORI	R2, R0, 1220
SW	R2, Offset(PR3+0)(GP)
J	L_PWM_SigStrength222
NOP	
L_PWM_SigStrength221:
SEH	R2, R25
SLTI	R2, R2, 24
BEQ	R2, R0, L__PWM_SigStrength450
NOP	
J	L__PWM_SigStrength286
NOP	
L__PWM_SigStrength450:
SEH	R2, R25
SLTI	R2, R2, 28
BNE	R2, R0, L__PWM_SigStrength451
NOP	
J	L__PWM_SigStrength285
NOP	
L__PWM_SigStrength451:
L__PWM_SigStrength284:
ORI	R2, R0, 32256
SW	R2, Offset(PR2+0)(GP)
ORI	R2, R0, 854
SW	R2, Offset(PR3+0)(GP)
J	L_PWM_SigStrength226
NOP	
L__PWM_SigStrength286:
L__PWM_SigStrength285:
SEH	R2, R25
SLTI	R2, R2, 19
BEQ	R2, R0, L__PWM_SigStrength452
NOP	
J	L__PWM_SigStrength288
NOP	
L__PWM_SigStrength452:
SEH	R2, R25
SLTI	R2, R2, 24
BNE	R2, R0, L__PWM_SigStrength453
NOP	
J	L__PWM_SigStrength287
NOP	
L__PWM_SigStrength453:
L__PWM_SigStrength283:
ORI	R2, R0, 23040
SW	R2, Offset(PR2+0)(GP)
ORI	R2, R0, 610
SW	R2, Offset(PR3+0)(GP)
J	L_PWM_SigStrength230
NOP	
L__PWM_SigStrength288:
L__PWM_SigStrength287:
SEH	R2, R25
SLTI	R2, R2, 14
BEQ	R2, R0, L__PWM_SigStrength454
NOP	
J	L__PWM_SigStrength290
NOP	
L__PWM_SigStrength454:
SEH	R2, R25
SLTI	R2, R2, 19
BNE	R2, R0, L__PWM_SigStrength455
NOP	
J	L__PWM_SigStrength289
NOP	
L__PWM_SigStrength455:
L__PWM_SigStrength282:
ORI	R2, R0, 11520
SW	R2, Offset(PR2+0)(GP)
ORI	R2, R0, 305
SW	R2, Offset(PR3+0)(GP)
J	L_PWM_SigStrength234
NOP	
L__PWM_SigStrength290:
L__PWM_SigStrength289:
SEH	R2, R25
SLTI	R2, R2, 9
BEQ	R2, R0, L__PWM_SigStrength456
NOP	
J	L__PWM_SigStrength292
NOP	
L__PWM_SigStrength456:
SEH	R2, R25
SLTI	R2, R2, 14
BNE	R2, R0, L__PWM_SigStrength457
NOP	
J	L__PWM_SigStrength291
NOP	
L__PWM_SigStrength457:
L__PWM_SigStrength281:
ORI	R2, R0, 4608
SW	R2, Offset(PR2+0)(GP)
ORI	R2, R0, 122
SW	R2, Offset(PR3+0)(GP)
J	L_PWM_SigStrength238
NOP	
L__PWM_SigStrength292:
L__PWM_SigStrength291:
SEH	R2, R25
SLTI	R2, R2, 4
BEQ	R2, R0, L__PWM_SigStrength458
NOP	
J	L__PWM_SigStrength294
NOP	
L__PWM_SigStrength458:
SEH	R2, R25
SLTI	R2, R2, 9
BNE	R2, R0, L__PWM_SigStrength459
NOP	
J	L__PWM_SigStrength293
NOP	
L__PWM_SigStrength459:
L__PWM_SigStrength280:
ORI	R2, R0, 14464
SW	R2, Offset(PR2+0)(GP)
ORI	R2, R0, 1
SW	R2, Offset(PR3+0)(GP)
L__PWM_SigStrength294:
L__PWM_SigStrength293:
L_PWM_SigStrength238:
L_PWM_SigStrength234:
L_PWM_SigStrength230:
L_PWM_SigStrength226:
L_PWM_SigStrength222:
L_end_PWM_SigStrength:
JR	RA
NOP	
; end of _PWM_SigStrength
_TestForOK:
ADDIU	SP, SP, -20
SW	RA, 0(SP)
SW	R26, 4(SP)
SB	R25, 8(SP)
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LBU	R25, 8(SP)
LUI	R24, 40
ORI	R24, R24, 45226
L_TestForOK242:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TestForOK242
NOP	
JAL	_RingToTempBuf+0
NOP	
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SB	R25, 8(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_109_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_109_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LBU	R25, 8(SP)
; lastMillis start address is: 16 (R4)
LW	R4, Offset(_TMR0+0)(GP)
ANDI	R2, R25, 255
BEQ	R2, R0, L__TestForOK461
NOP	
J	L_TestForOK244
NOP	
L__TestForOK461:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
L_TestForOK245:
; lastMillis start address is: 20 (R5)
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
ORI	R30, R0, 79
SB	R30, 9(SP)
ORI	R30, R0, 75
SB	R30, 10(SP)
MOVZ	R30, R0, R0
SB	R30, 11(SP)
ADDIU	R2, SP, 9
SB	R25, 8(SP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strstr+0
NOP	
LBU	R25, 8(SP)
BEQ	R2, R0, L__TestForOK462
NOP	
J	L_TestForOK246
NOP	
L__TestForOK462:
; lastMillis end address is: 20 (R5)
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK463
NOP	
J	L_TestForOK247
NOP	
L__TestForOK463:
; lastMillis end address is: 20 (R5)
J	L_TestForOK246
NOP	
L_TestForOK247:
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK245
NOP	
L_TestForOK246:
J	L_TestForOK248
NOP	
L_TestForOK244:
; lastMillis start address is: 16 (R4)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__TestForOK464
NOP	
J	L_TestForOK249
NOP	
L__TestForOK464:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
L_TestForOK250:
; lastMillis start address is: 20 (R5)
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
ADDIU	R23, SP, 12
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr111_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr111_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 12
SB	R25, 8(SP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strstr+0
NOP	
LBU	R25, 8(SP)
BEQ	R2, R0, L__TestForOK465
NOP	
J	L_TestForOK251
NOP	
L__TestForOK465:
; lastMillis end address is: 20 (R5)
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK466
NOP	
J	L_TestForOK252
NOP	
L__TestForOK466:
; lastMillis end address is: 20 (R5)
J	L_TestForOK251
NOP	
L_TestForOK252:
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK250
NOP	
L_TestForOK251:
L_TestForOK249:
L_TestForOK248:
L_end_TestForOK:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _TestForOK
