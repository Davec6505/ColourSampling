_InitString:
;String.c,35 :: 		PString InitString(char cmp){
ADDIU	SP, SP, -1292
; su_addr start address is: 8 (R2)
MOVZ	R2, R30, R0
; su_addr end address is: 8 (R2)
;String.c,39 :: 		}
L_end_InitString:
ADDIU	SP, SP, 1292
JR	RA
NOP	
; end of _InitString
_DoStrings:
;String.c,44 :: 		int DoStrings(int num){
ADDIU	SP, SP, -116
SW	RA, 0(SP)
;String.c,46 :: 		char *result,conf[64] = "";
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 49
ADDIU	R22, R23, 64
LUI	R24, hi_addr(?ICSDoStrings_conf_L0+0)
ORI	R24, R24, lo_addr(?ICSDoStrings_conf_L0+0)
JAL	___CC2DW+0
NOP	
;String.c,53 :: 		clr_str_arrays(string);     //clear the strings in the array
SH	R25, 16(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_clr_str_arrays+0
NOP	
LH	R25, 16(SP)
;String.c,54 :: 		memcpy(conf,readbuff,num);  //copy the USB buffer to a temp arrar
ADDIU	R2, SP, 49
SEH	R27, R25
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;String.c,55 :: 		result = setstr(conf);       //look for '\r' '\n' and move result to a string
ADDIU	R2, SP, 49
MOVZ	R25, R2, R0
JAL	_setstr+0
NOP	
;String.c,56 :: 		res0 = strsplit(result,'+'); //split the string into an array of strings return num of arr's
ORI	R26, R0, 43
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;String.c,57 :: 		if(res0 > 0)
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__DoStrings130
NOP	
J	L_DoStrings0
NOP	
L__DoStrings130:
;String.c,58 :: 		res1 = StrChecker(string[1]);//Test current string index for equality return index
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
;String.c,60 :: 		res1 = enum_num + 1;
; res1 start address is: 20 (R5)
ORI	R5, R0, 18
; res1 end address is: 20 (R5)
L_DoStrings1:
;String.c,61 :: 		memset(writebuff,0,64);     //empty usb write buffer
; res1 start address is: 20 (R5)
ORI	R27, R0, 64
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memset+0
NOP	
;String.c,71 :: 		switch(res1){
J	L_DoStrings2
NOP	
; res1 end address is: 20 (R5)
;String.c,72 :: 		case CONFIG :
L_DoStrings4:
;String.c,73 :: 		if(!strcmp(string[2],comc[0])){
LW	R26, Offset(_comc+0)(GP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strcmp+0
NOP	
BEQ	R2, R0, L__DoStrings131
NOP	
J	L_DoStrings5
NOP	
L__DoStrings131:
;String.c,74 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings133
NOP	
J	L_DoStrings6
NOP	
L__DoStrings133:
;String.c,75 :: 		Int_Time = atoi(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
SH	R2, 24(SP)
;String.c,76 :: 		for(i=0;i<Int_Time;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_DoStrings7:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
LH	R2, 24(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__DoStrings134
NOP	
J	L_DoStrings8
NOP	
L__DoStrings134:
;String.c,77 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,78 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_DoStrings10:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings10
NOP	
;String.c,76 :: 		for(i=0;i<Int_Time;i++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;String.c,79 :: 		}
; i end address is: 16 (R4)
J	L_DoStrings7
NOP	
L_DoStrings8:
;String.c,80 :: 		}
L_DoStrings6:
;String.c,81 :: 		err = TCS3472_SetIntergration_Time(Int_Time);
SH	R25, 16(SP)
LH	R25, 24(SP)
JAL	_TCS3472_SetIntergration_Time+0
NOP	
LH	R25, 16(SP)
; err start address is: 16 (R4)
ANDI	R4, R2, 255
;String.c,82 :: 		if(err > 0)
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DoStrings135
NOP	
J	L_DoStrings12
NOP	
L__DoStrings135:
;String.c,83 :: 		for(i=0;i<err;i++){
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
BNE	R2, R0, L__DoStrings136
NOP	
J	L_DoStrings14
NOP	
L__DoStrings136:
;String.c,84 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,85 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_DoStrings16:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings16
NOP	
NOP	
NOP	
;String.c,83 :: 		for(i=0;i<err;i++){
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;String.c,86 :: 		}
; err end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_DoStrings13
NOP	
L_DoStrings14:
L_DoStrings12:
;String.c,87 :: 		}else if(!strcmp(string[2],comc[1])){
J	L_DoStrings18
NOP	
L_DoStrings5:
LW	R26, Offset(_comc+4)(GP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strcmp+0
NOP	
BEQ	R2, R0, L__DoStrings137
NOP	
J	L_DoStrings19
NOP	
L__DoStrings137:
;String.c,88 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings139
NOP	
J	L_DoStrings20
NOP	
L__DoStrings139:
;String.c,89 :: 		Gain = atoi(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
SH	R2, 26(SP)
;String.c,90 :: 		for(i=0;i<Gain;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_DoStrings21:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
LH	R2, 26(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__DoStrings140
NOP	
J	L_DoStrings22
NOP	
L__DoStrings140:
;String.c,91 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,92 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_DoStrings24:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings24
NOP	
;String.c,90 :: 		for(i=0;i<Gain;i++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;String.c,93 :: 		}
; i end address is: 16 (R4)
J	L_DoStrings21
NOP	
L_DoStrings22:
;String.c,94 :: 		}
L_DoStrings20:
;String.c,95 :: 		err = TCS3472_SetGain(Gain);
SH	R25, 16(SP)
LH	R25, 26(SP)
JAL	_TCS3472_SetGain+0
NOP	
LH	R25, 16(SP)
; err start address is: 16 (R4)
ANDI	R4, R2, 255
;String.c,96 :: 		if(err > 0)
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
BEQ	R2, R0, L__DoStrings141
NOP	
J	L_DoStrings26
NOP	
L__DoStrings141:
;String.c,97 :: 		for(i=0;i<err;i++){
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
BNE	R2, R0, L__DoStrings142
NOP	
J	L_DoStrings28
NOP	
L__DoStrings142:
;String.c,98 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,99 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_DoStrings30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings30
NOP	
NOP	
NOP	
;String.c,97 :: 		for(i=0;i<err;i++){
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;String.c,100 :: 		}
; err end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_DoStrings27
NOP	
L_DoStrings28:
L_DoStrings26:
;String.c,101 :: 		}
L_DoStrings19:
L_DoStrings18:
;String.c,102 :: 		LATE3_bit = 0;
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
;String.c,103 :: 		break;
J	L_DoStrings3
NOP	
;String.c,104 :: 		case SENDA :
L_DoStrings32:
;String.c,105 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;String.c,106 :: 		break;
J	L_DoStrings3
NOP	
;String.c,107 :: 		case READA :
L_DoStrings33:
;String.c,108 :: 		str = Read_Send_AllColour(0);
MOVZ	R25, R0, R0
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, 20(SP)
;String.c,109 :: 		break;
J	L_DoStrings3
NOP	
;String.c,110 :: 		case READR :
L_DoStrings34:
;String.c,111 :: 		str = Read_Send_OneColour(READR);
ORI	R25, R0, 7
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,112 :: 		break;
J	L_DoStrings3
NOP	
;String.c,113 :: 		case READG :
L_DoStrings35:
;String.c,114 :: 		str = Read_Send_OneColour(READG);
ORI	R25, R0, 8
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,115 :: 		break;
J	L_DoStrings3
NOP	
;String.c,116 :: 		case READB :
L_DoStrings36:
;String.c,117 :: 		str = Read_Send_OneColour(READB);
ORI	R25, R0, 9
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,118 :: 		break;
J	L_DoStrings3
NOP	
;String.c,119 :: 		case READC :
L_DoStrings37:
;String.c,120 :: 		str = Read_Send_OneColour(READC);
ORI	R25, R0, 10
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,121 :: 		break;
J	L_DoStrings3
NOP	
;String.c,122 :: 		case READT :
L_DoStrings38:
;String.c,123 :: 		str = Read_Send_OneColour(READT);
ORI	R25, R0, 11
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,124 :: 		break;
J	L_DoStrings3
NOP	
;String.c,125 :: 		case READT_DN40 :
L_DoStrings39:
;String.c,126 :: 		str = Read_Send_OneColour(READT_DN40);
ORI	R25, R0, 12
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,127 :: 		break;
J	L_DoStrings3
NOP	
;String.c,128 :: 		case READA_SCL :
L_DoStrings40:
;String.c,129 :: 		str = Read_Send_AllColour(1);
ORI	R25, R0, 1
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, 20(SP)
;String.c,130 :: 		break;
J	L_DoStrings3
NOP	
;String.c,131 :: 		case READA_THV :
L_DoStrings41:
;String.c,132 :: 		str =  Read_Thresholds(); //TestFlash();//
JAL	_Read_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,133 :: 		break;
J	L_DoStrings3
NOP	
;String.c,134 :: 		case WRITE_MAN :
L_DoStrings42:
;String.c,135 :: 		str = Write_Thresholds(1);
ORI	R25, R0, 1
JAL	_Write_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,136 :: 		break;
J	L_DoStrings3
NOP	
;String.c,137 :: 		case WRITE_RAW :
L_DoStrings43:
;String.c,138 :: 		str = Write_Thresholds(0);
MOVZ	R25, R0, R0
JAL	_Write_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,139 :: 		break;
J	L_DoStrings3
NOP	
;String.c,140 :: 		default:
L_DoStrings44:
;String.c,141 :: 		str = "No data requested!\r\n";
ADDIU	R23, SP, 28
ADDIU	R22, R23, 21
LUI	R24, hi_addr(?ICS?lstr21_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr21_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 28
SW	R2, 20(SP)
;String.c,142 :: 		break;
J	L_DoStrings3
NOP	
;String.c,143 :: 		}
L_DoStrings2:
; res1 start address is: 20 (R5)
SEH	R2, R5
BNE	R2, R0, L__DoStrings144
NOP	
J	L_DoStrings4
NOP	
L__DoStrings144:
SEH	R3, R5
ORI	R2, R0, 5
BNE	R3, R2, L__DoStrings146
NOP	
J	L_DoStrings32
NOP	
L__DoStrings146:
SEH	R3, R5
ORI	R2, R0, 6
BNE	R3, R2, L__DoStrings148
NOP	
J	L_DoStrings33
NOP	
L__DoStrings148:
SEH	R3, R5
ORI	R2, R0, 7
BNE	R3, R2, L__DoStrings150
NOP	
J	L_DoStrings34
NOP	
L__DoStrings150:
SEH	R3, R5
ORI	R2, R0, 8
BNE	R3, R2, L__DoStrings152
NOP	
J	L_DoStrings35
NOP	
L__DoStrings152:
SEH	R3, R5
ORI	R2, R0, 9
BNE	R3, R2, L__DoStrings154
NOP	
J	L_DoStrings36
NOP	
L__DoStrings154:
SEH	R3, R5
ORI	R2, R0, 10
BNE	R3, R2, L__DoStrings156
NOP	
J	L_DoStrings37
NOP	
L__DoStrings156:
SEH	R3, R5
ORI	R2, R0, 11
BNE	R3, R2, L__DoStrings158
NOP	
J	L_DoStrings38
NOP	
L__DoStrings158:
SEH	R3, R5
ORI	R2, R0, 12
BNE	R3, R2, L__DoStrings160
NOP	
J	L_DoStrings39
NOP	
L__DoStrings160:
SEH	R3, R5
ORI	R2, R0, 13
BNE	R3, R2, L__DoStrings162
NOP	
J	L_DoStrings40
NOP	
L__DoStrings162:
SEH	R3, R5
ORI	R2, R0, 14
BNE	R3, R2, L__DoStrings164
NOP	
J	L_DoStrings41
NOP	
L__DoStrings164:
SEH	R3, R5
ORI	R2, R0, 15
BNE	R3, R2, L__DoStrings166
NOP	
J	L_DoStrings42
NOP	
L__DoStrings166:
SEH	R3, R5
; res1 end address is: 20 (R5)
ORI	R2, R0, 16
BNE	R3, R2, L__DoStrings168
NOP	
J	L_DoStrings43
NOP	
L__DoStrings168:
J	L_DoStrings44
NOP	
L_DoStrings3:
;String.c,147 :: 		strncat(writebuff,str,strlen(str));
LW	R25, 20(SP)
JAL	_strlen+0
NOP	
SEH	R27, R2
LW	R26, 20(SP)
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncat+0
NOP	
;String.c,148 :: 		while(!HID_Write(&writebuff,64));
L_DoStrings45:
SH	R25, 16(SP)
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
LH	R25, 16(SP)
BEQ	R2, R0, L__DoStrings169
NOP	
J	L_DoStrings46
NOP	
L__DoStrings169:
J	L_DoStrings45
NOP	
L_DoStrings46:
;String.c,152 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,153 :: 		}
;String.c,152 :: 		return 0;
;String.c,153 :: 		}
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
;String.c,158 :: 		void clr_str_arrays(char str[20][64]){
;String.c,160 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_clr_str_arrays47:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__clr_str_arrays171
NOP	
J	L_clr_str_arrays48
NOP	
L__clr_str_arrays171:
;String.c,161 :: 		for(j = 0;j<64;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_clr_str_arrays50:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 64
BNE	R2, R0, L__clr_str_arrays172
NOP	
J	L_clr_str_arrays51
NOP	
L__clr_str_arrays172:
;String.c,162 :: 		str[i][j] = 0;
SEH	R2, R4
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R5
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,161 :: 		for(j = 0;j<64;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,163 :: 		}
; j end address is: 20 (R5)
J	L_clr_str_arrays50
NOP	
L_clr_str_arrays51:
;String.c,160 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,165 :: 		}
; i end address is: 16 (R4)
J	L_clr_str_arrays47
NOP	
L_clr_str_arrays48:
;String.c,166 :: 		}
L_end_clr_str_arrays:
JR	RA
NOP	
; end of _clr_str_arrays
_setstr:
;String.c,171 :: 		char* setstr(char conf[250]){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;String.c,173 :: 		for(i=0;i < strlen(conf);i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_setstr53:
; i start address is: 20 (R5)
JAL	_strlen+0
NOP	
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__setstr174
NOP	
J	L_setstr54
NOP	
L__setstr174:
;String.c,174 :: 		if(conf[i] == NULL)
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__setstr175
NOP	
J	L_setstr56
NOP	
L__setstr175:
;String.c,175 :: 		break;
J	L_setstr54
NOP	
L_setstr56:
;String.c,173 :: 		for(i=0;i < strlen(conf);i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,176 :: 		}
J	L_setstr53
NOP	
L_setstr54:
;String.c,177 :: 		conf[i+1] = 0;
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
SEH	R2, R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;String.c,179 :: 		return conf;
MOVZ	R2, R25, R0
;String.c,180 :: 		}
L_end_setstr:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _setstr
_strsplit:
;String.c,185 :: 		int strsplit(char str[250], char c){
;String.c,187 :: 		ii=kk=0;
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,188 :: 		for (i = 0; i < 250;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 24 (R6)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
L_strsplit57:
; i start address is: 16 (R4)
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
SEH	R2, R4
SLTI	R2, R2, 250
BNE	R2, R0, L__strsplit177
NOP	
J	L_strsplit58
NOP	
L__strsplit177:
;String.c,189 :: 		if(str[i] == c){
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R26, 255
BEQ	R3, R2, L__strsplit178
NOP	
J	L_strsplit60
NOP	
L__strsplit178:
;String.c,190 :: 		string[kk][ii] = 0;
SEH	R2, R5
SLL	R3, R2, 6
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
ADDU	R3, R2, R3
SEH	R2, R6
; ii end address is: 24 (R6)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,191 :: 		kk++;
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,192 :: 		ii=0;
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,193 :: 		continue;//goto endb;
J	L_strsplit59
NOP	
;String.c,194 :: 		}else{
L_strsplit60:
;String.c,195 :: 		string[kk][ii] = str[i];
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
;String.c,196 :: 		ii++;
ADDIU	R2, R6, 1
; ii end address is: 24 (R6)
; ii start address is: 12 (R3)
SEH	R3, R2
;String.c,199 :: 		if(str[i]==0)
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit179
NOP	
J	L_strsplit62
NOP	
L__strsplit179:
; ii end address is: 12 (R3)
; i end address is: 16 (R4)
;String.c,200 :: 		break;
J	L_strsplit58
NOP	
L_strsplit62:
;String.c,201 :: 		}
; i start address is: 16 (R4)
; ii start address is: 12 (R3)
; kk end address is: 20 (R5)
SEH	R6, R3
L_strsplit59:
; ii end address is: 12 (R3)
;String.c,188 :: 		for (i = 0; i < 250;i++){
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,201 :: 		}
; ii end address is: 24 (R6)
; i end address is: 16 (R4)
J	L_strsplit57
NOP	
L_strsplit58:
;String.c,202 :: 		return kk;
SEH	R2, R5
; kk end address is: 20 (R5)
;String.c,203 :: 		}
L_end_strsplit:
JR	RA
NOP	
; end of _strsplit
_strsplit2:
;String.c,208 :: 		void strsplit2(char**mdarr,char str[250], char c){
;String.c,210 :: 		ii=kk=0;
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,211 :: 		for (i = 0; i < 250;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; ii end address is: 24 (R6)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
L_strsplit263:
; i start address is: 16 (R4)
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
SEH	R2, R4
SLTI	R2, R2, 250
BNE	R2, R0, L__strsplit2181
NOP	
J	L_strsplit264
NOP	
L__strsplit2181:
;String.c,212 :: 		if(str[i] == c){
SEH	R2, R4
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BEQ	R3, R2, L__strsplit2182
NOP	
J	L_strsplit266
NOP	
L__strsplit2182:
;String.c,213 :: 		mdarr[kk][ii] = 0;
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R25, R2
LW	R3, 0(R2)
SEH	R2, R6
; ii end address is: 24 (R6)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,214 :: 		kk++;
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,215 :: 		ii=0;
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,216 :: 		continue;//goto endb;
J	L_strsplit265
NOP	
;String.c,217 :: 		}else{
L_strsplit266:
;String.c,218 :: 		mdarr[kk][ii] = str[i];
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R25, R2
LW	R3, 0(R2)
SEH	R2, R6
ADDU	R3, R3, R2
SEH	R2, R4
ADDU	R2, R26, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,219 :: 		ii++;
ADDIU	R2, R6, 1
; ii end address is: 24 (R6)
; ii start address is: 12 (R3)
SEH	R3, R2
;String.c,222 :: 		if(str[i]==0)
SEH	R2, R4
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit2183
NOP	
J	L_strsplit268
NOP	
L__strsplit2183:
; ii end address is: 12 (R3)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
;String.c,223 :: 		break;
J	L_strsplit264
NOP	
L_strsplit268:
;String.c,224 :: 		}
; i start address is: 16 (R4)
; kk start address is: 20 (R5)
; ii start address is: 12 (R3)
; kk end address is: 20 (R5)
SEH	R6, R3
L_strsplit265:
; ii end address is: 12 (R3)
;String.c,211 :: 		for (i = 0; i < 250;i++){
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,224 :: 		}
; ii end address is: 24 (R6)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
J	L_strsplit263
NOP	
L_strsplit264:
;String.c,226 :: 		}
L_end_strsplit2:
JR	RA
NOP	
; end of _strsplit2
_findnumber:
;String.c,231 :: 		char* findnumber(char* str){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;String.c,235 :: 		temp = (char*)Malloc(strlen(str));
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
;String.c,237 :: 		for(i = 0;i < strlen(str);i++){
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
BNE	R2, R0, L__findnumber185
NOP	
J	L_findnumber70
NOP	
L__findnumber185:
;String.c,238 :: 		if((str[i] > 0x29)&& (str[i] < 0x40)){
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 42
BEQ	R2, R0, L__findnumber186
NOP	
J	L__findnumber127
NOP	
L__findnumber186:
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 64
BNE	R2, R0, L__findnumber187
NOP	
J	L__findnumber126
NOP	
L__findnumber187:
L__findnumber125:
;String.c,239 :: 		temp[i] = str[i];
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,238 :: 		if((str[i] > 0x29)&& (str[i] < 0x40)){
L__findnumber127:
L__findnumber126:
;String.c,237 :: 		for(i = 0;i < strlen(str);i++){
ADDIU	R2, R9, 1
SEH	R9, R2
;String.c,241 :: 		}
J	L_findnumber69
NOP	
L_findnumber70:
;String.c,242 :: 		temp[i] = 0;
SEH	R2, R9
; i end address is: 36 (R9)
ADDU	R2, R8, R2
SB	R0, 0(R2)
;String.c,243 :: 		Free(temp,sizeof(temp));
SW	R25, 8(SP)
ORI	R26, R0, 4
MOVZ	R25, R8, R0
JAL	_Free+0
NOP	
LW	R25, 8(SP)
;String.c,244 :: 		return temp;
MOVZ	R2, R8, R0
; temp end address is: 32 (R8)
;String.c,245 :: 		}
;String.c,244 :: 		return temp;
;String.c,245 :: 		}
L_end_findnumber:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _findnumber
_StrChecker:
;String.c,251 :: 		int StrChecker(char *str){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,255 :: 		if(!once){
SW	R26, 4(SP)
SW	R27, 8(SP)
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
EXT	R2, R2, BitPos(StrChecker_once_L0+0), 1
BEQ	R2, R0, L__StrChecker189
NOP	
J	L_StrChecker75
NOP	
L__StrChecker189:
;String.c,256 :: 		once = 1;
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
ORI	R2, R2, BitMask(StrChecker_once_L0+0)
SB	R2, Offset(StrChecker_once_L0+0)(GP)
;String.c,257 :: 		enum_val = enum_num;
ORI	R2, R0, 17
SH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
;String.c,258 :: 		}
L_StrChecker75:
;String.c,259 :: 		for(i = 0;i < enum_val;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_StrChecker76:
; i start address is: 20 (R5)
SEH	R3, R5
LH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__StrChecker190
NOP	
J	L_StrChecker77
NOP	
L__StrChecker190:
;String.c,260 :: 		if(strncmp(str,com[i],strlen(str)-1)==0)
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
BEQ	R2, R0, L__StrChecker191
NOP	
J	L_StrChecker79
NOP	
L__StrChecker191:
;String.c,261 :: 		break;
J	L_StrChecker77
NOP	
L_StrChecker79:
;String.c,259 :: 		for(i = 0;i < enum_val;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,262 :: 		}
J	L_StrChecker76
NOP	
L_StrChecker77:
;String.c,263 :: 		return i;
SEH	R2, R5
; i end address is: 20 (R5)
;String.c,264 :: 		}
;String.c,263 :: 		return i;
;String.c,264 :: 		}
L_end_StrChecker:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _StrChecker
_WriteData:
;String.c,269 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;String.c,272 :: 		memset(writebuff,0,64);
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
;String.c,273 :: 		strncpy(writebuff,_data,strlen(_data));
JAL	_strlen+0
NOP	
SEH	R27, R2
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncpy+0
NOP	
;String.c,274 :: 		HID_Write(&writebuff,64);
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
;String.c,275 :: 		}
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
;String.c,280 :: 		char* Read_Send_AllColour(short data_src){
ADDIU	SP, SP, -156
SW	RA, 0(SP)
;String.c,288 :: 		TCS3472_getRawData(RawData);
SW	R25, 4(SP)
SW	R26, 8(SP)
SB	R25, 12(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 12(SP)
;String.c,289 :: 		if(data_src)
BNE	R25, R0, L__Read_Send_AllColour195
NOP	
J	L_Read_Send_AllColour80
NOP	
L__Read_Send_AllColour195:
;String.c,290 :: 		GetScaledValues(RawData,&FltData);
ADDIU	R2, SP, 16
SB	R25, 12(SP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_GetScaledValues+0
NOP	
LB	R25, 12(SP)
L_Read_Send_AllColour80:
;String.c,292 :: 		strcpy(str,"C || R | G | B | = || ");
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
;String.c,293 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour196
NOP	
J	L_Read_Send_AllColour81
NOP	
L__Read_Send_AllColour196:
;String.c,294 :: 		sprintf(txtR,"%u",RawData[0]); //C
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
;String.c,296 :: 		sprintf(txtR,"%3.2f",FltData[0]); //R
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
;String.c,297 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,298 :: 		strcat(str," || ");
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
;String.c,300 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour197
NOP	
J	L_Read_Send_AllColour83
NOP	
L__Read_Send_AllColour197:
;String.c,301 :: 		sprintf(txtR,"%u",RawData[1]);  //R
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
;String.c,303 :: 		sprintf(txtR,"%3.2f",FltData[1]); //G
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
;String.c,304 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,305 :: 		strcat(str," | ");
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
;String.c,307 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour198
NOP	
J	L_Read_Send_AllColour85
NOP	
L__Read_Send_AllColour198:
;String.c,308 :: 		sprintf(txtR,"%u",RawData[2]);  //G
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
;String.c,310 :: 		sprintf(txtR,"%3.2f",FltData[2]);  //B
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
;String.c,311 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,312 :: 		strcat(str," | ");
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
;String.c,314 :: 		if(!data_src ) {
BEQ	R25, R0, L__Read_Send_AllColour199
NOP	
J	L_Read_Send_AllColour87
NOP	
L__Read_Send_AllColour199:
;String.c,315 :: 		sprintf(txtR,"%u",RawData[3]);  //ERR
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
;String.c,316 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,317 :: 		strcat(str," || ");
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
;String.c,319 :: 		err = TCS3472_C2RGB_Error(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_C2RGB_Error+0
NOP	
;String.c,320 :: 		sprintf(txtR,"%5d",err);
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
;String.c,321 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,322 :: 		}
L_Read_Send_AllColour87:
;String.c,323 :: 		strcat(str," ||\r\n");
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
;String.c,325 :: 		return &str;
ADDIU	R2, SP, 43
;String.c,326 :: 		}
;String.c,325 :: 		return &str;
;String.c,326 :: 		}
L_end_Read_Send_AllColour:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 156
JR	RA
NOP	
; end of _Read_Send_AllColour
_Read_Send_OneColour:
;String.c,331 :: 		char* Read_Send_OneColour(int colr){
ADDIU	SP, SP, -180
SW	RA, 0(SP)
;String.c,335 :: 		switch(colr){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Read_Send_OneColour88
NOP	
;String.c,336 :: 		case READR:
L_Read_Send_OneColour90:
;String.c,337 :: 		col = TCS3472_Read16(TCS3472_RDATAL);
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,338 :: 		strcpy(str,"R = || ");
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
;String.c,339 :: 		sprintf(txtR,"%5u",col);
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
;String.c,340 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,341 :: 		strcat(str," ||\r\n");
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
;String.c,342 :: 		break;
J	L_Read_Send_OneColour89
NOP	
;String.c,343 :: 		case READG:
L_Read_Send_OneColour91:
;String.c,344 :: 		col = TCS3472_Read16(TCS3472_GDATAL);
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,345 :: 		strcpy(str,"G = || ");
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
;String.c,346 :: 		sprintf(txtR,"%5u",col);
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
;String.c,347 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,348 :: 		strcat(str," ||\r\n");
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
;String.c,349 :: 		break;
J	L_Read_Send_OneColour89
NOP	
;String.c,350 :: 		case READB:
L_Read_Send_OneColour92:
;String.c,351 :: 		col = TCS3472_Read16(TCS3472_BDATAL);
ORI	R25, R0, 26
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,352 :: 		strcpy(str,"B = || ");
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
;String.c,353 :: 		sprintf(txtR,"%u",col);
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
;String.c,354 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,355 :: 		strcat(str," ||\r\n");
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
;String.c,356 :: 		break;
J	L_Read_Send_OneColour89
NOP	
;String.c,357 :: 		case READC:
L_Read_Send_OneColour93:
;String.c,358 :: 		col = TCS3472_Read16(TCS3472_CDATAL);
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,359 :: 		strcpy(str,"C = || ");
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
;String.c,360 :: 		sprintf(txtR,"%u",col);
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
;String.c,361 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,362 :: 		strcat(str," ||\r\n");
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
;String.c,363 :: 		break;
J	L_Read_Send_OneColour89
NOP	
;String.c,364 :: 		case READT:
L_Read_Send_OneColour94:
;String.c,365 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,366 :: 		col = TCS3472_CalcColTemp(RawData[1],RawData[3],RawData[3]);
LHU	R27, Offset(_RawData+6)(GP)
LHU	R26, Offset(_RawData+6)(GP)
LHU	R25, Offset(_RawData+2)(GP)
JAL	_TCS3472_CalcColTemp+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,367 :: 		strcpy(str,"T = || ");
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
;String.c,368 :: 		sprintf(txtR,"%u",col);
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
;String.c,369 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,370 :: 		strcat(str," ||\r\n");
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
;String.c,371 :: 		break;
J	L_Read_Send_OneColour89
NOP	
;String.c,372 :: 		case READT_DN40:
L_Read_Send_OneColour95:
;String.c,373 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,374 :: 		col = TCS3472_CalcColTemp_dn40(RawData,it);
LBU	R26, Offset(_it+0)(GP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_CalcColTemp_dn40+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,375 :: 		strcpy(str,"T_DN40 = || ");
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
;String.c,376 :: 		sprintf(txtR,"%u",col);
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
;String.c,377 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,378 :: 		strcat(str," ||\r\n");
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
;String.c,379 :: 		break;
J	L_Read_Send_OneColour89
NOP	
;String.c,380 :: 		}
L_Read_Send_OneColour88:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Read_Send_OneColour202
NOP	
J	L_Read_Send_OneColour90
NOP	
L__Read_Send_OneColour202:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Read_Send_OneColour204
NOP	
J	L_Read_Send_OneColour91
NOP	
L__Read_Send_OneColour204:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Read_Send_OneColour206
NOP	
J	L_Read_Send_OneColour92
NOP	
L__Read_Send_OneColour206:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Read_Send_OneColour208
NOP	
J	L_Read_Send_OneColour93
NOP	
L__Read_Send_OneColour208:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Read_Send_OneColour210
NOP	
J	L_Read_Send_OneColour94
NOP	
L__Read_Send_OneColour210:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Read_Send_OneColour212
NOP	
J	L_Read_Send_OneColour95
NOP	
L__Read_Send_OneColour212:
L_Read_Send_OneColour89:
;String.c,381 :: 		return &str;
ADDIU	R2, SP, 26
;String.c,382 :: 		}
;String.c,381 :: 		return &str;
;String.c,382 :: 		}
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
;String.c,384 :: 		int Get_It(){
;String.c,385 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,386 :: 		}
L_end_Get_It:
JR	RA
NOP	
; end of _Get_It
_Get_Gain:
;String.c,388 :: 		int Get_Gain(){
;String.c,389 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,390 :: 		}
L_end_Get_Gain:
JR	RA
NOP	
; end of _Get_Gain
_Read_Thresholds:
;String.c,395 :: 		char* Read_Thresholds(){
ADDIU	SP, SP, -144
SW	RA, 0(SP)
;String.c,400 :: 		NVMRead(FLASH_Settings_VAddr,&Threshold);
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(_Threshold+0)
ORI	R26, R26, lo_addr(_Threshold+0)
LW	R25, Offset(_FLASH_Settings_VAddr+0)(GP)
JAL	_NVMRead+0
NOP	
;String.c,402 :: 		strcpy(str,"Cth || Rth | Gth | Bth | = || ");
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
;String.c,403 :: 		sprintf(txtR,"%u",Threshold.C_thresh);
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
;String.c,404 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,405 :: 		strcat(str," || ");
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
;String.c,407 :: 		sprintf(txtR,"%u",Threshold.R_thresh);
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
;String.c,408 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,409 :: 		strcat(str," | ");
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
;String.c,411 :: 		sprintf(txtR,"%u",Threshold.G_thresh);
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
;String.c,412 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,413 :: 		strcat(str," | ");
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
;String.c,415 :: 		sprintf(txtR,"%u",Threshold.B_thresh);
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
;String.c,416 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,417 :: 		strcat(str," ||\r\n ");
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
;String.c,419 :: 		return &str;
ADDIU	R2, SP, 27
;String.c,420 :: 		}
;String.c,419 :: 		return &str;
;String.c,420 :: 		}
L_end_Read_Thresholds:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 144
JR	RA
NOP	
; end of _Read_Thresholds
_Write_Thresholds:
;String.c,425 :: 		char* Write_Thresholds(short data_src){
ADDIU	SP, SP, -616
SW	RA, 0(SP)
;String.c,431 :: 		pos =  FLASH_Settings_PAddr;
SW	R26, 4(SP)
; pos start address is: 16 (R4)
LW	R4, Offset(_FLASH_Settings_PAddr+0)(GP)
;String.c,432 :: 		for(i=1;i<128;i++)
; i start address is: 20 (R5)
ORI	R5, R0, 1
; i end address is: 20 (R5)
; pos end address is: 16 (R4)
L_Write_Thresholds96:
; i start address is: 20 (R5)
; pos start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 128
BNE	R2, R0, L__Write_Thresholds217
NOP	
J	L_Write_Thresholds97
NOP	
L__Write_Thresholds217:
;String.c,433 :: 		val[i] = 0x00000000;
ADDIU	R3, SP, 16
SEH	R2, R5
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R0, 0(R2)
;String.c,432 :: 		for(i=1;i<128;i++)
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,433 :: 		val[i] = 0x00000000;
; i end address is: 20 (R5)
J	L_Write_Thresholds96
NOP	
L_Write_Thresholds97:
;String.c,436 :: 		if(!data_src)
BEQ	R25, R0, L__Write_Thresholds218
NOP	
J	L_Write_Thresholds99
NOP	
L__Write_Thresholds218:
;String.c,437 :: 		TCS3472_getRawData(RawData);
SW	R4, 8(SP)
SB	R25, 12(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 12(SP)
LW	R4, 8(SP)
L_Write_Thresholds99:
;String.c,439 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds220
NOP	
J	L_Write_Thresholds100
NOP	
L__Write_Thresholds220:
;String.c,440 :: 		if(string[2] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
BNE	R3, R2, L__Write_Thresholds222
NOP	
J	L_Write_Thresholds101
NOP	
L__Write_Thresholds222:
;String.c,441 :: 		val[0] = atol(string[2]);
ADDIU	R2, SP, 16
SW	R2, 612(SP)
SW	R4, 8(SP)
SB	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_atol+0
NOP	
LB	R25, 12(SP)
LW	R4, 8(SP)
LW	R3, 612(SP)
SW	R2, 0(R3)
L_Write_Thresholds101:
;String.c,442 :: 		}
J	L_Write_Thresholds102
NOP	
L_Write_Thresholds100:
;String.c,444 :: 		val[0] = RawData[0];
ADDIU	R3, SP, 16
LHU	R2, Offset(_RawData+0)(GP)
SW	R2, 0(R3)
L_Write_Thresholds102:
;String.c,445 :: 		err = NVMWriteWord(pos,val[0]);
ADDIU	R2, SP, 16
SW	R4, 8(SP)
SB	R25, 12(SP)
LW	R26, 0(R2)
MOVZ	R25, R4, R0
JAL	_NVMWriteWord+0
NOP	
LB	R25, 12(SP)
LW	R4, 8(SP)
;String.c,447 :: 		pos += 4;
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
;String.c,448 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds224
NOP	
J	L_Write_Thresholds103
NOP	
L__Write_Thresholds224:
;String.c,449 :: 		if(string[3] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__Write_Thresholds226
NOP	
J	L_Write_Thresholds104
NOP	
L__Write_Thresholds226:
;String.c,450 :: 		val[1] = atol(string[3]);
ADDIU	R2, SP, 16
ADDIU	R2, R2, 4
SW	R2, 612(SP)
SW	R4, 8(SP)
SB	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atol+0
NOP	
LB	R25, 12(SP)
LW	R4, 8(SP)
LW	R3, 612(SP)
SW	R2, 0(R3)
L_Write_Thresholds104:
;String.c,451 :: 		}else
J	L_Write_Thresholds105
NOP	
L_Write_Thresholds103:
;String.c,452 :: 		val[1] = RawData[1];
ADDIU	R2, SP, 16
ADDIU	R3, R2, 4
LHU	R2, Offset(_RawData+2)(GP)
SW	R2, 0(R3)
L_Write_Thresholds105:
;String.c,453 :: 		err = NVMWriteWord(pos,val[1]);
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
;String.c,455 :: 		pos += 4;
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
;String.c,456 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds228
NOP	
J	L_Write_Thresholds106
NOP	
L__Write_Thresholds228:
;String.c,457 :: 		if(string[4] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
BNE	R3, R2, L__Write_Thresholds230
NOP	
J	L_Write_Thresholds107
NOP	
L__Write_Thresholds230:
;String.c,458 :: 		val[2] = atol(string[4]);
ADDIU	R2, SP, 16
ADDIU	R2, R2, 8
SW	R2, 612(SP)
SW	R4, 8(SP)
SB	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_atol+0
NOP	
LB	R25, 12(SP)
LW	R4, 8(SP)
LW	R3, 612(SP)
SW	R2, 0(R3)
L_Write_Thresholds107:
;String.c,459 :: 		}
J	L_Write_Thresholds108
NOP	
L_Write_Thresholds106:
;String.c,461 :: 		val[2] = RawData[2];
ADDIU	R2, SP, 16
ADDIU	R3, R2, 8
LHU	R2, Offset(_RawData+4)(GP)
SW	R2, 0(R3)
L_Write_Thresholds108:
;String.c,462 :: 		err = NVMWriteWord(pos,val[2]);
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
;String.c,464 :: 		pos += 4;
ADDIU	R2, R4, 4
; pos end address is: 16 (R4)
; pos start address is: 28 (R7)
MOVZ	R7, R2, R0
;String.c,465 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds232
NOP	
J	L_Write_Thresholds109
NOP	
L__Write_Thresholds232:
;String.c,466 :: 		if(string[5] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds234
NOP	
J	L_Write_Thresholds110
NOP	
L__Write_Thresholds234:
;String.c,467 :: 		val[3] = atol(string[5]);
ADDIU	R2, SP, 16
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
;String.c,468 :: 		}
J	L_Write_Thresholds111
NOP	
L_Write_Thresholds109:
;String.c,470 :: 		val[3] = RawData[3];
ADDIU	R2, SP, 16
ADDIU	R3, R2, 12
LHU	R2, Offset(_RawData+6)(GP)
SW	R2, 0(R3)
L_Write_Thresholds111:
;String.c,471 :: 		err = NVMWriteWord(pos,val[3]);
ADDIU	R2, SP, 16
ADDIU	R2, R2, 12
SB	R25, 8(SP)
LW	R26, 0(R2)
MOVZ	R25, R7, R0
; pos end address is: 28 (R7)
JAL	_NVMWriteWord+0
NOP	
;String.c,476 :: 		sprintf(txtR,"%x",err);
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
;String.c,477 :: 		strcpy(str,txtR);
ADDIU	R3, SP, 528
ADDIU	R2, SP, 543
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,478 :: 		strcat(str," \r\n ");
ORI	R30, R0, 32
SB	R30, 607(SP)
ORI	R30, R0, 13
SB	R30, 608(SP)
ORI	R30, R0, 10
SB	R30, 609(SP)
ORI	R30, R0, 32
SB	R30, 610(SP)
MOVZ	R30, R0, R0
SB	R30, 611(SP)
ADDIU	R3, SP, 607
ADDIU	R2, SP, 543
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 8(SP)
;String.c,479 :: 		return str;
ADDIU	R2, SP, 543
;String.c,480 :: 		}
;String.c,479 :: 		return str;
;String.c,480 :: 		}
L_end_Write_Thresholds:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 616
JR	RA
NOP	
; end of _Write_Thresholds
_testStrings:
;String.c,485 :: 		void testStrings(char* writebuff){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;String.c,486 :: 		if(strlen(string[0])!=0){
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings237
NOP	
J	L_testStrings112
NOP	
L__testStrings237:
;String.c,487 :: 		strncat(writebuff,string[0],strlen(string[0]));
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
;String.c,488 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 16(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
ADDIU	R2, SP, 16
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,489 :: 		}
L_testStrings112:
;String.c,490 :: 		if(strlen(string[1])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings239
NOP	
J	L_testStrings113
NOP	
L__testStrings239:
;String.c,491 :: 		strncat(writebuff,string[1],strlen(string[1]));
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
;String.c,492 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 18(SP)
MOVZ	R30, R0, R0
SB	R30, 19(SP)
ADDIU	R2, SP, 18
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,493 :: 		}
L_testStrings113:
;String.c,494 :: 		if(strlen(string[2])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings241
NOP	
J	L_testStrings114
NOP	
L__testStrings241:
;String.c,495 :: 		strncat(writebuff,string[2],strlen(string[2]));
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
;String.c,496 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 20(SP)
MOVZ	R30, R0, R0
SB	R30, 21(SP)
ADDIU	R2, SP, 20
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,497 :: 		}
L_testStrings114:
;String.c,498 :: 		if(strlen(string[3])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings243
NOP	
J	L_testStrings115
NOP	
L__testStrings243:
;String.c,499 :: 		strncat(writebuff,string[3],strlen(string[3]));
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
;String.c,500 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 22(SP)
MOVZ	R30, R0, R0
SB	R30, 23(SP)
ADDIU	R2, SP, 22
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,501 :: 		}
L_testStrings115:
;String.c,502 :: 		if(strlen(string[4])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings245
NOP	
J	L_testStrings116
NOP	
L__testStrings245:
;String.c,503 :: 		strncat(writebuff,string[4],strlen(string[4]));
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
;String.c,504 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 24(SP)
MOVZ	R30, R0, R0
SB	R30, 25(SP)
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,505 :: 		}
L_testStrings116:
;String.c,506 :: 		if(strlen(string[5])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings247
NOP	
J	L_testStrings117
NOP	
L__testStrings247:
;String.c,507 :: 		strncat(writebuff,string[5],strlen(string[5]));
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
;String.c,508 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
ADDIU	R2, SP, 26
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,509 :: 		}
L_testStrings117:
;String.c,510 :: 		if(strlen(string[6])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings249
NOP	
J	L_testStrings118
NOP	
L__testStrings249:
;String.c,511 :: 		strncat(writebuff,string[6],strlen(string[6]));
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
;String.c,512 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 28(SP)
MOVZ	R30, R0, R0
SB	R30, 29(SP)
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
;String.c,513 :: 		}
L_testStrings118:
;String.c,515 :: 		}
L_end_testStrings:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _testStrings
_TestFlash:
;String.c,517 :: 		char* TestFlash(){
ADDIU	SP, SP, -120
SW	RA, 0(SP)
;String.c,523 :: 		char* tr = "112233";
SW	R25, 4(SP)
SW	R26, 8(SP)
;String.c,531 :: 		Val =  ReadFlashWord();
JAL	_ReadFlashWord+0
NOP	
; Val start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,534 :: 		strcpy(str,"Val || ");
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
;String.c,535 :: 		LongWordToHex(Val,txtR);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
MOVZ	R25, R6, R0
; Val end address is: 24 (R6)
JAL	_LongWordToHex+0
NOP	
;String.c,537 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,538 :: 		strcat(str," || ");
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
;String.c,540 :: 		sprintf(txtR,"%u",res);//Threshold.R_thresh);
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
;String.c,541 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,542 :: 		strcat(str," ||\r\n ");
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
;String.c,544 :: 		return &str;
ADDIU	R2, SP, 32
;String.c,545 :: 		}
;String.c,544 :: 		return &str;
;String.c,545 :: 		}
L_end_TestFlash:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 120
JR	RA
NOP	
; end of _TestFlash
_RemoveChars:
;String.c,550 :: 		char* RemoveChars(char* str,char a,char b){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,552 :: 		int i=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;String.c,553 :: 		temp = (char*)Malloc(100*sizeof(char*));
SW	R25, 12(SP)
ORI	R25, R0, 400
JAL	_Malloc+0
NOP	
LW	R25, 12(SP)
; temp start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,556 :: 		if(a != 0x02){
ANDI	R3, R26, 255
ORI	R2, R0, 2
BNE	R3, R2, L__RemoveChars253
NOP	
J	L_RemoveChars119
NOP	
L__RemoveChars253:
; temp end address is: 24 (R6)
;String.c,557 :: 		temp = strchr(str,a);
SW	R25, 12(SP)
JAL	_strchr+0
NOP	
LW	R25, 12(SP)
; temp start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,558 :: 		strcpy(str,temp+1);
ADDIU	R2, R2, 1
MOVZ	R26, R2, R0
JAL	_strcpy+0
NOP	
;String.c,559 :: 		}else{
MOVZ	R8, R6, R0
J	L_RemoveChars120
NOP	
L_RemoveChars119:
;String.c,560 :: 		strcpy(temp,str);
SW	R25, 12(SP)
MOVZ	R26, R25, R0
MOVZ	R25, R6, R0
JAL	_strcpy+0
NOP	
; temp end address is: 24 (R6)
LW	R25, 12(SP)
MOVZ	R8, R6, R0
;String.c,561 :: 		}
L_RemoveChars120:
;String.c,562 :: 		for(i=0;i<strlen(temp)+1;i++){
; temp start address is: 32 (R8)
; i start address is: 36 (R9)
MOVZ	R9, R0, R0
; temp end address is: 32 (R8)
; i end address is: 36 (R9)
L_RemoveChars121:
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
BNE	R2, R0, L__RemoveChars254
NOP	
J	L_RemoveChars122
NOP	
L__RemoveChars254:
;String.c,563 :: 		if(temp[i]==b)
SEH	R2, R9
ADDU	R2, R8, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BEQ	R3, R2, L__RemoveChars255
NOP	
J	L_RemoveChars124
NOP	
L__RemoveChars255:
;String.c,564 :: 		break;
J	L_RemoveChars122
NOP	
L_RemoveChars124:
;String.c,565 :: 		*(temp+i) = *(str+i);
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,562 :: 		for(i=0;i<strlen(temp)+1;i++){
ADDIU	R2, R9, 1
SEH	R9, R2
;String.c,566 :: 		}
J	L_RemoveChars121
NOP	
L_RemoveChars122:
;String.c,567 :: 		*(temp+i) = 0;
SEH	R2, R9
; i end address is: 36 (R9)
ADDU	R2, R8, R2
SB	R0, 0(R2)
;String.c,569 :: 		Free(temp,100);
ORI	R26, R0, 100
MOVZ	R25, R8, R0
JAL	_Free+0
NOP	
;String.c,570 :: 		return temp;
MOVZ	R2, R8, R0
; temp end address is: 32 (R8)
;String.c,571 :: 		}
;String.c,570 :: 		return temp;
;String.c,571 :: 		}
L_end_RemoveChars:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _RemoveChars
_PrintHandler:
;String.c,576 :: 		void PrintHandler(char c){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;String.c,578 :: 		UART1_Write(c);
ANDI	R25, R25, 255
JAL	_UART1_Write+0
NOP	
;String.c,580 :: 		}
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
