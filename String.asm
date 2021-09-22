_InitString:
;String.c,8 :: 		PString InitString(char cmp){
ADDIU	SP, SP, -652
; su_addr start address is: 8 (R2)
MOVZ	R2, R30, R0
; su_addr end address is: 8 (R2)
;String.c,12 :: 		}
L_end_InitString:
ADDIU	SP, SP, 652
JR	RA
NOP	
; end of _InitString
_clr_str_arrays:
;String.c,14 :: 		void clr_str_arrays(char str[10][64]){
;String.c,16 :: 		for(i = 0;i < 10;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_clr_str_arrays0:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 10
BNE	R2, R0, L__clr_str_arrays37
NOP	
J	L_clr_str_arrays1
NOP	
L__clr_str_arrays37:
;String.c,17 :: 		for(j = 0;j<64;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_clr_str_arrays3:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 64
BNE	R2, R0, L__clr_str_arrays38
NOP	
J	L_clr_str_arrays4
NOP	
L__clr_str_arrays38:
;String.c,18 :: 		str[i][j] = 0;
SEH	R2, R4
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R5
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,17 :: 		for(j = 0;j<64;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,19 :: 		}
; j end address is: 20 (R5)
J	L_clr_str_arrays3
NOP	
L_clr_str_arrays4:
;String.c,16 :: 		for(i = 0;i < 10;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,20 :: 		}
; i end address is: 16 (R4)
J	L_clr_str_arrays0
NOP	
L_clr_str_arrays1:
;String.c,21 :: 		}
L_end_clr_str_arrays:
JR	RA
NOP	
; end of _clr_str_arrays
_setstr:
;String.c,23 :: 		char* setstr(char conf[64]){
;String.c,25 :: 		for(i=0;i < 64;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_setstr6:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 64
BNE	R2, R0, L__setstr40
NOP	
J	L_setstr7
NOP	
L__setstr40:
;String.c,26 :: 		if((conf[i] == 0x0D)|| (conf[i] == 0x0A))
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L__setstr42
NOP	
J	L__setstr33
NOP	
L__setstr42:
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L__setstr44
NOP	
J	L__setstr32
NOP	
L__setstr44:
J	L_setstr11
NOP	
L__setstr33:
L__setstr32:
;String.c,27 :: 		break;
J	L_setstr7
NOP	
L_setstr11:
;String.c,25 :: 		for(i=0;i < 64;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,28 :: 		}
J	L_setstr6
NOP	
L_setstr7:
;String.c,29 :: 		conf[i+1] = 0;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
SEH	R2, R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;String.c,31 :: 		return conf;
MOVZ	R2, R25, R0
;String.c,32 :: 		}
L_end_setstr:
JR	RA
NOP	
; end of _setstr
_testStrings:
;String.c,34 :: 		void testStrings(char* writebuff){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,35 :: 		if(strlen(string[0])!=0)strncat(writebuff,string[0],strlen(string[0]));
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings47
NOP	
J	L_testStrings12
NOP	
L__testStrings47:
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
L_testStrings12:
;String.c,36 :: 		if(strlen(string[1])!=0)strncat(writebuff,string[1],strlen(string[1]));
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings49
NOP	
J	L_testStrings13
NOP	
L__testStrings49:
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
L_testStrings13:
;String.c,37 :: 		if(strlen(string[2])!=0)strncat(writebuff,string[2],strlen(string[2]));
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings51
NOP	
J	L_testStrings14
NOP	
L__testStrings51:
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
L_testStrings14:
;String.c,38 :: 		if(strlen(string[3])!=0)strncat(writebuff,string[3],strlen(string[3]));
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings53
NOP	
J	L_testStrings15
NOP	
L__testStrings53:
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
L_testStrings15:
;String.c,39 :: 		if(strlen(string[4])!=0)strncat(writebuff,string[4],strlen(string[4]));
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings55
NOP	
J	L_testStrings16
NOP	
L__testStrings55:
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
L_testStrings16:
;String.c,40 :: 		if(strlen(string[5])!=0)strncat(writebuff,string[5],strlen(string[5]));
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings57
NOP	
J	L_testStrings17
NOP	
L__testStrings57:
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
L_testStrings17:
;String.c,42 :: 		}
L_end_testStrings:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _testStrings
_WriteData:
;String.c,44 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;String.c,46 :: 		HID_Write(_data,64) ;
SW	R26, 4(SP)
ORI	R26, R0, 64
JAL	_HID_Write+0
NOP	
;String.c,47 :: 		}
L_end_WriteData:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WriteData
_strsplit:
;String.c,49 :: 		int strsplit(char str[64], char c){
;String.c,51 :: 		ii=kk=0;
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,52 :: 		for (i = 0; i < 64;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 24 (R6)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
L_strsplit18:
; i start address is: 16 (R4)
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
SEH	R2, R4
SLTI	R2, R2, 64
BNE	R2, R0, L__strsplit60
NOP	
J	L__strsplit34
NOP	
L__strsplit60:
;String.c,54 :: 		if(str[i] == c){
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R26, 255
BEQ	R3, R2, L__strsplit61
NOP	
J	L_strsplit21
NOP	
L__strsplit61:
;String.c,55 :: 		string[kk][ii] = 0;
SEH	R2, R5
SLL	R3, R2, 6
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
ADDU	R3, R2, R3
SEH	R2, R6
; ii end address is: 24 (R6)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,56 :: 		kk++;
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,57 :: 		ii=0;
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,58 :: 		goto endb;
J	___strsplit_endb
NOP	
;String.c,59 :: 		}else{
L_strsplit21:
;String.c,60 :: 		string[kk][ii] = str[i];
SEH	R2, R5
SLL	R3, R2, 6
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
ADDU	R3, R2, R3
SEH	R2, R6
ADDU	R3, R3, R2
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,61 :: 		ii++;
ADDIU	R2, R6, 1
SEH	R6, R2
; ii end address is: 24 (R6)
; kk end address is: 20 (R5)
;String.c,64 :: 		endb:
___strsplit_endb:
;String.c,65 :: 		if(str[i]==0)
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit62
NOP	
J	L_strsplit23
NOP	
L__strsplit62:
; ii end address is: 24 (R6)
; i end address is: 16 (R4)
;String.c,66 :: 		break;
SEH	R2, R5
J	L_strsplit19
NOP	
L_strsplit23:
;String.c,52 :: 		for (i = 0; i < 64;i++){
; i start address is: 16 (R4)
; ii start address is: 24 (R6)
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,67 :: 		}
; ii end address is: 24 (R6)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
J	L_strsplit18
NOP	
L__strsplit34:
;String.c,52 :: 		for (i = 0; i < 64;i++){
SEH	R2, R5
;String.c,67 :: 		}
L_strsplit19:
;String.c,68 :: 		return kk;
; kk start address is: 8 (R2)
; kk end address is: 8 (R2)
;String.c,69 :: 		}
L_end_strsplit:
JR	RA
NOP	
; end of _strsplit
_StrChecker:
;String.c,71 :: 		char* StrChecker(int i){
ADDIU	SP, SP, -20
;String.c,72 :: 		switch(i){
J	L_StrChecker24
NOP	
;String.c,73 :: 		case 0:
L_StrChecker26:
;String.c,74 :: 		return "AT";
ORI	R30, R0, 65
SB	R30, 0(SP)
ORI	R30, R0, 84
SB	R30, 1(SP)
MOVZ	R30, R0, R0
SB	R30, 2(SP)
ADDIU	R2, SP, 0
J	L_end_StrChecker
NOP	
;String.c,76 :: 		case 1:
L_StrChecker27:
;String.c,77 :: 		return "SET";
ORI	R30, R0, 83
SB	R30, 3(SP)
ORI	R30, R0, 69
SB	R30, 4(SP)
ORI	R30, R0, 84
SB	R30, 5(SP)
MOVZ	R30, R0, R0
SB	R30, 6(SP)
ADDIU	R2, SP, 3
J	L_end_StrChecker
NOP	
;String.c,79 :: 		case 2:
L_StrChecker28:
;String.c,80 :: 		return "CONF";
ORI	R30, R0, 67
SB	R30, 7(SP)
ORI	R30, R0, 79
SB	R30, 8(SP)
ORI	R30, R0, 78
SB	R30, 9(SP)
ORI	R30, R0, 70
SB	R30, 10(SP)
MOVZ	R30, R0, R0
SB	R30, 11(SP)
ADDIU	R2, SP, 7
J	L_end_StrChecker
NOP	
;String.c,82 :: 		case 3:
L_StrChecker29:
;String.c,83 :: 		return "GET";
ORI	R30, R0, 71
SB	R30, 12(SP)
ORI	R30, R0, 69
SB	R30, 13(SP)
ORI	R30, R0, 84
SB	R30, 14(SP)
MOVZ	R30, R0, R0
SB	R30, 15(SP)
ADDIU	R2, SP, 12
J	L_end_StrChecker
NOP	
;String.c,85 :: 		default:
L_StrChecker30:
;String.c,86 :: 		return " ";
ORI	R30, R0, 32
SB	R30, 16(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
ADDIU	R2, SP, 16
J	L_end_StrChecker
NOP	
;String.c,88 :: 		}
L_StrChecker24:
SEH	R2, R25
BNE	R2, R0, L__StrChecker65
NOP	
J	L_StrChecker26
NOP	
L__StrChecker65:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__StrChecker67
NOP	
J	L_StrChecker27
NOP	
L__StrChecker67:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__StrChecker69
NOP	
J	L_StrChecker28
NOP	
L__StrChecker69:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__StrChecker71
NOP	
J	L_StrChecker29
NOP	
L__StrChecker71:
J	L_StrChecker30
NOP	
;String.c,90 :: 		}
L_end_StrChecker:
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _StrChecker
