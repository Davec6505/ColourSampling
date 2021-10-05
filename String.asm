_InitString:
;String.c,32 :: 		PString InitString(char cmp){
ADDIU	SP, SP, -1292
; su_addr start address is: 8 (R2)
MOVZ	R2, R30, R0
; su_addr end address is: 8 (R2)
;String.c,36 :: 		}
L_end_InitString:
ADDIU	SP, SP, 1292
JR	RA
NOP	
; end of _InitString
_DoStrings:
;String.c,41 :: 		int DoStrings(int num){
ADDIU	SP, SP, -92
SW	RA, 0(SP)
;String.c,43 :: 		char *result,conf[64] = "";
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 28
ADDIU	R22, R23, 64
LUI	R24, hi_addr(?ICSDoStrings_conf_L0+0)
ORI	R24, R24, lo_addr(?ICSDoStrings_conf_L0+0)
JAL	___CC2DW+0
NOP	
;String.c,50 :: 		clr_str_arrays(string);     //clear the strings in the array
SH	R25, 16(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_clr_str_arrays+0
NOP	
LH	R25, 16(SP)
;String.c,51 :: 		memcpy(conf,readbuff,num);  //copy the USB buffer to a temp arrar
ADDIU	R2, SP, 28
SEH	R27, R25
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;String.c,52 :: 		result = setstr(conf);       //look for '\r' '\n' and move result to a string
ADDIU	R2, SP, 28
MOVZ	R25, R2, R0
JAL	_setstr+0
NOP	
;String.c,53 :: 		res0 = strsplit(result,'+'); //split the string into an array of strings return num of arr's
ORI	R26, R0, 43
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;String.c,54 :: 		res1 = StrChecker(string[1]);//Test current string index for equality return index
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_StrChecker+0
NOP	
; res1 start address is: 20 (R5)
SEH	R5, R2
;String.c,56 :: 		memset(writebuff,0,64);     //empty usb write buffer
ORI	R27, R0, 64
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memset+0
NOP	
;String.c,66 :: 		switch(res1){
J	L_DoStrings0
NOP	
; res1 end address is: 20 (R5)
;String.c,67 :: 		case CONFIG :
L_DoStrings2:
;String.c,68 :: 		if(!strcmp(string[2],comc[0])){
LW	R26, Offset(_comc+0)(GP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strcmp+0
NOP	
BEQ	R2, R0, L__DoStrings86
NOP	
J	L_DoStrings3
NOP	
L__DoStrings86:
;String.c,69 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings88
NOP	
J	L_DoStrings4
NOP	
L__DoStrings88:
;String.c,70 :: 		Int_Time = atoi(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
SH	R2, 24(SP)
;String.c,71 :: 		for(i=0;i<Int_Time;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_DoStrings5:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
LH	R2, 24(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__DoStrings89
NOP	
J	L_DoStrings6
NOP	
L__DoStrings89:
;String.c,72 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,73 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_DoStrings8:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings8
NOP	
;String.c,71 :: 		for(i=0;i<Int_Time;i++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;String.c,74 :: 		}
; i end address is: 16 (R4)
J	L_DoStrings5
NOP	
L_DoStrings6:
;String.c,75 :: 		}
L_DoStrings4:
;String.c,76 :: 		err = TCS3472_SetIntergration_Time(Int_Time);
SH	R25, 16(SP)
LH	R25, 24(SP)
JAL	_TCS3472_SetIntergration_Time+0
NOP	
LH	R25, 16(SP)
; err start address is: 16 (R4)
ANDI	R4, R2, 255
;String.c,77 :: 		if(err > 0)
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DoStrings90
NOP	
J	L_DoStrings10
NOP	
L__DoStrings90:
;String.c,78 :: 		for(i=0;i<err;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; err end address is: 16 (R4)
; i end address is: 20 (R5)
L_DoStrings11:
; i start address is: 20 (R5)
; err start address is: 16 (R4)
ANDI	R3, R5, 255
ANDI	R2, R4, 255
SLTU	R2, R3, R2
BNE	R2, R0, L__DoStrings91
NOP	
J	L_DoStrings12
NOP	
L__DoStrings91:
;String.c,79 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,80 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_DoStrings14:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings14
NOP	
NOP	
NOP	
;String.c,78 :: 		for(i=0;i<err;i++){
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;String.c,81 :: 		}
; err end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_DoStrings11
NOP	
L_DoStrings12:
L_DoStrings10:
;String.c,82 :: 		}else if(!strcmp(string[2],comc[1])){
J	L_DoStrings16
NOP	
L_DoStrings3:
LW	R26, Offset(_comc+4)(GP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strcmp+0
NOP	
BEQ	R2, R0, L__DoStrings92
NOP	
J	L_DoStrings17
NOP	
L__DoStrings92:
;String.c,83 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings94
NOP	
J	L_DoStrings18
NOP	
L__DoStrings94:
;String.c,84 :: 		Gain = atoi(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
SH	R2, 26(SP)
;String.c,85 :: 		for(i=0;i<Gain;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_DoStrings19:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
LH	R2, 26(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__DoStrings95
NOP	
J	L_DoStrings20
NOP	
L__DoStrings95:
;String.c,86 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,87 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_DoStrings22:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings22
NOP	
;String.c,85 :: 		for(i=0;i<Gain;i++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;String.c,88 :: 		}
; i end address is: 16 (R4)
J	L_DoStrings19
NOP	
L_DoStrings20:
;String.c,89 :: 		}
L_DoStrings18:
;String.c,90 :: 		err = TCS3472_SetGain(Gain);
SH	R25, 16(SP)
LH	R25, 26(SP)
JAL	_TCS3472_SetGain+0
NOP	
LH	R25, 16(SP)
; err start address is: 16 (R4)
ANDI	R4, R2, 255
;String.c,91 :: 		if(err > 0)
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DoStrings96
NOP	
J	L_DoStrings24
NOP	
L__DoStrings96:
;String.c,92 :: 		for(i=0;i<err;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; err end address is: 16 (R4)
; i end address is: 20 (R5)
L_DoStrings25:
; i start address is: 20 (R5)
; err start address is: 16 (R4)
ANDI	R3, R5, 255
ANDI	R2, R4, 255
SLTU	R2, R3, R2
BNE	R2, R0, L__DoStrings97
NOP	
J	L_DoStrings26
NOP	
L__DoStrings97:
;String.c,93 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,94 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_DoStrings28:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings28
NOP	
NOP	
NOP	
;String.c,92 :: 		for(i=0;i<err;i++){
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;String.c,95 :: 		}
; err end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_DoStrings25
NOP	
L_DoStrings26:
L_DoStrings24:
;String.c,96 :: 		}
L_DoStrings17:
L_DoStrings16:
;String.c,97 :: 		LATE3_bit = 0;
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
;String.c,98 :: 		break;
J	L_DoStrings1
NOP	
;String.c,99 :: 		case READA :
L_DoStrings30:
;String.c,100 :: 		str = Read_Send_AllColour();
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, 20(SP)
;String.c,101 :: 		break;
J	L_DoStrings1
NOP	
;String.c,102 :: 		case READR :
L_DoStrings31:
;String.c,103 :: 		str = Read_Send_OneColour(READR);
ORI	R25, R0, 7
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,104 :: 		break;
J	L_DoStrings1
NOP	
;String.c,105 :: 		case READG :
L_DoStrings32:
;String.c,106 :: 		str = Read_Send_OneColour(READG);
ORI	R25, R0, 8
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,107 :: 		break;
J	L_DoStrings1
NOP	
;String.c,108 :: 		case READB :
L_DoStrings33:
;String.c,109 :: 		str = Read_Send_OneColour(READB);
ORI	R25, R0, 9
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,110 :: 		break;
J	L_DoStrings1
NOP	
;String.c,111 :: 		case READC :
L_DoStrings34:
;String.c,112 :: 		str = Read_Send_OneColour(READC);
ORI	R25, R0, 10
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,113 :: 		break;
J	L_DoStrings1
NOP	
;String.c,114 :: 		case READT :
L_DoStrings35:
;String.c,115 :: 		str = Read_Send_OneColour(READT);
ORI	R25, R0, 11
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,116 :: 		break;
J	L_DoStrings1
NOP	
;String.c,117 :: 		case READT_DN40 :
L_DoStrings36:
;String.c,118 :: 		str = Read_Send_OneColour(READT_DN40);
ORI	R25, R0, 12
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,119 :: 		break;
J	L_DoStrings1
NOP	
;String.c,120 :: 		case READT_DN40 :
L_DoStrings37:
;String.c,121 :: 		str = Read_Send_OneColour(READT_DN40);
ORI	R25, R0, 12
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,122 :: 		break;
J	L_DoStrings1
NOP	
;String.c,123 :: 		case READA_SCL :
L_DoStrings38:
;String.c,124 :: 		str = Read_Thresholds();
JAL	_Read_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,125 :: 		break;
J	L_DoStrings1
NOP	
;String.c,126 :: 		case WRITE_SCL :
L_DoStrings39:
;String.c,127 :: 		str = Write_Thresholds();
JAL	_Write_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,128 :: 		break;
J	L_DoStrings1
NOP	
;String.c,129 :: 		default:
L_DoStrings40:
;String.c,130 :: 		strncat(str,"No data requested!",18);
ORI	R27, R0, 18
LUI	R26, hi_addr(?lstr18_String+0)
ORI	R26, R26, lo_addr(?lstr18_String+0)
LW	R25, 20(SP)
JAL	_strncat+0
NOP	
;String.c,131 :: 		break;
J	L_DoStrings1
NOP	
;String.c,132 :: 		}
L_DoStrings0:
; res1 start address is: 20 (R5)
SEH	R2, R5
BNE	R2, R0, L__DoStrings99
NOP	
J	L_DoStrings2
NOP	
L__DoStrings99:
SEH	R3, R5
ORI	R2, R0, 6
BNE	R3, R2, L__DoStrings101
NOP	
J	L_DoStrings30
NOP	
L__DoStrings101:
SEH	R3, R5
ORI	R2, R0, 7
BNE	R3, R2, L__DoStrings103
NOP	
J	L_DoStrings31
NOP	
L__DoStrings103:
SEH	R3, R5
ORI	R2, R0, 8
BNE	R3, R2, L__DoStrings105
NOP	
J	L_DoStrings32
NOP	
L__DoStrings105:
SEH	R3, R5
ORI	R2, R0, 9
BNE	R3, R2, L__DoStrings107
NOP	
J	L_DoStrings33
NOP	
L__DoStrings107:
SEH	R3, R5
ORI	R2, R0, 10
BNE	R3, R2, L__DoStrings109
NOP	
J	L_DoStrings34
NOP	
L__DoStrings109:
SEH	R3, R5
ORI	R2, R0, 11
BNE	R3, R2, L__DoStrings111
NOP	
J	L_DoStrings35
NOP	
L__DoStrings111:
SEH	R3, R5
ORI	R2, R0, 12
BNE	R3, R2, L__DoStrings113
NOP	
J	L_DoStrings36
NOP	
L__DoStrings113:
SEH	R3, R5
ORI	R2, R0, 12
BNE	R3, R2, L__DoStrings115
NOP	
J	L_DoStrings37
NOP	
L__DoStrings115:
SEH	R3, R5
ORI	R2, R0, 13
BNE	R3, R2, L__DoStrings117
NOP	
J	L_DoStrings38
NOP	
L__DoStrings117:
SEH	R3, R5
; res1 end address is: 20 (R5)
ORI	R2, R0, 14
BNE	R3, R2, L__DoStrings119
NOP	
J	L_DoStrings39
NOP	
L__DoStrings119:
J	L_DoStrings40
NOP	
L_DoStrings1:
;String.c,136 :: 		strncat(writebuff,str,strlen(str));
LW	R25, 20(SP)
JAL	_strlen+0
NOP	
SEH	R27, R2
LW	R26, 20(SP)
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncat+0
NOP	
;String.c,137 :: 		while(!HID_Write(&writebuff,64));
L_DoStrings41:
SH	R25, 16(SP)
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
LH	R25, 16(SP)
BEQ	R2, R0, L__DoStrings120
NOP	
J	L_DoStrings42
NOP	
L__DoStrings120:
J	L_DoStrings41
NOP	
L_DoStrings42:
;String.c,141 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,142 :: 		}
;String.c,141 :: 		return 0;
;String.c,142 :: 		}
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
;String.c,147 :: 		void clr_str_arrays(char str[20][64]){
;String.c,149 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_clr_str_arrays43:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__clr_str_arrays122
NOP	
J	L_clr_str_arrays44
NOP	
L__clr_str_arrays122:
;String.c,150 :: 		for(j = 0;j<64;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_clr_str_arrays46:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 64
BNE	R2, R0, L__clr_str_arrays123
NOP	
J	L_clr_str_arrays47
NOP	
L__clr_str_arrays123:
;String.c,151 :: 		str[i][j] = 0;
SEH	R2, R4
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R5
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,150 :: 		for(j = 0;j<64;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,152 :: 		}
; j end address is: 20 (R5)
J	L_clr_str_arrays46
NOP	
L_clr_str_arrays47:
;String.c,149 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,154 :: 		}
; i end address is: 16 (R4)
J	L_clr_str_arrays43
NOP	
L_clr_str_arrays44:
;String.c,155 :: 		}
L_end_clr_str_arrays:
JR	RA
NOP	
; end of _clr_str_arrays
_setstr:
;String.c,160 :: 		char* setstr(char conf[64]){
;String.c,162 :: 		for(i=0;i < 64;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_setstr49:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 64
BNE	R2, R0, L__setstr125
NOP	
J	L_setstr50
NOP	
L__setstr125:
;String.c,163 :: 		if((conf[i] == 0x0D)|| (conf[i] == 0x0A))
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L__setstr127
NOP	
J	L__setstr83
NOP	
L__setstr127:
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L__setstr129
NOP	
J	L__setstr82
NOP	
L__setstr129:
J	L_setstr54
NOP	
L__setstr83:
L__setstr82:
;String.c,164 :: 		break;
J	L_setstr50
NOP	
L_setstr54:
;String.c,162 :: 		for(i=0;i < 64;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,165 :: 		}
J	L_setstr49
NOP	
L_setstr50:
;String.c,166 :: 		conf[i+1] = 0;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
SEH	R2, R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;String.c,168 :: 		return conf;
MOVZ	R2, R25, R0
;String.c,169 :: 		}
L_end_setstr:
JR	RA
NOP	
; end of _setstr
_strsplit:
;String.c,174 :: 		int strsplit(char str[64], char c){
;String.c,176 :: 		ii=kk=0;
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,177 :: 		for (i = 0; i < 64;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 24 (R6)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
L_strsplit55:
; i start address is: 16 (R4)
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
SEH	R2, R4
SLTI	R2, R2, 64
BNE	R2, R0, L__strsplit131
NOP	
J	L_strsplit56
NOP	
L__strsplit131:
;String.c,178 :: 		if(str[i] == c){
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R26, 255
BEQ	R3, R2, L__strsplit132
NOP	
J	L_strsplit58
NOP	
L__strsplit132:
;String.c,179 :: 		string[kk][ii] = 0;
SEH	R2, R5
SLL	R3, R2, 6
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
ADDU	R3, R2, R3
SEH	R2, R6
; ii end address is: 24 (R6)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,180 :: 		kk++;
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,181 :: 		ii=0;
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,182 :: 		continue;//goto endb;
J	L_strsplit57
NOP	
;String.c,183 :: 		}else{
L_strsplit58:
;String.c,184 :: 		string[kk][ii] = str[i];
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
;String.c,185 :: 		ii++;
ADDIU	R2, R6, 1
; ii end address is: 24 (R6)
; ii start address is: 12 (R3)
SEH	R3, R2
;String.c,189 :: 		if(str[i]==0)
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit133
NOP	
J	L_strsplit60
NOP	
L__strsplit133:
; ii end address is: 12 (R3)
; i end address is: 16 (R4)
;String.c,190 :: 		break;
J	L_strsplit56
NOP	
L_strsplit60:
;String.c,191 :: 		}
; i start address is: 16 (R4)
; ii start address is: 12 (R3)
; kk end address is: 20 (R5)
SEH	R6, R3
L_strsplit57:
; ii end address is: 12 (R3)
;String.c,177 :: 		for (i = 0; i < 64;i++){
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,191 :: 		}
; ii end address is: 24 (R6)
; i end address is: 16 (R4)
J	L_strsplit55
NOP	
L_strsplit56:
;String.c,192 :: 		return kk;
SEH	R2, R5
; kk end address is: 20 (R5)
;String.c,193 :: 		}
L_end_strsplit:
JR	RA
NOP	
; end of _strsplit
_StrChecker:
;String.c,198 :: 		int StrChecker(char *str){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,202 :: 		if(!once){
SW	R26, 4(SP)
SW	R27, 8(SP)
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
EXT	R2, R2, BitPos(StrChecker_once_L0+0), 1
BEQ	R2, R0, L__StrChecker135
NOP	
J	L_StrChecker61
NOP	
L__StrChecker135:
;String.c,203 :: 		once = 1;
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
ORI	R2, R2, BitMask(StrChecker_once_L0+0)
SB	R2, Offset(StrChecker_once_L0+0)(GP)
;String.c,204 :: 		enum_val = enum_num;
ORI	R2, R0, 15
SH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
;String.c,205 :: 		}
L_StrChecker61:
;String.c,206 :: 		for(i = 0;i < enum_val;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_StrChecker62:
; i start address is: 20 (R5)
SEH	R3, R5
LH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__StrChecker136
NOP	
J	L_StrChecker63
NOP	
L__StrChecker136:
;String.c,207 :: 		if(strncmp(str,com[i],strlen(str)-1)==0)
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
BEQ	R2, R0, L__StrChecker137
NOP	
J	L_StrChecker65
NOP	
L__StrChecker137:
;String.c,208 :: 		break;
J	L_StrChecker63
NOP	
L_StrChecker65:
;String.c,206 :: 		for(i = 0;i < enum_val;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,209 :: 		}
J	L_StrChecker62
NOP	
L_StrChecker63:
;String.c,210 :: 		return i;
SEH	R2, R5
; i end address is: 20 (R5)
;String.c,211 :: 		}
;String.c,210 :: 		return i;
;String.c,211 :: 		}
L_end_StrChecker:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _StrChecker
_WriteData:
;String.c,216 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;String.c,219 :: 		memset(writebuff,0,64);
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
;String.c,220 :: 		strncpy(writebuff,_data,strlen(_data));
JAL	_strlen+0
NOP	
SEH	R27, R2
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncpy+0
NOP	
;String.c,221 :: 		HID_Write(&writebuff,64);
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
;String.c,222 :: 		}
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
;String.c,227 :: 		char* Read_Send_AllColour(){
ADDIU	SP, SP, -92
SW	RA, 0(SP)
;String.c,233 :: 		TCS3472_getRawData(RawData);
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,235 :: 		strcpy(str,"C || R | G | B | = || ");
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr19_String+0)
ORI	R26, R26, lo_addr(?lstr19_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,236 :: 		sprintf(txtR,"%u",RawData[0]);
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_20_String+0)
ORI	R2, R2, lo_addr(?lstr_20_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,237 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,238 :: 		strcat(str," || ");
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr21_String+0)
ORI	R26, R26, lo_addr(?lstr21_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,240 :: 		sprintf(txtR,"%u",RawData[1]);
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_22_String+0)
ORI	R2, R2, lo_addr(?lstr_22_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,241 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,242 :: 		strcat(str," | ");
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr23_String+0)
ORI	R26, R26, lo_addr(?lstr23_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,244 :: 		sprintf(txtR,"%u",RawData[2]);
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_24_String+0)
ORI	R2, R2, lo_addr(?lstr_24_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,245 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,246 :: 		strcat(str," | ");
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr25_String+0)
ORI	R26, R26, lo_addr(?lstr25_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,248 :: 		sprintf(txtR,"%u",RawData[3]);
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_26_String+0)
ORI	R2, R2, lo_addr(?lstr_26_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,249 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,250 :: 		strcat(str," || ");
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr27_String+0)
ORI	R26, R26, lo_addr(?lstr27_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,253 :: 		err = TCS3472_C2RGB_Error(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_C2RGB_Error+0
NOP	
;String.c,254 :: 		sprintf(txtR,"%5d",err);
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_28_String+0)
ORI	R2, R2, lo_addr(?lstr_28_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,255 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,256 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr29_String+0)
ORI	R26, R26, lo_addr(?lstr29_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,258 :: 		return &str;
ADDIU	R2, SP, 27
;String.c,259 :: 		}
;String.c,258 :: 		return &str;
;String.c,259 :: 		}
L_end_Read_Send_AllColour:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 92
JR	RA
NOP	
; end of _Read_Send_AllColour
_Read_Send_OneColour:
;String.c,264 :: 		char* Read_Send_OneColour(int colr){
ADDIU	SP, SP, -92
SW	RA, 0(SP)
;String.c,268 :: 		switch(colr){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Read_Send_OneColour66
NOP	
;String.c,269 :: 		case READR:
L_Read_Send_OneColour68:
;String.c,270 :: 		col = TCS3472_Read16(TCS3472_RDATAL);
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,271 :: 		strcpy(str,"R = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr30_String+0)
ORI	R26, R26, lo_addr(?lstr30_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,272 :: 		sprintf(txtR,"%5u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_31_String+0)
ORI	R2, R2, lo_addr(?lstr_31_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,273 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,274 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr32_String+0)
ORI	R26, R26, lo_addr(?lstr32_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,275 :: 		break;
J	L_Read_Send_OneColour67
NOP	
;String.c,276 :: 		case READG:
L_Read_Send_OneColour69:
;String.c,277 :: 		col = TCS3472_Read16(TCS3472_GDATAL);
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,278 :: 		strcpy(str,"G = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr33_String+0)
ORI	R26, R26, lo_addr(?lstr33_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,279 :: 		sprintf(txtR,"%5u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_34_String+0)
ORI	R2, R2, lo_addr(?lstr_34_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,280 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,281 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr35_String+0)
ORI	R26, R26, lo_addr(?lstr35_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,282 :: 		break;
J	L_Read_Send_OneColour67
NOP	
;String.c,283 :: 		case READB:
L_Read_Send_OneColour70:
;String.c,284 :: 		col = TCS3472_Read16(TCS3472_BDATAL);
ORI	R25, R0, 26
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,285 :: 		strcpy(str,"B = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr36_String+0)
ORI	R26, R26, lo_addr(?lstr36_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,286 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_37_String+0)
ORI	R2, R2, lo_addr(?lstr_37_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,287 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,288 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr38_String+0)
ORI	R26, R26, lo_addr(?lstr38_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,289 :: 		break;
J	L_Read_Send_OneColour67
NOP	
;String.c,290 :: 		case READC:
L_Read_Send_OneColour71:
;String.c,291 :: 		col = TCS3472_Read16(TCS3472_CDATAL);
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,292 :: 		strcpy(str,"C = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr39_String+0)
ORI	R26, R26, lo_addr(?lstr39_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,293 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_40_String+0)
ORI	R2, R2, lo_addr(?lstr_40_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,294 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,295 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr41_String+0)
ORI	R26, R26, lo_addr(?lstr41_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,296 :: 		break;
J	L_Read_Send_OneColour67
NOP	
;String.c,297 :: 		case READT:
L_Read_Send_OneColour72:
;String.c,298 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,299 :: 		col = TCS3472_CalcColTemp(RawData[1],RawData[3],RawData[3]);
LHU	R27, Offset(_RawData+6)(GP)
LHU	R26, Offset(_RawData+6)(GP)
LHU	R25, Offset(_RawData+2)(GP)
JAL	_TCS3472_CalcColTemp+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,300 :: 		strcpy(str,"T = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr42_String+0)
ORI	R26, R26, lo_addr(?lstr42_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,301 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_43_String+0)
ORI	R2, R2, lo_addr(?lstr_43_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,302 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,303 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr44_String+0)
ORI	R26, R26, lo_addr(?lstr44_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,304 :: 		break;
J	L_Read_Send_OneColour67
NOP	
;String.c,305 :: 		case READT_DN40:
L_Read_Send_OneColour73:
;String.c,306 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,307 :: 		col = TCS3472_CalcColTemp_dn40(RawData,it);
LBU	R26, Offset(_it+0)(GP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_CalcColTemp_dn40+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,308 :: 		strcpy(str,"T_DN40 = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr45_String+0)
ORI	R26, R26, lo_addr(?lstr45_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,309 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_46_String+0)
ORI	R2, R2, lo_addr(?lstr_46_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,310 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,311 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr47_String+0)
ORI	R26, R26, lo_addr(?lstr47_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,312 :: 		break;
J	L_Read_Send_OneColour67
NOP	
;String.c,313 :: 		}
L_Read_Send_OneColour66:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Read_Send_OneColour142
NOP	
J	L_Read_Send_OneColour68
NOP	
L__Read_Send_OneColour142:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Read_Send_OneColour144
NOP	
J	L_Read_Send_OneColour69
NOP	
L__Read_Send_OneColour144:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Read_Send_OneColour146
NOP	
J	L_Read_Send_OneColour70
NOP	
L__Read_Send_OneColour146:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Read_Send_OneColour148
NOP	
J	L_Read_Send_OneColour71
NOP	
L__Read_Send_OneColour148:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Read_Send_OneColour150
NOP	
J	L_Read_Send_OneColour72
NOP	
L__Read_Send_OneColour150:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Read_Send_OneColour152
NOP	
J	L_Read_Send_OneColour73
NOP	
L__Read_Send_OneColour152:
L_Read_Send_OneColour67:
;String.c,314 :: 		return &str;
ADDIU	R2, SP, 26
;String.c,315 :: 		}
;String.c,314 :: 		return &str;
;String.c,315 :: 		}
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
;String.c,317 :: 		int Get_It(){
;String.c,318 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,319 :: 		}
L_end_Get_It:
JR	RA
NOP	
; end of _Get_It
_Get_Gain:
;String.c,321 :: 		int Get_Gain(){
;String.c,322 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,323 :: 		}
L_end_Get_Gain:
JR	RA
NOP	
; end of _Get_Gain
_Read_Thresholds:
;String.c,328 :: 		char* Read_Thresholds(){
ADDIU	SP, SP, -88
SW	RA, 0(SP)
;String.c,332 :: 		PtrPos =  &FLASH_Settings_Addr;
SW	R25, 4(SP)
SW	R26, 8(SP)
; PtrPos start address is: 8 (R2)
LUI	R2, hi_addr(_FLASH_Settings_Addr+0)
ORI	R2, R2, lo_addr(_FLASH_Settings_Addr+0)
;String.c,333 :: 		NVMRead(PtrPos,&Threshold);
LUI	R26, hi_addr(_Threshold+0)
ORI	R26, R26, lo_addr(_Threshold+0)
MOVZ	R25, R2, R0
; PtrPos end address is: 8 (R2)
JAL	_NVMRead+0
NOP	
;String.c,335 :: 		strcpy(str,"Cth || Rth | Gth | Bth | = || ");
ADDIU	R2, SP, 22
LUI	R26, hi_addr(?lstr48_String+0)
ORI	R26, R26, lo_addr(?lstr48_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,336 :: 		sprintf(txtR,"%u",Threshold.C_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_49_String+0)
ORI	R2, R2, lo_addr(?lstr_49_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,337 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 22
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,338 :: 		strcat(str," || ");
ADDIU	R2, SP, 22
LUI	R26, hi_addr(?lstr50_String+0)
ORI	R26, R26, lo_addr(?lstr50_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,340 :: 		sprintf(txtR,"%u",Threshold.R_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_51_String+0)
ORI	R2, R2, lo_addr(?lstr_51_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,341 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 22
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,342 :: 		strcat(str," | ");
ADDIU	R2, SP, 22
LUI	R26, hi_addr(?lstr52_String+0)
ORI	R26, R26, lo_addr(?lstr52_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,344 :: 		sprintf(txtR,"%u",Threshold.G_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_53_String+0)
ORI	R2, R2, lo_addr(?lstr_53_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,345 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 22
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,346 :: 		strcat(str," | ");
ADDIU	R2, SP, 22
LUI	R26, hi_addr(?lstr54_String+0)
ORI	R26, R26, lo_addr(?lstr54_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,348 :: 		sprintf(txtR,"%u",Threshold.B_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_55_String+0)
ORI	R2, R2, lo_addr(?lstr_55_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,349 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 22
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,350 :: 		strcat(str," ||\r\n ");
ADDIU	R2, SP, 22
LUI	R26, hi_addr(?lstr56_String+0)
ORI	R26, R26, lo_addr(?lstr56_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,352 :: 		return &str;
ADDIU	R2, SP, 22
;String.c,353 :: 		}
;String.c,352 :: 		return &str;
;String.c,353 :: 		}
L_end_Read_Thresholds:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 88
JR	RA
NOP	
; end of _Read_Thresholds
_Write_Thresholds:
;String.c,358 :: 		char* Write_Thresholds(){
ADDIU	SP, SP, -84
SW	RA, 0(SP)
;String.c,364 :: 		Flash_Erase_Page(FLASH_Settings_Addr);
SW	R25, 4(SP)
SW	R26, 8(SP)
LW	R25, Offset(_FLASH_Settings_Addr+0)(GP)
JAL	_Flash_Erase_Page+0
NOP	
;String.c,390 :: 		sprintf(txtR,"%4d",err);
ADDIU	R3, SP, 14
LH	R2, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_57_String+0)
ORI	R2, R2, lo_addr(?lstr_57_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,391 :: 		strcpy(str,txtR);
ADDIU	R3, SP, 14
ADDIU	R2, SP, 20
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,392 :: 		strcat(str," ||\r\n ");
ADDIU	R2, SP, 20
LUI	R26, hi_addr(?lstr58_String+0)
ORI	R26, R26, lo_addr(?lstr58_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,393 :: 		return str;
ADDIU	R2, SP, 20
;String.c,394 :: 		}
;String.c,393 :: 		return str;
;String.c,394 :: 		}
L_end_Write_Thresholds:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 84
JR	RA
NOP	
; end of _Write_Thresholds
_testStrings:
;String.c,399 :: 		void testStrings(char* writebuff){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,400 :: 		if(strlen(string[0])!=0){
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings159
NOP	
J	L_testStrings74
NOP	
L__testStrings159:
;String.c,401 :: 		strncat(writebuff,string[0],strlen(string[0]));
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
;String.c,402 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr59_String+0)
ORI	R26, R26, lo_addr(?lstr59_String+0)
JAL	_strcat+0
NOP	
;String.c,403 :: 		}
L_testStrings74:
;String.c,404 :: 		if(strlen(string[1])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings161
NOP	
J	L_testStrings75
NOP	
L__testStrings161:
;String.c,405 :: 		strncat(writebuff,string[1],strlen(string[1]));
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
;String.c,406 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr60_String+0)
ORI	R26, R26, lo_addr(?lstr60_String+0)
JAL	_strcat+0
NOP	
;String.c,407 :: 		}
L_testStrings75:
;String.c,408 :: 		if(strlen(string[2])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings163
NOP	
J	L_testStrings76
NOP	
L__testStrings163:
;String.c,409 :: 		strncat(writebuff,string[2],strlen(string[2]));
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
;String.c,410 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr61_String+0)
ORI	R26, R26, lo_addr(?lstr61_String+0)
JAL	_strcat+0
NOP	
;String.c,411 :: 		}
L_testStrings76:
;String.c,412 :: 		if(strlen(string[3])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings165
NOP	
J	L_testStrings77
NOP	
L__testStrings165:
;String.c,413 :: 		strncat(writebuff,string[3],strlen(string[3]));
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
;String.c,414 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr62_String+0)
ORI	R26, R26, lo_addr(?lstr62_String+0)
JAL	_strcat+0
NOP	
;String.c,415 :: 		}
L_testStrings77:
;String.c,416 :: 		if(strlen(string[4])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings167
NOP	
J	L_testStrings78
NOP	
L__testStrings167:
;String.c,417 :: 		strncat(writebuff,string[4],strlen(string[4]));
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
;String.c,418 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr63_String+0)
ORI	R26, R26, lo_addr(?lstr63_String+0)
JAL	_strcat+0
NOP	
;String.c,419 :: 		}
L_testStrings78:
;String.c,420 :: 		if(strlen(string[5])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings169
NOP	
J	L_testStrings79
NOP	
L__testStrings169:
;String.c,421 :: 		strncat(writebuff,string[5],strlen(string[5]));
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
;String.c,422 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr64_String+0)
ORI	R26, R26, lo_addr(?lstr64_String+0)
JAL	_strcat+0
NOP	
;String.c,423 :: 		}
L_testStrings79:
;String.c,424 :: 		if(strlen(string[6])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings171
NOP	
J	L_testStrings80
NOP	
L__testStrings171:
;String.c,425 :: 		strncat(writebuff,string[6],strlen(string[6]));
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
;String.c,426 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr65_String+0)
ORI	R26, R26, lo_addr(?lstr65_String+0)
JAL	_strcat+0
NOP	
;String.c,427 :: 		}
L_testStrings80:
;String.c,429 :: 		}
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
