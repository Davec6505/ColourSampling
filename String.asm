_InitString:
;String.c,34 :: 		PString InitString(char cmp){
ADDIU	SP, SP, -1292
; su_addr start address is: 8 (R2)
MOVZ	R2, R30, R0
; su_addr end address is: 8 (R2)
;String.c,38 :: 		}
L_end_InitString:
ADDIU	SP, SP, 1292
JR	RA
NOP	
; end of _InitString
_DoStrings:
;String.c,43 :: 		int DoStrings(int num){
ADDIU	SP, SP, -116
SW	RA, 0(SP)
;String.c,45 :: 		char *result,conf[64] = "";
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 49
ADDIU	R22, R23, 64
LUI	R24, hi_addr(?ICSDoStrings_conf_L0+0)
ORI	R24, R24, lo_addr(?ICSDoStrings_conf_L0+0)
JAL	___CC2DW+0
NOP	
;String.c,52 :: 		clr_str_arrays(string);     //clear the strings in the array
SH	R25, 16(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_clr_str_arrays+0
NOP	
LH	R25, 16(SP)
;String.c,53 :: 		memcpy(conf,readbuff,num);  //copy the USB buffer to a temp arrar
ADDIU	R2, SP, 49
SEH	R27, R25
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;String.c,54 :: 		result = setstr(conf);       //look for '\r' '\n' and move result to a string
ADDIU	R2, SP, 49
MOVZ	R25, R2, R0
JAL	_setstr+0
NOP	
;String.c,55 :: 		res0 = strsplit(result,'+'); //split the string into an array of strings return num of arr's
ORI	R26, R0, 43
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;String.c,56 :: 		if(res0 > 0)
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__DoStrings133
NOP	
J	L_DoStrings0
NOP	
L__DoStrings133:
;String.c,57 :: 		res1 = StrChecker(string[1]);//Test current string index for equality return index
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
;String.c,59 :: 		res1 = enum_num + 1;
; res1 start address is: 20 (R5)
ORI	R5, R0, 18
; res1 end address is: 20 (R5)
L_DoStrings1:
;String.c,60 :: 		memset(writebuff,0,64);     //empty usb write buffer
; res1 start address is: 20 (R5)
ORI	R27, R0, 64
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memset+0
NOP	
;String.c,70 :: 		switch(res1){
J	L_DoStrings2
NOP	
; res1 end address is: 20 (R5)
;String.c,71 :: 		case CONFIG :
L_DoStrings4:
;String.c,72 :: 		if(!strcmp(string[2],comc[0])){
LW	R26, Offset(_comc+0)(GP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strcmp+0
NOP	
BEQ	R2, R0, L__DoStrings134
NOP	
J	L_DoStrings5
NOP	
L__DoStrings134:
;String.c,73 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings136
NOP	
J	L_DoStrings6
NOP	
L__DoStrings136:
;String.c,74 :: 		Int_Time = atoi(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
SH	R2, 24(SP)
;String.c,75 :: 		for(i=0;i<Int_Time;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_DoStrings7:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
LH	R2, 24(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__DoStrings137
NOP	
J	L_DoStrings8
NOP	
L__DoStrings137:
;String.c,76 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,77 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_DoStrings10:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings10
NOP	
;String.c,75 :: 		for(i=0;i<Int_Time;i++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;String.c,78 :: 		}
; i end address is: 16 (R4)
J	L_DoStrings7
NOP	
L_DoStrings8:
;String.c,79 :: 		}
L_DoStrings6:
;String.c,80 :: 		err = TCS3472_SetIntergration_Time(Int_Time);
SH	R25, 16(SP)
LH	R25, 24(SP)
JAL	_TCS3472_SetIntergration_Time+0
NOP	
LH	R25, 16(SP)
; err start address is: 16 (R4)
ANDI	R4, R2, 255
;String.c,81 :: 		if(err > 0)
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DoStrings138
NOP	
J	L_DoStrings12
NOP	
L__DoStrings138:
;String.c,82 :: 		for(i=0;i<err;i++){
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
BNE	R2, R0, L__DoStrings139
NOP	
J	L_DoStrings14
NOP	
L__DoStrings139:
;String.c,83 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,84 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_DoStrings16:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings16
NOP	
NOP	
NOP	
;String.c,82 :: 		for(i=0;i<err;i++){
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;String.c,85 :: 		}
; err end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_DoStrings13
NOP	
L_DoStrings14:
L_DoStrings12:
;String.c,86 :: 		}else if(!strcmp(string[2],comc[1])){
J	L_DoStrings18
NOP	
L_DoStrings5:
LW	R26, Offset(_comc+4)(GP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strcmp+0
NOP	
BEQ	R2, R0, L__DoStrings140
NOP	
J	L_DoStrings19
NOP	
L__DoStrings140:
;String.c,87 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings142
NOP	
J	L_DoStrings20
NOP	
L__DoStrings142:
;String.c,88 :: 		Gain = atoi(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
SH	R2, 26(SP)
;String.c,89 :: 		for(i=0;i<Gain;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_DoStrings21:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
LH	R2, 26(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__DoStrings143
NOP	
J	L_DoStrings22
NOP	
L__DoStrings143:
;String.c,90 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,91 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_DoStrings24:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings24
NOP	
;String.c,89 :: 		for(i=0;i<Gain;i++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;String.c,92 :: 		}
; i end address is: 16 (R4)
J	L_DoStrings21
NOP	
L_DoStrings22:
;String.c,93 :: 		}
L_DoStrings20:
;String.c,94 :: 		err = TCS3472_SetGain(Gain);
SH	R25, 16(SP)
LH	R25, 26(SP)
JAL	_TCS3472_SetGain+0
NOP	
LH	R25, 16(SP)
; err start address is: 16 (R4)
ANDI	R4, R2, 255
;String.c,95 :: 		if(err > 0)
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DoStrings144
NOP	
J	L_DoStrings26
NOP	
L__DoStrings144:
;String.c,96 :: 		for(i=0;i<err;i++){
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
BNE	R2, R0, L__DoStrings145
NOP	
J	L_DoStrings28
NOP	
L__DoStrings145:
;String.c,97 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,98 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_DoStrings30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings30
NOP	
NOP	
NOP	
;String.c,96 :: 		for(i=0;i<err;i++){
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;String.c,99 :: 		}
; err end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_DoStrings27
NOP	
L_DoStrings28:
L_DoStrings26:
;String.c,100 :: 		}
L_DoStrings19:
L_DoStrings18:
;String.c,101 :: 		LATE3_bit = 0;
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
;String.c,102 :: 		break;
J	L_DoStrings3
NOP	
;String.c,103 :: 		case SENDA :
L_DoStrings32:
;String.c,104 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;String.c,105 :: 		break;
J	L_DoStrings3
NOP	
;String.c,106 :: 		case READA :
L_DoStrings33:
;String.c,107 :: 		str = Read_Send_AllColour(0);
MOVZ	R25, R0, R0
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, 20(SP)
;String.c,108 :: 		break;
J	L_DoStrings3
NOP	
;String.c,109 :: 		case READR :
L_DoStrings34:
;String.c,110 :: 		str = Read_Send_OneColour(READR);
ORI	R25, R0, 7
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,111 :: 		break;
J	L_DoStrings3
NOP	
;String.c,112 :: 		case READG :
L_DoStrings35:
;String.c,113 :: 		str = Read_Send_OneColour(READG);
ORI	R25, R0, 8
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,114 :: 		break;
J	L_DoStrings3
NOP	
;String.c,115 :: 		case READB :
L_DoStrings36:
;String.c,116 :: 		str = Read_Send_OneColour(READB);
ORI	R25, R0, 9
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,117 :: 		break;
J	L_DoStrings3
NOP	
;String.c,118 :: 		case READC :
L_DoStrings37:
;String.c,119 :: 		str = Read_Send_OneColour(READC);
ORI	R25, R0, 10
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,120 :: 		break;
J	L_DoStrings3
NOP	
;String.c,121 :: 		case READT :
L_DoStrings38:
;String.c,122 :: 		str = Read_Send_OneColour(READT);
ORI	R25, R0, 11
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,123 :: 		break;
J	L_DoStrings3
NOP	
;String.c,124 :: 		case READT_DN40 :
L_DoStrings39:
;String.c,125 :: 		str = Read_Send_OneColour(READT_DN40);
ORI	R25, R0, 12
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,126 :: 		break;
J	L_DoStrings3
NOP	
;String.c,127 :: 		case READA_SCL :
L_DoStrings40:
;String.c,128 :: 		str = Read_Send_AllColour(1);
ORI	R25, R0, 1
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, 20(SP)
;String.c,129 :: 		break;
J	L_DoStrings3
NOP	
;String.c,130 :: 		case READA_THV :
L_DoStrings41:
;String.c,131 :: 		str =  Read_Thresholds(); //TestFlash();//
JAL	_Read_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,132 :: 		break;
J	L_DoStrings3
NOP	
;String.c,133 :: 		case WRITE_MAN :
L_DoStrings42:
;String.c,134 :: 		str = Write_Thresholds(1);
ORI	R25, R0, 1
JAL	_Write_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,135 :: 		break;
J	L_DoStrings3
NOP	
;String.c,136 :: 		case WRITE_RAW :
L_DoStrings43:
;String.c,137 :: 		str = Write_Thresholds(0);
MOVZ	R25, R0, R0
JAL	_Write_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,138 :: 		break;
J	L_DoStrings3
NOP	
;String.c,139 :: 		default:
L_DoStrings44:
;String.c,140 :: 		str = "No data requested!\r\n";
ADDIU	R23, SP, 28
ADDIU	R22, R23, 21
LUI	R24, hi_addr(?ICS?lstr20_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr20_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 28
SW	R2, 20(SP)
;String.c,141 :: 		break;
J	L_DoStrings3
NOP	
;String.c,142 :: 		}
L_DoStrings2:
; res1 start address is: 20 (R5)
SEH	R2, R5
BNE	R2, R0, L__DoStrings147
NOP	
J	L_DoStrings4
NOP	
L__DoStrings147:
SEH	R3, R5
ORI	R2, R0, 5
BNE	R3, R2, L__DoStrings149
NOP	
J	L_DoStrings32
NOP	
L__DoStrings149:
SEH	R3, R5
ORI	R2, R0, 6
BNE	R3, R2, L__DoStrings151
NOP	
J	L_DoStrings33
NOP	
L__DoStrings151:
SEH	R3, R5
ORI	R2, R0, 7
BNE	R3, R2, L__DoStrings153
NOP	
J	L_DoStrings34
NOP	
L__DoStrings153:
SEH	R3, R5
ORI	R2, R0, 8
BNE	R3, R2, L__DoStrings155
NOP	
J	L_DoStrings35
NOP	
L__DoStrings155:
SEH	R3, R5
ORI	R2, R0, 9
BNE	R3, R2, L__DoStrings157
NOP	
J	L_DoStrings36
NOP	
L__DoStrings157:
SEH	R3, R5
ORI	R2, R0, 10
BNE	R3, R2, L__DoStrings159
NOP	
J	L_DoStrings37
NOP	
L__DoStrings159:
SEH	R3, R5
ORI	R2, R0, 11
BNE	R3, R2, L__DoStrings161
NOP	
J	L_DoStrings38
NOP	
L__DoStrings161:
SEH	R3, R5
ORI	R2, R0, 12
BNE	R3, R2, L__DoStrings163
NOP	
J	L_DoStrings39
NOP	
L__DoStrings163:
SEH	R3, R5
ORI	R2, R0, 13
BNE	R3, R2, L__DoStrings165
NOP	
J	L_DoStrings40
NOP	
L__DoStrings165:
SEH	R3, R5
ORI	R2, R0, 14
BNE	R3, R2, L__DoStrings167
NOP	
J	L_DoStrings41
NOP	
L__DoStrings167:
SEH	R3, R5
ORI	R2, R0, 15
BNE	R3, R2, L__DoStrings169
NOP	
J	L_DoStrings42
NOP	
L__DoStrings169:
SEH	R3, R5
; res1 end address is: 20 (R5)
ORI	R2, R0, 16
BNE	R3, R2, L__DoStrings171
NOP	
J	L_DoStrings43
NOP	
L__DoStrings171:
J	L_DoStrings44
NOP	
L_DoStrings3:
;String.c,146 :: 		strncat(writebuff,str,strlen(str));
LW	R25, 20(SP)
JAL	_strlen+0
NOP	
SEH	R27, R2
LW	R26, 20(SP)
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncat+0
NOP	
;String.c,147 :: 		while(!HID_Write(&writebuff,64));
L_DoStrings45:
SH	R25, 16(SP)
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
LH	R25, 16(SP)
BEQ	R2, R0, L__DoStrings172
NOP	
J	L_DoStrings46
NOP	
L__DoStrings172:
J	L_DoStrings45
NOP	
L_DoStrings46:
;String.c,151 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,152 :: 		}
;String.c,151 :: 		return 0;
;String.c,152 :: 		}
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
;String.c,157 :: 		void clr_str_arrays(char str[20][64]){
;String.c,159 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_clr_str_arrays47:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__clr_str_arrays174
NOP	
J	L_clr_str_arrays48
NOP	
L__clr_str_arrays174:
;String.c,160 :: 		for(j = 0;j<64;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_clr_str_arrays50:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 64
BNE	R2, R0, L__clr_str_arrays175
NOP	
J	L_clr_str_arrays51
NOP	
L__clr_str_arrays175:
;String.c,161 :: 		str[i][j] = 0;
SEH	R2, R4
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R5
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,160 :: 		for(j = 0;j<64;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,162 :: 		}
; j end address is: 20 (R5)
J	L_clr_str_arrays50
NOP	
L_clr_str_arrays51:
;String.c,159 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,164 :: 		}
; i end address is: 16 (R4)
J	L_clr_str_arrays47
NOP	
L_clr_str_arrays48:
;String.c,165 :: 		}
L_end_clr_str_arrays:
JR	RA
NOP	
; end of _clr_str_arrays
_setstr:
;String.c,170 :: 		char* setstr(char conf[250]){
;String.c,172 :: 		for(i=0;i < 100;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_setstr53:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 100
BNE	R2, R0, L__setstr177
NOP	
J	L_setstr54
NOP	
L__setstr177:
;String.c,173 :: 		if((conf[i] == 0x0D)|| (conf[i] == 0x0A))
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L__setstr179
NOP	
J	L__setstr127
NOP	
L__setstr179:
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L__setstr181
NOP	
J	L__setstr126
NOP	
L__setstr181:
J	L_setstr58
NOP	
L__setstr127:
L__setstr126:
;String.c,174 :: 		break;
J	L_setstr54
NOP	
L_setstr58:
;String.c,172 :: 		for(i=0;i < 100;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,175 :: 		}
J	L_setstr53
NOP	
L_setstr54:
;String.c,176 :: 		conf[i+1] = 0;
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
SEH	R2, R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;String.c,178 :: 		return conf;
MOVZ	R2, R25, R0
;String.c,179 :: 		}
L_end_setstr:
JR	RA
NOP	
; end of _setstr
_remove_whitespaces:
;String.c,184 :: 		void remove_whitespaces(char* src){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;String.c,185 :: 		char* dst = src;
; dst start address is: 20 (R5)
MOVZ	R5, R25, R0
;String.c,188 :: 		for(i=0,j=0;i<strlen(dst);i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; j start address is: 28 (R7)
MOVZ	R7, R0, R0
; dst end address is: 20 (R5)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
L_remove_whitespaces59:
; j start address is: 28 (R7)
; i start address is: 24 (R6)
; dst start address is: 20 (R5)
SW	R25, 4(SP)
MOVZ	R25, R5, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
SEH	R3, R6
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__remove_whitespaces183
NOP	
J	L_remove_whitespaces60
NOP	
L__remove_whitespaces183:
;String.c,189 :: 		if(dst[j] == 0x32){
SEH	R2, R7
ADDU	R2, R5, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 50
BEQ	R3, R2, L__remove_whitespaces184
NOP	
J	L_remove_whitespaces62
NOP	
L__remove_whitespaces184:
;String.c,190 :: 		j++;
ADDIU	R2, R7, 1
SEH	R7, R2
;String.c,191 :: 		continue;
J	L_remove_whitespaces61
NOP	
;String.c,192 :: 		}
L_remove_whitespaces62:
;String.c,193 :: 		src[i] = dst[j];
SEH	R2, R6
ADDU	R3, R25, R2
SEH	R2, R7
ADDU	R2, R5, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
; j end address is: 28 (R7)
;String.c,194 :: 		};
L_remove_whitespaces61:
;String.c,188 :: 		for(i=0,j=0;i<strlen(dst);i++){
; j start address is: 28 (R7)
ADDIU	R2, R6, 1
SEH	R6, R2
;String.c,194 :: 		};
; dst end address is: 20 (R5)
; j end address is: 28 (R7)
J	L_remove_whitespaces59
NOP	
L_remove_whitespaces60:
;String.c,195 :: 		src[i] = 0;
SEH	R2, R6
; i end address is: 24 (R6)
ADDU	R2, R25, R2
SB	R0, 0(R2)
;String.c,196 :: 		UART1_Write_Text("White Space:= ");
ADDIU	R23, SP, 8
ADDIU	R22, R23, 15
LUI	R24, hi_addr(?ICS?lstr21_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr21_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
SW	R25, 4(SP)
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
LW	R25, 4(SP)
;String.c,197 :: 		UART1_Write_Text(src);
JAL	_UART1_Write_Text+0
NOP	
;String.c,198 :: 		UART1_Write(0x0D);
SW	R25, 4(SP)
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;String.c,199 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
LW	R25, 4(SP)
;String.c,200 :: 		}
L_end_remove_whitespaces:
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _remove_whitespaces
_strsplit:
;String.c,205 :: 		int strsplit(char str[250], char c){
;String.c,207 :: 		ii=kk=0;
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,208 :: 		for (i = 0; i < 250;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 24 (R6)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
L_strsplit63:
; i start address is: 16 (R4)
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
SEH	R2, R4
SLTI	R2, R2, 250
BNE	R2, R0, L__strsplit186
NOP	
J	L_strsplit64
NOP	
L__strsplit186:
;String.c,209 :: 		if(str[i] == c){
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R26, 255
BEQ	R3, R2, L__strsplit187
NOP	
J	L_strsplit66
NOP	
L__strsplit187:
;String.c,210 :: 		string[kk][ii] = 0;
SEH	R2, R5
SLL	R3, R2, 6
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
ADDU	R3, R2, R3
SEH	R2, R6
; ii end address is: 24 (R6)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,211 :: 		kk++;
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,212 :: 		ii=0;
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,213 :: 		continue;//goto endb;
J	L_strsplit65
NOP	
;String.c,214 :: 		}else{
L_strsplit66:
;String.c,215 :: 		string[kk][ii] = str[i];
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
;String.c,216 :: 		ii++;
ADDIU	R2, R6, 1
; ii end address is: 24 (R6)
; ii start address is: 12 (R3)
SEH	R3, R2
;String.c,219 :: 		if(str[i]==0)
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit188
NOP	
J	L_strsplit68
NOP	
L__strsplit188:
; ii end address is: 12 (R3)
; i end address is: 16 (R4)
;String.c,220 :: 		break;
J	L_strsplit64
NOP	
L_strsplit68:
;String.c,221 :: 		}
; i start address is: 16 (R4)
; ii start address is: 12 (R3)
; kk end address is: 20 (R5)
SEH	R6, R3
L_strsplit65:
; ii end address is: 12 (R3)
;String.c,208 :: 		for (i = 0; i < 250;i++){
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,221 :: 		}
; ii end address is: 24 (R6)
; i end address is: 16 (R4)
J	L_strsplit63
NOP	
L_strsplit64:
;String.c,222 :: 		return kk;
SEH	R2, R5
; kk end address is: 20 (R5)
;String.c,223 :: 		}
L_end_strsplit:
JR	RA
NOP	
; end of _strsplit
_findnumber:
;String.c,228 :: 		char* findnumber(char* str){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;String.c,232 :: 		temp = (char*)Malloc(strlen(str));
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
;String.c,234 :: 		for(i = 0;i < strlen(str);i++){
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
BNE	R2, R0, L__findnumber190
NOP	
J	L_findnumber70
NOP	
L__findnumber190:
;String.c,235 :: 		if((str[i] > 0x29)&& (str[i] < 0x40)){
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 42
BEQ	R2, R0, L__findnumber191
NOP	
J	L__findnumber130
NOP	
L__findnumber191:
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 64
BNE	R2, R0, L__findnumber192
NOP	
J	L__findnumber129
NOP	
L__findnumber192:
L__findnumber128:
;String.c,236 :: 		temp[i] = str[i];
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,235 :: 		if((str[i] > 0x29)&& (str[i] < 0x40)){
L__findnumber130:
L__findnumber129:
;String.c,234 :: 		for(i = 0;i < strlen(str);i++){
ADDIU	R2, R9, 1
SEH	R9, R2
;String.c,238 :: 		}
J	L_findnumber69
NOP	
L_findnumber70:
;String.c,239 :: 		temp[i] = 0;
SEH	R2, R9
; i end address is: 36 (R9)
ADDU	R2, R8, R2
SB	R0, 0(R2)
;String.c,240 :: 		Free(temp,sizeof(temp));
SW	R25, 8(SP)
ORI	R26, R0, 4
MOVZ	R25, R8, R0
JAL	_Free+0
NOP	
LW	R25, 8(SP)
;String.c,241 :: 		return temp;
MOVZ	R2, R8, R0
; temp end address is: 32 (R8)
;String.c,242 :: 		}
;String.c,241 :: 		return temp;
;String.c,242 :: 		}
L_end_findnumber:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _findnumber
_StrChecker:
;String.c,248 :: 		int StrChecker(char *str){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,252 :: 		if(!once){
SW	R26, 4(SP)
SW	R27, 8(SP)
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
EXT	R2, R2, BitPos(StrChecker_once_L0+0), 1
BEQ	R2, R0, L__StrChecker194
NOP	
J	L_StrChecker75
NOP	
L__StrChecker194:
;String.c,253 :: 		once = 1;
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
ORI	R2, R2, BitMask(StrChecker_once_L0+0)
SB	R2, Offset(StrChecker_once_L0+0)(GP)
;String.c,254 :: 		enum_val = enum_num;
ORI	R2, R0, 17
SH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
;String.c,255 :: 		}
L_StrChecker75:
;String.c,256 :: 		for(i = 0;i < enum_val;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_StrChecker76:
; i start address is: 20 (R5)
SEH	R3, R5
LH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__StrChecker195
NOP	
J	L_StrChecker77
NOP	
L__StrChecker195:
;String.c,257 :: 		if(strncmp(str,com[i],strlen(str)-1)==0)
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
BEQ	R2, R0, L__StrChecker196
NOP	
J	L_StrChecker79
NOP	
L__StrChecker196:
;String.c,258 :: 		break;
J	L_StrChecker77
NOP	
L_StrChecker79:
;String.c,256 :: 		for(i = 0;i < enum_val;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,259 :: 		}
J	L_StrChecker76
NOP	
L_StrChecker77:
;String.c,260 :: 		return i;
SEH	R2, R5
; i end address is: 20 (R5)
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
_WriteData:
;String.c,266 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;String.c,269 :: 		memset(writebuff,0,64);
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
;String.c,270 :: 		strncpy(writebuff,_data,strlen(_data));
JAL	_strlen+0
NOP	
SEH	R27, R2
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncpy+0
NOP	
;String.c,271 :: 		HID_Write(&writebuff,64);
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
;String.c,272 :: 		}
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
;String.c,277 :: 		char* Read_Send_AllColour(short data_src){
ADDIU	SP, SP, -156
SW	RA, 0(SP)
;String.c,285 :: 		TCS3472_getRawData(RawData);
SW	R25, 4(SP)
SW	R26, 8(SP)
SB	R25, 12(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 12(SP)
;String.c,286 :: 		if(data_src)
BNE	R25, R0, L__Read_Send_AllColour200
NOP	
J	L_Read_Send_AllColour80
NOP	
L__Read_Send_AllColour200:
;String.c,287 :: 		GetScaledValues(RawData,&FltData);
ADDIU	R2, SP, 16
SB	R25, 12(SP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_GetScaledValues+0
NOP	
LB	R25, 12(SP)
L_Read_Send_AllColour80:
;String.c,289 :: 		strcpy(str,"C || R | G | B | = || ");
ADDIU	R23, SP, 107
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr22_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr22_String+0)
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
;String.c,290 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour201
NOP	
J	L_Read_Send_AllColour81
NOP	
L__Read_Send_AllColour201:
;String.c,291 :: 		sprintf(txtR,"%u",RawData[0]); //C
ADDIU	R3, SP, 28
LHU	R2, Offset(_RawData+0)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_23_String+0)
ORI	R2, R2, lo_addr(?lstr_23_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
J	L_Read_Send_AllColour82
NOP	
L_Read_Send_AllColour81:
;String.c,293 :: 		sprintf(txtR,"%3.2f",FltData[0]); //R
ADDIU	R2, SP, 16
LW	R2, 0(R2)
ADDIU	R3, SP, 28
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_24_String+0)
ORI	R2, R2, lo_addr(?lstr_24_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
L_Read_Send_AllColour82:
;String.c,294 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,295 :: 		strcat(str," || ");
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
;String.c,297 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour202
NOP	
J	L_Read_Send_AllColour83
NOP	
L__Read_Send_AllColour202:
;String.c,298 :: 		sprintf(txtR,"%u",RawData[1]);  //R
ADDIU	R3, SP, 28
LHU	R2, Offset(_RawData+2)(GP)
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
J	L_Read_Send_AllColour84
NOP	
L_Read_Send_AllColour83:
;String.c,300 :: 		sprintf(txtR,"%3.2f",FltData[1]); //G
ADDIU	R2, SP, 16
ADDIU	R2, R2, 4
LW	R2, 0(R2)
ADDIU	R3, SP, 28
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
L_Read_Send_AllColour84:
;String.c,301 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,302 :: 		strcat(str," | ");
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
;String.c,304 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour203
NOP	
J	L_Read_Send_AllColour85
NOP	
L__Read_Send_AllColour203:
;String.c,305 :: 		sprintf(txtR,"%u",RawData[2]);  //G
ADDIU	R3, SP, 28
LHU	R2, Offset(_RawData+4)(GP)
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
J	L_Read_Send_AllColour86
NOP	
L_Read_Send_AllColour85:
;String.c,307 :: 		sprintf(txtR,"%3.2f",FltData[2]);  //B
ADDIU	R2, SP, 16
ADDIU	R2, R2, 8
LW	R2, 0(R2)
ADDIU	R3, SP, 28
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
L_Read_Send_AllColour86:
;String.c,308 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,309 :: 		strcat(str," | ");
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
;String.c,311 :: 		if(!data_src ) {
BEQ	R25, R0, L__Read_Send_AllColour204
NOP	
J	L_Read_Send_AllColour87
NOP	
L__Read_Send_AllColour204:
;String.c,312 :: 		sprintf(txtR,"%u",RawData[3]);  //ERR
ADDIU	R3, SP, 28
LHU	R2, Offset(_RawData+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_32_String+0)
ORI	R2, R2, lo_addr(?lstr_32_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,313 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,314 :: 		strcat(str," || ");
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
;String.c,316 :: 		err = TCS3472_C2RGB_Error(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_C2RGB_Error+0
NOP	
;String.c,317 :: 		sprintf(txtR,"%5d",err);
ADDIU	R3, SP, 28
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_34_String+0)
ORI	R2, R2, lo_addr(?lstr_34_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,318 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,319 :: 		}
L_Read_Send_AllColour87:
;String.c,320 :: 		strcat(str," ||\r\n");
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
;String.c,322 :: 		return &str;
ADDIU	R2, SP, 43
;String.c,323 :: 		}
;String.c,322 :: 		return &str;
;String.c,323 :: 		}
L_end_Read_Send_AllColour:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 156
JR	RA
NOP	
; end of _Read_Send_AllColour
_Read_Send_OneColour:
;String.c,328 :: 		char* Read_Send_OneColour(int colr){
ADDIU	SP, SP, -180
SW	RA, 0(SP)
;String.c,332 :: 		switch(colr){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Read_Send_OneColour88
NOP	
;String.c,333 :: 		case READR:
L_Read_Send_OneColour90:
;String.c,334 :: 		col = TCS3472_Read16(TCS3472_RDATAL);
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,335 :: 		strcpy(str,"R = || ");
ADDIU	R23, SP, 90
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr36_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr36_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 90
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,336 :: 		sprintf(txtR,"%5u",col);
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
;String.c,337 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,338 :: 		strcat(str," ||\r\n");
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
;String.c,339 :: 		break;
J	L_Read_Send_OneColour89
NOP	
;String.c,340 :: 		case READG:
L_Read_Send_OneColour91:
;String.c,341 :: 		col = TCS3472_Read16(TCS3472_GDATAL);
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,342 :: 		strcpy(str,"G = || ");
ADDIU	R23, SP, 104
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr39_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr39_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 104
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,343 :: 		sprintf(txtR,"%5u",col);
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
;String.c,344 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,345 :: 		strcat(str," ||\r\n");
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
;String.c,346 :: 		break;
J	L_Read_Send_OneColour89
NOP	
;String.c,347 :: 		case READB:
L_Read_Send_OneColour92:
;String.c,348 :: 		col = TCS3472_Read16(TCS3472_BDATAL);
ORI	R25, R0, 26
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,349 :: 		strcpy(str,"B = || ");
ADDIU	R23, SP, 118
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr42_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr42_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 118
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,350 :: 		sprintf(txtR,"%u",col);
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
;String.c,351 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,352 :: 		strcat(str," ||\r\n");
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
;String.c,353 :: 		break;
J	L_Read_Send_OneColour89
NOP	
;String.c,354 :: 		case READC:
L_Read_Send_OneColour93:
;String.c,355 :: 		col = TCS3472_Read16(TCS3472_CDATAL);
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,356 :: 		strcpy(str,"C = || ");
ADDIU	R23, SP, 132
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr45_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr45_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 132
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,357 :: 		sprintf(txtR,"%u",col);
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
;String.c,358 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,359 :: 		strcat(str," ||\r\n");
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
;String.c,360 :: 		break;
J	L_Read_Send_OneColour89
NOP	
;String.c,361 :: 		case READT:
L_Read_Send_OneColour94:
;String.c,362 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,363 :: 		col = TCS3472_CalcColTemp(RawData[1],RawData[3],RawData[3]);
LHU	R27, Offset(_RawData+6)(GP)
LHU	R26, Offset(_RawData+6)(GP)
LHU	R25, Offset(_RawData+2)(GP)
JAL	_TCS3472_CalcColTemp+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,364 :: 		strcpy(str,"T = || ");
ADDIU	R23, SP, 146
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr48_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr48_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 146
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,365 :: 		sprintf(txtR,"%u",col);
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
;String.c,366 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,367 :: 		strcat(str," ||\r\n");
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
;String.c,368 :: 		break;
J	L_Read_Send_OneColour89
NOP	
;String.c,369 :: 		case READT_DN40:
L_Read_Send_OneColour95:
;String.c,370 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,371 :: 		col = TCS3472_CalcColTemp_dn40(RawData,it);
LBU	R26, Offset(_it+0)(GP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_CalcColTemp_dn40+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,372 :: 		strcpy(str,"T_DN40 = || ");
ADDIU	R23, SP, 160
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr51_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr51_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 160
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,373 :: 		sprintf(txtR,"%u",col);
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
;String.c,374 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,375 :: 		strcat(str," ||\r\n");
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
;String.c,376 :: 		break;
J	L_Read_Send_OneColour89
NOP	
;String.c,377 :: 		}
L_Read_Send_OneColour88:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Read_Send_OneColour207
NOP	
J	L_Read_Send_OneColour90
NOP	
L__Read_Send_OneColour207:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Read_Send_OneColour209
NOP	
J	L_Read_Send_OneColour91
NOP	
L__Read_Send_OneColour209:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Read_Send_OneColour211
NOP	
J	L_Read_Send_OneColour92
NOP	
L__Read_Send_OneColour211:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Read_Send_OneColour213
NOP	
J	L_Read_Send_OneColour93
NOP	
L__Read_Send_OneColour213:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Read_Send_OneColour215
NOP	
J	L_Read_Send_OneColour94
NOP	
L__Read_Send_OneColour215:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Read_Send_OneColour217
NOP	
J	L_Read_Send_OneColour95
NOP	
L__Read_Send_OneColour217:
L_Read_Send_OneColour89:
;String.c,378 :: 		return &str;
ADDIU	R2, SP, 26
;String.c,379 :: 		}
;String.c,378 :: 		return &str;
;String.c,379 :: 		}
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
;String.c,381 :: 		int Get_It(){
;String.c,382 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,383 :: 		}
L_end_Get_It:
JR	RA
NOP	
; end of _Get_It
_Get_Gain:
;String.c,385 :: 		int Get_Gain(){
;String.c,386 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,387 :: 		}
L_end_Get_Gain:
JR	RA
NOP	
; end of _Get_Gain
_Read_Thresholds:
;String.c,392 :: 		char* Read_Thresholds(){
ADDIU	SP, SP, -144
SW	RA, 0(SP)
;String.c,397 :: 		NVMRead(FLASH_Settings_VAddr,&Threshold);
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(_Threshold+0)
ORI	R26, R26, lo_addr(_Threshold+0)
LW	R25, Offset(_FLASH_Settings_VAddr+0)(GP)
JAL	_NVMRead+0
NOP	
;String.c,399 :: 		strcpy(str,"Cth || Rth | Gth | Bth | = || ");
ADDIU	R23, SP, 91
ADDIU	R22, R23, 31
LUI	R24, hi_addr(?ICS?lstr54_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr54_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 91
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,400 :: 		sprintf(txtR,"%u",Threshold.C_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_55_String+0)
ORI	R2, R2, lo_addr(?lstr_55_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,401 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,402 :: 		strcat(str," || ");
ORI	R30, R0, 32
SB	R30, 122(SP)
ORI	R30, R0, 124
SB	R30, 123(SP)
ORI	R30, R0, 124
SB	R30, 124(SP)
ORI	R30, R0, 32
SB	R30, 125(SP)
MOVZ	R30, R0, R0
SB	R30, 126(SP)
ADDIU	R3, SP, 122
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,404 :: 		sprintf(txtR,"%u",Threshold.R_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_57_String+0)
ORI	R2, R2, lo_addr(?lstr_57_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,405 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,406 :: 		strcat(str," | ");
ORI	R30, R0, 32
SB	R30, 127(SP)
ORI	R30, R0, 124
SB	R30, 128(SP)
ORI	R30, R0, 32
SB	R30, 129(SP)
MOVZ	R30, R0, R0
SB	R30, 130(SP)
ADDIU	R3, SP, 127
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,408 :: 		sprintf(txtR,"%u",Threshold.G_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_59_String+0)
ORI	R2, R2, lo_addr(?lstr_59_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,409 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,410 :: 		strcat(str," | ");
ORI	R30, R0, 32
SB	R30, 131(SP)
ORI	R30, R0, 124
SB	R30, 132(SP)
ORI	R30, R0, 32
SB	R30, 133(SP)
MOVZ	R30, R0, R0
SB	R30, 134(SP)
ADDIU	R3, SP, 131
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,412 :: 		sprintf(txtR,"%u",Threshold.B_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_61_String+0)
ORI	R2, R2, lo_addr(?lstr_61_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,413 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,414 :: 		strcat(str," ||\r\n ");
ORI	R30, R0, 32
SB	R30, 135(SP)
ORI	R30, R0, 124
SB	R30, 136(SP)
ORI	R30, R0, 124
SB	R30, 137(SP)
ORI	R30, R0, 13
SB	R30, 138(SP)
ORI	R30, R0, 10
SB	R30, 139(SP)
ORI	R30, R0, 32
SB	R30, 140(SP)
MOVZ	R30, R0, R0
SB	R30, 141(SP)
ADDIU	R3, SP, 135
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,416 :: 		return &str;
ADDIU	R2, SP, 27
;String.c,417 :: 		}
;String.c,416 :: 		return &str;
;String.c,417 :: 		}
L_end_Read_Thresholds:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 144
JR	RA
NOP	
; end of _Read_Thresholds
_Write_Thresholds:
;String.c,422 :: 		char* Write_Thresholds(short data_src){
ADDIU	SP, SP, -620
SW	RA, 0(SP)
;String.c,428 :: 		pos =  FLASH_Settings_PAddr;
SW	R26, 4(SP)
; pos start address is: 16 (R4)
LW	R4, Offset(_FLASH_Settings_PAddr+0)(GP)
;String.c,429 :: 		for(i=1;i<128;i++)
; i start address is: 20 (R5)
ORI	R5, R0, 1
; i end address is: 20 (R5)
; pos end address is: 16 (R4)
L_Write_Thresholds96:
; i start address is: 20 (R5)
; pos start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 128
BNE	R2, R0, L__Write_Thresholds222
NOP	
J	L_Write_Thresholds97
NOP	
L__Write_Thresholds222:
;String.c,430 :: 		val[i] = 0x00000000;
ADDIU	R3, SP, 16
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R0, 0(R2)
;String.c,429 :: 		for(i=1;i<128;i++)
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,430 :: 		val[i] = 0x00000000;
; i end address is: 20 (R5)
J	L_Write_Thresholds96
NOP	
L_Write_Thresholds97:
;String.c,433 :: 		if(!data_src)
BEQ	R25, R0, L__Write_Thresholds223
NOP	
J	L_Write_Thresholds99
NOP	
L__Write_Thresholds223:
;String.c,434 :: 		TCS3472_getRawData(RawData);
SW	R4, 8(SP)
SB	R25, 12(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 12(SP)
LW	R4, 8(SP)
L_Write_Thresholds99:
;String.c,436 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds225
NOP	
J	L_Write_Thresholds100
NOP	
L__Write_Thresholds225:
;String.c,437 :: 		if(string[2] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
BNE	R3, R2, L__Write_Thresholds227
NOP	
J	L_Write_Thresholds101
NOP	
L__Write_Thresholds227:
;String.c,438 :: 		val[0] = atol(string[2]);
ADDIU	R2, SP, 16
SW	R2, 616(SP)
SW	R4, 8(SP)
SB	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_atol+0
NOP	
LB	R25, 12(SP)
LW	R4, 8(SP)
LW	R3, 616(SP)
SW	R2, 0(R3)
L_Write_Thresholds101:
;String.c,439 :: 		}
J	L_Write_Thresholds102
NOP	
L_Write_Thresholds100:
;String.c,441 :: 		val[0] = RawData[0];
ADDIU	R3, SP, 16
LHU	R2, Offset(_RawData+0)(GP)
SW	R2, 0(R3)
L_Write_Thresholds102:
;String.c,442 :: 		err = NVMWriteWord(pos,val[0]);
ADDIU	R2, SP, 16
SW	R4, 8(SP)
SB	R25, 12(SP)
LW	R26, 0(R2)
MOVZ	R25, R4, R0
JAL	_NVMWriteWord+0
NOP	
LB	R25, 12(SP)
LW	R4, 8(SP)
;String.c,444 :: 		pos += 4;
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
;String.c,445 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds229
NOP	
J	L_Write_Thresholds103
NOP	
L__Write_Thresholds229:
;String.c,446 :: 		if(string[3] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__Write_Thresholds231
NOP	
J	L_Write_Thresholds104
NOP	
L__Write_Thresholds231:
;String.c,447 :: 		val[1] = atol(string[3]);
ADDIU	R2, SP, 16
ADDIU	R2, R2, 4
SW	R2, 616(SP)
SW	R4, 8(SP)
SB	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atol+0
NOP	
LB	R25, 12(SP)
LW	R4, 8(SP)
LW	R3, 616(SP)
SW	R2, 0(R3)
L_Write_Thresholds104:
;String.c,448 :: 		}else
J	L_Write_Thresholds105
NOP	
L_Write_Thresholds103:
;String.c,449 :: 		val[1] = RawData[1];
ADDIU	R2, SP, 16
ADDIU	R3, R2, 4
LHU	R2, Offset(_RawData+2)(GP)
SW	R2, 0(R3)
L_Write_Thresholds105:
;String.c,450 :: 		err = NVMWriteWord(pos,val[1]);
ADDIU	R2, SP, 16
ADDIU	R2, R2, 4
SW	R4, 8(SP)
SB	R25, 12(SP)
LW	R26, 0(R2)
MOVZ	R25, R4, R0
JAL	_NVMWriteWord+0
NOP	
LB	R25, 12(SP)
LW	R4, 8(SP)
;String.c,452 :: 		pos += 4;
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
;String.c,453 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds233
NOP	
J	L_Write_Thresholds106
NOP	
L__Write_Thresholds233:
;String.c,454 :: 		if(string[4] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
BNE	R3, R2, L__Write_Thresholds235
NOP	
J	L_Write_Thresholds107
NOP	
L__Write_Thresholds235:
;String.c,455 :: 		val[2] = atol(string[4]);
ADDIU	R2, SP, 16
ADDIU	R2, R2, 8
SW	R2, 616(SP)
SW	R4, 8(SP)
SB	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_atol+0
NOP	
LB	R25, 12(SP)
LW	R4, 8(SP)
LW	R3, 616(SP)
SW	R2, 0(R3)
L_Write_Thresholds107:
;String.c,456 :: 		}
J	L_Write_Thresholds108
NOP	
L_Write_Thresholds106:
;String.c,458 :: 		val[2] = RawData[2];
ADDIU	R2, SP, 16
ADDIU	R3, R2, 8
LHU	R2, Offset(_RawData+4)(GP)
SW	R2, 0(R3)
L_Write_Thresholds108:
;String.c,459 :: 		err = NVMWriteWord(pos,val[2]);
ADDIU	R2, SP, 16
ADDIU	R2, R2, 8
SW	R4, 8(SP)
SB	R25, 12(SP)
LW	R26, 0(R2)
MOVZ	R25, R4, R0
JAL	_NVMWriteWord+0
NOP	
LB	R25, 12(SP)
LW	R4, 8(SP)
;String.c,461 :: 		pos += 4;
ADDIU	R2, R4, 4
; pos end address is: 16 (R4)
; pos start address is: 28 (R7)
MOVZ	R7, R2, R0
;String.c,462 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds237
NOP	
J	L_Write_Thresholds109
NOP	
L__Write_Thresholds237:
;String.c,463 :: 		if(string[5] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds239
NOP	
J	L_Write_Thresholds110
NOP	
L__Write_Thresholds239:
;String.c,464 :: 		val[3] = atol(string[5]);
ADDIU	R2, SP, 16
ADDIU	R2, R2, 12
SW	R2, 616(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_atol+0
NOP	
LB	R25, 8(SP)
LW	R3, 616(SP)
SW	R2, 0(R3)
L_Write_Thresholds110:
;String.c,465 :: 		}
J	L_Write_Thresholds111
NOP	
L_Write_Thresholds109:
;String.c,467 :: 		val[3] = RawData[3];
ADDIU	R2, SP, 16
ADDIU	R3, R2, 12
LHU	R2, Offset(_RawData+6)(GP)
SW	R2, 0(R3)
L_Write_Thresholds111:
;String.c,468 :: 		err = NVMWriteWord(pos,val[3]);
ADDIU	R2, SP, 16
ADDIU	R2, R2, 12
SB	R25, 8(SP)
LW	R26, 0(R2)
MOVZ	R25, R7, R0
; pos end address is: 28 (R7)
JAL	_NVMWriteWord+0
NOP	
;String.c,473 :: 		sprintf(txtR,"%x",err);
ADDIU	R3, SP, 528
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_63_String+0)
ORI	R2, R2, lo_addr(?lstr_63_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,474 :: 		strcpy(str,txtR);
ADDIU	R3, SP, 528
ADDIU	R2, SP, 543
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,475 :: 		strcat(str," ||\r\n ");
ORI	R30, R0, 32
SB	R30, 607(SP)
ORI	R30, R0, 124
SB	R30, 608(SP)
ORI	R30, R0, 124
SB	R30, 609(SP)
ORI	R30, R0, 13
SB	R30, 610(SP)
ORI	R30, R0, 10
SB	R30, 611(SP)
ORI	R30, R0, 32
SB	R30, 612(SP)
MOVZ	R30, R0, R0
SB	R30, 613(SP)
ADDIU	R3, SP, 607
ADDIU	R2, SP, 543
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 8(SP)
;String.c,476 :: 		return str;
ADDIU	R2, SP, 543
;String.c,477 :: 		}
;String.c,476 :: 		return str;
;String.c,477 :: 		}
L_end_Write_Thresholds:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 620
JR	RA
NOP	
; end of _Write_Thresholds
_testStrings:
;String.c,482 :: 		void testStrings(char* writebuff){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;String.c,483 :: 		if(strlen(string[0])!=0){
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings242
NOP	
J	L_testStrings112
NOP	
L__testStrings242:
;String.c,484 :: 		strncat(writebuff,string[0],strlen(string[0]));
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
;String.c,485 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 16(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
ADDIU	R2, SP, 16
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,486 :: 		}
L_testStrings112:
;String.c,487 :: 		if(strlen(string[1])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings244
NOP	
J	L_testStrings113
NOP	
L__testStrings244:
;String.c,488 :: 		strncat(writebuff,string[1],strlen(string[1]));
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
;String.c,489 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 18(SP)
MOVZ	R30, R0, R0
SB	R30, 19(SP)
ADDIU	R2, SP, 18
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,490 :: 		}
L_testStrings113:
;String.c,491 :: 		if(strlen(string[2])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings246
NOP	
J	L_testStrings114
NOP	
L__testStrings246:
;String.c,492 :: 		strncat(writebuff,string[2],strlen(string[2]));
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
;String.c,493 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 20(SP)
MOVZ	R30, R0, R0
SB	R30, 21(SP)
ADDIU	R2, SP, 20
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,494 :: 		}
L_testStrings114:
;String.c,495 :: 		if(strlen(string[3])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings248
NOP	
J	L_testStrings115
NOP	
L__testStrings248:
;String.c,496 :: 		strncat(writebuff,string[3],strlen(string[3]));
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
;String.c,497 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 22(SP)
MOVZ	R30, R0, R0
SB	R30, 23(SP)
ADDIU	R2, SP, 22
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,498 :: 		}
L_testStrings115:
;String.c,499 :: 		if(strlen(string[4])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings250
NOP	
J	L_testStrings116
NOP	
L__testStrings250:
;String.c,500 :: 		strncat(writebuff,string[4],strlen(string[4]));
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
;String.c,501 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 24(SP)
MOVZ	R30, R0, R0
SB	R30, 25(SP)
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,502 :: 		}
L_testStrings116:
;String.c,503 :: 		if(strlen(string[5])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings252
NOP	
J	L_testStrings117
NOP	
L__testStrings252:
;String.c,504 :: 		strncat(writebuff,string[5],strlen(string[5]));
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
;String.c,505 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
ADDIU	R2, SP, 26
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,506 :: 		}
L_testStrings117:
;String.c,507 :: 		if(strlen(string[6])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings254
NOP	
J	L_testStrings118
NOP	
L__testStrings254:
;String.c,508 :: 		strncat(writebuff,string[6],strlen(string[6]));
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
;String.c,509 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 28(SP)
MOVZ	R30, R0, R0
SB	R30, 29(SP)
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,510 :: 		}
L_testStrings118:
;String.c,512 :: 		}
L_end_testStrings:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _testStrings
_TestFlash:
;String.c,514 :: 		char* TestFlash(){
ADDIU	SP, SP, -120
SW	RA, 0(SP)
;String.c,520 :: 		char* tr = "112233";
SW	R25, 4(SP)
SW	R26, 8(SP)
;String.c,528 :: 		Val =  ReadFlashWord();
JAL	_ReadFlashWord+0
NOP	
; Val start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,531 :: 		strcpy(str,"Val || ");
ADDIU	R23, SP, 98
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr73_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr73_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 98
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,532 :: 		LongWordToHex(Val,txtR);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
MOVZ	R25, R6, R0
; Val end address is: 24 (R6)
JAL	_LongWordToHex+0
NOP	
;String.c,534 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,535 :: 		strcat(str," || ");
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
;String.c,537 :: 		sprintf(txtR,"%u",res);//Threshold.R_thresh);
ADDIU	R3, SP, 12
LHU	R2, 96(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_75_String+0)
ORI	R2, R2, lo_addr(?lstr_75_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,538 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,539 :: 		strcat(str," ||\r\n ");
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
;String.c,541 :: 		return &str;
ADDIU	R2, SP, 32
;String.c,542 :: 		}
;String.c,541 :: 		return &str;
;String.c,542 :: 		}
L_end_TestFlash:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 120
JR	RA
NOP	
; end of _TestFlash
_RemoveChars:
;String.c,547 :: 		char* RemoveChars(char* str,char a,char b){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;String.c,550 :: 		temp = (char*)Malloc(100*sizeof(char*));
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 400
JAL	_Malloc+0
NOP	
LW	R25, 12(SP)
; temp start address is: 20 (R5)
MOVZ	R5, R2, R0
;String.c,551 :: 		memset(temp,0,100);
SB	R27, 12(SP)
SB	R26, 13(SP)
SW	R25, 16(SP)
ORI	R27, R0, 100
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LW	R25, 16(SP)
LBU	R26, 13(SP)
LBU	R27, 12(SP)
;String.c,553 :: 		if(a != 0x02){
ANDI	R3, R26, 255
ORI	R2, R0, 2
BNE	R3, R2, L__RemoveChars258
NOP	
J	L_RemoveChars119
NOP	
L__RemoveChars258:
; temp end address is: 20 (R5)
;String.c,554 :: 		temp = strchr(str,a);
SW	R25, 12(SP)
JAL	_strchr+0
NOP	
LW	R25, 12(SP)
; temp start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,555 :: 		strcpy(str,temp+1);
ADDIU	R2, R2, 1
MOVZ	R26, R2, R0
JAL	_strcpy+0
NOP	
;String.c,556 :: 		}else{
MOVZ	R8, R6, R0
; temp end address is: 24 (R6)
J	L_RemoveChars120
NOP	
L_RemoveChars119:
;String.c,557 :: 		temp = strcpy(temp,str);
; temp start address is: 20 (R5)
SW	R25, 12(SP)
MOVZ	R26, R25, R0
MOVZ	R25, R5, R0
; temp end address is: 20 (R5)
JAL	_strcpy+0
NOP	
LW	R25, 12(SP)
; temp start address is: 12 (R3)
MOVZ	R3, R2, R0
; temp end address is: 12 (R3)
MOVZ	R8, R3, R0
;String.c,558 :: 		}
L_RemoveChars120:
;String.c,559 :: 		for(i=0;i<strlen(str)+1;i++){
; temp start address is: 32 (R8)
; i start address is: 36 (R9)
MOVZ	R9, R0, R0
; temp end address is: 32 (R8)
; i end address is: 36 (R9)
L_RemoveChars121:
; i start address is: 36 (R9)
; temp start address is: 32 (R8)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R3, R9
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__RemoveChars259
NOP	
J	L_RemoveChars122
NOP	
L__RemoveChars259:
;String.c,560 :: 		if(str[i]==b)
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BEQ	R3, R2, L__RemoveChars260
NOP	
J	L_RemoveChars124
NOP	
L__RemoveChars260:
;String.c,561 :: 		break;
J	L_RemoveChars122
NOP	
L_RemoveChars124:
;String.c,562 :: 		*(temp+i) = *(str+i);
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,559 :: 		for(i=0;i<strlen(str)+1;i++){
ADDIU	R2, R9, 1
SEH	R9, R2
;String.c,563 :: 		}
J	L_RemoveChars121
NOP	
L_RemoveChars122:
;String.c,564 :: 		*(temp+i) = 0;
SEH	R2, R9
; i end address is: 36 (R9)
ADDU	R2, R8, R2
SB	R0, 0(R2)
;String.c,566 :: 		Free(temp,100);
ORI	R26, R0, 100
MOVZ	R25, R8, R0
JAL	_Free+0
NOP	
;String.c,567 :: 		return temp;
MOVZ	R2, R8, R0
; temp end address is: 32 (R8)
;String.c,568 :: 		}
;String.c,567 :: 		return temp;
;String.c,568 :: 		}
L_end_RemoveChars:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _RemoveChars
_PrintHandler:
;String.c,573 :: 		void PrintHandler(char c){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;String.c,575 :: 		UART1_Write(c);
ANDI	R25, R25, 255
JAL	_UART1_Write+0
NOP	
;String.c,577 :: 		}
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
