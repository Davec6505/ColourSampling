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
BEQ	R2, R0, L__DoStrings118
NOP	
J	L_DoStrings0
NOP	
L__DoStrings118:
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
BEQ	R2, R0, L__DoStrings119
NOP	
J	L_DoStrings5
NOP	
L__DoStrings119:
;String.c,73 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings121
NOP	
J	L_DoStrings6
NOP	
L__DoStrings121:
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
BNE	R2, R0, L__DoStrings122
NOP	
J	L_DoStrings8
NOP	
L__DoStrings122:
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
BEQ	R2, R0, L__DoStrings123
NOP	
J	L_DoStrings12
NOP	
L__DoStrings123:
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
BNE	R2, R0, L__DoStrings124
NOP	
J	L_DoStrings14
NOP	
L__DoStrings124:
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
BEQ	R2, R0, L__DoStrings125
NOP	
J	L_DoStrings19
NOP	
L__DoStrings125:
;String.c,87 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings127
NOP	
J	L_DoStrings20
NOP	
L__DoStrings127:
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
BNE	R2, R0, L__DoStrings128
NOP	
J	L_DoStrings22
NOP	
L__DoStrings128:
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
BEQ	R2, R0, L__DoStrings129
NOP	
J	L_DoStrings26
NOP	
L__DoStrings129:
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
BNE	R2, R0, L__DoStrings130
NOP	
J	L_DoStrings28
NOP	
L__DoStrings130:
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
BNE	R2, R0, L__DoStrings132
NOP	
J	L_DoStrings4
NOP	
L__DoStrings132:
SEH	R3, R5
ORI	R2, R0, 5
BNE	R3, R2, L__DoStrings134
NOP	
J	L_DoStrings32
NOP	
L__DoStrings134:
SEH	R3, R5
ORI	R2, R0, 6
BNE	R3, R2, L__DoStrings136
NOP	
J	L_DoStrings33
NOP	
L__DoStrings136:
SEH	R3, R5
ORI	R2, R0, 7
BNE	R3, R2, L__DoStrings138
NOP	
J	L_DoStrings34
NOP	
L__DoStrings138:
SEH	R3, R5
ORI	R2, R0, 8
BNE	R3, R2, L__DoStrings140
NOP	
J	L_DoStrings35
NOP	
L__DoStrings140:
SEH	R3, R5
ORI	R2, R0, 9
BNE	R3, R2, L__DoStrings142
NOP	
J	L_DoStrings36
NOP	
L__DoStrings142:
SEH	R3, R5
ORI	R2, R0, 10
BNE	R3, R2, L__DoStrings144
NOP	
J	L_DoStrings37
NOP	
L__DoStrings144:
SEH	R3, R5
ORI	R2, R0, 11
BNE	R3, R2, L__DoStrings146
NOP	
J	L_DoStrings38
NOP	
L__DoStrings146:
SEH	R3, R5
ORI	R2, R0, 12
BNE	R3, R2, L__DoStrings148
NOP	
J	L_DoStrings39
NOP	
L__DoStrings148:
SEH	R3, R5
ORI	R2, R0, 13
BNE	R3, R2, L__DoStrings150
NOP	
J	L_DoStrings40
NOP	
L__DoStrings150:
SEH	R3, R5
ORI	R2, R0, 14
BNE	R3, R2, L__DoStrings152
NOP	
J	L_DoStrings41
NOP	
L__DoStrings152:
SEH	R3, R5
ORI	R2, R0, 15
BNE	R3, R2, L__DoStrings154
NOP	
J	L_DoStrings42
NOP	
L__DoStrings154:
SEH	R3, R5
; res1 end address is: 20 (R5)
ORI	R2, R0, 16
BNE	R3, R2, L__DoStrings156
NOP	
J	L_DoStrings43
NOP	
L__DoStrings156:
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
BEQ	R2, R0, L__DoStrings157
NOP	
J	L_DoStrings46
NOP	
L__DoStrings157:
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
BNE	R2, R0, L__clr_str_arrays159
NOP	
J	L_clr_str_arrays48
NOP	
L__clr_str_arrays159:
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
BNE	R2, R0, L__clr_str_arrays160
NOP	
J	L_clr_str_arrays51
NOP	
L__clr_str_arrays160:
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
;String.c,172 :: 		for(i=0;i < 64;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_setstr53:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 64
BNE	R2, R0, L__setstr162
NOP	
J	L_setstr54
NOP	
L__setstr162:
;String.c,173 :: 		if((conf[i] == 0x0D)|| (conf[i] == 0x0A))
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L__setstr164
NOP	
J	L__setstr115
NOP	
L__setstr164:
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L__setstr166
NOP	
J	L__setstr114
NOP	
L__setstr166:
J	L_setstr58
NOP	
L__setstr115:
L__setstr114:
;String.c,174 :: 		break;
J	L_setstr54
NOP	
L_setstr58:
;String.c,172 :: 		for(i=0;i < 64;i++){
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
;String.c,181 :: 		void remove_whitespaces(char* src){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;String.c,182 :: 		char* dst = src;
; dst start address is: 20 (R5)
MOVZ	R5, R25, R0
;String.c,185 :: 		for(i=0,j=0;i<strlen(dst);i++){
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
BNE	R2, R0, L__remove_whitespaces168
NOP	
J	L_remove_whitespaces60
NOP	
L__remove_whitespaces168:
;String.c,186 :: 		if(dst[j] == 0x32){
SEH	R2, R7
ADDU	R2, R5, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 50
BEQ	R3, R2, L__remove_whitespaces169
NOP	
J	L_remove_whitespaces62
NOP	
L__remove_whitespaces169:
;String.c,187 :: 		j++;
ADDIU	R2, R7, 1
SEH	R7, R2
;String.c,188 :: 		continue;
J	L_remove_whitespaces61
NOP	
;String.c,189 :: 		}
L_remove_whitespaces62:
;String.c,190 :: 		src[i] = dst[j];
SEH	R2, R6
ADDU	R3, R25, R2
SEH	R2, R7
ADDU	R2, R5, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
; j end address is: 28 (R7)
;String.c,191 :: 		};
L_remove_whitespaces61:
;String.c,185 :: 		for(i=0,j=0;i<strlen(dst);i++){
; j start address is: 28 (R7)
ADDIU	R2, R6, 1
SEH	R6, R2
;String.c,191 :: 		};
; dst end address is: 20 (R5)
; j end address is: 28 (R7)
J	L_remove_whitespaces59
NOP	
L_remove_whitespaces60:
;String.c,192 :: 		src[i] = 0;
SEH	R2, R6
; i end address is: 24 (R6)
ADDU	R2, R25, R2
SB	R0, 0(R2)
;String.c,193 :: 		UART1_Write_Text("White Space:= ");
SW	R25, 4(SP)
LUI	R25, hi_addr(?lstr21_String+0)
ORI	R25, R25, lo_addr(?lstr21_String+0)
JAL	_UART1_Write_Text+0
NOP	
LW	R25, 4(SP)
;String.c,194 :: 		UART1_Write_Text(src);
JAL	_UART1_Write_Text+0
NOP	
;String.c,195 :: 		UART1_Write(0x0D);
SW	R25, 4(SP)
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;String.c,196 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
LW	R25, 4(SP)
;String.c,197 :: 		}
L_end_remove_whitespaces:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _remove_whitespaces
_strsplit:
;String.c,202 :: 		int strsplit(char str[250], char c){
;String.c,204 :: 		ii=kk=0;
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,205 :: 		for (i = 0; i < 64;i++){
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
SLTI	R2, R2, 64
BNE	R2, R0, L__strsplit171
NOP	
J	L_strsplit64
NOP	
L__strsplit171:
;String.c,206 :: 		if(str[i] == c){
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R26, 255
BEQ	R3, R2, L__strsplit172
NOP	
J	L_strsplit66
NOP	
L__strsplit172:
;String.c,207 :: 		string[kk][ii] = 0;
SEH	R2, R5
SLL	R3, R2, 6
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
ADDU	R3, R2, R3
SEH	R2, R6
; ii end address is: 24 (R6)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,208 :: 		kk++;
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,209 :: 		ii=0;
; ii start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,210 :: 		continue;//goto endb;
J	L_strsplit65
NOP	
;String.c,211 :: 		}else{
L_strsplit66:
;String.c,212 :: 		string[kk][ii] = str[i];
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
;String.c,213 :: 		ii++;
ADDIU	R2, R6, 1
; ii end address is: 24 (R6)
; ii start address is: 12 (R3)
SEH	R3, R2
;String.c,216 :: 		if(str[i]==0)
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BEQ	R2, R0, L__strsplit173
NOP	
J	L_strsplit68
NOP	
L__strsplit173:
; ii end address is: 12 (R3)
; i end address is: 16 (R4)
;String.c,217 :: 		break;
J	L_strsplit64
NOP	
L_strsplit68:
;String.c,218 :: 		}
; i start address is: 16 (R4)
; ii start address is: 12 (R3)
; kk end address is: 20 (R5)
SEH	R6, R3
L_strsplit65:
; ii end address is: 12 (R3)
;String.c,205 :: 		for (i = 0; i < 64;i++){
; ii start address is: 24 (R6)
; kk start address is: 20 (R5)
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,218 :: 		}
; ii end address is: 24 (R6)
; i end address is: 16 (R4)
J	L_strsplit63
NOP	
L_strsplit64:
;String.c,219 :: 		return kk;
SEH	R2, R5
; kk end address is: 20 (R5)
;String.c,220 :: 		}
L_end_strsplit:
JR	RA
NOP	
; end of _strsplit
_StrChecker:
;String.c,227 :: 		int StrChecker(char *str){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,231 :: 		if(!once){
SW	R26, 4(SP)
SW	R27, 8(SP)
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
EXT	R2, R2, BitPos(StrChecker_once_L0+0), 1
BEQ	R2, R0, L__StrChecker175
NOP	
J	L_StrChecker69
NOP	
L__StrChecker175:
;String.c,232 :: 		once = 1;
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
ORI	R2, R2, BitMask(StrChecker_once_L0+0)
SB	R2, Offset(StrChecker_once_L0+0)(GP)
;String.c,233 :: 		enum_val = enum_num;
ORI	R2, R0, 17
SH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
;String.c,234 :: 		}
L_StrChecker69:
;String.c,235 :: 		for(i = 0;i < enum_val;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_StrChecker70:
; i start address is: 20 (R5)
SEH	R3, R5
LH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
SLT	R2, R3, R2
BNE	R2, R0, L__StrChecker176
NOP	
J	L_StrChecker71
NOP	
L__StrChecker176:
;String.c,236 :: 		if(strncmp(str,com[i],strlen(str)-1)==0)
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
BEQ	R2, R0, L__StrChecker177
NOP	
J	L_StrChecker73
NOP	
L__StrChecker177:
;String.c,237 :: 		break;
J	L_StrChecker71
NOP	
L_StrChecker73:
;String.c,235 :: 		for(i = 0;i < enum_val;i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,238 :: 		}
J	L_StrChecker70
NOP	
L_StrChecker71:
;String.c,239 :: 		return i;
SEH	R2, R5
; i end address is: 20 (R5)
;String.c,240 :: 		}
;String.c,239 :: 		return i;
;String.c,240 :: 		}
L_end_StrChecker:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _StrChecker
_WriteData:
;String.c,245 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;String.c,248 :: 		memset(writebuff,0,64);
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
;String.c,249 :: 		strncpy(writebuff,_data,strlen(_data));
JAL	_strlen+0
NOP	
SEH	R27, R2
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncpy+0
NOP	
;String.c,250 :: 		HID_Write(&writebuff,64);
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
;String.c,251 :: 		}
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
;String.c,256 :: 		char* Read_Send_AllColour(short data_src){
ADDIU	SP, SP, -108
SW	RA, 0(SP)
;String.c,264 :: 		TCS3472_getRawData(RawData);
SW	R25, 4(SP)
SW	R26, 8(SP)
SB	R25, 12(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 12(SP)
;String.c,265 :: 		if(data_src)
BNE	R25, R0, L__Read_Send_AllColour181
NOP	
J	L_Read_Send_AllColour74
NOP	
L__Read_Send_AllColour181:
;String.c,266 :: 		GetScaledValues(RawData,&FltData);
ADDIU	R2, SP, 16
SB	R25, 12(SP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_GetScaledValues+0
NOP	
LB	R25, 12(SP)
L_Read_Send_AllColour74:
;String.c,268 :: 		strcpy(str,"C || R | G | B | = || ");
ADDIU	R2, SP, 43
SB	R25, 12(SP)
LUI	R26, hi_addr(?lstr22_String+0)
ORI	R26, R26, lo_addr(?lstr22_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LB	R25, 12(SP)
;String.c,269 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour182
NOP	
J	L_Read_Send_AllColour75
NOP	
L__Read_Send_AllColour182:
;String.c,270 :: 		sprintf(txtR,"%u",RawData[0]); //C
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
J	L_Read_Send_AllColour76
NOP	
L_Read_Send_AllColour75:
;String.c,272 :: 		sprintf(txtR,"%3.2f",FltData[0]); //R
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
L_Read_Send_AllColour76:
;String.c,273 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,274 :: 		strcat(str," || ");
ADDIU	R2, SP, 43
LUI	R26, hi_addr(?lstr25_String+0)
ORI	R26, R26, lo_addr(?lstr25_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
;String.c,276 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour183
NOP	
J	L_Read_Send_AllColour77
NOP	
L__Read_Send_AllColour183:
;String.c,277 :: 		sprintf(txtR,"%u",RawData[1]);  //R
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
J	L_Read_Send_AllColour78
NOP	
L_Read_Send_AllColour77:
;String.c,279 :: 		sprintf(txtR,"%3.2f",FltData[1]); //G
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
L_Read_Send_AllColour78:
;String.c,280 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,281 :: 		strcat(str," | ");
ADDIU	R2, SP, 43
LUI	R26, hi_addr(?lstr28_String+0)
ORI	R26, R26, lo_addr(?lstr28_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
;String.c,283 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour184
NOP	
J	L_Read_Send_AllColour79
NOP	
L__Read_Send_AllColour184:
;String.c,284 :: 		sprintf(txtR,"%u",RawData[2]);  //G
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
J	L_Read_Send_AllColour80
NOP	
L_Read_Send_AllColour79:
;String.c,286 :: 		sprintf(txtR,"%3.2f",FltData[2]);  //B
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
L_Read_Send_AllColour80:
;String.c,287 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,288 :: 		strcat(str," | ");
ADDIU	R2, SP, 43
LUI	R26, hi_addr(?lstr31_String+0)
ORI	R26, R26, lo_addr(?lstr31_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
;String.c,290 :: 		if(!data_src ) {
BEQ	R25, R0, L__Read_Send_AllColour185
NOP	
J	L_Read_Send_AllColour81
NOP	
L__Read_Send_AllColour185:
;String.c,291 :: 		sprintf(txtR,"%u",RawData[3]);  //ERR
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
;String.c,292 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,293 :: 		strcat(str," || ");
ADDIU	R2, SP, 43
LUI	R26, hi_addr(?lstr33_String+0)
ORI	R26, R26, lo_addr(?lstr33_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,295 :: 		err = TCS3472_C2RGB_Error(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_C2RGB_Error+0
NOP	
;String.c,296 :: 		sprintf(txtR,"%5d",err);
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
;String.c,297 :: 		strcat(str,txtR);
ADDIU	R3, SP, 28
ADDIU	R2, SP, 43
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,298 :: 		}
L_Read_Send_AllColour81:
;String.c,299 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 43
LUI	R26, hi_addr(?lstr35_String+0)
ORI	R26, R26, lo_addr(?lstr35_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,301 :: 		return &str;
ADDIU	R2, SP, 43
;String.c,302 :: 		}
;String.c,301 :: 		return &str;
;String.c,302 :: 		}
L_end_Read_Send_AllColour:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 108
JR	RA
NOP	
; end of _Read_Send_AllColour
_Read_Send_OneColour:
;String.c,307 :: 		char* Read_Send_OneColour(int colr){
ADDIU	SP, SP, -92
SW	RA, 0(SP)
;String.c,311 :: 		switch(colr){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Read_Send_OneColour82
NOP	
;String.c,312 :: 		case READR:
L_Read_Send_OneColour84:
;String.c,313 :: 		col = TCS3472_Read16(TCS3472_RDATAL);
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,314 :: 		strcpy(str,"R = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr36_String+0)
ORI	R26, R26, lo_addr(?lstr36_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,315 :: 		sprintf(txtR,"%5u",col);
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
;String.c,316 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,317 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr38_String+0)
ORI	R26, R26, lo_addr(?lstr38_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,318 :: 		break;
J	L_Read_Send_OneColour83
NOP	
;String.c,319 :: 		case READG:
L_Read_Send_OneColour85:
;String.c,320 :: 		col = TCS3472_Read16(TCS3472_GDATAL);
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,321 :: 		strcpy(str,"G = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr39_String+0)
ORI	R26, R26, lo_addr(?lstr39_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,322 :: 		sprintf(txtR,"%5u",col);
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
;String.c,323 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,324 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr41_String+0)
ORI	R26, R26, lo_addr(?lstr41_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,325 :: 		break;
J	L_Read_Send_OneColour83
NOP	
;String.c,326 :: 		case READB:
L_Read_Send_OneColour86:
;String.c,327 :: 		col = TCS3472_Read16(TCS3472_BDATAL);
ORI	R25, R0, 26
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,328 :: 		strcpy(str,"B = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr42_String+0)
ORI	R26, R26, lo_addr(?lstr42_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,329 :: 		sprintf(txtR,"%u",col);
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
;String.c,330 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,331 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr44_String+0)
ORI	R26, R26, lo_addr(?lstr44_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,332 :: 		break;
J	L_Read_Send_OneColour83
NOP	
;String.c,333 :: 		case READC:
L_Read_Send_OneColour87:
;String.c,334 :: 		col = TCS3472_Read16(TCS3472_CDATAL);
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,335 :: 		strcpy(str,"C = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr45_String+0)
ORI	R26, R26, lo_addr(?lstr45_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,336 :: 		sprintf(txtR,"%u",col);
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
;String.c,337 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,338 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr47_String+0)
ORI	R26, R26, lo_addr(?lstr47_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,339 :: 		break;
J	L_Read_Send_OneColour83
NOP	
;String.c,340 :: 		case READT:
L_Read_Send_OneColour88:
;String.c,341 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,342 :: 		col = TCS3472_CalcColTemp(RawData[1],RawData[3],RawData[3]);
LHU	R27, Offset(_RawData+6)(GP)
LHU	R26, Offset(_RawData+6)(GP)
LHU	R25, Offset(_RawData+2)(GP)
JAL	_TCS3472_CalcColTemp+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,343 :: 		strcpy(str,"T = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr48_String+0)
ORI	R26, R26, lo_addr(?lstr48_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,344 :: 		sprintf(txtR,"%u",col);
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
;String.c,345 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,346 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr50_String+0)
ORI	R26, R26, lo_addr(?lstr50_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,347 :: 		break;
J	L_Read_Send_OneColour83
NOP	
;String.c,348 :: 		case READT_DN40:
L_Read_Send_OneColour89:
;String.c,349 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,350 :: 		col = TCS3472_CalcColTemp_dn40(RawData,it);
LBU	R26, Offset(_it+0)(GP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_CalcColTemp_dn40+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,351 :: 		strcpy(str,"T_DN40 = || ");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr51_String+0)
ORI	R26, R26, lo_addr(?lstr51_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,352 :: 		sprintf(txtR,"%u",col);
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
;String.c,353 :: 		strcat(str,txtR);
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,354 :: 		strcat(str," ||\r\n");
ADDIU	R2, SP, 26
LUI	R26, hi_addr(?lstr53_String+0)
ORI	R26, R26, lo_addr(?lstr53_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,355 :: 		break;
J	L_Read_Send_OneColour83
NOP	
;String.c,356 :: 		}
L_Read_Send_OneColour82:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Read_Send_OneColour188
NOP	
J	L_Read_Send_OneColour84
NOP	
L__Read_Send_OneColour188:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Read_Send_OneColour190
NOP	
J	L_Read_Send_OneColour85
NOP	
L__Read_Send_OneColour190:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__Read_Send_OneColour192
NOP	
J	L_Read_Send_OneColour86
NOP	
L__Read_Send_OneColour192:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__Read_Send_OneColour194
NOP	
J	L_Read_Send_OneColour87
NOP	
L__Read_Send_OneColour194:
SEH	R3, R25
ORI	R2, R0, 11
BNE	R3, R2, L__Read_Send_OneColour196
NOP	
J	L_Read_Send_OneColour88
NOP	
L__Read_Send_OneColour196:
SEH	R3, R25
ORI	R2, R0, 12
BNE	R3, R2, L__Read_Send_OneColour198
NOP	
J	L_Read_Send_OneColour89
NOP	
L__Read_Send_OneColour198:
L_Read_Send_OneColour83:
;String.c,357 :: 		return &str;
ADDIU	R2, SP, 26
;String.c,358 :: 		}
;String.c,357 :: 		return &str;
;String.c,358 :: 		}
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
;String.c,360 :: 		int Get_It(){
;String.c,361 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,362 :: 		}
L_end_Get_It:
JR	RA
NOP	
; end of _Get_It
_Get_Gain:
;String.c,364 :: 		int Get_Gain(){
;String.c,365 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,366 :: 		}
L_end_Get_Gain:
JR	RA
NOP	
; end of _Get_Gain
_Read_Thresholds:
;String.c,371 :: 		char* Read_Thresholds(){
ADDIU	SP, SP, -92
SW	RA, 0(SP)
;String.c,376 :: 		NVMRead(FLASH_Settings_VAddr,&Threshold);
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(_Threshold+0)
ORI	R26, R26, lo_addr(_Threshold+0)
LW	R25, Offset(_FLASH_Settings_VAddr+0)(GP)
JAL	_NVMRead+0
NOP	
;String.c,378 :: 		strcpy(str,"Cth || Rth | Gth | Bth | = || ");
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr54_String+0)
ORI	R26, R26, lo_addr(?lstr54_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,379 :: 		sprintf(txtR,"%u",Threshold.C_thresh);
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
;String.c,380 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,381 :: 		strcat(str," || ");
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr56_String+0)
ORI	R26, R26, lo_addr(?lstr56_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,383 :: 		sprintf(txtR,"%u",Threshold.R_thresh);
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
;String.c,384 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,385 :: 		strcat(str," | ");
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr58_String+0)
ORI	R26, R26, lo_addr(?lstr58_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,387 :: 		sprintf(txtR,"%u",Threshold.G_thresh);
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
;String.c,388 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,389 :: 		strcat(str," | ");
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr60_String+0)
ORI	R26, R26, lo_addr(?lstr60_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,391 :: 		sprintf(txtR,"%u",Threshold.B_thresh);
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
;String.c,392 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 27
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,393 :: 		strcat(str," ||\r\n ");
ADDIU	R2, SP, 27
LUI	R26, hi_addr(?lstr62_String+0)
ORI	R26, R26, lo_addr(?lstr62_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,395 :: 		return &str;
ADDIU	R2, SP, 27
;String.c,396 :: 		}
;String.c,395 :: 		return &str;
;String.c,396 :: 		}
L_end_Read_Thresholds:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 92
JR	RA
NOP	
; end of _Read_Thresholds
_Write_Thresholds:
;String.c,401 :: 		char* Write_Thresholds(short data_src){
ADDIU	SP, SP, -616
SW	RA, 0(SP)
;String.c,407 :: 		pos =  FLASH_Settings_PAddr;
SW	R26, 4(SP)
LW	R2, Offset(_FLASH_Settings_PAddr+0)(GP)
SW	R2, 524(SP)
;String.c,408 :: 		for(i=1;i<128;i++)
; i start address is: 20 (R5)
ORI	R5, R0, 1
; i end address is: 20 (R5)
SEH	R4, R5
L_Write_Thresholds90:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 128
BNE	R2, R0, L__Write_Thresholds203
NOP	
J	L_Write_Thresholds91
NOP	
L__Write_Thresholds203:
;String.c,409 :: 		val[i] = 0x00000000;
ADDIU	R3, SP, 12
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R0, 0(R2)
;String.c,408 :: 		for(i=1;i<128;i++)
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;String.c,409 :: 		val[i] = 0x00000000;
SEH	R4, R5
; i end address is: 20 (R5)
J	L_Write_Thresholds90
NOP	
L_Write_Thresholds91:
;String.c,410 :: 		err = NVMErasePage(pos);
SB	R25, 8(SP)
LW	R25, 524(SP)
JAL	_NVMErasePage+0
NOP	
LB	R25, 8(SP)
;String.c,413 :: 		if(!data_src)
BEQ	R25, R0, L__Write_Thresholds204
NOP	
J	L_Write_Thresholds93
NOP	
L__Write_Thresholds204:
;String.c,414 :: 		TCS3472_getRawData(RawData);
SB	R25, 8(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 8(SP)
L_Write_Thresholds93:
;String.c,416 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds206
NOP	
J	L_Write_Thresholds94
NOP	
L__Write_Thresholds206:
;String.c,417 :: 		if(string[2] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
BNE	R3, R2, L__Write_Thresholds208
NOP	
J	L_Write_Thresholds95
NOP	
L__Write_Thresholds208:
;String.c,418 :: 		val[0] = atol(string[2]);
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
L_Write_Thresholds95:
;String.c,419 :: 		}
J	L_Write_Thresholds96
NOP	
L_Write_Thresholds94:
;String.c,421 :: 		val[0] = RawData[0];
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+0)(GP)
SW	R2, 0(R3)
L_Write_Thresholds96:
;String.c,422 :: 		err = NVMWriteWord(pos,val[0]);
ADDIU	R2, SP, 12
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,424 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
;String.c,425 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds210
NOP	
J	L_Write_Thresholds97
NOP	
L__Write_Thresholds210:
;String.c,426 :: 		if(string[3] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__Write_Thresholds212
NOP	
J	L_Write_Thresholds98
NOP	
L__Write_Thresholds212:
;String.c,427 :: 		val[1] = atol(string[3]);
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
L_Write_Thresholds98:
;String.c,428 :: 		}else
J	L_Write_Thresholds99
NOP	
L_Write_Thresholds97:
;String.c,429 :: 		val[1] = RawData[1];
ADDIU	R2, SP, 12
ADDIU	R3, R2, 4
LHU	R2, Offset(_RawData+2)(GP)
SW	R2, 0(R3)
L_Write_Thresholds99:
;String.c,430 :: 		err = NVMWriteWord(pos,val[1]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 4
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,432 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
;String.c,433 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds214
NOP	
J	L_Write_Thresholds100
NOP	
L__Write_Thresholds214:
;String.c,434 :: 		if(string[4] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
BNE	R3, R2, L__Write_Thresholds216
NOP	
J	L_Write_Thresholds101
NOP	
L__Write_Thresholds216:
;String.c,435 :: 		val[2] = atol(string[4]);
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
L_Write_Thresholds101:
;String.c,436 :: 		}
J	L_Write_Thresholds102
NOP	
L_Write_Thresholds100:
;String.c,438 :: 		val[2] = RawData[2];
ADDIU	R2, SP, 12
ADDIU	R3, R2, 8
LHU	R2, Offset(_RawData+4)(GP)
SW	R2, 0(R3)
L_Write_Thresholds102:
;String.c,439 :: 		err = NVMWriteWord(pos,val[2]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 8
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,441 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
;String.c,442 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds218
NOP	
J	L_Write_Thresholds103
NOP	
L__Write_Thresholds218:
;String.c,443 :: 		if(string[5] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds220
NOP	
J	L_Write_Thresholds104
NOP	
L__Write_Thresholds220:
;String.c,444 :: 		val[3] = atol(string[5]);
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
L_Write_Thresholds104:
;String.c,445 :: 		}
J	L_Write_Thresholds105
NOP	
L_Write_Thresholds103:
;String.c,447 :: 		val[3] = RawData[3];
ADDIU	R2, SP, 12
ADDIU	R3, R2, 12
LHU	R2, Offset(_RawData+6)(GP)
SW	R2, 0(R3)
L_Write_Thresholds105:
;String.c,448 :: 		err = NVMWriteWord(pos,val[3]);
ADDIU	R2, SP, 12
ADDIU	R2, R2, 12
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
;String.c,453 :: 		sprintf(txtR,"%x",err);
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
;String.c,454 :: 		strcpy(str,txtR);
ADDIU	R3, SP, 528
ADDIU	R2, SP, 543
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,455 :: 		strcat(str," ||\r\n ");
ADDIU	R2, SP, 543
LUI	R26, hi_addr(?lstr64_String+0)
ORI	R26, R26, lo_addr(?lstr64_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 8(SP)
;String.c,456 :: 		return str;
ADDIU	R2, SP, 543
;String.c,457 :: 		}
;String.c,456 :: 		return str;
;String.c,457 :: 		}
L_end_Write_Thresholds:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 616
JR	RA
NOP	
; end of _Write_Thresholds
_testStrings:
;String.c,462 :: 		void testStrings(char* writebuff){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,463 :: 		if(strlen(string[0])!=0){
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings223
NOP	
J	L_testStrings106
NOP	
L__testStrings223:
;String.c,464 :: 		strncat(writebuff,string[0],strlen(string[0]));
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
;String.c,465 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr65_String+0)
ORI	R26, R26, lo_addr(?lstr65_String+0)
JAL	_strcat+0
NOP	
;String.c,466 :: 		}
L_testStrings106:
;String.c,467 :: 		if(strlen(string[1])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings225
NOP	
J	L_testStrings107
NOP	
L__testStrings225:
;String.c,468 :: 		strncat(writebuff,string[1],strlen(string[1]));
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
;String.c,469 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr66_String+0)
ORI	R26, R26, lo_addr(?lstr66_String+0)
JAL	_strcat+0
NOP	
;String.c,470 :: 		}
L_testStrings107:
;String.c,471 :: 		if(strlen(string[2])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings227
NOP	
J	L_testStrings108
NOP	
L__testStrings227:
;String.c,472 :: 		strncat(writebuff,string[2],strlen(string[2]));
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
;String.c,473 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr67_String+0)
ORI	R26, R26, lo_addr(?lstr67_String+0)
JAL	_strcat+0
NOP	
;String.c,474 :: 		}
L_testStrings108:
;String.c,475 :: 		if(strlen(string[3])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings229
NOP	
J	L_testStrings109
NOP	
L__testStrings229:
;String.c,476 :: 		strncat(writebuff,string[3],strlen(string[3]));
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
;String.c,477 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr68_String+0)
ORI	R26, R26, lo_addr(?lstr68_String+0)
JAL	_strcat+0
NOP	
;String.c,478 :: 		}
L_testStrings109:
;String.c,479 :: 		if(strlen(string[4])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings231
NOP	
J	L_testStrings110
NOP	
L__testStrings231:
;String.c,480 :: 		strncat(writebuff,string[4],strlen(string[4]));
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
;String.c,481 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr69_String+0)
ORI	R26, R26, lo_addr(?lstr69_String+0)
JAL	_strcat+0
NOP	
;String.c,482 :: 		}
L_testStrings110:
;String.c,483 :: 		if(strlen(string[5])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings233
NOP	
J	L_testStrings111
NOP	
L__testStrings233:
;String.c,484 :: 		strncat(writebuff,string[5],strlen(string[5]));
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
;String.c,485 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr70_String+0)
ORI	R26, R26, lo_addr(?lstr70_String+0)
JAL	_strcat+0
NOP	
;String.c,486 :: 		}
L_testStrings111:
;String.c,487 :: 		if(strlen(string[6])!=0){
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
BNE	R2, R0, L__testStrings235
NOP	
J	L_testStrings112
NOP	
L__testStrings235:
;String.c,488 :: 		strncat(writebuff,string[6],strlen(string[6]));
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
;String.c,489 :: 		strcat(writebuff,":");
LUI	R26, hi_addr(?lstr71_String+0)
ORI	R26, R26, lo_addr(?lstr71_String+0)
JAL	_strcat+0
NOP	
;String.c,490 :: 		}
L_testStrings112:
;String.c,492 :: 		}
L_end_testStrings:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _testStrings
_TestFlash:
;String.c,494 :: 		char* TestFlash(){
ADDIU	SP, SP, -100
SW	RA, 0(SP)
;String.c,500 :: 		char* tr = "112233";
SW	R25, 4(SP)
SW	R26, 8(SP)
;String.c,508 :: 		Val =  ReadFlash();
JAL	_ReadFlash+0
NOP	
; Val start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,511 :: 		strcpy(str,"Val || ");
ADDIU	R2, SP, 32
LUI	R26, hi_addr(?lstr73_String+0)
ORI	R26, R26, lo_addr(?lstr73_String+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,512 :: 		LongWordToHex(Val,txtR);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
MOVZ	R25, R6, R0
; Val end address is: 24 (R6)
JAL	_LongWordToHex+0
NOP	
;String.c,514 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,515 :: 		strcat(str," || ");
ADDIU	R2, SP, 32
LUI	R26, hi_addr(?lstr74_String+0)
ORI	R26, R26, lo_addr(?lstr74_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,517 :: 		sprintf(txtR,"%u",res);//Threshold.R_thresh);
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
;String.c,518 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,519 :: 		strcat(str," ||\r\n ");
ADDIU	R2, SP, 32
LUI	R26, hi_addr(?lstr76_String+0)
ORI	R26, R26, lo_addr(?lstr76_String+0)
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,521 :: 		return &str;
ADDIU	R2, SP, 32
;String.c,522 :: 		}
;String.c,521 :: 		return &str;
;String.c,522 :: 		}
L_end_TestFlash:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 100
JR	RA
NOP	
; end of _TestFlash
String____?ag:
L_end_String___?ag:
JR	RA
NOP	
; end of String____?ag
