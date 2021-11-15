_InitString:
;String.c,36 :: 		PString InitString(char cmp){
ADDIU	SP, SP, -1292
; su_addr start address is: 8 (R2)
MOVZ	R2, R30, R0
; su_addr end address is: 8 (R2)
;String.c,40 :: 		}
L_end_InitString:
ADDIU	SP, SP, 1292
JR	RA
NOP	
; end of _InitString
_DoStrings:
;String.c,45 :: 		int DoStrings(int num){
ADDIU	SP, SP, -116
SW	RA, 0(SP)
;String.c,47 :: 		char *result,conf[64] = "";
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 49
ADDIU	R22, R23, 64
LUI	R24, hi_addr(?ICSDoStrings_conf_L0+0)
ORI	R24, R24, lo_addr(?ICSDoStrings_conf_L0+0)
JAL	___CC2DW+0
NOP	
;String.c,54 :: 		clr_str_arrays(string);     //clear the strings in the array
SH	R25, 16(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_clr_str_arrays+0
NOP	
LH	R25, 16(SP)
;String.c,55 :: 		memcpy(conf,readbuff,num);  //copy the USB buffer to a temp arrar
ADDIU	R2, SP, 49
SEH	R27, R25
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;String.c,56 :: 		result = setstr(conf);       //look for '\r' '\n' and move result to a string
ADDIU	R2, SP, 49
MOVZ	R25, R2, R0
JAL	_setstr+0
NOP	
;String.c,57 :: 		res0 = strsplit(result,'+'); //split the string into an array of strings return num of arr's
ORI	R26, R0, 43
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;String.c,58 :: 		if(res0 > 0)
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__DoStrings137
NOP	
J	L_DoStrings0
NOP	
L__DoStrings137:
;String.c,59 :: 		res1 = StrChecker(string[1]);//Test current string index for equality return index
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
;String.c,61 :: 		res1 = enum_num + 1;
; res1 start address is: 20 (R5)
ORI	R5, R0, 20
; res1 end address is: 20 (R5)
L_DoStrings1:
;String.c,62 :: 		memset(writebuff,0,64);     //empty usb write buffer
; res1 start address is: 20 (R5)
ORI	R27, R0, 64
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memset+0
NOP	
;String.c,72 :: 		switch(res1){
J	L_DoStrings2
NOP	
; res1 end address is: 20 (R5)
;String.c,73 :: 		case CONFIG :
L_DoStrings4:
;String.c,74 :: 		if(!strcmp(string[2],comc[0])){
LW	R26, Offset(_comc+0)(GP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strcmp+0
NOP	
BEQ	R2, R0, L__DoStrings138
NOP	
J	L_DoStrings5
NOP	
L__DoStrings138:
;String.c,75 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings140
NOP	
J	L_DoStrings6
NOP	
L__DoStrings140:
;String.c,76 :: 		Int_Time = atoi(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
SH	R2, 24(SP)
;String.c,77 :: 		for(i=0;i<Int_Time;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_DoStrings7:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
LH	R2, 24(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__DoStrings141
NOP	
J	L_DoStrings8
NOP	
L__DoStrings141:
;String.c,78 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,79 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_DoStrings10:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings10
NOP	
;String.c,77 :: 		for(i=0;i<Int_Time;i++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;String.c,80 :: 		}
; i end address is: 16 (R4)
J	L_DoStrings7
NOP	
L_DoStrings8:
;String.c,81 :: 		}
L_DoStrings6:
;String.c,82 :: 		err = TCS3472_SetIntergration_Time(Int_Time);
SH	R25, 16(SP)
LH	R25, 24(SP)
JAL	_TCS3472_SetIntergration_Time+0
NOP	
LH	R25, 16(SP)
; err start address is: 16 (R4)
ANDI	R4, R2, 255
;String.c,83 :: 		if(err > 0)
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DoStrings142
NOP	
J	L_DoStrings12
NOP	
L__DoStrings142:
;String.c,84 :: 		for(i=0;i<err;i++){
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
BNE	R2, R0, L__DoStrings143
NOP	
J	L_DoStrings14
NOP	
L__DoStrings143:
;String.c,85 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,86 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_DoStrings16:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings16
NOP	
NOP	
NOP	
;String.c,84 :: 		for(i=0;i<err;i++){
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;String.c,87 :: 		}
; err end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_DoStrings13
NOP	
L_DoStrings14:
L_DoStrings12:
;String.c,88 :: 		}else if(!strcmp(string[2],comc[1])){
J	L_DoStrings18
NOP	
L_DoStrings5:
LW	R26, Offset(_comc+4)(GP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strcmp+0
NOP	
BEQ	R2, R0, L__DoStrings144
NOP	
J	L_DoStrings19
NOP	
L__DoStrings144:
;String.c,89 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings146
NOP	
J	L_DoStrings20
NOP	
L__DoStrings146:
;String.c,90 :: 		Gain = atoi(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
SH	R2, 26(SP)
;String.c,91 :: 		for(i=0;i<Gain;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_DoStrings21:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
LH	R2, 26(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__DoStrings147
NOP	
J	L_DoStrings22
NOP	
L__DoStrings147:
;String.c,92 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,93 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_DoStrings24:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings24
NOP	
;String.c,91 :: 		for(i=0;i<Gain;i++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;String.c,94 :: 		}
; i end address is: 16 (R4)
J	L_DoStrings21
NOP	
L_DoStrings22:
;String.c,95 :: 		}
L_DoStrings20:
;String.c,96 :: 		err = TCS3472_SetGain(Gain);
SH	R25, 16(SP)
LH	R25, 26(SP)
JAL	_TCS3472_SetGain+0
NOP	
LH	R25, 16(SP)
; err start address is: 16 (R4)
ANDI	R4, R2, 255
;String.c,97 :: 		if(err > 0)
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DoStrings148
NOP	
J	L_DoStrings26
NOP	
L__DoStrings148:
;String.c,98 :: 		for(i=0;i<err;i++){
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
BNE	R2, R0, L__DoStrings149
NOP	
J	L_DoStrings28
NOP	
L__DoStrings149:
;String.c,99 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,100 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_DoStrings30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings30
NOP	
NOP	
NOP	
;String.c,98 :: 		for(i=0;i<err;i++){
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;String.c,101 :: 		}
; err end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_DoStrings27
NOP	
L_DoStrings28:
L_DoStrings26:
;String.c,102 :: 		}
L_DoStrings19:
L_DoStrings18:
;String.c,103 :: 		LATE3_bit = 0;
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
;String.c,104 :: 		break;
J	L_DoStrings3
NOP	
;String.c,105 :: 		case SENDA :
L_DoStrings32:
;String.c,106 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;String.c,107 :: 		break;
J	L_DoStrings3
NOP	
;String.c,108 :: 		case READA :
L_DoStrings33:
;String.c,109 :: 		str = Read_Send_AllColour(0);
MOVZ	R25, R0, R0
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, 20(SP)
;String.c,110 :: 		break;
J	L_DoStrings3
NOP	
;String.c,111 :: 		case READR :
L_DoStrings34:
;String.c,112 :: 		str = Read_Send_OneColour(READR);
ORI	R25, R0, 7
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,113 :: 		break;
J	L_DoStrings3
NOP	
;String.c,114 :: 		case READG :
L_DoStrings35:
;String.c,115 :: 		str = Read_Send_OneColour(READG);
ORI	R25, R0, 8
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,116 :: 		break;
J	L_DoStrings3
NOP	
;String.c,117 :: 		case READB :
L_DoStrings36:
;String.c,118 :: 		str = Read_Send_OneColour(READB);
ORI	R25, R0, 9
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,119 :: 		break;
J	L_DoStrings3
NOP	
;String.c,120 :: 		case READC :
L_DoStrings37:
;String.c,121 :: 		str = Read_Send_OneColour(READC);
ORI	R25, R0, 10
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,122 :: 		break;
J	L_DoStrings3
NOP	
;String.c,123 :: 		case READT :
L_DoStrings38:
;String.c,124 :: 		str = Read_Send_OneColour(READT);
ORI	R25, R0, 11
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,125 :: 		break;
J	L_DoStrings3
NOP	
;String.c,126 :: 		case READT_DN40 :
L_DoStrings39:
;String.c,127 :: 		str = Read_Send_OneColour(READT_DN40);
ORI	R25, R0, 12
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,128 :: 		break;
J	L_DoStrings3
NOP	
;String.c,129 :: 		case READA_SCL :
L_DoStrings40:
;String.c,130 :: 		str = Read_Send_AllColour(1);
ORI	R25, R0, 1
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, 20(SP)
;String.c,131 :: 		break;
J	L_DoStrings3
NOP	
;String.c,132 :: 		case READA_THV :
L_DoStrings41:
;String.c,133 :: 		str =  Read_Thresholds(); //TestFlash();//
JAL	_Read_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,134 :: 		break;
J	L_DoStrings3
NOP	
;String.c,135 :: 		case WRITE_MAN :
L_DoStrings42:
;String.c,136 :: 		str = Write_Thresholds(1);
ORI	R25, R0, 1
JAL	_Write_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,137 :: 		break;
J	L_DoStrings3
NOP	
;String.c,138 :: 		case WRITE_RAW :
L_DoStrings43:
;String.c,139 :: 		str = Write_Thresholds(0);
MOVZ	R25, R0, R0
JAL	_Write_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,140 :: 		break;
J	L_DoStrings3
NOP	
;String.c,141 :: 		case START :
L_DoStrings44:
;String.c,142 :: 		SimVars.init_inc = 5;
ORI	R2, R0, 5
SB	R2, Offset(_SimVars+1)(GP)
;String.c,143 :: 		break;
J	L_DoStrings3
NOP	
;String.c,144 :: 		case CANCEL :
L_DoStrings45:
;String.c,145 :: 		SimVars.init_inc = 3;
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
;String.c,146 :: 		break;
J	L_DoStrings3
NOP	
;String.c,147 :: 		default:
L_DoStrings46:
;String.c,148 :: 		str = "No data requested!\r\n";
ADDIU	R23, SP, 28
ADDIU	R22, R23, 21
LUI	R24, hi_addr(?ICS?lstr22_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr22_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 28
SW	R2, 20(SP)
;String.c,149 :: 		break;
J	L_DoStrings3
NOP	
;String.c,150 :: 		}
L_DoStrings2:
; res1 start address is: 20 (R5)
SEH	R2, R5
BNE	R2, R0, L__DoStrings151
NOP	
J	L_DoStrings4
NOP	
L__DoStrings151:
SEH	R3, R5
ORI	R2, R0, 5
BNE	R3, R2, L__DoStrings153
NOP	
J	L_DoStrings32
NOP	
L__DoStrings153:
SEH	R3, R5
ORI	R2, R0, 6
BNE	R3, R2, L__DoStrings155
NOP	
J	L_DoStrings33
NOP	
L__DoStrings155:
SEH	R3, R5
ORI	R2, R0, 7
BNE	R3, R2, L__DoStrings157
NOP	
J	L_DoStrings34
NOP	
L__DoStrings157:
SEH	R3, R5
ORI	R2, R0, 8
BNE	R3, R2, L__DoStrings159
NOP	
J	L_DoStrings35
NOP	
L__DoStrings159:
SEH	R3, R5
ORI	R2, R0, 9
BNE	R3, R2, L__DoStrings161
NOP	
J	L_DoStrings36
NOP	
L__DoStrings161:
SEH	R3, R5
ORI	R2, R0, 10
BNE	R3, R2, L__DoStrings163
NOP	
J	L_DoStrings37
NOP	
L__DoStrings163:
SEH	R3, R5
ORI	R2, R0, 11
BNE	R3, R2, L__DoStrings165
NOP	
J	L_DoStrings38
NOP	
L__DoStrings165:
SEH	R3, R5
ORI	R2, R0, 12
BNE	R3, R2, L__DoStrings167
NOP	
J	L_DoStrings39
NOP	
L__DoStrings167:
SEH	R3, R5
ORI	R2, R0, 13
BNE	R3, R2, L__DoStrings169
NOP	
J	L_DoStrings40
NOP	
L__DoStrings169:
SEH	R3, R5
ORI	R2, R0, 14
BNE	R3, R2, L__DoStrings171
NOP	
J	L_DoStrings41
NOP	
L__DoStrings171:
SEH	R3, R5
ORI	R2, R0, 15
BNE	R3, R2, L__DoStrings173
NOP	
J	L_DoStrings42
NOP	
L__DoStrings173:
SEH	R3, R5
ORI	R2, R0, 16
BNE	R3, R2, L__DoStrings175
NOP	
J	L_DoStrings43
NOP	
L__DoStrings175:
SEH	R3, R5
ORI	R2, R0, 17
BNE	R3, R2, L__DoStrings177
NOP	
J	L_DoStrings44
NOP	
L__DoStrings177:
SEH	R3, R5
; res1 end address is: 20 (R5)
ORI	R2, R0, 18
BNE	R3, R2, L__DoStrings179
NOP	
J	L_DoStrings45
NOP	
L__DoStrings179:
J	L_DoStrings46
NOP	
L_DoStrings3:
;String.c,154 :: 		strncat(writebuff,str,strlen(str));
LW	R25, 20(SP)
JAL	_strlen+0
NOP	
SEH	R27, R2
LW	R26, 20(SP)
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncat+0
NOP	
;String.c,155 :: 		while(!HID_Write(&writebuff,64));
L_DoStrings47:
SH	R25, 16(SP)
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
LH	R25, 16(SP)
BEQ	R2, R0, L__DoStrings180
NOP	
J	L_DoStrings48
NOP	
L__DoStrings180:
J	L_DoStrings47
NOP	
L_DoStrings48:
;String.c,159 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,160 :: 		}
;String.c,159 :: 		return 0;
;String.c,160 :: 		}
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
;String.c,165 :: 		void clr_str_arrays(char str[20][64]){
;String.c,167 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_clr_str_arrays49:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__clr_str_arrays182
NOP	
J	L_clr_str_arrays50
NOP	
L__clr_str_arrays182:
;String.c,168 :: 		for(j = 0;j<64;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_clr_str_arrays52:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 64
BNE	R2, R0, L__clr_str_arrays183
NOP	
J	L_clr_str_arrays53
NOP	
L__clr_str_arrays183:
;String.c,169 :: 		str[i][j] = 0;
SEH	R2, R4
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R5
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,168 :: 		for(j = 0;j<64;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,170 :: 		}
; j end address is: 20 (R5)
J	L_clr_str_arrays52
NOP	
L_clr_str_arrays53:
;String.c,167 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,172 :: 		}
; i end address is: 16 (R4)
J	L_clr_str_arrays49
NOP	
L_clr_str_arrays50:
;String.c,173 :: 		}
L_end_clr_str_arrays:
JR	RA
NOP	
; end of _clr_str_arrays
_setstr:
;String.c,178 :: 		char* setstr(char conf[250]){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;String.c,180 :: 		for(i=0;i < strlen(conf);i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_setstr55:
; i start address is: 20 (R5)
JAL	_strlen+0
NOP	
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__setstr185
NOP	
J	L_setstr56
NOP	
L__setstr185:
;String.c,181 :: 		if(conf[i] == NULL)
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__setstr186
NOP	
J	L_setstr58
NOP	
L__setstr186:
;String.c,182 :: 		break;
J	L_setstr56
NOP	
L_setstr58:
;String.c,180 :: 		for(i=0;i < strlen(conf);i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,183 :: 		}
J	L_setstr55
NOP	
L_setstr56:
;String.c,184 :: 		conf[i+1] = 0;
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
SEH	R2, R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;String.c,186 :: 		return conf;
MOVZ	R2, R25, R0
;String.c,187 :: 		}
L_end_setstr:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _setstr
_strsplit:
;String.c,192 :: 		int strsplit(char str[250], char c){
;String.c,194 :: 		ii=kk=err=lasti=0;
; lasti start address is: 24 (R6)
MOVZ	R6, R0, R0
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;String.c,195 :: 		for (i = 0; i < 250;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
L_strsplit59:
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
; lasti start address is: 24 (R6)
SEH	R2, R4
SLTI	R2, R2, 250
BNE	R2, R0, L__strsplit188
NOP	
J	L_strsplit60
NOP	
L__strsplit188:
;String.c,196 :: 		err = i - lasti;
SUBU	R2, R4, R6
; err start address is: 32 (R8)
SEH	R8, R2
;String.c,197 :: 		if(str[i] == c || err > 62){
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R26, 255
BNE	R3, R2, L__strsplit190
NOP	
J	L__strsplit131
NOP	
L__strsplit190:
SEH	R2, R8
; err end address is: 32 (R8)
SLTI	R2, R2, 63
BNE	R2, R0, L__strsplit191
NOP	
J	L__strsplit130
NOP	
L__strsplit191:
J	L_strsplit64
NOP	
; lasti end address is: 24 (R6)
L__strsplit131:
L__strsplit130:
;String.c,198 :: 		string[kk][ii] = 0;
SEH	R2, R5
SLL	R3, R2, 6
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
ADDU	R3, R2, R3
SEH	R2, R7
; ii end address is: 28 (R7)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,199 :: 		kk++;
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,200 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;String.c,201 :: 		lasti = i;
; lasti start address is: 24 (R6)
SEH	R6, R4
;String.c,202 :: 		continue;//goto endb;
J	L_strsplit61
NOP	
;String.c,203 :: 		}else{
L_strsplit64:
;String.c,204 :: 		string[kk][ii] = str[i];
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
;String.c,205 :: 		ii++;
ADDIU	R2, R7, 1
SEH	R7, R2
;String.c,208 :: 		if(str[i]==0)
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit192
NOP	
J	L_strsplit66
NOP	
L__strsplit192:
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
;String.c,209 :: 		break;
J	L_strsplit60
NOP	
L_strsplit66:
;String.c,210 :: 		}
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; lasti start address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
L_strsplit61:
; lasti end address is: 24 (R6)
;String.c,195 :: 		for (i = 0; i < 250;i++){
; lasti start address is: 24 (R6)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,210 :: 		}
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
J	L_strsplit59
NOP	
L_strsplit60:
;String.c,211 :: 		return kk;
SEH	R2, R5
; kk end address is: 20 (R5)
;String.c,212 :: 		}
L_end_strsplit:
JR	RA
NOP	
; end of _strsplit
_findnumber:
;String.c,217 :: 		char* findnumber(char* str){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;String.c,221 :: 		temp = (char*)Malloc(strlen(str));
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
;String.c,223 :: 		for(i = 0;i < strlen(str);i++){
; i start address is: 36 (R9)
MOVZ	R9, R0, R0
; temp end address is: 32 (R8)
; i end address is: 36 (R9)
L_findnumber67:
; i start address is: 36 (R9)
; temp start address is: 32 (R8)
JAL	_strlen+0
NOP	
SEH	R3, R9
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__findnumber194
NOP	
J	L_findnumber68
NOP	
L__findnumber194:
;String.c,224 :: 		if((str[i] > 0x29)&& (str[i] < 0x40)){
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 42
BEQ	R2, R0, L__findnumber195
NOP	
J	L__findnumber134
NOP	
L__findnumber195:
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 64
BNE	R2, R0, L__findnumber196
NOP	
J	L__findnumber133
NOP	
L__findnumber196:
L__findnumber132:
;String.c,225 :: 		temp[i] = str[i];
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,224 :: 		if((str[i] > 0x29)&& (str[i] < 0x40)){
L__findnumber134:
L__findnumber133:
;String.c,223 :: 		for(i = 0;i < strlen(str);i++){
ADDIU	R2, R9, 1
SEH	R9, R2
;String.c,227 :: 		}
J	L_findnumber67
NOP	
L_findnumber68:
;String.c,228 :: 		temp[i] = 0;
SEH	R2, R9
; i end address is: 36 (R9)
ADDU	R2, R8, R2
SB	R0, 0(R2)
;String.c,229 :: 		Free(temp,sizeof(temp));
SW	R25, 8(SP)
ORI	R26, R0, 4
MOVZ	R25, R8, R0
JAL	_Free+0
NOP	
LW	R25, 8(SP)
;String.c,230 :: 		return temp;
MOVZ	R2, R8, R0
; temp end address is: 32 (R8)
;String.c,231 :: 		}
;String.c,230 :: 		return temp;
;String.c,231 :: 		}
L_end_findnumber:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _findnumber
_StrChecker:
;String.c,237 :: 		int StrChecker(char *str){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,241 :: 		if(!once){
SW	R26, 4(SP)
SW	R27, 8(SP)
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
EXT	R2, R2, BitPos(StrChecker_once_L0+0), 1
BEQ	R2, R0, L__StrChecker198
NOP	
J	L_StrChecker73
NOP	
L__StrChecker198:
;String.c,242 :: 		once = 1;
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
ORI	R2, R2, BitMask(StrChecker_once_L0+0)
SB	R2, Offset(StrChecker_once_L0+0)(GP)
;String.c,243 :: 		enum_val = enum_num;
ORI	R2, R0, 19
SH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
;String.c,244 :: 		}
L_StrChecker73:
;String.c,245 :: 		for(i = 0;i < enum_val+1;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_StrChecker74:
; i start address is: 20 (R5)
LH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
ADDIU	R2, R2, 1
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__StrChecker199
NOP	
J	L_StrChecker75
NOP	
L__StrChecker199:
;String.c,246 :: 		if(strncmp(str,com[i],strlen(str)-1)==0)
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
BEQ	R2, R0, L__StrChecker200
NOP	
J	L_StrChecker77
NOP	
L__StrChecker200:
;String.c,247 :: 		break;
J	L_StrChecker75
NOP	
L_StrChecker77:
;String.c,245 :: 		for(i = 0;i < enum_val+1;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,248 :: 		}
J	L_StrChecker74
NOP	
L_StrChecker75:
;String.c,249 :: 		return i;
SEH	R2, R5
; i end address is: 20 (R5)
;String.c,250 :: 		}
;String.c,249 :: 		return i;
;String.c,250 :: 		}
L_end_StrChecker:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _StrChecker
_RemoveWhiteSpace:
;String.c,255 :: 		char* RemoveWhiteSpace(char* str){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;String.c,258 :: 		j=0;
; j start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,259 :: 		for(i=0;i<strlen(str);i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 24 (R6)
; i end address is: 20 (R5)
L_RemoveWhiteSpace78:
; i start address is: 20 (R5)
; j start address is: 24 (R6)
JAL	_strlen+0
NOP	
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__RemoveWhiteSpace202
NOP	
J	L_RemoveWhiteSpace79
NOP	
L__RemoveWhiteSpace202:
;String.c,260 :: 		if(str[i] == ' ')
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 32
BEQ	R3, R2, L__RemoveWhiteSpace203
NOP	
J	L_RemoveWhiteSpace81
NOP	
L__RemoveWhiteSpace203:
;String.c,261 :: 		continue;
J	L_RemoveWhiteSpace80
NOP	
L_RemoveWhiteSpace81:
;String.c,262 :: 		temp[j] = str[i];
SEH	R3, R6
LW	R2, 4(SP)
ADDU	R3, R2, R3
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,263 :: 		j++;
ADDIU	R2, R6, 1
SEH	R6, R2
; j end address is: 24 (R6)
;String.c,264 :: 		}
L_RemoveWhiteSpace80:
;String.c,259 :: 		for(i=0;i<strlen(str);i++){
; j start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,264 :: 		}
; j end address is: 24 (R6)
; i end address is: 20 (R5)
J	L_RemoveWhiteSpace78
NOP	
L_RemoveWhiteSpace79:
;String.c,265 :: 		return temp;
LW	R2, 4(SP)
;String.c,266 :: 		}
L_end_RemoveWhiteSpace:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _RemoveWhiteSpace
_RemoveChars:
;String.c,271 :: 		char* RemoveChars(char* str,char a,char b){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,273 :: 		int i=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;String.c,274 :: 		temp = (char*)Malloc(100*sizeof(char*));
SW	R25, 12(SP)
ORI	R25, R0, 400
JAL	_Malloc+0
NOP	
LW	R25, 12(SP)
; temp start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,277 :: 		if(a != 0x02){
ANDI	R3, R26, 255
ORI	R2, R0, 2
BNE	R3, R2, L__RemoveChars206
NOP	
J	L_RemoveChars82
NOP	
L__RemoveChars206:
; temp end address is: 24 (R6)
;String.c,278 :: 		temp = strchr(str,a);
SW	R25, 12(SP)
JAL	_strchr+0
NOP	
LW	R25, 12(SP)
; temp start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,279 :: 		strcpy(str,temp+1);
ADDIU	R2, R2, 1
MOVZ	R26, R2, R0
JAL	_strcpy+0
NOP	
;String.c,280 :: 		}else{
MOVZ	R8, R6, R0
J	L_RemoveChars83
NOP	
L_RemoveChars82:
;String.c,281 :: 		strcpy(temp,str);
SW	R25, 12(SP)
MOVZ	R26, R25, R0
MOVZ	R25, R6, R0
JAL	_strcpy+0
NOP	
; temp end address is: 24 (R6)
LW	R25, 12(SP)
MOVZ	R8, R6, R0
;String.c,282 :: 		}
L_RemoveChars83:
;String.c,283 :: 		for(i=0;i<strlen(temp)+1;i++){
; temp start address is: 32 (R8)
; i start address is: 36 (R9)
MOVZ	R9, R0, R0
; temp end address is: 32 (R8)
; i end address is: 36 (R9)
L_RemoveChars84:
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
BNE	R2, R0, L__RemoveChars207
NOP	
J	L_RemoveChars85
NOP	
L__RemoveChars207:
;String.c,284 :: 		if(temp[i]==b)
SEH	R2, R9
ADDU	R2, R8, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BEQ	R3, R2, L__RemoveChars208
NOP	
J	L_RemoveChars87
NOP	
L__RemoveChars208:
;String.c,285 :: 		break;
J	L_RemoveChars85
NOP	
L_RemoveChars87:
;String.c,286 :: 		*(temp+i) = *(str+i);
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,283 :: 		for(i=0;i<strlen(temp)+1;i++){
ADDIU	R2, R9, 1
SEH	R9, R2
;String.c,287 :: 		}
J	L_RemoveChars84
NOP	
L_RemoveChars85:
;String.c,288 :: 		*(temp+i) = 0;
SEH	R2, R9
; i end address is: 36 (R9)
ADDU	R2, R8, R2
SB	R0, 0(R2)
;String.c,290 :: 		Free(temp,100);
ORI	R26, R0, 100
MOVZ	R25, R8, R0
JAL	_Free+0
NOP	
;String.c,291 :: 		return temp;
MOVZ	R2, R8, R0
; temp end address is: 32 (R8)
;String.c,292 :: 		}
;String.c,291 :: 		return temp;
;String.c,292 :: 		}
L_end_RemoveChars:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _RemoveChars
_WriteData:
;String.c,297 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;String.c,300 :: 		memset(writebuff,0,64);
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
;String.c,301 :: 		strncpy(writebuff,_data,strlen(_data));
JAL	_strlen+0
NOP	
SEH	R27, R2
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncpy+0
NOP	
;String.c,302 :: 		HID_Write(&writebuff,64);
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
;String.c,303 :: 		}
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
;String.c,308 :: 		char* Read_Send_AllColour(short data_src){
ADDIU	SP, SP, -156
SW	RA, 0(SP)
;String.c,316 :: 		TCS3472_getRawData(RawData);
SW	R25, 4(SP)
SW	R26, 8(SP)
SB	R25, 12(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 12(SP)
;String.c,317 :: 		if(data_src)
BNE	R25, R0, L__Read_Send_AllColour212
NOP	
J	L_Read_Send_AllColour88
NOP	
L__Read_Send_AllColour212:
;String.c,318 :: 		GetScaledValues(RawData,&FltData);
ADDIU	R2, SP, 16
SB	R25, 12(SP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_GetScaledValues+0
NOP	
LB	R25, 12(SP)
L_Read_Send_AllColour88:
;String.c,320 :: 		strcpy(str,"C || R | G | B | = || ");
ADDIU	R23, SP, 107
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr23_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr23_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 107
ADDIU	R2, SP, 43
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LB	R25, 12(SP)
;String.c,321 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour213
NOP	
J	L_Read_Send_AllColour89
NOP	
L__Read_Send_AllColour213:
;String.c,322 :: 		sprintf(txtR,"%u",RawData[0]); //C
ADDIU	R3, SP, 28
LHU	R2, Offset(_RawData+0)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_24_String+0)
ORI	R2, R2, lo_addr(?lstr_24_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
J	L_Read_Send_AllColour90
NOP	
L_Read_Send_AllColour89:
;String.c,324 :: 		sprintf(txtR,"%3.2f",FltData[0]); //R
ADDIU	R2, SP, 16
LW	R2, 0(R2)
ADDIU	R3, SP, 28
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_25_String+0)
ORI	R2, R2, lo_addr(?lstr_25_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
L_Read_Send_AllColour90:
;String.c,325 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,326 :: 		strcat(str," || ");
ORI	R30, R0, 32
SB	R30, 130(SP)
ORI	R30, R0, 124
SB	R30, 131(SP)
ORI	R30, R0, 124
SB	R30, 132(SP)
ORI	R30, R0, 32
SB	R30, 133(SP)
MOVZ	R30, R0, R0
SB	R30, 134(SP)
ADDIU	R3, SP, 130
ADDIU	R2, SP, 43
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
;String.c,328 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour214
NOP	
J	L_Read_Send_AllColour91
NOP	
L__Read_Send_AllColour214:
;String.c,329 :: 		sprintf(txtR,"%u",RawData[1]);  //R
ADDIU	R3, SP, 28
LHU	R2, Offset(_RawData+2)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_27_String+0)
ORI	R2, R2, lo_addr(?lstr_27_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
J	L_Read_Send_AllColour92
NOP	
L_Read_Send_AllColour91:
;String.c,331 :: 		sprintf(txtR,"%3.2f",FltData[1]); //G
ADDIU	R2, SP, 16
ADDIU	R2, R2, 4
LW	R2, 0(R2)
ADDIU	R3, SP, 28
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_28_String+0)
ORI	R2, R2, lo_addr(?lstr_28_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
L_Read_Send_AllColour92:
;String.c,332 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,333 :: 		strcat(str," | ");
ORI	R30, R0, 32
SB	R30, 135(SP)
ORI	R30, R0, 124
SB	R30, 136(SP)
ORI	R30, R0, 32
SB	R30, 137(SP)
MOVZ	R30, R0, R0
SB	R30, 138(SP)
ADDIU	R3, SP, 135
ADDIU	R2, SP, 43
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
;String.c,335 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour215
NOP	
J	L_Read_Send_AllColour93
NOP	
L__Read_Send_AllColour215:
;String.c,336 :: 		sprintf(txtR,"%u",RawData[2]);  //G
ADDIU	R3, SP, 28
LHU	R2, Offset(_RawData+4)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_30_String+0)
ORI	R2, R2, lo_addr(?lstr_30_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
J	L_Read_Send_AllColour94
NOP	
L_Read_Send_AllColour93:
;String.c,338 :: 		sprintf(txtR,"%3.2f",FltData[2]);  //B
ADDIU	R2, SP, 16
ADDIU	R2, R2, 8
LW	R2, 0(R2)
ADDIU	R3, SP, 28
SB	R25, 12(SP)
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
L_Read_Send_AllColour94:
;String.c,339 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,340 :: 		strcat(str," | ");
ORI	R30, R0, 32
SB	R30, 139(SP)
ORI	R30, R0, 124
SB	R30, 140(SP)
ORI	R30, R0, 32
SB	R30, 141(SP)
MOVZ	R30, R0, R0
SB	R30, 142(SP)
ADDIU	R3, SP, 139
ADDIU	R2, SP, 43
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
;String.c,342 :: 		if(!data_src ) {
BEQ	R25, R0, L__Read_Send_AllColour216
NOP	
J	L_Read_Send_AllColour95
NOP	
L__Read_Send_AllColour216:
;String.c,343 :: 		sprintf(txtR,"%u",RawData[3]);  //ERR
ADDIU	R3, SP, 28
LHU	R2, Offset(_RawData+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_33_String+0)
ORI	R2, R2, lo_addr(?lstr_33_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,344 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,345 :: 		strcat(str," || ");
ORI	R30, R0, 32
SB	R30, 143(SP)
ORI	R30, R0, 124
SB	R30, 144(SP)
ORI	R30, R0, 124
SB	R30, 145(SP)
ORI	R30, R0, 32
SB	R30, 146(SP)
MOVZ	R30, R0, R0
SB	R30, 147(SP)
ADDIU	R3, SP, 143
ADDIU	R2, SP, 43
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,347 :: 		err = TCS3472_C2RGB_Error(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_C2RGB_Error+0
NOP	
;String.c,348 :: 		sprintf(txtR,"%5d",err);
ADDIU	R3, SP, 28
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_35_String+0)
ORI	R2, R2, lo_addr(?lstr_35_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,349 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,350 :: 		}
L_Read_Send_AllColour95:
;String.c,351 :: 		strcat(str," ||\r\n");
ORI	R30, R0, 32
SB	R30, 148(SP)
ORI	R30, R0, 124
SB	R30, 149(SP)
ORI	R30, R0, 124
SB	R30, 150(SP)
ORI	R30, R0, 13
SB	R30, 151(SP)
ORI	R30, R0, 10
SB	R30, 152(SP)
MOVZ	R30, R0, R0
SB	R30, 153(SP)
ADDIU	R3, SP, 148
ADDIU	R2, SP, 43
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,353 :: 		return &str;
ADDIU	R2, SP, 43
;String.c,354 :: 		}
;String.c,353 :: 		return &str;
;String.c,354 :: 		}
L_end_Read_Send_AllColour:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 156
JR	RA
NOP	
; end of _Read_Send_AllColour
_Read_Send_OneColour:
;String.c,359 :: 		char* Read_Send_OneColour(int colr){
ADDIU	SP, SP, -180
SW	RA, 0(SP)
;String.c,363 :: 		switch(colr){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Read_Send_OneColour96
NOP	
;String.c,364 :: 		case READR:
L_Read_Send_OneColour98:
;String.c,365 :: 		col = TCS3472_Read16(TCS3472_RDATAL);
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,366 :: 		strcpy(str,"R = || ");
ADDIU	R23, SP, 90
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr37_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr37_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 90
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,367 :: 		sprintf(txtR,"%5u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_38_String+0)
ORI	R2, R2, lo_addr(?lstr_38_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,368 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,369 :: 		strcat(str," ||\r\n");
ORI	R30, R0, 32
SB	R30, 98(SP)
ORI	R30, R0, 124
SB	R30, 99(SP)
ORI	R30, R0, 124
SB	R30, 100(SP)
ORI	R30, R0, 13
SB	R30, 101(SP)
ORI	R30, R0, 10
SB	R30, 102(SP)
MOVZ	R30, R0, R0
SB	R30, 103(SP)
ADDIU	R3, SP, 98
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,370 :: 		break;
J	L_Read_Send_OneColour97
NOP	
;String.c,371 :: 		case READG:
L_Read_Send_OneColour99:
;String.c,372 :: 		col = TCS3472_Read16(TCS3472_GDATAL);
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,373 :: 		strcpy(str,"G = || ");
ADDIU	R23, SP, 104
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr40_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr40_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 104
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,374 :: 		sprintf(txtR,"%5u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_41_String+0)
ORI	R2, R2, lo_addr(?lstr_41_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,375 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,376 :: 		strcat(str," ||\r\n");
ORI	R30, R0, 32
SB	R30, 112(SP)
ORI	R30, R0, 124
SB	R30, 113(SP)
ORI	R30, R0, 124
SB	R30, 114(SP)
ORI	R30, R0, 13
SB	R30, 115(SP)
ORI	R30, R0, 10
SB	R30, 116(SP)
MOVZ	R30, R0, R0
SB	R30, 117(SP)
ADDIU	R3, SP, 112
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,377 :: 		break;
J	L_Read_Send_OneColour97
NOP	
;String.c,378 :: 		case READB:
L_Read_Send_OneColour100:
;String.c,379 :: 		col = TCS3472_Read16(TCS3472_BDATAL);
ORI	R25, R0, 26
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,380 :: 		strcpy(str,"B = || ");
ADDIU	R23, SP, 118
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr43_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr43_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 118
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,381 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
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
;String.c,382 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,383 :: 		strcat(str," ||\r\n");
ORI	R30, R0, 32
SB	R30, 126(SP)
ORI	R30, R0, 124
SB	R30, 127(SP)
ORI	R30, R0, 124
SB	R30, 128(SP)
ORI	R30, R0, 13
SB	R30, 129(SP)
ORI	R30, R0, 10
SB	R30, 130(SP)
MOVZ	R30, R0, R0
SB	R30, 131(SP)
ADDIU	R3, SP, 126
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,384 :: 		break;
J	L_Read_Send_OneColour97
NOP	
;String.c,385 :: 		case READC:
L_Read_Send_OneColour101:
;String.c,386 :: 		col = TCS3472_Read16(TCS3472_CDATAL);
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,387 :: 		strcpy(str,"C = || ");
ADDIU	R23, SP, 132
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr46_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr46_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 132
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,388 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
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
;String.c,389 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,390 :: 		strcat(str," ||\r\n");
ORI	R30, R0, 32
SB	R30, 140(SP)
ORI	R30, R0, 124
SB	R30, 141(SP)
ORI	R30, R0, 124
SB	R30, 142(SP)
ORI	R30, R0, 13
SB	R30, 143(SP)
ORI	R30, R0, 10
SB	R30, 144(SP)
MOVZ	R30, R0, R0
SB	R30, 145(SP)
ADDIU	R3, SP, 140
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,391 :: 		break;
J	L_Read_Send_OneColour97
NOP	
;String.c,392 :: 		case READT:
L_Read_Send_OneColour102:
;String.c,393 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,394 :: 		col = TCS3472_CalcColTemp(RawData[1],RawData[3],RawData[3]);
LHU	R27, Offset(_RawData+6)(GP)
LHU	R26, Offset(_RawData+6)(GP)
LHU	R25, Offset(_RawData+2)(GP)
JAL	_TCS3472_CalcColTemp+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,395 :: 		strcpy(str,"T = || ");
ADDIU	R23, SP, 146
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr49_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr49_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 146
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,396 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
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
;String.c,397 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,398 :: 		strcat(str," ||\r\n");
ORI	R30, R0, 32
SB	R30, 154(SP)
ORI	R30, R0, 124
SB	R30, 155(SP)
ORI	R30, R0, 124
SB	R30, 156(SP)
ORI	R30, R0, 13
SB	R30, 157(SP)
ORI	R30, R0, 10
SB	R30, 158(SP)
MOVZ	R30, R0, R0
SB	R30, 159(SP)
ADDIU	R3, SP, 154
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,399 :: 		break;
J	L_Read_Send_OneColour97
NOP	
;String.c,400 :: 		case READT_DN40:
L_Read_Send_OneColour103:
;String.c,401 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,402 :: 		col = TCS3472_CalcColTemp_dn40(RawData,it);
LBU	R26, Offset(_it+0)(GP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_CalcColTemp_dn40+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,403 :: 		strcpy(str,"T_DN40 = || ");
ADDIU	R23, SP, 160
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr52_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr52_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 160
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,404 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
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
;String.c,405 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,406 :: 		strcat(str," ||\r\n");
ORI	R30, R0, 32
SB	R30, 173(SP)
ORI	R30, R0, 124
SB	R30, 174(SP)
ORI	R30, R0, 124
SB	R30, 175(SP)
ORI	R30, R0, 13
SB	R30, 176(SP)
ORI	R30, R0, 10
SB	R30, 177(SP)
MOVZ	R30, R0, R0
SB	R30, 178(SP)
ADDIU	R3, SP, 173
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,407 :: 		break;
J	L_Read_Send_OneColour97
NOP	
;String.c,408 :: 		}
L_Read_Send_OneColour96:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Read_Send_OneColour219
NOP	
J	L_Read_Send_OneColour98
NOP	
L__Read_Send_OneColour219:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Read_Send_OneColour221
NOP	
J	L_Read_Send_OneColour99
NOP	
L__Read_Send_OneColour221:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Read_Send_OneColour223
NOP	
J	L_Read_Send_OneColour100
NOP	
L__Read_Send_OneColour223:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Read_Send_OneColour225
NOP	
J	L_Read_Send_OneColour101
NOP	
L__Read_Send_OneColour225:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Read_Send_OneColour227
NOP	
J	L_Read_Send_OneColour102
NOP	
L__Read_Send_OneColour227:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Read_Send_OneColour229
NOP	
J	L_Read_Send_OneColour103
NOP	
L__Read_Send_OneColour229:
L_Read_Send_OneColour97:
;String.c,409 :: 		return &str;
ADDIU	R2, SP, 26
;String.c,410 :: 		}
;String.c,409 :: 		return &str;
;String.c,410 :: 		}
L_end_Read_Send_OneColour:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 180
JR	RA
NOP	
; end of _Read_Send_OneColour
_Get_It:
;String.c,412 :: 		int Get_It(){
;String.c,413 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,414 :: 		}
L_end_Get_It:
JR	RA
NOP	
; end of _Get_It
_Get_Gain:
;String.c,416 :: 		int Get_Gain(){
;String.c,417 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,418 :: 		}
L_end_Get_Gain:
JR	RA
NOP	
; end of _Get_Gain
_Read_Thresholds:
;String.c,423 :: 		char* Read_Thresholds(){
ADDIU	SP, SP, -156
SW	RA, 0(SP)
;String.c,428 :: 		NVMRead(FLASH_Settings_VAddr,&Threshold);
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(_Threshold+0)
ORI	R26, R26, lo_addr(_Threshold+0)
LW	R25, Offset(_FLASH_Settings_VAddr+0)(GP)
JAL	_NVMRead+0
NOP	
;String.c,430 :: 		strcpy(str,"Cth || Rth | Gth | Bth | = || ");
ADDIU	R23, SP, 101
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICS?lstr55_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr55_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 101
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,431 :: 		sprintf(txtR,"%u",Threshold.C_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_56_String+0)
ORI	R2, R2, lo_addr(?lstr_56_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,432 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,433 :: 		strcat(str," || ");
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
;String.c,435 :: 		sprintf(txtR,"%u",Threshold.R_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_58_String+0)
ORI	R2, R2, lo_addr(?lstr_58_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,436 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,437 :: 		strcat(str," | ");
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
;String.c,439 :: 		sprintf(txtR,"%u",Threshold.G_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_60_String+0)
ORI	R2, R2, lo_addr(?lstr_60_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,440 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,441 :: 		strcat(str," | ");
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
;String.c,443 :: 		sprintf(txtR,"%u",Threshold.B_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_62_String+0)
ORI	R2, R2, lo_addr(?lstr_62_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,444 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,445 :: 		strcat(str," | ");
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
;String.c,447 :: 		sprintf(txtR,"%u",Threshold.time_to_log);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+8)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_64_String+0)
ORI	R2, R2, lo_addr(?lstr_64_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,448 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,449 :: 		strcat(str," ||\r\n ");
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
;String.c,451 :: 		return &str;
ADDIU	R2, SP, 37
;String.c,452 :: 		}
;String.c,451 :: 		return &str;
;String.c,452 :: 		}
L_end_Read_Thresholds:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 156
JR	RA
NOP	
; end of _Read_Thresholds
_Write_Thresholds:
;String.c,457 :: 		char* Write_Thresholds(short data_src){
ADDIU	SP, SP, -624
SW	RA, 0(SP)
;String.c,463 :: 		pos =  FLASH_Settings_PAddr;
SW	R26, 4(SP)
LW	R2, Offset(_FLASH_Settings_PAddr+0)(GP)
SW	R2, 524(SP)
;String.c,464 :: 		for(i=1;i<128;i++)
; i start address is: 20 (R5)
ORI	R5, R0, 1
; i end address is: 20 (R5)
SEH	R4, R5
L_Write_Thresholds104:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 128
BNE	R2, R0, L__Write_Thresholds234
NOP	
J	L_Write_Thresholds105
NOP	
L__Write_Thresholds234:
;String.c,465 :: 		val[i] = 0x00000000;
ADDIU	R3, SP, 12
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R0, 0(R2)
;String.c,464 :: 		for(i=1;i<128;i++)
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;String.c,465 :: 		val[i] = 0x00000000;
SEH	R4, R5
; i end address is: 20 (R5)
J	L_Write_Thresholds104
NOP	
L_Write_Thresholds105:
;String.c,468 :: 		if(!data_src)
BEQ	R25, R0, L__Write_Thresholds235
NOP	
J	L_Write_Thresholds107
NOP	
L__Write_Thresholds235:
;String.c,469 :: 		TCS3472_getRawData(RawData);
SB	R25, 8(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 8(SP)
L_Write_Thresholds107:
;String.c,471 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds237
NOP	
J	L_Write_Thresholds108
NOP	
L__Write_Thresholds237:
;String.c,472 :: 		if(string[2] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
BNE	R3, R2, L__Write_Thresholds239
NOP	
J	L_Write_Thresholds109
NOP	
L__Write_Thresholds239:
;String.c,473 :: 		val[0] = atol(string[2]);
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
L_Write_Thresholds109:
;String.c,474 :: 		}
J	L_Write_Thresholds110
NOP	
L_Write_Thresholds108:
;String.c,476 :: 		val[0] = RawData[0];
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+0)(GP)
SW	R2, 0(R3)
L_Write_Thresholds110:
;String.c,477 :: 		err = NVMWriteWord(pos,val[0]);
ADDIU	R2, SP, 12
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,479 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
;String.c,480 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds241
NOP	
J	L_Write_Thresholds111
NOP	
L__Write_Thresholds241:
;String.c,481 :: 		if(string[3] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__Write_Thresholds243
NOP	
J	L_Write_Thresholds112
NOP	
L__Write_Thresholds243:
;String.c,482 :: 		val[1] = atol(string[3]);
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
L_Write_Thresholds112:
;String.c,483 :: 		}else
J	L_Write_Thresholds113
NOP	
L_Write_Thresholds111:
;String.c,484 :: 		val[1] = RawData[1];
ADDIU	R2, SP, 12
ADDIU	R3, R2, 4
LHU	R2, Offset(_RawData+2)(GP)
SW	R2, 0(R3)
L_Write_Thresholds113:
;String.c,485 :: 		err = NVMWriteWord(pos,val[1]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 4
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,487 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
;String.c,488 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds245
NOP	
J	L_Write_Thresholds114
NOP	
L__Write_Thresholds245:
;String.c,489 :: 		if(string[4] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
BNE	R3, R2, L__Write_Thresholds247
NOP	
J	L_Write_Thresholds115
NOP	
L__Write_Thresholds247:
;String.c,490 :: 		val[2] = atol(string[4]);
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
L_Write_Thresholds115:
;String.c,491 :: 		}
J	L_Write_Thresholds116
NOP	
L_Write_Thresholds114:
;String.c,493 :: 		val[2] = RawData[2];
ADDIU	R2, SP, 12
ADDIU	R3, R2, 8
LHU	R2, Offset(_RawData+4)(GP)
SW	R2, 0(R3)
L_Write_Thresholds116:
;String.c,494 :: 		err = NVMWriteWord(pos,val[2]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 8
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,496 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
;String.c,497 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds249
NOP	
J	L_Write_Thresholds117
NOP	
L__Write_Thresholds249:
;String.c,498 :: 		if(string[5] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds251
NOP	
J	L_Write_Thresholds118
NOP	
L__Write_Thresholds251:
;String.c,499 :: 		val[3] = atol(string[5]);
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
L_Write_Thresholds118:
;String.c,500 :: 		}
J	L_Write_Thresholds119
NOP	
L_Write_Thresholds117:
;String.c,502 :: 		val[3] = RawData[3];
ADDIU	R2, SP, 12
ADDIU	R3, R2, 12
LHU	R2, Offset(_RawData+6)(GP)
SW	R2, 0(R3)
L_Write_Thresholds119:
;String.c,503 :: 		err = NVMWriteWord(pos,val[3]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 12
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
SH	R2, 528(SP)
;String.c,505 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
;String.c,506 :: 		if(!data_src){
BEQ	R25, R0, L__Write_Thresholds252
NOP	
J	L_Write_Thresholds120
NOP	
L__Write_Thresholds252:
;String.c,507 :: 		if(string[5] != NULL)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds254
NOP	
J	L_Write_Thresholds121
NOP	
L__Write_Thresholds254:
;String.c,508 :: 		val[4] = atol(string[5]);
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
L_Write_Thresholds121:
;String.c,509 :: 		err = NVMWriteWord(pos,val[4]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 16
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
SH	R2, 528(SP)
;String.c,510 :: 		}
L_Write_Thresholds120:
;String.c,515 :: 		sprintf(txtR,"%x",err);
ADDIU	R3, SP, 530
LH	R2, 528(SP)
SB	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_66_String+0)
ORI	R2, R2, lo_addr(?lstr_66_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,516 :: 		strcpy(str,txtR);
ADDIU	R3, SP, 530
ADDIU	R2, SP, 545
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,517 :: 		strcat(str," \r\n ");
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
;String.c,518 :: 		return str;
ADDIU	R2, SP, 545
;String.c,519 :: 		}
;String.c,518 :: 		return str;
;String.c,519 :: 		}
L_end_Write_Thresholds:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 624
JR	RA
NOP	
; end of _Write_Thresholds
_testStrings:
;String.c,524 :: 		void testStrings(char* writebuff){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;String.c,525 :: 		if(strlen(string[0])!=0){
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings257
NOP	
J	L_testStrings122
NOP	
L__testStrings257:
;String.c,526 :: 		strncat(writebuff,string[0],strlen(string[0]));
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
;String.c,527 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 16(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
ADDIU	R2, SP, 16
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,528 :: 		}
L_testStrings122:
;String.c,529 :: 		if(strlen(string[1])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings259
NOP	
J	L_testStrings123
NOP	
L__testStrings259:
;String.c,530 :: 		strncat(writebuff,string[1],strlen(string[1]));
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
;String.c,531 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 18(SP)
MOVZ	R30, R0, R0
SB	R30, 19(SP)
ADDIU	R2, SP, 18
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,532 :: 		}
L_testStrings123:
;String.c,533 :: 		if(strlen(string[2])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings261
NOP	
J	L_testStrings124
NOP	
L__testStrings261:
;String.c,534 :: 		strncat(writebuff,string[2],strlen(string[2]));
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
;String.c,535 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 20(SP)
MOVZ	R30, R0, R0
SB	R30, 21(SP)
ADDIU	R2, SP, 20
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,536 :: 		}
L_testStrings124:
;String.c,537 :: 		if(strlen(string[3])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings263
NOP	
J	L_testStrings125
NOP	
L__testStrings263:
;String.c,538 :: 		strncat(writebuff,string[3],strlen(string[3]));
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
;String.c,539 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 22(SP)
MOVZ	R30, R0, R0
SB	R30, 23(SP)
ADDIU	R2, SP, 22
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,540 :: 		}
L_testStrings125:
;String.c,541 :: 		if(strlen(string[4])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings265
NOP	
J	L_testStrings126
NOP	
L__testStrings265:
;String.c,542 :: 		strncat(writebuff,string[4],strlen(string[4]));
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
;String.c,543 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 24(SP)
MOVZ	R30, R0, R0
SB	R30, 25(SP)
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,544 :: 		}
L_testStrings126:
;String.c,545 :: 		if(strlen(string[5])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings267
NOP	
J	L_testStrings127
NOP	
L__testStrings267:
;String.c,546 :: 		strncat(writebuff,string[5],strlen(string[5]));
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
;String.c,547 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
ADDIU	R2, SP, 26
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,548 :: 		}
L_testStrings127:
;String.c,549 :: 		if(strlen(string[6])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings269
NOP	
J	L_testStrings128
NOP	
L__testStrings269:
;String.c,550 :: 		strncat(writebuff,string[6],strlen(string[6]));
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
;String.c,551 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 28(SP)
MOVZ	R30, R0, R0
SB	R30, 29(SP)
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,552 :: 		}
L_testStrings128:
;String.c,554 :: 		}
L_end_testStrings:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _testStrings
_TestFlash:
;String.c,556 :: 		char* TestFlash(){
ADDIU	SP, SP, -120
SW	RA, 0(SP)
;String.c,562 :: 		char* tr = "112233";
SW	R25, 4(SP)
SW	R26, 8(SP)
;String.c,570 :: 		Val =  ReadFlashWord();
JAL	_ReadFlashWord+0
NOP	
; Val start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,573 :: 		strcpy(str,"Val || ");
ADDIU	R23, SP, 98
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr76_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr76_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 98
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,574 :: 		LongWordToHex(Val,txtR);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
MOVZ	R25, R6, R0
; Val end address is: 24 (R6)
JAL	_LongWordToHex+0
NOP	
;String.c,576 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,577 :: 		strcat(str," || ");
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
;String.c,579 :: 		sprintf(txtR,"%u",res);//Threshold.R_thresh);
ADDIU	R3, SP, 12
LHU	R2, 96(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_78_String+0)
ORI	R2, R2, lo_addr(?lstr_78_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,580 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,581 :: 		strcat(str," ||\r\n ");
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
;String.c,583 :: 		return &str;
ADDIU	R2, SP, 32
;String.c,584 :: 		}
;String.c,583 :: 		return &str;
;String.c,584 :: 		}
L_end_TestFlash:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 120
JR	RA
NOP	
; end of _TestFlash
_PrintHandler:
;String.c,591 :: 		void PrintHandler(char c){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;String.c,593 :: 		UART1_Write(c);
ANDI	R25, R25, 255
JAL	_UART1_Write+0
NOP	
;String.c,595 :: 		}
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
