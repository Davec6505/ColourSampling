_InitString:
ADDIU	SP, SP, -1356
; su_addr start address is: 8 (R2)
MOVZ	R2, R30, R0
; su_addr end address is: 8 (R2)
L_end_InitString:
ADDIU	SP, SP, 1356
JR	RA
NOP	
; end of _InitString
_DoStrings:
ADDIU	SP, SP, -96
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 29
ADDIU	R22, R23, 64
LUI	R24, hi_addr(?ICSDoStrings_conf_L0+0)
ORI	R24, R24, lo_addr(?ICSDoStrings_conf_L0+0)
JAL	___CC2DW+0
NOP	
SH	R25, 16(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_clr_str_arrays+0
NOP	
LH	R25, 16(SP)
ADDIU	R2, SP, 29
SEH	R27, R25
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
ADDIU	R2, SP, 29
MOVZ	R25, R2, R0
JAL	_setstr+0
NOP	
ORI	R26, R0, 43
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__DoStrings100
NOP	
J	L_DoStrings0
NOP	
L__DoStrings100:
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_StrChecker+0
NOP	
; res1 start address is: 20 (R5)
SEH	R5, R2
; res1 end address is: 20 (R5)
J	L_DoStrings1
NOP	
L_DoStrings0:
; res1 start address is: 20 (R5)
ORI	R5, R0, 22
; res1 end address is: 20 (R5)
L_DoStrings1:
; res1 start address is: 20 (R5)
ORI	R27, R0, 64
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memset+0
NOP	
ADDIU	R3, SP, 18
ADDIU	SP, SP, -12
SH	R5, 8(SP)
; res1 end address is: 20 (R5)
LUI	R2, hi_addr(?lstr_25_String+0)
ORI	R2, R2, lo_addr(?lstr_25_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R2, SP, 18
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
ORI	R30, R0, 58
SB	R30, 24(SP)
MOVZ	R30, R0, R0
SB	R30, 25(SP)
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_testStrings+0
NOP	
ORI	R30, R0, 13
SB	R30, 26(SP)
ORI	R30, R0, 10
SB	R30, 27(SP)
MOVZ	R30, R0, R0
SB	R30, 28(SP)
ADDIU	R2, SP, 26
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
L_DoStrings2:
SH	R25, 16(SP)
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
LH	R25, 16(SP)
BEQ	R2, R0, L__DoStrings101
NOP	
J	L_DoStrings3
NOP	
L__DoStrings101:
J	L_DoStrings2
NOP	
L_DoStrings3:
MOVZ	R2, R0, R0
L_end_DoStrings:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 96
JR	RA
NOP	
; end of _DoStrings
_clr_str_arrays:
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_clr_str_arrays4:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__clr_str_arrays103
NOP	
J	L_clr_str_arrays5
NOP	
L__clr_str_arrays103:
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_clr_str_arrays7:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 64
BNE	R2, R0, L__clr_str_arrays104
NOP	
J	L_clr_str_arrays8
NOP	
L__clr_str_arrays104:
SEH	R2, R4
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R5
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R5, 1
SEH	R5, R2
; j end address is: 20 (R5)
J	L_clr_str_arrays7
NOP	
L_clr_str_arrays8:
ADDIU	R2, R4, 1
SEH	R4, R2
; i end address is: 16 (R4)
J	L_clr_str_arrays4
NOP	
L_clr_str_arrays5:
L_end_clr_str_arrays:
JR	RA
NOP	
; end of _clr_str_arrays
_setstr:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_setstr10:
; i start address is: 20 (R5)
JAL	_strlen+0
NOP	
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__setstr106
NOP	
J	L_setstr11
NOP	
L__setstr106:
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__setstr107
NOP	
J	L_setstr13
NOP	
L__setstr107:
J	L_setstr11
NOP	
L_setstr13:
ADDIU	R2, R5, 1
SEH	R5, R2
J	L_setstr10
NOP	
L_setstr11:
SEH	R2, R5
; i end address is: 20 (R5)
ADDU	R2, R25, R2
SB	R0, 0(R2)
MOVZ	R2, R25, R0
L_end_setstr:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _setstr
_strsplit:
; lasti start address is: 24 (R6)
MOVZ	R6, R0, R0
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
L_strsplit14:
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
; lasti start address is: 24 (R6)
SEH	R2, R4
SLTI	R2, R2, 250
BNE	R2, R0, L__strsplit109
NOP	
J	L_strsplit15
NOP	
L__strsplit109:
SUBU	R2, R4, R6
; err start address is: 32 (R8)
SEH	R8, R2
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R26, 255
BNE	R3, R2, L__strsplit111
NOP	
J	L__strsplit94
NOP	
L__strsplit111:
SEH	R2, R8
; err end address is: 32 (R8)
SLTI	R2, R2, 63
BNE	R2, R0, L__strsplit112
NOP	
J	L__strsplit93
NOP	
L__strsplit112:
J	L_strsplit19
NOP	
; lasti end address is: 24 (R6)
L__strsplit94:
L__strsplit93:
SEH	R2, R5
SLL	R3, R2, 6
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
ADDU	R3, R2, R3
SEH	R2, R7
; ii end address is: 28 (R7)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R5, 1
SEH	R5, R2
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
; lasti start address is: 24 (R6)
SEH	R6, R4
J	L_strsplit16
NOP	
L_strsplit19:
SEH	R2, R5
SLL	R3, R2, 6
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
ADDU	R3, R2, R3
SEH	R2, R7
ADDU	R3, R3, R2
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
ADDIU	R2, R7, 1
SEH	R7, R2
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit113
NOP	
J	L_strsplit21
NOP	
L__strsplit113:
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
J	L_strsplit15
NOP	
L_strsplit21:
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; lasti start address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
L_strsplit16:
; lasti end address is: 24 (R6)
; lasti start address is: 24 (R6)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
ADDIU	R2, R4, 1
SEH	R4, R2
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
J	L_strsplit14
NOP	
L_strsplit15:
SEH	R2, R5
; kk end address is: 20 (R5)
L_end_strsplit:
JR	RA
NOP	
; end of _strsplit
_findnumber:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
SW	R26, 4(SP)
JAL	_strlen+0
NOP	
SW	R25, 8(SP)
SEH	R25, R2
JAL	_Malloc+0
NOP	
LW	R25, 8(SP)
; temp start address is: 32 (R8)
MOVZ	R8, R2, R0
; i start address is: 36 (R9)
MOVZ	R9, R0, R0
; temp end address is: 32 (R8)
; i end address is: 36 (R9)
L_findnumber22:
; i start address is: 36 (R9)
; temp start address is: 32 (R8)
JAL	_strlen+0
NOP	
SEH	R3, R9
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__findnumber115
NOP	
J	L_findnumber23
NOP	
L__findnumber115:
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 42
BEQ	R2, R0, L__findnumber116
NOP	
J	L__findnumber97
NOP	
L__findnumber116:
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 64
BNE	R2, R0, L__findnumber117
NOP	
J	L__findnumber96
NOP	
L__findnumber117:
L__findnumber95:
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
L__findnumber97:
L__findnumber96:
ADDIU	R2, R9, 1
SEH	R9, R2
J	L_findnumber22
NOP	
L_findnumber23:
SEH	R2, R9
; i end address is: 36 (R9)
ADDU	R2, R8, R2
SB	R0, 0(R2)
SW	R25, 8(SP)
ORI	R26, R0, 4
MOVZ	R25, R8, R0
JAL	_Free+0
NOP	
LW	R25, 8(SP)
MOVZ	R2, R8, R0
; temp end address is: 32 (R8)
L_end_findnumber:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _findnumber
_StrChecker:
ADDIU	SP, SP, -16
SW	RA, 0(SP)
SW	R26, 4(SP)
SW	R27, 8(SP)
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
EXT	R2, R2, BitPos(StrChecker_once_L0+0), 1
BEQ	R2, R0, L__StrChecker119
NOP	
J	L_StrChecker28
NOP	
L__StrChecker119:
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
ORI	R2, R2, BitMask(StrChecker_once_L0+0)
SB	R2, Offset(StrChecker_once_L0+0)(GP)
ORI	R2, R0, 22
SH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
L_StrChecker28:
JAL	_strlen+0
NOP	
; length start address is: 20 (R5)
SEH	R5, R2
SEH	R2, R2
SLTI	R2, R2, 5
BNE	R2, R0, L__StrChecker120
NOP	
J	L_StrChecker29
NOP	
L__StrChecker120:
; length end address is: 20 (R5)
ORI	R2, R0, 21
J	L_end_StrChecker
NOP	
L_StrChecker29:
; i start address is: 24 (R6)
; length start address is: 20 (R5)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_StrChecker30:
; i start address is: 24 (R6)
; length start address is: 20 (R5)
; length end address is: 20 (R5)
SEH	R3, R6
LH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__StrChecker121
NOP	
J	L_StrChecker31
NOP	
L__StrChecker121:
; length end address is: 20 (R5)
; length start address is: 20 (R5)
SEH	R2, R6
SLL	R3, R2, 2
LUI	R2, hi_addr(_com+0)
ORI	R2, R2, lo_addr(_com+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
SW	R25, 12(SP)
SEH	R27, R5
MOVZ	R26, R2, R0
JAL	_strncmp+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BEQ	R2, R0, L__StrChecker122
NOP	
J	L_StrChecker33
NOP	
L__StrChecker122:
; length end address is: 20 (R5)
J	L_StrChecker31
NOP	
L_StrChecker33:
; length start address is: 20 (R5)
ADDIU	R2, R6, 1
SEH	R6, R2
; length end address is: 20 (R5)
J	L_StrChecker30
NOP	
L_StrChecker31:
SEH	R2, R6
; i end address is: 24 (R6)
L_end_StrChecker:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _StrChecker
_RemoveWhiteSpace:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
; j start address is: 24 (R6)
MOVZ	R6, R0, R0
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 24 (R6)
; i end address is: 20 (R5)
L_RemoveWhiteSpace34:
; i start address is: 20 (R5)
; j start address is: 24 (R6)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__RemoveWhiteSpace124
NOP	
J	L_RemoveWhiteSpace35
NOP	
L__RemoveWhiteSpace124:
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 32
BEQ	R3, R2, L__RemoveWhiteSpace125
NOP	
J	L_RemoveWhiteSpace37
NOP	
L__RemoveWhiteSpace125:
J	L_RemoveWhiteSpace36
NOP	
L_RemoveWhiteSpace37:
SEH	R3, R6
LW	R2, 4(SP)
ADDU	R3, R2, R3
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
ADDIU	R2, R6, 1
SEH	R6, R2
; j end address is: 24 (R6)
L_RemoveWhiteSpace36:
; j start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
; j end address is: 24 (R6)
; i end address is: 20 (R5)
J	L_RemoveWhiteSpace34
NOP	
L_RemoveWhiteSpace35:
LW	R2, 4(SP)
L_end_RemoveWhiteSpace:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _RemoveWhiteSpace
_RemoveChars:
ADDIU	SP, SP, -20
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 400
JAL	_Malloc+0
NOP	
LW	R25, 12(SP)
; temp start address is: 24 (R6)
MOVZ	R6, R2, R0
ANDI	R3, R26, 255
ORI	R2, R0, 2
BNE	R3, R2, L__RemoveChars128
NOP	
J	L_RemoveChars38
NOP	
L__RemoveChars128:
; temp end address is: 24 (R6)
SW	R25, 12(SP)
JAL	_strchr+0
NOP	
LW	R25, 12(SP)
; temp start address is: 24 (R6)
MOVZ	R6, R2, R0
ADDIU	R2, R2, 1
MOVZ	R26, R2, R0
JAL	_strcpy+0
NOP	
MOVZ	R8, R6, R0
J	L_RemoveChars39
NOP	
L_RemoveChars38:
SW	R25, 12(SP)
MOVZ	R25, R6, R0
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
ADDIU	R2, R2, 1
SB	R27, 12(SP)
SW	R25, 16(SP)
SEH	R27, R2
MOVZ	R26, R25, R0
MOVZ	R25, R6, R0
JAL	_strncpy+0
NOP	
; temp end address is: 24 (R6)
LW	R25, 16(SP)
LBU	R27, 12(SP)
MOVZ	R8, R6, R0
L_RemoveChars39:
; temp start address is: 32 (R8)
; i start address is: 36 (R9)
MOVZ	R9, R0, R0
; temp end address is: 32 (R8)
; i end address is: 36 (R9)
L_RemoveChars40:
; i start address is: 36 (R9)
; temp start address is: 32 (R8)
SW	R25, 12(SP)
MOVZ	R25, R8, R0
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
ADDIU	R2, R2, 1
SEH	R3, R9
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__RemoveChars129
NOP	
J	L_RemoveChars41
NOP	
L__RemoveChars129:
SEH	R2, R9
ADDU	R2, R8, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BEQ	R3, R2, L__RemoveChars130
NOP	
J	L_RemoveChars43
NOP	
L__RemoveChars130:
J	L_RemoveChars41
NOP	
L_RemoveChars43:
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
ADDIU	R2, R9, 1
SEH	R9, R2
J	L_RemoveChars40
NOP	
L_RemoveChars41:
SEH	R2, R9
; i end address is: 36 (R9)
ADDU	R2, R8, R2
SB	R0, 0(R2)
ORI	R26, R0, 400
MOVZ	R25, R8, R0
JAL	_Free+0
NOP	
MOVZ	R2, R8, R0
; temp end address is: 32 (R8)
L_end_RemoveChars:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _RemoveChars
_WriteData:
ADDIU	SP, SP, -20
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R25, 16(SP)
ORI	R27, R0, 64
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memset+0
NOP	
LW	R25, 16(SP)
JAL	_strlen+0
NOP	
SEH	R27, R2
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncpy+0
NOP	
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
L_end_WriteData:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _WriteData
_Read_Send_AllColour:
ADDIU	SP, SP, -164
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SB	R25, 12(SP)
ORI	R25, R0, 2
JAL	_PWM_Start+0
NOP	
LUI	R24, 203
ORI	R24, R24, 29524
L_Read_Send_AllColour44:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Read_Send_AllColour44
NOP	
NOP	
NOP	
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 12(SP)
BNE	R25, R0, L__Read_Send_AllColour134
NOP	
J	L_Read_Send_AllColour46
NOP	
L__Read_Send_AllColour134:
SB	R25, 12(SP)
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_GetScaledValues+0
NOP	
LB	R25, 12(SP)
L_Read_Send_AllColour46:
BEQ	R25, R0, L__Read_Send_AllColour135
NOP	
J	L_Read_Send_AllColour47
NOP	
L__Read_Send_AllColour135:
ADDIU	R23, SP, 92
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr28_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr28_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 92
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_29_String+0)
ORI	R2, R2, lo_addr(?lstr_29_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
J	L_Read_Send_AllColour48
NOP	
L_Read_Send_AllColour47:
ADDIU	R23, SP, 115
ADDIU	R22, R23, 21
LUI	R24, hi_addr(?ICS?lstr30_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr30_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 115
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
ADDIU	R3, SP, 13
LW	R2, Offset(_FltData+0)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_31_String+0)
ORI	R2, R2, lo_addr(?lstr_31_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
L_Read_Send_AllColour48:
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 136(SP)
ORI	R30, R0, 124
SB	R30, 137(SP)
ORI	R30, R0, 124
SB	R30, 138(SP)
ORI	R30, R0, 32
SB	R30, 139(SP)
MOVZ	R30, R0, R0
SB	R30, 140(SP)
ADDIU	R3, SP, 136
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
BEQ	R25, R0, L__Read_Send_AllColour136
NOP	
J	L_Read_Send_AllColour49
NOP	
L__Read_Send_AllColour136:
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+2)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_33_String+0)
ORI	R2, R2, lo_addr(?lstr_33_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
J	L_Read_Send_AllColour50
NOP	
L_Read_Send_AllColour49:
ADDIU	R3, SP, 13
LW	R2, Offset(_FltData+4)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_34_String+0)
ORI	R2, R2, lo_addr(?lstr_34_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
L_Read_Send_AllColour50:
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 141(SP)
ORI	R30, R0, 124
SB	R30, 142(SP)
ORI	R30, R0, 32
SB	R30, 143(SP)
MOVZ	R30, R0, R0
SB	R30, 144(SP)
ADDIU	R3, SP, 141
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
BEQ	R25, R0, L__Read_Send_AllColour137
NOP	
J	L_Read_Send_AllColour51
NOP	
L__Read_Send_AllColour137:
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+4)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_36_String+0)
ORI	R2, R2, lo_addr(?lstr_36_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
J	L_Read_Send_AllColour52
NOP	
L_Read_Send_AllColour51:
ADDIU	R3, SP, 13
LW	R2, Offset(_FltData+8)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_37_String+0)
ORI	R2, R2, lo_addr(?lstr_37_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
L_Read_Send_AllColour52:
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 145(SP)
ORI	R30, R0, 124
SB	R30, 146(SP)
ORI	R30, R0, 32
SB	R30, 147(SP)
MOVZ	R30, R0, R0
SB	R30, 148(SP)
ADDIU	R3, SP, 145
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
BEQ	R25, R0, L__Read_Send_AllColour138
NOP	
J	L_Read_Send_AllColour53
NOP	
L__Read_Send_AllColour138:
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_39_String+0)
ORI	R2, R2, lo_addr(?lstr_39_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 149(SP)
ORI	R30, R0, 124
SB	R30, 150(SP)
ORI	R30, R0, 124
SB	R30, 151(SP)
ORI	R30, R0, 32
SB	R30, 152(SP)
MOVZ	R30, R0, R0
SB	R30, 153(SP)
ADDIU	R3, SP, 149
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_C2RGB_Error+0
NOP	
ADDIU	R3, SP, 13
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_41_String+0)
ORI	R2, R2, lo_addr(?lstr_41_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 154(SP)
ORI	R30, R0, 124
SB	R30, 155(SP)
ORI	R30, R0, 124
SB	R30, 156(SP)
ORI	R30, R0, 32
SB	R30, 157(SP)
ORI	R30, R0, 13
SB	R30, 158(SP)
ORI	R30, R0, 10
SB	R30, 159(SP)
MOVZ	R30, R0, R0
SB	R30, 160(SP)
ADDIU	R3, SP, 154
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
J	L_Read_Send_AllColour54
NOP	
L_Read_Send_AllColour53:
ORI	R30, R0, 13
SB	R30, 161(SP)
ORI	R30, R0, 10
SB	R30, 162(SP)
MOVZ	R30, R0, R0
SB	R30, 163(SP)
ADDIU	R3, SP, 161
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
L_Read_Send_AllColour54:
ORI	R25, R0, 2
JAL	_PWM_Stop+0
NOP	
ADDIU	R2, SP, 28
L_end_Read_Send_AllColour:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 164
JR	RA
NOP	
; end of _Read_Send_AllColour
_Read_Send_OneColour:
ADDIU	SP, SP, -184
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SH	R25, 16(SP)
ORI	R25, R0, 2
JAL	_PWM_Start+0
NOP	
LH	R25, 16(SP)
LUI	R24, 203
ORI	R24, R24, 29524
L_Read_Send_OneColour55:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Read_Send_OneColour55
NOP	
NOP	
NOP	
J	L_Read_Send_OneColour57
NOP	
L_Read_Send_OneColour59:
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
ADDIU	R23, SP, 92
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr44_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr44_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 92
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
ADDIU	R3, SP, 18
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_45_String+0)
ORI	R2, R2, lo_addr(?lstr_45_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 18
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 100(SP)
ORI	R30, R0, 124
SB	R30, 101(SP)
ORI	R30, R0, 124
SB	R30, 102(SP)
ORI	R30, R0, 13
SB	R30, 103(SP)
ORI	R30, R0, 10
SB	R30, 104(SP)
MOVZ	R30, R0, R0
SB	R30, 105(SP)
ADDIU	R3, SP, 100
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
J	L_Read_Send_OneColour58
NOP	
L_Read_Send_OneColour60:
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
ADDIU	R23, SP, 106
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr47_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr47_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 106
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
ADDIU	R3, SP, 18
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_48_String+0)
ORI	R2, R2, lo_addr(?lstr_48_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 18
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 114(SP)
ORI	R30, R0, 124
SB	R30, 115(SP)
ORI	R30, R0, 124
SB	R30, 116(SP)
ORI	R30, R0, 13
SB	R30, 117(SP)
ORI	R30, R0, 10
SB	R30, 118(SP)
MOVZ	R30, R0, R0
SB	R30, 119(SP)
ADDIU	R3, SP, 114
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
J	L_Read_Send_OneColour58
NOP	
L_Read_Send_OneColour61:
ORI	R25, R0, 26
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
ADDIU	R23, SP, 120
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr50_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr50_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 120
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
ADDIU	R3, SP, 18
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_51_String+0)
ORI	R2, R2, lo_addr(?lstr_51_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 18
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 128(SP)
ORI	R30, R0, 124
SB	R30, 129(SP)
ORI	R30, R0, 124
SB	R30, 130(SP)
ORI	R30, R0, 13
SB	R30, 131(SP)
ORI	R30, R0, 10
SB	R30, 132(SP)
MOVZ	R30, R0, R0
SB	R30, 133(SP)
ADDIU	R3, SP, 128
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
J	L_Read_Send_OneColour58
NOP	
L_Read_Send_OneColour62:
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
ADDIU	R23, SP, 134
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr53_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr53_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 134
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
ADDIU	R3, SP, 18
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_54_String+0)
ORI	R2, R2, lo_addr(?lstr_54_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 18
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 142(SP)
ORI	R30, R0, 124
SB	R30, 143(SP)
ORI	R30, R0, 124
SB	R30, 144(SP)
ORI	R30, R0, 13
SB	R30, 145(SP)
ORI	R30, R0, 10
SB	R30, 146(SP)
MOVZ	R30, R0, R0
SB	R30, 147(SP)
ADDIU	R3, SP, 142
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
J	L_Read_Send_OneColour58
NOP	
L_Read_Send_OneColour63:
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LHU	R27, Offset(_RawData+6)(GP)
LHU	R26, Offset(_RawData+6)(GP)
LHU	R25, Offset(_RawData+2)(GP)
JAL	_TCS3472_CalcColTemp+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
ADDIU	R23, SP, 148
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr56_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr56_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 148
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
ADDIU	R3, SP, 18
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_57_String+0)
ORI	R2, R2, lo_addr(?lstr_57_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 18
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 156(SP)
ORI	R30, R0, 124
SB	R30, 157(SP)
ORI	R30, R0, 124
SB	R30, 158(SP)
ORI	R30, R0, 13
SB	R30, 159(SP)
ORI	R30, R0, 10
SB	R30, 160(SP)
MOVZ	R30, R0, R0
SB	R30, 161(SP)
ADDIU	R3, SP, 156
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
J	L_Read_Send_OneColour58
NOP	
L_Read_Send_OneColour64:
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LBU	R26, Offset(_it+0)(GP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_CalcColTemp_dn40+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
ADDIU	R23, SP, 162
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr59_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr59_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 162
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
ADDIU	R3, SP, 18
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_60_String+0)
ORI	R2, R2, lo_addr(?lstr_60_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 18
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 175(SP)
ORI	R30, R0, 124
SB	R30, 176(SP)
ORI	R30, R0, 124
SB	R30, 177(SP)
ORI	R30, R0, 13
SB	R30, 178(SP)
ORI	R30, R0, 10
SB	R30, 179(SP)
MOVZ	R30, R0, R0
SB	R30, 180(SP)
ADDIU	R3, SP, 175
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
J	L_Read_Send_OneColour58
NOP	
L_Read_Send_OneColour57:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Read_Send_OneColour141
NOP	
J	L_Read_Send_OneColour59
NOP	
L__Read_Send_OneColour141:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Read_Send_OneColour143
NOP	
J	L_Read_Send_OneColour60
NOP	
L__Read_Send_OneColour143:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Read_Send_OneColour145
NOP	
J	L_Read_Send_OneColour61
NOP	
L__Read_Send_OneColour145:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Read_Send_OneColour147
NOP	
J	L_Read_Send_OneColour62
NOP	
L__Read_Send_OneColour147:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Read_Send_OneColour149
NOP	
J	L_Read_Send_OneColour63
NOP	
L__Read_Send_OneColour149:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Read_Send_OneColour151
NOP	
J	L_Read_Send_OneColour64
NOP	
L__Read_Send_OneColour151:
L_Read_Send_OneColour58:
ORI	R25, R0, 2
JAL	_PWM_Stop+0
NOP	
ADDIU	R2, SP, 28
L_end_Read_Send_OneColour:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 184
JR	RA
NOP	
; end of _Read_Send_OneColour
_ReadHUE:
ADDIU	SP, SP, -160
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R25, R0, 2
JAL	_PWM_Start+0
NOP	
LUI	R24, 203
ORI	R24, R24, 29524
L_ReadHUE65:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadHUE65
NOP	
NOP	
NOP	
ADDIU	R2, SP, 16
ORI	R27, R0, 64
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
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
ADDIU	R3, SP, 80
LW	R2, Offset(_FltData+16)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_62_String+0)
ORI	R2, R2, lo_addr(?lstr_62_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 95
LW	R2, Offset(_FltData+20)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_63_String+0)
ORI	R2, R2, lo_addr(?lstr_63_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 110
LW	R2, Offset(_FltData+24)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_64_String+0)
ORI	R2, R2, lo_addr(?lstr_64_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R23, SP, 125
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr65_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr65_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 125
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
ADDIU	R3, SP, 80
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 144(SP)
ORI	R30, R0, 124
SB	R30, 145(SP)
ORI	R30, R0, 32
SB	R30, 146(SP)
MOVZ	R30, R0, R0
SB	R30, 147(SP)
ADDIU	R3, SP, 144
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ADDIU	R3, SP, 95
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 148(SP)
ORI	R30, R0, 124
SB	R30, 149(SP)
ORI	R30, R0, 32
SB	R30, 150(SP)
MOVZ	R30, R0, R0
SB	R30, 151(SP)
ADDIU	R3, SP, 148
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ADDIU	R3, SP, 110
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 152(SP)
ORI	R30, R0, 124
SB	R30, 153(SP)
ORI	R30, R0, 124
SB	R30, 154(SP)
ORI	R30, R0, 13
SB	R30, 155(SP)
ORI	R30, R0, 10
SB	R30, 156(SP)
ORI	R30, R0, 32
SB	R30, 157(SP)
MOVZ	R30, R0, R0
SB	R30, 158(SP)
ADDIU	R3, SP, 152
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R25, R0, 2
JAL	_PWM_Stop+0
NOP	
ADDIU	R2, SP, 16
L_end_ReadHUE:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 160
JR	RA
NOP	
; end of _ReadHUE
_Get_It:
MOVZ	R2, R0, R0
L_end_Get_It:
JR	RA
NOP	
; end of _Get_It
_Get_Gain:
MOVZ	R2, R0, R0
L_end_Get_Gain:
JR	RA
NOP	
; end of _Get_Gain
_Read_Thresholds:
ADDIU	SP, SP, -156
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(_Threshold+0)
ORI	R26, R26, lo_addr(_Threshold+0)
LW	R25, Offset(_FLASH_Settings_VAddr+0)(GP)
JAL	_NVMRead+0
NOP	
ADDIU	R23, SP, 101
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICS?lstr69_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr69_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 101
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_70_String+0)
ORI	R2, R2, lo_addr(?lstr_70_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 132(SP)
ORI	R30, R0, 124
SB	R30, 133(SP)
ORI	R30, R0, 124
SB	R30, 134(SP)
ORI	R30, R0, 32
SB	R30, 135(SP)
MOVZ	R30, R0, R0
SB	R30, 136(SP)
ADDIU	R3, SP, 132
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_72_String+0)
ORI	R2, R2, lo_addr(?lstr_72_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 137(SP)
ORI	R30, R0, 124
SB	R30, 138(SP)
ORI	R30, R0, 32
SB	R30, 139(SP)
MOVZ	R30, R0, R0
SB	R30, 140(SP)
ADDIU	R3, SP, 137
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_74_String+0)
ORI	R2, R2, lo_addr(?lstr_74_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 141(SP)
ORI	R30, R0, 124
SB	R30, 142(SP)
ORI	R30, R0, 32
SB	R30, 143(SP)
MOVZ	R30, R0, R0
SB	R30, 144(SP)
ADDIU	R3, SP, 141
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_76_String+0)
ORI	R2, R2, lo_addr(?lstr_76_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 145(SP)
ORI	R30, R0, 124
SB	R30, 146(SP)
ORI	R30, R0, 32
SB	R30, 147(SP)
MOVZ	R30, R0, R0
SB	R30, 148(SP)
ADDIU	R3, SP, 145
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+8)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_78_String+0)
ORI	R2, R2, lo_addr(?lstr_78_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 149(SP)
ORI	R30, R0, 124
SB	R30, 150(SP)
ORI	R30, R0, 124
SB	R30, 151(SP)
ORI	R30, R0, 13
SB	R30, 152(SP)
ORI	R30, R0, 10
SB	R30, 153(SP)
ORI	R30, R0, 32
SB	R30, 154(SP)
MOVZ	R30, R0, R0
SB	R30, 155(SP)
ADDIU	R3, SP, 149
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ADDIU	R2, SP, 37
L_end_Read_Thresholds:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 156
JR	RA
NOP	
; end of _Read_Thresholds
_Write_Thresholds:
ADDIU	SP, SP, -624
SW	RA, 0(SP)
SW	R26, 4(SP)
LW	R2, Offset(_FLASH_Settings_PAddr+0)(GP)
SW	R2, 524(SP)
; i start address is: 20 (R5)
ORI	R5, R0, 1
; i end address is: 20 (R5)
SEH	R4, R5
L_Write_Thresholds67:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 128
BNE	R2, R0, L__Write_Thresholds157
NOP	
J	L_Write_Thresholds68
NOP	
L__Write_Thresholds157:
ADDIU	R3, SP, 12
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R0, 0(R2)
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
SEH	R4, R5
; i end address is: 20 (R5)
J	L_Write_Thresholds67
NOP	
L_Write_Thresholds68:
BEQ	R25, R0, L__Write_Thresholds158
NOP	
J	L_Write_Thresholds70
NOP	
L__Write_Thresholds158:
SB	R25, 8(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 8(SP)
L_Write_Thresholds70:
BNE	R25, R0, L__Write_Thresholds160
NOP	
J	L_Write_Thresholds71
NOP	
L__Write_Thresholds160:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
BNE	R3, R2, L__Write_Thresholds162
NOP	
J	L_Write_Thresholds72
NOP	
L__Write_Thresholds162:
ADDIU	R2, SP, 12
SW	R2, 620(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_atol+0
NOP	
LB	R25, 8(SP)
LW	R3, 620(SP)
SW	R2, 0(R3)
L_Write_Thresholds72:
J	L_Write_Thresholds73
NOP	
L_Write_Thresholds71:
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+0)(GP)
SW	R2, 0(R3)
L_Write_Thresholds73:
ADDIU	R2, SP, 12
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
BNE	R25, R0, L__Write_Thresholds164
NOP	
J	L_Write_Thresholds74
NOP	
L__Write_Thresholds164:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__Write_Thresholds166
NOP	
J	L_Write_Thresholds75
NOP	
L__Write_Thresholds166:
ADDIU	R2, SP, 12
ADDIU	R2, R2, 4
SW	R2, 620(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atol+0
NOP	
LB	R25, 8(SP)
LW	R3, 620(SP)
SW	R2, 0(R3)
L_Write_Thresholds75:
J	L_Write_Thresholds76
NOP	
L_Write_Thresholds74:
ADDIU	R2, SP, 12
ADDIU	R3, R2, 4
LHU	R2, Offset(_RawData+2)(GP)
SW	R2, 0(R3)
L_Write_Thresholds76:
ADDIU	R2, SP, 12
ADDIU	R2, R2, 4
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
BNE	R25, R0, L__Write_Thresholds168
NOP	
J	L_Write_Thresholds77
NOP	
L__Write_Thresholds168:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
BNE	R3, R2, L__Write_Thresholds170
NOP	
J	L_Write_Thresholds78
NOP	
L__Write_Thresholds170:
ADDIU	R2, SP, 12
ADDIU	R2, R2, 8
SW	R2, 620(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_atol+0
NOP	
LB	R25, 8(SP)
LW	R3, 620(SP)
SW	R2, 0(R3)
L_Write_Thresholds78:
J	L_Write_Thresholds79
NOP	
L_Write_Thresholds77:
ADDIU	R2, SP, 12
ADDIU	R3, R2, 8
LHU	R2, Offset(_RawData+4)(GP)
SW	R2, 0(R3)
L_Write_Thresholds79:
ADDIU	R2, SP, 12
ADDIU	R2, R2, 8
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
BNE	R25, R0, L__Write_Thresholds172
NOP	
J	L_Write_Thresholds80
NOP	
L__Write_Thresholds172:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds174
NOP	
J	L_Write_Thresholds81
NOP	
L__Write_Thresholds174:
ADDIU	R2, SP, 12
ADDIU	R2, R2, 12
SW	R2, 620(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_atol+0
NOP	
LB	R25, 8(SP)
LW	R3, 620(SP)
SW	R2, 0(R3)
L_Write_Thresholds81:
J	L_Write_Thresholds82
NOP	
L_Write_Thresholds80:
ADDIU	R2, SP, 12
ADDIU	R3, R2, 12
LHU	R2, Offset(_RawData+6)(GP)
SW	R2, 0(R3)
L_Write_Thresholds82:
ADDIU	R2, SP, 12
ADDIU	R2, R2, 12
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
SH	R2, 528(SP)
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
BEQ	R25, R0, L__Write_Thresholds175
NOP	
J	L_Write_Thresholds83
NOP	
L__Write_Thresholds175:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds177
NOP	
J	L_Write_Thresholds84
NOP	
L__Write_Thresholds177:
ADDIU	R2, SP, 12
ADDIU	R2, R2, 16
SW	R2, 620(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_atol+0
NOP	
LB	R25, 8(SP)
LW	R3, 620(SP)
SW	R2, 0(R3)
L_Write_Thresholds84:
ADDIU	R2, SP, 12
ADDIU	R2, R2, 16
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
SH	R2, 528(SP)
L_Write_Thresholds83:
ADDIU	R3, SP, 530
LH	R2, 528(SP)
SB	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_80_String+0)
ORI	R2, R2, lo_addr(?lstr_80_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 530
ADDIU	R2, SP, 545
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
ORI	R30, R0, 32
SB	R30, 609(SP)
ORI	R30, R0, 13
SB	R30, 610(SP)
ORI	R30, R0, 10
SB	R30, 611(SP)
ORI	R30, R0, 32
SB	R30, 612(SP)
MOVZ	R30, R0, R0
SB	R30, 613(SP)
ADDIU	R3, SP, 609
ADDIU	R2, SP, 545
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 8(SP)
ADDIU	R2, SP, 545
L_end_Write_Thresholds:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 624
JR	RA
NOP	
; end of _Write_Thresholds
_testStrings:
ADDIU	SP, SP, -32
SW	RA, 0(SP)
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings180
NOP	
J	L_testStrings85
NOP	
L__testStrings180:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R27, R2
LUI	R26, hi_addr(_string+0)
ORI	R26, R26, lo_addr(_string+0)
JAL	_strncat+0
NOP	
ORI	R30, R0, 58
SB	R30, 16(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
ADDIU	R2, SP, 16
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
L_testStrings85:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings182
NOP	
J	L_testStrings86
NOP	
L__testStrings182:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R27, R2
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
JAL	_strncat+0
NOP	
ORI	R30, R0, 58
SB	R30, 18(SP)
MOVZ	R30, R0, R0
SB	R30, 19(SP)
ADDIU	R2, SP, 18
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
L_testStrings86:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings184
NOP	
J	L_testStrings87
NOP	
L__testStrings184:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R27, R2
LUI	R26, hi_addr(_string+128)
ORI	R26, R26, lo_addr(_string+128)
JAL	_strncat+0
NOP	
ORI	R30, R0, 58
SB	R30, 20(SP)
MOVZ	R30, R0, R0
SB	R30, 21(SP)
ADDIU	R2, SP, 20
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
L_testStrings87:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings186
NOP	
J	L_testStrings88
NOP	
L__testStrings186:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R27, R2
LUI	R26, hi_addr(_string+192)
ORI	R26, R26, lo_addr(_string+192)
JAL	_strncat+0
NOP	
ORI	R30, R0, 58
SB	R30, 22(SP)
MOVZ	R30, R0, R0
SB	R30, 23(SP)
ADDIU	R2, SP, 22
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
L_testStrings88:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings188
NOP	
J	L_testStrings89
NOP	
L__testStrings188:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R27, R2
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
JAL	_strncat+0
NOP	
ORI	R30, R0, 58
SB	R30, 24(SP)
MOVZ	R30, R0, R0
SB	R30, 25(SP)
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
L_testStrings89:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings190
NOP	
J	L_testStrings90
NOP	
L__testStrings190:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R27, R2
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
JAL	_strncat+0
NOP	
ORI	R30, R0, 58
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
ADDIU	R2, SP, 26
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
L_testStrings90:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings192
NOP	
J	L_testStrings91
NOP	
L__testStrings192:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R27, R2
LUI	R26, hi_addr(_string+384)
ORI	R26, R26, lo_addr(_string+384)
JAL	_strncat+0
NOP	
ORI	R30, R0, 58
SB	R30, 28(SP)
MOVZ	R30, R0, R0
SB	R30, 29(SP)
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
L_testStrings91:
L_end_testStrings:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _testStrings
_TestFlash:
ADDIU	SP, SP, -120
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_ReadFlashWord+0
NOP	
; Val start address is: 24 (R6)
MOVZ	R6, R2, R0
ADDIU	R23, SP, 98
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr90_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr90_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 98
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
MOVZ	R25, R6, R0
; Val end address is: 24 (R6)
JAL	_LongWordToHex+0
NOP	
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 106(SP)
ORI	R30, R0, 124
SB	R30, 107(SP)
ORI	R30, R0, 124
SB	R30, 108(SP)
ORI	R30, R0, 32
SB	R30, 109(SP)
MOVZ	R30, R0, R0
SB	R30, 110(SP)
ADDIU	R3, SP, 106
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ADDIU	R3, SP, 12
LHU	R2, 96(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_92_String+0)
ORI	R2, R2, lo_addr(?lstr_92_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ORI	R30, R0, 32
SB	R30, 111(SP)
ORI	R30, R0, 124
SB	R30, 112(SP)
ORI	R30, R0, 124
SB	R30, 113(SP)
ORI	R30, R0, 13
SB	R30, 114(SP)
ORI	R30, R0, 10
SB	R30, 115(SP)
ORI	R30, R0, 32
SB	R30, 116(SP)
MOVZ	R30, R0, R0
SB	R30, 117(SP)
ADDIU	R3, SP, 111
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
ADDIU	R2, SP, 32
L_end_TestFlash:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 120
JR	RA
NOP	
; end of _TestFlash
_PrintHandler:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
ANDI	R25, R25, 255
JAL	_UART1_Write+0
NOP	
L_end_PrintHandler:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _PrintHandler
String____?ag:
L_end_String___?ag:
JR	RA
NOP	
; end of String____?ag
