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
ADDIU	SP, SP, -116
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 49
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
ADDIU	R2, SP, 49
SEH	R27, R25
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
ADDIU	R2, SP, 49
MOVZ	R25, R2, R0
JAL	_setstr+0
NOP	
ORI	R26, R0, 43
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__DoStrings147
NOP	
J	L_DoStrings0
NOP	
L__DoStrings147:
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
J	L_DoStrings2
NOP	
; res1 end address is: 20 (R5)
L_DoStrings4:
LW	R26, Offset(_comc+0)(GP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strcmp+0
NOP	
BEQ	R2, R0, L__DoStrings148
NOP	
J	L_DoStrings5
NOP	
L__DoStrings148:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings150
NOP	
J	L_DoStrings6
NOP	
L__DoStrings150:
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
SH	R2, 24(SP)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_DoStrings7:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
LH	R2, 24(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__DoStrings151
NOP	
J	L_DoStrings8
NOP	
L__DoStrings151:
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
LUI	R24, 40
ORI	R24, R24, 45226
L_DoStrings10:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings10
NOP	
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
; i end address is: 16 (R4)
J	L_DoStrings7
NOP	
L_DoStrings8:
L_DoStrings6:
SH	R25, 16(SP)
LH	R25, 24(SP)
JAL	_TCS3472_SetIntergration_Time+0
NOP	
LH	R25, 16(SP)
; err start address is: 16 (R4)
ANDI	R4, R2, 255
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DoStrings152
NOP	
J	L_DoStrings12
NOP	
L__DoStrings152:
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; err end address is: 16 (R4)
; i end address is: 20 (R5)
L_DoStrings13:
; i start address is: 20 (R5)
; err start address is: 16 (R4)
ANDI	R3, R5, 255
ANDI	R2, R4, 255
SLTU	R2, R3, R2
BNE	R2, R0, L__DoStrings153
NOP	
J	L_DoStrings14
NOP	
L__DoStrings153:
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
LUI	R24, 203
ORI	R24, R24, 29524
L_DoStrings16:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings16
NOP	
NOP	
NOP	
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
; err end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_DoStrings13
NOP	
L_DoStrings14:
L_DoStrings12:
J	L_DoStrings18
NOP	
L_DoStrings5:
LW	R26, Offset(_comc+4)(GP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strcmp+0
NOP	
BEQ	R2, R0, L__DoStrings154
NOP	
J	L_DoStrings19
NOP	
L__DoStrings154:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings156
NOP	
J	L_DoStrings20
NOP	
L__DoStrings156:
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
SH	R2, 26(SP)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_DoStrings21:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
LH	R2, 26(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__DoStrings157
NOP	
J	L_DoStrings22
NOP	
L__DoStrings157:
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
LUI	R24, 40
ORI	R24, R24, 45226
L_DoStrings24:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings24
NOP	
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
; i end address is: 16 (R4)
J	L_DoStrings21
NOP	
L_DoStrings22:
L_DoStrings20:
SH	R25, 16(SP)
LH	R25, 26(SP)
JAL	_TCS3472_SetGain+0
NOP	
LH	R25, 16(SP)
; err start address is: 16 (R4)
ANDI	R4, R2, 255
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DoStrings158
NOP	
J	L_DoStrings26
NOP	
L__DoStrings158:
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; err end address is: 16 (R4)
; i end address is: 20 (R5)
L_DoStrings27:
; i start address is: 20 (R5)
; err start address is: 16 (R4)
ANDI	R3, R5, 255
ANDI	R2, R4, 255
SLTU	R2, R3, R2
BNE	R2, R0, L__DoStrings159
NOP	
J	L_DoStrings28
NOP	
L__DoStrings159:
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
LUI	R24, 203
ORI	R24, R24, 29524
L_DoStrings30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings30
NOP	
NOP	
NOP	
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
; err end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_DoStrings27
NOP	
L_DoStrings28:
L_DoStrings26:
L_DoStrings19:
L_DoStrings18:
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
J	L_DoStrings3
NOP	
L_DoStrings32:
J	L_DoStrings3
NOP	
L_DoStrings33:
MOVZ	R25, R0, R0
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, 20(SP)
J	L_DoStrings3
NOP	
L_DoStrings34:
ORI	R25, R0, 7
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
J	L_DoStrings3
NOP	
L_DoStrings35:
ORI	R25, R0, 8
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
J	L_DoStrings3
NOP	
L_DoStrings36:
ORI	R25, R0, 9
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
J	L_DoStrings3
NOP	
L_DoStrings37:
ORI	R25, R0, 10
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
J	L_DoStrings3
NOP	
L_DoStrings38:
ORI	R25, R0, 11
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
J	L_DoStrings3
NOP	
L_DoStrings39:
ORI	R25, R0, 12
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
J	L_DoStrings3
NOP	
L_DoStrings40:
ORI	R25, R0, 1
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, 20(SP)
J	L_DoStrings3
NOP	
L_DoStrings41:
JAL	_Read_Thresholds+0
NOP	
SW	R2, 20(SP)
J	L_DoStrings3
NOP	
L_DoStrings42:
ORI	R25, R0, 1
JAL	_Write_Thresholds+0
NOP	
SW	R2, 20(SP)
J	L_DoStrings3
NOP	
L_DoStrings43:
MOVZ	R25, R0, R0
JAL	_Write_Thresholds+0
NOP	
SW	R2, 20(SP)
J	L_DoStrings3
NOP	
L_DoStrings44:
ORI	R2, R0, 5
SH	R2, Offset(_SimVars+2)(GP)
J	L_DoStrings3
NOP	
L_DoStrings45:
ORI	R2, R0, 3
SH	R2, Offset(_SimVars+2)(GP)
J	L_DoStrings3
NOP	
L_DoStrings46:
JAL	_ReadHUE+0
NOP	
SW	R2, 20(SP)
J	L_DoStrings3
NOP	
L_DoStrings47:
ORI	R26, R0, 15
LUI	R25, hi_addr(_ave_adc_+0)
ORI	R25, R25, lo_addr(_ave_adc_+0)
JAL	_LM35_Adc_Average+0
NOP	
LH	R26, Offset(_ave_adc_+0)(GP)
LUI	R25, hi_addr(_temp_+0)
ORI	R25, R25, lo_addr(_temp_+0)
JAL	_getLM35Temp+0
NOP	
SH	R0, Offset(_ave_adc_+0)(GP)
LW	R2, Offset(_temp_+4)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_25_String+0)
ORI	R2, R2, lo_addr(?lstr_25_String+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt_+0)
ORI	R2, R2, lo_addr(_txt_+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LUI	R2, hi_addr(_txt_+0)
ORI	R2, R2, lo_addr(_txt_+0)
SW	R2, 20(SP)
J	L_DoStrings3
NOP	
L_DoStrings48:
ADDIU	R23, SP, 28
ADDIU	R22, R23, 21
LUI	R24, hi_addr(?ICS?lstr26_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr26_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 28
SW	R2, 20(SP)
J	L_DoStrings3
NOP	
L_DoStrings2:
; res1 start address is: 20 (R5)
SEH	R2, R5
BNE	R2, R0, L__DoStrings161
NOP	
J	L_DoStrings4
NOP	
L__DoStrings161:
SEH	R3, R5
ORI	R2, R0, 5
BNE	R3, R2, L__DoStrings163
NOP	
J	L_DoStrings32
NOP	
L__DoStrings163:
SEH	R3, R5
ORI	R2, R0, 6
BNE	R3, R2, L__DoStrings165
NOP	
J	L_DoStrings33
NOP	
L__DoStrings165:
SEH	R3, R5
ORI	R2, R0, 7
BNE	R3, R2, L__DoStrings167
NOP	
J	L_DoStrings34
NOP	
L__DoStrings167:
SEH	R3, R5
ORI	R2, R0, 8
BNE	R3, R2, L__DoStrings169
NOP	
J	L_DoStrings35
NOP	
L__DoStrings169:
SEH	R3, R5
ORI	R2, R0, 9
BNE	R3, R2, L__DoStrings171
NOP	
J	L_DoStrings36
NOP	
L__DoStrings171:
SEH	R3, R5
ORI	R2, R0, 10
BNE	R3, R2, L__DoStrings173
NOP	
J	L_DoStrings37
NOP	
L__DoStrings173:
SEH	R3, R5
ORI	R2, R0, 11
BNE	R3, R2, L__DoStrings175
NOP	
J	L_DoStrings38
NOP	
L__DoStrings175:
SEH	R3, R5
ORI	R2, R0, 12
BNE	R3, R2, L__DoStrings177
NOP	
J	L_DoStrings39
NOP	
L__DoStrings177:
SEH	R3, R5
ORI	R2, R0, 13
BNE	R3, R2, L__DoStrings179
NOP	
J	L_DoStrings40
NOP	
L__DoStrings179:
SEH	R3, R5
ORI	R2, R0, 14
BNE	R3, R2, L__DoStrings181
NOP	
J	L_DoStrings41
NOP	
L__DoStrings181:
SEH	R3, R5
ORI	R2, R0, 15
BNE	R3, R2, L__DoStrings183
NOP	
J	L_DoStrings42
NOP	
L__DoStrings183:
SEH	R3, R5
ORI	R2, R0, 16
BNE	R3, R2, L__DoStrings185
NOP	
J	L_DoStrings43
NOP	
L__DoStrings185:
SEH	R3, R5
ORI	R2, R0, 17
BNE	R3, R2, L__DoStrings187
NOP	
J	L_DoStrings44
NOP	
L__DoStrings187:
SEH	R3, R5
ORI	R2, R0, 18
BNE	R3, R2, L__DoStrings189
NOP	
J	L_DoStrings45
NOP	
L__DoStrings189:
SEH	R3, R5
ORI	R2, R0, 19
BNE	R3, R2, L__DoStrings191
NOP	
J	L_DoStrings46
NOP	
L__DoStrings191:
SEH	R3, R5
; res1 end address is: 20 (R5)
ORI	R2, R0, 20
BNE	R3, R2, L__DoStrings193
NOP	
J	L_DoStrings47
NOP	
L__DoStrings193:
J	L_DoStrings48
NOP	
L_DoStrings3:
LW	R25, 20(SP)
JAL	_strlen+0
NOP	
SEH	R27, R2
LW	R26, 20(SP)
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncat+0
NOP	
L_DoStrings49:
SH	R25, 16(SP)
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
LH	R25, 16(SP)
BEQ	R2, R0, L__DoStrings194
NOP	
J	L_DoStrings50
NOP	
L__DoStrings194:
J	L_DoStrings49
NOP	
L_DoStrings50:
MOVZ	R2, R0, R0
L_end_DoStrings:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 116
JR	RA
NOP	
; end of _DoStrings
_clr_str_arrays:
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_clr_str_arrays51:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__clr_str_arrays196
NOP	
J	L_clr_str_arrays52
NOP	
L__clr_str_arrays196:
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_clr_str_arrays54:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 64
BNE	R2, R0, L__clr_str_arrays197
NOP	
J	L_clr_str_arrays55
NOP	
L__clr_str_arrays197:
SEH	R2, R4
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R5
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R5, 1
SEH	R5, R2
; j end address is: 20 (R5)
J	L_clr_str_arrays54
NOP	
L_clr_str_arrays55:
ADDIU	R2, R4, 1
SEH	R4, R2
; i end address is: 16 (R4)
J	L_clr_str_arrays51
NOP	
L_clr_str_arrays52:
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
L_setstr57:
; i start address is: 20 (R5)
JAL	_strlen+0
NOP	
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__setstr199
NOP	
J	L_setstr58
NOP	
L__setstr199:
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__setstr200
NOP	
J	L_setstr60
NOP	
L__setstr200:
J	L_setstr58
NOP	
L_setstr60:
ADDIU	R2, R5, 1
SEH	R5, R2
J	L_setstr57
NOP	
L_setstr58:
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
L_strsplit61:
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
; lasti start address is: 24 (R6)
SEH	R2, R4
SLTI	R2, R2, 250
BNE	R2, R0, L__strsplit202
NOP	
J	L_strsplit62
NOP	
L__strsplit202:
SUBU	R2, R4, R6
; err start address is: 32 (R8)
SEH	R8, R2
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R26, 255
BNE	R3, R2, L__strsplit204
NOP	
J	L__strsplit141
NOP	
L__strsplit204:
SEH	R2, R8
; err end address is: 32 (R8)
SLTI	R2, R2, 63
BNE	R2, R0, L__strsplit205
NOP	
J	L__strsplit140
NOP	
L__strsplit205:
J	L_strsplit66
NOP	
; lasti end address is: 24 (R6)
L__strsplit141:
L__strsplit140:
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
J	L_strsplit63
NOP	
L_strsplit66:
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
BEQ	R2, R0, L__strsplit206
NOP	
J	L_strsplit68
NOP	
L__strsplit206:
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
J	L_strsplit62
NOP	
L_strsplit68:
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; lasti start address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
L_strsplit63:
; lasti end address is: 24 (R6)
; lasti start address is: 24 (R6)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
ADDIU	R2, R4, 1
SEH	R4, R2
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
J	L_strsplit61
NOP	
L_strsplit62:
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
L_findnumber69:
; i start address is: 36 (R9)
; temp start address is: 32 (R8)
JAL	_strlen+0
NOP	
SEH	R3, R9
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__findnumber208
NOP	
J	L_findnumber70
NOP	
L__findnumber208:
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 42
BEQ	R2, R0, L__findnumber209
NOP	
J	L__findnumber144
NOP	
L__findnumber209:
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 64
BNE	R2, R0, L__findnumber210
NOP	
J	L__findnumber143
NOP	
L__findnumber210:
L__findnumber142:
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
L__findnumber144:
L__findnumber143:
ADDIU	R2, R9, 1
SEH	R9, R2
J	L_findnumber69
NOP	
L_findnumber70:
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
BEQ	R2, R0, L__StrChecker212
NOP	
J	L_StrChecker75
NOP	
L__StrChecker212:
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
ORI	R2, R2, BitMask(StrChecker_once_L0+0)
SB	R2, Offset(StrChecker_once_L0+0)(GP)
ORI	R2, R0, 22
SH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
L_StrChecker75:
JAL	_strlen+0
NOP	
; length start address is: 20 (R5)
SEH	R5, R2
SEH	R2, R2
SLTI	R2, R2, 5
BNE	R2, R0, L__StrChecker213
NOP	
J	L_StrChecker76
NOP	
L__StrChecker213:
; length end address is: 20 (R5)
ORI	R2, R0, 21
J	L_end_StrChecker
NOP	
L_StrChecker76:
; i start address is: 24 (R6)
; length start address is: 20 (R5)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_StrChecker77:
; i start address is: 24 (R6)
; length start address is: 20 (R5)
; length end address is: 20 (R5)
SEH	R3, R6
LH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__StrChecker214
NOP	
J	L_StrChecker78
NOP	
L__StrChecker214:
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
BEQ	R2, R0, L__StrChecker215
NOP	
J	L_StrChecker80
NOP	
L__StrChecker215:
; length end address is: 20 (R5)
J	L_StrChecker78
NOP	
L_StrChecker80:
; length start address is: 20 (R5)
ADDIU	R2, R6, 1
SEH	R6, R2
; length end address is: 20 (R5)
J	L_StrChecker77
NOP	
L_StrChecker78:
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
L_RemoveWhiteSpace81:
; i start address is: 20 (R5)
; j start address is: 24 (R6)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__RemoveWhiteSpace217
NOP	
J	L_RemoveWhiteSpace82
NOP	
L__RemoveWhiteSpace217:
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 32
BEQ	R3, R2, L__RemoveWhiteSpace218
NOP	
J	L_RemoveWhiteSpace84
NOP	
L__RemoveWhiteSpace218:
J	L_RemoveWhiteSpace83
NOP	
L_RemoveWhiteSpace84:
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
L_RemoveWhiteSpace83:
; j start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
; j end address is: 24 (R6)
; i end address is: 20 (R5)
J	L_RemoveWhiteSpace81
NOP	
L_RemoveWhiteSpace82:
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
BNE	R3, R2, L__RemoveChars221
NOP	
J	L_RemoveChars85
NOP	
L__RemoveChars221:
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
J	L_RemoveChars86
NOP	
L_RemoveChars85:
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
L_RemoveChars86:
; temp start address is: 32 (R8)
; i start address is: 36 (R9)
MOVZ	R9, R0, R0
; temp end address is: 32 (R8)
; i end address is: 36 (R9)
L_RemoveChars87:
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
BNE	R2, R0, L__RemoveChars222
NOP	
J	L_RemoveChars88
NOP	
L__RemoveChars222:
SEH	R2, R9
ADDU	R2, R8, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BEQ	R3, R2, L__RemoveChars223
NOP	
J	L_RemoveChars90
NOP	
L__RemoveChars223:
J	L_RemoveChars88
NOP	
L_RemoveChars90:
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
ADDIU	R2, R9, 1
SEH	R9, R2
J	L_RemoveChars87
NOP	
L_RemoveChars88:
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
L_Read_Send_AllColour91:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Read_Send_AllColour91
NOP	
NOP	
NOP	
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 12(SP)
BNE	R25, R0, L__Read_Send_AllColour227
NOP	
J	L_Read_Send_AllColour93
NOP	
L__Read_Send_AllColour227:
SB	R25, 12(SP)
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_GetScaledValues+0
NOP	
LB	R25, 12(SP)
L_Read_Send_AllColour93:
BEQ	R25, R0, L__Read_Send_AllColour228
NOP	
J	L_Read_Send_AllColour94
NOP	
L__Read_Send_AllColour228:
ADDIU	R23, SP, 92
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr27_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr27_String+0)
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
LUI	R2, hi_addr(?lstr_28_String+0)
ORI	R2, R2, lo_addr(?lstr_28_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
J	L_Read_Send_AllColour95
NOP	
L_Read_Send_AllColour94:
ADDIU	R23, SP, 115
ADDIU	R22, R23, 21
LUI	R24, hi_addr(?ICS?lstr29_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr29_String+0)
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
LUI	R2, hi_addr(?lstr_30_String+0)
ORI	R2, R2, lo_addr(?lstr_30_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
L_Read_Send_AllColour95:
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
BEQ	R25, R0, L__Read_Send_AllColour229
NOP	
J	L_Read_Send_AllColour96
NOP	
L__Read_Send_AllColour229:
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+2)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_32_String+0)
ORI	R2, R2, lo_addr(?lstr_32_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
J	L_Read_Send_AllColour97
NOP	
L_Read_Send_AllColour96:
ADDIU	R3, SP, 13
LW	R2, Offset(_FltData+4)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_33_String+0)
ORI	R2, R2, lo_addr(?lstr_33_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
L_Read_Send_AllColour97:
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
BEQ	R25, R0, L__Read_Send_AllColour230
NOP	
J	L_Read_Send_AllColour98
NOP	
L__Read_Send_AllColour230:
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+4)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_35_String+0)
ORI	R2, R2, lo_addr(?lstr_35_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
J	L_Read_Send_AllColour99
NOP	
L_Read_Send_AllColour98:
ADDIU	R3, SP, 13
LW	R2, Offset(_FltData+8)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_36_String+0)
ORI	R2, R2, lo_addr(?lstr_36_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
L_Read_Send_AllColour99:
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
BEQ	R25, R0, L__Read_Send_AllColour231
NOP	
J	L_Read_Send_AllColour100
NOP	
L__Read_Send_AllColour231:
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_38_String+0)
ORI	R2, R2, lo_addr(?lstr_38_String+0)
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
LUI	R2, hi_addr(?lstr_40_String+0)
ORI	R2, R2, lo_addr(?lstr_40_String+0)
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
J	L_Read_Send_AllColour101
NOP	
L_Read_Send_AllColour100:
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
L_Read_Send_AllColour101:
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
L_Read_Send_OneColour102:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Read_Send_OneColour102
NOP	
NOP	
NOP	
J	L_Read_Send_OneColour104
NOP	
L_Read_Send_OneColour106:
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
ADDIU	R23, SP, 92
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr43_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr43_String+0)
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
LUI	R2, hi_addr(?lstr_44_String+0)
ORI	R2, R2, lo_addr(?lstr_44_String+0)
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
J	L_Read_Send_OneColour105
NOP	
L_Read_Send_OneColour107:
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
ADDIU	R23, SP, 106
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr46_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr46_String+0)
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
LUI	R2, hi_addr(?lstr_47_String+0)
ORI	R2, R2, lo_addr(?lstr_47_String+0)
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
J	L_Read_Send_OneColour105
NOP	
L_Read_Send_OneColour108:
ORI	R25, R0, 26
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
ADDIU	R23, SP, 120
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr49_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr49_String+0)
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
LUI	R2, hi_addr(?lstr_50_String+0)
ORI	R2, R2, lo_addr(?lstr_50_String+0)
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
J	L_Read_Send_OneColour105
NOP	
L_Read_Send_OneColour109:
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
ADDIU	R23, SP, 134
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr52_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr52_String+0)
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
LUI	R2, hi_addr(?lstr_53_String+0)
ORI	R2, R2, lo_addr(?lstr_53_String+0)
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
J	L_Read_Send_OneColour105
NOP	
L_Read_Send_OneColour110:
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
LUI	R24, hi_addr(?ICS?lstr55_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr55_String+0)
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
LUI	R2, hi_addr(?lstr_56_String+0)
ORI	R2, R2, lo_addr(?lstr_56_String+0)
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
J	L_Read_Send_OneColour105
NOP	
L_Read_Send_OneColour111:
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
LUI	R24, hi_addr(?ICS?lstr58_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr58_String+0)
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
LUI	R2, hi_addr(?lstr_59_String+0)
ORI	R2, R2, lo_addr(?lstr_59_String+0)
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
J	L_Read_Send_OneColour105
NOP	
L_Read_Send_OneColour104:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Read_Send_OneColour234
NOP	
J	L_Read_Send_OneColour106
NOP	
L__Read_Send_OneColour234:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Read_Send_OneColour236
NOP	
J	L_Read_Send_OneColour107
NOP	
L__Read_Send_OneColour236:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Read_Send_OneColour238
NOP	
J	L_Read_Send_OneColour108
NOP	
L__Read_Send_OneColour238:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Read_Send_OneColour240
NOP	
J	L_Read_Send_OneColour109
NOP	
L__Read_Send_OneColour240:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Read_Send_OneColour242
NOP	
J	L_Read_Send_OneColour110
NOP	
L__Read_Send_OneColour242:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Read_Send_OneColour244
NOP	
J	L_Read_Send_OneColour111
NOP	
L__Read_Send_OneColour244:
L_Read_Send_OneColour105:
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
L_ReadHUE112:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadHUE112
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
LUI	R2, hi_addr(?lstr_61_String+0)
ORI	R2, R2, lo_addr(?lstr_61_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 95
LW	R2, Offset(_FltData+20)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_62_String+0)
ORI	R2, R2, lo_addr(?lstr_62_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 110
LW	R2, Offset(_FltData+24)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_63_String+0)
ORI	R2, R2, lo_addr(?lstr_63_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R23, SP, 125
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr64_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr64_String+0)
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
LUI	R24, hi_addr(?ICS?lstr68_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr68_String+0)
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
LUI	R2, hi_addr(?lstr_69_String+0)
ORI	R2, R2, lo_addr(?lstr_69_String+0)
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
LUI	R2, hi_addr(?lstr_71_String+0)
ORI	R2, R2, lo_addr(?lstr_71_String+0)
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
LUI	R2, hi_addr(?lstr_73_String+0)
ORI	R2, R2, lo_addr(?lstr_73_String+0)
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
LUI	R2, hi_addr(?lstr_75_String+0)
ORI	R2, R2, lo_addr(?lstr_75_String+0)
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
LUI	R2, hi_addr(?lstr_77_String+0)
ORI	R2, R2, lo_addr(?lstr_77_String+0)
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
L_Write_Thresholds114:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 128
BNE	R2, R0, L__Write_Thresholds250
NOP	
J	L_Write_Thresholds115
NOP	
L__Write_Thresholds250:
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
J	L_Write_Thresholds114
NOP	
L_Write_Thresholds115:
BEQ	R25, R0, L__Write_Thresholds251
NOP	
J	L_Write_Thresholds117
NOP	
L__Write_Thresholds251:
SB	R25, 8(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 8(SP)
L_Write_Thresholds117:
BNE	R25, R0, L__Write_Thresholds253
NOP	
J	L_Write_Thresholds118
NOP	
L__Write_Thresholds253:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
BNE	R3, R2, L__Write_Thresholds255
NOP	
J	L_Write_Thresholds119
NOP	
L__Write_Thresholds255:
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
L_Write_Thresholds119:
J	L_Write_Thresholds120
NOP	
L_Write_Thresholds118:
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+0)(GP)
SW	R2, 0(R3)
L_Write_Thresholds120:
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
BNE	R25, R0, L__Write_Thresholds257
NOP	
J	L_Write_Thresholds121
NOP	
L__Write_Thresholds257:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__Write_Thresholds259
NOP	
J	L_Write_Thresholds122
NOP	
L__Write_Thresholds259:
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
L_Write_Thresholds122:
J	L_Write_Thresholds123
NOP	
L_Write_Thresholds121:
ADDIU	R2, SP, 12
ADDIU	R3, R2, 4
LHU	R2, Offset(_RawData+2)(GP)
SW	R2, 0(R3)
L_Write_Thresholds123:
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
BNE	R25, R0, L__Write_Thresholds261
NOP	
J	L_Write_Thresholds124
NOP	
L__Write_Thresholds261:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
BNE	R3, R2, L__Write_Thresholds263
NOP	
J	L_Write_Thresholds125
NOP	
L__Write_Thresholds263:
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
L_Write_Thresholds125:
J	L_Write_Thresholds126
NOP	
L_Write_Thresholds124:
ADDIU	R2, SP, 12
ADDIU	R3, R2, 8
LHU	R2, Offset(_RawData+4)(GP)
SW	R2, 0(R3)
L_Write_Thresholds126:
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
BNE	R25, R0, L__Write_Thresholds265
NOP	
J	L_Write_Thresholds127
NOP	
L__Write_Thresholds265:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds267
NOP	
J	L_Write_Thresholds128
NOP	
L__Write_Thresholds267:
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
L_Write_Thresholds128:
J	L_Write_Thresholds129
NOP	
L_Write_Thresholds127:
ADDIU	R2, SP, 12
ADDIU	R3, R2, 12
LHU	R2, Offset(_RawData+6)(GP)
SW	R2, 0(R3)
L_Write_Thresholds129:
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
BEQ	R25, R0, L__Write_Thresholds268
NOP	
J	L_Write_Thresholds130
NOP	
L__Write_Thresholds268:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds270
NOP	
J	L_Write_Thresholds131
NOP	
L__Write_Thresholds270:
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
L_Write_Thresholds131:
ADDIU	R2, SP, 12
ADDIU	R2, R2, 16
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
SH	R2, 528(SP)
L_Write_Thresholds130:
ADDIU	R3, SP, 530
LH	R2, 528(SP)
SB	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_79_String+0)
ORI	R2, R2, lo_addr(?lstr_79_String+0)
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
BNE	R2, R0, L__testStrings273
NOP	
J	L_testStrings132
NOP	
L__testStrings273:
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
L_testStrings132:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings275
NOP	
J	L_testStrings133
NOP	
L__testStrings275:
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
L_testStrings133:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings277
NOP	
J	L_testStrings134
NOP	
L__testStrings277:
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
L_testStrings134:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings279
NOP	
J	L_testStrings135
NOP	
L__testStrings279:
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
L_testStrings135:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings281
NOP	
J	L_testStrings136
NOP	
L__testStrings281:
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
L_testStrings136:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings283
NOP	
J	L_testStrings137
NOP	
L__testStrings283:
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
L_testStrings137:
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings285
NOP	
J	L_testStrings138
NOP	
L__testStrings285:
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
L_testStrings138:
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
LUI	R24, hi_addr(?ICS?lstr89_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr89_String+0)
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
LUI	R2, hi_addr(?lstr_91_String+0)
ORI	R2, R2, lo_addr(?lstr_91_String+0)
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
