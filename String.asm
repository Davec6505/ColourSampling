_InitString:
;String.c,43 :: 		PString InitString(char cmp){
ADDIU	SP, SP, -1356
; su_addr start address is: 8 (R2)
MOVZ	R2, R30, R0
; su_addr end address is: 8 (R2)
;String.c,47 :: 		}
L_end_InitString:
ADDIU	SP, SP, 1356
JR	RA
NOP	
; end of _InitString
_DoStrings:
;String.c,52 :: 		int DoStrings(int num){
ADDIU	SP, SP, -116
SW	RA, 0(SP)
;String.c,54 :: 		char *result,conf[64] = "";
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 49
ADDIU	R22, R23, 64
LUI	R24, hi_addr(?ICSDoStrings_conf_L0+0)
ORI	R24, R24, lo_addr(?ICSDoStrings_conf_L0+0)
JAL	___CC2DW+0
NOP	
;String.c,61 :: 		clr_str_arrays(string);     //clear the strings in the array
SH	R25, 16(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_clr_str_arrays+0
NOP	
LH	R25, 16(SP)
;String.c,62 :: 		memcpy(conf,readbuff,num);  //copy the USB buffer to a temp arrar
ADDIU	R2, SP, 49
SEH	R27, R25
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;String.c,63 :: 		result = setstr(conf);       //look for '\r' '\n' and move result to a string
ADDIU	R2, SP, 49
MOVZ	R25, R2, R0
JAL	_setstr+0
NOP	
;String.c,64 :: 		res0 = strsplit(result,'+'); //split the string into an array of strings return num of arr's
ORI	R26, R0, 43
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;String.c,65 :: 		if(res0 > 0)
SEH	R2, R2
SLTI	R2, R2, 1
<<<<<<< HEAD
BEQ	R2, R0, L__DoStrings139
NOP	
J	L_DoStrings0
NOP	
L__DoStrings139:
=======
BEQ	R2, R0, L__DoStrings147
NOP	
J	L_DoStrings0
NOP	
L__DoStrings147:
;String.c,66 :: 		res1 = StrChecker(string[1]);//Test current string index for equality return index
>>>>>>> temp
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
;String.c,68 :: 		res1 = enum_num;
; res1 start address is: 20 (R5)
ORI	R5, R0, 21
; res1 end address is: 20 (R5)
L_DoStrings1:
;String.c,69 :: 		memset(writebuff,0,64);     //empty usb write buffer
; res1 start address is: 20 (R5)
ORI	R27, R0, 64
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memset+0
NOP	
;String.c,79 :: 		switch(res1){
J	L_DoStrings2
NOP	
; res1 end address is: 20 (R5)
;String.c,80 :: 		case CONFIG :
L_DoStrings4:
;String.c,81 :: 		if(!strcmp(string[2],comc[0])){
LW	R26, Offset(_comc+0)(GP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strcmp+0
NOP	
<<<<<<< HEAD
BEQ	R2, R0, L__DoStrings140
NOP	
J	L_DoStrings5
NOP	
L__DoStrings140:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings142
NOP	
J	L_DoStrings6
NOP	
L__DoStrings142:
=======
BEQ	R2, R0, L__DoStrings148
NOP	
J	L_DoStrings5
NOP	
L__DoStrings148:
;String.c,82 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings150
NOP	
J	L_DoStrings6
NOP	
L__DoStrings150:
;String.c,83 :: 		Int_Time = atoi(string[3]);
>>>>>>> temp
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
SH	R2, 24(SP)
;String.c,84 :: 		for(i=0;i<Int_Time;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_DoStrings7:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
LH	R2, 24(SP)
SLT	R2, R3, R2
<<<<<<< HEAD
BNE	R2, R0, L__DoStrings143
NOP	
J	L_DoStrings8
NOP	
L__DoStrings143:
=======
BNE	R2, R0, L__DoStrings151
NOP	
J	L_DoStrings8
NOP	
L__DoStrings151:
;String.c,85 :: 		LATE3_bit = !LATE3_bit;
>>>>>>> temp
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,86 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_DoStrings10:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings10
NOP	
;String.c,84 :: 		for(i=0;i<Int_Time;i++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;String.c,87 :: 		}
; i end address is: 16 (R4)
J	L_DoStrings7
NOP	
L_DoStrings8:
;String.c,88 :: 		}
L_DoStrings6:
;String.c,89 :: 		err = TCS3472_SetIntergration_Time(Int_Time);
SH	R25, 16(SP)
LH	R25, 24(SP)
JAL	_TCS3472_SetIntergration_Time+0
NOP	
LH	R25, 16(SP)
; err start address is: 16 (R4)
ANDI	R4, R2, 255
;String.c,90 :: 		if(err > 0)
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
<<<<<<< HEAD
BEQ	R2, R0, L__DoStrings144
NOP	
J	L_DoStrings12
NOP	
L__DoStrings144:
=======
BEQ	R2, R0, L__DoStrings152
NOP	
J	L_DoStrings12
NOP	
L__DoStrings152:
;String.c,91 :: 		for(i=0;i<err;i++){
>>>>>>> temp
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
<<<<<<< HEAD
BNE	R2, R0, L__DoStrings145
NOP	
J	L_DoStrings14
NOP	
L__DoStrings145:
=======
BNE	R2, R0, L__DoStrings153
NOP	
J	L_DoStrings14
NOP	
L__DoStrings153:
;String.c,92 :: 		LATE3_bit = !LATE3_bit;
>>>>>>> temp
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,93 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_DoStrings16:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings16
NOP	
NOP	
NOP	
;String.c,91 :: 		for(i=0;i<err;i++){
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;String.c,94 :: 		}
; err end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_DoStrings13
NOP	
L_DoStrings14:
L_DoStrings12:
;String.c,95 :: 		}else if(!strcmp(string[2],comc[1])){
J	L_DoStrings18
NOP	
L_DoStrings5:
LW	R26, Offset(_comc+4)(GP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strcmp+0
NOP	
<<<<<<< HEAD
BEQ	R2, R0, L__DoStrings146
NOP	
J	L_DoStrings19
NOP	
L__DoStrings146:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings148
NOP	
J	L_DoStrings20
NOP	
L__DoStrings148:
=======
BEQ	R2, R0, L__DoStrings154
NOP	
J	L_DoStrings19
NOP	
L__DoStrings154:
;String.c,96 :: 		if(string[3] != 0){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__DoStrings156
NOP	
J	L_DoStrings20
NOP	
L__DoStrings156:
;String.c,97 :: 		Gain = atoi(string[3]);
>>>>>>> temp
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
SH	R2, 26(SP)
;String.c,98 :: 		for(i=0;i<Gain;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_DoStrings21:
; i start address is: 16 (R4)
ANDI	R3, R4, 255
LH	R2, 26(SP)
SLT	R2, R3, R2
<<<<<<< HEAD
BNE	R2, R0, L__DoStrings149
NOP	
J	L_DoStrings22
NOP	
L__DoStrings149:
=======
BNE	R2, R0, L__DoStrings157
NOP	
J	L_DoStrings22
NOP	
L__DoStrings157:
;String.c,99 :: 		LATE3_bit = !LATE3_bit;
>>>>>>> temp
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,100 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_DoStrings24:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings24
NOP	
;String.c,98 :: 		for(i=0;i<Gain;i++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;String.c,101 :: 		}
; i end address is: 16 (R4)
J	L_DoStrings21
NOP	
L_DoStrings22:
;String.c,102 :: 		}
L_DoStrings20:
;String.c,103 :: 		err = TCS3472_SetGain(Gain);
SH	R25, 16(SP)
LH	R25, 26(SP)
JAL	_TCS3472_SetGain+0
NOP	
LH	R25, 16(SP)
; err start address is: 16 (R4)
ANDI	R4, R2, 255
;String.c,104 :: 		if(err > 0)
ANDI	R2, R2, 255
SLTIU	R2, R2, 1
<<<<<<< HEAD
BEQ	R2, R0, L__DoStrings150
NOP	
J	L_DoStrings26
NOP	
L__DoStrings150:
=======
BEQ	R2, R0, L__DoStrings158
NOP	
J	L_DoStrings26
NOP	
L__DoStrings158:
;String.c,105 :: 		for(i=0;i<err;i++){
>>>>>>> temp
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
<<<<<<< HEAD
BNE	R2, R0, L__DoStrings151
NOP	
J	L_DoStrings28
NOP	
L__DoStrings151:
=======
BNE	R2, R0, L__DoStrings159
NOP	
J	L_DoStrings28
NOP	
L__DoStrings159:
;String.c,106 :: 		LATE3_bit = !LATE3_bit;
>>>>>>> temp
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;String.c,107 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_DoStrings30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_DoStrings30
NOP	
NOP	
NOP	
;String.c,105 :: 		for(i=0;i<err;i++){
ADDIU	R2, R5, 1
ANDI	R5, R2, 255
;String.c,108 :: 		}
; err end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_DoStrings27
NOP	
L_DoStrings28:
L_DoStrings26:
;String.c,109 :: 		}
L_DoStrings19:
L_DoStrings18:
;String.c,110 :: 		LATE3_bit = 0;
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
;String.c,111 :: 		break;
J	L_DoStrings3
NOP	
;String.c,112 :: 		case SENDA :
L_DoStrings32:
;String.c,113 :: 		break;
J	L_DoStrings3
NOP	
;String.c,114 :: 		case READA :
L_DoStrings33:
;String.c,115 :: 		str = Read_Send_AllColour(0);
MOVZ	R25, R0, R0
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, 20(SP)
;String.c,116 :: 		break;
J	L_DoStrings3
NOP	
;String.c,117 :: 		case READR :
L_DoStrings34:
;String.c,118 :: 		str = Read_Send_OneColour(READR);
ORI	R25, R0, 7
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,119 :: 		break;
J	L_DoStrings3
NOP	
;String.c,120 :: 		case READG :
L_DoStrings35:
;String.c,121 :: 		str = Read_Send_OneColour(READG);
ORI	R25, R0, 8
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,122 :: 		break;
J	L_DoStrings3
NOP	
;String.c,123 :: 		case READB :
L_DoStrings36:
;String.c,124 :: 		str = Read_Send_OneColour(READB);
ORI	R25, R0, 9
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,125 :: 		break;
J	L_DoStrings3
NOP	
;String.c,126 :: 		case READC :
L_DoStrings37:
;String.c,127 :: 		str = Read_Send_OneColour(READC);
ORI	R25, R0, 10
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,128 :: 		break;
J	L_DoStrings3
NOP	
;String.c,129 :: 		case READT :
L_DoStrings38:
;String.c,130 :: 		str = Read_Send_OneColour(READT);
ORI	R25, R0, 11
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,131 :: 		break;
J	L_DoStrings3
NOP	
;String.c,132 :: 		case READT_DN40 :
L_DoStrings39:
;String.c,133 :: 		str = Read_Send_OneColour(READT_DN40);
ORI	R25, R0, 12
JAL	_Read_Send_OneColour+0
NOP	
SW	R2, 20(SP)
;String.c,134 :: 		break;
J	L_DoStrings3
NOP	
;String.c,135 :: 		case READA_SCL :
L_DoStrings40:
;String.c,136 :: 		str = Read_Send_AllColour(1);
ORI	R25, R0, 1
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, 20(SP)
;String.c,137 :: 		break;
J	L_DoStrings3
NOP	
;String.c,138 :: 		case READA_THV :
L_DoStrings41:
;String.c,139 :: 		str =  Read_Thresholds(); //TestFlash();//
JAL	_Read_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,140 :: 		break;
J	L_DoStrings3
NOP	
;String.c,141 :: 		case WRITE_MAN :
L_DoStrings42:
;String.c,142 :: 		str = Write_Thresholds(1);
ORI	R25, R0, 1
JAL	_Write_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,143 :: 		break;
J	L_DoStrings3
NOP	
;String.c,144 :: 		case WRITE_RAW :
L_DoStrings43:
;String.c,145 :: 		str = Write_Thresholds(0);
MOVZ	R25, R0, R0
JAL	_Write_Thresholds+0
NOP	
SW	R2, 20(SP)
;String.c,146 :: 		break;
J	L_DoStrings3
NOP	
;String.c,147 :: 		case START :
L_DoStrings44:
;String.c,148 :: 		SimVars.init_inc = 5;
ORI	R2, R0, 5
SH	R2, Offset(_SimVars+2)(GP)
;String.c,149 :: 		break;
J	L_DoStrings3
NOP	
;String.c,150 :: 		case CANCEL :
L_DoStrings45:
;String.c,151 :: 		SimVars.init_inc = 3;
ORI	R2, R0, 3
SH	R2, Offset(_SimVars+2)(GP)
;String.c,152 :: 		break;
J	L_DoStrings3
NOP	
;String.c,153 :: 		case READA_HUE :
L_DoStrings46:
;String.c,154 :: 		str = ReadHUE();
JAL	_ReadHUE+0
NOP	
SW	R2, 20(SP)
;String.c,155 :: 		break;
J	L_DoStrings3
NOP	
;String.c,156 :: 		case READA_DEG :
L_DoStrings47:
<<<<<<< HEAD
ADDIU	R23, SP, 28
ADDIU	R22, R23, 21
LUI	R24, hi_addr(?ICS?lstr24_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr24_String+0)
=======
;String.c,157 :: 		LM35_Adc_Average(&ave_adc_,LM35Pin);
ORI	R26, R0, 15
LUI	R25, hi_addr(_ave_adc_+0)
ORI	R25, R25, lo_addr(_ave_adc_+0)
JAL	_LM35_Adc_Average+0
NOP	
;String.c,158 :: 		getLM35Temp(temp_,ave_adc_);
LH	R26, Offset(_ave_adc_+0)(GP)
LUI	R25, hi_addr(_temp_+0)
ORI	R25, R25, lo_addr(_temp_+0)
JAL	_getLM35Temp+0
NOP	
;String.c,159 :: 		ave_adc_ = 0;
SH	R0, Offset(_ave_adc_+0)(GP)
;String.c,160 :: 		sprintf(txt_,"%3.2f",temp_[1]);
LW	R2, Offset(_temp_+4)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_25_String+0)
ORI	R2, R2, lo_addr(?lstr_25_String+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txt_+0)
ORI	R2, R2, lo_addr(_txt_+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,161 :: 		str = txt_;
LUI	R2, hi_addr(_txt_+0)
ORI	R2, R2, lo_addr(_txt_+0)
SW	R2, 20(SP)
;String.c,164 :: 		break;
J	L_DoStrings3
NOP	
;String.c,165 :: 		default:
L_DoStrings48:
;String.c,166 :: 		str = "No data requested!\r\n";
ADDIU	R23, SP, 28
ADDIU	R22, R23, 21
LUI	R24, hi_addr(?ICS?lstr26_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr26_String+0)
>>>>>>> temp
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 28
SW	R2, 20(SP)
;String.c,167 :: 		break;
J	L_DoStrings3
NOP	
;String.c,168 :: 		}
L_DoStrings2:
; res1 start address is: 20 (R5)
SEH	R2, R5
<<<<<<< HEAD
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
=======
BNE	R2, R0, L__DoStrings161
NOP	
J	L_DoStrings4
NOP	
L__DoStrings161:
SEH	R3, R5
ORI	R2, R0, 5
BNE	R3, R2, L__DoStrings163
NOP	
J	L_DoStrings32
NOP	
L__DoStrings163:
SEH	R3, R5
ORI	R2, R0, 6
BNE	R3, R2, L__DoStrings165
NOP	
J	L_DoStrings33
NOP	
L__DoStrings165:
SEH	R3, R5
ORI	R2, R0, 7
BNE	R3, R2, L__DoStrings167
NOP	
J	L_DoStrings34
NOP	
L__DoStrings167:
SEH	R3, R5
ORI	R2, R0, 8
BNE	R3, R2, L__DoStrings169
NOP	
J	L_DoStrings35
NOP	
L__DoStrings169:
SEH	R3, R5
ORI	R2, R0, 9
BNE	R3, R2, L__DoStrings171
NOP	
J	L_DoStrings36
NOP	
L__DoStrings171:
SEH	R3, R5
ORI	R2, R0, 10
BNE	R3, R2, L__DoStrings173
NOP	
J	L_DoStrings37
NOP	
L__DoStrings173:
SEH	R3, R5
ORI	R2, R0, 11
BNE	R3, R2, L__DoStrings175
NOP	
J	L_DoStrings38
NOP	
L__DoStrings175:
SEH	R3, R5
ORI	R2, R0, 12
BNE	R3, R2, L__DoStrings177
NOP	
J	L_DoStrings39
NOP	
L__DoStrings177:
SEH	R3, R5
ORI	R2, R0, 13
BNE	R3, R2, L__DoStrings179
NOP	
J	L_DoStrings40
NOP	
L__DoStrings179:
SEH	R3, R5
ORI	R2, R0, 14
BNE	R3, R2, L__DoStrings181
NOP	
J	L_DoStrings41
NOP	
L__DoStrings181:
SEH	R3, R5
ORI	R2, R0, 15
BNE	R3, R2, L__DoStrings183
NOP	
J	L_DoStrings42
NOP	
L__DoStrings183:
SEH	R3, R5
ORI	R2, R0, 16
BNE	R3, R2, L__DoStrings185
NOP	
J	L_DoStrings43
NOP	
L__DoStrings185:
SEH	R3, R5
ORI	R2, R0, 17
BNE	R3, R2, L__DoStrings187
NOP	
J	L_DoStrings44
NOP	
L__DoStrings187:
SEH	R3, R5
ORI	R2, R0, 18
BNE	R3, R2, L__DoStrings189
NOP	
J	L_DoStrings45
NOP	
L__DoStrings189:
>>>>>>> temp
SEH	R3, R5
; res1 end address is: 20 (R5)
ORI	R2, R0, 19
<<<<<<< HEAD
BNE	R3, R2, L__DoStrings183
NOP	
J	L_DoStrings46
NOP	
L__DoStrings183:
J	L_DoStrings47
NOP	
=======
BNE	R3, R2, L__DoStrings191
NOP	
J	L_DoStrings46
NOP	
L__DoStrings191:
SEH	R3, R5
; res1 end address is: 20 (R5)
ORI	R2, R0, 20
BNE	R3, R2, L__DoStrings193
NOP	
J	L_DoStrings47
NOP	
L__DoStrings193:
J	L_DoStrings48
NOP	
>>>>>>> temp
L_DoStrings3:
;String.c,172 :: 		strncat(writebuff,str,strlen(str));
LW	R25, 20(SP)
JAL	_strlen+0
NOP	
SEH	R27, R2
LW	R26, 20(SP)
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncat+0
NOP	
<<<<<<< HEAD
L_DoStrings48:
=======
;String.c,173 :: 		while(!HID_Write(&writebuff,64));
L_DoStrings49:
>>>>>>> temp
SH	R25, 16(SP)
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
LH	R25, 16(SP)
<<<<<<< HEAD
BEQ	R2, R0, L__DoStrings184
NOP	
J	L_DoStrings49
NOP	
L__DoStrings184:
J	L_DoStrings48
NOP	
L_DoStrings49:
=======
BEQ	R2, R0, L__DoStrings194
NOP	
J	L_DoStrings50
NOP	
L__DoStrings194:
J	L_DoStrings49
NOP	
L_DoStrings50:
;String.c,178 :: 		return 0;
>>>>>>> temp
MOVZ	R2, R0, R0
;String.c,179 :: 		}
;String.c,178 :: 		return 0;
;String.c,179 :: 		}
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
;String.c,184 :: 		void clr_str_arrays(char str[size][str_size]){
;String.c,186 :: 		for(i = 0;i < 20;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
<<<<<<< HEAD
L_clr_str_arrays50:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__clr_str_arrays186
NOP	
J	L_clr_str_arrays51
NOP	
L__clr_str_arrays186:
=======
L_clr_str_arrays51:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 20
BNE	R2, R0, L__clr_str_arrays196
NOP	
J	L_clr_str_arrays52
NOP	
L__clr_str_arrays196:
;String.c,187 :: 		for(j = 0;j<64;j++){
>>>>>>> temp
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
<<<<<<< HEAD
L_clr_str_arrays53:
=======
L_clr_str_arrays54:
>>>>>>> temp
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 64
<<<<<<< HEAD
BNE	R2, R0, L__clr_str_arrays187
NOP	
J	L_clr_str_arrays54
NOP	
L__clr_str_arrays187:
=======
BNE	R2, R0, L__clr_str_arrays197
NOP	
J	L_clr_str_arrays55
NOP	
L__clr_str_arrays197:
;String.c,188 :: 		str[i][j] = 0;
>>>>>>> temp
SEH	R2, R4
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R5
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,187 :: 		for(j = 0;j<64;j++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,189 :: 		}
; j end address is: 20 (R5)
<<<<<<< HEAD
J	L_clr_str_arrays53
NOP	
L_clr_str_arrays54:
ADDIU	R2, R4, 1
SEH	R4, R2
; i end address is: 16 (R4)
J	L_clr_str_arrays50
NOP	
L_clr_str_arrays51:
=======
J	L_clr_str_arrays54
NOP	
L_clr_str_arrays55:
;String.c,186 :: 		for(i = 0;i < 20;i++){
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,191 :: 		}
; i end address is: 16 (R4)
J	L_clr_str_arrays51
NOP	
L_clr_str_arrays52:
;String.c,192 :: 		}
>>>>>>> temp
L_end_clr_str_arrays:
JR	RA
NOP	
; end of _clr_str_arrays
_setstr:
;String.c,197 :: 		char* setstr(char conf[250]){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;String.c,199 :: 		for(i=0;i < strlen(conf);i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
<<<<<<< HEAD
L_setstr56:
=======
L_setstr57:
>>>>>>> temp
; i start address is: 20 (R5)
JAL	_strlen+0
NOP	
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
<<<<<<< HEAD
BNE	R2, R0, L__setstr189
NOP	
J	L_setstr57
NOP	
L__setstr189:
=======
BNE	R2, R0, L__setstr199
NOP	
J	L_setstr58
NOP	
L__setstr199:
;String.c,200 :: 		if(conf[i] == '\0')
>>>>>>> temp
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
<<<<<<< HEAD
BEQ	R2, R0, L__setstr190
NOP	
J	L_setstr59
NOP	
L__setstr190:
J	L_setstr57
NOP	
L_setstr59:
ADDIU	R2, R5, 1
SEH	R5, R2
J	L_setstr56
NOP	
L_setstr57:
ADDIU	R2, R5, 1
=======
BEQ	R2, R0, L__setstr200
NOP	
J	L_setstr60
NOP	
L__setstr200:
;String.c,201 :: 		break;
J	L_setstr58
NOP	
L_setstr60:
;String.c,199 :: 		for(i=0;i < strlen(conf);i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,202 :: 		}
J	L_setstr57
NOP	
L_setstr58:
;String.c,203 :: 		conf[i] = 0;
SEH	R2, R5
>>>>>>> temp
; i end address is: 20 (R5)
SEH	R2, R2
ADDU	R2, R25, R2
SB	R0, 0(R2)
;String.c,205 :: 		return conf;
MOVZ	R2, R25, R0
;String.c,206 :: 		}
L_end_setstr:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _setstr
_strsplit:
;String.c,211 :: 		int strsplit(char str[250], char c){
;String.c,213 :: 		ii=kk=err=lasti=0;
; lasti start address is: 24 (R6)
MOVZ	R6, R0, R0
; kk start address is: 20 (R5)
MOVZ	R5, R0, R0
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;String.c,214 :: 		for (i = 0; i < 250;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
; i end address is: 16 (R4)
<<<<<<< HEAD
L_strsplit60:
=======
L_strsplit61:
>>>>>>> temp
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
; lasti start address is: 24 (R6)
SEH	R2, R4
SLTI	R2, R2, 250
<<<<<<< HEAD
BNE	R2, R0, L__strsplit192
NOP	
J	L_strsplit61
NOP	
L__strsplit192:
=======
BNE	R2, R0, L__strsplit202
NOP	
J	L_strsplit62
NOP	
L__strsplit202:
;String.c,215 :: 		err = i - lasti;
>>>>>>> temp
SUBU	R2, R4, R6
; err start address is: 32 (R8)
SEH	R8, R2
;String.c,216 :: 		if(str[i] == c || err > 62){
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R26, 255
<<<<<<< HEAD
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
=======
BNE	R3, R2, L__strsplit204
NOP	
J	L__strsplit141
NOP	
L__strsplit204:
SEH	R2, R8
; err end address is: 32 (R8)
SLTI	R2, R2, 63
BNE	R2, R0, L__strsplit205
NOP	
J	L__strsplit140
NOP	
L__strsplit205:
J	L_strsplit66
NOP	
; lasti end address is: 24 (R6)
L__strsplit141:
L__strsplit140:
;String.c,217 :: 		string[kk][ii] = 0;
>>>>>>> temp
SEH	R2, R5
SLL	R3, R2, 6
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
ADDU	R3, R2, R3
SEH	R2, R7
; ii end address is: 28 (R7)
ADDU	R2, R3, R2
SB	R0, 0(R2)
;String.c,218 :: 		kk++;
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,219 :: 		ii=err=0;
; ii start address is: 28 (R7)
MOVZ	R7, R0, R0
;String.c,220 :: 		lasti = i;
; lasti start address is: 24 (R6)
SEH	R6, R4
<<<<<<< HEAD
J	L_strsplit62
NOP	
L_strsplit65:
=======
;String.c,221 :: 		continue;//goto endb;
J	L_strsplit63
NOP	
;String.c,222 :: 		}else{
L_strsplit66:
;String.c,223 :: 		string[kk][ii] = str[i];
>>>>>>> temp
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
;String.c,224 :: 		ii++;
ADDIU	R2, R7, 1
SEH	R7, R2
;String.c,227 :: 		if(str[i]==0)
SEH	R2, R4
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
<<<<<<< HEAD
BEQ	R2, R0, L__strsplit196
NOP	
J	L_strsplit67
NOP	
L__strsplit196:
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
J	L_strsplit61
NOP	
L_strsplit67:
=======
BEQ	R2, R0, L__strsplit206
NOP	
J	L_strsplit68
NOP	
L__strsplit206:
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
;String.c,228 :: 		break;
J	L_strsplit62
NOP	
L_strsplit68:
;String.c,229 :: 		}
>>>>>>> temp
; i start address is: 16 (R4)
; ii start address is: 28 (R7)
; lasti start address is: 24 (R6)
; ii end address is: 28 (R7)
; kk end address is: 20 (R5)
<<<<<<< HEAD
L_strsplit62:
=======
L_strsplit63:
>>>>>>> temp
; lasti end address is: 24 (R6)
;String.c,214 :: 		for (i = 0; i < 250;i++){
; lasti start address is: 24 (R6)
; ii start address is: 28 (R7)
; kk start address is: 20 (R5)
ADDIU	R2, R4, 1
SEH	R4, R2
;String.c,229 :: 		}
; lasti end address is: 24 (R6)
; ii end address is: 28 (R7)
; i end address is: 16 (R4)
<<<<<<< HEAD
J	L_strsplit60
NOP	
L_strsplit61:
=======
J	L_strsplit61
NOP	
L_strsplit62:
;String.c,230 :: 		return kk;
>>>>>>> temp
SEH	R2, R5
; kk end address is: 20 (R5)
;String.c,231 :: 		}
L_end_strsplit:
JR	RA
NOP	
; end of _strsplit
_findnumber:
;String.c,236 :: 		char* findnumber(char* str){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;String.c,240 :: 		temp = (char*)Malloc(strlen(str));
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
;String.c,242 :: 		for(i = 0;i < strlen(str);i++){
; i start address is: 36 (R9)
MOVZ	R9, R0, R0
; temp end address is: 32 (R8)
; i end address is: 36 (R9)
<<<<<<< HEAD
L_findnumber68:
=======
L_findnumber69:
>>>>>>> temp
; i start address is: 36 (R9)
; temp start address is: 32 (R8)
JAL	_strlen+0
NOP	
SEH	R3, R9
SEH	R2, R2
SLT	R2, R3, R2
<<<<<<< HEAD
BNE	R2, R0, L__findnumber198
NOP	
J	L_findnumber69
NOP	
L__findnumber198:
=======
BNE	R2, R0, L__findnumber208
NOP	
J	L_findnumber70
NOP	
L__findnumber208:
;String.c,243 :: 		if((str[i] > 0x29)&& (str[i] < 0x40)){
>>>>>>> temp
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 42
<<<<<<< HEAD
BEQ	R2, R0, L__findnumber199
NOP	
J	L__findnumber136
NOP	
L__findnumber199:
=======
BEQ	R2, R0, L__findnumber209
NOP	
J	L__findnumber144
NOP	
L__findnumber209:
>>>>>>> temp
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 64
<<<<<<< HEAD
BNE	R2, R0, L__findnumber200
NOP	
J	L__findnumber135
NOP	
L__findnumber200:
L__findnumber134:
=======
BNE	R2, R0, L__findnumber210
NOP	
J	L__findnumber143
NOP	
L__findnumber210:
L__findnumber142:
;String.c,244 :: 		temp[i] = str[i];
>>>>>>> temp
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
<<<<<<< HEAD
L__findnumber136:
L__findnumber135:
ADDIU	R2, R9, 1
SEH	R9, R2
J	L_findnumber68
NOP	
L_findnumber69:
=======
;String.c,243 :: 		if((str[i] > 0x29)&& (str[i] < 0x40)){
L__findnumber144:
L__findnumber143:
;String.c,242 :: 		for(i = 0;i < strlen(str);i++){
ADDIU	R2, R9, 1
SEH	R9, R2
;String.c,246 :: 		}
J	L_findnumber69
NOP	
L_findnumber70:
;String.c,247 :: 		temp[i] = 0;
>>>>>>> temp
SEH	R2, R9
; i end address is: 36 (R9)
ADDU	R2, R8, R2
SB	R0, 0(R2)
;String.c,248 :: 		Free(temp,sizeof(temp));
SW	R25, 8(SP)
ORI	R26, R0, 4
MOVZ	R25, R8, R0
JAL	_Free+0
NOP	
LW	R25, 8(SP)
;String.c,249 :: 		return temp;
MOVZ	R2, R8, R0
; temp end address is: 32 (R8)
;String.c,250 :: 		}
;String.c,249 :: 		return temp;
;String.c,250 :: 		}
L_end_findnumber:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _findnumber
_StrChecker:
;String.c,256 :: 		int StrChecker(char *str){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;String.c,260 :: 		if(!once){
SW	R26, 4(SP)
SW	R27, 8(SP)
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
EXT	R2, R2, BitPos(StrChecker_once_L0+0), 1
<<<<<<< HEAD
BEQ	R2, R0, L__StrChecker202
NOP	
J	L_StrChecker74
NOP	
L__StrChecker202:
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
ORI	R2, R2, BitMask(StrChecker_once_L0+0)
SB	R2, Offset(StrChecker_once_L0+0)(GP)
ORI	R2, R0, 21
SH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
L_StrChecker74:
=======
BEQ	R2, R0, L__StrChecker212
NOP	
J	L_StrChecker75
NOP	
L__StrChecker212:
;String.c,261 :: 		once = 1;
LBU	R2, Offset(StrChecker_once_L0+0)(GP)
ORI	R2, R2, BitMask(StrChecker_once_L0+0)
SB	R2, Offset(StrChecker_once_L0+0)(GP)
;String.c,262 :: 		enum_val = enum_num;
ORI	R2, R0, 22
SH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
;String.c,263 :: 		}
L_StrChecker75:
;String.c,264 :: 		length = strlen(str);
>>>>>>> temp
JAL	_strlen+0
NOP	
; length start address is: 20 (R5)
SEH	R5, R2
;String.c,265 :: 		if(length < 5){
SEH	R2, R2
SLTI	R2, R2, 5
<<<<<<< HEAD
BNE	R2, R0, L__StrChecker203
NOP	
J	L_StrChecker75
NOP	
L__StrChecker203:
=======
BNE	R2, R0, L__StrChecker213
NOP	
J	L_StrChecker76
NOP	
L__StrChecker213:
>>>>>>> temp
; length end address is: 20 (R5)
;String.c,266 :: 		return 21;
ORI	R2, R0, 21
J	L_end_StrChecker
NOP	
<<<<<<< HEAD
L_StrChecker75:
=======
;String.c,267 :: 		}
L_StrChecker76:
;String.c,268 :: 		for(i = 0;i < enum_val;i++){
>>>>>>> temp
; i start address is: 24 (R6)
; length start address is: 20 (R5)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
<<<<<<< HEAD
L_StrChecker76:
=======
L_StrChecker77:
>>>>>>> temp
; i start address is: 24 (R6)
; length start address is: 20 (R5)
; length end address is: 20 (R5)
SEH	R3, R6
LH	R2, Offset(StrChecker_enum_val_L0+0)(GP)
SLT	R2, R3, R2
<<<<<<< HEAD
BNE	R2, R0, L__StrChecker204
NOP	
J	L_StrChecker77
NOP	
L__StrChecker204:
=======
BNE	R2, R0, L__StrChecker214
NOP	
J	L_StrChecker78
NOP	
L__StrChecker214:
>>>>>>> temp
; length end address is: 20 (R5)
;String.c,269 :: 		if(strncmp(str,com[i],length)==0)
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
<<<<<<< HEAD
BEQ	R2, R0, L__StrChecker205
NOP	
J	L_StrChecker79
NOP	
L__StrChecker205:
; length end address is: 20 (R5)
J	L_StrChecker77
NOP	
L_StrChecker79:
=======
BEQ	R2, R0, L__StrChecker215
NOP	
J	L_StrChecker80
NOP	
L__StrChecker215:
; length end address is: 20 (R5)
;String.c,270 :: 		break;
J	L_StrChecker78
NOP	
L_StrChecker80:
;String.c,268 :: 		for(i = 0;i < enum_val;i++){
>>>>>>> temp
; length start address is: 20 (R5)
ADDIU	R2, R6, 1
SEH	R6, R2
;String.c,271 :: 		}
; length end address is: 20 (R5)
<<<<<<< HEAD
J	L_StrChecker76
NOP	
L_StrChecker77:
=======
J	L_StrChecker77
NOP	
L_StrChecker78:
;String.c,272 :: 		return i;
>>>>>>> temp
SEH	R2, R6
; i end address is: 24 (R6)
;String.c,273 :: 		}
;String.c,272 :: 		return i;
;String.c,273 :: 		}
L_end_StrChecker:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _StrChecker
_RemoveWhiteSpace:
;String.c,278 :: 		char* RemoveWhiteSpace(char* str){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;String.c,281 :: 		j=0;
; j start address is: 24 (R6)
MOVZ	R6, R0, R0
;String.c,282 :: 		for(i=0;i<strlen(str)+1;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 24 (R6)
; i end address is: 20 (R5)
<<<<<<< HEAD
L_RemoveWhiteSpace80:
=======
L_RemoveWhiteSpace81:
>>>>>>> temp
; i start address is: 20 (R5)
; j start address is: 24 (R6)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
<<<<<<< HEAD
BNE	R2, R0, L__RemoveWhiteSpace207
NOP	
J	L_RemoveWhiteSpace81
NOP	
L__RemoveWhiteSpace207:
=======
BNE	R2, R0, L__RemoveWhiteSpace217
NOP	
J	L_RemoveWhiteSpace82
NOP	
L__RemoveWhiteSpace217:
;String.c,283 :: 		if(str[i] == 0x20)
>>>>>>> temp
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 32
<<<<<<< HEAD
BEQ	R3, R2, L__RemoveWhiteSpace208
NOP	
J	L_RemoveWhiteSpace83
NOP	
L__RemoveWhiteSpace208:
J	L_RemoveWhiteSpace82
NOP	
L_RemoveWhiteSpace83:
=======
BEQ	R3, R2, L__RemoveWhiteSpace218
NOP	
J	L_RemoveWhiteSpace84
NOP	
L__RemoveWhiteSpace218:
;String.c,284 :: 		continue;
J	L_RemoveWhiteSpace83
NOP	
L_RemoveWhiteSpace84:
;String.c,285 :: 		temp[j] = str[i];
>>>>>>> temp
SEH	R3, R6
LW	R2, 4(SP)
ADDU	R3, R2, R3
SEH	R2, R5
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,286 :: 		j++;
ADDIU	R2, R6, 1
SEH	R6, R2
; j end address is: 24 (R6)
<<<<<<< HEAD
L_RemoveWhiteSpace82:
=======
;String.c,287 :: 		}
L_RemoveWhiteSpace83:
;String.c,282 :: 		for(i=0;i<strlen(str)+1;i++){
>>>>>>> temp
; j start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
;String.c,287 :: 		}
; j end address is: 24 (R6)
; i end address is: 20 (R5)
<<<<<<< HEAD
J	L_RemoveWhiteSpace80
NOP	
L_RemoveWhiteSpace81:
=======
J	L_RemoveWhiteSpace81
NOP	
L_RemoveWhiteSpace82:
;String.c,288 :: 		return temp;
>>>>>>> temp
LW	R2, 4(SP)
;String.c,289 :: 		}
L_end_RemoveWhiteSpace:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _RemoveWhiteSpace
_RemoveChars:
<<<<<<< HEAD
ADDIU	SP, SP, -16
=======
;String.c,294 :: 		char* RemoveChars(char* str,char a,char b){
ADDIU	SP, SP, -20
>>>>>>> temp
SW	RA, 0(SP)
;String.c,296 :: 		int i=0;
SW	R25, 4(SP)
SW	R26, 8(SP)
;String.c,297 :: 		temp = (char*)Malloc(100*sizeof(char*));
SW	R25, 12(SP)
ORI	R25, R0, 400
JAL	_Malloc+0
NOP	
LW	R25, 12(SP)
; temp start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,300 :: 		if(a != 0x02){
ANDI	R3, R26, 255
ORI	R2, R0, 2
<<<<<<< HEAD
BNE	R3, R2, L__RemoveChars211
NOP	
J	L_RemoveChars84
NOP	
L__RemoveChars211:
=======
BNE	R3, R2, L__RemoveChars221
NOP	
J	L_RemoveChars85
NOP	
L__RemoveChars221:
>>>>>>> temp
; temp end address is: 24 (R6)
;String.c,301 :: 		temp = strchr(str,a);
SW	R25, 12(SP)
JAL	_strchr+0
NOP	
LW	R25, 12(SP)
; temp start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,302 :: 		strcpy(str,temp+1);
ADDIU	R2, R2, 1
MOVZ	R26, R2, R0
JAL	_strcpy+0
NOP	
;String.c,303 :: 		}else{
MOVZ	R8, R6, R0
<<<<<<< HEAD
J	L_RemoveChars85
NOP	
L_RemoveChars84:
=======
J	L_RemoveChars86
NOP	
L_RemoveChars85:
;String.c,304 :: 		strncpy(temp,str,strlen(temp)+1);
>>>>>>> temp
SW	R25, 12(SP)
MOVZ	R26, R25, R0
MOVZ	R25, R6, R0
JAL	_strcpy+0
NOP	
; temp end address is: 24 (R6)
LW	R25, 12(SP)
MOVZ	R8, R6, R0
<<<<<<< HEAD
L_RemoveChars85:
=======
;String.c,305 :: 		}
L_RemoveChars86:
;String.c,306 :: 		for(i=0;i<strlen(temp)+1;i++){
>>>>>>> temp
; temp start address is: 32 (R8)
; i start address is: 36 (R9)
MOVZ	R9, R0, R0
; temp end address is: 32 (R8)
; i end address is: 36 (R9)
<<<<<<< HEAD
L_RemoveChars86:
=======
L_RemoveChars87:
>>>>>>> temp
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
<<<<<<< HEAD
BNE	R2, R0, L__RemoveChars212
NOP	
J	L_RemoveChars87
NOP	
L__RemoveChars212:
=======
BNE	R2, R0, L__RemoveChars222
NOP	
J	L_RemoveChars88
NOP	
L__RemoveChars222:
;String.c,307 :: 		if(*(temp+i)==b)
>>>>>>> temp
SEH	R2, R9
ADDU	R2, R8, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
<<<<<<< HEAD
BEQ	R3, R2, L__RemoveChars213
NOP	
J	L_RemoveChars89
NOP	
L__RemoveChars213:
J	L_RemoveChars87
NOP	
L_RemoveChars89:
=======
BEQ	R3, R2, L__RemoveChars223
NOP	
J	L_RemoveChars90
NOP	
L__RemoveChars223:
;String.c,308 :: 		break;
J	L_RemoveChars88
NOP	
L_RemoveChars90:
;String.c,309 :: 		*(temp+i) = *(str+i);
>>>>>>> temp
SEH	R2, R9
ADDU	R3, R8, R2
SEH	R2, R9
ADDU	R2, R25, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;String.c,306 :: 		for(i=0;i<strlen(temp)+1;i++){
ADDIU	R2, R9, 1
SEH	R9, R2
<<<<<<< HEAD
J	L_RemoveChars86
NOP	
L_RemoveChars87:
=======
;String.c,310 :: 		}
J	L_RemoveChars87
NOP	
L_RemoveChars88:
;String.c,311 :: 		*(temp+i) = 0;
>>>>>>> temp
SEH	R2, R9
; i end address is: 36 (R9)
ADDU	R2, R8, R2
SB	R0, 0(R2)
<<<<<<< HEAD
ORI	R26, R0, 100
=======
;String.c,313 :: 		Free(temp,100*sizeof(char*));//??
ORI	R26, R0, 400
>>>>>>> temp
MOVZ	R25, R8, R0
JAL	_Free+0
NOP	
;String.c,314 :: 		return temp;
MOVZ	R2, R8, R0
; temp end address is: 32 (R8)
;String.c,315 :: 		}
;String.c,314 :: 		return temp;
;String.c,315 :: 		}
L_end_RemoveChars:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _RemoveChars
_WriteData:
;String.c,320 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;String.c,323 :: 		memset(writebuff,0,64);
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
;String.c,324 :: 		strncpy(writebuff,_data,strlen(_data));
JAL	_strlen+0
NOP	
SEH	R27, R2
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncpy+0
NOP	
;String.c,325 :: 		HID_Write(&writebuff,64);
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
;String.c,326 :: 		}
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
<<<<<<< HEAD
ADDIU	SP, SP, -140
=======
;String.c,331 :: 		char* Read_Send_AllColour(short data_src){
ADDIU	SP, SP, -164
>>>>>>> temp
SW	RA, 0(SP)
;String.c,337 :: 		PWM_Start(2);
SW	R25, 4(SP)
SW	R26, 8(SP)
SB	R25, 12(SP)
<<<<<<< HEAD
=======
ORI	R25, R0, 2
JAL	_PWM_Start+0
NOP	
;String.c,338 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_Read_Send_AllColour91:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Read_Send_AllColour91
NOP	
NOP	
NOP	
;String.c,341 :: 		TCS3472_getRawData(RawData);
>>>>>>> temp
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 12(SP)
<<<<<<< HEAD
BNE	R25, R0, L__Read_Send_AllColour217
NOP	
J	L_Read_Send_AllColour90
NOP	
L__Read_Send_AllColour217:
=======
;String.c,343 :: 		if(data_src)
BNE	R25, R0, L__Read_Send_AllColour227
NOP	
J	L_Read_Send_AllColour93
NOP	
L__Read_Send_AllColour227:
;String.c,344 :: 		GetScaledValues(RawData,FltData);
>>>>>>> temp
SB	R25, 12(SP)
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_GetScaledValues+0
NOP	
LB	R25, 12(SP)
<<<<<<< HEAD
L_Read_Send_AllColour90:
ADDIU	R23, SP, 92
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr25_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr25_String+0)
=======
L_Read_Send_AllColour93:
;String.c,347 :: 		if(!data_src ){
BEQ	R25, R0, L__Read_Send_AllColour228
NOP	
J	L_Read_Send_AllColour94
NOP	
L__Read_Send_AllColour228:
;String.c,348 :: 		strcpy(str,"C || R | G | B | = || ");
ADDIU	R23, SP, 92
ADDIU	R22, R23, 23
LUI	R24, hi_addr(?ICS?lstr27_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr27_String+0)
>>>>>>> temp
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 92
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
<<<<<<< HEAD
LB	R25, 12(SP)
BEQ	R25, R0, L__Read_Send_AllColour218
NOP	
J	L_Read_Send_AllColour91
NOP	
L__Read_Send_AllColour218:
=======
;String.c,349 :: 		sprintf(txtR,"%u",RawData[0]); //C
>>>>>>> temp
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+0)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
<<<<<<< HEAD
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
ADDIU	R3, SP, 13
LW	R2, Offset(_FltData+0)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_27_String+0)
ORI	R2, R2, lo_addr(?lstr_27_String+0)
=======
LUI	R2, hi_addr(?lstr_28_String+0)
ORI	R2, R2, lo_addr(?lstr_28_String+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
<<<<<<< HEAD
L_Read_Send_AllColour92:
ADDIU	R3, SP, 13
=======
;String.c,351 :: 		}else{
J	L_Read_Send_AllColour95
NOP	
L_Read_Send_AllColour94:
;String.c,352 :: 		strcpy(str,"|| R | G | B | = || ");
ADDIU	R23, SP, 115
ADDIU	R22, R23, 21
LUI	R24, hi_addr(?ICS?lstr29_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr29_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 115
>>>>>>> temp
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
<<<<<<< HEAD
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
BEQ	R25, R0, L__Read_Send_AllColour219
NOP	
J	L_Read_Send_AllColour93
NOP	
L__Read_Send_AllColour219:
=======
;String.c,353 :: 		sprintf(txtR,"%3.2f",FltData[0]); //R
>>>>>>> temp
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+2)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
<<<<<<< HEAD
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_29_String+0)
ORI	R2, R2, lo_addr(?lstr_29_String+0)
=======
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_30_String+0)
ORI	R2, R2, lo_addr(?lstr_30_String+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
<<<<<<< HEAD
J	L_Read_Send_AllColour94
NOP	
L_Read_Send_AllColour93:
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
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
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
BEQ	R25, R0, L__Read_Send_AllColour220
NOP	
J	L_Read_Send_AllColour95
NOP	
L__Read_Send_AllColour220:
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+4)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
=======
;String.c,354 :: 		}
L_Read_Send_AllColour95:
;String.c,355 :: 		strcat(str,txtR);
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,356 :: 		strcat(str," || ");
ORI	R30, R0, 32
SB	R30, 136(SP)
ORI	R30, R0, 124
SB	R30, 137(SP)
ORI	R30, R0, 124
SB	R30, 138(SP)
ORI	R30, R0, 32
SB	R30, 139(SP)
MOVZ	R30, R0, R0
SB	R30, 140(SP)
ADDIU	R3, SP, 136
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
;String.c,358 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour229
NOP	
J	L_Read_Send_AllColour96
NOP	
L__Read_Send_AllColour229:
;String.c,359 :: 		sprintf(txtR,"%u",RawData[1]);  //R
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+2)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
>>>>>>> temp
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_32_String+0)
ORI	R2, R2, lo_addr(?lstr_32_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
<<<<<<< HEAD
J	L_Read_Send_AllColour96
NOP	
L_Read_Send_AllColour95:
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
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
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
BEQ	R25, R0, L__Read_Send_AllColour221
NOP	
J	L_Read_Send_AllColour97
NOP	
L__Read_Send_AllColour221:
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+6)(GP)
ADDIU	SP, SP, -12
=======
J	L_Read_Send_AllColour97
NOP	
L_Read_Send_AllColour96:
;String.c,361 :: 		sprintf(txtR,"%3.2f",FltData[1]); //G
ADDIU	R3, SP, 13
LW	R2, Offset(_FltData+4)(GP)
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
L_Read_Send_AllColour97:
;String.c,362 :: 		strcat(str,txtR);
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
SB	R25, 12(SP)
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,363 :: 		strcat(str," | ");
ORI	R30, R0, 32
SB	R30, 141(SP)
ORI	R30, R0, 124
SB	R30, 142(SP)
ORI	R30, R0, 32
SB	R30, 143(SP)
MOVZ	R30, R0, R0
SB	R30, 144(SP)
ADDIU	R3, SP, 141
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
LB	R25, 12(SP)
;String.c,365 :: 		if(!data_src )
BEQ	R25, R0, L__Read_Send_AllColour230
NOP	
J	L_Read_Send_AllColour98
NOP	
L__Read_Send_AllColour230:
;String.c,366 :: 		sprintf(txtR,"%u",RawData[2]);  //G
ADDIU	R3, SP, 13
LHU	R2, Offset(_RawData+4)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
>>>>>>> temp
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_35_String+0)
ORI	R2, R2, lo_addr(?lstr_35_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
=======
LB	R25, 12(SP)
J	L_Read_Send_AllColour99
NOP	
L_Read_Send_AllColour98:
;String.c,368 :: 		sprintf(txtR,"%3.2f",FltData[2]);  //B
ADDIU	R3, SP, 13
LW	R2, Offset(_FltData+8)(GP)
SB	R25, 12(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_36_String+0)
ORI	R2, R2, lo_addr(?lstr_36_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LB	R25, 12(SP)
L_Read_Send_AllColour99:
;String.c,369 :: 		strcat(str,txtR);
>>>>>>> temp
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,370 :: 		strcat(str," | ");
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
<<<<<<< HEAD
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_C2RGB_Error+0
NOP	
=======
LB	R25, 12(SP)
;String.c,372 :: 		if(!data_src ) {
BEQ	R25, R0, L__Read_Send_AllColour231
NOP	
J	L_Read_Send_AllColour100
NOP	
L__Read_Send_AllColour231:
;String.c,373 :: 		sprintf(txtR,"%u",RawData[3]);  //ERR
>>>>>>> temp
ADDIU	R3, SP, 13
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_38_String+0)
ORI	R2, R2, lo_addr(?lstr_38_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,374 :: 		strcat(str,txtR);
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
<<<<<<< HEAD
L_Read_Send_AllColour97:
=======
;String.c,375 :: 		strcat(str," || ");
>>>>>>> temp
ORI	R30, R0, 32
SB	R30, 133(SP)
ORI	R30, R0, 124
SB	R30, 134(SP)
ORI	R30, R0, 124
<<<<<<< HEAD
SB	R30, 135(SP)
=======
SB	R30, 151(SP)
ORI	R30, R0, 32
SB	R30, 152(SP)
MOVZ	R30, R0, R0
SB	R30, 153(SP)
ADDIU	R3, SP, 149
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,377 :: 		err = TCS3472_C2RGB_Error(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_C2RGB_Error+0
NOP	
;String.c,378 :: 		sprintf(txtR,"%5d",err);
ADDIU	R3, SP, 13
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_40_String+0)
ORI	R2, R2, lo_addr(?lstr_40_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,379 :: 		strcat(str,txtR);
ADDIU	R3, SP, 13
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,380 :: 		strcat(str," || \r\n");
ORI	R30, R0, 32
SB	R30, 154(SP)
ORI	R30, R0, 124
SB	R30, 155(SP)
ORI	R30, R0, 124
SB	R30, 156(SP)
ORI	R30, R0, 32
SB	R30, 157(SP)
>>>>>>> temp
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
<<<<<<< HEAD
=======
;String.c,381 :: 		}else
J	L_Read_Send_AllColour101
NOP	
L_Read_Send_AllColour100:
;String.c,382 :: 		strcat(str,"\r\n");
ORI	R30, R0, 13
SB	R30, 161(SP)
ORI	R30, R0, 10
SB	R30, 162(SP)
MOVZ	R30, R0, R0
SB	R30, 163(SP)
ADDIU	R3, SP, 161
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
L_Read_Send_AllColour101:
;String.c,385 :: 		PWM_Stop(2);
ORI	R25, R0, 2
JAL	_PWM_Stop+0
NOP	
;String.c,386 :: 		return &str;
>>>>>>> temp
ADDIU	R2, SP, 28
;String.c,387 :: 		}
;String.c,386 :: 		return &str;
;String.c,387 :: 		}
L_end_Read_Send_AllColour:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 140
JR	RA
NOP	
; end of _Read_Send_AllColour
_Read_Send_OneColour:
<<<<<<< HEAD
ADDIU	SP, SP, -180
=======
;String.c,392 :: 		char* Read_Send_OneColour(int colr){
ADDIU	SP, SP, -184
>>>>>>> temp
SW	RA, 0(SP)
;String.c,397 :: 		PWM_Start(2);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
J	L_Read_Send_OneColour98
NOP	
<<<<<<< HEAD
L_Read_Send_OneColour100:
=======
LH	R25, 16(SP)
;String.c,398 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_Read_Send_OneColour102:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Read_Send_OneColour102
NOP	
NOP	
NOP	
;String.c,399 :: 		switch(colr){
J	L_Read_Send_OneColour104
NOP	
;String.c,400 :: 		case READR:
L_Read_Send_OneColour106:
;String.c,401 :: 		col = TCS3472_Read16(TCS3472_RDATAL);
>>>>>>> temp
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
<<<<<<< HEAD
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
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
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
J	L_Read_Send_OneColour99
NOP	
L_Read_Send_OneColour101:
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
ADDIU	R23, SP, 104
=======
;String.c,402 :: 		strcpy(str,"R = || ");
ADDIU	R23, SP, 92
>>>>>>> temp
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr43_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr43_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 104
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
<<<<<<< HEAD
ADDIU	R3, SP, 16
=======
;String.c,403 :: 		sprintf(txtR,"%5u",col);
ADDIU	R3, SP, 18
>>>>>>> temp
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
<<<<<<< HEAD
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
=======
;String.c,404 :: 		strcat(str,txtR);
ADDIU	R3, SP, 18
ADDIU	R2, SP, 28
>>>>>>> temp
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,405 :: 		strcat(str," ||\r\n");
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
<<<<<<< HEAD
J	L_Read_Send_OneColour99
NOP	
L_Read_Send_OneColour102:
ORI	R25, R0, 26
=======
;String.c,406 :: 		break;
J	L_Read_Send_OneColour105
NOP	
;String.c,407 :: 		case READG:
L_Read_Send_OneColour107:
;String.c,408 :: 		col = TCS3472_Read16(TCS3472_GDATAL);
ORI	R25, R0, 24
>>>>>>> temp
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
<<<<<<< HEAD
ADDIU	R23, SP, 118
=======
;String.c,409 :: 		strcpy(str,"G = || ");
ADDIU	R23, SP, 106
>>>>>>> temp
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr46_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr46_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 118
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
<<<<<<< HEAD
ADDIU	R3, SP, 16
=======
;String.c,410 :: 		sprintf(txtR,"%5u",col);
ADDIU	R3, SP, 18
>>>>>>> temp
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
<<<<<<< HEAD
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
=======
;String.c,411 :: 		strcat(str,txtR);
ADDIU	R3, SP, 18
ADDIU	R2, SP, 28
>>>>>>> temp
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,412 :: 		strcat(str," ||\r\n");
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
<<<<<<< HEAD
J	L_Read_Send_OneColour99
NOP	
L_Read_Send_OneColour103:
ORI	R25, R0, 20
=======
;String.c,413 :: 		break;
J	L_Read_Send_OneColour105
NOP	
;String.c,414 :: 		case READB:
L_Read_Send_OneColour108:
;String.c,415 :: 		col = TCS3472_Read16(TCS3472_BDATAL);
ORI	R25, R0, 26
>>>>>>> temp
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
<<<<<<< HEAD
ADDIU	R23, SP, 132
=======
;String.c,416 :: 		strcpy(str,"B = || ");
ADDIU	R23, SP, 120
>>>>>>> temp
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr49_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr49_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 132
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
<<<<<<< HEAD
ADDIU	R3, SP, 16
=======
;String.c,417 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 18
>>>>>>> temp
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
<<<<<<< HEAD
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
=======
;String.c,418 :: 		strcat(str,txtR);
ADDIU	R3, SP, 18
ADDIU	R2, SP, 28
>>>>>>> temp
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,419 :: 		strcat(str," ||\r\n");
ORI	R30, R0, 32
SB	R30, 140(SP)
ORI	R30, R0, 124
SB	R30, 141(SP)
ORI	R30, R0, 124
<<<<<<< HEAD
=======
SB	R30, 130(SP)
ORI	R30, R0, 13
SB	R30, 131(SP)
ORI	R30, R0, 10
SB	R30, 132(SP)
MOVZ	R30, R0, R0
SB	R30, 133(SP)
ADDIU	R3, SP, 128
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,420 :: 		break;
J	L_Read_Send_OneColour105
NOP	
;String.c,421 :: 		case READC:
L_Read_Send_OneColour109:
;String.c,422 :: 		col = TCS3472_Read16(TCS3472_CDATAL);
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
;String.c,423 :: 		strcpy(str,"C = || ");
ADDIU	R23, SP, 134
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr52_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr52_String+0)
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 134
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,424 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 18
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
;String.c,425 :: 		strcat(str,txtR);
ADDIU	R3, SP, 18
ADDIU	R2, SP, 28
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,426 :: 		strcat(str," ||\r\n");
ORI	R30, R0, 32
>>>>>>> temp
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
<<<<<<< HEAD
J	L_Read_Send_OneColour99
NOP	
L_Read_Send_OneColour104:
=======
;String.c,427 :: 		break;
J	L_Read_Send_OneColour105
NOP	
;String.c,428 :: 		case READT:
L_Read_Send_OneColour110:
;String.c,429 :: 		TCS3472_getRawData(RawData);
>>>>>>> temp
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,430 :: 		col = TCS3472_CalcColTemp(RawData[1],RawData[3],RawData[3]);
LHU	R27, Offset(_RawData+6)(GP)
LHU	R26, Offset(_RawData+6)(GP)
LHU	R25, Offset(_RawData+2)(GP)
JAL	_TCS3472_CalcColTemp+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
<<<<<<< HEAD
ADDIU	R23, SP, 146
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr51_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr51_String+0)
=======
;String.c,431 :: 		strcpy(str,"T = || ");
ADDIU	R23, SP, 148
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr55_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr55_String+0)
>>>>>>> temp
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 146
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
<<<<<<< HEAD
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_52_String+0)
ORI	R2, R2, lo_addr(?lstr_52_String+0)
=======
;String.c,432 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 18
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_56_String+0)
ORI	R2, R2, lo_addr(?lstr_56_String+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
=======
;String.c,433 :: 		strcat(str,txtR);
ADDIU	R3, SP, 18
ADDIU	R2, SP, 28
>>>>>>> temp
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,434 :: 		strcat(str," ||\r\n");
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
<<<<<<< HEAD
J	L_Read_Send_OneColour99
NOP	
L_Read_Send_OneColour105:
=======
;String.c,435 :: 		break;
J	L_Read_Send_OneColour105
NOP	
;String.c,436 :: 		case READT_DN40:
L_Read_Send_OneColour111:
;String.c,437 :: 		TCS3472_getRawData(RawData);
>>>>>>> temp
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,438 :: 		col = TCS3472_CalcColTemp_dn40(RawData,it);
LBU	R26, Offset(_it+0)(GP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_CalcColTemp_dn40+0
NOP	
; col start address is: 24 (R6)
ANDI	R6, R2, 65535
<<<<<<< HEAD
ADDIU	R23, SP, 160
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr54_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr54_String+0)
=======
;String.c,439 :: 		strcpy(str,"T_DN40 = || ");
ADDIU	R23, SP, 162
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr58_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr58_String+0)
>>>>>>> temp
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 160
ADDIU	R2, SP, 26
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
<<<<<<< HEAD
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_55_String+0)
ORI	R2, R2, lo_addr(?lstr_55_String+0)
=======
;String.c,440 :: 		sprintf(txtR,"%u",col);
ADDIU	R3, SP, 18
ADDIU	SP, SP, -12
SH	R6, 8(SP)
; col end address is: 24 (R6)
LUI	R2, hi_addr(?lstr_59_String+0)
ORI	R2, R2, lo_addr(?lstr_59_String+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
ADDIU	R3, SP, 16
ADDIU	R2, SP, 26
=======
;String.c,441 :: 		strcat(str,txtR);
ADDIU	R3, SP, 18
ADDIU	R2, SP, 28
>>>>>>> temp
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,442 :: 		strcat(str," ||\r\n");
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
<<<<<<< HEAD
J	L_Read_Send_OneColour99
NOP	
L_Read_Send_OneColour98:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Read_Send_OneColour224
NOP	
J	L_Read_Send_OneColour100
=======
;String.c,443 :: 		break;
J	L_Read_Send_OneColour105
NOP	
;String.c,444 :: 		}
L_Read_Send_OneColour104:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__Read_Send_OneColour234
NOP	
J	L_Read_Send_OneColour106
NOP	
L__Read_Send_OneColour234:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__Read_Send_OneColour236
NOP	
J	L_Read_Send_OneColour107
>>>>>>> temp
NOP	
L__Read_Send_OneColour224:
SEH	R3, R25
<<<<<<< HEAD
ORI	R2, R0, 8
BNE	R3, R2, L__Read_Send_OneColour226
NOP	
J	L_Read_Send_OneColour101
=======
ORI	R2, R0, 9
BNE	R3, R2, L__Read_Send_OneColour238
NOP	
J	L_Read_Send_OneColour108
>>>>>>> temp
NOP	
L__Read_Send_OneColour226:
SEH	R3, R25
<<<<<<< HEAD
ORI	R2, R0, 9
BNE	R3, R2, L__Read_Send_OneColour228
NOP	
J	L_Read_Send_OneColour102
=======
ORI	R2, R0, 10
BNE	R3, R2, L__Read_Send_OneColour240
NOP	
J	L_Read_Send_OneColour109
>>>>>>> temp
NOP	
L__Read_Send_OneColour228:
SEH	R3, R25
<<<<<<< HEAD
ORI	R2, R0, 10
BNE	R3, R2, L__Read_Send_OneColour230
NOP	
J	L_Read_Send_OneColour103
=======
ORI	R2, R0, 11
BNE	R3, R2, L__Read_Send_OneColour242
NOP	
J	L_Read_Send_OneColour110
>>>>>>> temp
NOP	
L__Read_Send_OneColour230:
SEH	R3, R25
<<<<<<< HEAD
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
ADDIU	R2, SP, 26
=======
ORI	R2, R0, 12
BNE	R3, R2, L__Read_Send_OneColour244
NOP	
J	L_Read_Send_OneColour111
NOP	
L__Read_Send_OneColour244:
L_Read_Send_OneColour105:
;String.c,445 :: 		PWM_Stop(2);
ORI	R25, R0, 2
JAL	_PWM_Stop+0
NOP	
;String.c,446 :: 		return &str;
ADDIU	R2, SP, 28
;String.c,447 :: 		}
;String.c,446 :: 		return &str;
;String.c,447 :: 		}
>>>>>>> temp
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
<<<<<<< HEAD
ADDIU	SP, SP, -112
=======
;String.c,452 :: 		char* ReadHUE(){
ADDIU	SP, SP, -160
>>>>>>> temp
SW	RA, 0(SP)
;String.c,459 :: 		PWM_Start(2);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
<<<<<<< HEAD
=======
ORI	R25, R0, 2
JAL	_PWM_Start+0
NOP	
;String.c,460 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_ReadHUE112:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadHUE112
NOP	
NOP	
NOP	
;String.c,461 :: 		memset(str,0,64);
>>>>>>> temp
ADDIU	R2, SP, 16
ORI	R27, R0, 64
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;String.c,463 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;String.c,464 :: 		GetScaledValues(RawData,&FltData);
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_GetScaledValues+0
NOP	
;String.c,465 :: 		TCS3472_CalcHSL(&FltData);
LUI	R25, hi_addr(_FltData+0)
ORI	R25, R25, lo_addr(_FltData+0)
JAL	_TCS3472_CalcHue+0
NOP	
;String.c,467 :: 		sprintf(txtF,"%3.2f",FltData[4]); //HUE
ADDIU	R3, SP, 80
ADDIU	SP, SP, -12
SW	R2, 8(SP)
<<<<<<< HEAD
LUI	R2, hi_addr(?lstr_57_String+0)
ORI	R2, R2, lo_addr(?lstr_57_String+0)
=======
LUI	R2, hi_addr(?lstr_61_String+0)
ORI	R2, R2, lo_addr(?lstr_61_String+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
ADDIU	R23, SP, 95
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr58_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr58_String+0)
=======
;String.c,468 :: 		sprintf(txtG,"%3.2f",FltData[5]); //SAT
ADDIU	R3, SP, 95
LW	R2, Offset(_FltData+20)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_62_String+0)
ORI	R2, R2, lo_addr(?lstr_62_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,469 :: 		sprintf(txtH,"%3.2f",FltData[6]); //LUM
ADDIU	R3, SP, 110
LW	R2, Offset(_FltData+24)(GP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_63_String+0)
ORI	R2, R2, lo_addr(?lstr_63_String+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,471 :: 		strcpy(str,"HUE, SAT, LUM  || ");
ADDIU	R23, SP, 125
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr64_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr64_String+0)
>>>>>>> temp
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 95
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,472 :: 		strcat(str,txtF);
ADDIU	R3, SP, 80
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,473 :: 		strcat(str," | ");
ORI	R30, R0, 32
SB	R30, 105(SP)
ORI	R30, R0, 124
<<<<<<< HEAD
SB	R30, 106(SP)
ORI	R30, R0, 124
SB	R30, 107(SP)
=======
SB	R30, 145(SP)
ORI	R30, R0, 32
SB	R30, 146(SP)
MOVZ	R30, R0, R0
SB	R30, 147(SP)
ADDIU	R3, SP, 144
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,474 :: 		strcat(str,txtG);
ADDIU	R3, SP, 95
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,475 :: 		strcat(str," | ");
ORI	R30, R0, 32
SB	R30, 148(SP)
ORI	R30, R0, 124
SB	R30, 149(SP)
ORI	R30, R0, 32
SB	R30, 150(SP)
MOVZ	R30, R0, R0
SB	R30, 151(SP)
ADDIU	R3, SP, 148
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,476 :: 		strcat(str,txtH);
ADDIU	R3, SP, 110
ADDIU	R2, SP, 16
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,477 :: 		strcat(str," ||\r\n ");
ORI	R30, R0, 32
SB	R30, 152(SP)
ORI	R30, R0, 124
SB	R30, 153(SP)
ORI	R30, R0, 124
SB	R30, 154(SP)
>>>>>>> temp
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
<<<<<<< HEAD
=======
;String.c,478 :: 		PWM_Stop(2);
ORI	R25, R0, 2
JAL	_PWM_Stop+0
NOP	
;String.c,479 :: 		return &str;
>>>>>>> temp
ADDIU	R2, SP, 16
;String.c,480 :: 		}
;String.c,479 :: 		return &str;
;String.c,480 :: 		}
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
;String.c,483 :: 		int Get_It(){
;String.c,484 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,485 :: 		}
L_end_Get_It:
JR	RA
NOP	
; end of _Get_It
_Get_Gain:
;String.c,487 :: 		int Get_Gain(){
;String.c,488 :: 		return 0;
MOVZ	R2, R0, R0
;String.c,489 :: 		}
L_end_Get_Gain:
JR	RA
NOP	
; end of _Get_Gain
_Read_Thresholds:
;String.c,494 :: 		char* Read_Thresholds(){
ADDIU	SP, SP, -156
SW	RA, 0(SP)
;String.c,499 :: 		NVMRead(FLASH_Settings_VAddr,&Threshold);
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(_Threshold+0)
ORI	R26, R26, lo_addr(_Threshold+0)
LW	R25, Offset(_FLASH_Settings_VAddr+0)(GP)
JAL	_NVMRead+0
NOP	
;String.c,501 :: 		strcpy(str,"Cth || Rth | Gth | Bth | = || ");
ADDIU	R23, SP, 101
ADDIU	R22, R23, 31
<<<<<<< HEAD
LUI	R24, hi_addr(?ICS?lstr60_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr60_String+0)
=======
LUI	R24, hi_addr(?ICS?lstr68_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr68_String+0)
>>>>>>> temp
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 101
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,502 :: 		sprintf(txtR,"%u",Threshold.C_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
<<<<<<< HEAD
LUI	R2, hi_addr(?lstr_61_String+0)
ORI	R2, R2, lo_addr(?lstr_61_String+0)
=======
LUI	R2, hi_addr(?lstr_69_String+0)
ORI	R2, R2, lo_addr(?lstr_69_String+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,503 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,504 :: 		strcat(str," || ");
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
;String.c,506 :: 		sprintf(txtR,"%u",Threshold.R_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
<<<<<<< HEAD
LUI	R2, hi_addr(?lstr_63_String+0)
ORI	R2, R2, lo_addr(?lstr_63_String+0)
=======
LUI	R2, hi_addr(?lstr_71_String+0)
ORI	R2, R2, lo_addr(?lstr_71_String+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,507 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,508 :: 		strcat(str," | ");
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
;String.c,510 :: 		sprintf(txtR,"%u",Threshold.G_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
<<<<<<< HEAD
LUI	R2, hi_addr(?lstr_65_String+0)
ORI	R2, R2, lo_addr(?lstr_65_String+0)
=======
LUI	R2, hi_addr(?lstr_73_String+0)
ORI	R2, R2, lo_addr(?lstr_73_String+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,511 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,512 :: 		strcat(str," | ");
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
;String.c,514 :: 		sprintf(txtR,"%u",Threshold.B_thresh);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
<<<<<<< HEAD
LUI	R2, hi_addr(?lstr_67_String+0)
ORI	R2, R2, lo_addr(?lstr_67_String+0)
=======
LUI	R2, hi_addr(?lstr_75_String+0)
ORI	R2, R2, lo_addr(?lstr_75_String+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,515 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,516 :: 		strcat(str," | ");
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
;String.c,518 :: 		sprintf(txtR,"%u",Threshold.time_to_log);
ADDIU	R3, SP, 12
LHU	R2, Offset(_Threshold+8)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
<<<<<<< HEAD
LUI	R2, hi_addr(?lstr_69_String+0)
ORI	R2, R2, lo_addr(?lstr_69_String+0)
=======
LUI	R2, hi_addr(?lstr_77_String+0)
ORI	R2, R2, lo_addr(?lstr_77_String+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,519 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 37
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,520 :: 		strcat(str," ||\r\n ");
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
;String.c,522 :: 		return &str;
ADDIU	R2, SP, 37
;String.c,523 :: 		}
;String.c,522 :: 		return &str;
;String.c,523 :: 		}
L_end_Read_Thresholds:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 156
JR	RA
NOP	
; end of _Read_Thresholds
_Write_Thresholds:
;String.c,528 :: 		char* Write_Thresholds(short data_src){
ADDIU	SP, SP, -624
SW	RA, 0(SP)
;String.c,534 :: 		pos =  FLASH_Settings_PAddr; //P?
SW	R26, 4(SP)
LW	R2, Offset(_FLASH_Settings_PAddr+0)(GP)
SW	R2, 524(SP)
;String.c,535 :: 		for(i=1;i<128;i++)
; i start address is: 20 (R5)
ORI	R5, R0, 1
; i end address is: 20 (R5)
SEH	R4, R5
<<<<<<< HEAD
L_Write_Thresholds106:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 128
BNE	R2, R0, L__Write_Thresholds240
NOP	
J	L_Write_Thresholds107
NOP	
L__Write_Thresholds240:
=======
L_Write_Thresholds114:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 128
BNE	R2, R0, L__Write_Thresholds250
NOP	
J	L_Write_Thresholds115
NOP	
L__Write_Thresholds250:
;String.c,536 :: 		val[i] = 0x00000000;
>>>>>>> temp
ADDIU	R3, SP, 12
SEH	R2, R4
SLL	R2, R2, 2
ADDU	R2, R3, R2
SW	R0, 0(R2)
;String.c,535 :: 		for(i=1;i<128;i++)
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R5, R2
;String.c,536 :: 		val[i] = 0x00000000;
SEH	R4, R5
; i end address is: 20 (R5)
<<<<<<< HEAD
J	L_Write_Thresholds106
NOP	
L_Write_Thresholds107:
BEQ	R25, R0, L__Write_Thresholds241
NOP	
J	L_Write_Thresholds109
NOP	
L__Write_Thresholds241:
=======
J	L_Write_Thresholds114
NOP	
L_Write_Thresholds115:
;String.c,539 :: 		if(!data_src)
BEQ	R25, R0, L__Write_Thresholds251
NOP	
J	L_Write_Thresholds117
NOP	
L__Write_Thresholds251:
;String.c,540 :: 		TCS3472_getRawData(RawData);
>>>>>>> temp
SB	R25, 8(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LB	R25, 8(SP)
<<<<<<< HEAD
L_Write_Thresholds109:
BNE	R25, R0, L__Write_Thresholds243
NOP	
J	L_Write_Thresholds110
NOP	
L__Write_Thresholds243:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
BNE	R3, R2, L__Write_Thresholds245
NOP	
J	L_Write_Thresholds111
NOP	
L__Write_Thresholds245:
=======
L_Write_Thresholds117:
;String.c,542 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds253
NOP	
J	L_Write_Thresholds118
NOP	
L__Write_Thresholds253:
;String.c,543 :: 		if(string[2] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
BNE	R3, R2, L__Write_Thresholds255
NOP	
J	L_Write_Thresholds119
NOP	
L__Write_Thresholds255:
;String.c,544 :: 		val[0] = atol(string[2]);
>>>>>>> temp
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
<<<<<<< HEAD
L_Write_Thresholds111:
J	L_Write_Thresholds112
NOP	
L_Write_Thresholds110:
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+0)(GP)
SW	R2, 0(R3)
L_Write_Thresholds112:
=======
L_Write_Thresholds119:
;String.c,545 :: 		}
J	L_Write_Thresholds120
NOP	
L_Write_Thresholds118:
;String.c,547 :: 		val[0] = RawData[0];
ADDIU	R3, SP, 12
LHU	R2, Offset(_RawData+0)(GP)
SW	R2, 0(R3)
L_Write_Thresholds120:
;String.c,548 :: 		err = NVMWriteWord(pos,val[0]);
>>>>>>> temp
ADDIU	R2, SP, 12
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,550 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
<<<<<<< HEAD
BNE	R25, R0, L__Write_Thresholds247
NOP	
J	L_Write_Thresholds113
NOP	
L__Write_Thresholds247:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__Write_Thresholds249
NOP	
J	L_Write_Thresholds114
NOP	
L__Write_Thresholds249:
=======
;String.c,551 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds257
NOP	
J	L_Write_Thresholds121
NOP	
L__Write_Thresholds257:
;String.c,552 :: 		if(string[3] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
BNE	R3, R2, L__Write_Thresholds259
NOP	
J	L_Write_Thresholds122
NOP	
L__Write_Thresholds259:
;String.c,553 :: 		val[1] = atol(string[3]);
>>>>>>> temp
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
<<<<<<< HEAD
L_Write_Thresholds114:
J	L_Write_Thresholds115
NOP	
L_Write_Thresholds113:
=======
L_Write_Thresholds122:
;String.c,554 :: 		}else
J	L_Write_Thresholds123
NOP	
L_Write_Thresholds121:
;String.c,555 :: 		val[1] = RawData[1];
>>>>>>> temp
ADDIU	R2, SP, 12
ADDIU	R3, R2, 4
LHU	R2, Offset(_RawData+2)(GP)
SW	R2, 0(R3)
<<<<<<< HEAD
L_Write_Thresholds115:
=======
L_Write_Thresholds123:
;String.c,556 :: 		err = NVMWriteWord(pos,val[1]);
>>>>>>> temp
ADDIU	R2, SP, 12
ADDIU	R2, R2, 4
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,558 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
<<<<<<< HEAD
BNE	R25, R0, L__Write_Thresholds251
NOP	
J	L_Write_Thresholds116
NOP	
L__Write_Thresholds251:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
BNE	R3, R2, L__Write_Thresholds253
NOP	
J	L_Write_Thresholds117
NOP	
L__Write_Thresholds253:
=======
;String.c,559 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds261
NOP	
J	L_Write_Thresholds124
NOP	
L__Write_Thresholds261:
;String.c,560 :: 		if(string[4] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
BNE	R3, R2, L__Write_Thresholds263
NOP	
J	L_Write_Thresholds125
NOP	
L__Write_Thresholds263:
;String.c,561 :: 		val[2] = atol(string[4]);
>>>>>>> temp
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
<<<<<<< HEAD
L_Write_Thresholds117:
J	L_Write_Thresholds118
NOP	
L_Write_Thresholds116:
=======
L_Write_Thresholds125:
;String.c,562 :: 		}
J	L_Write_Thresholds126
NOP	
L_Write_Thresholds124:
;String.c,564 :: 		val[2] = RawData[2];
>>>>>>> temp
ADDIU	R2, SP, 12
ADDIU	R3, R2, 8
LHU	R2, Offset(_RawData+4)(GP)
SW	R2, 0(R3)
<<<<<<< HEAD
L_Write_Thresholds118:
=======
L_Write_Thresholds126:
;String.c,565 :: 		err = NVMWriteWord(pos,val[2]);
>>>>>>> temp
ADDIU	R2, SP, 12
ADDIU	R2, R2, 8
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
;String.c,567 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
<<<<<<< HEAD
BNE	R25, R0, L__Write_Thresholds255
NOP	
J	L_Write_Thresholds119
NOP	
L__Write_Thresholds255:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds257
NOP	
J	L_Write_Thresholds120
NOP	
L__Write_Thresholds257:
=======
;String.c,568 :: 		if(data_src){
BNE	R25, R0, L__Write_Thresholds265
NOP	
J	L_Write_Thresholds127
NOP	
L__Write_Thresholds265:
;String.c,569 :: 		if(string[5] != 0)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds267
NOP	
J	L_Write_Thresholds128
NOP	
L__Write_Thresholds267:
;String.c,570 :: 		val[3] = atol(string[5]);
>>>>>>> temp
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
<<<<<<< HEAD
L_Write_Thresholds120:
J	L_Write_Thresholds121
NOP	
L_Write_Thresholds119:
=======
L_Write_Thresholds128:
;String.c,571 :: 		}
J	L_Write_Thresholds129
NOP	
L_Write_Thresholds127:
;String.c,573 :: 		val[3] = RawData[3];
>>>>>>> temp
ADDIU	R2, SP, 12
ADDIU	R3, R2, 12
LHU	R2, Offset(_RawData+6)(GP)
SW	R2, 0(R3)
<<<<<<< HEAD
L_Write_Thresholds121:
=======
L_Write_Thresholds129:
;String.c,574 :: 		err = NVMWriteWord(pos,val[3]);
>>>>>>> temp
ADDIU	R2, SP, 12
ADDIU	R2, R2, 12
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
SH	R2, 528(SP)
;String.c,576 :: 		pos += 4;
LW	R2, 524(SP)
ADDIU	R2, R2, 4
SW	R2, 524(SP)
<<<<<<< HEAD
BEQ	R25, R0, L__Write_Thresholds258
NOP	
J	L_Write_Thresholds122
NOP	
L__Write_Thresholds258:
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds260
NOP	
J	L_Write_Thresholds123
NOP	
L__Write_Thresholds260:
=======
;String.c,577 :: 		if(!data_src){
BEQ	R25, R0, L__Write_Thresholds268
NOP	
J	L_Write_Thresholds130
NOP	
L__Write_Thresholds268:
;String.c,578 :: 		if(string[5] != NULL)
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__Write_Thresholds270
NOP	
J	L_Write_Thresholds131
NOP	
L__Write_Thresholds270:
;String.c,579 :: 		val[4] = atol(string[5]);
>>>>>>> temp
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
<<<<<<< HEAD
L_Write_Thresholds123:
=======
L_Write_Thresholds131:
;String.c,580 :: 		err = NVMWriteWord(pos,val[4]);
>>>>>>> temp
ADDIU	R2, SP, 12
ADDIU	R2, R2, 16
SB	R25, 8(SP)
LW	R26, 0(R2)
LW	R25, 524(SP)
JAL	_NVMWriteWord+0
NOP	
LB	R25, 8(SP)
SH	R2, 528(SP)
<<<<<<< HEAD
L_Write_Thresholds122:
=======
;String.c,581 :: 		}
L_Write_Thresholds130:
;String.c,586 :: 		sprintf(txtR,"%x",err);
>>>>>>> temp
ADDIU	R3, SP, 530
LH	R2, 528(SP)
SB	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
<<<<<<< HEAD
LUI	R2, hi_addr(?lstr_71_String+0)
ORI	R2, R2, lo_addr(?lstr_71_String+0)
=======
LUI	R2, hi_addr(?lstr_79_String+0)
ORI	R2, R2, lo_addr(?lstr_79_String+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,587 :: 		strcpy(str,txtR);
ADDIU	R3, SP, 530
ADDIU	R2, SP, 545
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,588 :: 		strcat(str," \r\n ");
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
;String.c,589 :: 		return str;
ADDIU	R2, SP, 545
;String.c,590 :: 		}
;String.c,589 :: 		return str;
;String.c,590 :: 		}
L_end_Write_Thresholds:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 624
JR	RA
NOP	
; end of _Write_Thresholds
_testStrings:
;String.c,595 :: 		void testStrings(char* writebuff){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;String.c,596 :: 		if(strlen(string[0])!=0){
SW	R26, 4(SP)
SW	R27, 8(SP)
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
<<<<<<< HEAD
BNE	R2, R0, L__testStrings263
NOP	
J	L_testStrings124
NOP	
L__testStrings263:
=======
BNE	R2, R0, L__testStrings273
NOP	
J	L_testStrings132
NOP	
L__testStrings273:
;String.c,597 :: 		strncat(writebuff,string[0],strlen(string[0]));
>>>>>>> temp
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
;String.c,598 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 16(SP)
MOVZ	R30, R0, R0
SB	R30, 17(SP)
ADDIU	R2, SP, 16
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
<<<<<<< HEAD
L_testStrings124:
=======
;String.c,599 :: 		}
L_testStrings132:
;String.c,600 :: 		if(strlen(string[1])!=0){
>>>>>>> temp
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
<<<<<<< HEAD
BNE	R2, R0, L__testStrings265
NOP	
J	L_testStrings125
NOP	
L__testStrings265:
=======
BNE	R2, R0, L__testStrings275
NOP	
J	L_testStrings133
NOP	
L__testStrings275:
;String.c,601 :: 		strncat(writebuff,string[1],strlen(string[1]));
>>>>>>> temp
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
;String.c,602 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 18(SP)
MOVZ	R30, R0, R0
SB	R30, 19(SP)
ADDIU	R2, SP, 18
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
<<<<<<< HEAD
L_testStrings125:
=======
;String.c,603 :: 		}
L_testStrings133:
;String.c,604 :: 		if(strlen(string[2])!=0){
>>>>>>> temp
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
<<<<<<< HEAD
BNE	R2, R0, L__testStrings267
NOP	
J	L_testStrings126
NOP	
L__testStrings267:
=======
BNE	R2, R0, L__testStrings277
NOP	
J	L_testStrings134
NOP	
L__testStrings277:
;String.c,605 :: 		strncat(writebuff,string[2],strlen(string[2]));
>>>>>>> temp
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
;String.c,606 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 20(SP)
MOVZ	R30, R0, R0
SB	R30, 21(SP)
ADDIU	R2, SP, 20
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
<<<<<<< HEAD
L_testStrings126:
=======
;String.c,607 :: 		}
L_testStrings134:
;String.c,608 :: 		if(strlen(string[3])!=0){
>>>>>>> temp
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
<<<<<<< HEAD
BNE	R2, R0, L__testStrings269
NOP	
J	L_testStrings127
NOP	
L__testStrings269:
=======
BNE	R2, R0, L__testStrings279
NOP	
J	L_testStrings135
NOP	
L__testStrings279:
;String.c,609 :: 		strncat(writebuff,string[3],strlen(string[3]));
>>>>>>> temp
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
;String.c,610 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 22(SP)
MOVZ	R30, R0, R0
SB	R30, 23(SP)
ADDIU	R2, SP, 22
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
<<<<<<< HEAD
L_testStrings127:
=======
;String.c,611 :: 		}
L_testStrings135:
;String.c,612 :: 		if(strlen(string[4])!=0){
>>>>>>> temp
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
<<<<<<< HEAD
BNE	R2, R0, L__testStrings271
NOP	
J	L_testStrings128
NOP	
L__testStrings271:
=======
BNE	R2, R0, L__testStrings281
NOP	
J	L_testStrings136
NOP	
L__testStrings281:
;String.c,613 :: 		strncat(writebuff,string[4],strlen(string[4]));
>>>>>>> temp
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
;String.c,614 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 24(SP)
MOVZ	R30, R0, R0
SB	R30, 25(SP)
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
<<<<<<< HEAD
L_testStrings128:
=======
;String.c,615 :: 		}
L_testStrings136:
;String.c,616 :: 		if(strlen(string[5])!=0){
>>>>>>> temp
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
<<<<<<< HEAD
BNE	R2, R0, L__testStrings273
NOP	
J	L_testStrings129
NOP	
L__testStrings273:
=======
BNE	R2, R0, L__testStrings283
NOP	
J	L_testStrings137
NOP	
L__testStrings283:
;String.c,617 :: 		strncat(writebuff,string[5],strlen(string[5]));
>>>>>>> temp
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
;String.c,618 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
ADDIU	R2, SP, 26
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
<<<<<<< HEAD
L_testStrings129:
=======
;String.c,619 :: 		}
L_testStrings137:
;String.c,620 :: 		if(strlen(string[6])!=0){
>>>>>>> temp
SW	R25, 12(SP)
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
LW	R25, 12(SP)
SEH	R2, R2
<<<<<<< HEAD
BNE	R2, R0, L__testStrings275
NOP	
J	L_testStrings130
NOP	
L__testStrings275:
=======
BNE	R2, R0, L__testStrings285
NOP	
J	L_testStrings138
NOP	
L__testStrings285:
;String.c,621 :: 		strncat(writebuff,string[6],strlen(string[6]));
>>>>>>> temp
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
;String.c,622 :: 		strcat(writebuff,":");
ORI	R30, R0, 58
SB	R30, 28(SP)
MOVZ	R30, R0, R0
SB	R30, 29(SP)
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
JAL	_strcat+0
NOP	
<<<<<<< HEAD
L_testStrings130:
=======
;String.c,623 :: 		}
L_testStrings138:
;String.c,625 :: 		}
>>>>>>> temp
L_end_testStrings:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _testStrings
_TestFlash:
;String.c,627 :: 		char* TestFlash(){
ADDIU	SP, SP, -120
SW	RA, 0(SP)
;String.c,633 :: 		char* tr = "112233";
SW	R25, 4(SP)
SW	R26, 8(SP)
;String.c,641 :: 		Val_ =  ReadFlashWord();
JAL	_ReadFlashWord+0
NOP	
; Val_ start address is: 24 (R6)
MOVZ	R6, R2, R0
;String.c,644 :: 		strcpy(str,"Val || ");
ADDIU	R23, SP, 98
ADDIU	R22, R23, 8
<<<<<<< HEAD
LUI	R24, hi_addr(?ICS?lstr81_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr81_String+0)
=======
LUI	R24, hi_addr(?ICS?lstr89_String+0)
ORI	R24, R24, lo_addr(?ICS?lstr89_String+0)
>>>>>>> temp
JAL	___CC2DW+0
NOP	
ADDIU	R3, SP, 98
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;String.c,645 :: 		LongWordToHex(Val_,txtR);
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
MOVZ	R25, R6, R0
; Val_ end address is: 24 (R6)
JAL	_LongWordToHex+0
NOP	
;String.c,647 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,648 :: 		strcat(str," || ");
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
;String.c,650 :: 		sprintf(txtR,"%u",res);//Threshold.R_thresh);
ADDIU	R3, SP, 12
LHU	R2, 96(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
<<<<<<< HEAD
LUI	R2, hi_addr(?lstr_83_String+0)
ORI	R2, R2, lo_addr(?lstr_83_String+0)
=======
LUI	R2, hi_addr(?lstr_91_String+0)
ORI	R2, R2, lo_addr(?lstr_91_String+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;String.c,651 :: 		strcat(str,txtR);
ADDIU	R3, SP, 12
ADDIU	R2, SP, 32
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcat+0
NOP	
;String.c,652 :: 		strcat(str," ||\r\n ");
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
;String.c,654 :: 		return &str;
ADDIU	R2, SP, 32
;String.c,655 :: 		}
;String.c,654 :: 		return &str;
;String.c,655 :: 		}
L_end_TestFlash:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 120
JR	RA
NOP	
; end of _TestFlash
_PrintHandler:
;String.c,662 :: 		void PrintHandler(char c){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;String.c,664 :: 		UART1_Write(c);
ANDI	R25, R25, 255
JAL	_UART1_Write+0
NOP	
;String.c,666 :: 		}
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
