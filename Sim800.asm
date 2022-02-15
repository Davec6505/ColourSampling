_InitGSM3:
ADDIU	SP, SP, -16
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R0, Offset(_SimVars+0)(GP)
SH	R0, Offset(_SimVars+2)(GP)
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
_PwrDownGSM3:
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
LUI	R2, BitMask(LATD0_bit+0)
ORI	R2, R2, BitMask(LATD0_bit+0)
_SX	
LUI	R24, 813
ORI	R24, R24, 52564
L_PwrDownGSM30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrDownGSM30
NOP	
NOP	
NOP	
LUI	R2, BitMask(LATD0_bit+0)
ORI	R2, R2, BitMask(LATD0_bit+0)
_SX	
L_PwrDownGSM32:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrDownGSM3315
NOP	
J	L_PwrDownGSM33
NOP	
L__PwrDownGSM3315:
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrDownGSM34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrDownGSM34
NOP	
J	L_PwrDownGSM32
NOP	
L_PwrDownGSM33:
_LX	
EXT	R3, R2, BitPos(RB4_bit+0), 1
_LX	
INS	R2, R3, BitPos(LATA10_bit+0), 1
_SX	
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrDownGSM36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrDownGSM36
NOP	
NOP	
NOP	
L_end_PwrDownGSM3:
JR	RA
NOP	
; end of _PwrDownGSM3
_PwrUpGSM3:
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
LUI	R2, BitMask(LATD0_bit+0)
ORI	R2, R2, BitMask(LATD0_bit+0)
_SX	
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM38:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM38
NOP	
LUI	R2, BitMask(LATD0_bit+0)
ORI	R2, R2, BitMask(LATD0_bit+0)
_SX	
L_PwrUpGSM310:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BEQ	R2, R0, L__PwrUpGSM3317
NOP	
J	L_PwrUpGSM311
NOP	
L__PwrUpGSM3317:
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM312:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM312
NOP	
J	L_PwrUpGSM310
NOP	
L_PwrUpGSM311:
_LX	
EXT	R3, R2, BitPos(RB4_bit+0), 1
_LX	
INS	R2, R3, BitPos(LATA10_bit+0), 1
_SX	
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM314:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM314
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
ORI	R2, R0, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
L_WriteToFlashTemp16:
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLTI	R2, R2, 128
BNE	R2, R0, L__WriteToFlashTemp319
NOP	
J	L_WriteToFlashTemp17
NOP	
L__WriteToFlashTemp319:
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_temp+0)
ORI	R2, R2, lo_addr(_temp+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
J	L_WriteToFlashTemp16
NOP	
L_WriteToFlashTemp17:
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
SEH	R2, R2
BEQ	R2, R0, L__WriteToFlashTemp320
NOP	
J	L_WriteToFlashTemp19
NOP	
L__WriteToFlashTemp320:
ADDIU	R2, R3, 20
; pos end address is: 12 (R3)
; pos start address is: 16 (R4)
MOVZ	R4, R2, R0
SH	R0, Offset(WriteToFlashTemp_i_L0+0)(GP)
; pos end address is: 16 (R4)
L_WriteToFlashTemp20:
; pos start address is: 16 (R4)
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLTI	R2, R2, 128
BNE	R2, R0, L__WriteToFlashTemp321
NOP	
J	L_WriteToFlashTemp21
NOP	
L__WriteToFlashTemp321:
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
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
; pos end address is: 16 (R4)
J	L_WriteToFlashTemp20
NOP	
L_WriteToFlashTemp21:
L_WriteToFlashTemp19:
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
L_GetValuesFromFlash23:
; i start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
LH	R2, Offset(_SL+14)(GP)
SLTU	R2, R5, R2
BNE	R2, R0, L__GetValuesFromFlash323
NOP	
J	L_GetValuesFromFlash24
NOP	
L__GetValuesFromFlash323:
; ptr end address is: 16 (R4)
; ptr start address is: 16 (R4)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R3, R2, R5
ADDU	R2, R4, R5
LBU	R2, 0(R2)
SB	R2, 0(R3)
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
; ptr end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_GetValuesFromFlash23
NOP	
L_GetValuesFromFlash24:
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
L_end_GetStrLengths:
JR	RA
NOP	
; end of _GetStrLengths
_RcvSimTxt:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
L_RcvSimTxt26:
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__RcvSimTxt327
NOP	
J	L_RcvSimTxt27
NOP	
L__RcvSimTxt327:
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__RcvSimTxt328
NOP	
J	L__RcvSimTxt272
NOP	
L__RcvSimTxt328:
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__RcvSimTxt329
NOP	
J	L__RcvSimTxt271
NOP	
L__RcvSimTxt329:
J	L_RcvSimTxt30
NOP	
L__RcvSimTxt272:
L__RcvSimTxt271:
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BNE	R2, R0, L__RcvSimTxt331
NOP	
J	L_RcvSimTxt31
NOP	
L__RcvSimTxt331:
ORI	R2, R0, 4
SW	R2, Offset(U2STAbits+4)(GP)
J	___RcvSimTxt_m0
NOP	
L_RcvSimTxt31:
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__RcvSimTxt333
NOP	
J	L_RcvSimTxt32
NOP	
L__RcvSimTxt333:
ORI	R2, R0, 2
SW	R2, Offset(U2STAbits+4)(GP)
L_RcvSimTxt32:
L_RcvSimTxt30:
___RcvSimTxt_m0:
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt334
NOP	
J	L_RcvSimTxt33
NOP	
L__RcvSimTxt334:
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
SB	R4, 0(R2)
; txt end address is: 16 (R4)
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
J	L_RcvSimTxt34
NOP	
L_RcvSimTxt33:
LW	R3, Offset(U2RXREG+0)(GP)
ORI	R2, R0, 10
BEQ	R3, R2, L__RcvSimTxt335
NOP	
J	L_RcvSimTxt35
NOP	
L__RcvSimTxt335:
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
ORI	R2, R0, 44
SB	R2, 0(R3)
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
L_RcvSimTxt35:
L_RcvSimTxt34:
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RcvSimTxt336
NOP	
J	L_RcvSimTxt36
NOP	
L__RcvSimTxt336:
SH	R0, Offset(_RB+1002)(GP)
L_RcvSimTxt36:
J	L_RcvSimTxt26
NOP	
L_RcvSimTxt27:
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
BNE	R2, R0, L__TestRingPointers338
NOP	
J	L_TestRingPointers37
NOP	
L__TestRingPointers338:
LHU	R3, Offset(_RB+1004)(GP)
ORI	R2, R0, 1000
SUBU	R3, R2, R3
LHU	R2, Offset(_RB+1002)(GP)
ADDU	R2, R3, R2
; diff start address is: 8 (R2)
; diff end address is: 8 (R2)
J	L_TestRingPointers38
NOP	
L_TestRingPointers37:
LHU	R3, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SUBU	R2, R2, R3
; diff start address is: 12 (R3)
ANDI	R3, R2, 65535
; diff end address is: 12 (R3)
SEH	R2, R3
L_TestRingPointers38:
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
J	L_WaitForResponse39
NOP	
L__WaitForResponse273:
L_WaitForResponse39:
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
SEB	R2, R25
BEQ	R2, R0, L__WaitForResponse340
NOP	
J	L_WaitForResponse42
NOP	
L__WaitForResponse340:
; lastMillis end address is: 20 (R5)
; lastMillis start address is: 20 (R5)
LUI	R24, 40
ORI	R24, R24, 45226
L_WaitForResponse43:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse43
NOP	
J	L_WaitForResponse45
NOP	
L_WaitForResponse42:
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForResponse341
NOP	
J	L_WaitForResponse46
NOP	
L__WaitForResponse341:
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForResponse47:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse47
NOP	
NOP	
NOP	
J	L_WaitForResponse49
NOP	
L_WaitForResponse46:
SEB	R3, R25
ORI	R2, R0, 3
BEQ	R3, R2, L__WaitForResponse342
NOP	
J	L_WaitForResponse50
NOP	
L__WaitForResponse342:
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
L_WaitForResponse51:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse51
NOP	
NOP	
NOP	
J	L_WaitForResponse53
NOP	
L_WaitForResponse50:
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse54:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse54
NOP	
L_WaitForResponse53:
L_WaitForResponse49:
L_WaitForResponse45:
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R3, R2, R5
ORI	R2, R0, 59000
SLTU	R2, R2, R3
BNE	R2, R0, L__WaitForResponse343
NOP	
J	L_WaitForResponse56
NOP	
L__WaitForResponse343:
; lastMillis end address is: 20 (R5)
J	L_WaitForResponse40
NOP	
L_WaitForResponse56:
; lastMillis start address is: 20 (R5)
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForResponse345
NOP	
J	L__WaitForResponse273
NOP	
L__WaitForResponse345:
; lastMillis end address is: 20 (R5)
L_WaitForResponse40:
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
L_RingToTempBuf57:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
BNE	R2, R3, L__RingToTempBuf348
NOP	
J	L_RingToTempBuf58
NOP	
L__RingToTempBuf348:
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__RingToTempBuf349
NOP	
J	L__RingToTempBuf276
NOP	
L__RingToTempBuf349:
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 151
BEQ	R2, R0, L__RingToTempBuf350
NOP	
J	L__RingToTempBuf275
NOP	
L__RingToTempBuf350:
L__RingToTempBuf274:
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1004)(GP)
L__RingToTempBuf276:
L__RingToTempBuf275:
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
BEQ	R2, R0, L__RingToTempBuf351
NOP	
J	L_RingToTempBuf62
NOP	
L__RingToTempBuf351:
SH	R0, Offset(_RB+1004)(GP)
L_RingToTempBuf62:
J	L_RingToTempBuf57
NOP	
L_RingToTempBuf58:
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
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT63:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT63
NOP	
JAL	_RingToTempBuf+0
NOP	
___SetupIOT_wait:
ADDIU	R23, SP, 12
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr3_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Sim800+0)
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
L_SetupIOT65:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT65
NOP	
NOP	
NOP	
JAL	_RingToTempBuf+0
NOP	
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT353
NOP	
J	L_SetupIOT67
NOP	
L__SetupIOT353:
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT354
NOP	
J	L_SetupIOT68
NOP	
L__SetupIOT354:
J	L_SetupIOT69
NOP	
L_SetupIOT68:
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT70:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT70
NOP	
NOP	
NOP	
J	___SetupIOT_wait
NOP	
L_SetupIOT69:
L_SetupIOT67:
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
LUI	R24, hi_addr(?ICS?lstr4_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr4_Sim800+0)
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
L_WaitForSetupSMS72:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS72
NOP	
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS74:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS74
NOP	
JAL	_RingToTempBuf+0
NOP	
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 14(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_5_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R23, SP, 26
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr6_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr6_Sim800+0)
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
L_WaitForSetupSMS76:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS76
NOP	
JAL	_RingToTempBuf+0
NOP	
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
LHU	R25, 12(SP)
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS356
NOP	
J	L_WaitForSetupSMS78
NOP	
L__WaitForSetupSMS356:
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
LHU	R25, 12(SP)
J	L_WaitForSetupSMS79
NOP	
L_WaitForSetupSMS78:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS357
NOP	
J	L_WaitForSetupSMS80
NOP	
L__WaitForSetupSMS357:
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
LHU	R25, 12(SP)
L_WaitForSetupSMS80:
L_WaitForSetupSMS79:
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS81:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS81
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
LHU	R25, 12(SP)
SH	R2, 14(SP)
SEH	R2, R2
BEQ	R2, R0, L__WaitForSetupSMS358
NOP	
J	L__WaitForSetupSMS280
NOP	
L__WaitForSetupSMS358:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS359
NOP	
J	L__WaitForSetupSMS279
NOP	
L__WaitForSetupSMS359:
L__WaitForSetupSMS278:
JAL	_WriteToFlashTemp+0
NOP	
ORI	R2, R0, 3
J	L_end_WaitForSetupSMS
NOP	
L__WaitForSetupSMS280:
L__WaitForSetupSMS279:
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS360
NOP	
J	L__WaitForSetupSMS282
NOP	
L__WaitForSetupSMS360:
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS361
NOP	
J	L__WaitForSetupSMS281
NOP	
L__WaitForSetupSMS361:
L__WaitForSetupSMS277:
ORI	R2, R0, 2
J	L_end_WaitForSetupSMS
NOP	
L__WaitForSetupSMS282:
L__WaitForSetupSMS281:
ORI	R2, R0, 255
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
LUI	R24, hi_addr(?ICS?lstr8_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr8_Sim800+0)
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
L_AT_Initial91:
ADDIU	R24, R24, -1
BNE	R24, R0, L_AT_Initial91
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
LUI	R24, hi_addr(?ICS?lstr9_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr9_Sim800+0)
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
L_GetAPI_Key_SMS93:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetAPI_Key_SMS93
NOP	
NOP	
NOP	
ADDIU	R23, SP, 17
ADDIU	R22, R23, 63
LUI	R24, hi_addr(?ICS?lstr10_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr10_Sim800+0)
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
ADDIU	SP, SP, -536
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
BEQ	R26, R0, L__SendSMS365
NOP	
J	L_SendSMS95
NOP	
L__SendSMS365:
ADDIU	R2, SP, 115
SB	R25, 16(SP)
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LBU	R25, 16(SP)
J	L_SendSMS96
NOP	
L_SendSMS95:
ADDIU	R2, SP, 115
SB	R25, 16(SP)
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LBU	R25, 16(SP)
L_SendSMS96:
LB	R2, Offset(SendSMS_onecA_L0+0)(GP)
BEQ	R2, R0, L__SendSMS366
NOP	
J	L_SendSMS97
NOP	
L__SendSMS366:
ORI	R2, R0, 1
SB	R2, Offset(SendSMS_onecA_L0+0)(GP)
JAL	_AT_Initial+0
NOP	
L_SendSMS97:
ADDIU	R23, SP, 135
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr11_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr11_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 135
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
L_SendSMS98:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS98
NOP	
ADDIU	R23, SP, 145
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr12_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr12_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 145
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
ADDIU	R2, SP, 115
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
L_SendSMS100:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS100
NOP	
NOP	
NOP	
J	L_SendSMS102
NOP	
L_SendSMS104:
ADDIU	R23, SP, 154
ADDIU	R22, R23, 43
LUI	R24, hi_addr(?ICS?lstr13_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr13_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 154
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS103
NOP	
L_SendSMS105:
ADDIU	R23, SP, 197
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr14_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr14_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 197
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS103
NOP	
L_SendSMS106:
ADDIU	R23, SP, 211
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr15_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr15_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 211
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS103
NOP	
L_SendSMS107:
ADDIU	R23, SP, 225
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr16_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr16_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 225
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS103
NOP	
L_SendSMS108:
ADDIU	R23, SP, 241
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr17_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr17_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 241
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS103
NOP	
L_SendSMS109:
ADDIU	R23, SP, 260
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr18_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr18_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 260
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS103
NOP	
L_SendSMS110:
JAL	_Read_Thresholds+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, R2, -4
ADDIU	R2, SP, 36
SEH	R27, R3
MOVZ	R26, R6, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
ADDIU	R2, SP, 36
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS103
NOP	
L_SendSMS111:
MOVZ	R25, R0, R0
JAL	_Read_Send_AllColour+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 36
SEH	R27, R2
MOVZ	R26, R6, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
ADDIU	R2, SP, 36
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS103
NOP	
L_SendSMS112:
ORI	R25, R0, 1
JAL	_Read_Send_AllColour+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 36
SEH	R27, R2
MOVZ	R26, R6, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
ADDIU	R2, SP, 36
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS103
NOP	
L_SendSMS113:
ADDIU	R23, SP, 278
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr19_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr19_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 278
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS103
NOP	
L_SendSMS114:
ADDIU	R23, SP, 292
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr20_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr20_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 292
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS103
NOP	
L_SendSMS115:
ADDIU	R23, SP, 306
ADDIU	R22, R23, 65
LUI	R24, hi_addr(?ICS?lstr21_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr21_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 306
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS103
NOP	
L_SendSMS116:
ADDIU	R23, SP, 371
ADDIU	R22, R23, 26
LUI	R24, hi_addr(?ICS?lstr22_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr22_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 371
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS103
NOP	
L_SendSMS117:
ADDIU	R23, SP, 397
ADDIU	R22, R23, 49
LUI	R24, hi_addr(?ICS?lstr23_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr23_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 397
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS103
NOP	
L_SendSMS118:
ADDIU	R23, SP, 446
ADDIU	R22, R23, 30
LUI	R24, hi_addr(?ICS?lstr24_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr24_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 446
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS103
NOP	
L_SendSMS119:
ADDIU	R23, SP, 476
ADDIU	R22, R23, 27
LUI	R24, hi_addr(?ICS?lstr25_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr25_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 476
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS103
NOP	
L_SendSMS120:
JAL	_ReadHUE+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 36
SEH	R27, R2
MOVZ	R26, R6, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
ADDIU	R2, SP, 36
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS103
NOP	
L_SendSMS121:
ORI	R26, R0, 15
LUI	R25, hi_addr(_aveadc_+0)
ORI	R25, R25, lo_addr(_aveadc_+0)
JAL	_LM35_Adc_Average+0
NOP	
ADDIU	R2, SP, 20
LH	R26, Offset(_aveadc_+0)(GP)
MOVZ	R25, R2, R0
JAL	_getLM35Temp+0
NOP	
SH	R0, Offset(_aveadc_+0)(GP)
ADDIU	R2, SP, 20
ADDIU	R2, R2, 4
LW	R2, 0(R2)
ADDIU	R3, SP, 100
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_26_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_26_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 100
; str_ start address is: 24 (R6)
MOVZ	R6, R3, R0
ORI	R30, R0, 42
SB	R30, 503(SP)
ORI	R30, R0, 67
SB	R30, 504(SP)
MOVZ	R30, R0, R0
SB	R30, 505(SP)
ADDIU	R2, SP, 503
MOVZ	R26, R2, R0
MOVZ	R25, R3, R0
JAL	_strcat+0
NOP	
ADDIU	R2, SP, 100
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS103
NOP	
L_SendSMS122:
ADDIU	R23, SP, 506
ADDIU	R22, R23, 30
LUI	R24, hi_addr(?ICS?lstr28_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr28_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 506
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
MOVZ	R3, R6, R0
J	L_SendSMS103
NOP	
L_SendSMS102:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS368
NOP	
J	L_SendSMS104
NOP	
L__SendSMS368:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS370
NOP	
J	L_SendSMS105
NOP	
L__SendSMS370:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS372
NOP	
J	L_SendSMS106
NOP	
L__SendSMS372:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__SendSMS374
NOP	
J	L_SendSMS107
NOP	
L__SendSMS374:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__SendSMS376
NOP	
J	L_SendSMS108
NOP	
L__SendSMS376:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__SendSMS378
NOP	
J	L_SendSMS109
NOP	
L__SendSMS378:
ANDI	R3, R25, 255
ORI	R2, R0, 6
BNE	R3, R2, L__SendSMS380
NOP	
J	L_SendSMS110
NOP	
L__SendSMS380:
ANDI	R3, R25, 255
ORI	R2, R0, 7
BNE	R3, R2, L__SendSMS382
NOP	
J	L_SendSMS111
NOP	
L__SendSMS382:
ANDI	R3, R25, 255
ORI	R2, R0, 8
BNE	R3, R2, L__SendSMS384
NOP	
J	L_SendSMS112
NOP	
L__SendSMS384:
ANDI	R3, R25, 255
ORI	R2, R0, 9
BNE	R3, R2, L__SendSMS386
NOP	
J	L_SendSMS113
NOP	
L__SendSMS386:
ANDI	R3, R25, 255
ORI	R2, R0, 10
BNE	R3, R2, L__SendSMS388
NOP	
J	L_SendSMS114
NOP	
L__SendSMS388:
ANDI	R3, R25, 255
ORI	R2, R0, 11
BNE	R3, R2, L__SendSMS390
NOP	
J	L_SendSMS115
NOP	
L__SendSMS390:
ANDI	R3, R25, 255
ORI	R2, R0, 12
BNE	R3, R2, L__SendSMS392
NOP	
J	L_SendSMS116
NOP	
L__SendSMS392:
ANDI	R3, R25, 255
ORI	R2, R0, 13
BNE	R3, R2, L__SendSMS394
NOP	
J	L_SendSMS117
NOP	
L__SendSMS394:
ANDI	R3, R25, 255
ORI	R2, R0, 14
BNE	R3, R2, L__SendSMS396
NOP	
J	L_SendSMS118
NOP	
L__SendSMS396:
ANDI	R3, R25, 255
ORI	R2, R0, 15
BNE	R3, R2, L__SendSMS398
NOP	
J	L_SendSMS119
NOP	
L__SendSMS398:
ANDI	R3, R25, 255
ORI	R2, R0, 16
BNE	R3, R2, L__SendSMS400
NOP	
J	L_SendSMS120
NOP	
L__SendSMS400:
ANDI	R3, R25, 255
ORI	R2, R0, 17
BNE	R3, R2, L__SendSMS402
NOP	
J	L_SendSMS121
NOP	
L__SendSMS402:
J	L_SendSMS122
NOP	
; str_ end address is: 24 (R6)
L_SendSMS103:
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
L_SendSMS123:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS123
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
ADDIU	SP, SP, 536
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
LUI	R24, hi_addr(?ICS?lstr29_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr29_Sim800+0)
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
LUI	R2, hi_addr(?lstr_30_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_30_Sim800+0)
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
LUI	R2, hi_addr(?lstr_31_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_31_Sim800+0)
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
LUI	R2, hi_addr(?lstr_32_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_32_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 52
LH	R2, 18(SP)
BEQ	R2, R0, L__GetSMSText404
NOP	
J	L_GetSMSText125
NOP	
L__GetSMSText404:
LBU	R25, Offset(_string+64)(GP)
JAL	_isdigit+0
NOP	
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__GetSMSText405
NOP	
J	L_GetSMSText126
NOP	
L__GetSMSText405:
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 16(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_33_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_33_Sim800+0)
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
LUI	R2, hi_addr(?lstr_34_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_34_Sim800+0)
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
J	L_GetSMSText127
NOP	
L_GetSMSText126:
MOVZ	R26, R0, R0
ORI	R25, R0, 5
JAL	_SendSMS+0
NOP	
ORI	R2, R0, 1
SH	R2, 16(SP)
L_GetSMSText127:
LH	R25, 16(SP)
JAL	_RemoveSMSText+0
NOP	
J	L_end_GetSMSText
NOP	
L_GetSMSText125:
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
LUI	R2, hi_addr(?lstr_35_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_35_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG128:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG128
NOP	
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_36_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_36_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R23, SP, 20
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr37_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr37_Sim800+0)
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
L_ReadMSG130:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG130
NOP	
ADDIU	R23, SP, 30
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr38_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr38_Sim800+0)
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
L_ReadMSG132:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG132
NOP	
LUI	R2, hi_addr(?lstr_39_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_39_Sim800+0)
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
L_ReadMSG134:
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
BNE	R2, R0, L__ReadMSG407
NOP	
J	L_ReadMSG135
NOP	
L__ReadMSG407:
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
J	L_ReadMSG134
NOP	
L_ReadMSG135:
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
LUI	R2, hi_addr(?lstr_40_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_40_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
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
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_41_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_41_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 48
LH	R25, 16(SP)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
BNE	R3, R2, L__ReadMSG409
NOP	
J	L_ReadMSG137
NOP	
L__ReadMSG409:
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
BEQ	R3, R2, L__ReadMSG410
NOP	
J	L_ReadMSG138
NOP	
L__ReadMSG410:
J	___ReadMSG_next
NOP	
L_ReadMSG138:
SEH	R3, R4
ORI	R2, R0, 10
BEQ	R3, R2, L__ReadMSG411
NOP	
J	L_ReadMSG140
NOP	
L__ReadMSG411:
J	___ReadMSG_next
NOP	
L_ReadMSG140:
SEH	R3, R4
ORI	R2, R0, 11
BEQ	R3, R2, L__ReadMSG412
NOP	
J	L_ReadMSG142
NOP	
L__ReadMSG412:
J	___ReadMSG_next
NOP	
L_ReadMSG142:
SEH	R3, R4
ORI	R2, R0, 13
BEQ	R3, R2, L__ReadMSG413
NOP	
J	L_ReadMSG144
NOP	
L__ReadMSG413:
J	___ReadMSG_next
NOP	
L_ReadMSG144:
SEH	R3, R4
ORI	R2, R0, 14
BEQ	R3, R2, L__ReadMSG414
NOP	
J	L_ReadMSG146
NOP	
L__ReadMSG414:
J	___ReadMSG_next
NOP	
L_ReadMSG146:
SEH	R3, R4
ORI	R2, R0, 16
BEQ	R3, R2, L__ReadMSG415
NOP	
J	L_ReadMSG148
NOP	
L__ReadMSG415:
SEH	R3, R4
ORI	R2, R0, 16
BEQ	R3, R2, L__ReadMSG416
NOP	
J	L__ReadMSG289
NOP	
L__ReadMSG416:
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
BNE	R2, R0, L__ReadMSG418
NOP	
J	L__ReadMSG288
NOP	
L__ReadMSG418:
; res end address is: 16 (R4)
L__ReadMSG287:
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 11
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
ORI	R2, R0, 11
J	L_end_ReadMSG
NOP	
L__ReadMSG289:
; res start address is: 16 (R4)
L__ReadMSG288:
J	L_ReadMSG152
NOP	
L_ReadMSG148:
SEH	R3, R4
ORI	R2, R0, 17
BEQ	R3, R2, L__ReadMSG419
NOP	
J	L_ReadMSG153
NOP	
L__ReadMSG419:
SEH	R3, R4
ORI	R2, R0, 17
BEQ	R3, R2, L__ReadMSG420
NOP	
J	L__ReadMSG291
NOP	
L__ReadMSG420:
LBU	R2, Offset(_SimVars+4)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__ReadMSG421
NOP	
J	L__ReadMSG290
NOP	
L__ReadMSG421:
L__ReadMSG286:
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
LBU	R2, Offset(_SimVars+4)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SimVars+4)(GP)
J	L_ReadMSG157
NOP	
L__ReadMSG291:
L__ReadMSG290:
SEH	R3, R4
ORI	R2, R0, 17
BEQ	R3, R2, L__ReadMSG422
NOP	
J	L__ReadMSG293
NOP	
L__ReadMSG422:
LBU	R2, Offset(_SimVars+4)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__ReadMSG424
NOP	
J	L__ReadMSG292
NOP	
L__ReadMSG424:
; res end address is: 16 (R4)
L__ReadMSG285:
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 14
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
ORI	R2, R0, 14
J	L_end_ReadMSG
NOP	
L__ReadMSG293:
; res start address is: 16 (R4)
L__ReadMSG292:
J	___ReadMSG_next
NOP	
L_ReadMSG157:
J	L_ReadMSG162
NOP	
L_ReadMSG153:
SEH	R3, R4
ORI	R2, R0, 18
BEQ	R3, R2, L__ReadMSG425
NOP	
J	L_ReadMSG163
NOP	
L__ReadMSG425:
LBU	R2, Offset(_SimVars+4)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__ReadMSG427
NOP	
J	L__ReadMSG296
NOP	
L__ReadMSG427:
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
BNE	R2, R0, L__ReadMSG429
NOP	
J	L__ReadMSG295
NOP	
L__ReadMSG429:
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
BNE	R2, R0, L__ReadMSG431
NOP	
J	L__ReadMSG294
NOP	
L__ReadMSG431:
; res end address is: 16 (R4)
J	L_ReadMSG168
NOP	
L__ReadMSG295:
; res start address is: 16 (R4)
L__ReadMSG294:
L__ReadMSG283:
LBU	R2, Offset(_SimVars+4)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_SimVars+4)(GP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SH	R4, 16(SP)
SH	R25, 18(SP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+38)
ORI	R2, R2, lo_addr(_SF+38)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_42_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_42_Sim800+0)
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
L_ReadMSG168:
L__ReadMSG296:
LBU	R2, Offset(_SimVars+4)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__ReadMSG432
NOP	
J	L_ReadMSG170
NOP	
L__ReadMSG432:
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 15
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
ORI	R2, R0, 15
J	L_end_ReadMSG
NOP	
L_ReadMSG170:
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 13
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
ORI	R2, R0, 13
J	L_end_ReadMSG
NOP	
L_ReadMSG163:
; res start address is: 16 (R4)
SEH	R3, R4
ORI	R2, R0, 19
BEQ	R3, R2, L__ReadMSG433
NOP	
J	L_ReadMSG173
NOP	
L__ReadMSG433:
J	___ReadMSG_next
NOP	
L_ReadMSG173:
SEH	R3, R4
ORI	R2, R0, 20
BEQ	R3, R2, L__ReadMSG434
NOP	
J	L_ReadMSG175
NOP	
L__ReadMSG434:
J	___ReadMSG_next
NOP	
; res end address is: 16 (R4)
L_ReadMSG175:
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
ORI	R2, R0, 12
J	L_end_ReadMSG
NOP	
L_ReadMSG162:
; res start address is: 16 (R4)
L_ReadMSG152:
___ReadMSG_next:
SH	R25, 16(SP)
; res end address is: 16 (R4)
SEH	R25, R4
JAL	_TestRecievedSMS+0
NOP	
LH	R25, 16(SP)
L_ReadMSG137:
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
LUI	R2, hi_addr(?lstr_43_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_43_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R2, SP, 14
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_44_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_44_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 12(SP)
J	L_TestRecievedSMS177
NOP	
L_TestRecievedSMS179:
MOVZ	R26, R0, R0
ORI	R25, R0, 7
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS178
NOP	
L_TestRecievedSMS180:
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS178
NOP	
L_TestRecievedSMS181:
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS178
NOP	
L_TestRecievedSMS182:
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS178
NOP	
L_TestRecievedSMS183:
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS178
NOP	
L_TestRecievedSMS184:
MOVZ	R26, R0, R0
ORI	R25, R0, 8
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS178
NOP	
L_TestRecievedSMS185:
MOVZ	R26, R0, R0
ORI	R25, R0, 6
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS178
NOP	
L_TestRecievedSMS186:
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS178
NOP	
L_TestRecievedSMS187:
JAL	_GetValuesFromFlash+0
NOP	
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__TestRecievedSMS437
NOP	
J	L_TestRecievedSMS188
NOP	
L__TestRecievedSMS437:
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
L_TestRecievedSMS188:
JAL	_WriteToFlashTemp+0
NOP	
MOVZ	R25, R0, R0
JAL	_Write_Thresholds+0
NOP	
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_45_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_45_Sim800+0)
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
J	L_TestRecievedSMS178
NOP	
L_TestRecievedSMS189:
ORI	R2, R0, 5
SH	R2, Offset(_SimVars+2)(GP)
SH	R0, Offset(_T0_SP+6)(GP)
SH	R0, Offset(_T0_SP+4)(GP)
SH	R0, Offset(_T0_SP+2)(GP)
MOVZ	R26, R0, R0
ORI	R25, R0, 9
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS178
NOP	
L_TestRecievedSMS190:
ORI	R2, R0, 3
SH	R2, Offset(_SimVars+2)(GP)
MOVZ	R26, R0, R0
ORI	R25, R0, 10
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS178
NOP	
L_TestRecievedSMS191:
MOVZ	R26, R0, R0
ORI	R25, R0, 16
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS178
NOP	
L_TestRecievedSMS192:
MOVZ	R26, R0, R0
ORI	R25, R0, 17
JAL	_SendSMS+0
NOP	
J	L_TestRecievedSMS178
NOP	
L_TestRecievedSMS193:
J	L_TestRecievedSMS178
NOP	
L_TestRecievedSMS177:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__TestRecievedSMS439
NOP	
J	L_TestRecievedSMS179
NOP	
L__TestRecievedSMS439:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__TestRecievedSMS441
NOP	
J	L_TestRecievedSMS180
NOP	
L__TestRecievedSMS441:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__TestRecievedSMS443
NOP	
J	L_TestRecievedSMS181
NOP	
L__TestRecievedSMS443:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__TestRecievedSMS445
NOP	
J	L_TestRecievedSMS182
NOP	
L__TestRecievedSMS445:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__TestRecievedSMS447
NOP	
J	L_TestRecievedSMS183
NOP	
L__TestRecievedSMS447:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__TestRecievedSMS449
NOP	
J	L_TestRecievedSMS184
NOP	
L__TestRecievedSMS449:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__TestRecievedSMS451
NOP	
J	L_TestRecievedSMS185
NOP	
L__TestRecievedSMS451:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__TestRecievedSMS453
NOP	
J	L_TestRecievedSMS186
NOP	
L__TestRecievedSMS453:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__TestRecievedSMS455
NOP	
J	L_TestRecievedSMS187
NOP	
L__TestRecievedSMS455:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__TestRecievedSMS457
NOP	
J	L_TestRecievedSMS189
NOP	
L__TestRecievedSMS457:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__TestRecievedSMS459
NOP	
J	L_TestRecievedSMS190
NOP	
L__TestRecievedSMS459:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L__TestRecievedSMS461
NOP	
J	L_TestRecievedSMS191
NOP	
L__TestRecievedSMS461:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__TestRecievedSMS463
NOP	
J	L_TestRecievedSMS192
NOP	
L__TestRecievedSMS463:
J	L_TestRecievedSMS193
NOP	
L_TestRecievedSMS178:
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
LUI	R2, hi_addr(?lstr_46_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_46_Sim800+0)
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
LUI	R2, hi_addr(?lstr_47_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_47_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 4(SP)
L_RemoveSMSText194:
SH	R25, 4(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_48_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_48_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R23, SP, 6
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr49_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr49_Sim800+0)
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
L_RemoveSMSText197:
ADDIU	R24, R24, -1
BNE	R24, R0, L_RemoveSMSText197
NOP	
JAL	_RingToTempBuf+0
NOP	
ADDIU	R2, R25, -1
SEH	R25, R2
SEH	R2, R2
SLTI	R2, R2, 1
BNE	R2, R0, L__RemoveSMSText465
NOP	
J	L_RemoveSMSText194
NOP	
L__RemoveSMSText465:
SEH	R2, R25
L_end_RemoveSMSText:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _RemoveSMSText
_Test_Update_ThingSpeak:
ADDIU	SP, SP, -20
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R25, 16(SP)
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
JAL	_TCS3472_CalcHSL+0
NOP	
LW	R25, 16(SP)
MOVZ	R27, R25, R0
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
ORI	R2, R0, 2
L_end_Test_Update_ThingSpeak:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
ADDIU	SP, SP, -416
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R2, SP, 28
SW	R27, 16(SP)
SW	R26, 20(SP)
SW	R25, 24(SP)
ORI	R27, R0, 200
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LW	R25, 24(SP)
LW	R26, 20(SP)
LW	R27, 16(SP)
LHU	R2, 0(R25)
SW	R26, 16(SP)
SW	R25, 20(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_50_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_50_Sim800+0)
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
LUI	R2, hi_addr(?lstr_51_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_51_Sim800+0)
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
LUI	R2, hi_addr(?lstr_52_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_52_Sim800+0)
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
LUI	R2, hi_addr(?lstr_53_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_53_Sim800+0)
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
LUI	R2, hi_addr(?lstr_54_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_54_Sim800+0)
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
LUI	R2, hi_addr(?lstr_55_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_55_Sim800+0)
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
LUI	R2, hi_addr(?lstr_56_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_56_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtB_Scl+0)
ORI	R2, R2, lo_addr(_txtB_Scl+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R26, 16(SP)
ADDIU	R2, R26, 16
LW	R2, 0(R2)
SW	R26, 16(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_57_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_57_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtHUE+0)
ORI	R2, R2, lo_addr(_txtHUE+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R26, 16(SP)
ADDIU	R2, R26, 20
LW	R2, 0(R2)
SW	R26, 16(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_58_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_58_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtSAT+0)
ORI	R2, R2, lo_addr(_txtSAT+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R26, 16(SP)
ADDIU	R2, R26, 24
LW	R2, 0(R2)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_59_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_59_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtLUM+0)
ORI	R2, R2, lo_addr(_txtLUM+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	SP, SP, -12
SW	R27, 8(SP)
LUI	R2, hi_addr(?lstr_60_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_60_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtDegC+0)
ORI	R2, R2, lo_addr(_txtDegC+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R2, SP, 28
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
ADDIU	R3, SP, 28
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
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field1+0)
ORI	R26, R26, lo_addr(_field1+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtR_Scl+0)
ORI	R25, R25, lo_addr(_txtR_Scl+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtR_Scl+0)
ORI	R26, R26, lo_addr(_txtR_Scl+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field2+0)
ORI	R25, R25, lo_addr(_field2+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field2+0)
ORI	R26, R26, lo_addr(_field2+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtG_Scl+0)
ORI	R25, R25, lo_addr(_txtG_Scl+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtG_Scl+0)
ORI	R26, R26, lo_addr(_txtG_Scl+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field3+0)
ORI	R25, R25, lo_addr(_field3+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field3+0)
ORI	R26, R26, lo_addr(_field3+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtB_Scl+0)
ORI	R25, R25, lo_addr(_txtB_Scl+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtB_Scl+0)
ORI	R26, R26, lo_addr(_txtB_Scl+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field4+0)
ORI	R25, R25, lo_addr(_field4+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field4+0)
ORI	R26, R26, lo_addr(_field4+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtHUE+0)
ORI	R25, R25, lo_addr(_txtHUE+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtHUE+0)
ORI	R26, R26, lo_addr(_txtHUE+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field5+0)
ORI	R25, R25, lo_addr(_field5+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field5+0)
ORI	R26, R26, lo_addr(_field5+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtSAT+0)
ORI	R25, R25, lo_addr(_txtSAT+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtSAT+0)
ORI	R26, R26, lo_addr(_txtSAT+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field6+0)
ORI	R25, R25, lo_addr(_field6+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field6+0)
ORI	R26, R26, lo_addr(_field6+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtLUM+0)
ORI	R25, R25, lo_addr(_txtLUM+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtLUM+0)
ORI	R26, R26, lo_addr(_txtLUM+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field7+0)
ORI	R25, R25, lo_addr(_field7+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field7+0)
ORI	R26, R26, lo_addr(_field7+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtC+0)
ORI	R25, R25, lo_addr(_txtC+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtC+0)
ORI	R26, R26, lo_addr(_txtC+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_field8+0)
ORI	R25, R25, lo_addr(_field8+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field8+0)
ORI	R26, R26, lo_addr(_field8+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
LUI	R25, hi_addr(_txtDegC+0)
ORI	R25, R25, lo_addr(_txtDegC+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtDegC+0)
ORI	R26, R26, lo_addr(_txtDegC+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
ADDIU	R2, SP, 28
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_61_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_61_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R23, SP, 228
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr62_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr62_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 228
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
L_SendData199:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData199
NOP	
NOP	
NOP	
ADDIU	R23, SP, 239
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr63_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr63_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 239
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
L_SendData201:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData201
NOP	
NOP	
ADDIU	R23, SP, 248
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr64_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr64_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 248
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
ADDIU	R23, SP, 257
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr65_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr65_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 257
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
L_SendData205:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData205
NOP	
NOP	
ADDIU	R23, SP, 267
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr66_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr66_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 267
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
ADDIU	R23, SP, 278
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr67_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr67_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 278
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
L_SendData209:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData209
NOP	
NOP	
ADDIU	R23, SP, 291
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr68_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr68_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 291
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
L_SendData211:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData211
NOP	
NOP	
ADDIU	R23, SP, 303
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr69_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr69_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 303
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_UART2_Write_Text+0
NOP	
ADDIU	R23, SP, 312
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr70_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr70_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 312
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
L_SendData213:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData213
NOP	
NOP	
ADDIU	R23, SP, 321
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr71_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr71_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 321
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
L_SendData215:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData215
NOP	
NOP	
ADDIU	R23, SP, 330
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr72_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr72_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 330
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
L_SendData217:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData217
NOP	
ADDIU	R23, SP, 339
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr73_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr73_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 339
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
L_SendData219:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData219
NOP	
NOP	
ADDIU	R23, SP, 352
ADDIU	R22, R23, 42
LUI	R24, hi_addr(?ICS?lstr74_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr74_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 352
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
L_SendData221:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData221
NOP	
ADDIU	R23, SP, 394
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr75_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr75_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 394
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
L_SendData223:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData223
NOP	
ADDIU	R2, SP, 28
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
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData225:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData225
NOP	
NOP	
ADDIU	R23, SP, 405
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr76_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr76_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 405
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
L_SendData227:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData227
NOP	
NOP	
NOP	
L_end_SendData:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 416
JR	RA
NOP	
; end of _SendData
_SignalStrength:
ADDIU	SP, SP, -24
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_clr_str_arrays+0
NOP	
ORI	R30, R0, 65
SB	R30, 16(SP)
ORI	R30, R0, 84
SB	R30, 17(SP)
ORI	R30, R0, 43
SB	R30, 18(SP)
ORI	R30, R0, 67
SB	R30, 19(SP)
ORI	R30, R0, 83
SB	R30, 20(SP)
ORI	R30, R0, 81
SB	R30, 21(SP)
MOVZ	R30, R0, R0
SB	R30, 22(SP)
ADDIU	R2, SP, 16
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
LUI	R24, 101
ORI	R24, R24, 47530
L_SignalStrength229:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SignalStrength229
NOP	
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
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
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_SignalStrength231:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 10
BNE	R2, R0, L__SignalStrength469
NOP	
J	L_SignalStrength232
NOP	
L__SignalStrength469:
SEH	R3, R4
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
ADDU	R2, R2, R3
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BEQ	R2, R0, L__SignalStrength470
NOP	
J	L_SignalStrength234
NOP	
L__SignalStrength470:
SEH	R3, R4
; i end address is: 16 (R4)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
ADDU	R2, R2, R3
SB	R0, 0(R2)
J	L_SignalStrength232
NOP	
L_SignalStrength234:
; i start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
; i end address is: 16 (R4)
J	L_SignalStrength231
NOP	
L_SignalStrength232:
LBU	R25, Offset(_string+1)(GP)
JAL	_isdigit+0
NOP	
BNE	R2, R0, L__SignalStrength472
NOP	
J	L_SignalStrength235
NOP	
L__SignalStrength472:
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_atoi+0
NOP	
SH	R2, Offset(_SimVars+6)(GP)
J	L_SignalStrength236
NOP	
L_SignalStrength235:
SH	R0, Offset(_SimVars+6)(GP)
L_SignalStrength236:
LH	R25, Offset(_SimVars+6)(GP)
JAL	_PWM_SigStrength+0
NOP	
LH	R2, Offset(_SimVars+6)(GP)
L_end_SignalStrength:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _SignalStrength
_PWM_SigStrength:
ORI	R2, R0, 32776
SW	R2, Offset(T2CONCLR+0)(GP)
SEH	R2, R25
SLTI	R2, R2, 6
BNE	R2, R0, L__PWM_SigStrength474
NOP	
J	L_PWM_SigStrength237
NOP	
L__PWM_SigStrength474:
ORI	R2, R0, 46080
SW	R2, Offset(PR4+0)(GP)
ORI	R2, R0, 1220
SW	R2, Offset(PR5+0)(GP)
J	L_PWM_SigStrength238
NOP	
L_PWM_SigStrength237:
SEH	R2, R25
SLTI	R2, R2, 6
BEQ	R2, R0, L__PWM_SigStrength475
NOP	
J	L__PWM_SigStrength303
NOP	
L__PWM_SigStrength475:
SEH	R2, R25
SLTI	R2, R2, 11
BNE	R2, R0, L__PWM_SigStrength476
NOP	
J	L__PWM_SigStrength302
NOP	
L__PWM_SigStrength476:
L__PWM_SigStrength301:
ORI	R2, R0, 32256
SW	R2, Offset(PR4+0)(GP)
ORI	R2, R0, 854
SW	R2, Offset(PR5+0)(GP)
J	L_PWM_SigStrength242
NOP	
L__PWM_SigStrength303:
L__PWM_SigStrength302:
SEH	R2, R25
SLTI	R2, R2, 11
BEQ	R2, R0, L__PWM_SigStrength477
NOP	
J	L__PWM_SigStrength305
NOP	
L__PWM_SigStrength477:
SEH	R2, R25
SLTI	R2, R2, 16
BNE	R2, R0, L__PWM_SigStrength478
NOP	
J	L__PWM_SigStrength304
NOP	
L__PWM_SigStrength478:
L__PWM_SigStrength300:
ORI	R2, R0, 23040
SW	R2, Offset(PR4+0)(GP)
ORI	R2, R0, 610
SW	R2, Offset(PR5+0)(GP)
J	L_PWM_SigStrength246
NOP	
L__PWM_SigStrength305:
L__PWM_SigStrength304:
SEH	R2, R25
SLTI	R2, R2, 16
BEQ	R2, R0, L__PWM_SigStrength479
NOP	
J	L__PWM_SigStrength307
NOP	
L__PWM_SigStrength479:
SEH	R2, R25
SLTI	R2, R2, 22
BNE	R2, R0, L__PWM_SigStrength480
NOP	
J	L__PWM_SigStrength306
NOP	
L__PWM_SigStrength480:
L__PWM_SigStrength299:
ORI	R2, R0, 11520
SW	R2, Offset(PR4+0)(GP)
ORI	R2, R0, 305
SW	R2, Offset(PR5+0)(GP)
J	L_PWM_SigStrength250
NOP	
L__PWM_SigStrength307:
L__PWM_SigStrength306:
SEH	R2, R25
SLTI	R2, R2, 22
BEQ	R2, R0, L__PWM_SigStrength481
NOP	
J	L__PWM_SigStrength309
NOP	
L__PWM_SigStrength481:
SEH	R2, R25
SLTI	R2, R2, 26
BNE	R2, R0, L__PWM_SigStrength482
NOP	
J	L__PWM_SigStrength308
NOP	
L__PWM_SigStrength482:
L__PWM_SigStrength298:
ORI	R2, R0, 4608
SW	R2, Offset(PR4+0)(GP)
ORI	R2, R0, 122
SW	R2, Offset(PR5+0)(GP)
J	L_PWM_SigStrength254
NOP	
L__PWM_SigStrength309:
L__PWM_SigStrength308:
SEH	R2, R25
SLTI	R2, R2, 26
BEQ	R2, R0, L__PWM_SigStrength483
NOP	
J	L__PWM_SigStrength311
NOP	
L__PWM_SigStrength483:
SEH	R2, R25
SLTI	R2, R2, 30
BNE	R2, R0, L__PWM_SigStrength484
NOP	
J	L__PWM_SigStrength310
NOP	
L__PWM_SigStrength484:
L__PWM_SigStrength297:
ORI	R2, R0, 2304
SW	R2, Offset(PR4+0)(GP)
ORI	R2, R0, 61
SW	R2, Offset(PR5+0)(GP)
J	L_PWM_SigStrength258
NOP	
L__PWM_SigStrength311:
L__PWM_SigStrength310:
ORI	R2, R0, 14464
SW	R2, Offset(PR4+0)(GP)
ORI	R2, R0, 1
SW	R2, Offset(PR5+0)(GP)
L_PWM_SigStrength258:
L_PWM_SigStrength254:
L_PWM_SigStrength250:
L_PWM_SigStrength246:
L_PWM_SigStrength242:
L_PWM_SigStrength238:
SW	R0, Offset(TMR4+0)(GP)
SW	R0, Offset(TMR5+0)(GP)
ORI	R2, R0, 32776
SW	R2, Offset(T4CONSET+0)(GP)
LUI	R2, BitMask(T4IF_bit+0)
ORI	R2, R2, BitMask(T4IF_bit+0)
_SX	
LUI	R2, BitMask(T5IE_bit+0)
ORI	R2, R2, BitMask(T5IE_bit+0)
_SX	
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
L_TestForOK259:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TestForOK259
NOP	
JAL	_RingToTempBuf+0
NOP	
; lastMillis start address is: 16 (R4)
LW	R4, Offset(_TMR0+0)(GP)
ANDI	R2, R25, 255
BEQ	R2, R0, L__TestForOK486
NOP	
J	L_TestForOK261
NOP	
L__TestForOK486:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
L_TestForOK262:
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
BEQ	R2, R0, L__TestForOK487
NOP	
J	L_TestForOK263
NOP	
L__TestForOK487:
; lastMillis end address is: 20 (R5)
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK488
NOP	
J	L_TestForOK264
NOP	
L__TestForOK488:
; lastMillis end address is: 20 (R5)
J	L_TestForOK263
NOP	
L_TestForOK264:
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK262
NOP	
L_TestForOK263:
J	L_TestForOK265
NOP	
L_TestForOK261:
; lastMillis start address is: 16 (R4)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__TestForOK489
NOP	
J	L_TestForOK266
NOP	
L__TestForOK489:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
L_TestForOK267:
; lastMillis start address is: 20 (R5)
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
ADDIU	R23, SP, 12
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr79_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr79_Sim800+0)
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
BEQ	R2, R0, L__TestForOK490
NOP	
J	L_TestForOK268
NOP	
L__TestForOK490:
; lastMillis end address is: 20 (R5)
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK491
NOP	
J	L_TestForOK269
NOP	
L__TestForOK491:
; lastMillis end address is: 20 (R5)
J	L_TestForOK268
NOP	
L_TestForOK269:
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK267
NOP	
L_TestForOK268:
L_TestForOK266:
L_TestForOK265:
L_end_TestForOK:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _TestForOK
