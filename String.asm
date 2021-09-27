_InitString:
;String.c,25 :: 		PString InitString(char cmp){
ADDIU	SP, SP, -652
; su_addr start address is: 8 (R2)
MOVZ	R2, R30, R0
; su_addr end address is: 8 (R2)
;String.c,29 :: 		}
L_end_InitString:
ADDIU	SP, SP, 652
JR	RA
NOP	
; end of _InitString
_DoStrings:
;String.c,34 :: 		int DoStrings(int num){
ADDIU	SP, SP, -92
SW	RA, 0(SP)
;String.c,36 :: 		char *result,conf[64] = "";
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 27
ADDIU	R22, R23, 64
LUI	R24, hi_addr(?ICSDoStrings_conf_L0+0)
ORI	R24, R24, lo_addr(?ICSDoStrings_conf_L0+0)
JAL	___CC2DW+0
NOP	
;String.c,40 :: 		clr_str_arrays(string);     //clear the strings in the array
SH	R25, 16(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_clr_str_arrays+0
NOP	
LH	R25, 16(SP)
;String.c,41 :: 		memcpy(conf,readbuff,num);  //copy the USB buffer to a temp arrar
ADDIU	R2, SP, 27
SEH	R27, R25
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;String.c,42 :: 		result = setstr(conf);      //look for '\r' '\n' and move result to a string
ADDIU	R2, SP, 27
MOVZ	R25, R2, R0
JAL	_setstr+0
NOP	
;String.c,43 :: 		res = strsplit(result,'+'); //split the string into an array of strings
ORI	R26, R0, 43
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;String.c,44 :: 		res = StrChecker(string[1]);//Test current string index for equality return index
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_StrChecker+0
NOP	
; res start address is: 20 (R5)
SEH	R5, R2
;String.c,46 :: 		memset(writebuff,0,64);     //empty usb write buffer
ORI	R27, R0, 64
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memset+0
NOP	
;String.c,48 :: 		sprintf(txtR,"%u",res);
ADDIU	R3, SP, 18
ADDIU	SP, SP, -12
SH	R5, 8(SP)
; res end address is: 20 (R5)
LUI	R2, hi_addr(?lstr_12_String+0)
ORI	R2, R2, lo_addr(?lstr_12_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,49 :: 		strcat(writebuff,txtR);
ADDIU	R2, SP, 18
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
;String.c,50 :: 		testStrings(&writebuff);
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_testStrings+0
NOP	
;String.c,51 :: 		strcat(writebuff,"\r\n");
ORI	R30, R0, 13
SB	R30, 24(SP)
ORI	R30, R0, 10
SB	R30, 25(SP)
MOVZ	R30, R0, R0
SB	R30, 26(SP)
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
;String.c,52 :: 		while(!HID_Write(&writebuff,64));
L_DoStrings0:
SH	R25, 16(SP)
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
LH	R25, 16(SP)
BEQ	R2, R0, L__DoStrings42
NOP	
J	L_DoStrings1
NOP	
L__DoStrings42:
J	L_DoStrings0
NOP	
L_DoStrings1:
;String.c,78 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,79 :: 		}
;String.c,78 :: 		return 0;
;String.c,79 :: 		}
L_end_DoStrings:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 92
JR	RA
NOP	
; end of _DoStrings
_clr_str_arrays:
;String.c,84 :: 		void clr_str_arrays(char str[10][64]){
;String.c,86 :: 		for(i = 0;i < 10;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_clr_str_arrays2:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 10
BNE	R2, R0, L__clr_str_arrays44
NOP	
J	L_clr_str_arrays3
NOP	
L__clr_str_arrays44:
;String.c,87 :: 		for(j = 0;j<64;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_clr_str_arrays5:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 64
BNE	R2, R0, L__clr_str_arrays45
NOP	
J	L_clr_str_arrays6
NOP	
L__clr_str_arrays45:
;String.c,88 :: 		str[i][j] = 0;
SEH	R2, R4
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R5
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,87 :: 		for(j = 0;j<64;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,89 :: 		}
; j end address is: 20 (R5)
J	L_clr_str_arrays5
NOP	
L_clr_str_arrays6:
;String.c,86 :: 		for(i = 0;i < 10;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,90 :: 		}
; i end address is: 16 (R4)
J	L_clr_str_arrays2
NOP	
L_clr_str_arrays3:
;String.c,91 :: 		}
L_end_clr_str_arrays:
JR	RA
NOP	
; end of _clr_str_arrays
_setstr:
;String.c,96 :: 		char* setstr(char conf[64]){
;String.c,98 :: 		for(i=0;i < 64;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_setstr8:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 64
BNE	R2, R0, L__setstr47
NOP	
J	L_setstr9
NOP	
L__setstr47:
;String.c,99 :: 		if((conf[i] == 0x0D)|| (conf[i] == 0x0A))
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L__setstr49
NOP	
J	L__setstr38
NOP	
L__setstr49:
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L__setstr51
NOP	
J	L__setstr37
NOP	
L__setstr51:
J	L_setstr13
NOP	
L__setstr38:
L__setstr37:
;String.c,100 :: 		break;
J	L_setstr9
NOP	
L_setstr13:
;String.c,98 :: 		for(i=0;i < 64;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,101 :: 		}
J	L_setstr8
NOP	
L_setstr9:
;String.c,102 :: 		conf[i+1] = 0;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
SEH	R2, R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;String.c,104 :: 		return conf;
MOVZ	R2, R25, R0
;String.c,105 :: 		}
L_end_setstr:
JR	RA
NOP	
; end of _setstr
_strsplit:
;String.c,110 :: 		int strsplit(char str[64], char c){
;String.c,112 :: 		ii=kk=0;
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,113 :: 		for (i = 0; i < 64;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 24 (R6)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
L_strsplit14:
; i start address is: 16 (R4)
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
SEH	R2, R4
SLTI	R2, R2, 64
BNE	R2, R0, L__strsplit53
NOP	
J	L__strsplit39
NOP	
L__strsplit53:
;String.c,115 :: 		if(str[i] == c){
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R26, 255
BEQ	R3, R2, L__strsplit54
NOP	
J	L_strsplit17
NOP	
L__strsplit54:
;String.c,116 :: 		string[kk][ii] = 0;
SEH	R2, R5
SLL	R3, R2, 6
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
ADDU	R3, R2, R3
SEH	R2, R6
; ii end address is: 24 (R6)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,117 :: 		kk++;
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,118 :: 		ii=0;
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,119 :: 		goto endb;
J	___strsplit_endb
NOP	
;String.c,120 :: 		}else{
L_strsplit17:
;String.c,121 :: 		string[kk][ii] = str[i];
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
;String.c,122 :: 		ii++;
ADDIU	R2, R6, 1
SEH	R6, R2
; ii end address is: 24 (R6)
; kk end address is: 20 (R5)
;String.c,125 :: 		endb:
___strsplit_endb:
;String.c,126 :: 		if(str[i]==0)
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit55
NOP	
J	L_strsplit19
NOP	
L__strsplit55:
; ii end address is: 24 (R6)
; i end address is: 16 (R4)
;String.c,127 :: 		break;
SEH	R2, R5
J	L_strsplit15
NOP	
L_strsplit19:
;String.c,113 :: 		for (i = 0; i < 64;i++){
; i start address is: 16 (R4)
; ii start address is: 24 (R6)
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,128 :: 		}
; ii end address is: 24 (R6)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
J	L_strsplit14
NOP	
L__strsplit39:
;String.c,113 :: 		for (i = 0; i < 64;i++){
SEH	R2, R5
;String.c,128 :: 		}
L_strsplit15:
;String.c,129 :: 		return kk;
; kk start address is: 8 (R2)
; kk end address is: 8 (R2)
;String.c,130 :: 		}
L_end_strsplit:
JR	RA
NOP	
; end of _strsplit
_StrChecker:
;String.c,135 :: 		int StrChecker(char str[64]){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,137 :: 		for(i = 0;i < 12;i++){
SW	R26, 4(SP)
SW	R27, 8(SP)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_StrChecker20:
; i start address is: 20 (R5)
SEH	R2, R5
SLTI	R2, R2, 12
BNE	R2, R0, L__StrChecker57
NOP	
J	L_StrChecker21
NOP	
L__StrChecker57:
;String.c,138 :: 		if(strncmp(str,com[i],strlen(com[i]))==0)
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_com+0)
ORI	R2, R2, lo_addr(_com+0)
ADDU	R2, R2, R3
SW	R25, 12(SP)
LW	R25, 0(R2)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R3, R5
SLL	R4, R3, 2
LUI	R3, hi_addr(_com+0)
ORI	R3, R3, lo_addr(_com+0)
ADDU	R3, R3, R4
LW	R3, 0(R3)
SW	R25, 12(SP)
SEH	R27, R2
MOVZ	R26, R3, R0
JAL	_strncmp+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BEQ	R2, R0, L__StrChecker58
NOP	
J	L_StrChecker23
NOP	
L__StrChecker58:
;String.c,139 :: 		break;
J	L_StrChecker21
NOP	
L_StrChecker23:
;String.c,137 :: 		for(i = 0;i < 12;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,140 :: 		}
J	L_StrChecker20
NOP	
L_StrChecker21:
;String.c,141 :: 		return i;
SEH	R2, R5
; i end address is: 20 (R5)
;String.c,142 :: 		}
;String.c,141 :: 		return i;
;String.c,142 :: 		}
L_end_StrChecker:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _StrChecker
_testStrings:
;String.c,147 :: 		void testStrings(char* writebuff){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,148 :: 		if(strlen(string[0])!=0)strncat(writebuff,string[0],strlen(string[0]));
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings61
NOP	
J	L_testStrings24
NOP	
L__testStrings61:
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
L_testStrings24:
;String.c,149 :: 		if(strlen(string[1])!=0)strncat(writebuff,string[1],strlen(string[1]));
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings63
NOP	
J	L_testStrings25
NOP	
L__testStrings63:
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
L_testStrings25:
;String.c,150 :: 		if(strlen(string[2])!=0)strncat(writebuff,string[2],strlen(string[2]));
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings65
NOP	
J	L_testStrings26
NOP	
L__testStrings65:
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
L_testStrings26:
;String.c,151 :: 		if(strlen(string[3])!=0)strncat(writebuff,string[3],strlen(string[3]));
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings67
NOP	
J	L_testStrings27
NOP	
L__testStrings67:
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
L_testStrings27:
;String.c,152 :: 		if(strlen(string[4])!=0)strncat(writebuff,string[4],strlen(string[4]));
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings69
NOP	
J	L_testStrings28
NOP	
L__testStrings69:
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
L_testStrings28:
;String.c,153 :: 		if(strlen(string[5])!=0)strncat(writebuff,string[5],strlen(string[5]));
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings71
NOP	
J	L_testStrings29
NOP	
L__testStrings71:
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
L_testStrings29:
;String.c,155 :: 		}
L_end_testStrings:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _testStrings
_WriteData:
;String.c,160 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;String.c,163 :: 		memset(writebuff,0,64);
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
;String.c,164 :: 		strncat(writebuff,_data,strlen(_data));
JAL	_strlen+0
NOP	
SEH	R27, R2
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncat+0
NOP	
;String.c,165 :: 		HID_Write(&writebuff,64);
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
;String.c,166 :: 		}
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
;String.c,171 :: 		char* Read_Send_AllColour(){
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;String.c,174 :: 		TCS3472_getRawData(RawData);
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,176 :: 		str = "C || R | G | B | = || ";
ADDIU	R23, SP, 24
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr14_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr14_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 24
SW	R2, 20(SP)
;String.c,177 :: 		sprintf(txtR,"%u",RawData[0]);
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_15_String+0)
ORI	R2, R2, lo_addr(?lstr_15_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,178 :: 		strcat(str,txtR);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
LW	R25, 20(SP)
JAL	_strcat+0
NOP	
;String.c,179 :: 		strcat(str," || ");
ORI	R30, R0, 32
SB	R30, 47(SP)
ORI	R30, R0, 124
SB	R30, 48(SP)
ORI	R30, R0, 124
SB	R30, 49(SP)
ORI	R30, R0, 32
SB	R30, 50(SP)
MOVZ	R30, R0, R0
SB	R30, 51(SP)
ADDIU	R2, SP, 47
MOVZ	R26, R2, R0
LW	R25, 20(SP)
JAL	_strcat+0
NOP	
;String.c,181 :: 		sprintf(txtR,"%u",RawData[1]);
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_17_String+0)
ORI	R2, R2, lo_addr(?lstr_17_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,182 :: 		strcat(str,txtR);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
LW	R25, 20(SP)
JAL	_strcat+0
NOP	
;String.c,183 :: 		strcat(str," | ");
ORI	R30, R0, 32
SB	R30, 52(SP)
ORI	R30, R0, 124
SB	R30, 53(SP)
ORI	R30, R0, 32
SB	R30, 54(SP)
MOVZ	R30, R0, R0
SB	R30, 55(SP)
ADDIU	R2, SP, 52
MOVZ	R26, R2, R0
LW	R25, 20(SP)
JAL	_strcat+0
NOP	
;String.c,185 :: 		sprintf(txtR,"%u",RawData[2]);
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_19_String+0)
ORI	R2, R2, lo_addr(?lstr_19_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,186 :: 		strcat(str,txtR);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
LW	R25, 20(SP)
JAL	_strcat+0
NOP	
;String.c,187 :: 		strcat(str," | ");
ORI	R30, R0, 32
SB	R30, 56(SP)
ORI	R30, R0, 124
SB	R30, 57(SP)
ORI	R30, R0, 32
SB	R30, 58(SP)
MOVZ	R30, R0, R0
SB	R30, 59(SP)
ADDIU	R2, SP, 56
MOVZ	R26, R2, R0
LW	R25, 20(SP)
JAL	_strcat+0
NOP	
;String.c,189 :: 		sprintf(txtR,"%u",RawData[3]);
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_21_String+0)
ORI	R2, R2, lo_addr(?lstr_21_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,190 :: 		strcat(str,txtR);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
LW	R25, 20(SP)
JAL	_strcat+0
NOP	
;String.c,191 :: 		strcat(str," || ");
ORI	R30, R0, 32
SB	R30, 60(SP)
ORI	R30, R0, 124
SB	R30, 61(SP)
ORI	R30, R0, 124
SB	R30, 62(SP)
ORI	R30, R0, 32
SB	R30, 63(SP)
MOVZ	R30, R0, R0
SB	R30, 64(SP)
ADDIU	R2, SP, 60
MOVZ	R26, R2, R0
LW	R25, 20(SP)
JAL	_strcat+0
NOP	
;String.c,193 :: 		CCT =TCS3472_CalcColTemp_dn40(&RawData,it);
LBU	R26, Offset(_it+0)(GP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_CalcColTemp_dn40+0
NOP	
SH	R2, Offset(_CCT+0)(GP)
;String.c,194 :: 		sprintf(txtR,"%u",CCT);
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_23_String+0)
ORI	R2, R2, lo_addr(?lstr_23_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,195 :: 		strcat(str,txtR);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
LW	R25, 20(SP)
JAL	_strcat+0
NOP	
;String.c,196 :: 		strcat(str," ||\r\n");
ORI	R30, R0, 32
SB	R30, 65(SP)
ORI	R30, R0, 124
SB	R30, 66(SP)
ORI	R30, R0, 124
SB	R30, 67(SP)
ORI	R30, R0, 13
SB	R30, 68(SP)
ORI	R30, R0, 10
SB	R30, 69(SP)
MOVZ	R30, R0, R0
SB	R30, 70(SP)
ADDIU	R2, SP, 65
MOVZ	R26, R2, R0
LW	R25, 20(SP)
JAL	_strcat+0
NOP	
;String.c,198 :: 		return str;
LW	R2, 20(SP)
;String.c,199 :: 		}
;String.c,198 :: 		return str;
;String.c,199 :: 		}
L_end_Read_Send_AllColour:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 72
JR	RA
NOP	
; end of _Read_Send_AllColour
_Read_Send_OneColour:
;String.c,201 :: 		void Read_Send_OneColour(int colr){
ADDIU	SP, SP, -88
SW	RA, 0(SP)
;String.c,205 :: 		memset(str,'_',64);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R2, SP, 19
SH	R25, 16(SP)
ORI	R27, R0, 64
ORI	R26, R0, 95
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LH	R25, 16(SP)
;String.c,207 :: 		switch(colr){
J	L_Read_Send_OneColour30
NOP	
;String.c,208 :: 		case 7:
L_Read_Send_OneColour32:
;String.c,209 :: 		col = TCS3472_Read16(TCS3472_RDATAL);
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
;String.c,210 :: 		sprintf(txtR,"%u",col);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_25_String+0)
ORI	R2, R2, lo_addr(?lstr_25_String+0)
SW	R2, 4(SP)
LBU	R2, 30(SP)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,211 :: 		break;
J	L_Read_Send_OneColour31
NOP	
;String.c,212 :: 		case 8:
L_Read_Send_OneColour33:
;String.c,213 :: 		col = TCS3472_Read16(TCS3472_GDATAL);
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
;String.c,214 :: 		sprintf(txtR,"%u",col);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_26_String+0)
ORI	R2, R2, lo_addr(?lstr_26_String+0)
SW	R2, 4(SP)
LBU	R2, 30(SP)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,215 :: 		break;
J	L_Read_Send_OneColour31
NOP	
;String.c,216 :: 		case 9:
L_Read_Send_OneColour34:
;String.c,217 :: 		col = TCS3472_Read16(TCS3472_BDATAL);
ORI	R25, R0, 26
JAL	_TCS3472_Read16+0
NOP	
;String.c,218 :: 		sprintf(txtR,"%u",col);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_27_String+0)
ORI	R2, R2, lo_addr(?lstr_27_String+0)
SW	R2, 4(SP)
LBU	R2, 30(SP)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,219 :: 		break;
J	L_Read_Send_OneColour31
NOP	
;String.c,220 :: 		case 10:
L_Read_Send_OneColour35:
;String.c,221 :: 		col = TCS3472_Read16(TCS3472_CDATAL);
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
;String.c,222 :: 		sprintf(txtR,"%u",col);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_28_String+0)
ORI	R2, R2, lo_addr(?lstr_28_String+0)
SW	R2, 4(SP)
LBU	R2, 30(SP)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,223 :: 		break;
J	L_Read_Send_OneColour31
NOP	
;String.c,224 :: 		}
L_Read_Send_OneColour30:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Read_Send_OneColour76
NOP	
J	L_Read_Send_OneColour32
NOP	
L__Read_Send_OneColour76:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Read_Send_OneColour78
NOP	
J	L_Read_Send_OneColour33
NOP	
L__Read_Send_OneColour78:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Read_Send_OneColour80
NOP	
J	L_Read_Send_OneColour34
NOP	
L__Read_Send_OneColour80:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Read_Send_OneColour82
NOP	
J	L_Read_Send_OneColour35
NOP	
L__Read_Send_OneColour82:
L_Read_Send_OneColour31:
;String.c,225 :: 		WriteData(str);
ADDIU	R2, SP, 19
MOVZ	R25, R2, R0
JAL	_WriteData+0
NOP	
;String.c,226 :: 		WriteData("\r\n");
ORI	R30, R0, 13
SB	R30, 83(SP)
ORI	R30, R0, 10
SB	R30, 84(SP)
MOVZ	R30, R0, R0
SB	R30, 85(SP)
ADDIU	R2, SP, 83
MOVZ	R25, R2, R0
JAL	_WriteData+0
NOP	
;String.c,227 :: 		}
L_end_Read_Send_OneColour:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 88
JR	RA
NOP	
; end of _Read_Send_OneColour
String____?ag:
L_end_String___?ag:
JR	RA
NOP	
; end of String____?ag
