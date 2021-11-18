_InitString:
;String.c,40 :: 		PString InitString(char cmp){
ADDIU	SP, SP, -1292
; su_addr start address is: 8 (R2)
MOVZ	R2, R30, R0
; su_addr end address is: 8 (R2)
;String.c,44 :: 		}
L_end_InitString:
ADDIU	SP, SP, 1292
JR	RA
NOP	
; end of _InitString
_DoStrings:
;String.c,49 :: 		int DoStrings(int num){
ADDIU	SP, SP, -116
SW	RA, 0(SP)
;String.c,51 :: 		char *result,conf[64] = "";
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 49
ADDIU	R22, R23, 64
LUI	R24, hi_addr(?ICSDoStrings_conf_L0+0)
ORI	R24, R24, lo_addr(?ICSDoStrings_conf_L0+0)
JAL	___CC2DW+0
NOP	
;String.c,58 :: 		clr_str_arrays(string);     //clear the strings in the array
SH	R25, 16(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_clr_str_arrays+0
NOP	
LH	R25, 16(SP)
;String.c,59 :: 		memcpy(conf,readbuff,num);  //copy the USB buffer to a temp arrar
ADDIU	R2, SP, 49
SEH	R27, R25
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;String.c,60 :: 		result = setstr(conf);       //look for '\r' '\n' and move result to a string
ADDIU	R2, SP, 49
MOVZ	R25, R2, R0
JAL	_setstr+0
NOP	
;String.c,61 :: 		res0 = strsplit(result,'+'); //split the string into an array of strings return num of arr's
ORI	R26, R0, 43
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;String.c,62 :: 		if(res0 > 0)
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__DoStrings139
NOP	
J	L_DoStrings0
NOP	
L__DoStrings139:
;String.c,63 :: 		res1 = StrChecker(string[1]);//Test current string index for equality return index
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
;String.c,65 :: 		res1 = enum_num;
; res1 start address is: 20 (R5)
ORI	R5, R0, 21
; res1 end address is: 20 (R5)
L_DoStrings1:
;String.c,66 :: 		memset(writebuff,0,64);     //empty usb write buffer
; res1 start address is: 20 (R5)
ORI	R27, R0, 64
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memset+0
NOP	
;String.c,76 :: 		switch(res1){
J	L_DoStrings2
NOP	
; res1 end address is: 20 (R5)
;String.c,77 :: 		case CONFIG :
L_DoStrings4:
;String.c,78 :: 		if(!strcmp(string[2],comc[0])){
LW	R26, Offset(_comc+0)(GP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strcmp+0
NOP	
BEQ	R2, R0, L__DoStrings140
NOP	
J	L_DoStrings5
NOP	
L__DoStrings140:
;String.c,79 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings142
NOP	
J	L_DoStrings6
NOP	
L__DoStrings142:
;String.c,80 :: 		Int_Time = atoi(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
SH	R2, 24(SP)
;String.c,81 :: 		for(i=0;i<Int_Time;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_DoStrings7:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
LH	R2, 24(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__DoStrings143
NOP	
J	L_DoStrings8
NOP	
L__DoStrings143:
;String.c,82 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,83 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_DoStrings10:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings10
NOP	
;String.c,81 :: 		for(i=0;i<Int_Time;i++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;String.c,84 :: 		}
; i end address is: 16 (R4)
J	L_DoStrings7
NOP	
L_DoStrings8:
;String.c,85 :: 		}
L_DoStrings6:
;String.c,86 :: 		err = TCS3472_SetIntergration_Time(Int_Time);
SH	R25, 16(SP)
LH	R25, 24(SP)
JAL	_TCS3472_SetIntergration_Time+0
NOP	
LH	R25, 16(SP)
; err start address is: 16 (R4)
ANDI	R4, R2, 255
;String.c,87 :: 		if(err > 0)
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DoStrings144
NOP	
J	L_DoStrings12
NOP	
L__DoStrings144:
;String.c,88 :: 		for(i=0;i<err;i++){
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
BNE	R2, R0, L__DoStrings145
NOP	
J	L_DoStrings14
NOP	
L__DoStrings145:
;String.c,89 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,90 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_DoStrings16:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings16
NOP	
NOP	
NOP	
;String.c,88 :: 		for(i=0;i<err;i++){
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;String.c,91 :: 		}
; err end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_DoStrings13
NOP	
L_DoStrings14:
L_DoStrings12:
;String.c,92 :: 		}else if(!strcmp(string[2],comc[1])){
J	L_DoStrings18
NOP	
L_DoStrings5:
LW	R26, Offset(_comc+4)(GP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strcmp+0
NOP	
BEQ	R2, R0, L__DoStrings146
NOP	
J	L_DoStrings19
NOP	
L__DoStrings146:
;String.c,93 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings148
NOP	
J	L_DoStrings20
NOP	
L__DoStrings148:
;String.c,94 :: 		Gain = atoi(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
SH	R2, 26(SP)
;String.c,95 :: 		for(i=0;i<Gain;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_DoStrings21:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
LH	R2, 26(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__DoStrings149
NOP	
J	L_DoStrings22
NOP	
L__DoStrings149:
;String.c,96 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,97 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_DoStrings24:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings24
NOP	
;String.c,95 :: 		for(i=0;i<Gain;i++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;String.c,98 :: 		}
; i end address is: 16 (R4)
J	L_DoStrings21
NOP	
L_DoStrings22:
;String.c,99 :: 		}
L_DoStrings20:
;String.c,100 :: 		err = TCS3472_SetGain(Gain);
SH	R25, 16(SP)
LH	R25, 26(SP)
JAL	_TCS3472_SetGain+0
NOP	
LH	R25, 16(SP)
; err start address is: 16 (R4)
ANDI	R4, R2, 255
;String.c,101 :: 		if(err > 0)
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DoStrings150
NOP	
J	L_DoStrings26
NOP	
L__DoStrings150:
;String.c,102 :: 		for(i=0;i<err;i++){
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
BNE	R2, R0, L__DoStrings151
NOP	
J	L_DoStrings28
NOP	
L__DoStrings151:
;String.c,103 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,104 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_DoStrings30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings30
NOP	
NOP	
NOP	
;String.c,102 :: 		for(i=0;i<err;i++){
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;String.c,105 :: 		}
; err end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_DoStrings27
NOP	
L_DoStrings28:
L_DoStrings26:
;String.c,106 :: 		}
L_DoStrings19:
L_DoStrings18:
;String.c,107 :: 		LATE3_bit = 0;
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
;String.c,108 :: 		break;
J	L_DoStrings3
NOP	
;String.c,109 :: 		case SENDA :
L_DoStrings32:
;String.c,110 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;String.c,111 :: 		break;
J	L_DoStrings3
NOP	
;String.c,112 :: 		case READA :
L_DoStrings33:
;String.c,113 :: 		str = Read_Send_AllColour(0);
MOVZ	R25, R0, R0
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, 20(SP)
;String.c,114 :: 		break;
J	L_DoStrings3
NOP	
;String.c,115 :: 		case READR :
L_DoStrings34:
;String.c,116 :: 		str = Read_Send_OneColour(READR);
ORI	R25, R0, 7
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,117 :: 		break;
J	L_DoStrings3
NOP	
;String.c,118 :: 		case READG :
L_DoStrings35:
;String.c,119 :: 		str = Read_Send_OneColour(READG);
ORI	R25, R0, 8
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,120 :: 		break;
J	L_DoStrings3
NOP	
;String.c,121 :: 		case READB :
L_DoStrings36:
;String.c,122 :: 		str = Read_Send_OneColour(READB);
ORI	R25, R0, 9
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,123 :: 		break;
J	L_DoStrings3
NOP	
;String.c,124 :: 		case READC :
L_DoStrings37:
;String.c,125 :: 		str = Read_Send_OneColour(READC);
ORI	R25, R0, 10
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,126 :: 		break;
J	L_DoStrings3
NOP	
;String.c,127 :: 		case READT :
L_DoStrings38:
;String.c,128 :: 		str = Read_Send_OneColour(READT);
ORI	R25, R0, 11
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,129 :: 		break;
J	L_DoStrings3
NOP	
;String.c,130 :: 		case READT_DN40 :
L_DoStrings39:
;String.c,131 :: 		str = Read_Send_OneColour(READT_DN40);
ORI	R25, R0, 12
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,132 :: 		break;
J	L_DoStrings3
NOP	
;String.c,133 :: 		case READA_SCL :
L_DoStrings40:
;String.c,134 :: 		str = Read_Send_AllColour(1);
ORI	R25, R0, 1
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, 20(SP)
;String.c,135 :: 		break;
J	L_DoStrings3
NOP	
;String.c,136 :: 		case READA_THV :
L_DoStrings41:
;String.c,137 :: 		str =  Read_Thresholds(); //TestFlash();//
JAL	_Read_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,138 :: 		break;
J	L_DoStrings3
NOP	
;String.c,139 :: 		case WRITE_MAN :
L_DoStrings42:
;String.c,140 :: 		str = Write_Thresholds(1);
ORI	R25, R0, 1
JAL	_Write_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,141 :: 		break;
J	L_DoStrings3
NOP	
;String.c,142 :: 		case WRITE_RAW :
L_DoStrings43:
;String.c,143 :: 		str = Write_Thresholds(0);
MOVZ	R25, R0, R0
JAL	_Write_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,144 :: 		break;
J	L_DoStrings3
NOP	
;String.c,145 :: 		case START :
L_DoStrings44:
;String.c,146 :: 		SimVars.init_inc = 5;
ORI	R2, R0, 5
SB	R2, Offset(_SimVars+1)(GP)
;String.c,147 :: 		break;
J	L_DoStrings3
NOP	
;String.c,148 :: 		case CANCEL :
L_DoStrings45:
;String.c,149 :: 		SimVars.init_inc = 3;
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
;String.c,150 :: 		break;
J	L_DoStrings3
NOP	
;String.c,151 :: 		case READA_HUE :
L_DoStrings46:
;String.c,152 :: 		str = ReadHUE();
JAL	_ReadHUE+0
NOP	
SW	R2, 20(SP)
;String.c,153 :: 		break;
J	L_DoStrings3
NOP	
;String.c,154 :: 		default:
L_DoStrings47:
;String.c,155 :: 		str = "No data requested!\r\n";
ADDIU	R23, SP, 28
ADDIU	R22, R23, 21
LUI	R24, hi_addr(?ICS?lstr24_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr24_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 28
SW	R2, 20(SP)
;String.c,156 :: 		break;
J	L_DoStrings3
NOP	
;String.c,157 :: 		}
L_DoStrings2:
; res1 start address is: 20 (R5)
SEH	R2, R5
BNE	R2, R0, L__DoStrings153
NOP	
J	L_DoStrings4
NOP	
L__DoStrings153:
SEH	R3, R5
ORI	R2, R0, 5
BNE	R3, R2, L__DoStrings155
NOP	
J	L_DoStrings32
NOP	
L__DoStrings155:
SEH	R3, R5
ORI	R2, R0, 6
BNE	R3, R2, L__DoStrings157
NOP	
J	L_DoStrings33
NOP	
L__DoStrings157:
SEH	R3, R5
ORI	R2, R0, 7
BNE	R3, R2, L__DoStrings159
NOP	
J	L_DoStrings34
NOP	
L__DoStrings159:
SEH	R3, R5
ORI	R2, R0, 8
BNE	R3, R2, L__DoStrings161
NOP	
J	L_DoStrings35
NOP	
L__DoStrings161:
SEH	R3, R5
ORI	R2, R0, 9
BNE	R3, R2, L__DoStrings163
NOP	
J	L_DoStrings36
NOP	
L__DoStrings163:
SEH	R3, R5
ORI	R2, R0, 10
BNE	R3, R2, L__DoStrings165
NOP	
J	L_DoStrings37
NOP	
L__DoStrings165:
SEH	R3, R5
ORI	R2, R0, 11
BNE	R3, R2, L__DoStrings167
NOP	
J	L_DoStrings38
NOP	
L__DoStrings167:
SEH	R3, R5
ORI	R2, R0, 12
BNE	R3, R2, L__DoStrings169
NOP	
J	L_DoStrings39
NOP	
L__DoStrings169:
SEH	R3, R5
ORI	R2, R0, 13
BNE	R3, R2, L__DoStrings171
NOP	
J	L_DoStrings40
NOP	
L__DoStrings171:
SEH	R3, R5
ORI	R2, R0, 14
BNE	R3, R2, L__DoStrings173
NOP	
J	L_DoStrings41
NOP	
L__DoStrings173:
SEH	R3, R5
ORI	R2, R0, 15
BNE	R3, R2, L__DoStrings175
NOP	
J	L_DoStrings42
NOP	
L__DoStrings175:
SEH	R3, R5
ORI	R2, R0, 16
BNE	R3, R2, L__DoStrings177
NOP	
J	L_DoStrings43
NOP	
L__DoStrings177:
SEH	R3, R5
ORI	R2, R0, 17
BNE	R3, R2, L__DoStrings179
NOP	
J	L_DoStrings44
NOP	
L__DoStrings179:
SEH	R3, R5
ORI	R2, R0, 18
BNE	R3, R2, L__DoStrings181
NOP	
J	L_DoStrings45
NOP	
L__DoStrings181:
SEH	R3, R5
; res1 end address is: 20 (R5)
ORI	R2, R0, 19
BNE	R3, R2, L__DoStrings183
NOP	
J	L_DoStrings46
NOP	
L__DoStrings183:
J	L_DoStrings47
NOP	
L_DoStrings3:
;String.c,161 :: 		strncat(writebuff,str,strlen(str));
LW	R25, 20(SP)
JAL	_strlen+0
NOP	
SEH	R27, R2
LW	R26, 20(SP)
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncat+0
NOP	
;String.c,162 :: 		while(!HID_Write(&writebuff,64));
L_DoStrings48:
SH	R25, 16(SP)
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
LH	R25, 16(SP)
BEQ	R2, R0, L__DoStrings184
NOP	
J	L_DoStrings49
NOP	
L__DoStrings184:
J	L_DoStrings48
NOP	
L_DoStrings49:
;String.c,166 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,167 :: 		}
;String.c,166 :: 		return 0;
;String.c,167 :: 		}
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
;String.c,172 :: 		void clr_str_arrays(char str[20][64]){
;String.c,174 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_clr_str_arrays50:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__clr_str_arrays186
NOP	
J	L_clr_str_arrays51
NOP	
L__clr_str_arrays186:
;String.c,175 :: 		for(j = 0;j<64;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_clr_str_arrays53:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 64
BNE	R2, R0, L__clr_str_arrays187
NOP	
J	L_clr_str_arrays54
NOP	
L__clr_str_arrays187:
;String.c,176 :: 		str[i][j] = 0;
SEH	R2, R4
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R5
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,175 :: 		for(j = 0;j<64;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,177 :: 		}
; j end address is: 20 (R5)
J	L_clr_str_arrays53
NOP	
L_clr_str_arrays54:
;String.c,174 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,179 :: 		}
; i end address is: 16 (R4)
J	L_clr_str_arrays50
NOP	
L_clr_str_arrays51:
;String.c,180 :: 		}
L_end_clr_str_arrays:
JR	RA
NOP	
; end of _clr_str_arrays
_setstr:
;String.c,185 :: 		char* setstr(char conf[250]){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;String.c,187 :: 		for(i=0;i < strlen(conf);i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_setstr56:
; i start address is: 20 (R5)
JAL	_strlen+0
NOP	
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__setstr189
NOP	
J	L_setstr57
NOP	
L__setstr189:
;String.c,188 :: 		if(conf[i] == '\0')
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__setstr190
NOP	
J	L_setstr59
NOP	
L__setstr190:
;String.c,189 :: 		break;
J	L_setstr57
NOP	
L_setstr59:
;String.c,187 :: 		for(i=0;i < strlen(conf);i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,190 :: 		}
J	L_setstr56
NOP	
L_setstr57:
;String.c,191 :: 		conf[i+1] = 0;
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
SEH	R2, R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;String.c,193 :: 		return conf;
MOVZ	R2, R25, R0
;String.c,194 :: 		}
L_end_setstr:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _setstr
_strsplit:
;String.c,199 :: 		int strsplit(char str[250], char c){
;String.c,201 :: 		ii=kk=err=lasti=0;
; lasti start address is: 24 (R6)
MOVZ	R6, R0, R0
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;String.c,202 :: 		for (i = 0; i < 250;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
L_strsplit60:
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
; lasti start address is: 24 (R6)
SEH	R2, R4
SLTI	R2, R2, 250
BNE	R2, R0, L__strsplit192
NOP	
J	L_strsplit61
NOP	
L__strsplit192:
;String.c,203 :: 		err = i - lasti;
SUBU	R2, R4, R6
; err start address is: 32 (R8)
SEH	R8, R2
;String.c,204 :: 		if(str[i] == c || err > 62){
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R26, 255
BNE	R3, R2, L__strsplit194
NOP	
J	L__strsplit133
NOP	
L__strsplit194:
SEH	R2, R8
; err end address is: 32 (R8)
SLTI	R2, R2, 63
BNE	R2, R0, L__strsplit195
NOP	
J	L__strsplit132
NOP	
L__strsplit195:
J	L_strsplit65
NOP	
; lasti end address is: 24 (R6)
L__strsplit133:
L__strsplit132:
;String.c,205 :: 		string[kk][ii] = 0;
SEH	R2, R5
SLL	R3, R2, 6
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
ADDU	R3, R2, R3
SEH	R2, R7
; ii end address is: 28 (R7)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,206 :: 		kk++;
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,207 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;String.c,208 :: 		lasti = i;
; lasti start address is: 24 (R6)
SEH	R6, R4
;String.c,209 :: 		continue;//goto endb;
J	L_strsplit62
NOP	
;String.c,210 :: 		}else{
L_strsplit65:
;String.c,211 :: 		string[kk][ii] = str[i];
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
;String.c,212 :: 		ii++;
ADDIU	R2, R7, 1
SEH	R7, R2
;String.c,215 :: 		if(str[i]==0)
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit196
NOP	
J	L_strsplit67
NOP	
L__strsplit196:
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
;String.c,216 :: 		break;
J	L_strsplit61
NOP	
L_strsplit67:
;String.c,217 :: 		}
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; lasti start address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
L_strsplit62:
; lasti end address is: 24 (R6)
;String.c,202 :: 		for (i = 0; i < 250;i++){
; lasti start address is: 24 (R6)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,217 :: 		}
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
J	L_strsplit60
NOP	
L_strsplit61:
;String.c,218 :: 		return kk;
SEH	R2, R5
; kk end address is: 20 (R5)
;String.c,219 :: 		}
L_end_strsplit:
JR	RA
NOP	
; end of _strsplit
_findnumber:
;String.c,224 :: 		char* findnumber(char* str){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;String.c,228 :: 		temp = (char*)Malloc(strlen(str));
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
;String.c,230 :: 		for(i = 0;i < strlen(str);i++){
; i start address is: 36 (R9)
MOVZ	R9, R0, R0
; temp end address is: 32 (R8)
; i end address is: 36 (R9)
L_findnumber68:
; i start address is: 36 (R9)
; temp start address is: 32 (R8)
JAL	_strlen+0
NOP	
SEH	R3, R9
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__findnumber198
NOP	
J	L_findnumber69
NOP	
L__findnumber198:
;String.c,231 :: 		if((str[i] > 0x29)&& (str[i] < 0x40)){
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 42
BEQ	R2, R0, L__findnumber199
NOP	
J	L__findnumber136
NOP	
L__findnumber199:
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 64
BNE	R2, R0, L__findnumber200
NOP	
J	L__findnumber135
NOP	
L__findnumber200:
L__findnumber134:
;String.c,232 :: 		temp[i] = str[i];
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,231 :: 		if((str[i] > 0x29)&& (str[i] < 0x40)){
L__findnumber136:
L__findnumber135:
;String.c,230 :: 		for(i = 0;i < strlen(str);i++){
ADDIU	R2, R9, 1
SEH	R9, R2
;String.c,234 :: 		}
J	L_findnumber68
NOP	
L_findnumber69:
;String.c,235 :: 		temp[i] = 0;
SEH	R2, R9
; i end address is: 36 (R9)
ADDU	R2, R8, R2
SB	R0, 0(R2)
;String.c,236 :: 		Free(temp,sizeof(temp));
SW	R25, 8(SP)
ORI	R26, R0, 4
MOVZ	R25, R8, R0
JAL	_Free+0
NOP	
LW	R25, 8(SP)
;String.c,237 :: 		return temp;
MOVZ	R2, R8, R0
; temp end address is: 32 (R8)
;String.c,238 :: 		}
;String.c,237 :: 		return temp;
;String.c,238 :: 		}
L_end_findnumber:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _findnumber
_StrChecker:
;String.c,244 :: 		int StrChecker(char *str){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,248 :: 		if(!once){
SW	R26, 4(SP)
SW	R27, 8(SP)
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
EXT	R2, R2, BitPos(StrChecker_once_L0+0), 1
BEQ	R2, R0, L__StrChecker202
NOP	
J	L_StrChecker74
NOP	
L__StrChecker202:
;String.c,249 :: 		once = 1;
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
ORI	R2, R2, BitMask(StrChecker_once_L0+0)
SB	R2, Offset(StrChecker_once_L0+0)(GP)
;String.c,250 :: 		enum_val = enum_num;
ORI	R2, R0, 21
SH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
;String.c,251 :: 		}
L_StrChecker74:
;String.c,252 :: 		length = strlen(str);
JAL	_strlen+0
NOP	
; length start address is: 20 (R5)
SEH	R5, R2
;String.c,253 :: 		if(length < 5){
SEH	R2, R2
SLTI	R2, R2, 5
BNE	R2, R0, L__StrChecker203
NOP	
J	L_StrChecker75
NOP	
L__StrChecker203:
; length end address is: 20 (R5)
;String.c,254 :: 		return 20;
ORI	R2, R0, 20
J	L_end_StrChecker
NOP	
;String.c,255 :: 		}
L_StrChecker75:
;String.c,256 :: 		for(i = 0;i < enum_val;i++){
; i start address is: 24 (R6)
; length start address is: 20 (R5)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_StrChecker76:
; i start address is: 24 (R6)
; length start address is: 20 (R5)
; length end address is: 20 (R5)
SEH	R3, R6
LH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__StrChecker204
NOP	
J	L_StrChecker77
NOP	
L__StrChecker204:
; length end address is: 20 (R5)
;String.c,257 :: 		if(strncmp(str,com[i],length)==0)
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
BEQ	R2, R0, L__StrChecker205
NOP	
J	L_StrChecker79
NOP	
L__StrChecker205:
; length end address is: 20 (R5)
;String.c,258 :: 		break;
J	L_StrChecker77
NOP	
L_StrChecker79:
;String.c,256 :: 		for(i = 0;i < enum_val;i++){
; length start address is: 20 (R5)
ADDIU	R2, R6, 1
SEH	R6, R2
;String.c,259 :: 		}
; length end address is: 20 (R5)
J	L_StrChecker76
NOP	
L_StrChecker77:
;String.c,260 :: 		return i;
SEH	R2, R6
; i end address is: 24 (R6)
;String.c,261 :: 		}
;String.c,260 :: 		return i;
;String.c,261 :: 		}
L_end_StrChecker:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _StrChecker
_RemoveWhiteSpace:
;String.c,266 :: 		char* RemoveWhiteSpace(char* str){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;String.c,269 :: 		j=0;
; j start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,270 :: 		for(i=0;i<strlen(str)+1;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 24 (R6)
; i end address is: 20 (R5)
L_RemoveWhiteSpace80:
; i start address is: 20 (R5)
; j start address is: 24 (R6)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__RemoveWhiteSpace207
NOP	
J	L_RemoveWhiteSpace81
NOP	
L__RemoveWhiteSpace207:
;String.c,271 :: 		if(str[i] == 0x20)
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 32
BEQ	R3, R2, L__RemoveWhiteSpace208
NOP	
J	L_RemoveWhiteSpace83
NOP	
L__RemoveWhiteSpace208:
;String.c,272 :: 		continue;
J	L_RemoveWhiteSpace82
NOP	
L_RemoveWhiteSpace83:
;String.c,273 :: 		temp[j] = str[i];
SEH	R3, R6
LW	R2, 4(SP)
ADDU	R3, R2, R3
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,274 :: 		j++;
ADDIU	R2, R6, 1
SEH	R6, R2
; j end address is: 24 (R6)
;String.c,275 :: 		}
L_RemoveWhiteSpace82:
;String.c,270 :: 		for(i=0;i<strlen(str)+1;i++){
; j start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,275 :: 		}
; j end address is: 24 (R6)
; i end address is: 20 (R5)
J	L_RemoveWhiteSpace80
NOP	
L_RemoveWhiteSpace81:
;String.c,276 :: 		return temp;
LW	R2, 4(SP)
;String.c,277 :: 		}
L_end_RemoveWhiteSpace:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _RemoveWhiteSpace
_RemoveChars:
;String.c,282 :: 		char* RemoveChars(char* str,char a,char b){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,284 :: 		int i=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;String.c,285 :: 		temp = (char*)Malloc(100*sizeof(char*));
SW	R25, 12(SP)
ORI	R25, R0, 400
JAL	_Malloc+0
NOP	
LW	R25, 12(SP)
; temp start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,288 :: 		if(a != 0x02){
ANDI	R3, R26, 255
ORI	R2, R0, 2
BNE	R3, R2, L__RemoveChars211
NOP	
J	L_RemoveChars84
NOP	
L__RemoveChars211:
; temp end address is: 24 (R6)
;String.c,289 :: 		temp = strchr(str,a);
SW	R25, 12(SP)
JAL	_strchr+0
NOP	
LW	R25, 12(SP)
; temp start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,290 :: 		strcpy(str,temp+1);
ADDIU	R2, R2, 1
MOVZ	R26, R2, R0
JAL	_strcpy+0
NOP	
;String.c,291 :: 		}else{
MOVZ	R8, R6, R0
J	L_RemoveChars85
NOP	
L_RemoveChars84:
;String.c,292 :: 		strcpy(temp,str);
SW	R25, 12(SP)
MOVZ	R26, R25, R0
MOVZ	R25, R6, R0
JAL	_strcpy+0
NOP	
; temp end address is: 24 (R6)
LW	R25, 12(SP)
MOVZ	R8, R6, R0
;String.c,293 :: 		}
L_RemoveChars85:
;String.c,294 :: 		for(i=0;i<strlen(temp)+1;i++){
; temp start address is: 32 (R8)
; i start address is: 36 (R9)
MOVZ	R9, R0, R0
; temp end address is: 32 (R8)
; i end address is: 36 (R9)
L_RemoveChars86:
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
BNE	R2, R0, L__RemoveChars212
NOP	
J	L_RemoveChars87
NOP	
L__RemoveChars212:
;String.c,295 :: 		if(temp[i]==b)
SEH	R2, R9
ADDU	R2, R8, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BEQ	R3, R2, L__RemoveChars213
NOP	
J	L_RemoveChars89
NOP	
L__RemoveChars213:
;String.c,296 :: 		break;
J	L_RemoveChars87
NOP	
L_RemoveChars89:
;String.c,297 :: 		*(temp+i) = *(str+i);
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,294 :: 		for(i=0;i<strlen(temp)+1;i++){
ADDIU	R2, R9, 1
SEH	R9, R2
;String.c,298 :: 		}
J	L_RemoveChars86
NOP	
L_RemoveChars87:
;String.c,299 :: 		*(temp+i) = 0;
SEH	R2, R9
; i end address is: 36 (R9)
ADDU	R2, R8, R2
SB	R0, 0(R2)
;String.c,301 :: 		Free(temp,100);
ORI	R26, R0, 100
MOVZ	R25, R8, R0
JAL	_Free+0
NOP	
;String.c,302 :: 		return temp;
MOVZ	R2, R8, R0
; temp end address is: 32 (R8)
;String.c,303 :: 		}
;String.c,302 :: 		return temp;
;String.c,303 :: 		}
L_end_RemoveChars:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _RemoveChars
_WriteData:
;String.c,308 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;String.c,311 :: 		memset(writebuff,0,64);
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
;String.c,312 :: 		strncpy(writebuff,_data,strlen(_data));
JAL	_strlen+0
NOP	
SEH	R27, R2
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncpy+0
NOP	
;String.c,313 :: 		HID_Write(&writebuff,64);
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
;String.c,314 :: 		}
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
;String.c,319 :: 		char* Read_Send_AllColour(short data_src){
ADDIU	SP, SP, -140
SW	RA, 0(SP)
;String.c,326 :: 		TCS3472_getRawData(RawData);
SW	R25, 4(SP)
SW	R26, 8(SP)
SB	R25, 12(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 12(SP)
;String.c,327 :: 		if(data_src)
BNE	R25, R0, L__Read_Send_AllColour217
NOP	
J	L_Read_Send_AllColour90
NOP	
L__Read_Send_AllColour217:
;String.c,328 :: 		GetScaledValues(RawData,&FltData);
SB	R25, 12(SP)
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_GetScaledValues+0
NOP	
LB	R25, 12(SP)
L_Read_Send_AllColour90:
;String.c,330 :: 		strcpy(str,"C || R | G | B | = || ");
ADDIU	R23, SP, 92
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr25_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr25_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 92
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LB	R25, 12(SP)
;String.c,331 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour218
NOP	
J	L_Read_Send_AllColour91
NOP	
L__Read_Send_AllColour218:
;String.c,332 :: 		sprintf(txtR,"%u",RawData[0]); //C
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+0)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_26_String+0)
ORI	R2, R2, lo_addr(?lstr_26_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
J	L_Read_Send_AllColour92
NOP	
L_Read_Send_AllColour91:
;String.c,334 :: 		sprintf(txtR,"%3.2f",FltData[0]); //R
ADDIU	R3, SP, 13
LW	R2, Offset(_FltData+0)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_27_String+0)
ORI	R2, R2, lo_addr(?lstr_27_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
L_Read_Send_AllColour92:
;String.c,335 :: 		strcat(str,txtR);
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,336 :: 		strcat(str," || ");
ORI	R30, R0, 32
SB	R30, 115(SP)
ORI	R30, R0, 124
SB	R30, 116(SP)
ORI	R30, R0, 124
SB	R30, 117(SP)
ORI	R30, R0, 32
SB	R30, 118(SP)
MOVZ	R30, R0, R0
SB	R30, 119(SP)
ADDIU	R3, SP, 115
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
;String.c,338 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour219
NOP	
J	L_Read_Send_AllColour93
NOP	
L__Read_Send_AllColour219:
;String.c,339 :: 		sprintf(txtR,"%u",RawData[1]);  //R
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+2)(GP)
SB	R25, 12(SP)
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
J	L_Read_Send_AllColour94
NOP	
L_Read_Send_AllColour93:
;String.c,341 :: 		sprintf(txtR,"%3.2f",FltData[1]); //G
ADDIU	R3, SP, 13
LW	R2, Offset(_FltData+4)(GP)
SB	R25, 12(SP)
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
L_Read_Send_AllColour94:
;String.c,342 :: 		strcat(str,txtR);
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,343 :: 		strcat(str," | ");
ORI	R30, R0, 32
SB	R30, 120(SP)
ORI	R30, R0, 124
SB	R30, 121(SP)
ORI	R30, R0, 32
SB	R30, 122(SP)
MOVZ	R30, R0, R0
SB	R30, 123(SP)
ADDIU	R3, SP, 120
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
;String.c,345 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour220
NOP	
J	L_Read_Send_AllColour95
NOP	
L__Read_Send_AllColour220:
;String.c,346 :: 		sprintf(txtR,"%u",RawData[2]);  //G
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+4)(GP)
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
J	L_Read_Send_AllColour96
NOP	
L_Read_Send_AllColour95:
;String.c,348 :: 		sprintf(txtR,"%3.2f",FltData[2]);  //B
ADDIU	R3, SP, 13
LW	R2, Offset(_FltData+8)(GP)
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
L_Read_Send_AllColour96:
;String.c,349 :: 		strcat(str,txtR);
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,350 :: 		strcat(str," | ");
ORI	R30, R0, 32
SB	R30, 124(SP)
ORI	R30, R0, 124
SB	R30, 125(SP)
ORI	R30, R0, 32
SB	R30, 126(SP)
MOVZ	R30, R0, R0
SB	R30, 127(SP)
ADDIU	R3, SP, 124
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
;String.c,352 :: 		if(!data_src ) {
BEQ	R25, R0, L__Read_Send_AllColour221
NOP	
J	L_Read_Send_AllColour97
NOP	
L__Read_Send_AllColour221:
;String.c,353 :: 		sprintf(txtR,"%u",RawData[3]);  //ERR
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_35_String+0)
ORI	R2, R2, lo_addr(?lstr_35_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,354 :: 		strcat(str,txtR);
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,355 :: 		strcat(str," || ");
ORI	R30, R0, 32
SB	R30, 128(SP)
ORI	R30, R0, 124
SB	R30, 129(SP)
ORI	R30, R0, 124
SB	R30, 130(SP)
ORI	R30, R0, 32
SB	R30, 131(SP)
MOVZ	R30, R0, R0
SB	R30, 132(SP)
ADDIU	R3, SP, 128
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,357 :: 		err = TCS3472_C2RGB_Error(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_C2RGB_Error+0
NOP	
;String.c,358 :: 		sprintf(txtR,"%5d",err);
ADDIU	R3, SP, 13
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_37_String+0)
ORI	R2, R2, lo_addr(?lstr_37_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,359 :: 		strcat(str,txtR);
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,360 :: 		}
L_Read_Send_AllColour97:
;String.c,361 :: 		strcat(str," ||\r\n");
ORI	R30, R0, 32
SB	R30, 133(SP)
ORI	R30, R0, 124
SB	R30, 134(SP)
ORI	R30, R0, 124
SB	R30, 135(SP)
ORI	R30, R0, 13
SB	R30, 136(SP)
ORI	R30, R0, 10
SB	R30, 137(SP)
MOVZ	R30, R0, R0
SB	R30, 138(SP)
ADDIU	R3, SP, 133
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,363 :: 		return &str;
ADDIU	R2, SP, 28
;String.c,364 :: 		}
;String.c,363 :: 		return &str;
;String.c,364 :: 		}
L_end_Read_Send_AllColour:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 140
JR	RA
NOP	
; end of _Read_Send_AllColour
_Read_Send_OneColour:
;String.c,369 :: 		char* Read_Send_OneColour(int colr){
ADDIU	SP, SP, -180
SW	RA, 0(SP)
;String.c,373 :: 		switch(colr){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Read_Send_OneColour98
NOP	
;String.c,374 :: 		case READR:
L_Read_Send_OneColour100:
;String.c,375 :: 		col = TCS3472_Read16(TCS3472_RDATAL);
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,376 :: 		strcpy(str,"R = || ");
ADDIU	R23, SP, 90
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr39_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr39_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 90
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,377 :: 		sprintf(txtR,"%5u",col);
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
;String.c,378 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,379 :: 		strcat(str," ||\r\n");
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
;String.c,380 :: 		break;
J	L_Read_Send_OneColour99
NOP	
;String.c,381 :: 		case READG:
L_Read_Send_OneColour101:
;String.c,382 :: 		col = TCS3472_Read16(TCS3472_GDATAL);
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,383 :: 		strcpy(str,"G = || ");
ADDIU	R23, SP, 104
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr42_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr42_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 104
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,384 :: 		sprintf(txtR,"%5u",col);
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
;String.c,385 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,386 :: 		strcat(str," ||\r\n");
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
;String.c,387 :: 		break;
J	L_Read_Send_OneColour99
NOP	
;String.c,388 :: 		case READB:
L_Read_Send_OneColour102:
;String.c,389 :: 		col = TCS3472_Read16(TCS3472_BDATAL);
ORI	R25, R0, 26
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,390 :: 		strcpy(str,"B = || ");
ADDIU	R23, SP, 118
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr45_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr45_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 118
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,391 :: 		sprintf(txtR,"%u",col);
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
;String.c,392 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,393 :: 		strcat(str," ||\r\n");
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
;String.c,394 :: 		break;
J	L_Read_Send_OneColour99
NOP	
;String.c,395 :: 		case READC:
L_Read_Send_OneColour103:
;String.c,396 :: 		col = TCS3472_Read16(TCS3472_CDATAL);
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,397 :: 		strcpy(str,"C = || ");
ADDIU	R23, SP, 132
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr48_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr48_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 132
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,398 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_49_String+0)
ORI	R2, R2, lo_addr(?lstr_49_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,399 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,400 :: 		strcat(str," ||\r\n");
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
;String.c,401 :: 		break;
J	L_Read_Send_OneColour99
NOP	
;String.c,402 :: 		case READT:
L_Read_Send_OneColour104:
;String.c,403 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,404 :: 		col = TCS3472_CalcColTemp(RawData[1],RawData[3],RawData[3]);
LHU	R27, Offset(_RawData+6)(GP)
LHU	R26, Offset(_RawData+6)(GP)
LHU	R25, Offset(_RawData+2)(GP)
JAL	_TCS3472_CalcColTemp+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,405 :: 		strcpy(str,"T = || ");
ADDIU	R23, SP, 146
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr51_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr51_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 146
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,406 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_52_String+0)
ORI	R2, R2, lo_addr(?lstr_52_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,407 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,408 :: 		strcat(str," ||\r\n");
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
;String.c,409 :: 		break;
J	L_Read_Send_OneColour99
NOP	
;String.c,410 :: 		case READT_DN40:
L_Read_Send_OneColour105:
;String.c,411 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,412 :: 		col = TCS3472_CalcColTemp_dn40(RawData,it);
LBU	R26, Offset(_it+0)(GP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_CalcColTemp_dn40+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,413 :: 		strcpy(str,"T_DN40 = || ");
ADDIU	R23, SP, 160
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr54_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr54_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 160
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,414 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_55_String+0)
ORI	R2, R2, lo_addr(?lstr_55_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,415 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,416 :: 		strcat(str," ||\r\n");
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
;String.c,417 :: 		break;
J	L_Read_Send_OneColour99
NOP	
;String.c,418 :: 		}
L_Read_Send_OneColour98:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Read_Send_OneColour224
NOP	
J	L_Read_Send_OneColour100
NOP	
L__Read_Send_OneColour224:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Read_Send_OneColour226
NOP	
J	L_Read_Send_OneColour101
NOP	
L__Read_Send_OneColour226:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Read_Send_OneColour228
NOP	
J	L_Read_Send_OneColour102
NOP	
L__Read_Send_OneColour228:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Read_Send_OneColour230
NOP	
J	L_Read_Send_OneColour103
NOP	
L__Read_Send_OneColour230:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Read_Send_OneColour232
NOP	
J	L_Read_Send_OneColour104
NOP	
L__Read_Send_OneColour232:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Read_Send_OneColour234
NOP	
J	L_Read_Send_OneColour105
NOP	
L__Read_Send_OneColour234:
L_Read_Send_OneColour99:
;String.c,419 :: 		return &str;
ADDIU	R2, SP, 26
;String.c,420 :: 		}
;String.c,419 :: 		return &str;
;String.c,420 :: 		}
L_end_Read_Send_OneColour:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 180
JR	RA
NOP	
; end of _Read_Send_OneColour
_ReadHUE:
;String.c,425 :: 		char* ReadHUE(){
ADDIU	SP, SP, -112
SW	RA, 0(SP)
;String.c,430 :: 		memset(str,0,64);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R2, SP, 16
ORI	R27, R0, 64
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;String.c,432 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,433 :: 		GetScaledValues(RawData,&FltData);
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_GetScaledValues+0
NOP	
;String.c,434 :: 		HUE = TCS3472_CalcHue(&FltData);
LUI	R25, hi_addr(_FltData+0)
ORI	R25, R25, lo_addr(_FltData+0)
JAL	_TCS3472_CalcHue+0
NOP	
;String.c,435 :: 		sprintf(txtF,"%3.2f",HUE); //HUE
ADDIU	R3, SP, 80
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_57_String+0)
ORI	R2, R2, lo_addr(?lstr_57_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,437 :: 		strcpy(str,"HUE = || ");
ADDIU	R23, SP, 95
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr58_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr58_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 95
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,438 :: 		strcat(str,txtF);
ADDIU	R3, SP, 80
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,439 :: 		strcat(str," ||\r\n");
ORI	R30, R0, 32
SB	R30, 105(SP)
ORI	R30, R0, 124
SB	R30, 106(SP)
ORI	R30, R0, 124
SB	R30, 107(SP)
ORI	R30, R0, 13
SB	R30, 108(SP)
ORI	R30, R0, 10
SB	R30, 109(SP)
MOVZ	R30, R0, R0
SB	R30, 110(SP)
ADDIU	R3, SP, 105
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,441 :: 		return &str;
ADDIU	R2, SP, 16
;String.c,442 :: 		}
;String.c,441 :: 		return &str;
;String.c,442 :: 		}
L_end_ReadHUE:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 112
JR	RA
NOP	
; end of _ReadHUE
_Get_It:
;String.c,445 :: 		int Get_It(){
;String.c,446 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,447 :: 		}
L_end_Get_It:
JR	RA
NOP	
; end of _Get_It
_Get_Gain:
;String.c,449 :: 		int Get_Gain(){
;String.c,450 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,451 :: 		}
L_end_Get_Gain:
JR	RA
NOP	
; end of _Get_Gain
_Read_Thresholds:
;String.c,456 :: 		char* Read_Thresholds(){
ADDIU	SP, SP, -156
SW	RA, 0(SP)
;String.c,461 :: 		NVMRead(FLASH_Settings_VAddr,&Threshold);
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(_Threshold+0)
ORI	R26, R26, lo_addr(_Threshold+0)
LW	R25, Offset(_FLASH_Settings_VAddr+0)(GP)
JAL	_NVMRead+0
NOP	
;String.c,463 :: 		strcpy(str,"Cth || Rth | Gth | Bth | = || ");
ADDIU	R23, SP, 101
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICS?lstr60_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr60_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 101
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,464 :: 		sprintf(txtR,"%u",Threshold.C_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_61_String+0)
ORI	R2, R2, lo_addr(?lstr_61_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,465 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,466 :: 		strcat(str," || ");
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
;String.c,468 :: 		sprintf(txtR,"%u",Threshold.R_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_63_String+0)
ORI	R2, R2, lo_addr(?lstr_63_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,469 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,470 :: 		strcat(str," | ");
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
;String.c,472 :: 		sprintf(txtR,"%u",Threshold.G_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_65_String+0)
ORI	R2, R2, lo_addr(?lstr_65_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,473 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,474 :: 		strcat(str," | ");
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
;String.c,476 :: 		sprintf(txtR,"%u",Threshold.B_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_67_String+0)
ORI	R2, R2, lo_addr(?lstr_67_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,477 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,478 :: 		strcat(str," | ");
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
;String.c,480 :: 		sprintf(txtR,"%u",Threshold.time_to_log);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+8)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_69_String+0)
ORI	R2, R2, lo_addr(?lstr_69_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,481 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,482 :: 		strcat(str," ||\r\n ");
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
;String.c,484 :: 		return &str;
ADDIU	R2, SP, 37
;String.c,485 :: 		}
;String.c,484 :: 		return &str;
;String.c,485 :: 		}
L_end_Read_Thresholds:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 156
JR	RA
NOP	
; end of _Read_Thresholds
_Write_Thresholds:
;String.c,490 :: 		char* Write_Thresholds(short data_src){
ADDIU	SP, SP, -624
SW	RA, 0(SP)
;String.c,496 :: 		pos =  FLASH_Settings_PAddr;
SW	R26, 4(SP)
LW	R2, Offset(_FLASH_Settings_PAddr+0)(GP)
SW	R2, 524(SP)
;String.c,497 :: 		for(i=1;i<128;i++)
; i start address is: 20 (R5)
ORI	R5, R0, 1
; i end address is: 20 (R5)
SEH	R4, R5
L_Write_Thresholds106:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 128
BNE	R2, R0, L__Write_Thresholds240
NOP	
J	L_Write_Thresholds107
NOP	
L__Write_Thresholds240:
;String.c,498 :: 		val[i] = 0x00000000;
ADDIU	R3, SP, 12
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R0, 0(R2)
;String.c,497 :: 		for(i=1;i<128;i++)
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;String.c,498 :: 		val[i] = 0x00000000;
SEH	R4, R5
; i end address is: 20 (R5)
J	L_Write_Thresholds106
NOP	
L_Write_Thresholds107:
;String.c,501 :: 		if(!data_src)
BEQ	R25, R0, L__Write_Thresholds241
NOP	
J	L_Write_Thresholds109
NOP	
L__Write_Thresholds241:
;String.c,502 :: 		TCS3472_getRawData(RawData);
SB	R25, 8(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 8(SP)
L_Write_Thresholds109:
;String.c,504 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds243
NOP	
J	L_Write_Thresholds110
NOP	
L__Write_Thresholds243:
;String.c,505 :: 		if(string[2] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
BNE	R3, R2, L__Write_Thresholds245
NOP	
J	L_Write_Thresholds111
NOP	
L__Write_Thresholds245:
;String.c,506 :: 		val[0] = atol(string[2]);
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
L_Write_Thresholds111:
;String.c,507 :: 		}
J	L_Write_Thresholds112
NOP	
L_Write_Thresholds110:
;String.c,509 :: 		val[0] = RawData[0];
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+0)(GP)
SW	R2, 0(R3)
L_Write_Thresholds112:
;String.c,510 :: 		err = NVMWriteWord(pos,val[0]);
ADDIU	R2, SP, 12
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,512 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
;String.c,513 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds247
NOP	
J	L_Write_Thresholds113
NOP	
L__Write_Thresholds247:
;String.c,514 :: 		if(string[3] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__Write_Thresholds249
NOP	
J	L_Write_Thresholds114
NOP	
L__Write_Thresholds249:
;String.c,515 :: 		val[1] = atol(string[3]);
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
L_Write_Thresholds114:
;String.c,516 :: 		}else
J	L_Write_Thresholds115
NOP	
L_Write_Thresholds113:
;String.c,517 :: 		val[1] = RawData[1];
ADDIU	R2, SP, 12
ADDIU	R3, R2, 4
LHU	R2, Offset(_RawData+2)(GP)
SW	R2, 0(R3)
L_Write_Thresholds115:
;String.c,518 :: 		err = NVMWriteWord(pos,val[1]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 4
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,520 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
;String.c,521 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds251
NOP	
J	L_Write_Thresholds116
NOP	
L__Write_Thresholds251:
;String.c,522 :: 		if(string[4] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
BNE	R3, R2, L__Write_Thresholds253
NOP	
J	L_Write_Thresholds117
NOP	
L__Write_Thresholds253:
;String.c,523 :: 		val[2] = atol(string[4]);
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
L_Write_Thresholds117:
;String.c,524 :: 		}
J	L_Write_Thresholds118
NOP	
L_Write_Thresholds116:
;String.c,526 :: 		val[2] = RawData[2];
ADDIU	R2, SP, 12
ADDIU	R3, R2, 8
LHU	R2, Offset(_RawData+4)(GP)
SW	R2, 0(R3)
L_Write_Thresholds118:
;String.c,527 :: 		err = NVMWriteWord(pos,val[2]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 8
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,529 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
;String.c,530 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds255
NOP	
J	L_Write_Thresholds119
NOP	
L__Write_Thresholds255:
;String.c,531 :: 		if(string[5] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds257
NOP	
J	L_Write_Thresholds120
NOP	
L__Write_Thresholds257:
;String.c,532 :: 		val[3] = atol(string[5]);
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
L_Write_Thresholds120:
;String.c,533 :: 		}
J	L_Write_Thresholds121
NOP	
L_Write_Thresholds119:
;String.c,535 :: 		val[3] = RawData[3];
ADDIU	R2, SP, 12
ADDIU	R3, R2, 12
LHU	R2, Offset(_RawData+6)(GP)
SW	R2, 0(R3)
L_Write_Thresholds121:
;String.c,536 :: 		err = NVMWriteWord(pos,val[3]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 12
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
SH	R2, 528(SP)
;String.c,538 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
;String.c,539 :: 		if(!data_src){
BEQ	R25, R0, L__Write_Thresholds258
NOP	
J	L_Write_Thresholds122
NOP	
L__Write_Thresholds258:
;String.c,540 :: 		if(string[5] != NULL)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds260
NOP	
J	L_Write_Thresholds123
NOP	
L__Write_Thresholds260:
;String.c,541 :: 		val[4] = atol(string[5]);
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
L_Write_Thresholds123:
;String.c,542 :: 		err = NVMWriteWord(pos,val[4]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 16
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
SH	R2, 528(SP)
;String.c,543 :: 		}
L_Write_Thresholds122:
;String.c,548 :: 		sprintf(txtR,"%x",err);
ADDIU	R3, SP, 530
LH	R2, 528(SP)
SB	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_71_String+0)
ORI	R2, R2, lo_addr(?lstr_71_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,549 :: 		strcpy(str,txtR);
ADDIU	R3, SP, 530
ADDIU	R2, SP, 545
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,550 :: 		strcat(str," \r\n ");
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
;String.c,551 :: 		return str;
ADDIU	R2, SP, 545
;String.c,552 :: 		}
;String.c,551 :: 		return str;
;String.c,552 :: 		}
L_end_Write_Thresholds:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 624
JR	RA
NOP	
; end of _Write_Thresholds
_testStrings:
;String.c,557 :: 		void testStrings(char* writebuff){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;String.c,558 :: 		if(strlen(string[0])!=0){
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings263
NOP	
J	L_testStrings124
NOP	
L__testStrings263:
;String.c,559 :: 		strncat(writebuff,string[0],strlen(string[0]));
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
;String.c,560 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 16(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
ADDIU	R2, SP, 16
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,561 :: 		}
L_testStrings124:
;String.c,562 :: 		if(strlen(string[1])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings265
NOP	
J	L_testStrings125
NOP	
L__testStrings265:
;String.c,563 :: 		strncat(writebuff,string[1],strlen(string[1]));
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
;String.c,564 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 18(SP)
MOVZ	R30, R0, R0
SB	R30, 19(SP)
ADDIU	R2, SP, 18
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,565 :: 		}
L_testStrings125:
;String.c,566 :: 		if(strlen(string[2])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings267
NOP	
J	L_testStrings126
NOP	
L__testStrings267:
;String.c,567 :: 		strncat(writebuff,string[2],strlen(string[2]));
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
;String.c,568 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 20(SP)
MOVZ	R30, R0, R0
SB	R30, 21(SP)
ADDIU	R2, SP, 20
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,569 :: 		}
L_testStrings126:
;String.c,570 :: 		if(strlen(string[3])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings269
NOP	
J	L_testStrings127
NOP	
L__testStrings269:
;String.c,571 :: 		strncat(writebuff,string[3],strlen(string[3]));
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
;String.c,572 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 22(SP)
MOVZ	R30, R0, R0
SB	R30, 23(SP)
ADDIU	R2, SP, 22
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,573 :: 		}
L_testStrings127:
;String.c,574 :: 		if(strlen(string[4])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings271
NOP	
J	L_testStrings128
NOP	
L__testStrings271:
;String.c,575 :: 		strncat(writebuff,string[4],strlen(string[4]));
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
;String.c,576 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 24(SP)
MOVZ	R30, R0, R0
SB	R30, 25(SP)
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,577 :: 		}
L_testStrings128:
;String.c,578 :: 		if(strlen(string[5])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings273
NOP	
J	L_testStrings129
NOP	
L__testStrings273:
;String.c,579 :: 		strncat(writebuff,string[5],strlen(string[5]));
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
;String.c,580 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
ADDIU	R2, SP, 26
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,581 :: 		}
L_testStrings129:
;String.c,582 :: 		if(strlen(string[6])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings275
NOP	
J	L_testStrings130
NOP	
L__testStrings275:
;String.c,583 :: 		strncat(writebuff,string[6],strlen(string[6]));
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
;String.c,584 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 28(SP)
MOVZ	R30, R0, R0
SB	R30, 29(SP)
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,585 :: 		}
L_testStrings130:
;String.c,587 :: 		}
L_end_testStrings:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _testStrings
_TestFlash:
;String.c,589 :: 		char* TestFlash(){
ADDIU	SP, SP, -120
SW	RA, 0(SP)
;String.c,595 :: 		char* tr = "112233";
SW	R25, 4(SP)
SW	R26, 8(SP)
;String.c,603 :: 		Val =  ReadFlashWord();
JAL	_ReadFlashWord+0
NOP	
; Val start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,606 :: 		strcpy(str,"Val || ");
ADDIU	R23, SP, 98
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr81_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr81_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 98
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,607 :: 		LongWordToHex(Val,txtR);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
MOVZ	R25, R6, R0
; Val end address is: 24 (R6)
JAL	_LongWordToHex+0
NOP	
;String.c,609 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,610 :: 		strcat(str," || ");
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
;String.c,612 :: 		sprintf(txtR,"%u",res);//Threshold.R_thresh);
ADDIU	R3, SP, 12
LHU	R2, 96(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_83_String+0)
ORI	R2, R2, lo_addr(?lstr_83_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,613 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,614 :: 		strcat(str," ||\r\n ");
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
;String.c,616 :: 		return &str;
ADDIU	R2, SP, 32
;String.c,617 :: 		}
;String.c,616 :: 		return &str;
;String.c,617 :: 		}
L_end_TestFlash:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 120
JR	RA
NOP	
; end of _TestFlash
_PrintHandler:
;String.c,624 :: 		void PrintHandler(char c){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;String.c,626 :: 		UART1_Write(c);
ANDI	R25, R25, 255
JAL	_UART1_Write+0
NOP	
;String.c,628 :: 		}
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
