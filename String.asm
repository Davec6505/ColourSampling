_InitString:
;String.c,27 :: 		PString InitString(char cmp){
ADDIU	SP, SP, -1292
; su_addr start address is: 8 (R2)
MOVZ	R2, R30, R0
; su_addr end address is: 8 (R2)
;String.c,31 :: 		}
L_end_InitString:
ADDIU	SP, SP, 1292
JR	RA
NOP	
; end of _InitString
_DoStrings:
;String.c,36 :: 		int DoStrings(int num){
ADDIU	SP, SP, -88
SW	RA, 0(SP)
;String.c,38 :: 		char *result,conf[64] = "";
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 24
ADDIU	R22, R23, 64
LUI	R24, hi_addr(?ICSDoStrings_conf_L0+0)
ORI	R24, R24, lo_addr(?ICSDoStrings_conf_L0+0)
JAL	___CC2DW+0
NOP	
;String.c,45 :: 		clr_str_arrays(string);     //clear the strings in the array
SH	R25, 16(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_clr_str_arrays+0
NOP	
LH	R25, 16(SP)
;String.c,46 :: 		memcpy(conf,readbuff,num);  //copy the USB buffer to a temp arrar
ADDIU	R2, SP, 24
SEH	R27, R25
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;String.c,47 :: 		result = setstr(conf);       //look for '\r' '\n' and move result to a string
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_setstr+0
NOP	
;String.c,48 :: 		res0 = strsplit(result,'+'); //split the string into an array of strings return num of arr's
ORI	R26, R0, 43
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;String.c,49 :: 		res1 = StrChecker(string[1]);//Test current string index for equality return index
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_StrChecker+0
NOP	
; res1 start address is: 20 (R5)
SEH	R5, R2
;String.c,51 :: 		memset(writebuff,0,64);     //empty usb write buffer
ORI	R27, R0, 64
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memset+0
NOP	
;String.c,61 :: 		switch(res1){
J	L_DoStrings0
NOP	
; res1 end address is: 20 (R5)
;String.c,62 :: 		case CONFIG :
L_DoStrings2:
;String.c,63 :: 		err = TCS3472_SetIntergration_Time(3);
ORI	R25, R0, 3
JAL	_TCS3472_SetIntergration_Time+0
NOP	
;String.c,64 :: 		break;
J	L_DoStrings1
NOP	
;String.c,65 :: 		case READA :
L_DoStrings3:
;String.c,66 :: 		str = Read_Send_AllColour();             break;
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, 20(SP)
J	L_DoStrings1
NOP	
;String.c,67 :: 		case READR :
L_DoStrings4:
;String.c,68 :: 		str = Read_Send_OneColour(READR);
ORI	R25, R0, 7
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,69 :: 		break;
J	L_DoStrings1
NOP	
;String.c,70 :: 		case READG :
L_DoStrings5:
;String.c,71 :: 		str = Read_Send_OneColour(READG);
ORI	R25, R0, 8
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,72 :: 		break;
J	L_DoStrings1
NOP	
;String.c,73 :: 		case READB :
L_DoStrings6:
;String.c,74 :: 		str = Read_Send_OneColour(READB);
ORI	R25, R0, 9
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,75 :: 		break;
J	L_DoStrings1
NOP	
;String.c,76 :: 		case READC :
L_DoStrings7:
;String.c,77 :: 		str = Read_Send_OneColour(READC);
ORI	R25, R0, 10
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,78 :: 		break;
J	L_DoStrings1
NOP	
;String.c,79 :: 		case READT :
L_DoStrings8:
;String.c,80 :: 		str = Read_Send_OneColour(READT);
ORI	R25, R0, 11
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,81 :: 		break;
J	L_DoStrings1
NOP	
;String.c,82 :: 		case READT_DN40 :
L_DoStrings9:
;String.c,83 :: 		str = Read_Send_OneColour(READT_DN40);
ORI	R25, R0, 12
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,84 :: 		break;
J	L_DoStrings1
NOP	
;String.c,85 :: 		default:
L_DoStrings10:
;String.c,86 :: 		strncat(str,"No data requested!",18);
ORI	R27, R0, 18
LUI	R26, hi_addr(?lstr14_String+0)
ORI	R26, R26, lo_addr(?lstr14_String+0)
LW	R25, 20(SP)
JAL	_strncat+0
NOP	
;String.c,87 :: 		break;
J	L_DoStrings1
NOP	
;String.c,88 :: 		}
L_DoStrings0:
; res1 start address is: 20 (R5)
SEH	R2, R5
BNE	R2, R0, L__DoStrings56
NOP	
J	L_DoStrings2
NOP	
L__DoStrings56:
SEH	R3, R5
ORI	R2, R0, 6
BNE	R3, R2, L__DoStrings58
NOP	
J	L_DoStrings3
NOP	
L__DoStrings58:
SEH	R3, R5
ORI	R2, R0, 7
BNE	R3, R2, L__DoStrings60
NOP	
J	L_DoStrings4
NOP	
L__DoStrings60:
SEH	R3, R5
ORI	R2, R0, 8
BNE	R3, R2, L__DoStrings62
NOP	
J	L_DoStrings5
NOP	
L__DoStrings62:
SEH	R3, R5
ORI	R2, R0, 9
BNE	R3, R2, L__DoStrings64
NOP	
J	L_DoStrings6
NOP	
L__DoStrings64:
SEH	R3, R5
ORI	R2, R0, 10
BNE	R3, R2, L__DoStrings66
NOP	
J	L_DoStrings7
NOP	
L__DoStrings66:
SEH	R3, R5
ORI	R2, R0, 11
BNE	R3, R2, L__DoStrings68
NOP	
J	L_DoStrings8
NOP	
L__DoStrings68:
SEH	R3, R5
; res1 end address is: 20 (R5)
ORI	R2, R0, 12
BNE	R3, R2, L__DoStrings70
NOP	
J	L_DoStrings9
NOP	
L__DoStrings70:
J	L_DoStrings10
NOP	
L_DoStrings1:
;String.c,92 :: 		strncat(writebuff,str,strlen(str));
LW	R25, 20(SP)
JAL	_strlen+0
NOP	
SEH	R27, R2
LW	R26, 20(SP)
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncat+0
NOP	
;String.c,93 :: 		while(!HID_Write(&writebuff,64));
L_DoStrings11:
SH	R25, 16(SP)
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
LH	R25, 16(SP)
BEQ	R2, R0, L__DoStrings71
NOP	
J	L_DoStrings12
NOP	
L__DoStrings71:
J	L_DoStrings11
NOP	
L_DoStrings12:
;String.c,97 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,98 :: 		}
;String.c,97 :: 		return 0;
;String.c,98 :: 		}
L_end_DoStrings:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 88
JR	RA
NOP	
; end of _DoStrings
_clr_str_arrays:
;String.c,103 :: 		void clr_str_arrays(char str[20][64]){
;String.c,105 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_clr_str_arrays13:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__clr_str_arrays73
NOP	
J	L_clr_str_arrays14
NOP	
L__clr_str_arrays73:
;String.c,106 :: 		for(j = 0;j<64;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_clr_str_arrays16:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 64
BNE	R2, R0, L__clr_str_arrays74
NOP	
J	L_clr_str_arrays17
NOP	
L__clr_str_arrays74:
;String.c,107 :: 		str[i][j] = 0;
SEH	R2, R4
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R5
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,106 :: 		for(j = 0;j<64;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,108 :: 		}
; j end address is: 20 (R5)
J	L_clr_str_arrays16
NOP	
L_clr_str_arrays17:
;String.c,105 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,110 :: 		}
; i end address is: 16 (R4)
J	L_clr_str_arrays13
NOP	
L_clr_str_arrays14:
;String.c,111 :: 		}
L_end_clr_str_arrays:
JR	RA
NOP	
; end of _clr_str_arrays
_setstr:
;String.c,116 :: 		char* setstr(char conf[64]){
;String.c,118 :: 		for(i=0;i < 64;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_setstr19:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 64
BNE	R2, R0, L__setstr76
NOP	
J	L_setstr20
NOP	
L__setstr76:
;String.c,119 :: 		if((conf[i] == 0x0D)|| (conf[i] == 0x0A))
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L__setstr78
NOP	
J	L__setstr52
NOP	
L__setstr78:
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L__setstr80
NOP	
J	L__setstr51
NOP	
L__setstr80:
J	L_setstr24
NOP	
L__setstr52:
L__setstr51:
;String.c,120 :: 		break;
J	L_setstr20
NOP	
L_setstr24:
;String.c,118 :: 		for(i=0;i < 64;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,121 :: 		}
J	L_setstr19
NOP	
L_setstr20:
;String.c,122 :: 		conf[i+1] = 0;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
SEH	R2, R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;String.c,124 :: 		return conf;
MOVZ	R2, R25, R0
;String.c,125 :: 		}
L_end_setstr:
JR	RA
NOP	
; end of _setstr
_strsplit:
;String.c,130 :: 		int strsplit(char str[64], char c){
;String.c,132 :: 		ii=kk=0;
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,133 :: 		for (i = 0; i < 64;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 24 (R6)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
L_strsplit25:
; i start address is: 16 (R4)
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
SEH	R2, R4
SLTI	R2, R2, 64
BNE	R2, R0, L__strsplit82
NOP	
J	L_strsplit26
NOP	
L__strsplit82:
;String.c,134 :: 		if(str[i] == c){
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R26, 255
BEQ	R3, R2, L__strsplit83
NOP	
J	L_strsplit28
NOP	
L__strsplit83:
;String.c,135 :: 		string[kk][ii] = 0;
SEH	R2, R5
SLL	R3, R2, 6
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
ADDU	R3, R2, R3
SEH	R2, R6
; ii end address is: 24 (R6)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,136 :: 		kk++;
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,137 :: 		ii=0;
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,138 :: 		continue;//goto endb;
J	L_strsplit27
NOP	
;String.c,139 :: 		}else{
L_strsplit28:
;String.c,140 :: 		string[kk][ii] = str[i];
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
;String.c,141 :: 		ii++;
ADDIU	R2, R6, 1
; ii end address is: 24 (R6)
; ii start address is: 12 (R3)
SEH	R3, R2
;String.c,145 :: 		if(str[i]==0)
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit84
NOP	
J	L_strsplit30
NOP	
L__strsplit84:
; ii end address is: 12 (R3)
; i end address is: 16 (R4)
;String.c,146 :: 		break;
J	L_strsplit26
NOP	
L_strsplit30:
;String.c,147 :: 		}
; i start address is: 16 (R4)
; ii start address is: 12 (R3)
; kk end address is: 20 (R5)
SEH	R6, R3
L_strsplit27:
; ii end address is: 12 (R3)
;String.c,133 :: 		for (i = 0; i < 64;i++){
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,147 :: 		}
; ii end address is: 24 (R6)
; i end address is: 16 (R4)
J	L_strsplit25
NOP	
L_strsplit26:
;String.c,148 :: 		return kk;
SEH	R2, R5
; kk end address is: 20 (R5)
;String.c,149 :: 		}
L_end_strsplit:
JR	RA
NOP	
; end of _strsplit
_StrChecker:
;String.c,154 :: 		int StrChecker(char *str){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,158 :: 		if(!once){
SW	R26, 4(SP)
SW	R27, 8(SP)
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
EXT	R2, R2, BitPos(StrChecker_once_L0+0), 1
BEQ	R2, R0, L__StrChecker86
NOP	
J	L_StrChecker31
NOP	
L__StrChecker86:
;String.c,159 :: 		once = 1;
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
ORI	R2, R2, BitMask(StrChecker_once_L0+0)
SB	R2, Offset(StrChecker_once_L0+0)(GP)
;String.c,160 :: 		enum_val = enum_num;
ORI	R2, R0, 13
SH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
;String.c,161 :: 		}
L_StrChecker31:
;String.c,162 :: 		for(i = 0;i < enum_val;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_StrChecker32:
; i start address is: 20 (R5)
SEH	R3, R5
LH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__StrChecker87
NOP	
J	L_StrChecker33
NOP	
L__StrChecker87:
;String.c,163 :: 		if(strncmp(str,com[i],strlen(str)-1)==0)
JAL	_strlen+0
NOP	
ADDIU	R4, R2, -1
SEH	R2, R5
SLL	R3, R2, 2
LUI	R2, hi_addr(_com+0)
ORI	R2, R2, lo_addr(_com+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
SW	R25, 12(SP)
ANDI	R27, R4, 255
MOVZ	R26, R2, R0
JAL	_strncmp+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BEQ	R2, R0, L__StrChecker88
NOP	
J	L_StrChecker35
NOP	
L__StrChecker88:
;String.c,164 :: 		break;
J	L_StrChecker33
NOP	
L_StrChecker35:
;String.c,162 :: 		for(i = 0;i < enum_val;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,165 :: 		}
J	L_StrChecker32
NOP	
L_StrChecker33:
;String.c,166 :: 		return i;
SEH	R2, R5
; i end address is: 20 (R5)
;String.c,167 :: 		}
;String.c,166 :: 		return i;
;String.c,167 :: 		}
L_end_StrChecker:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _StrChecker
_WriteData:
;String.c,172 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;String.c,175 :: 		memset(writebuff,0,64);
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
;String.c,176 :: 		strncpy(writebuff,_data,strlen(_data));
JAL	_strlen+0
NOP	
SEH	R27, R2
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncpy+0
NOP	
;String.c,177 :: 		HID_Write(&writebuff,64);
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
;String.c,178 :: 		}
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
;String.c,183 :: 		char* Read_Send_AllColour(){
ADDIU	SP, SP, -88
SW	RA, 0(SP)
;String.c,188 :: 		TCS3472_getRawData(RawData);
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,190 :: 		strcpy(str,"C || R | G | B | = || ");
ADDIU	R2, SP, 21
LUI	R26, hi_addr(?lstr15_String+0)
ORI	R26, R26, lo_addr(?lstr15_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,191 :: 		sprintf(txtR,"%u",RawData[0]);
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_16_String+0)
ORI	R2, R2, lo_addr(?lstr_16_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,192 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 21
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,193 :: 		strcat(str," || ");
ADDIU	R2, SP, 21
LUI	R26, hi_addr(?lstr17_String+0)
ORI	R26, R26, lo_addr(?lstr17_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,195 :: 		sprintf(txtR,"%u",RawData[1]);
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_18_String+0)
ORI	R2, R2, lo_addr(?lstr_18_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,196 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 21
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,197 :: 		strcat(str," | ");
ADDIU	R2, SP, 21
LUI	R26, hi_addr(?lstr19_String+0)
ORI	R26, R26, lo_addr(?lstr19_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,199 :: 		sprintf(txtR,"%u",RawData[2]);
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_20_String+0)
ORI	R2, R2, lo_addr(?lstr_20_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,200 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 21
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,201 :: 		strcat(str," | ");
ADDIU	R2, SP, 21
LUI	R26, hi_addr(?lstr21_String+0)
ORI	R26, R26, lo_addr(?lstr21_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,203 :: 		sprintf(txtR,"%u",RawData[3]);
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_22_String+0)
ORI	R2, R2, lo_addr(?lstr_22_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,204 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 21
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,205 :: 		strcat(str," || ");
ADDIU	R2, SP, 21
LUI	R26, hi_addr(?lstr23_String+0)
ORI	R26, R26, lo_addr(?lstr23_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,208 :: 		err = TCS3472_C2RGB_Error(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_C2RGB_Error+0
NOP	
;String.c,209 :: 		sprintf(txtR,"%5d",err);
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_24_String+0)
ORI	R2, R2, lo_addr(?lstr_24_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,210 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 21
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,211 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 21
LUI	R26, hi_addr(?lstr25_String+0)
ORI	R26, R26, lo_addr(?lstr25_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,213 :: 		return &str;
ADDIU	R2, SP, 21
;String.c,214 :: 		}
;String.c,213 :: 		return &str;
;String.c,214 :: 		}
L_end_Read_Send_AllColour:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 88
JR	RA
NOP	
; end of _Read_Send_AllColour
_Read_Send_OneColour:
;String.c,219 :: 		char* Read_Send_OneColour(int colr){
ADDIU	SP, SP, -92
SW	RA, 0(SP)
;String.c,223 :: 		switch(colr){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Read_Send_OneColour36
NOP	
;String.c,224 :: 		case READR:
L_Read_Send_OneColour38:
;String.c,225 :: 		col = TCS3472_Read16(TCS3472_RDATAL);
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,226 :: 		strcpy(str,"R = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr26_String+0)
ORI	R26, R26, lo_addr(?lstr26_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,227 :: 		sprintf(txtR,"%5u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_27_String+0)
ORI	R2, R2, lo_addr(?lstr_27_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,228 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,229 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr28_String+0)
ORI	R26, R26, lo_addr(?lstr28_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,230 :: 		break;
J	L_Read_Send_OneColour37
NOP	
;String.c,231 :: 		case READG:
L_Read_Send_OneColour39:
;String.c,232 :: 		col = TCS3472_Read16(TCS3472_GDATAL);
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,233 :: 		strcpy(str,"G = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr29_String+0)
ORI	R26, R26, lo_addr(?lstr29_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,234 :: 		sprintf(txtR,"%5u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_30_String+0)
ORI	R2, R2, lo_addr(?lstr_30_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,235 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,236 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr31_String+0)
ORI	R26, R26, lo_addr(?lstr31_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,237 :: 		break;
J	L_Read_Send_OneColour37
NOP	
;String.c,238 :: 		case READB:
L_Read_Send_OneColour40:
;String.c,239 :: 		col = TCS3472_Read16(TCS3472_BDATAL);
ORI	R25, R0, 26
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,240 :: 		strcpy(str,"B = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr32_String+0)
ORI	R26, R26, lo_addr(?lstr32_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,241 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_33_String+0)
ORI	R2, R2, lo_addr(?lstr_33_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,242 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,243 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr34_String+0)
ORI	R26, R26, lo_addr(?lstr34_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,244 :: 		break;
J	L_Read_Send_OneColour37
NOP	
;String.c,245 :: 		case READC:
L_Read_Send_OneColour41:
;String.c,246 :: 		col = TCS3472_Read16(TCS3472_CDATAL);
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,247 :: 		strcpy(str,"C = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr35_String+0)
ORI	R26, R26, lo_addr(?lstr35_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,248 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_36_String+0)
ORI	R2, R2, lo_addr(?lstr_36_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,249 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,250 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr37_String+0)
ORI	R26, R26, lo_addr(?lstr37_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,251 :: 		break;
J	L_Read_Send_OneColour37
NOP	
;String.c,252 :: 		case READT:
L_Read_Send_OneColour42:
;String.c,253 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,254 :: 		col = TCS3472_CalcColTemp(RawData[1],RawData[3],RawData[3]);
LHU	R27, Offset(_RawData+6)(GP)
LHU	R26, Offset(_RawData+6)(GP)
LHU	R25, Offset(_RawData+2)(GP)
JAL	_TCS3472_CalcColTemp+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,255 :: 		strcpy(str,"T = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr38_String+0)
ORI	R26, R26, lo_addr(?lstr38_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,256 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_39_String+0)
ORI	R2, R2, lo_addr(?lstr_39_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,257 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,258 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr40_String+0)
ORI	R26, R26, lo_addr(?lstr40_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,259 :: 		break;
J	L_Read_Send_OneColour37
NOP	
;String.c,260 :: 		case READT_DN40:
L_Read_Send_OneColour43:
;String.c,261 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,262 :: 		col = TCS3472_CalcColTemp_dn40(RawData,it);
LBU	R26, Offset(_it+0)(GP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_CalcColTemp_dn40+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,263 :: 		strcpy(str,"T_DN40 = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr41_String+0)
ORI	R26, R26, lo_addr(?lstr41_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,264 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_42_String+0)
ORI	R2, R2, lo_addr(?lstr_42_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,265 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,266 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr43_String+0)
ORI	R26, R26, lo_addr(?lstr43_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,267 :: 		break;
J	L_Read_Send_OneColour37
NOP	
;String.c,268 :: 		}
L_Read_Send_OneColour36:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Read_Send_OneColour93
NOP	
J	L_Read_Send_OneColour38
NOP	
L__Read_Send_OneColour93:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Read_Send_OneColour95
NOP	
J	L_Read_Send_OneColour39
NOP	
L__Read_Send_OneColour95:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Read_Send_OneColour97
NOP	
J	L_Read_Send_OneColour40
NOP	
L__Read_Send_OneColour97:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Read_Send_OneColour99
NOP	
J	L_Read_Send_OneColour41
NOP	
L__Read_Send_OneColour99:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Read_Send_OneColour101
NOP	
J	L_Read_Send_OneColour42
NOP	
L__Read_Send_OneColour101:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Read_Send_OneColour103
NOP	
J	L_Read_Send_OneColour43
NOP	
L__Read_Send_OneColour103:
L_Read_Send_OneColour37:
;String.c,269 :: 		return &str;
ADDIU	R2, SP, 26
;String.c,270 :: 		}
;String.c,269 :: 		return &str;
;String.c,270 :: 		}
L_end_Read_Send_OneColour:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 92
JR	RA
NOP	
; end of _Read_Send_OneColour
_Get_It:
;String.c,272 :: 		int Get_It(){
;String.c,273 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,274 :: 		}
L_end_Get_It:
JR	RA
NOP	
; end of _Get_It
_Get_Gain:
;String.c,276 :: 		int Get_Gain(){
;String.c,277 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,278 :: 		}
L_end_Get_Gain:
JR	RA
NOP	
; end of _Get_Gain
_testStrings:
;String.c,283 :: 		void testStrings(char* writebuff){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,284 :: 		if(strlen(string[0])!=0){
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings108
NOP	
J	L_testStrings44
NOP	
L__testStrings108:
;String.c,285 :: 		strncat(writebuff,string[0],strlen(string[0]));
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
;String.c,286 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr44_String+0)
ORI	R26, R26, lo_addr(?lstr44_String+0)
JAL	_strcat+0
NOP	
;String.c,287 :: 		}
L_testStrings44:
;String.c,288 :: 		if(strlen(string[1])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings110
NOP	
J	L_testStrings45
NOP	
L__testStrings110:
;String.c,289 :: 		strncat(writebuff,string[1],strlen(string[1]));
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
;String.c,290 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr45_String+0)
ORI	R26, R26, lo_addr(?lstr45_String+0)
JAL	_strcat+0
NOP	
;String.c,291 :: 		}
L_testStrings45:
;String.c,292 :: 		if(strlen(string[2])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings112
NOP	
J	L_testStrings46
NOP	
L__testStrings112:
;String.c,293 :: 		strncat(writebuff,string[2],strlen(string[2]));
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
;String.c,294 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr46_String+0)
ORI	R26, R26, lo_addr(?lstr46_String+0)
JAL	_strcat+0
NOP	
;String.c,295 :: 		}
L_testStrings46:
;String.c,296 :: 		if(strlen(string[3])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings114
NOP	
J	L_testStrings47
NOP	
L__testStrings114:
;String.c,297 :: 		strncat(writebuff,string[3],strlen(string[3]));
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
;String.c,298 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr47_String+0)
ORI	R26, R26, lo_addr(?lstr47_String+0)
JAL	_strcat+0
NOP	
;String.c,299 :: 		}
L_testStrings47:
;String.c,300 :: 		if(strlen(string[4])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings116
NOP	
J	L_testStrings48
NOP	
L__testStrings116:
;String.c,301 :: 		strncat(writebuff,string[4],strlen(string[4]));
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
;String.c,302 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr48_String+0)
ORI	R26, R26, lo_addr(?lstr48_String+0)
JAL	_strcat+0
NOP	
;String.c,303 :: 		}
L_testStrings48:
;String.c,304 :: 		if(strlen(string[5])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings118
NOP	
J	L_testStrings49
NOP	
L__testStrings118:
;String.c,305 :: 		strncat(writebuff,string[5],strlen(string[5]));
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
;String.c,306 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr49_String+0)
ORI	R26, R26, lo_addr(?lstr49_String+0)
JAL	_strcat+0
NOP	
;String.c,307 :: 		}
L_testStrings49:
;String.c,309 :: 		}
L_end_testStrings:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _testStrings
String____?ag:
L_end_String___?ag:
JR	RA
NOP	
; end of String____?ag
