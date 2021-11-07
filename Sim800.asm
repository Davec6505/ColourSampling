_InitGSM3:
;Sim800.c,51 :: 		void InitGSM3(){
ADDIU	SP, SP, -68
SW	RA, 0(SP)
;Sim800.c,52 :: 		SimVars.initial_str = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SB	R0, Offset(_SimVars+512)(GP)
;Sim800.c,53 :: 		SimVars.init_inc    = 0;
SB	R0, Offset(_SimVars+518)(GP)
;Sim800.c,54 :: 		*SimTestTxt = "Hello World this is a test";
ORI	R2, R0, lo_addr(?lstr_1_Sim800+0)
ANDI	R2, R2, 255
SB	R2, Offset(_SimTestTxt+0)(GP)
;Sim800.c,55 :: 		RB.head = 0;
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,56 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
;Sim800.c,57 :: 		RB.rcv_txt_fin = -1;
ORI	R2, R0, 255
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,58 :: 		SF.SimFlashPtr = 0;
SH	R0, Offset(_SF+598)(GP)
;Sim800.c,59 :: 		strcpy(SF.SimCelNum,"\"***************\"");
ADDIU	R23, SP, 12
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr2_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr2_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strcpy+0
NOP	
;Sim800.c,60 :: 		strcpy(SF.WriteAPIKey,"\"****************\"");
ADDIU	R23, SP, 30
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr3_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr3_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 30
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strcpy+0
NOP	
;Sim800.c,61 :: 		strcpy(SF.ReadAPIKey,"\"****************\"");
ADDIU	R23, SP, 49
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr4_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr4_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 49
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+62)
ORI	R25, R25, lo_addr(_SF+62)
JAL	_strcpy+0
NOP	
;Sim800.c,62 :: 		}
L_end_InitGSM3:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 68
JR	RA
NOP	
; end of _InitGSM3
_PwrUpGSM3:
;Sim800.c,67 :: 		void PwrUpGSM3(){
;Sim800.c,68 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,69 :: 		PWR = 0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,70 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM30
NOP	
;Sim800.c,71 :: 		PWR = 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,73 :: 		while(STAT){
L_PwrUpGSM32:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrUpGSM3164
NOP	
J	L_PwrUpGSM33
NOP	
L__PwrUpGSM3164:
;Sim800.c,74 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,75 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM34
NOP	
;Sim800.c,76 :: 		}
J	L_PwrUpGSM32
NOP	
L_PwrUpGSM33:
;Sim800.c,77 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM36
NOP	
NOP	
NOP	
;Sim800.c,78 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_WriteToFlashTemp:
;Sim800.c,83 :: 		void WriteToFlashTemp(){
ADDIU	SP, SP, -84
SW	RA, 0(SP)
;Sim800.c,88 :: 		if(SL.l1 <= 0)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LH	R2, Offset(_SL+0)(GP)
SLTI	R2, R2, 1
BNE	R2, R0, L__WriteToFlashTemp166
NOP	
J	L_WriteToFlashTemp8
NOP	
L__WriteToFlashTemp166:
;Sim800.c,89 :: 		GetStrLengths();
JAL	_GetStrLengths+0
NOP	
L_WriteToFlashTemp8:
;Sim800.c,91 :: 		memset(holding_buff,0,SL.l5+5);
LH	R2, Offset(_SL+8)(GP)
ADDIU	R3, R2, 5
ADDIU	R2, SP, 20
SEH	R27, R3
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Sim800.c,92 :: 		memcpy(holding_buff,SF.SimCelNum,SL.l1);
ADDIU	R2, SP, 20
LH	R27, Offset(_SL+0)(GP)
LUI	R26, hi_addr(_SF+0)
ORI	R26, R26, lo_addr(_SF+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,93 :: 		memcpy(holding_buff+SL.l1+1,SF.WriteAPIKey,SL.l2);
ADDIU	R3, SP, 20
LH	R2, Offset(_SL+0)(GP)
ADDU	R2, R3, R2
ADDIU	R2, R2, 1
LH	R27, Offset(_SL+2)(GP)
LUI	R26, hi_addr(_SF+38)
ORI	R26, R26, lo_addr(_SF+38)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,94 :: 		memcpy(holding_buff+SL.l3+1,SF.ReadAPIKey,SL.l4);
ADDIU	R3, SP, 20
LH	R2, Offset(_SL+4)(GP)
ADDU	R2, R3, R2
ADDIU	R2, R2, 1
LH	R27, Offset(_SL+6)(GP)
LUI	R26, hi_addr(_SF+62)
ORI	R26, R26, lo_addr(_SF+62)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,95 :: 		memcpy(temp,holding_buff,SL.l5+3);
LH	R2, Offset(_SL+8)(GP)
ADDIU	R3, R2, 3
ADDIU	R2, SP, 20
SEH	R27, R3
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_temp+0)
ORI	R25, R25, lo_addr(_temp+0)
JAL	_memcpy+0
NOP	
;Sim800.c,97 :: 		pos = FLASH_Settings_PAddr;
; pos start address is: 12 (R3)
LW	R3, Offset(_FLASH_Settings_PAddr+0)(GP)
;Sim800.c,98 :: 		j = NVMErasePage(pos);
SW	R3, 16(SP)
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R3, 16(SP)
SH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
;Sim800.c,99 :: 		if(j==0){
SEH	R2, R2
BEQ	R2, R0, L__WriteToFlashTemp167
NOP	
J	L_WriteToFlashTemp9
NOP	
L__WriteToFlashTemp167:
;Sim800.c,100 :: 		pos += 16 ;
ADDIU	R2, R3, 16
; pos end address is: 12 (R3)
; pos start address is: 16 (R4)
MOVZ	R4, R2, R0
;Sim800.c,101 :: 		for(i=0;i<SL.l4;i++){
SH	R0, Offset(WriteToFlashTemp_i_L0+0)(GP)
; pos end address is: 16 (R4)
L_WriteToFlashTemp10:
; pos start address is: 16 (R4)
LH	R3, Offset(_SL+6)(GP)
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__WriteToFlashTemp168
NOP	
J	L_WriteToFlashTemp11
NOP	
L__WriteToFlashTemp168:
;Sim800.c,102 :: 		j = NVMWriteWord(pos,temp[i]);
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
;Sim800.c,103 :: 		pos += 4;
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
;Sim800.c,104 :: 		Delay_ms(5);
LUI	R24, 2
ORI	R24, R24, 2260
L_WriteToFlashTemp13:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WriteToFlashTemp13
NOP	
NOP	
NOP	
;Sim800.c,101 :: 		for(i=0;i<SL.l4;i++){
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
;Sim800.c,105 :: 		}
; pos end address is: 16 (R4)
J	L_WriteToFlashTemp10
NOP	
L_WriteToFlashTemp11:
;Sim800.c,106 :: 		}
L_WriteToFlashTemp9:
;Sim800.c,108 :: 		sprintf(c,"%d",j);
LH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_5_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_c+0)
ORI	R2, R2, lo_addr(_c+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,113 :: 		,c);
LUI	R2, hi_addr(_c+0)
ORI	R2, R2, lo_addr(_c+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,112 :: 		" * flash err: %s\r\n"
LUI	R2, hi_addr(?lstr_6_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_6_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,110 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,113 :: 		,c);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,115 :: 		}
L_end_WriteToFlashTemp:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 84
JR	RA
NOP	
; end of _WriteToFlashTemp
_GetValuesFromFlash:
;Sim800.c,117 :: 		char* GetValuesFromFlash(){
ADDIU	SP, SP, -528
SW	RA, 0(SP)
;Sim800.c,122 :: 		if(SL.l1 <= 0)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LH	R2, Offset(_SL+0)(GP)
SLTI	R2, R2, 1
BNE	R2, R0, L__GetValuesFromFlash170
NOP	
J	L_GetValuesFromFlash15
NOP	
L__GetValuesFromFlash170:
;Sim800.c,123 :: 		GetStrLengths();
JAL	_GetStrLengths+0
NOP	
L_GetValuesFromFlash15:
;Sim800.c,126 :: 		ptr += 16;
LW	R2, Offset(_FLASH_Settings_VAddr+0)(GP)
ADDIU	R2, R2, 16
; ptr start address is: 20 (R5)
MOVZ	R5, R2, R0
;Sim800.c,128 :: 		for(i=0;i<SL.l5;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_GetValuesFromFlash16:
; i start address is: 24 (R6)
; ptr start address is: 20 (R5)
; ptr end address is: 20 (R5)
LH	R2, Offset(_SL+8)(GP)
SLTU	R2, R6, R2
BNE	R2, R0, L__GetValuesFromFlash171
NOP	
J	L_GetValuesFromFlash17
NOP	
L__GetValuesFromFlash171:
; ptr end address is: 20 (R5)
;Sim800.c,129 :: 		buff[i] = ptr[i];
; ptr start address is: 20 (R5)
ADDIU	R4, SP, 16
ADDU	R3, R4, R6
ADDU	R2, R5, R6
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Sim800.c,131 :: 		UART1_Write(buff[i]);
ADDU	R2, R4, R6
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,132 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
;Sim800.c,128 :: 		for(i=0;i<SL.l5;i++){
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Sim800.c,134 :: 		}
; ptr end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_GetValuesFromFlash16
NOP	
L_GetValuesFromFlash17:
;Sim800.c,135 :: 		strncpy(SF.SimCelNum,buff,SL.l1);
ADDIU	R2, SP, 16
LH	R27, Offset(_SL+0)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strncpy+0
NOP	
;Sim800.c,136 :: 		strncpy(SF.WriteAPIKey,buff+SL.l1+1,SL.l2);
ADDIU	R3, SP, 16
LH	R2, Offset(_SL+0)(GP)
ADDU	R2, R3, R2
ADDIU	R2, R2, 1
LH	R27, Offset(_SL+2)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strncpy+0
NOP	
;Sim800.c,137 :: 		strncpy(SF.ReadAPIKey,buff+SL.l3+1,SL.l4);
ADDIU	R3, SP, 16
LH	R2, Offset(_SL+4)(GP)
ADDU	R2, R3, R2
ADDIU	R2, R2, 1
LH	R27, Offset(_SL+6)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+62)
ORI	R25, R25, lo_addr(_SF+62)
JAL	_strncpy+0
NOP	
;Sim800.c,144 :: 		,SF.SimCelNum,SF.WriteAPIKey,SF.ReadAPIKey);
LUI	R2, hi_addr(_SF+62)
ORI	R2, R2, lo_addr(_SF+62)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
LUI	R2, hi_addr(_SF+38)
ORI	R2, R2, lo_addr(_SF+38)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+0)
ORI	R2, R2, lo_addr(_SF+0)
SW	R2, 8(SP)
;Sim800.c,143 :: 		" * SF.ReadAPIKey:  %s\r\n"
LUI	R2, hi_addr(?lstr_7_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_7_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,140 :: 		PrintOut(PrintHandler, " * Flash Read        \r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,144 :: 		,SF.SimCelNum,SF.WriteAPIKey,SF.ReadAPIKey);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
;Sim800.c,146 :: 		return SF.SimCelNum;
LUI	R2, hi_addr(_SF+0)
ORI	R2, R2, lo_addr(_SF+0)
;Sim800.c,147 :: 		}
;Sim800.c,146 :: 		return SF.SimCelNum;
;Sim800.c,147 :: 		}
L_end_GetValuesFromFlash:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 528
JR	RA
NOP	
; end of _GetValuesFromFlash
_GetStrLengths:
;Sim800.c,149 :: 		void GetStrLengths(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,150 :: 		SL.l1 = strlen(SF.SimCelNum)+1;   //len of cell num
SW	R25, 4(SP)
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SL+0)(GP)
;Sim800.c,151 :: 		SL.l2 = strlen(SF.WriteAPIKey)+1; //len of API Write key
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
SH	R3, Offset(_SL+2)(GP)
;Sim800.c,152 :: 		SL.l3 = SL.l1 + SL.l2;            //len Cell + API Wr k
LH	R2, Offset(_SL+0)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SL+4)(GP)
;Sim800.c,153 :: 		SL.l4 = strlen(SF.ReadAPIKey)+1;  //len of API Read Key
LUI	R25, hi_addr(_SF+62)
ORI	R25, R25, lo_addr(_SF+62)
JAL	_strlen+0
NOP	
ADDIU	R4, R2, 1
SH	R4, Offset(_SL+6)(GP)
;Sim800.c,154 :: 		SL.l5 = SL.l1 + SL.l2 + SL.l4;             //total length
LH	R3, Offset(_SL+2)(GP)
LH	R2, Offset(_SL+0)(GP)
ADDU	R2, R2, R3
ADDU	R3, R2, R4
SH	R3, Offset(_SL+8)(GP)
;Sim800.c,155 :: 		SL.mod = SL.l5 % 4;
ORI	R2, R0, 4
DIV	R3, R2
MFHI	R3
SH	R3, Offset(_SL+10)(GP)
;Sim800.c,156 :: 		SL.l5 += SL.mod;
LH	R2, Offset(_SL+8)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SL+8)(GP)
;Sim800.c,158 :: 		sprintf(a,"%d",SL.l1);
LH	R2, Offset(_SL+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_8_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_8_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,159 :: 		sprintf(b,"%d",SL.l2);
LH	R2, Offset(_SL+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_9_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_9_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,160 :: 		sprintf(c,"%d",SL.l3);
LH	R2, Offset(_SL+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_10_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_10_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_c+0)
ORI	R2, R2, lo_addr(_c+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,161 :: 		sprintf(d,"%d",SL.l4);
LH	R2, Offset(_SL+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_11_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_11_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_d+0)
ORI	R2, R2, lo_addr(_d+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,162 :: 		sprintf(e,"%d",SL.l5);
LH	R2, Offset(_SL+8)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_12_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_12_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_e+0)
ORI	R2, R2, lo_addr(_e+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,169 :: 		,a,b,c,d,e);
LUI	R2, hi_addr(_e+0)
ORI	R2, R2, lo_addr(_e+0)
ADDIU	SP, SP, -28
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
;Sim800.c,168 :: 		" * l5: %s\r\n"
LUI	R2, hi_addr(?lstr_13_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_13_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,163 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,169 :: 		,a,b,c,d,e);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 28
;Sim800.c,171 :: 		}
L_end_GetStrLengths:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _GetStrLengths
_RcvSimTxt:
;Sim800.c,176 :: 		void RcvSimTxt(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,178 :: 		while(UART2_Data_Ready()) {     // If data is received
L_RcvSimTxt19:
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__RcvSimTxt175
NOP	
J	L_RcvSimTxt20
NOP	
L__RcvSimTxt175:
;Sim800.c,179 :: 		txt = U2RXREG;
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Sim800.c,180 :: 		U1TXREG = txt;
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,181 :: 		if(txt >= 0x20){
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt176
NOP	
J	L_RcvSimTxt21
NOP	
L__RcvSimTxt176:
;Sim800.c,182 :: 		RB.buff[RB.head] = txt;
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
SB	R4, 0(R2)
; txt end address is: 16 (R4)
;Sim800.c,183 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,184 :: 		}else if(U2RXREG == 0x0A){
J	L_RcvSimTxt22
NOP	
L_RcvSimTxt21:
LW	R3, Offset(U2RXREG+0)(GP)
ORI	R2, R0, 10
BEQ	R3, R2, L__RcvSimTxt177
NOP	
J	L_RcvSimTxt23
NOP	
L__RcvSimTxt177:
;Sim800.c,185 :: 		RB.buff[RB.head] = ',';
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
ORI	R2, R0, 44
SB	R2, 0(R3)
;Sim800.c,186 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,187 :: 		}
L_RcvSimTxt23:
L_RcvSimTxt22:
;Sim800.c,188 :: 		if(RB.head > 999)
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RcvSimTxt178
NOP	
J	L_RcvSimTxt24
NOP	
L__RcvSimTxt178:
;Sim800.c,189 :: 		RB.head = 0;             //rest head when buffer is full
SH	R0, Offset(_RB+1002)(GP)
L_RcvSimTxt24:
;Sim800.c,191 :: 		}
J	L_RcvSimTxt19
NOP	
L_RcvSimTxt20:
;Sim800.c,192 :: 		RB.rcv_txt_fin = 1;
ORI	R2, R0, 1
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,193 :: 		}
L_end_RcvSimTxt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RcvSimTxt
_TestRingPointers:
;Sim800.c,198 :: 		int TestRingPointers(){
;Sim800.c,200 :: 		diff = RB.head - RB.tail;
LHU	R3, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SUBU	R2, R2, R3
;Sim800.c,202 :: 		return diff;
;Sim800.c,203 :: 		}
L_end_TestRingPointers:
JR	RA
NOP	
; end of _TestRingPointers
_WaitForResponse:
;Sim800.c,207 :: 		void WaitForResponse(short dly){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,209 :: 		lastMillis = TMR0.millis;
; lastMillis start address is: 20 (R5)
LW	R5, Offset(_TMR0+0)(GP)
;Sim800.c,210 :: 		RB.rcv_txt_fin   = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,211 :: 		RB.last_head     = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,212 :: 		do{
J	L_WaitForResponse25
NOP	
L__WaitForResponse151:
;Sim800.c,231 :: 		}while(!RB.rcv_txt_fin);
;Sim800.c,212 :: 		do{
L_WaitForResponse25:
;Sim800.c,213 :: 		LATE3_bit = !LATE3_bit;
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,214 :: 		if(dly == 0)
SEB	R2, R25
BEQ	R2, R0, L__WaitForResponse181
NOP	
J	L_WaitForResponse28
NOP	
L__WaitForResponse181:
; lastMillis end address is: 20 (R5)
;Sim800.c,215 :: 		Delay_ms(100);
; lastMillis start address is: 20 (R5)
LUI	R24, 40
ORI	R24, R24, 45226
L_WaitForResponse29:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse29
NOP	
J	L_WaitForResponse31
NOP	
L_WaitForResponse28:
;Sim800.c,216 :: 		else if(dly == 1)
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForResponse182
NOP	
J	L_WaitForResponse32
NOP	
L__WaitForResponse182:
;Sim800.c,217 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForResponse33:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse33
NOP	
NOP	
NOP	
J	L_WaitForResponse35
NOP	
L_WaitForResponse32:
;Sim800.c,218 :: 		else if(dly == 3){
SEB	R3, R25
ORI	R2, R0, 3
BEQ	R3, R2, L__WaitForResponse183
NOP	
J	L_WaitForResponse36
NOP	
L__WaitForResponse183:
;Sim800.c,219 :: 		UART2_Write_Text("ATE0");
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
;Sim800.c,220 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,221 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LB	R25, 4(SP)
;Sim800.c,222 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse37:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse37
NOP	
;Sim800.c,223 :: 		}
J	L_WaitForResponse39
NOP	
L_WaitForResponse36:
;Sim800.c,225 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse40:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse40
NOP	
L_WaitForResponse39:
L_WaitForResponse35:
L_WaitForResponse31:
;Sim800.c,228 :: 		newMillis = TMR0.millis - lastMillis;
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,229 :: 		if(newMillis > 25000)
SLTIU	R2, R2, 25001
BEQ	R2, R0, L__WaitForResponse184
NOP	
J	L_WaitForResponse42
NOP	
L__WaitForResponse184:
; lastMillis end address is: 20 (R5)
;Sim800.c,230 :: 		break;
J	L_WaitForResponse26
NOP	
L_WaitForResponse42:
;Sim800.c,231 :: 		}while(!RB.rcv_txt_fin);
; lastMillis start address is: 20 (R5)
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForResponse186
NOP	
J	L__WaitForResponse151
NOP	
L__WaitForResponse186:
; lastMillis end address is: 20 (R5)
L_WaitForResponse26:
;Sim800.c,232 :: 		}
L_end_WaitForResponse:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WaitForResponse
_RingToTempBuf:
;Sim800.c,237 :: 		void RingToTempBuf(){
;Sim800.c,239 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,240 :: 		RB.tail = RB.last_tail;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,241 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__RingToTempBuf188
NOP	
J	L_RingToTempBuf43
NOP	
L__RingToTempBuf188:
; i end address is: 20 (R5)
;Sim800.c,242 :: 		while(RB.tail < RB.head){
L_RingToTempBuf44:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__RingToTempBuf189
NOP	
J	L_RingToTempBuf45
NOP	
L__RingToTempBuf189:
;Sim800.c,243 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,248 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,249 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,250 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RingToTempBuf190
NOP	
J	L_RingToTempBuf46
NOP	
L__RingToTempBuf190:
; ?FLOC___RingToTempBuf?T142 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___RingToTempBuf?T142 end address is: 8 (R2)
J	L_RingToTempBuf47
NOP	
L_RingToTempBuf46:
; ?FLOC___RingToTempBuf?T142 start address is: 8 (R2)
LHU	R2, Offset(_RB+1004)(GP)
; ?FLOC___RingToTempBuf?T142 end address is: 8 (R2)
L_RingToTempBuf47:
; ?FLOC___RingToTempBuf?T142 start address is: 8 (R2)
SH	R2, Offset(_RB+1004)(GP)
; ?FLOC___RingToTempBuf?T142 end address is: 8 (R2)
;Sim800.c,251 :: 		};
J	L_RingToTempBuf44
NOP	
L_RingToTempBuf45:
;Sim800.c,252 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,253 :: 		}
L_RingToTempBuf43:
;Sim800.c,254 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,255 :: 		}
L_end_RingToTempBuf:
JR	RA
NOP	
; end of _RingToTempBuf
_SetupIOT:
;Sim800.c,261 :: 		char SetupIOT(){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Sim800.c,272 :: 		" * ATE0\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(?lstr_15_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_15_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,271 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,272 :: 		" * ATE0\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,275 :: 		WaitForResponse(3);
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
;Sim800.c,276 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT48:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT48
NOP	
;Sim800.c,277 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,283 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,282 :: 		" * Check if Sim is Registered\r\n"
LUI	R2, hi_addr(?lstr_16_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_16_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,280 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,283 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,285 :: 		wait:
___SetupIOT_wait:
;Sim800.c,287 :: 		UART2_Write_Text("AT+CREG?");
ADDIU	R23, SP, 18
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr17_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr17_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 18
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,288 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,289 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,290 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,291 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT50:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT50
NOP	
NOP	
NOP	
;Sim800.c,292 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,297 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,296 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_18_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_18_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,295 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,297 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,301 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT192
NOP	
J	L_SetupIOT52
NOP	
L__SetupIOT192:
;Sim800.c,302 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,303 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,306 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_19_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_19_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,314 :: 		,txtA,string[0],string[1],string[2],string[3],string[4]);
ADDIU	R3, SP, 12
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,313 :: 		" *string[4]  %s\r\n"
LUI	R2, hi_addr(?lstr_20_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_20_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,307 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,314 :: 		,txtA,string[0],string[1],string[2],string[3],string[4]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,316 :: 		str_rcv = findnumber(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
;Sim800.c,317 :: 		res = atoi(str_rcv);  //get the sms rec number
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,318 :: 		if(res == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT193
NOP	
J	L_SetupIOT53
NOP	
L__SetupIOT193:
;Sim800.c,320 :: 		sprintf(txtA,"%d",res);
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SH	R4, 8(SP)
; res end address is: 16 (R4)
LUI	R2, hi_addr(?lstr_21_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_21_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,323 :: 		,txtA);
ADDIU	R2, SP, 12
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,322 :: 		" *Registered with:= %s\r\n"
LUI	R2, hi_addr(?lstr_22_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_22_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,321 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,323 :: 		,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,326 :: 		}else{
J	L_SetupIOT54
NOP	
L_SetupIOT53:
;Sim800.c,329 :: 		" *Sim Not Registered\r\n");
LUI	R2, hi_addr(?lstr_23_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_23_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,328 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,329 :: 		" *Sim Not Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,331 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT55:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT55
NOP	
NOP	
NOP	
;Sim800.c,332 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,333 :: 		}
L_SetupIOT54:
;Sim800.c,334 :: 		}
L_SetupIOT52:
;Sim800.c,337 :: 		" *Sim Registered\r\n");
LUI	R2, hi_addr(?lstr_24_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_24_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,336 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,337 :: 		" *Sim Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,339 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,340 :: 		}
;Sim800.c,339 :: 		return 1;
;Sim800.c,340 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,347 :: 		char WaitForSetupSMS(unsigned int Indx){
ADDIU	SP, SP, -52
SW	RA, 0(SP)
;Sim800.c,353 :: 		UART2_Write_Text("AT+CMGF=1");
SW	R26, 4(SP)
SW	R27, 8(SP)
ADDIU	R23, SP, 26
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr25_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr25_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 26
SH	R25, 12(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,354 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,355 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,358 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,359 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,361 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS57:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS57
NOP	
;Sim800.c,363 :: 		WaitForResponse(0);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,364 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS59:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS59
NOP	
;Sim800.c,365 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,367 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 84 (R21)
SEH	R21, R2
;Sim800.c,370 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_26_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_26_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,371 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 16
; num_strs end address is: 84 (R21)
ADDIU	SP, SP, -12
SH	R21, 8(SP)
LUI	R2, hi_addr(?lstr_27_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_27_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,380 :: 		,txtA,string[0],string[1],
ADDIU	R3, SP, 16
;Sim800.c,382 :: 		string[4],string[5]);
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,381 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,380 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,379 :: 		" *string[5]  %s\r\n"
LUI	R2, hi_addr(?lstr_28_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_28_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,372 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,382 :: 		string[4],string[5]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
;Sim800.c,385 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 14(SP)
;Sim800.c,386 :: 		sprintf(sms,"%d",res);
ADDIU	R3, SP, 22
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_29_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_29_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,390 :: 		,sms);
ADDIU	R2, SP, 22
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,389 :: 		" *sms no:= %s\r\n"
LUI	R2, hi_addr(?lstr_30_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_30_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,388 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,390 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,394 :: 		UART2_Write_Text("AT+CMGR=");
ADDIU	R23, SP, 36
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr31_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr31_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 36
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,395 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,396 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,397 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,399 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,400 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS61:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS61
NOP	
;Sim800.c,401 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,402 :: 		str_rcv = setstr(SimTestTxt);
SH	R25, 12(SP)
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,403 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,405 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_32_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_32_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,415 :: 		,txtA,string[0],string[1],
ADDIU	R3, SP, 16
;Sim800.c,418 :: 		string[6]);
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
;Sim800.c,417 :: 		string[4],string[5],
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,416 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,415 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,414 :: 		" *string[6]  %s\r\n"
LUI	R2, hi_addr(?lstr_33_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_33_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,406 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,418 :: 		string[6]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 40
LHU	R25, 12(SP)
;Sim800.c,421 :: 		if(Indx == 0){
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS195
NOP	
J	L_WaitForSetupSMS63
NOP	
L__WaitForSetupSMS195:
;Sim800.c,422 :: 		SF.SimFlashPtr = strlen(string[1])+1;
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+598)(GP)
;Sim800.c,423 :: 		SF.SimFlashCellByteCount = SF.SimFlashPtr;
SH	R2, Offset(_SF+602)(GP)
;Sim800.c,424 :: 		memcpy(SF.SimFlashBuff,string[1],SF.SimFlashPtr);
LHU	R27, Offset(_SF+598)(GP)
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+86)
ORI	R25, R25, lo_addr(_SF+86)
JAL	_memcpy+0
NOP	
;Sim800.c,425 :: 		strncpy(SF.SimCelNum,string[1],strlen(string[1])+1);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strncpy+0
NOP	
;Sim800.c,426 :: 		strncpy(SF.SimDate,string[3],strlen(string[3]));
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
SEH	R27, R2
LUI	R26, hi_addr(_string+192)
ORI	R26, R26, lo_addr(_string+192)
LUI	R25, hi_addr(_SF+20)
ORI	R25, R25, lo_addr(_SF+20)
JAL	_strncpy+0
NOP	
;Sim800.c,427 :: 		strncpy(SF.SimTime,string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+29)
ORI	R25, R25, lo_addr(_SF+29)
JAL	_strncpy+0
NOP	
;Sim800.c,434 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
LUI	R2, hi_addr(_SF+29)
ORI	R2, R2, lo_addr(_SF+29)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
LUI	R2, hi_addr(_SF+20)
ORI	R2, R2, lo_addr(_SF+20)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+0)
ORI	R2, R2, lo_addr(_SF+0)
SW	R2, 8(SP)
;Sim800.c,433 :: 		" * SF.SimTime: %s\r\n"
LUI	R2, hi_addr(?lstr_34_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_34_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,430 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,434 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,436 :: 		}else if(Indx == 1){
J	L_WaitForSetupSMS64
NOP	
L_WaitForSetupSMS63:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS196
NOP	
J	L_WaitForSetupSMS65
NOP	
L__WaitForSetupSMS196:
;Sim800.c,438 :: 		SF.SimFlashAPIWriteIndx = SF.SimFlashPtr;
LHU	R2, Offset(_SF+598)(GP)
SH	R2, Offset(_SF+608)(GP)
;Sim800.c,439 :: 		SF.SimFlashAPIWriteCount = strlen(string[5])+1;
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+604)(GP)
;Sim800.c,440 :: 		memcpy(SF.SimFlashBuff+SF.SimFlashPtr,string[5],strlen(string[5])+1);
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R4, R2, 1
LHU	R3, Offset(_SF+598)(GP)
LUI	R2, hi_addr(_SF+86)
ORI	R2, R2, lo_addr(_SF+86)
ADDU	R2, R2, R3
SEH	R27, R4
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,441 :: 		strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);
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
;Sim800.c,442 :: 		SF.SimFlashPtr += strlen(string[5])+1;
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
LHU	R2, Offset(_SF+598)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SF+598)(GP)
;Sim800.c,445 :: 		SF.SimFlashAPIReadIndx = SF.SimFlashPtr;
SH	R2, Offset(_SF+610)(GP)
;Sim800.c,446 :: 		memcpy(SF.SimFlashBuff+SF.SimFlashPtr,string[6],strlen(string[6]));
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
LHU	R4, Offset(_SF+598)(GP)
LUI	R3, hi_addr(_SF+86)
ORI	R3, R3, lo_addr(_SF+86)
ADDU	R3, R3, R4
SEH	R27, R2
LUI	R26, hi_addr(_string+384)
ORI	R26, R26, lo_addr(_string+384)
MOVZ	R25, R3, R0
JAL	_memcpy+0
NOP	
;Sim800.c,447 :: 		strncpy(SF.ReadAPIKey,string[6],strlen(string[6])+1);
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+384)
ORI	R26, R26, lo_addr(_string+384)
LUI	R25, hi_addr(_SF+62)
ORI	R25, R25, lo_addr(_SF+62)
JAL	_strncpy+0
NOP	
;Sim800.c,448 :: 		SF.SimFlashPtr += strlen(string[6])+1;
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
LHU	R2, Offset(_SF+598)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SF+598)(GP)
;Sim800.c,449 :: 		SF.SimFlashAPIReadCount = strlen(string[6])+1;
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+606)(GP)
;Sim800.c,454 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
LUI	R2, hi_addr(_SF+62)
ORI	R2, R2, lo_addr(_SF+62)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+38)
ORI	R2, R2, lo_addr(_SF+38)
SW	R2, 8(SP)
;Sim800.c,453 :: 		" * SF.ReadAPIKey:  %s\r\n"
LUI	R2, hi_addr(?lstr_35_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_35_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,451 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,454 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LHU	R25, 12(SP)
;Sim800.c,457 :: 		for(i=0;i<SF.SimFlashPtr;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_WaitForSetupSMS66:
; i start address is: 16 (R4)
SEH	R3, R4
LHU	R2, Offset(_SF+598)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS197
NOP	
J	L_WaitForSetupSMS67
NOP	
L__WaitForSetupSMS197:
;Sim800.c,458 :: 		UART1_Write(SF.SimFlashBuff[i]);
SEH	R3, R4
LUI	R2, hi_addr(_SF+86)
ORI	R2, R2, lo_addr(_SF+86)
ADDU	R2, R2, R3
SH	R25, 12(SP)
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,459 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,457 :: 		for(i=0;i<SF.SimFlashPtr;i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 8 (R2)
;Sim800.c,460 :: 		}
SEH	R4, R2
; i end address is: 8 (R2)
J	L_WaitForSetupSMS66
NOP	
L_WaitForSetupSMS67:
;Sim800.c,461 :: 		UART1_Write(0x0D);
SH	R25, 12(SP)
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,462 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,464 :: 		}
L_WaitForSetupSMS65:
L_WaitForSetupSMS64:
;Sim800.c,467 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS69:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS69
NOP	
NOP	
NOP	
;Sim800.c,468 :: 		RemoveSMSText(res);
SH	R25, 12(SP)
LH	R25, 14(SP)
JAL	_RemoveSMSText+0
NOP	
;Sim800.c,469 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
; str_rcv start address is: 84 (R21)
MOVZ	R21, R2, R0
;Sim800.c,470 :: 		res     = strcmp(str_rcv,"OK,");
ORI	R30, R0, 79
SB	R30, 45(SP)
ORI	R30, R0, 75
SB	R30, 46(SP)
ORI	R30, R0, 44
SB	R30, 47(SP)
MOVZ	R30, R0, R0
SB	R30, 48(SP)
ADDIU	R3, SP, 45
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcmp+0
NOP	
SH	R2, 14(SP)
;Sim800.c,471 :: 		sprintf(txtA,"%d",res);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_37_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_37_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,477 :: 		,SimTestTxt,str_rcv,txtA);
ADDIU	R2, SP, 16
ADDIU	SP, SP, -20
SW	R2, 16(SP)
SW	R21, 12(SP)
; str_rcv end address is: 84 (R21)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SW	R2, 8(SP)
;Sim800.c,476 :: 		" * OK-0: %s\r\n"
LUI	R2, hi_addr(?lstr_38_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_38_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,473 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,477 :: 		,SimTestTxt,str_rcv,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,479 :: 		if((res == 0)&&(Indx == 1)){
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS198
NOP	
J	L__WaitForSetupSMS155
NOP	
L__WaitForSetupSMS198:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS199
NOP	
J	L__WaitForSetupSMS154
NOP	
L__WaitForSetupSMS199:
L__WaitForSetupSMS153:
;Sim800.c,480 :: 		WriteToFlashTemp();
JAL	_WriteToFlashTemp+0
NOP	
;Sim800.c,481 :: 		return 3;
ORI	R2, R0, 3
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,479 :: 		if((res == 0)&&(Indx == 1)){
L__WaitForSetupSMS155:
L__WaitForSetupSMS154:
;Sim800.c,483 :: 		else if ((res == 0)&&(Indx == 0))
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS200
NOP	
J	L__WaitForSetupSMS157
NOP	
L__WaitForSetupSMS200:
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS201
NOP	
J	L__WaitForSetupSMS156
NOP	
L__WaitForSetupSMS201:
L__WaitForSetupSMS152:
;Sim800.c,484 :: 		return 2;
ORI	R2, R0, 2
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,483 :: 		else if ((res == 0)&&(Indx == 0))
L__WaitForSetupSMS157:
L__WaitForSetupSMS156:
;Sim800.c,486 :: 		return res;
LH	R2, 14(SP)
;Sim800.c,487 :: 		}
;Sim800.c,486 :: 		return res;
;Sim800.c,487 :: 		}
L_end_WaitForSetupSMS:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 52
JR	RA
NOP	
; end of _WaitForSetupSMS
_GetAPI_Key_SMS:
;Sim800.c,492 :: 		char GetAPI_Key_SMS(){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Sim800.c,497 :: 		UART2_Write_Text("AT+CMGS=");
SW	R25, 4(SP)
ADDIU	R23, SP, 8
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr39_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr39_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,498 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,499 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,500 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,503 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,504 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,505 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_GetAPI_Key_SMS79:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetAPI_Key_SMS79
NOP	
NOP	
NOP	
;Sim800.c,509 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,508 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_40_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_40_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,507 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,509 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,512 :: 		UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
ADDIU	R23, SP, 17
ADDIU	R22, R23, 63
LUI	R24, hi_addr(?ICS?lstr41_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr41_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,513 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,514 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,515 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,517 :: 		response = WaitForSetupSMS(1);
ORI	R25, R0, 1
JAL	_WaitForSetupSMS+0
NOP	
;Sim800.c,519 :: 		return response;
;Sim800.c,520 :: 		}
;Sim800.c,519 :: 		return response;
;Sim800.c,520 :: 		}
L_end_GetAPI_Key_SMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _GetAPI_Key_SMS
_SendSMS:
;Sim800.c,525 :: 		char SendSMS(char sms_type){
ADDIU	SP, SP, -148
SW	RA, 0(SP)
;Sim800.c,528 :: 		UART2_Write_Text("AT+CNMI=2,2,0,0,0");
SW	R25, 4(SP)
ADDIU	R23, SP, 9
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr42_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr42_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 9
SB	R25, 8(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,529 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,530 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,531 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS81:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS81
NOP	
;Sim800.c,532 :: 		UART2_Write_Text("AT+CMGF=1");
ADDIU	R23, SP, 27
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr43_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr43_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 27
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,533 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,534 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,535 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS83:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS83
NOP	
;Sim800.c,536 :: 		UART2_Write_Text("AT+CMGS=");
ADDIU	R23, SP, 37
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr44_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr44_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 37
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,537 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,538 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,539 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,540 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS85:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS85
NOP	
NOP	
NOP	
;Sim800.c,541 :: 		switch(sms_type){
J	L_SendSMS87
NOP	
;Sim800.c,542 :: 		case 0:
L_SendSMS89:
;Sim800.c,543 :: 		UART2_Write_Text("ERROR in setup Power down and start again!");
ADDIU	R23, SP, 46
ADDIU	R22, R23, 43
LUI	R24, hi_addr(?ICS?lstr45_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr45_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 46
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,544 :: 		break;
J	L_SendSMS88
NOP	
;Sim800.c,545 :: 		case 1:
L_SendSMS90:
;Sim800.c,546 :: 		UART2_Write_Text("Reply WebSite");
ADDIU	R23, SP, 89
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr46_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr46_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 89
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,547 :: 		break;
J	L_SendSMS88
NOP	
;Sim800.c,548 :: 		case 2:
L_SendSMS91:
;Sim800.c,549 :: 		UART2_Write_Text("Reply API Key");
ADDIU	R23, SP, 103
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr47_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr47_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 103
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,550 :: 		break;
J	L_SendSMS88
NOP	
;Sim800.c,551 :: 		case 3:
L_SendSMS92:
;Sim800.c,552 :: 		UART2_Write_Text("Setup Complete!");
ADDIU	R23, SP, 117
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr48_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr48_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 117
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,553 :: 		break;
J	L_SendSMS88
NOP	
;Sim800.c,554 :: 		default:
L_SendSMS93:
;Sim800.c,555 :: 		UART2_Write_Text("his is a test!");
ADDIU	R23, SP, 133
ADDIU	R22, R23, 15
LUI	R24, hi_addr(?ICS?lstr49_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr49_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 133
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,556 :: 		break;
J	L_SendSMS88
NOP	
;Sim800.c,557 :: 		}
L_SendSMS87:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS205
NOP	
J	L_SendSMS89
NOP	
L__SendSMS205:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS207
NOP	
J	L_SendSMS90
NOP	
L__SendSMS207:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS209
NOP	
J	L_SendSMS91
NOP	
L__SendSMS209:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__SendSMS211
NOP	
J	L_SendSMS92
NOP	
L__SendSMS211:
J	L_SendSMS93
NOP	
L_SendSMS88:
;Sim800.c,558 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,559 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendSMS94:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS94
NOP	
NOP	
NOP	
;Sim800.c,560 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,561 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SendSMS96:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS96
NOP	
NOP	
NOP	
;Sim800.c,563 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,564 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,566 :: 		}
L_end_SendSMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 148
JR	RA
NOP	
; end of _SendSMS
_GetSMSText:
;Sim800.c,571 :: 		char* GetSMSText(){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Sim800.c,578 :: 		RingToTempBuf();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,579 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,580 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
; num_strs start address is: 20 (R5)
SEH	R5, R2
;Sim800.c,582 :: 		err = strncmp(sms_test,string[0],4);
ORI	R27, R0, 4
LUI	R26, hi_addr(_string+0)
ORI	R26, R26, lo_addr(_string+0)
LUI	R25, hi_addr(_sms_test+0)
ORI	R25, R25, lo_addr(_sms_test+0)
JAL	_strncmp+0
NOP	
SH	R2, 30(SP)
;Sim800.c,584 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R5, 8(SP)
; num_strs end address is: 20 (R5)
LUI	R2, hi_addr(?lstr_50_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_50_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,585 :: 		sprintf(txtB,"%d",err);
ADDIU	R3, SP, 22
LH	R2, 30(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_51_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_51_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,596 :: 		,txtA,txtB,string[0],
ADDIU	R4, SP, 22
ADDIU	R3, SP, 16
;Sim800.c,599 :: 		string[5],string[6]);
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
ADDIU	SP, SP, -44
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 36(SP)
;Sim800.c,598 :: 		string[3],string[4],
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 28(SP)
;Sim800.c,597 :: 		string[1],string[2],
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 20(SP)
;Sim800.c,596 :: 		,txtA,txtB,string[0],
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 16(SP)
SW	R4, 12(SP)
SW	R3, 8(SP)
;Sim800.c,595 :: 		" *string[6]  %s\r\n"
LUI	R2, hi_addr(?lstr_52_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_52_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,586 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,599 :: 		string[5],string[6]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 44
;Sim800.c,602 :: 		if(!err){
LH	R2, 30(SP)
BEQ	R2, R0, L__GetSMSText213
NOP	
J	L_GetSMSText98
NOP	
L__GetSMSText213:
;Sim800.c,603 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 28(SP)
;Sim800.c,604 :: 		ReadMSG(res);
SEH	R25, R2
JAL	_ReadMSG+0
NOP	
;Sim800.c,605 :: 		RemoveSMSText(res);
LH	R25, 28(SP)
JAL	_RemoveSMSText+0
NOP	
;Sim800.c,606 :: 		}
L_GetSMSText98:
;Sim800.c,607 :: 		}
L_end_GetSMSText:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _GetSMSText
_ReadMSG:
;Sim800.c,613 :: 		char* ReadMSG(int msg_num){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;Sim800.c,619 :: 		sprintf(sms,"%d",msg_num);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_53_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_53_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,620 :: 		UART2_Write_Text("AT+CMGF=1");
ADDIU	R23, SP, 28
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr54_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr54_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 28
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
;Sim800.c,625 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,626 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,628 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG99:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG99
NOP	
;Sim800.c,629 :: 		UART2_Write_Text("AT+CMGR=");
ADDIU	R23, SP, 38
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr55_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr55_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 38
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,630 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,631 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,632 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,634 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,635 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG101:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG101
NOP	
;Sim800.c,636 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,637 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,638 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
SH	R2, 26(SP)
;Sim800.c,639 :: 		text = strchr(string[4], '"');
ORI	R26, R0, 34
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strchr+0
NOP	
SW	R2, 16(SP)
;Sim800.c,640 :: 		strcpy(string[5], RemoveChars(text,'"','O'));
ORI	R27, R0, 79
ORI	R26, R0, 34
MOVZ	R25, R2, R0
JAL	_RemoveChars+0
NOP	
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strcpy+0
NOP	
;Sim800.c,642 :: 		sprintf(sms,"%d",num_strs);
ADDIU	R3, SP, 20
LH	R2, 26(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_56_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_56_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,652 :: 		,sms,string[0],string[1],
ADDIU	R3, SP, 20
;Sim800.c,655 :: 		text);
LW	R2, 16(SP)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
;Sim800.c,654 :: 		string[4],string[5],
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,653 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,652 :: 		,sms,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,651 :: 		" *text       %s\r\n"
LUI	R2, hi_addr(?lstr_57_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_57_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,643 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,655 :: 		text);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 40
;Sim800.c,657 :: 		}
L_end_ReadMSG:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 48
JR	RA
NOP	
; end of _ReadMSG
_RemoveSMSText:
;Sim800.c,662 :: 		int RemoveSMSText(int sms_cnt){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,665 :: 		do{
L_RemoveSMSText103:
;Sim800.c,666 :: 		sprintf(sms,"%d",sms_cnt);
ADDIU	R3, SP, 6
SH	R25, 4(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_58_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_58_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,667 :: 		UART2_Write_Text("AT+CMGD=");
ADDIU	R23, SP, 10
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr59_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr59_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 10
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,668 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 6
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,669 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,670 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,673 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LH	R25, 4(SP)
;Sim800.c,674 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_RemoveSMSText106:
ADDIU	R24, R24, -1
BNE	R24, R0, L_RemoveSMSText106
NOP	
NOP	
NOP	
;Sim800.c,675 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,676 :: 		sms_cnt--;
ADDIU	R2, R25, -1
SEH	R25, R2
;Sim800.c,677 :: 		}while(sms_cnt > 0);
SEH	R2, R2
SLTI	R2, R2, 1
BNE	R2, R0, L__RemoveSMSText216
NOP	
J	L_RemoveSMSText103
NOP	
L__RemoveSMSText216:
;Sim800.c,679 :: 		return sms_cnt;
SEH	R2, R25
;Sim800.c,680 :: 		}
L_end_RemoveSMSText:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _RemoveSMSText
_Test_Update_ThingSpeak:
;Sim800.c,686 :: 		int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,694 :: 		if(s != sLast){
SW	R25, 4(SP)
ANDI	R3, R25, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak219
NOP	
J	L_Test_Update_ThingSpeak108
NOP	
L__Test_Update_ThingSpeak219:
;Sim800.c,695 :: 		sLast = s;
SB	R25, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
;Sim800.c,701 :: 		}
L_Test_Update_ThingSpeak108:
;Sim800.c,702 :: 		if(m != mLast){
ANDI	R3, R26, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak221
NOP	
J	L_Test_Update_ThingSpeak109
NOP	
L__Test_Update_ThingSpeak221:
;Sim800.c,703 :: 		mLast = m;
SB	R26, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
;Sim800.c,709 :: 		}
L_Test_Update_ThingSpeak109:
;Sim800.c,710 :: 		if(h != hLast){
ANDI	R3, R27, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak223
NOP	
J	L_Test_Update_ThingSpeak110
NOP	
L__Test_Update_ThingSpeak223:
;Sim800.c,711 :: 		hLast = h;
SB	R27, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
;Sim800.c,717 :: 		}
L_Test_Update_ThingSpeak110:
;Sim800.c,720 :: 		m > SimVars.time_to_log){
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_Update_ThingSpeak224
NOP	
J	L__Test_Update_ThingSpeak160
NOP	
L__Test_Update_ThingSpeak224:
ANDI	R3, R26, 65535
LHU	R2, Offset(_SimVars+514)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Test_Update_ThingSpeak225
NOP	
J	L__Test_Update_ThingSpeak159
NOP	
L__Test_Update_ThingSpeak225:
L__Test_Update_ThingSpeak158:
;Sim800.c,721 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,722 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,723 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Test_Update_ThingSpeak
NOP	
;Sim800.c,720 :: 		m > SimVars.time_to_log){
L__Test_Update_ThingSpeak160:
L__Test_Update_ThingSpeak159:
;Sim800.c,725 :: 		return -1;
ORI	R2, R0, 65535
;Sim800.c,726 :: 		}
;Sim800.c,725 :: 		return -1;
;Sim800.c,726 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,731 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -276
SW	RA, 0(SP)
;Sim800.c,741 :: 		sprintf(txtC,"%u",rgbc[0]);
SW	R25, 4(SP)
SW	R26, 8(SP)
LHU	R2, 0(R25)
ADDIU	R3, SP, 20
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_60_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_60_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,742 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R3, SP, 35
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_61_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_61_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,743 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDIU	R3, SP, 50
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_62_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_62_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,744 :: 		sprintf(txtB,"%u",rgbc[3]);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R3, SP, 65
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_63_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_63_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,747 :: 		str = (char*)Malloc(200*sizeof(char));
ORI	R25, R0, 200
JAL	_Malloc+0
NOP	
SW	R2, 16(SP)
;Sim800.c,749 :: 		*str  = 0;
SB	R0, 0(R2)
;Sim800.c,751 :: 		strcat(str,str_api);
LUI	R26, hi_addr(_str_api+0)
ORI	R26, R26, lo_addr(_str_api+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,752 :: 		strcat(str,SF.WriteAPIKey);
LUI	R26, hi_addr(_SF+38)
ORI	R26, R26, lo_addr(_SF+38)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,753 :: 		strcat(str,field1);
LUI	R26, hi_addr(_field1+0)
ORI	R26, R26, lo_addr(_field1+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,754 :: 		strcat(str,txtC);
ADDIU	R2, SP, 20
MOVZ	R26, R2, R0
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,755 :: 		strcat(str,field2);
LUI	R26, hi_addr(_field2+0)
ORI	R26, R26, lo_addr(_field2+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,756 :: 		strcat(str,txtR);
ADDIU	R2, SP, 35
MOVZ	R26, R2, R0
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,757 :: 		strcat(str,field3);
LUI	R26, hi_addr(_field3+0)
ORI	R26, R26, lo_addr(_field3+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,758 :: 		strcat(str,txtG);
ADDIU	R2, SP, 50
MOVZ	R26, R2, R0
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,759 :: 		strcat(str,field4);
LUI	R26, hi_addr(_field4+0)
ORI	R26, R26, lo_addr(_field4+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,760 :: 		strcat(str,txtB);
ADDIU	R2, SP, 65
MOVZ	R26, R2, R0
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,763 :: 		UART2_Write_Text("AT+CPIN?");
ADDIU	R23, SP, 80
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr64_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr64_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 80
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,764 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,765 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,766 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,767 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData114:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData114
NOP	
NOP	
NOP	
;Sim800.c,768 :: 		UART2_Write_Text("AT+CREG?");
ADDIU	R23, SP, 89
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr65_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr65_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 89
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,769 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,770 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,771 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,772 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData116:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData116
NOP	
NOP	
NOP	
;Sim800.c,773 :: 		UART2_Write_Text("AT+CGATT?");
ADDIU	R23, SP, 98
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr66_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr66_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,774 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,775 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,776 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,777 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData118:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData118
NOP	
NOP	
NOP	
;Sim800.c,778 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 108
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr67_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr67_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 108
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,779 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,780 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,781 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,782 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData120:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData120
NOP	
NOP	
NOP	
;Sim800.c,783 :: 		UART2_Write_Text("AT+CIPSTATUS");
ADDIU	R23, SP, 119
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr68_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr68_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 119
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,784 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,785 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,786 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,787 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData122:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData122
NOP	
NOP	
NOP	
;Sim800.c,788 :: 		UART2_Write_Text("AT+CIPMUX=0");
ADDIU	R23, SP, 132
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr69_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr69_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 132
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,789 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,790 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,791 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,792 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData124:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData124
NOP	
NOP	
NOP	
;Sim800.c,793 :: 		UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
ADDIU	R23, SP, 144
ADDIU	R22, R23, 35
LUI	R24, hi_addr(?ICS?lstr70_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr70_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 144
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,794 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,795 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,796 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,797 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData126:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData126
NOP	
NOP	
NOP	
;Sim800.c,798 :: 		UART2_Write_Text("AT+CIICR");
ADDIU	R23, SP, 179
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr71_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr71_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 179
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,799 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,800 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,801 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,802 :: 		UART2_Write_Text("AT+CIFSR");
ADDIU	R23, SP, 188
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr72_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr72_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 188
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,803 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,804 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,805 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData128:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData128
NOP	
;Sim800.c,806 :: 		UART2_Write_Text("AT+CIPSPRT=1");
ADDIU	R23, SP, 197
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr73_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr73_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 197
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,807 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,808 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,809 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,810 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData130:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData130
NOP	
NOP	
NOP	
;Sim800.c,811 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
ADDIU	R23, SP, 210
ADDIU	R22, R23, 42
LUI	R24, hi_addr(?ICS?lstr74_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr74_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 210
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,812 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,813 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,814 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,815 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData132:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData132
NOP	
;Sim800.c,816 :: 		UART2_Write_Text("AT+CIPSEND");
ADDIU	R23, SP, 252
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr75_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr75_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 252
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,817 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,818 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,819 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData134:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData134
NOP	
;Sim800.c,820 :: 		UART2_Write_Text(str);
LW	R25, 16(SP)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,821 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,822 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,823 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,824 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,825 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,826 :: 		TestForOK(1);
ORI	R25, R0, 1
JAL	_TestForOK+0
NOP	
;Sim800.c,827 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData136:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData136
NOP	
NOP	
NOP	
;Sim800.c,828 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 263
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr76_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr76_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 263
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,829 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,830 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,831 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,832 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData138:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData138
NOP	
NOP	
NOP	
;Sim800.c,834 :: 		Free(str,150*sizeof(char*));
ORI	R26, R0, 600
LW	R25, 16(SP)
JAL	_Free+0
NOP	
;Sim800.c,835 :: 		}
L_end_SendData:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 276
JR	RA
NOP	
; end of _SendData
_TestForOK:
;Sim800.c,841 :: 		void TestForOK(char c){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,843 :: 		WaitForResponse(1);
SW	R26, 4(SP)
SB	R25, 8(SP)
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,844 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_TestForOK140:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TestForOK140
NOP	
;Sim800.c,845 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,849 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SB	R25, 8(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,848 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_77_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_77_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,847 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,849 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LBU	R25, 8(SP)
;Sim800.c,851 :: 		lastMillis = TMR0.millis;
; lastMillis start address is: 16 (R4)
LW	R4, Offset(_TMR0+0)(GP)
;Sim800.c,852 :: 		if(c == 0)
ANDI	R2, R25, 255
BEQ	R2, R0, L__TestForOK228
NOP	
J	L_TestForOK142
NOP	
L__TestForOK228:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
;Sim800.c,853 :: 		while(!strstr(SimTestTxt, "OK")){
L_TestForOK143:
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
BEQ	R2, R0, L__TestForOK229
NOP	
J	L_TestForOK144
NOP	
L__TestForOK229:
; lastMillis end address is: 20 (R5)
;Sim800.c,854 :: 		newMillis = TMR0.millis - lastMillis;
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,855 :: 		if(newMillis > 5000)
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK230
NOP	
J	L_TestForOK145
NOP	
L__TestForOK230:
; lastMillis end address is: 20 (R5)
;Sim800.c,856 :: 		break;
J	L_TestForOK144
NOP	
L_TestForOK145:
;Sim800.c,857 :: 		}
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK143
NOP	
L_TestForOK144:
J	L_TestForOK146
NOP	
L_TestForOK142:
;Sim800.c,858 :: 		else if(c == 1)
; lastMillis start address is: 16 (R4)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__TestForOK231
NOP	
J	L_TestForOK147
NOP	
L__TestForOK231:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
;Sim800.c,859 :: 		while(!strstr(SimTestTxt, "CONNECT")){
L_TestForOK148:
; lastMillis start address is: 20 (R5)
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
ADDIU	R23, SP, 12
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr79_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr79_Sim800+0)
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
BEQ	R2, R0, L__TestForOK232
NOP	
J	L_TestForOK149
NOP	
L__TestForOK232:
; lastMillis end address is: 20 (R5)
;Sim800.c,860 :: 		newMillis = TMR0.millis - lastMillis;
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,861 :: 		if(newMillis > 5000)
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK233
NOP	
J	L_TestForOK150
NOP	
L__TestForOK233:
; lastMillis end address is: 20 (R5)
;Sim800.c,862 :: 		break;
J	L_TestForOK149
NOP	
L_TestForOK150:
;Sim800.c,863 :: 		}
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK148
NOP	
L_TestForOK149:
L_TestForOK147:
L_TestForOK146:
;Sim800.c,864 :: 		}
L_end_TestForOK:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _TestForOK
