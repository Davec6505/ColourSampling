_InitGSM3:
;Sim800.c,84 :: 		void InitGSM3(){
ADDIU	SP, SP, -108
SW	RA, 0(SP)
;Sim800.c,85 :: 		SimVars.initial_str = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SB	R0, Offset(_SimVars+0)(GP)
;Sim800.c,86 :: 		SimVars.init_inc    = 0;
SB	R0, Offset(_SimVars+1)(GP)
;Sim800.c,87 :: 		*SimTestTxt = "Hello World this is a test";
ORI	R2, R0, lo_addr(?lstr_1_Sim800+0)
ANDI	R2, R2, 255
SB	R2, Offset(_SimTestTxt+0)(GP)
;Sim800.c,88 :: 		RB.head = 0;
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,89 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
;Sim800.c,90 :: 		RB.rcv_txt_fin = -1;
ORI	R2, R0, 255
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,91 :: 		SF.SimFlashPtr = 0;
SH	R0, Offset(_SF+630)(GP)
;Sim800.c,92 :: 		strcpy(SF.SimCelNum,"\"****************\"");
ADDIU	R23, SP, 12
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr2_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_strcpy+0
NOP	
;Sim800.c,93 :: 		strcpy(SF.WriteAPIKey,"\"****************\"");
ADDIU	R23, SP, 31
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr3_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 31
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strcpy+0
NOP	
;Sim800.c,94 :: 		strcpy(SF.ReadAPIKey,"\"****************\"");
ADDIU	R23, SP, 50
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr4_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr4_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 50
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_strcpy+0
NOP	
;Sim800.c,95 :: 		strcpy(SF.APN,"\"****************\"");
ADDIU	R23, SP, 69
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr5_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr5_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 69
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_strcpy+0
NOP	
;Sim800.c,96 :: 		strcpy(SF.PWD,"\"****************\"");
ADDIU	R23, SP, 88
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr6_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr6_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 88
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_strcpy+0
NOP	
;Sim800.c,97 :: 		}
L_end_InitGSM3:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 108
JR	RA
NOP	
; end of _InitGSM3
_PwrUpGSM3:
;Sim800.c,102 :: 		void PwrUpGSM3(){
;Sim800.c,103 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,104 :: 		PWR = 0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,105 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM30
NOP	
;Sim800.c,106 :: 		PWR = 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,108 :: 		while(STAT){
L_PwrUpGSM32:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrUpGSM3188
NOP	
J	L_PwrUpGSM33
NOP	
L__PwrUpGSM3188:
;Sim800.c,109 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,110 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM34
NOP	
;Sim800.c,111 :: 		}
J	L_PwrUpGSM32
NOP	
L_PwrUpGSM33:
;Sim800.c,112 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM36
NOP	
NOP	
NOP	
;Sim800.c,113 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_WriteToFlashTemp:
;Sim800.c,118 :: 		void WriteToFlashTemp(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,124 :: 		memset(buff,0,100);//SL.lTotA);                  //make every byte NULL
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R27, R0, 100
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_buff+0)
ORI	R25, R25, lo_addr(_buff+0)
JAL	_memset+0
NOP	
;Sim800.c,125 :: 		memcpy(buff,SF.SimCelNum,19);//SL.l1+1);          //Save Cell num
ORI	R27, R0, 19
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
LUI	R25, hi_addr(_buff+0)
ORI	R25, R25, lo_addr(_buff+0)
JAL	_memcpy+0
NOP	
;Sim800.c,126 :: 		memcpy(buff+20,SF.WriteAPIKey,19);//Save API Wr Key
ORI	R27, R0, 19
LUI	R26, hi_addr(_SF+38)
ORI	R26, R26, lo_addr(_SF+38)
LUI	R25, hi_addr(_buff+20)
ORI	R25, R25, lo_addr(_buff+20)
JAL	_memcpy+0
NOP	
;Sim800.c,127 :: 		memcpy(buff+40,SF.ReadAPIKey,19); //Save API Rd Key
ORI	R27, R0, 19
LUI	R26, hi_addr(_SF+58)
ORI	R26, R26, lo_addr(_SF+58)
LUI	R25, hi_addr(_buff+40)
ORI	R25, R25, lo_addr(_buff+40)
JAL	_memcpy+0
NOP	
;Sim800.c,128 :: 		memcpy(buff+60,SF.APN,19);        //Save APN
ORI	R27, R0, 19
LUI	R26, hi_addr(_SF+78)
ORI	R26, R26, lo_addr(_SF+78)
LUI	R25, hi_addr(_buff+60)
ORI	R25, R25, lo_addr(_buff+60)
JAL	_memcpy+0
NOP	
;Sim800.c,129 :: 		memcpy(buff+80,SF.PWD,19);        //Save PWD
ORI	R27, R0, 19
LUI	R26, hi_addr(_SF+98)
ORI	R26, R26, lo_addr(_SF+98)
LUI	R25, hi_addr(_buff+80)
ORI	R25, R25, lo_addr(_buff+80)
JAL	_memcpy+0
NOP	
;Sim800.c,131 :: 		memcpy(temp,buff,100);
ORI	R27, R0, 100
LUI	R26, hi_addr(_buff+0)
ORI	R26, R26, lo_addr(_buff+0)
LUI	R25, hi_addr(_temp+0)
ORI	R25, R25, lo_addr(_temp+0)
JAL	_memcpy+0
NOP	
;Sim800.c,133 :: 		pos = FLASH_Settings_PAddr;
; pos start address is: 12 (R3)
LW	R3, Offset(_FLASH_Settings_PAddr+0)(GP)
;Sim800.c,134 :: 		j = NVMErasePage(pos);
SW	R3, 16(SP)
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R3, 16(SP)
SH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
;Sim800.c,135 :: 		if(j==0){
SEH	R2, R2
BEQ	R2, R0, L__WriteToFlashTemp190
NOP	
J	L_WriteToFlashTemp8
NOP	
L__WriteToFlashTemp190:
;Sim800.c,136 :: 		pos += 20 ;
ADDIU	R2, R3, 20
; pos end address is: 12 (R3)
; pos start address is: 16 (R4)
MOVZ	R4, R2, R0
;Sim800.c,137 :: 		for(i=0;i<100;i++){
SH	R0, Offset(WriteToFlashTemp_i_L0+0)(GP)
; pos end address is: 16 (R4)
L_WriteToFlashTemp9:
; pos start address is: 16 (R4)
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLTI	R2, R2, 100
BNE	R2, R0, L__WriteToFlashTemp191
NOP	
J	L_WriteToFlashTemp10
NOP	
L__WriteToFlashTemp191:
;Sim800.c,138 :: 		j = NVMWriteWord(pos,temp[i]);
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_temp+0)
ORI	R2, R2, lo_addr(_temp+0)
ADDU	R2, R2, R3
SW	R4, 16(SP)
LW	R26, 0(R2)
MOVZ	R25, R4, R0
JAL	_NVMWriteWord+0
NOP	
LW	R4, 16(SP)
SH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
;Sim800.c,139 :: 		pos += 4;
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
;Sim800.c,140 :: 		Delay_ms(5);
LUI	R24, 2
ORI	R24, R24, 2260
L_WriteToFlashTemp12:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WriteToFlashTemp12
NOP	
NOP	
NOP	
;Sim800.c,137 :: 		for(i=0;i<100;i++){
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
;Sim800.c,141 :: 		}
; pos end address is: 16 (R4)
J	L_WriteToFlashTemp9
NOP	
L_WriteToFlashTemp10:
;Sim800.c,142 :: 		}
L_WriteToFlashTemp8:
;Sim800.c,146 :: 		sprintf(a,"%d",i);
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_7_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,147 :: 		sprintf(b,"%d",j);
LH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_8_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_8_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,151 :: 		,a,b);
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 8(SP)
;Sim800.c,150 :: 		" * flash err:   %s\r\n"
LUI	R2, hi_addr(?lstr_9_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_9_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,148 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,151 :: 		,a,b);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
;Sim800.c,153 :: 		}
L_end_WriteToFlashTemp:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _WriteToFlashTemp
_GetValuesFromFlash:
;Sim800.c,158 :: 		char* GetValuesFromFlash(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,162 :: 		ptr = (unsigned char*)FLASH_Settings_VAddr;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LWR	R2, Offset(_FLASH_Settings_VAddr+0)(GP)
LWL	R2, Offset(_FLASH_Settings_VAddr+3)(GP)
SW	R2, Offset(_ptr+0)(GP)
;Sim800.c,163 :: 		ptr += 20;
LW	R2, Offset(_FLASH_Settings_VAddr+0)(GP)
ADDIU	R2, R2, 20
SW	R2, Offset(_ptr+0)(GP)
;Sim800.c,165 :: 		for(i=0;i<100;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_GetValuesFromFlash14:
; i start address is: 16 (R4)
SLTIU	R2, R4, 100
BNE	R2, R0, L__GetValuesFromFlash193
NOP	
J	L_GetValuesFromFlash15
NOP	
L__GetValuesFromFlash193:
;Sim800.c,166 :: 		buff[i] = ptr[i];
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R3, R2, R4
LW	R2, Offset(_ptr+0)(GP)
ADDU	R2, R2, R4
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Sim800.c,168 :: 		UART1_Write(buff[i]);
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R4
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,169 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
;Sim800.c,165 :: 		for(i=0;i<100;i++){
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Sim800.c,171 :: 		}
; i end address is: 16 (R4)
J	L_GetValuesFromFlash14
NOP	
L_GetValuesFromFlash15:
;Sim800.c,172 :: 		strncpy(SF.SimCelNum,buff,19);
ORI	R27, R0, 19
LUI	R26, hi_addr(_buff+0)
ORI	R26, R26, lo_addr(_buff+0)
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_strncpy+0
NOP	
;Sim800.c,173 :: 		strncpy(SF.WriteAPIKey,buff+20,19);
ORI	R27, R0, 19
LUI	R26, hi_addr(_buff+20)
ORI	R26, R26, lo_addr(_buff+20)
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strncpy+0
NOP	
;Sim800.c,174 :: 		strncpy(SF.ReadAPIKey,buff+40,19);
ORI	R27, R0, 19
LUI	R26, hi_addr(_buff+40)
ORI	R26, R26, lo_addr(_buff+40)
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_strncpy+0
NOP	
;Sim800.c,175 :: 		strncpy(SF.APN,buff+60,19);
ORI	R27, R0, 19
LUI	R26, hi_addr(_buff+60)
ORI	R26, R26, lo_addr(_buff+60)
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_strncpy+0
NOP	
;Sim800.c,176 :: 		strncpy(SF.PWD,buff+80,19);
ORI	R27, R0, 19
LUI	R26, hi_addr(_buff+80)
ORI	R26, R26, lo_addr(_buff+80)
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_strncpy+0
NOP	
;Sim800.c,185 :: 		,SF.ReadAPIKey,SF.APN,SF.PWD);
LUI	R2, hi_addr(_SF+98)
ORI	R2, R2, lo_addr(_SF+98)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LUI	R2, hi_addr(_SF+78)
ORI	R2, R2, lo_addr(_SF+78)
SW	R2, 20(SP)
LUI	R2, hi_addr(_SF+58)
ORI	R2, R2, lo_addr(_SF+58)
SW	R2, 16(SP)
;Sim800.c,184 :: 		,SF.SimCelNum,SF.WriteAPIKey
LUI	R2, hi_addr(_SF+38)
ORI	R2, R2, lo_addr(_SF+38)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
SW	R2, 8(SP)
;Sim800.c,183 :: 		" * SF.PWD:         %s\r\n"
LUI	R2, hi_addr(?lstr_10_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_10_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,178 :: 		PrintOut(PrintHandler, " * Flash Read        \r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,185 :: 		,SF.ReadAPIKey,SF.APN,SF.PWD);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 28
;Sim800.c,187 :: 		return SF.SimCelNum;
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
;Sim800.c,188 :: 		}
;Sim800.c,187 :: 		return SF.SimCelNum;
;Sim800.c,188 :: 		}
L_end_GetValuesFromFlash:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _GetValuesFromFlash
_GetStrLengths:
;Sim800.c,193 :: 		void GetStrLengths(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,195 :: 		SL.l1 = strlen(SF.SimCelNum)+1;   //len of cell num
SW	R25, 4(SP)
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SL+0)(GP)
;Sim800.c,196 :: 		SL.l2 = strlen(SF.WriteAPIKey)+1; //len of API Write key
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SL+2)(GP)
;Sim800.c,197 :: 		SL.l3 = strlen(SF.ReadAPIKey)+1;  //len of API Read Key
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SL+4)(GP)
;Sim800.c,198 :: 		SL.l4 = strlen(SF.APN)+1;         //len of APN
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SL+6)(GP)
;Sim800.c,199 :: 		SL.l5 = strlen(SF.PWD)+1;         //len of PWD
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_strlen+0
NOP	
ADDIU	R4, R2, 1
SH	R4, Offset(_SL+8)(GP)
;Sim800.c,202 :: 		SL.lTotA = SL.l1 + SL.l2 + SL.l3 + SL.l4 + SL.l5;
LH	R3, Offset(_SL+2)(GP)
LH	R2, Offset(_SL+0)(GP)
ADDU	R3, R2, R3
LH	R2, Offset(_SL+4)(GP)
ADDU	R3, R3, R2
LH	R2, Offset(_SL+6)(GP)
ADDU	R2, R3, R2
ADDU	R3, R2, R4
SH	R3, Offset(_SL+14)(GP)
;Sim800.c,204 :: 		SL.mod = SL.lTotA % 4;  //total divisable by 4 = flash Wrd size
ORI	R2, R0, 4
DIV	R3, R2
MFHI	R3
SH	R3, Offset(_SL+18)(GP)
;Sim800.c,205 :: 		SL.mod = 4 - SL.mod;
ORI	R2, R0, 4
SUBU	R3, R2, R3
SH	R3, Offset(_SL+18)(GP)
;Sim800.c,206 :: 		SL.lTotA += SL.mod;
LH	R2, Offset(_SL+14)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SL+14)(GP)
;Sim800.c,209 :: 		sprintf(a,"%d",SL.l1);
LH	R2, Offset(_SL+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_11_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_11_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,210 :: 		sprintf(b,"%d",SL.l2);
LH	R2, Offset(_SL+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_12_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_12_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,211 :: 		sprintf(c,"%d",SL.l3);
LH	R2, Offset(_SL+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_13_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_13_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_c+0)
ORI	R2, R2, lo_addr(_c+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,212 :: 		sprintf(d,"%d",SL.l4);
LH	R2, Offset(_SL+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_14_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_14_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_d+0)
ORI	R2, R2, lo_addr(_d+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,213 :: 		sprintf(e,"%d",SL.l5);
LH	R2, Offset(_SL+8)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_15_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_15_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_e+0)
ORI	R2, R2, lo_addr(_e+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,214 :: 		sprintf(f,"%d",SL.lTotA);
LH	R2, Offset(_SL+14)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_16_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_16_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_f+0)
ORI	R2, R2, lo_addr(_f+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,222 :: 		,a,b,c,d,e,f);
LUI	R2, hi_addr(_f+0)
ORI	R2, R2, lo_addr(_f+0)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
LUI	R2, hi_addr(_e+0)
ORI	R2, R2, lo_addr(_e+0)
SW	R2, 24(SP)
LUI	R2, hi_addr(_d+0)
ORI	R2, R2, lo_addr(_d+0)
SW	R2, 20(SP)
LUI	R2, hi_addr(_c+0)
ORI	R2, R2, lo_addr(_c+0)
SW	R2, 16(SP)
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 8(SP)
;Sim800.c,221 :: 		" * lTotA: %s\r\n"
LUI	R2, hi_addr(?lstr_17_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_17_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,215 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,222 :: 		,a,b,c,d,e,f);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,224 :: 		}
L_end_GetStrLengths:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _GetStrLengths
_RcvSimTxt:
;Sim800.c,229 :: 		void RcvSimTxt(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,231 :: 		while(UART2_Data_Ready()) {     // If data is received
L_RcvSimTxt17:
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__RcvSimTxt197
NOP	
J	L_RcvSimTxt18
NOP	
L__RcvSimTxt197:
;Sim800.c,232 :: 		if (U2STAbits.FERR || U2STAbits.OERR){
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__RcvSimTxt198
NOP	
J	L__RcvSimTxt174
NOP	
L__RcvSimTxt198:
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__RcvSimTxt199
NOP	
J	L__RcvSimTxt173
NOP	
L__RcvSimTxt199:
J	L_RcvSimTxt21
NOP	
L__RcvSimTxt174:
L__RcvSimTxt173:
;Sim800.c,233 :: 		if (U2STAbits.FERR ){
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BNE	R2, R0, L__RcvSimTxt201
NOP	
J	L_RcvSimTxt22
NOP	
L__RcvSimTxt201:
;Sim800.c,234 :: 		U2STAbits.FERR = 0;
ORI	R2, R0, 4
SW	R2, Offset(U2STAbits+4)(GP)
;Sim800.c,235 :: 		goto m0;
J	___RcvSimTxt_m0
NOP	
;Sim800.c,236 :: 		}
L_RcvSimTxt22:
;Sim800.c,237 :: 		if(U2STAbits.OERR)
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__RcvSimTxt203
NOP	
J	L_RcvSimTxt23
NOP	
L__RcvSimTxt203:
;Sim800.c,238 :: 		U2STAbits.OERR = 0;
ORI	R2, R0, 2
SW	R2, Offset(U2STAbits+4)(GP)
L_RcvSimTxt23:
;Sim800.c,239 :: 		}
L_RcvSimTxt21:
;Sim800.c,240 :: 		m0:
___RcvSimTxt_m0:
;Sim800.c,241 :: 		txt = U2RXREG;
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Sim800.c,242 :: 		U1TXREG = txt;
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,243 :: 		if(txt >= 0x20){
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt204
NOP	
J	L_RcvSimTxt24
NOP	
L__RcvSimTxt204:
;Sim800.c,244 :: 		RB.buff[RB.head] = txt;
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
SB	R4, 0(R2)
; txt end address is: 16 (R4)
;Sim800.c,245 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,246 :: 		}else if(U2RXREG == 0x0A){
J	L_RcvSimTxt25
NOP	
L_RcvSimTxt24:
LW	R3, Offset(U2RXREG+0)(GP)
ORI	R2, R0, 10
BEQ	R3, R2, L__RcvSimTxt205
NOP	
J	L_RcvSimTxt26
NOP	
L__RcvSimTxt205:
;Sim800.c,247 :: 		RB.buff[RB.head] = ',';
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
ORI	R2, R0, 44
SB	R2, 0(R3)
;Sim800.c,248 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,249 :: 		}
L_RcvSimTxt26:
L_RcvSimTxt25:
;Sim800.c,250 :: 		if(RB.head > 999){
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RcvSimTxt206
NOP	
J	L_RcvSimTxt27
NOP	
L__RcvSimTxt206:
;Sim800.c,251 :: 		RB.head = 0;             //rest head when buffer is full
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,252 :: 		}
L_RcvSimTxt27:
;Sim800.c,253 :: 		}
J	L_RcvSimTxt17
NOP	
L_RcvSimTxt18:
;Sim800.c,254 :: 		RB.rcv_txt_fin = 1;
ORI	R2, R0, 1
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,255 :: 		}
L_end_RcvSimTxt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RcvSimTxt
_TestRingPointers:
;Sim800.c,260 :: 		int TestRingPointers(){
;Sim800.c,262 :: 		if(RB.tail > RB.head){
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__TestRingPointers208
NOP	
J	L_TestRingPointers28
NOP	
L__TestRingPointers208:
;Sim800.c,263 :: 		diff = 1000 - RB.tail;
LHU	R3, Offset(_RB+1004)(GP)
ORI	R2, R0, 1000
SUBU	R3, R2, R3
;Sim800.c,264 :: 		diff += RB.head;
LHU	R2, Offset(_RB+1002)(GP)
ADDU	R2, R3, R2
; diff start address is: 8 (R2)
;Sim800.c,265 :: 		}else{
; diff end address is: 8 (R2)
J	L_TestRingPointers29
NOP	
L_TestRingPointers28:
;Sim800.c,266 :: 		diff = RB.head - RB.tail;
LHU	R3, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SUBU	R2, R2, R3
; diff start address is: 12 (R3)
ANDI	R3, R2, 65535
; diff end address is: 12 (R3)
SEH	R2, R3
;Sim800.c,267 :: 		}
L_TestRingPointers29:
;Sim800.c,268 :: 		return diff;
; diff start address is: 8 (R2)
; diff end address is: 8 (R2)
;Sim800.c,269 :: 		}
L_end_TestRingPointers:
JR	RA
NOP	
; end of _TestRingPointers
_WaitForResponse:
;Sim800.c,274 :: 		void WaitForResponse(short dly){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,276 :: 		lastMillis = TMR0.millis;
; lastMillis start address is: 20 (R5)
LW	R5, Offset(_TMR0+0)(GP)
;Sim800.c,277 :: 		RB.rcv_txt_fin   = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,278 :: 		RB.last_head     = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,279 :: 		do{
J	L_WaitForResponse30
NOP	
L__WaitForResponse175:
;Sim800.c,298 :: 		}while(!RB.rcv_txt_fin);
;Sim800.c,279 :: 		do{
L_WaitForResponse30:
;Sim800.c,280 :: 		LATE3_bit = !LATE3_bit;
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,281 :: 		if(dly == 0)
SEB	R2, R25
BEQ	R2, R0, L__WaitForResponse210
NOP	
J	L_WaitForResponse33
NOP	
L__WaitForResponse210:
; lastMillis end address is: 20 (R5)
;Sim800.c,282 :: 		Delay_ms(100);
; lastMillis start address is: 20 (R5)
LUI	R24, 40
ORI	R24, R24, 45226
L_WaitForResponse34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse34
NOP	
J	L_WaitForResponse36
NOP	
L_WaitForResponse33:
;Sim800.c,283 :: 		else if(dly == 1)
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForResponse211
NOP	
J	L_WaitForResponse37
NOP	
L__WaitForResponse211:
;Sim800.c,284 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForResponse38:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse38
NOP	
NOP	
NOP	
J	L_WaitForResponse40
NOP	
L_WaitForResponse37:
;Sim800.c,285 :: 		else if(dly == 3){
SEB	R3, R25
ORI	R2, R0, 3
BEQ	R3, R2, L__WaitForResponse212
NOP	
J	L_WaitForResponse41
NOP	
L__WaitForResponse212:
;Sim800.c,286 :: 		UART2_Write_Text("ATE0");
ORI	R30, R0, 65
SB	R30, 5(SP)
ORI	R30, R0, 84
SB	R30, 6(SP)
ORI	R30, R0, 69
SB	R30, 7(SP)
ORI	R30, R0, 48
SB	R30, 8(SP)
MOVZ	R30, R0, R0
SB	R30, 9(SP)
ADDIU	R2, SP, 5
SB	R25, 4(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,287 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,288 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LB	R25, 4(SP)
;Sim800.c,289 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_WaitForResponse42:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse42
NOP	
NOP	
NOP	
;Sim800.c,290 :: 		}
J	L_WaitForResponse44
NOP	
L_WaitForResponse41:
;Sim800.c,292 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse45:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse45
NOP	
L_WaitForResponse44:
L_WaitForResponse40:
L_WaitForResponse36:
;Sim800.c,295 :: 		newMillis = TMR0.millis - lastMillis;
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,296 :: 		if(newMillis > 25000)
SLTIU	R2, R2, 25001
BEQ	R2, R0, L__WaitForResponse213
NOP	
J	L_WaitForResponse47
NOP	
L__WaitForResponse213:
; lastMillis end address is: 20 (R5)
;Sim800.c,297 :: 		break;
J	L_WaitForResponse31
NOP	
L_WaitForResponse47:
;Sim800.c,298 :: 		}while(!RB.rcv_txt_fin);
; lastMillis start address is: 20 (R5)
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForResponse215
NOP	
J	L__WaitForResponse175
NOP	
L__WaitForResponse215:
; lastMillis end address is: 20 (R5)
L_WaitForResponse31:
;Sim800.c,299 :: 		}
L_end_WaitForResponse:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WaitForResponse
_RingToTempBuf:
;Sim800.c,304 :: 		void RingToTempBuf(){
;Sim800.c,306 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,307 :: 		RB.tail = RB.last_tail;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
; i end address is: 20 (R5)
;Sim800.c,309 :: 		while(RB.tail != RB.head){
L_RingToTempBuf48:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
BNE	R2, R3, L__RingToTempBuf218
NOP	
J	L_RingToTempBuf49
NOP	
L__RingToTempBuf218:
;Sim800.c,310 :: 		SimTestTxt[i] = RB.buff[RB.tail];
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R4, R2, R3
LHU	R3, Offset(_RB+1004)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Sim800.c,315 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,316 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,317 :: 		if(RB.tail > 999)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RingToTempBuf219
NOP	
J	L_RingToTempBuf50
NOP	
L__RingToTempBuf219:
;Sim800.c,318 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
L_RingToTempBuf50:
;Sim800.c,319 :: 		};
J	L_RingToTempBuf48
NOP	
L_RingToTempBuf49:
;Sim800.c,320 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,322 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,323 :: 		}
L_end_RingToTempBuf:
JR	RA
NOP	
; end of _RingToTempBuf
_SetupIOT:
;Sim800.c,329 :: 		char SetupIOT(){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Sim800.c,339 :: 		" * ATE0\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(?lstr_19_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_19_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,338 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,339 :: 		" * ATE0\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,342 :: 		WaitForResponse(3);
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
;Sim800.c,343 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT51:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT51
NOP	
;Sim800.c,344 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,350 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,349 :: 		" * Check if Sim is Registered\r\n"
LUI	R2, hi_addr(?lstr_20_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_20_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,347 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,350 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,352 :: 		wait:
___SetupIOT_wait:
;Sim800.c,354 :: 		UART2_Write_Text("AT+CREG?");
ADDIU	R23, SP, 12
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr21_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr21_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,355 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,356 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,357 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,358 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT53:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT53
NOP	
NOP	
NOP	
;Sim800.c,359 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,364 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,363 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_22_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_22_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,362 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,364 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,368 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT221
NOP	
J	L_SetupIOT55
NOP	
L__SetupIOT221:
;Sim800.c,370 :: 		num_strs = strsplit(SimTestTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
;Sim800.c,373 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_23_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_23_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,383 :: 		,string[3],string[4]);
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
;Sim800.c,382 :: 		,string[1],string[2]
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
;Sim800.c,381 :: 		,txtA,string[0]
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,380 :: 		" *string[4]  %s\r\n"
LUI	R2, hi_addr(?lstr_24_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_24_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,374 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,383 :: 		,string[3],string[4]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,385 :: 		str_rcv = findnumber(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
SW	R2, Offset(_str_rcv+0)(GP)
;Sim800.c,386 :: 		res = atoi(str_rcv);  //get the sms rec number
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,387 :: 		if(res == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT222
NOP	
J	L_SetupIOT56
NOP	
L__SetupIOT222:
;Sim800.c,389 :: 		sprintf(txtA,"%d",res);
ADDIU	SP, SP, -12
SH	R4, 8(SP)
; res end address is: 16 (R4)
LUI	R2, hi_addr(?lstr_25_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_25_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,392 :: 		,txtA);
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,391 :: 		" *Registered with:= %s\r\n"
LUI	R2, hi_addr(?lstr_26_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_26_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,390 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,392 :: 		,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,395 :: 		}else{
J	L_SetupIOT57
NOP	
L_SetupIOT56:
;Sim800.c,398 :: 		" *Sim Not Registered\r\n");
LUI	R2, hi_addr(?lstr_27_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_27_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,397 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,398 :: 		" *Sim Not Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,400 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT58:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT58
NOP	
NOP	
NOP	
;Sim800.c,401 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,402 :: 		}
L_SetupIOT57:
;Sim800.c,403 :: 		}
L_SetupIOT55:
;Sim800.c,406 :: 		" *Sim Registered\r\n");
LUI	R2, hi_addr(?lstr_28_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_28_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,405 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,406 :: 		" *Sim Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,410 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,411 :: 		}
;Sim800.c,410 :: 		return 1;
;Sim800.c,411 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,418 :: 		char WaitForSetupSMS(unsigned int Indx){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Sim800.c,423 :: 		UART2_Write_Text("AT+CMGF=1");
SW	R26, 4(SP)
SW	R27, 8(SP)
ADDIU	R23, SP, 16
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr29_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr29_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 16
SH	R25, 12(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,424 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,425 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,428 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,429 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,431 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS60:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS60
NOP	
;Sim800.c,433 :: 		WaitForResponse(0);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,434 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS62:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS62
NOP	
;Sim800.c,435 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,437 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 84 (R21)
SEH	R21, R2
;Sim800.c,440 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_30_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_30_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,441 :: 		sprintf(txtA,"%d",num_strs);
; num_strs end address is: 84 (R21)
ADDIU	SP, SP, -12
SH	R21, 8(SP)
LUI	R2, hi_addr(?lstr_31_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_31_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,452 :: 		string[4],string[5]);
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,451 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,450 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,449 :: 		" *string[5]  %s\r\n"
LUI	R2, hi_addr(?lstr_32_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_32_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,442 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,452 :: 		string[4],string[5]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
;Sim800.c,455 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 14(SP)
;Sim800.c,456 :: 		sprintf(sms,"%d",res);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_33_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_33_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,460 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,459 :: 		" *sms no:= %s\r\n"
LUI	R2, hi_addr(?lstr_34_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_34_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,458 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,460 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,464 :: 		UART2_Write_Text("AT+CMGR=");
ADDIU	R23, SP, 26
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr35_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr35_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 26
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,465 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,466 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,467 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,469 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,470 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS64:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS64
NOP	
;Sim800.c,471 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,473 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
;Sim800.c,475 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_36_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_36_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,491 :: 		,string[8]);
LUI	R2, hi_addr(_string+512)
ORI	R2, R2, lo_addr(_string+512)
ADDIU	SP, SP, -48
SW	R2, 44(SP)
;Sim800.c,490 :: 		,string[6],string[7]
LUI	R2, hi_addr(_string+448)
ORI	R2, R2, lo_addr(_string+448)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 36(SP)
;Sim800.c,489 :: 		,string[4],string[5]
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,488 :: 		,string[2],string[3]
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,487 :: 		,txtA,string[0],string[1]
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,486 :: 		" *string[8]  %s\r\n"
LUI	R2, hi_addr(?lstr_37_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_37_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,476 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,491 :: 		,string[8]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 48
LHU	R25, 12(SP)
;Sim800.c,494 :: 		if(Indx == 0){
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS224
NOP	
J	L_WaitForSetupSMS66
NOP	
L__WaitForSetupSMS224:
;Sim800.c,495 :: 		SF.SimFlashPtr = strlen(string[1])+1;
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+630)(GP)
;Sim800.c,496 :: 		SF.SimFlashCellByteCount = SF.SimFlashPtr;
SH	R2, Offset(_SF+634)(GP)
;Sim800.c,497 :: 		memcpy(SF.SimFlashBuff,string[1],SF.SimFlashPtr);
LHU	R27, Offset(_SF+630)(GP)
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+118)
ORI	R25, R25, lo_addr(_SF+118)
JAL	_memcpy+0
NOP	
;Sim800.c,498 :: 		strncpy(SF.SimCelNum,string[1],strlen(string[1])+1);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_strncpy+0
NOP	
;Sim800.c,499 :: 		strncpy(SF.SimDate,string[3],strlen(string[3]));
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
SEH	R27, R2
LUI	R26, hi_addr(_string+192)
ORI	R26, R26, lo_addr(_string+192)
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strncpy+0
NOP	
;Sim800.c,500 :: 		strncpy(SF.SimTime,string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+9)
ORI	R25, R25, lo_addr(_SF+9)
JAL	_strncpy+0
NOP	
;Sim800.c,507 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
LUI	R2, hi_addr(_SF+9)
ORI	R2, R2, lo_addr(_SF+9)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
LUI	R2, hi_addr(_SF+0)
ORI	R2, R2, lo_addr(_SF+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
SW	R2, 8(SP)
;Sim800.c,506 :: 		" * SF.SimTime: %s\r\n"
LUI	R2, hi_addr(?lstr_38_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_38_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,503 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,507 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,509 :: 		}else if(Indx == 1){
J	L_WaitForSetupSMS67
NOP	
L_WaitForSetupSMS66:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS225
NOP	
J	L_WaitForSetupSMS68
NOP	
L__WaitForSetupSMS225:
;Sim800.c,514 :: 		strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strncpy+0
NOP	
;Sim800.c,520 :: 		strncpy(SF.ReadAPIKey,string[6],strlen(string[6])+1);
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+384)
ORI	R26, R26, lo_addr(_string+384)
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_strncpy+0
NOP	
;Sim800.c,528 :: 		strncpy(SF.APN,string[7],strlen(string[7])+1);
LUI	R25, hi_addr(_string+448)
ORI	R25, R25, lo_addr(_string+448)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+448)
ORI	R26, R26, lo_addr(_string+448)
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_strncpy+0
NOP	
;Sim800.c,535 :: 		strncpy(SF.PWD,string[8],strlen(string[8])+1);
LUI	R25, hi_addr(_string+512)
ORI	R25, R25, lo_addr(_string+512)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+512)
ORI	R26, R26, lo_addr(_string+512)
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_strncpy+0
NOP	
;Sim800.c,545 :: 		,SF.APN,SF.PWD);
LUI	R2, hi_addr(_SF+98)
ORI	R2, R2, lo_addr(_SF+98)
ADDIU	SP, SP, -24
SW	R2, 20(SP)
LUI	R2, hi_addr(_SF+78)
ORI	R2, R2, lo_addr(_SF+78)
SW	R2, 16(SP)
;Sim800.c,544 :: 		,SF.WriteAPIKey,SF.ReadAPIKey
LUI	R2, hi_addr(_SF+58)
ORI	R2, R2, lo_addr(_SF+58)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+38)
ORI	R2, R2, lo_addr(_SF+38)
SW	R2, 8(SP)
;Sim800.c,543 :: 		" * SF.PWD:         %s\r\n"
LUI	R2, hi_addr(?lstr_39_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_39_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,539 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,545 :: 		,SF.APN,SF.PWD);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 24
LHU	R25, 12(SP)
;Sim800.c,555 :: 		}
L_WaitForSetupSMS68:
L_WaitForSetupSMS67:
;Sim800.c,558 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS69:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS69
NOP	
NOP	
NOP	
;Sim800.c,559 :: 		RemoveSMSText(res);
SH	R25, 12(SP)
LH	R25, 14(SP)
JAL	_RemoveSMSText+0
NOP	
;Sim800.c,561 :: 		res     = strcmp(SimTestTxt,"OK,");
ORI	R30, R0, 79
SB	R30, 35(SP)
ORI	R30, R0, 75
SB	R30, 36(SP)
ORI	R30, R0, 44
SB	R30, 37(SP)
MOVZ	R30, R0, R0
SB	R30, 38(SP)
ADDIU	R2, SP, 35
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strcmp+0
NOP	
SH	R2, 14(SP)
;Sim800.c,562 :: 		sprintf(txtA,"%d",res);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_41_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_41_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,568 :: 		,SimTestTxt,str_rcv,txtA);
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
LW	R2, Offset(_str_rcv+0)(GP)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SW	R2, 8(SP)
;Sim800.c,567 :: 		" * OK-0: %s\r\n"
LUI	R2, hi_addr(?lstr_42_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_42_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,564 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,568 :: 		,SimTestTxt,str_rcv,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,570 :: 		if((res == 0)&&(Indx == 1)){
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS226
NOP	
J	L__WaitForSetupSMS179
NOP	
L__WaitForSetupSMS226:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS227
NOP	
J	L__WaitForSetupSMS178
NOP	
L__WaitForSetupSMS227:
L__WaitForSetupSMS177:
;Sim800.c,571 :: 		WriteToFlashTemp();
JAL	_WriteToFlashTemp+0
NOP	
;Sim800.c,572 :: 		return 3;
ORI	R2, R0, 3
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,570 :: 		if((res == 0)&&(Indx == 1)){
L__WaitForSetupSMS179:
L__WaitForSetupSMS178:
;Sim800.c,574 :: 		else if ((res == 0)&&(Indx == 0))
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS228
NOP	
J	L__WaitForSetupSMS181
NOP	
L__WaitForSetupSMS228:
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS229
NOP	
J	L__WaitForSetupSMS180
NOP	
L__WaitForSetupSMS229:
L__WaitForSetupSMS176:
;Sim800.c,575 :: 		return 2;
ORI	R2, R0, 2
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,574 :: 		else if ((res == 0)&&(Indx == 0))
L__WaitForSetupSMS181:
L__WaitForSetupSMS180:
;Sim800.c,577 :: 		return res;
LH	R2, 14(SP)
;Sim800.c,578 :: 		}
;Sim800.c,577 :: 		return res;
;Sim800.c,578 :: 		}
L_end_WaitForSetupSMS:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _WaitForSetupSMS
_AT_Initial:
;Sim800.c,584 :: 		void AT_Initial(){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Sim800.c,587 :: 		UART2_Write_Text("AT&W+CNMI=2,1,0,0,0");
SW	R25, 4(SP)
ADDIU	R23, SP, 8
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr43_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr43_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,588 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,589 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,592 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,593 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_AT_Initial79:
ADDIU	R24, R24, -1
BNE	R24, R0, L_AT_Initial79
NOP	
;Sim800.c,594 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,595 :: 		}
L_end_AT_Initial:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _AT_Initial
_GetAPI_Key_SMS:
;Sim800.c,600 :: 		char GetAPI_Key_SMS(){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Sim800.c,605 :: 		UART2_Write_Text("AT+CMGS=");
SW	R25, 4(SP)
ADDIU	R23, SP, 8
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr44_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr44_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,606 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,607 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,608 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,611 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,612 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,613 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_GetAPI_Key_SMS81:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetAPI_Key_SMS81
NOP	
NOP	
NOP	
;Sim800.c,617 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,616 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_45_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_45_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,615 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,617 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,620 :: 		UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
ADDIU	R23, SP, 17
ADDIU	R22, R23, 63
LUI	R24, hi_addr(?ICS?lstr46_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr46_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,621 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,622 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,623 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,625 :: 		response = WaitForSetupSMS(1);
ORI	R25, R0, 1
JAL	_WaitForSetupSMS+0
NOP	
;Sim800.c,627 :: 		return response;
;Sim800.c,628 :: 		}
;Sim800.c,627 :: 		return response;
;Sim800.c,628 :: 		}
L_end_GetAPI_Key_SMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _GetAPI_Key_SMS
_SendSMS:
;Sim800.c,633 :: 		char SendSMS(char sms_type){
ADDIU	SP, SP, -284
SW	RA, 0(SP)
;Sim800.c,638 :: 		if(!onecA){
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LB	R2, Offset(SendSMS_onecA_L0+0)(GP)
BEQ	R2, R0, L__SendSMS233
NOP	
J	L_SendSMS83
NOP	
L__SendSMS233:
;Sim800.c,639 :: 		onecA = 1;
ORI	R2, R0, 1
SB	R2, Offset(SendSMS_onecA_L0+0)(GP)
;Sim800.c,640 :: 		AT_Initial();
JAL	_AT_Initial+0
NOP	
;Sim800.c,641 :: 		}
L_SendSMS83:
;Sim800.c,642 :: 		UART2_Write_Text("AT+CMGF=1");
ADDIU	R23, SP, 81
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr47_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr47_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 81
SB	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,643 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,644 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,645 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS84:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS84
NOP	
;Sim800.c,646 :: 		UART2_Write_Text("AT+CMGS=");
ADDIU	R23, SP, 91
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr48_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr48_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 91
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,647 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,648 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,649 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 16(SP)
;Sim800.c,650 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS86:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS86
NOP	
NOP	
NOP	
;Sim800.c,651 :: 		switch(sms_type){
J	L_SendSMS88
NOP	
;Sim800.c,652 :: 		case 0:
L_SendSMS90:
;Sim800.c,653 :: 		UART2_Write_Text("ERROR in setup Power down and start again!");
ADDIU	R23, SP, 100
ADDIU	R22, R23, 43
LUI	R24, hi_addr(?ICS?lstr49_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr49_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 100
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,654 :: 		break;
J	L_SendSMS89
NOP	
;Sim800.c,655 :: 		case 1:
L_SendSMS91:
;Sim800.c,656 :: 		UART2_Write_Text("Reply WebSite");
ADDIU	R23, SP, 143
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr50_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr50_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 143
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,657 :: 		break;
J	L_SendSMS89
NOP	
;Sim800.c,658 :: 		case 2:
L_SendSMS92:
;Sim800.c,659 :: 		UART2_Write_Text("Reply API Key");
ADDIU	R23, SP, 157
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr51_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr51_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 157
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,660 :: 		break;
J	L_SendSMS89
NOP	
;Sim800.c,661 :: 		case 3:
L_SendSMS93:
;Sim800.c,662 :: 		UART2_Write_Text("Setup Complete!");
ADDIU	R23, SP, 171
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr52_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr52_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 171
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,663 :: 		break;
J	L_SendSMS89
NOP	
;Sim800.c,664 :: 		case 4:
L_SendSMS94:
;Sim800.c,665 :: 		UART2_Write_Text("Device Powered up!");
ADDIU	R23, SP, 187
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr53_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr53_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 187
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,666 :: 		break;
J	L_SendSMS89
NOP	
;Sim800.c,667 :: 		case 5:
L_SendSMS95:
;Sim800.c,668 :: 		UART2_Write_Text("SMS Not recieved!");
ADDIU	R23, SP, 206
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr54_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr54_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 206
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,669 :: 		break;
J	L_SendSMS89
NOP	
;Sim800.c,670 :: 		case 6: //read the set points
L_SendSMS96:
;Sim800.c,671 :: 		str = Read_Thresholds();
JAL	_Read_Thresholds+0
NOP	
SW	R2, Offset(_str+0)(GP)
;Sim800.c,672 :: 		strncpy(b,str,strlen(str));
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 17
SEH	R27, R2
LW	R26, Offset(_str+0)(GP)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Sim800.c,673 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,674 :: 		break;
J	L_SendSMS89
NOP	
;Sim800.c,675 :: 		case 7: //read raw values
L_SendSMS97:
;Sim800.c,676 :: 		str = Read_Send_AllColour(0);
MOVZ	R25, R0, R0
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, Offset(_str+0)(GP)
;Sim800.c,677 :: 		strncpy(b,str,strlen(str));
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 17
SEH	R27, R2
LW	R26, Offset(_str+0)(GP)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Sim800.c,678 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,679 :: 		break;
J	L_SendSMS89
NOP	
;Sim800.c,680 :: 		case 8: //read scaled values
L_SendSMS98:
;Sim800.c,681 :: 		str = Read_Send_AllColour(1);
ORI	R25, R0, 1
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, Offset(_str+0)(GP)
;Sim800.c,682 :: 		strncpy(b,str,strlen(str));
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 17
SEH	R27, R2
LW	R26, Offset(_str+0)(GP)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Sim800.c,683 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,684 :: 		break;
J	L_SendSMS89
NOP	
;Sim800.c,685 :: 		case 9:
L_SendSMS99:
;Sim800.c,686 :: 		UART2_Write_Text("Test Started!");
ADDIU	R23, SP, 224
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr55_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr55_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 224
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,687 :: 		break;
J	L_SendSMS89
NOP	
;Sim800.c,688 :: 		case 10:
L_SendSMS100:
;Sim800.c,689 :: 		UART2_Write_Text("Test Stopped!");
ADDIU	R23, SP, 238
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr56_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr56_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 238
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,690 :: 		break;
J	L_SendSMS89
NOP	
;Sim800.c,691 :: 		default:
L_SendSMS101:
;Sim800.c,692 :: 		UART2_Write_Text("Error Power cycle the device!");
ADDIU	R23, SP, 252
ADDIU	R22, R23, 30
LUI	R24, hi_addr(?ICS?lstr57_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr57_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 252
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,693 :: 		break;
J	L_SendSMS89
NOP	
;Sim800.c,694 :: 		}
L_SendSMS88:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS235
NOP	
J	L_SendSMS90
NOP	
L__SendSMS235:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS237
NOP	
J	L_SendSMS91
NOP	
L__SendSMS237:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS239
NOP	
J	L_SendSMS92
NOP	
L__SendSMS239:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__SendSMS241
NOP	
J	L_SendSMS93
NOP	
L__SendSMS241:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__SendSMS243
NOP	
J	L_SendSMS94
NOP	
L__SendSMS243:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__SendSMS245
NOP	
J	L_SendSMS95
NOP	
L__SendSMS245:
ANDI	R3, R25, 255
ORI	R2, R0, 6
BNE	R3, R2, L__SendSMS247
NOP	
J	L_SendSMS96
NOP	
L__SendSMS247:
ANDI	R3, R25, 255
ORI	R2, R0, 7
BNE	R3, R2, L__SendSMS249
NOP	
J	L_SendSMS97
NOP	
L__SendSMS249:
ANDI	R3, R25, 255
ORI	R2, R0, 8
BNE	R3, R2, L__SendSMS251
NOP	
J	L_SendSMS98
NOP	
L__SendSMS251:
ANDI	R3, R25, 255
ORI	R2, R0, 9
BNE	R3, R2, L__SendSMS253
NOP	
J	L_SendSMS99
NOP	
L__SendSMS253:
ANDI	R3, R25, 255
ORI	R2, R0, 10
BNE	R3, R2, L__SendSMS255
NOP	
J	L_SendSMS100
NOP	
L__SendSMS255:
J	L_SendSMS101
NOP	
L_SendSMS89:
;Sim800.c,695 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,696 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,697 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,698 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendSMS102:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS102
NOP	
NOP	
NOP	
;Sim800.c,700 :: 		}
L_end_SendSMS:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 284
JR	RA
NOP	
; end of _SendSMS
_GetSMSText:
;Sim800.c,705 :: 		char* GetSMSText(){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Sim800.c,708 :: 		UART1_Write_Text("=================\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 20
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr58_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr58_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,709 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,713 :: 		num_strs = strsplit(SimTestTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 20 (R5)
SEH	R5, R2
;Sim800.c,715 :: 		err = strncmp(sms_test,string[0],4);
ORI	R27, R0, 4
LUI	R26, hi_addr(_string+0)
ORI	R26, R26, lo_addr(_string+0)
LUI	R25, hi_addr(_sms_test+0)
ORI	R25, R25, lo_addr(_sms_test+0)
JAL	_strncmp+0
NOP	
SH	R2, 18(SP)
;Sim800.c,717 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	SP, SP, -12
SH	R5, 8(SP)
; num_strs end address is: 20 (R5)
LUI	R2, hi_addr(?lstr_59_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_59_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,718 :: 		sprintf(txtB,"%d",err);
LH	R2, 18(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_60_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_60_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtB+0)
ORI	R2, R2, lo_addr(_txtB+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,735 :: 		,string[7],string[8]);
LUI	R2, hi_addr(_string+512)
ORI	R2, R2, lo_addr(_string+512)
ADDIU	SP, SP, -52
SW	R2, 48(SP)
LUI	R2, hi_addr(_string+448)
ORI	R2, R2, lo_addr(_string+448)
SW	R2, 44(SP)
;Sim800.c,734 :: 		,string[5],string[6]
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 36(SP)
;Sim800.c,733 :: 		,string[3],string[4]
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 28(SP)
;Sim800.c,732 :: 		,string[1],string[2]
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 20(SP)
;Sim800.c,731 :: 		,txtA,txtB,string[0]
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 16(SP)
LUI	R2, hi_addr(_txtB+0)
ORI	R2, R2, lo_addr(_txtB+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,730 :: 		" *string[8]  %s\r\n"
LUI	R2, hi_addr(?lstr_61_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_61_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,719 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,735 :: 		,string[7],string[8]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 52
;Sim800.c,738 :: 		if(!err){
LH	R2, 18(SP)
BEQ	R2, R0, L__GetSMSText257
NOP	
J	L_GetSMSText104
NOP	
L__GetSMSText257:
;Sim800.c,740 :: 		is_digit = isdigit(*string[1]);
LBU	R25, Offset(_string+64)(GP)
JAL	_isdigit+0
NOP	
;Sim800.c,741 :: 		if(is_digit == 1){
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__GetSMSText258
NOP	
J	L_GetSMSText105
NOP	
L__GetSMSText258:
;Sim800.c,742 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 16(SP)
;Sim800.c,744 :: 		sprintf(sms,"%d",res);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_62_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_62_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,747 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,746 :: 		" *no of sms's:= %s\r\n"
LUI	R2, hi_addr(?lstr_63_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_63_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,745 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,747 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,749 :: 		ReadMSG(res);
LH	R25, 16(SP)
JAL	_ReadMSG+0
NOP	
;Sim800.c,750 :: 		}else{
J	L_GetSMSText106
NOP	
L_GetSMSText105:
;Sim800.c,751 :: 		SendSMS(5);
ORI	R25, R0, 5
JAL	_SendSMS+0
NOP	
;Sim800.c,752 :: 		res = 1;
ORI	R2, R0, 1
SH	R2, 16(SP)
;Sim800.c,753 :: 		}
L_GetSMSText106:
;Sim800.c,754 :: 		RemoveSMSText(res);
LH	R25, 16(SP)
JAL	_RemoveSMSText+0
NOP	
;Sim800.c,755 :: 		}
L_GetSMSText104:
;Sim800.c,758 :: 		}
L_end_GetSMSText:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _GetSMSText
_ReadMSG:
;Sim800.c,764 :: 		char* ReadMSG(int msg_num){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Sim800.c,767 :: 		sprintf(sms,"%d",msg_num);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_64_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_64_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,768 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG107:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG107
NOP	
;Sim800.c,772 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,771 :: 		" *num_sms's:= %s\r\n"
LUI	R2, hi_addr(?lstr_65_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_65_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,770 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,772 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,775 :: 		UART2_Write_Text("AT+CMGF=1");
ADDIU	R23, SP, 18
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr66_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr66_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 18
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,776 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,777 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,778 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,779 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,780 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG109:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG109
NOP	
;Sim800.c,783 :: 		UART2_Write_Text("AT+CMGR=");
ADDIU	R23, SP, 28
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr67_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr67_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 28
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,784 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,785 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,786 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,788 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,789 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,790 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG111:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG111
NOP	
;Sim800.c,794 :: 		"************** \r\n");
LUI	R2, hi_addr(?lstr_68_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_68_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,793 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,794 :: 		"************** \r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,798 :: 		num_strs = strsplit(SimTestTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
SH	R2, 16(SP)
;Sim800.c,799 :: 		text = strchr(string[4], '"');
ORI	R26, R0, 34
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strchr+0
NOP	
SW	R2, Offset(_text+0)(GP)
;Sim800.c,800 :: 		strcpy(string[6], RemoveChars(text,'"','O'));
ORI	R27, R0, 79
ORI	R26, R0, 34
MOVZ	R25, R2, R0
JAL	_RemoveChars+0
NOP	
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strcpy+0
NOP	
;Sim800.c,801 :: 		strcpy(string[3], RemoveChars(string[3],'"',0x0A));
ORI	R27, R0, 10
ORI	R26, R0, 34
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_RemoveChars+0
NOP	
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strcpy+0
NOP	
;Sim800.c,802 :: 		strcpy(string[4], RemoveChars(string[4],0x02,'+'));
ORI	R27, R0, 43
ORI	R26, R0, 2
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_RemoveChars+0
NOP	
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strcpy+0
NOP	
;Sim800.c,806 :: 		sprintf(sms,"%d",num_strs);
LH	R2, 16(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_69_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_69_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,819 :: 		,string[6]);
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
;Sim800.c,818 :: 		,string[4],string[5]
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,817 :: 		,string[2],string[3]
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,816 :: 		,sms,string[0],string[1]
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 8(SP)
;Sim800.c,815 :: 		" *string[6]  %s\r\n"
LUI	R2, hi_addr(?lstr_70_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_70_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,807 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,819 :: 		,string[6]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 40
;Sim800.c,821 :: 		if(string[6] != NULL){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
BNE	R3, R2, L__ReadMSG261
NOP	
J	L_ReadMSG113
NOP	
L__ReadMSG261:
;Sim800.c,822 :: 		res = StrChecker(string[6]);
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_StrChecker+0
NOP	
;Sim800.c,823 :: 		TestRecievedSMS(res);
SEH	R25, R2
JAL	_TestRecievedSMS+0
NOP	
;Sim800.c,824 :: 		}
L_ReadMSG113:
;Sim800.c,826 :: 		}
L_end_ReadMSG:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _ReadMSG
_TestRecievedSMS:
;Sim800.c,831 :: 		void TestRecievedSMS(int res){
ADDIU	SP, SP, -84
SW	RA, 0(SP)
;Sim800.c,836 :: 		sprintf(B,"%d",res);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R3, SP, 18
SH	R25, 16(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_71_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_71_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,839 :: 		,B);
ADDIU	R2, SP, 18
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,838 :: 		" *CRGB:= %s\r\n"
LUI	R2, hi_addr(?lstr_72_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_72_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,837 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,839 :: 		,B);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 16(SP)
;Sim800.c,842 :: 		switch(res){
J	L_TestRecievedSMS114
NOP	
;Sim800.c,843 :: 		case 6:
L_TestRecievedSMS116:
;Sim800.c,844 :: 		SendSMS(7);
ORI	R25, R0, 7
JAL	_SendSMS+0
NOP	
;Sim800.c,845 :: 		break;
J	L_TestRecievedSMS115
NOP	
;Sim800.c,846 :: 		case 13:
L_TestRecievedSMS117:
;Sim800.c,847 :: 		SendSMS(8);
ORI	R25, R0, 8
JAL	_SendSMS+0
NOP	
;Sim800.c,848 :: 		break;
J	L_TestRecievedSMS115
NOP	
;Sim800.c,849 :: 		case 14:
L_TestRecievedSMS118:
;Sim800.c,850 :: 		SendSMS(6);
ORI	R25, R0, 6
JAL	_SendSMS+0
NOP	
;Sim800.c,851 :: 		break;
J	L_TestRecievedSMS115
NOP	
;Sim800.c,852 :: 		case 16:
L_TestRecievedSMS119:
;Sim800.c,853 :: 		GetValuesFromFlash();
JAL	_GetValuesFromFlash+0
NOP	
;Sim800.c,854 :: 		NVMErasePage(FLASH_Settings_PAddr);
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
;Sim800.c,855 :: 		if(string[5] != NULL){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__TestRecievedSMS264
NOP	
J	L_TestRecievedSMS120
NOP	
L__TestRecievedSMS264:
;Sim800.c,856 :: 		strcpy(B,string[5]);
ADDIU	R2, SP, 18
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;Sim800.c,857 :: 		Threshold.time_to_log = atoi(B);
ADDIU	R2, SP, 18
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, Offset(_Threshold+8)(GP)
;Sim800.c,858 :: 		}
L_TestRecievedSMS120:
;Sim800.c,859 :: 		WriteToFlashTemp();
JAL	_WriteToFlashTemp+0
NOP	
;Sim800.c,860 :: 		t =  Write_Thresholds(0);
MOVZ	R25, R0, R0
JAL	_Write_Thresholds+0
NOP	
; t start address is: 24 (R6)
MOVZ	R6, R2, R0
;Sim800.c,862 :: 		strncat(b,t,strlen(t));
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SEH	R27, R2
MOVZ	R26, R6, R0
LUI	R25, hi_addr(_b+0)
ORI	R25, R25, lo_addr(_b+0)
JAL	_strncat+0
NOP	
;Sim800.c,865 :: 		,t);
ADDIU	SP, SP, -12
SW	R6, 8(SP)
; t end address is: 24 (R6)
;Sim800.c,864 :: 		" *CRGB:= %s\r\n"
LUI	R2, hi_addr(?lstr_73_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_73_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,863 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,865 :: 		,t);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,867 :: 		SendSMS(6);
ORI	R25, R0, 6
JAL	_SendSMS+0
NOP	
;Sim800.c,868 :: 		break;
J	L_TestRecievedSMS115
NOP	
;Sim800.c,869 :: 		case 17:
L_TestRecievedSMS121:
;Sim800.c,870 :: 		SimVars.init_inc = 5;  //Test started
ORI	R2, R0, 5
SB	R2, Offset(_SimVars+1)(GP)
;Sim800.c,871 :: 		SendSMS(9);
ORI	R25, R0, 9
JAL	_SendSMS+0
NOP	
;Sim800.c,872 :: 		break;
J	L_TestRecievedSMS115
NOP	
;Sim800.c,873 :: 		case 18:
L_TestRecievedSMS122:
;Sim800.c,874 :: 		SimVars.init_inc = 3;  //Test Stopped
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
;Sim800.c,875 :: 		SendSMS(10);
ORI	R25, R0, 10
JAL	_SendSMS+0
NOP	
;Sim800.c,876 :: 		break;
J	L_TestRecievedSMS115
NOP	
;Sim800.c,877 :: 		default:
L_TestRecievedSMS123:
;Sim800.c,878 :: 		break;
J	L_TestRecievedSMS115
NOP	
;Sim800.c,879 :: 		}
L_TestRecievedSMS114:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__TestRecievedSMS266
NOP	
J	L_TestRecievedSMS116
NOP	
L__TestRecievedSMS266:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__TestRecievedSMS268
NOP	
J	L_TestRecievedSMS117
NOP	
L__TestRecievedSMS268:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__TestRecievedSMS270
NOP	
J	L_TestRecievedSMS118
NOP	
L__TestRecievedSMS270:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__TestRecievedSMS272
NOP	
J	L_TestRecievedSMS119
NOP	
L__TestRecievedSMS272:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__TestRecievedSMS274
NOP	
J	L_TestRecievedSMS121
NOP	
L__TestRecievedSMS274:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__TestRecievedSMS276
NOP	
J	L_TestRecievedSMS122
NOP	
L__TestRecievedSMS276:
J	L_TestRecievedSMS123
NOP	
L_TestRecievedSMS115:
;Sim800.c,881 :: 		}
L_end_TestRecievedSMS:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 84
JR	RA
NOP	
; end of _TestRecievedSMS
_RemoveSMSText:
;Sim800.c,887 :: 		int RemoveSMSText(int sms_cnt){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,890 :: 		sprintf(sms,"%d",sms_cnt);
SH	R25, 4(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_74_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_74_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,893 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,892 :: 		" *num_strs:= %s\r\n"
LUI	R2, hi_addr(?lstr_75_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_75_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,891 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,893 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 4(SP)
;Sim800.c,895 :: 		do{
L_RemoveSMSText124:
;Sim800.c,896 :: 		sprintf(sms,"%d",sms_cnt);
SH	R25, 4(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_76_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_76_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,897 :: 		UART2_Write_Text("AT+CMGD=");
ADDIU	R23, SP, 6
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr77_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr77_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,898 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,899 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,900 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,903 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LH	R25, 4(SP)
;Sim800.c,904 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_RemoveSMSText127:
ADDIU	R24, R24, -1
BNE	R24, R0, L_RemoveSMSText127
NOP	
;Sim800.c,905 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,906 :: 		sms_cnt--;
ADDIU	R2, R25, -1
SEH	R25, R2
;Sim800.c,907 :: 		}while(sms_cnt > 0);
SEH	R2, R2
SLTI	R2, R2, 1
BNE	R2, R0, L__RemoveSMSText278
NOP	
J	L_RemoveSMSText124
NOP	
L__RemoveSMSText278:
;Sim800.c,909 :: 		return sms_cnt;
SEH	R2, R25
;Sim800.c,910 :: 		}
L_end_RemoveSMSText:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _RemoveSMSText
_Test_Update_ThingSpeak:
;Sim800.c,916 :: 		int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,921 :: 		if(s != sLast){
SW	R25, 4(SP)
ANDI	R3, R25, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak281
NOP	
J	L_Test_Update_ThingSpeak129
NOP	
L__Test_Update_ThingSpeak281:
;Sim800.c,922 :: 		sLast = s;
SB	R25, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
;Sim800.c,928 :: 		}
L_Test_Update_ThingSpeak129:
;Sim800.c,929 :: 		if(m != mLast){
ANDI	R3, R26, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak283
NOP	
J	L_Test_Update_ThingSpeak130
NOP	
L__Test_Update_ThingSpeak283:
;Sim800.c,930 :: 		mLast = m;
SB	R26, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
;Sim800.c,936 :: 		}
L_Test_Update_ThingSpeak130:
;Sim800.c,937 :: 		if(h != hLast){
ANDI	R3, R27, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak285
NOP	
J	L_Test_Update_ThingSpeak131
NOP	
L__Test_Update_ThingSpeak285:
;Sim800.c,938 :: 		hLast = h;
SB	R27, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
;Sim800.c,944 :: 		}
L_Test_Update_ThingSpeak131:
;Sim800.c,947 :: 		m > Threshold.time_to_log){
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_Update_ThingSpeak286
NOP	
J	L__Test_Update_ThingSpeak184
NOP	
L__Test_Update_ThingSpeak286:
ANDI	R3, R26, 65535
LHU	R2, Offset(_Threshold+8)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Test_Update_ThingSpeak287
NOP	
J	L__Test_Update_ThingSpeak183
NOP	
L__Test_Update_ThingSpeak287:
L__Test_Update_ThingSpeak182:
;Sim800.c,948 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,949 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,950 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Test_Update_ThingSpeak
NOP	
;Sim800.c,947 :: 		m > Threshold.time_to_log){
L__Test_Update_ThingSpeak184:
L__Test_Update_ThingSpeak183:
;Sim800.c,952 :: 		return -1;
ORI	R2, R0, 65535
;Sim800.c,953 :: 		}
;Sim800.c,952 :: 		return -1;
;Sim800.c,953 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,958 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -196
SW	RA, 0(SP)
;Sim800.c,962 :: 		sprintf(txtC,"%u",rgbc[0]);
SW	R25, 4(SP)
SW	R26, 8(SP)
LHU	R2, 0(R25)
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_78_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_78_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtC+0)
ORI	R2, R2, lo_addr(_txtC+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,963 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_79_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_79_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR+0)
ORI	R2, R2, lo_addr(_txtR+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,964 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_80_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_80_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtG+0)
ORI	R2, R2, lo_addr(_txtG+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,965 :: 		sprintf(txtB,"%u",rgbc[3]);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_81_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_81_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtB+0)
ORI	R2, R2, lo_addr(_txtB+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,968 :: 		str = (char*)Malloc(200*sizeof(char));
ORI	R25, R0, 200
JAL	_Malloc+0
NOP	
SW	R2, Offset(_str+0)(GP)
;Sim800.c,970 :: 		*str  = 0;
SB	R0, 0(R2)
;Sim800.c,972 :: 		strcat(str,str_api);
LUI	R26, hi_addr(_str_api+0)
ORI	R26, R26, lo_addr(_str_api+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,973 :: 		strcat(str,SF.WriteAPIKey);
LUI	R26, hi_addr(_SF+38)
ORI	R26, R26, lo_addr(_SF+38)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,974 :: 		strcat(str,field1);
LUI	R26, hi_addr(_field1+0)
ORI	R26, R26, lo_addr(_field1+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,975 :: 		strcat(str,txtC);
LUI	R26, hi_addr(_txtC+0)
ORI	R26, R26, lo_addr(_txtC+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,976 :: 		strcat(str,field2);
LUI	R26, hi_addr(_field2+0)
ORI	R26, R26, lo_addr(_field2+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,977 :: 		strcat(str,txtR);
LUI	R26, hi_addr(_txtR+0)
ORI	R26, R26, lo_addr(_txtR+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,978 :: 		strcat(str,field3);
LUI	R26, hi_addr(_field3+0)
ORI	R26, R26, lo_addr(_field3+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,979 :: 		strcat(str,txtG);
LUI	R26, hi_addr(_txtG+0)
ORI	R26, R26, lo_addr(_txtG+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,980 :: 		strcat(str,field4);
LUI	R26, hi_addr(_field4+0)
ORI	R26, R26, lo_addr(_field4+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,981 :: 		strcat(str,txtB);
LUI	R26, hi_addr(_txtB+0)
ORI	R26, R26, lo_addr(_txtB+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,984 :: 		UART2_Write_Text("AT+CPIN?");
ADDIU	R23, SP, 16
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr82_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr82_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,985 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,986 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,987 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,988 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData135:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData135
NOP	
NOP	
NOP	
;Sim800.c,989 :: 		UART2_Write_Text("AT+CREG?");
ADDIU	R23, SP, 25
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr83_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr83_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 25
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,990 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,991 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,992 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,993 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData137:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData137
NOP	
NOP	
NOP	
;Sim800.c,994 :: 		UART2_Write_Text("AT+CGATT?");
ADDIU	R23, SP, 34
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr84_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr84_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,995 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,996 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,997 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,998 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData139:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData139
NOP	
NOP	
NOP	
;Sim800.c,999 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 44
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr85_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr85_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 44
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1000 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1001 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1002 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1003 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData141:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData141
NOP	
NOP	
NOP	
;Sim800.c,1004 :: 		UART2_Write_Text("AT+CIPSTATUS");
ADDIU	R23, SP, 55
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr86_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr86_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 55
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1005 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1006 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1007 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1008 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData143:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData143
NOP	
NOP	
NOP	
;Sim800.c,1009 :: 		UART2_Write_Text("AT+CIPMUX=0");
ADDIU	R23, SP, 68
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr87_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr87_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 68
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1010 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1011 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1012 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1013 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData145:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData145
NOP	
NOP	
NOP	
;Sim800.c,1014 :: 		UART2_Write_Text("AT+CSTT=");//\"data.uk\",\"user\",\"one2one\"");
ADDIU	R23, SP, 80
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr88_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr88_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 80
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1015 :: 		UART2_Write_Text(SF.APN);
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1016 :: 		UART2_Write_Text(",\"user\",");
ADDIU	R23, SP, 89
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr89_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr89_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 89
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1017 :: 		UART2_Write_Text(SF.PWD);
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1018 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1019 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1020 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1021 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData147:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData147
NOP	
NOP	
NOP	
;Sim800.c,1022 :: 		UART2_Write_Text("AT+CIICR");
ADDIU	R23, SP, 98
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr90_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr90_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1023 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1024 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1025 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1026 :: 		UART2_Write_Text("AT+CIFSR");
ADDIU	R23, SP, 107
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr91_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr91_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 107
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1027 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1028 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1029 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData149:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData149
NOP	
;Sim800.c,1030 :: 		UART2_Write_Text("AT+CIPSPRT=1");
ADDIU	R23, SP, 116
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr92_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr92_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 116
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1031 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1032 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1033 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1034 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData151:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData151
NOP	
NOP	
NOP	
;Sim800.c,1035 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
ADDIU	R23, SP, 129
ADDIU	R22, R23, 42
LUI	R24, hi_addr(?ICS?lstr93_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr93_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 129
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1036 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1037 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1038 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1039 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData153:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData153
NOP	
;Sim800.c,1040 :: 		UART2_Write_Text("AT+CIPSEND");
ADDIU	R23, SP, 171
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr94_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr94_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 171
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1041 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1042 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1043 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData155:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData155
NOP	
;Sim800.c,1044 :: 		UART2_Write_Text(str);
LW	R25, Offset(_str+0)(GP)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1045 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1046 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1047 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1048 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1049 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,1050 :: 		TestForOK(1);
ORI	R25, R0, 1
JAL	_TestForOK+0
NOP	
;Sim800.c,1051 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData157:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData157
NOP	
NOP	
NOP	
;Sim800.c,1052 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 182
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr95_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr95_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 182
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1053 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1054 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1055 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1056 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData159:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData159
NOP	
NOP	
NOP	
;Sim800.c,1058 :: 		Free(str,150*sizeof(char*));
ORI	R26, R0, 600
LW	R25, Offset(_str+0)(GP)
JAL	_Free+0
NOP	
;Sim800.c,1059 :: 		}
L_end_SendData:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 196
JR	RA
NOP	
; end of _SendData
_TestForOK:
;Sim800.c,1065 :: 		void TestForOK(char c){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,1067 :: 		WaitForResponse(1);
SW	R26, 4(SP)
SB	R25, 8(SP)
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,1068 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_TestForOK161:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TestForOK161
NOP	
;Sim800.c,1069 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,1073 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SB	R25, 8(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,1072 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_96_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_96_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,1071 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1073 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LBU	R25, 8(SP)
;Sim800.c,1075 :: 		lastMillis = TMR0.millis;
; lastMillis start address is: 16 (R4)
LW	R4, Offset(_TMR0+0)(GP)
;Sim800.c,1076 :: 		if(c == 0)
ANDI	R2, R25, 255
BEQ	R2, R0, L__TestForOK290
NOP	
J	L_TestForOK163
NOP	
L__TestForOK290:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
;Sim800.c,1077 :: 		while(!strstr(SimTestTxt, "OK")){
L_TestForOK164:
; lastMillis start address is: 20 (R5)
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
ORI	R30, R0, 79
SB	R30, 9(SP)
ORI	R30, R0, 75
SB	R30, 10(SP)
MOVZ	R30, R0, R0
SB	R30, 11(SP)
ADDIU	R2, SP, 9
SB	R25, 8(SP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strstr+0
NOP	
LBU	R25, 8(SP)
BEQ	R2, R0, L__TestForOK291
NOP	
J	L_TestForOK165
NOP	
L__TestForOK291:
; lastMillis end address is: 20 (R5)
;Sim800.c,1078 :: 		newMillis = TMR0.millis - lastMillis;
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,1079 :: 		if(newMillis > 5000)
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK292
NOP	
J	L_TestForOK166
NOP	
L__TestForOK292:
; lastMillis end address is: 20 (R5)
;Sim800.c,1080 :: 		break;
J	L_TestForOK165
NOP	
L_TestForOK166:
;Sim800.c,1081 :: 		}
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK164
NOP	
L_TestForOK165:
J	L_TestForOK167
NOP	
L_TestForOK163:
;Sim800.c,1082 :: 		else if(c == 1)
; lastMillis start address is: 16 (R4)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__TestForOK293
NOP	
J	L_TestForOK168
NOP	
L__TestForOK293:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
;Sim800.c,1083 :: 		while(!strstr(SimTestTxt, "CONNECT")){
L_TestForOK169:
; lastMillis start address is: 20 (R5)
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
ADDIU	R23, SP, 12
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr98_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr98_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 12
SB	R25, 8(SP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strstr+0
NOP	
LBU	R25, 8(SP)
BEQ	R2, R0, L__TestForOK294
NOP	
J	L_TestForOK170
NOP	
L__TestForOK294:
; lastMillis end address is: 20 (R5)
;Sim800.c,1084 :: 		newMillis = TMR0.millis - lastMillis;
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,1085 :: 		if(newMillis > 5000)
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK295
NOP	
J	L_TestForOK171
NOP	
L__TestForOK295:
; lastMillis end address is: 20 (R5)
;Sim800.c,1086 :: 		break;
J	L_TestForOK170
NOP	
L_TestForOK171:
;Sim800.c,1087 :: 		}
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK169
NOP	
L_TestForOK170:
L_TestForOK168:
L_TestForOK167:
;Sim800.c,1088 :: 		}
L_end_TestForOK:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _TestForOK
