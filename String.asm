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
ADDIU	SP, SP, -92
SW	RA, 0(SP)
;String.c,45 :: 		char *result,conf[64] = "";
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 28
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
ADDIU	R2, SP, 28
SEH	R27, R25
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;String.c,54 :: 		result = setstr(conf);       //look for '\r' '\n' and move result to a string
ADDIU	R2, SP, 28
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
BEQ	R2, R0, L__DoStrings127
NOP	
J	L_DoStrings0
NOP	
L__DoStrings127:
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
BEQ	R2, R0, L__DoStrings128
NOP	
J	L_DoStrings5
NOP	
L__DoStrings128:
;String.c,73 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings130
NOP	
J	L_DoStrings6
NOP	
L__DoStrings130:
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
BNE	R2, R0, L__DoStrings131
NOP	
J	L_DoStrings8
NOP	
L__DoStrings131:
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
BEQ	R2, R0, L__DoStrings132
NOP	
J	L_DoStrings12
NOP	
L__DoStrings132:
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
BNE	R2, R0, L__DoStrings133
NOP	
J	L_DoStrings14
NOP	
L__DoStrings133:
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
BEQ	R2, R0, L__DoStrings134
NOP	
J	L_DoStrings19
NOP	
L__DoStrings134:
;String.c,87 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings136
NOP	
J	L_DoStrings20
NOP	
L__DoStrings136:
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
BNE	R2, R0, L__DoStrings137
NOP	
J	L_DoStrings22
NOP	
L__DoStrings137:
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
BEQ	R2, R0, L__DoStrings138
NOP	
J	L_DoStrings26
NOP	
L__DoStrings138:
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
BNE	R2, R0, L__DoStrings139
NOP	
J	L_DoStrings28
NOP	
L__DoStrings139:
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
LUI	R2, hi_addr(?lstr20_String+0)
ORI	R2, R2, lo_addr(?lstr20_String+0)
SW	R2, 20(SP)
;String.c,141 :: 		break;
J	L_DoStrings3
NOP	
;String.c,142 :: 		}
L_DoStrings2:
; res1 start address is: 20 (R5)
SEH	R2, R5
BNE	R2, R0, L__DoStrings141
NOP	
J	L_DoStrings4
NOP	
L__DoStrings141:
SEH	R3, R5
ORI	R2, R0, 5
BNE	R3, R2, L__DoStrings143
NOP	
J	L_DoStrings32
NOP	
L__DoStrings143:
SEH	R3, R5
ORI	R2, R0, 6
BNE	R3, R2, L__DoStrings145
NOP	
J	L_DoStrings33
NOP	
L__DoStrings145:
SEH	R3, R5
ORI	R2, R0, 7
BNE	R3, R2, L__DoStrings147
NOP	
J	L_DoStrings34
NOP	
L__DoStrings147:
SEH	R3, R5
ORI	R2, R0, 8
BNE	R3, R2, L__DoStrings149
NOP	
J	L_DoStrings35
NOP	
L__DoStrings149:
SEH	R3, R5
ORI	R2, R0, 9
BNE	R3, R2, L__DoStrings151
NOP	
J	L_DoStrings36
NOP	
L__DoStrings151:
SEH	R3, R5
ORI	R2, R0, 10
BNE	R3, R2, L__DoStrings153
NOP	
J	L_DoStrings37
NOP	
L__DoStrings153:
SEH	R3, R5
ORI	R2, R0, 11
BNE	R3, R2, L__DoStrings155
NOP	
J	L_DoStrings38
NOP	
L__DoStrings155:
SEH	R3, R5
ORI	R2, R0, 12
BNE	R3, R2, L__DoStrings157
NOP	
J	L_DoStrings39
NOP	
L__DoStrings157:
SEH	R3, R5
ORI	R2, R0, 13
BNE	R3, R2, L__DoStrings159
NOP	
J	L_DoStrings40
NOP	
L__DoStrings159:
SEH	R3, R5
ORI	R2, R0, 14
BNE	R3, R2, L__DoStrings161
NOP	
J	L_DoStrings41
NOP	
L__DoStrings161:
SEH	R3, R5
ORI	R2, R0, 15
BNE	R3, R2, L__DoStrings163
NOP	
J	L_DoStrings42
NOP	
L__DoStrings163:
SEH	R3, R5
; res1 end address is: 20 (R5)
ORI	R2, R0, 16
BNE	R3, R2, L__DoStrings165
NOP	
J	L_DoStrings43
NOP	
L__DoStrings165:
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
BEQ	R2, R0, L__DoStrings166
NOP	
J	L_DoStrings46
NOP	
L__DoStrings166:
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
ADDIU	SP, SP, 92
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
BNE	R2, R0, L__clr_str_arrays168
NOP	
J	L_clr_str_arrays48
NOP	
L__clr_str_arrays168:
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
BNE	R2, R0, L__clr_str_arrays169
NOP	
J	L_clr_str_arrays51
NOP	
L__clr_str_arrays169:
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
BNE	R2, R0, L__setstr171
NOP	
J	L_setstr54
NOP	
L__setstr171:
;String.c,173 :: 		if((conf[i] == 0x0D)|| (conf[i] == 0x0A))
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L__setstr173
NOP	
J	L__setstr121
NOP	
L__setstr173:
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L__setstr175
NOP	
J	L__setstr120
NOP	
L__setstr175:
J	L_setstr58
NOP	
L__setstr121:
L__setstr120:
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
ADDIU	SP, SP, -8
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
BNE	R2, R0, L__remove_whitespaces177
NOP	
J	L_remove_whitespaces60
NOP	
L__remove_whitespaces177:
;String.c,189 :: 		if(dst[j] == 0x32){
SEH	R2, R7
ADDU	R2, R5, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 50
BEQ	R3, R2, L__remove_whitespaces178
NOP	
J	L_remove_whitespaces62
NOP	
L__remove_whitespaces178:
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
SW	R25, 4(SP)
LUI	R25, hi_addr(?lstr21_String+0)
ORI	R25, R25, lo_addr(?lstr21_String+0)
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
ADDIU	SP, SP, 8
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
BNE	R2, R0, L__strsplit180
NOP	
J	L_strsplit64
NOP	
L__strsplit180:
;String.c,209 :: 		if(str[i] == c){
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R26, 255
BEQ	R3, R2, L__strsplit181
NOP	
J	L_strsplit66
NOP	
L__strsplit181:
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
BEQ	R2, R0, L__strsplit182
NOP	
J	L_strsplit68
NOP	
L__strsplit182:
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
BNE	R2, R0, L__findnumber184
NOP	
J	L_findnumber70
NOP	
L__findnumber184:
;String.c,235 :: 		if((str[i] > 0x29)&& (str[i] < 0x40)){
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 42
BEQ	R2, R0, L__findnumber185
NOP	
J	L__findnumber124
NOP	
L__findnumber185:
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 64
BNE	R2, R0, L__findnumber186
NOP	
J	L__findnumber123
NOP	
L__findnumber186:
L__findnumber122:
;String.c,236 :: 		temp[i] = str[i];
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,235 :: 		if((str[i] > 0x29)&& (str[i] < 0x40)){
L__findnumber124:
L__findnumber123:
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
BEQ	R2, R0, L__StrChecker188
NOP	
J	L_StrChecker75
NOP	
L__StrChecker188:
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
BNE	R2, R0, L__StrChecker189
NOP	
J	L_StrChecker77
NOP	
L__StrChecker189:
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
BEQ	R2, R0, L__StrChecker190
NOP	
J	L_StrChecker79
NOP	
L__StrChecker190:
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
ADDIU	SP, SP, -108
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
BNE	R25, R0, L__Read_Send_AllColour194
NOP	
J	L_Read_Send_AllColour80
NOP	
L__Read_Send_AllColour194:
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
ADDIU	R2, SP, 43
SB	R25, 12(SP)
LUI	R26, hi_addr(?lstr22_String+0)
ORI	R26, R26, lo_addr(?lstr22_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LB	R25, 12(SP)
;String.c,290 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour195
NOP	
J	L_Read_Send_AllColour81
NOP	
L__Read_Send_AllColour195:
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
ADDIU	R2, SP, 43
LUI	R26, hi_addr(?lstr25_String+0)
ORI	R26, R26, lo_addr(?lstr25_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
;String.c,297 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour196
NOP	
J	L_Read_Send_AllColour83
NOP	
L__Read_Send_AllColour196:
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
ADDIU	R2, SP, 43
LUI	R26, hi_addr(?lstr28_String+0)
ORI	R26, R26, lo_addr(?lstr28_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
;String.c,304 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour197
NOP	
J	L_Read_Send_AllColour85
NOP	
L__Read_Send_AllColour197:
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
ADDIU	R2, SP, 43
LUI	R26, hi_addr(?lstr31_String+0)
ORI	R26, R26, lo_addr(?lstr31_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
;String.c,311 :: 		if(!data_src ) {
BEQ	R25, R0, L__Read_Send_AllColour198
NOP	
J	L_Read_Send_AllColour87
NOP	
L__Read_Send_AllColour198:
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
ADDIU	R2, SP, 43
LUI	R26, hi_addr(?lstr33_String+0)
ORI	R26, R26, lo_addr(?lstr33_String+0)
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
ADDIU	R2, SP, 43
LUI	R26, hi_addr(?lstr35_String+0)
ORI	R26, R26, lo_addr(?lstr35_String+0)
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
ADDIU	SP, SP, 108
JR	RA
NOP	
; end of _Read_Send_AllColour
_Read_Send_OneColour:
;String.c,328 :: 		char* Read_Send_OneColour(int colr){
ADDIU	SP, SP, -92
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
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr36_String+0)
ORI	R26, R26, lo_addr(?lstr36_String+0)
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
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr38_String+0)
ORI	R26, R26, lo_addr(?lstr38_String+0)
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
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr39_String+0)
ORI	R26, R26, lo_addr(?lstr39_String+0)
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
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr41_String+0)
ORI	R26, R26, lo_addr(?lstr41_String+0)
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
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr42_String+0)
ORI	R26, R26, lo_addr(?lstr42_String+0)
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
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr44_String+0)
ORI	R26, R26, lo_addr(?lstr44_String+0)
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
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr45_String+0)
ORI	R26, R26, lo_addr(?lstr45_String+0)
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
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr47_String+0)
ORI	R26, R26, lo_addr(?lstr47_String+0)
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
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr48_String+0)
ORI	R26, R26, lo_addr(?lstr48_String+0)
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
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr50_String+0)
ORI	R26, R26, lo_addr(?lstr50_String+0)
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
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr51_String+0)
ORI	R26, R26, lo_addr(?lstr51_String+0)
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
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr53_String+0)
ORI	R26, R26, lo_addr(?lstr53_String+0)
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
BNE	R3, R2, L__Read_Send_OneColour201
NOP	
J	L_Read_Send_OneColour90
NOP	
L__Read_Send_OneColour201:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Read_Send_OneColour203
NOP	
J	L_Read_Send_OneColour91
NOP	
L__Read_Send_OneColour203:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Read_Send_OneColour205
NOP	
J	L_Read_Send_OneColour92
NOP	
L__Read_Send_OneColour205:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Read_Send_OneColour207
NOP	
J	L_Read_Send_OneColour93
NOP	
L__Read_Send_OneColour207:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Read_Send_OneColour209
NOP	
J	L_Read_Send_OneColour94
NOP	
L__Read_Send_OneColour209:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Read_Send_OneColour211
NOP	
J	L_Read_Send_OneColour95
NOP	
L__Read_Send_OneColour211:
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
ADDIU	SP, SP, 92
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
ADDIU	SP, SP, -92
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
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr54_String+0)
ORI	R26, R26, lo_addr(?lstr54_String+0)
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
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr56_String+0)
ORI	R26, R26, lo_addr(?lstr56_String+0)
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
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr58_String+0)
ORI	R26, R26, lo_addr(?lstr58_String+0)
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
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr60_String+0)
ORI	R26, R26, lo_addr(?lstr60_String+0)
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
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr62_String+0)
ORI	R26, R26, lo_addr(?lstr62_String+0)
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
ADDIU	SP, SP, 92
JR	RA
NOP	
; end of _Read_Thresholds
_Write_Thresholds:
;String.c,422 :: 		char* Write_Thresholds(short data_src){
ADDIU	SP, SP, -616
SW	RA, 0(SP)
;String.c,428 :: 		pos =  FLASH_Settings_PAddr;
SW	R26, 4(SP)
LW	R2, Offset(_FLASH_Settings_PAddr+0)(GP)
SW	R2, 524(SP)
;String.c,429 :: 		for(i=1;i<128;i++)
; i start address is: 20 (R5)
ORI	R5, R0, 1
; i end address is: 20 (R5)
SEH	R4, R5
L_Write_Thresholds96:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 128
BNE	R2, R0, L__Write_Thresholds216
NOP	
J	L_Write_Thresholds97
NOP	
L__Write_Thresholds216:
;String.c,430 :: 		val[i] = 0x00000000;
ADDIU	R3, SP, 12
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R0, 0(R2)
;String.c,429 :: 		for(i=1;i<128;i++)
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;String.c,430 :: 		val[i] = 0x00000000;
SEH	R4, R5
; i end address is: 20 (R5)
J	L_Write_Thresholds96
NOP	
L_Write_Thresholds97:
;String.c,431 :: 		err = NVMErasePage(pos);
SB	R25, 8(SP)
LW	R25, 524(SP)
JAL	_NVMErasePage+0
NOP	
LB	R25, 8(SP)
;String.c,434 :: 		if(!data_src)
BEQ	R25, R0, L__Write_Thresholds217
NOP	
J	L_Write_Thresholds99
NOP	
L__Write_Thresholds217:
;String.c,435 :: 		TCS3472_getRawData(RawData);
SB	R25, 8(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 8(SP)
L_Write_Thresholds99:
;String.c,437 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds219
NOP	
J	L_Write_Thresholds100
NOP	
L__Write_Thresholds219:
;String.c,438 :: 		if(string[2] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
BNE	R3, R2, L__Write_Thresholds221
NOP	
J	L_Write_Thresholds101
NOP	
L__Write_Thresholds221:
;String.c,439 :: 		val[0] = atol(string[2]);
ADDIU	R2, SP, 12
SW	R2, 612(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_atol+0
NOP	
LB	R25, 8(SP)
LW	R3, 612(SP)
SW	R2, 0(R3)
L_Write_Thresholds101:
;String.c,440 :: 		}
J	L_Write_Thresholds102
NOP	
L_Write_Thresholds100:
;String.c,442 :: 		val[0] = RawData[0];
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+0)(GP)
SW	R2, 0(R3)
L_Write_Thresholds102:
;String.c,443 :: 		err = NVMWriteWord(pos,val[0]);
ADDIU	R2, SP, 12
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,445 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
;String.c,446 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds223
NOP	
J	L_Write_Thresholds103
NOP	
L__Write_Thresholds223:
;String.c,447 :: 		if(string[3] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__Write_Thresholds225
NOP	
J	L_Write_Thresholds104
NOP	
L__Write_Thresholds225:
;String.c,448 :: 		val[1] = atol(string[3]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 4
SW	R2, 612(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atol+0
NOP	
LB	R25, 8(SP)
LW	R3, 612(SP)
SW	R2, 0(R3)
L_Write_Thresholds104:
;String.c,449 :: 		}else
J	L_Write_Thresholds105
NOP	
L_Write_Thresholds103:
;String.c,450 :: 		val[1] = RawData[1];
ADDIU	R2, SP, 12
ADDIU	R3, R2, 4
LHU	R2, Offset(_RawData+2)(GP)
SW	R2, 0(R3)
L_Write_Thresholds105:
;String.c,451 :: 		err = NVMWriteWord(pos,val[1]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 4
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,453 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
;String.c,454 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds227
NOP	
J	L_Write_Thresholds106
NOP	
L__Write_Thresholds227:
;String.c,455 :: 		if(string[4] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
BNE	R3, R2, L__Write_Thresholds229
NOP	
J	L_Write_Thresholds107
NOP	
L__Write_Thresholds229:
;String.c,456 :: 		val[2] = atol(string[4]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 8
SW	R2, 612(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_atol+0
NOP	
LB	R25, 8(SP)
LW	R3, 612(SP)
SW	R2, 0(R3)
L_Write_Thresholds107:
;String.c,457 :: 		}
J	L_Write_Thresholds108
NOP	
L_Write_Thresholds106:
;String.c,459 :: 		val[2] = RawData[2];
ADDIU	R2, SP, 12
ADDIU	R3, R2, 8
LHU	R2, Offset(_RawData+4)(GP)
SW	R2, 0(R3)
L_Write_Thresholds108:
;String.c,460 :: 		err = NVMWriteWord(pos,val[2]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 8
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,462 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
;String.c,463 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds231
NOP	
J	L_Write_Thresholds109
NOP	
L__Write_Thresholds231:
;String.c,464 :: 		if(string[5] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds233
NOP	
J	L_Write_Thresholds110
NOP	
L__Write_Thresholds233:
;String.c,465 :: 		val[3] = atol(string[5]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 12
SW	R2, 612(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_atol+0
NOP	
LB	R25, 8(SP)
LW	R3, 612(SP)
SW	R2, 0(R3)
L_Write_Thresholds110:
;String.c,466 :: 		}
J	L_Write_Thresholds111
NOP	
L_Write_Thresholds109:
;String.c,468 :: 		val[3] = RawData[3];
ADDIU	R2, SP, 12
ADDIU	R3, R2, 12
LHU	R2, Offset(_RawData+6)(GP)
SW	R2, 0(R3)
L_Write_Thresholds111:
;String.c,469 :: 		err = NVMWriteWord(pos,val[3]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 12
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
;String.c,474 :: 		sprintf(txtR,"%x",err);
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
;String.c,475 :: 		strcpy(str,txtR);
ADDIU	R3, SP, 528
ADDIU	R2, SP, 543
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,476 :: 		strcat(str," ||\r\n ");
ADDIU	R2, SP, 543
LUI	R26, hi_addr(?lstr64_String+0)
ORI	R26, R26, lo_addr(?lstr64_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 8(SP)
;String.c,477 :: 		return str;
ADDIU	R2, SP, 543
;String.c,478 :: 		}
;String.c,477 :: 		return str;
;String.c,478 :: 		}
L_end_Write_Thresholds:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 616
JR	RA
NOP	
; end of _Write_Thresholds
_testStrings:
;String.c,483 :: 		void testStrings(char* writebuff){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,484 :: 		if(strlen(string[0])!=0){
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings236
NOP	
J	L_testStrings112
NOP	
L__testStrings236:
;String.c,485 :: 		strncat(writebuff,string[0],strlen(string[0]));
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
;String.c,486 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr65_String+0)
ORI	R26, R26, lo_addr(?lstr65_String+0)
JAL	_strcat+0
NOP	
;String.c,487 :: 		}
L_testStrings112:
;String.c,488 :: 		if(strlen(string[1])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings238
NOP	
J	L_testStrings113
NOP	
L__testStrings238:
;String.c,489 :: 		strncat(writebuff,string[1],strlen(string[1]));
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
;String.c,490 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr66_String+0)
ORI	R26, R26, lo_addr(?lstr66_String+0)
JAL	_strcat+0
NOP	
;String.c,491 :: 		}
L_testStrings113:
;String.c,492 :: 		if(strlen(string[2])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings240
NOP	
J	L_testStrings114
NOP	
L__testStrings240:
;String.c,493 :: 		strncat(writebuff,string[2],strlen(string[2]));
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
;String.c,494 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr67_String+0)
ORI	R26, R26, lo_addr(?lstr67_String+0)
JAL	_strcat+0
NOP	
;String.c,495 :: 		}
L_testStrings114:
;String.c,496 :: 		if(strlen(string[3])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings242
NOP	
J	L_testStrings115
NOP	
L__testStrings242:
;String.c,497 :: 		strncat(writebuff,string[3],strlen(string[3]));
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
;String.c,498 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr68_String+0)
ORI	R26, R26, lo_addr(?lstr68_String+0)
JAL	_strcat+0
NOP	
;String.c,499 :: 		}
L_testStrings115:
;String.c,500 :: 		if(strlen(string[4])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings244
NOP	
J	L_testStrings116
NOP	
L__testStrings244:
;String.c,501 :: 		strncat(writebuff,string[4],strlen(string[4]));
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
;String.c,502 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr69_String+0)
ORI	R26, R26, lo_addr(?lstr69_String+0)
JAL	_strcat+0
NOP	
;String.c,503 :: 		}
L_testStrings116:
;String.c,504 :: 		if(strlen(string[5])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings246
NOP	
J	L_testStrings117
NOP	
L__testStrings246:
;String.c,505 :: 		strncat(writebuff,string[5],strlen(string[5]));
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
;String.c,506 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr70_String+0)
ORI	R26, R26, lo_addr(?lstr70_String+0)
JAL	_strcat+0
NOP	
;String.c,507 :: 		}
L_testStrings117:
;String.c,508 :: 		if(strlen(string[6])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings248
NOP	
J	L_testStrings118
NOP	
L__testStrings248:
;String.c,509 :: 		strncat(writebuff,string[6],strlen(string[6]));
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
;String.c,510 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr71_String+0)
ORI	R26, R26, lo_addr(?lstr71_String+0)
JAL	_strcat+0
NOP	
;String.c,511 :: 		}
L_testStrings118:
;String.c,513 :: 		}
L_end_testStrings:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _testStrings
_TestFlash:
;String.c,515 :: 		char* TestFlash(){
ADDIU	SP, SP, -100
SW	RA, 0(SP)
;String.c,521 :: 		char* tr = "112233";
SW	R25, 4(SP)
SW	R26, 8(SP)
;String.c,529 :: 		Val =  ReadFlashWord();
JAL	_ReadFlashWord+0
NOP	
; Val start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,532 :: 		strcpy(str,"Val || ");
ADDIU	R2, SP, 32
LUI	R26, hi_addr(?lstr73_String+0)
ORI	R26, R26, lo_addr(?lstr73_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,533 :: 		LongWordToHex(Val,txtR);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
MOVZ	R25, R6, R0
; Val end address is: 24 (R6)
JAL	_LongWordToHex+0
NOP	
;String.c,535 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,536 :: 		strcat(str," || ");
ADDIU	R2, SP, 32
LUI	R26, hi_addr(?lstr74_String+0)
ORI	R26, R26, lo_addr(?lstr74_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,538 :: 		sprintf(txtR,"%u",res);//Threshold.R_thresh);
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
;String.c,539 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,540 :: 		strcat(str," ||\r\n ");
ADDIU	R2, SP, 32
LUI	R26, hi_addr(?lstr76_String+0)
ORI	R26, R26, lo_addr(?lstr76_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,542 :: 		return &str;
ADDIU	R2, SP, 32
;String.c,543 :: 		}
;String.c,542 :: 		return &str;
;String.c,543 :: 		}
L_end_TestFlash:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 100
JR	RA
NOP	
; end of _TestFlash
_PrintHandler:
;String.c,545 :: 		void PrintHandler(char c){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;String.c,547 :: 		UART1_Write(c);
ANDI	R25, R25, 255
JAL	_UART1_Write+0
NOP	
;String.c,549 :: 		}
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
