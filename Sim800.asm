_InitGSM3:
;Sim800.c,52 :: 		void InitGSM3(){
ADDIU	SP, SP, -68
SW	RA, 0(SP)
;Sim800.c,53 :: 		SimVars.initial_str = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SB	R0, Offset(_SimVars+512)(GP)
;Sim800.c,54 :: 		SimVars.init_inc    = 0;
SB	R0, Offset(_SimVars+518)(GP)
;Sim800.c,55 :: 		SimVars.init_sms    = 0;
SB	R0, Offset(_SimVars+519)(GP)
;Sim800.c,56 :: 		*SimTestTxt = "Hello World this is a test";
ORI	R2, R0, lo_addr(?lstr_1_Sim800+0)
ANDI	R2, R2, 255
SB	R2, Offset(_SimTestTxt+0)(GP)
;Sim800.c,57 :: 		RB.head = 0;
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,58 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
;Sim800.c,59 :: 		RB.rcv_txt_fin = -1;
ORI	R2, R0, 255
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,60 :: 		SF.SimFlashPtr = 0;
SH	R0, Offset(_SF+598)(GP)
;Sim800.c,61 :: 		strcpy(SF.SimCelNum,"\"***************\"");
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
;Sim800.c,62 :: 		strcpy(SF.WriteAPIKey,"\"****************\"");
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
;Sim800.c,63 :: 		strcpy(SF.ReadAPIKey,"\"****************\"");
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
;Sim800.c,64 :: 		}
L_end_InitGSM3:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 68
JR	RA
NOP	
; end of _InitGSM3
_PwrUpGSM3:
;Sim800.c,69 :: 		void PwrUpGSM3(){
;Sim800.c,70 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,71 :: 		PWR = 0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,72 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM30
NOP	
;Sim800.c,73 :: 		PWR = 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,75 :: 		while(STAT){
L_PwrUpGSM32:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrUpGSM3177
NOP	
J	L_PwrUpGSM33
NOP	
L__PwrUpGSM3177:
;Sim800.c,76 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,77 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM34
NOP	
;Sim800.c,78 :: 		}
J	L_PwrUpGSM32
NOP	
L_PwrUpGSM33:
;Sim800.c,79 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM36
NOP	
NOP	
NOP	
;Sim800.c,80 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_WriteToFlashTemp:
;Sim800.c,85 :: 		void WriteToFlashTemp(){
ADDIU	SP, SP, -84
SW	RA, 0(SP)
;Sim800.c,90 :: 		if(SL.l1 <= 0)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LH	R2, Offset(_SL+0)(GP)
SLTI	R2, R2, 1
BNE	R2, R0, L__WriteToFlashTemp179
NOP	
J	L_WriteToFlashTemp8
NOP	
L__WriteToFlashTemp179:
;Sim800.c,91 :: 		GetStrLengths();
JAL	_GetStrLengths+0
NOP	
L_WriteToFlashTemp8:
;Sim800.c,93 :: 		memset(holding_buff,0,SL.l5+5);
LH	R2, Offset(_SL+8)(GP)
ADDIU	R3, R2, 5
ADDIU	R2, SP, 20
SEH	R27, R3
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Sim800.c,94 :: 		memcpy(holding_buff,SF.SimCelNum,SL.l1);
ADDIU	R2, SP, 20
LH	R27, Offset(_SL+0)(GP)
LUI	R26, hi_addr(_SF+0)
ORI	R26, R26, lo_addr(_SF+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,95 :: 		memcpy(holding_buff+SL.l1+1,SF.WriteAPIKey,SL.l2);
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
;Sim800.c,96 :: 		memcpy(holding_buff+SL.l3+1,SF.ReadAPIKey,SL.l4);
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
;Sim800.c,97 :: 		memcpy(temp,holding_buff,SL.l5+3);
LH	R2, Offset(_SL+8)(GP)
ADDIU	R3, R2, 3
ADDIU	R2, SP, 20
SEH	R27, R3
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_temp+0)
ORI	R25, R25, lo_addr(_temp+0)
JAL	_memcpy+0
NOP	
;Sim800.c,99 :: 		pos = FLASH_Settings_PAddr;
; pos start address is: 12 (R3)
LW	R3, Offset(_FLASH_Settings_PAddr+0)(GP)
;Sim800.c,100 :: 		j = NVMErasePage(pos);
SW	R3, 16(SP)
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R3, 16(SP)
SH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
;Sim800.c,101 :: 		if(j==0){
SEH	R2, R2
BEQ	R2, R0, L__WriteToFlashTemp180
NOP	
J	L_WriteToFlashTemp9
NOP	
L__WriteToFlashTemp180:
;Sim800.c,102 :: 		pos += 16 ;
ADDIU	R2, R3, 16
; pos end address is: 12 (R3)
; pos start address is: 16 (R4)
MOVZ	R4, R2, R0
;Sim800.c,103 :: 		for(i=0;i<SL.l4;i++){
SH	R0, Offset(WriteToFlashTemp_i_L0+0)(GP)
; pos end address is: 16 (R4)
L_WriteToFlashTemp10:
; pos start address is: 16 (R4)
LH	R3, Offset(_SL+6)(GP)
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__WriteToFlashTemp181
NOP	
J	L_WriteToFlashTemp11
NOP	
L__WriteToFlashTemp181:
;Sim800.c,104 :: 		j = NVMWriteWord(pos,temp[i]);
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
;Sim800.c,105 :: 		pos += 4;
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
;Sim800.c,106 :: 		Delay_ms(5);
LUI	R24, 2
ORI	R24, R24, 2260
L_WriteToFlashTemp13:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WriteToFlashTemp13
NOP	
NOP	
NOP	
;Sim800.c,103 :: 		for(i=0;i<SL.l4;i++){
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
;Sim800.c,107 :: 		}
; pos end address is: 16 (R4)
J	L_WriteToFlashTemp10
NOP	
L_WriteToFlashTemp11:
;Sim800.c,108 :: 		}
L_WriteToFlashTemp9:
;Sim800.c,110 :: 		sprintf(c,"%d",j);
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
;Sim800.c,115 :: 		,c);
LUI	R2, hi_addr(_c+0)
ORI	R2, R2, lo_addr(_c+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,114 :: 		" * flash err: %s\r\n"
LUI	R2, hi_addr(?lstr_6_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_6_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,112 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,115 :: 		,c);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,117 :: 		}
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
;Sim800.c,119 :: 		char* GetValuesFromFlash(){
ADDIU	SP, SP, -528
SW	RA, 0(SP)
;Sim800.c,124 :: 		if(SL.l1 <= 0)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LH	R2, Offset(_SL+0)(GP)
SLTI	R2, R2, 1
BNE	R2, R0, L__GetValuesFromFlash183
NOP	
J	L_GetValuesFromFlash15
NOP	
L__GetValuesFromFlash183:
;Sim800.c,125 :: 		GetStrLengths();
JAL	_GetStrLengths+0
NOP	
L_GetValuesFromFlash15:
;Sim800.c,128 :: 		ptr += 16;
LW	R2, Offset(_FLASH_Settings_VAddr+0)(GP)
ADDIU	R2, R2, 16
; ptr start address is: 20 (R5)
MOVZ	R5, R2, R0
;Sim800.c,130 :: 		for(i=0;i<SL.l5;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_GetValuesFromFlash16:
; i start address is: 24 (R6)
; ptr start address is: 20 (R5)
; ptr end address is: 20 (R5)
LH	R2, Offset(_SL+8)(GP)
SLTU	R2, R6, R2
BNE	R2, R0, L__GetValuesFromFlash184
NOP	
J	L_GetValuesFromFlash17
NOP	
L__GetValuesFromFlash184:
; ptr end address is: 20 (R5)
;Sim800.c,131 :: 		buff[i] = ptr[i];
; ptr start address is: 20 (R5)
ADDIU	R4, SP, 16
ADDU	R3, R4, R6
ADDU	R2, R5, R6
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Sim800.c,133 :: 		UART1_Write(buff[i]);
ADDU	R2, R4, R6
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,134 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
;Sim800.c,130 :: 		for(i=0;i<SL.l5;i++){
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Sim800.c,136 :: 		}
; ptr end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_GetValuesFromFlash16
NOP	
L_GetValuesFromFlash17:
;Sim800.c,137 :: 		strncpy(SF.SimCelNum,buff,SL.l1);
ADDIU	R2, SP, 16
LH	R27, Offset(_SL+0)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strncpy+0
NOP	
;Sim800.c,138 :: 		strncpy(SF.WriteAPIKey,buff+SL.l1+1,SL.l2);
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
;Sim800.c,139 :: 		strncpy(SF.ReadAPIKey,buff+SL.l3+1,SL.l4);
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
;Sim800.c,146 :: 		,SF.SimCelNum,SF.WriteAPIKey,SF.ReadAPIKey);
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
;Sim800.c,145 :: 		" * SF.ReadAPIKey:  %s\r\n"
LUI	R2, hi_addr(?lstr_7_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_7_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,142 :: 		PrintOut(PrintHandler, " * Flash Read        \r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,146 :: 		,SF.SimCelNum,SF.WriteAPIKey,SF.ReadAPIKey);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
;Sim800.c,148 :: 		return SF.SimCelNum;
LUI	R2, hi_addr(_SF+0)
ORI	R2, R2, lo_addr(_SF+0)
;Sim800.c,149 :: 		}
;Sim800.c,148 :: 		return SF.SimCelNum;
;Sim800.c,149 :: 		}
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
;Sim800.c,151 :: 		void GetStrLengths(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,152 :: 		SL.l1 = strlen(SF.SimCelNum)+1;   //len of cell num
SW	R25, 4(SP)
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SL+0)(GP)
;Sim800.c,153 :: 		SL.l2 = strlen(SF.WriteAPIKey)+1; //len of API Write key
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
SH	R3, Offset(_SL+2)(GP)
;Sim800.c,154 :: 		SL.l3 = SL.l1 + SL.l2;            //len Cell + API Wr k
LH	R2, Offset(_SL+0)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SL+4)(GP)
;Sim800.c,155 :: 		SL.l4 = strlen(SF.ReadAPIKey)+1;  //len of API Read Key
LUI	R25, hi_addr(_SF+62)
ORI	R25, R25, lo_addr(_SF+62)
JAL	_strlen+0
NOP	
ADDIU	R4, R2, 1
SH	R4, Offset(_SL+6)(GP)
;Sim800.c,156 :: 		SL.l5 = SL.l1 + SL.l2 + SL.l4;             //total length
LH	R3, Offset(_SL+2)(GP)
LH	R2, Offset(_SL+0)(GP)
ADDU	R2, R2, R3
ADDU	R3, R2, R4
SH	R3, Offset(_SL+8)(GP)
;Sim800.c,157 :: 		SL.mod = SL.l5 % 4;
ORI	R2, R0, 4
DIV	R3, R2
MFHI	R3
SH	R3, Offset(_SL+10)(GP)
;Sim800.c,158 :: 		SL.l5 += SL.mod;
LH	R2, Offset(_SL+8)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SL+8)(GP)
;Sim800.c,160 :: 		sprintf(a,"%d",SL.l1);
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
;Sim800.c,161 :: 		sprintf(b,"%d",SL.l2);
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
;Sim800.c,162 :: 		sprintf(c,"%d",SL.l3);
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
;Sim800.c,163 :: 		sprintf(d,"%d",SL.l4);
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
;Sim800.c,164 :: 		sprintf(e,"%d",SL.l5);
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
;Sim800.c,171 :: 		,a,b,c,d,e);
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
;Sim800.c,170 :: 		" * l5: %s\r\n"
LUI	R2, hi_addr(?lstr_13_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_13_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,165 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,171 :: 		,a,b,c,d,e);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 28
;Sim800.c,173 :: 		}
L_end_GetStrLengths:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _GetStrLengths
_RcvSimTxt:
;Sim800.c,178 :: 		void RcvSimTxt(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,180 :: 		while(UART2_Data_Ready()) {     // If data is received
L_RcvSimTxt19:
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__RcvSimTxt188
NOP	
J	L_RcvSimTxt20
NOP	
L__RcvSimTxt188:
;Sim800.c,181 :: 		if (U2STAbits.FERR || U2STAbits.OERR){
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__RcvSimTxt189
NOP	
J	L__RcvSimTxt163
NOP	
L__RcvSimTxt189:
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__RcvSimTxt190
NOP	
J	L__RcvSimTxt162
NOP	
L__RcvSimTxt190:
J	L_RcvSimTxt23
NOP	
L__RcvSimTxt163:
L__RcvSimTxt162:
;Sim800.c,182 :: 		if (U2STAbits.FERR ){
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BNE	R2, R0, L__RcvSimTxt192
NOP	
J	L_RcvSimTxt24
NOP	
L__RcvSimTxt192:
;Sim800.c,183 :: 		U2STAbits.FERR = 0;
ORI	R2, R0, 4
SW	R2, Offset(U2STAbits+4)(GP)
;Sim800.c,184 :: 		goto m0;
J	___RcvSimTxt_m0
NOP	
;Sim800.c,185 :: 		}
L_RcvSimTxt24:
;Sim800.c,186 :: 		if(U2STAbits.OERR)
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__RcvSimTxt194
NOP	
J	L_RcvSimTxt25
NOP	
L__RcvSimTxt194:
;Sim800.c,187 :: 		U2STAbits.OERR = 0;
ORI	R2, R0, 2
SW	R2, Offset(U2STAbits+4)(GP)
L_RcvSimTxt25:
;Sim800.c,188 :: 		}
L_RcvSimTxt23:
;Sim800.c,189 :: 		m0:
___RcvSimTxt_m0:
;Sim800.c,190 :: 		txt = U2RXREG;
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Sim800.c,191 :: 		U1TXREG = txt;
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,192 :: 		if(txt >= 0x20){
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt195
NOP	
J	L_RcvSimTxt26
NOP	
L__RcvSimTxt195:
;Sim800.c,193 :: 		RB.buff[RB.head] = txt;
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
SB	R4, 0(R2)
; txt end address is: 16 (R4)
;Sim800.c,194 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,195 :: 		}else if(U2RXREG == 0x0A){
J	L_RcvSimTxt27
NOP	
L_RcvSimTxt26:
LW	R3, Offset(U2RXREG+0)(GP)
ORI	R2, R0, 10
BEQ	R3, R2, L__RcvSimTxt196
NOP	
J	L_RcvSimTxt28
NOP	
L__RcvSimTxt196:
;Sim800.c,196 :: 		RB.buff[RB.head] = ',';
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
ORI	R2, R0, 44
SB	R2, 0(R3)
;Sim800.c,197 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,198 :: 		}
L_RcvSimTxt28:
L_RcvSimTxt27:
;Sim800.c,199 :: 		if(RB.head > 999){
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RcvSimTxt197
NOP	
J	L_RcvSimTxt29
NOP	
L__RcvSimTxt197:
;Sim800.c,200 :: 		RB.head = 0;             //rest head when buffer is full
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,201 :: 		}
L_RcvSimTxt29:
;Sim800.c,202 :: 		}
J	L_RcvSimTxt19
NOP	
L_RcvSimTxt20:
;Sim800.c,203 :: 		RB.rcv_txt_fin = 1;
ORI	R2, R0, 1
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,204 :: 		}
L_end_RcvSimTxt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RcvSimTxt
_TestRingPointers:
;Sim800.c,209 :: 		int TestRingPointers(){
;Sim800.c,211 :: 		if(RB.tail > RB.head){
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__TestRingPointers199
NOP	
J	L_TestRingPointers30
NOP	
L__TestRingPointers199:
;Sim800.c,212 :: 		diff = 1000 - RB.tail;
LHU	R3, Offset(_RB+1004)(GP)
ORI	R2, R0, 1000
SUBU	R3, R2, R3
;Sim800.c,213 :: 		diff += RB.head;
LHU	R2, Offset(_RB+1002)(GP)
ADDU	R2, R3, R2
; diff start address is: 8 (R2)
;Sim800.c,214 :: 		}else{
; diff end address is: 8 (R2)
J	L_TestRingPointers31
NOP	
L_TestRingPointers30:
;Sim800.c,215 :: 		diff = RB.head - RB.tail;
LHU	R3, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SUBU	R2, R2, R3
; diff start address is: 12 (R3)
ANDI	R3, R2, 65535
; diff end address is: 12 (R3)
SEH	R2, R3
;Sim800.c,216 :: 		}
L_TestRingPointers31:
;Sim800.c,217 :: 		return diff;
; diff start address is: 8 (R2)
; diff end address is: 8 (R2)
;Sim800.c,218 :: 		}
L_end_TestRingPointers:
JR	RA
NOP	
; end of _TestRingPointers
_WaitForResponse:
;Sim800.c,223 :: 		void WaitForResponse(short dly){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,225 :: 		lastMillis = TMR0.millis;
; lastMillis start address is: 20 (R5)
LW	R5, Offset(_TMR0+0)(GP)
;Sim800.c,226 :: 		RB.rcv_txt_fin   = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,227 :: 		RB.last_head     = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,228 :: 		do{
J	L_WaitForResponse32
NOP	
L__WaitForResponse164:
;Sim800.c,247 :: 		}while(!RB.rcv_txt_fin);
;Sim800.c,228 :: 		do{
L_WaitForResponse32:
;Sim800.c,229 :: 		LATE3_bit = !LATE3_bit;
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,230 :: 		if(dly == 0)
SEB	R2, R25
BEQ	R2, R0, L__WaitForResponse201
NOP	
J	L_WaitForResponse35
NOP	
L__WaitForResponse201:
; lastMillis end address is: 20 (R5)
;Sim800.c,231 :: 		Delay_ms(100);
; lastMillis start address is: 20 (R5)
LUI	R24, 40
ORI	R24, R24, 45226
L_WaitForResponse36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse36
NOP	
J	L_WaitForResponse38
NOP	
L_WaitForResponse35:
;Sim800.c,232 :: 		else if(dly == 1)
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForResponse202
NOP	
J	L_WaitForResponse39
NOP	
L__WaitForResponse202:
;Sim800.c,233 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForResponse40:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse40
NOP	
NOP	
NOP	
J	L_WaitForResponse42
NOP	
L_WaitForResponse39:
;Sim800.c,234 :: 		else if(dly == 3){
SEB	R3, R25
ORI	R2, R0, 3
BEQ	R3, R2, L__WaitForResponse203
NOP	
J	L_WaitForResponse43
NOP	
L__WaitForResponse203:
;Sim800.c,235 :: 		UART2_Write_Text("ATE0");
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
;Sim800.c,236 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,237 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LB	R25, 4(SP)
;Sim800.c,238 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_WaitForResponse44:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse44
NOP	
NOP	
NOP	
;Sim800.c,239 :: 		}
J	L_WaitForResponse46
NOP	
L_WaitForResponse43:
;Sim800.c,241 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse47:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse47
NOP	
L_WaitForResponse46:
L_WaitForResponse42:
L_WaitForResponse38:
;Sim800.c,244 :: 		newMillis = TMR0.millis - lastMillis;
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,245 :: 		if(newMillis > 25000)
SLTIU	R2, R2, 25001
BEQ	R2, R0, L__WaitForResponse204
NOP	
J	L_WaitForResponse49
NOP	
L__WaitForResponse204:
; lastMillis end address is: 20 (R5)
;Sim800.c,246 :: 		break;
J	L_WaitForResponse33
NOP	
L_WaitForResponse49:
;Sim800.c,247 :: 		}while(!RB.rcv_txt_fin);
; lastMillis start address is: 20 (R5)
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForResponse206
NOP	
J	L__WaitForResponse164
NOP	
L__WaitForResponse206:
; lastMillis end address is: 20 (R5)
L_WaitForResponse33:
;Sim800.c,248 :: 		}
L_end_WaitForResponse:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WaitForResponse
_RingToTempBuf:
;Sim800.c,253 :: 		void RingToTempBuf(){
;Sim800.c,255 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,256 :: 		RB.tail = RB.last_tail;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
; i end address is: 20 (R5)
;Sim800.c,258 :: 		while(RB.tail != RB.head){
L_RingToTempBuf50:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
BNE	R2, R3, L__RingToTempBuf209
NOP	
J	L_RingToTempBuf51
NOP	
L__RingToTempBuf209:
;Sim800.c,259 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,264 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,265 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,266 :: 		if(RB.tail > 999)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RingToTempBuf210
NOP	
J	L_RingToTempBuf52
NOP	
L__RingToTempBuf210:
;Sim800.c,267 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
L_RingToTempBuf52:
;Sim800.c,268 :: 		};
J	L_RingToTempBuf50
NOP	
L_RingToTempBuf51:
;Sim800.c,269 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,271 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,272 :: 		}
L_end_RingToTempBuf:
JR	RA
NOP	
; end of _RingToTempBuf
_SetupIOT:
;Sim800.c,278 :: 		char SetupIOT(){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Sim800.c,289 :: 		" * ATE0\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(?lstr_15_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_15_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,288 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,289 :: 		" * ATE0\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,292 :: 		WaitForResponse(3);
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
;Sim800.c,293 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT53:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT53
NOP	
;Sim800.c,294 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,300 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,299 :: 		" * Check if Sim is Registered\r\n"
LUI	R2, hi_addr(?lstr_16_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_16_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,297 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,300 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,302 :: 		wait:
___SetupIOT_wait:
;Sim800.c,304 :: 		UART2_Write_Text("AT+CREG?");
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
;Sim800.c,305 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,306 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,307 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,308 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT55:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT55
NOP	
NOP	
NOP	
;Sim800.c,309 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,314 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,313 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_18_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_18_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,312 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,314 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,318 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT212
NOP	
J	L_SetupIOT57
NOP	
L__SetupIOT212:
;Sim800.c,319 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,320 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,323 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,331 :: 		,txtA,string[0],string[1],string[2],string[3],string[4]);
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
;Sim800.c,330 :: 		" *string[4]  %s\r\n"
LUI	R2, hi_addr(?lstr_20_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_20_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,324 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,331 :: 		,txtA,string[0],string[1],string[2],string[3],string[4]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,333 :: 		str_rcv = findnumber(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
;Sim800.c,334 :: 		res = atoi(str_rcv);  //get the sms rec number
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,335 :: 		if(res == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT213
NOP	
J	L_SetupIOT58
NOP	
L__SetupIOT213:
;Sim800.c,337 :: 		sprintf(txtA,"%d",res);
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
;Sim800.c,340 :: 		,txtA);
ADDIU	R2, SP, 12
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,339 :: 		" *Registered with:= %s\r\n"
LUI	R2, hi_addr(?lstr_22_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_22_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,338 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,340 :: 		,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,343 :: 		}else{
J	L_SetupIOT59
NOP	
L_SetupIOT58:
;Sim800.c,346 :: 		" *Sim Not Registered\r\n");
LUI	R2, hi_addr(?lstr_23_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_23_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,345 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,346 :: 		" *Sim Not Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,348 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT60:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT60
NOP	
NOP	
NOP	
;Sim800.c,349 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,350 :: 		}
L_SetupIOT59:
;Sim800.c,351 :: 		}
L_SetupIOT57:
;Sim800.c,354 :: 		" *Sim Registered\r\n");
LUI	R2, hi_addr(?lstr_24_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_24_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,353 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,354 :: 		" *Sim Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,358 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,359 :: 		}
;Sim800.c,358 :: 		return 1;
;Sim800.c,359 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,366 :: 		char WaitForSetupSMS(unsigned int Indx){
ADDIU	SP, SP, -52
SW	RA, 0(SP)
;Sim800.c,373 :: 		UART2_Write_Text("AT+CMGF=1");
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
;Sim800.c,374 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,375 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,378 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,379 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,381 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS62:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS62
NOP	
;Sim800.c,383 :: 		WaitForResponse(0);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,384 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS64:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS64
NOP	
;Sim800.c,385 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,387 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 84 (R21)
SEH	R21, R2
;Sim800.c,390 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,391 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,400 :: 		,txtA,string[0],string[1],
ADDIU	R3, SP, 16
;Sim800.c,402 :: 		string[4],string[5]);
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,401 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,400 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,399 :: 		" *string[5]  %s\r\n"
LUI	R2, hi_addr(?lstr_28_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_28_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,392 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,402 :: 		string[4],string[5]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
;Sim800.c,405 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 14(SP)
;Sim800.c,406 :: 		sprintf(sms,"%d",res);
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
;Sim800.c,410 :: 		,sms);
ADDIU	R2, SP, 22
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,409 :: 		" *sms no:= %s\r\n"
LUI	R2, hi_addr(?lstr_30_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_30_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,408 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,410 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,414 :: 		UART2_Write_Text("AT+CMGR=");
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
;Sim800.c,415 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,416 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,417 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,419 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,420 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS66:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS66
NOP	
;Sim800.c,421 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,422 :: 		str_rcv = setstr(SimTestTxt);
SH	R25, 12(SP)
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,423 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,425 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,435 :: 		,txtA,string[0],string[1],
ADDIU	R3, SP, 16
;Sim800.c,438 :: 		string[6]);
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
;Sim800.c,437 :: 		string[4],string[5],
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,436 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,435 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,434 :: 		" *string[6]  %s\r\n"
LUI	R2, hi_addr(?lstr_33_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_33_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,426 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,438 :: 		string[6]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 40
LHU	R25, 12(SP)
;Sim800.c,441 :: 		if(Indx == 0){
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS215
NOP	
J	L_WaitForSetupSMS68
NOP	
L__WaitForSetupSMS215:
;Sim800.c,442 :: 		SF.SimFlashPtr = strlen(string[1])+1;
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+598)(GP)
;Sim800.c,443 :: 		SF.SimFlashCellByteCount = SF.SimFlashPtr;
SH	R2, Offset(_SF+602)(GP)
;Sim800.c,444 :: 		memcpy(SF.SimFlashBuff,string[1],SF.SimFlashPtr);
LHU	R27, Offset(_SF+598)(GP)
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+86)
ORI	R25, R25, lo_addr(_SF+86)
JAL	_memcpy+0
NOP	
;Sim800.c,445 :: 		strncpy(SF.SimCelNum,string[1],strlen(string[1])+1);
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
;Sim800.c,446 :: 		strncpy(SF.SimDate,string[3],strlen(string[3]));
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
;Sim800.c,447 :: 		strncpy(SF.SimTime,string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+29)
ORI	R25, R25, lo_addr(_SF+29)
JAL	_strncpy+0
NOP	
;Sim800.c,454 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
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
;Sim800.c,453 :: 		" * SF.SimTime: %s\r\n"
LUI	R2, hi_addr(?lstr_34_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_34_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,450 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,454 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,456 :: 		}else if(Indx == 1){
J	L_WaitForSetupSMS69
NOP	
L_WaitForSetupSMS68:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS216
NOP	
J	L_WaitForSetupSMS70
NOP	
L__WaitForSetupSMS216:
;Sim800.c,458 :: 		SF.SimFlashAPIWriteIndx = SF.SimFlashPtr;
LHU	R2, Offset(_SF+598)(GP)
SH	R2, Offset(_SF+608)(GP)
;Sim800.c,459 :: 		SF.SimFlashAPIWriteCount = strlen(string[5])+1;
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+604)(GP)
;Sim800.c,460 :: 		memcpy(SF.SimFlashBuff+SF.SimFlashPtr,string[5],strlen(string[5])+1);
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
;Sim800.c,461 :: 		strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);
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
;Sim800.c,462 :: 		SF.SimFlashPtr += strlen(string[5])+1;
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
LHU	R2, Offset(_SF+598)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SF+598)(GP)
;Sim800.c,465 :: 		SF.SimFlashAPIReadIndx = SF.SimFlashPtr;
SH	R2, Offset(_SF+610)(GP)
;Sim800.c,466 :: 		memcpy(SF.SimFlashBuff+SF.SimFlashPtr,string[6],strlen(string[6]));
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
;Sim800.c,467 :: 		strncpy(SF.ReadAPIKey,string[6],strlen(string[6])+1);
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
;Sim800.c,468 :: 		SF.SimFlashPtr += strlen(string[6])+1;
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
LHU	R2, Offset(_SF+598)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SF+598)(GP)
;Sim800.c,469 :: 		SF.SimFlashAPIReadCount = strlen(string[6])+1;
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+606)(GP)
;Sim800.c,474 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
LUI	R2, hi_addr(_SF+62)
ORI	R2, R2, lo_addr(_SF+62)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+38)
ORI	R2, R2, lo_addr(_SF+38)
SW	R2, 8(SP)
;Sim800.c,473 :: 		" * SF.ReadAPIKey:  %s\r\n"
LUI	R2, hi_addr(?lstr_35_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_35_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,471 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,474 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LHU	R25, 12(SP)
;Sim800.c,477 :: 		for(i=0;i<SF.SimFlashPtr;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_WaitForSetupSMS71:
; i start address is: 16 (R4)
SEH	R3, R4
LHU	R2, Offset(_SF+598)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS217
NOP	
J	L_WaitForSetupSMS72
NOP	
L__WaitForSetupSMS217:
;Sim800.c,478 :: 		UART1_Write(SF.SimFlashBuff[i]);
SEH	R3, R4
LUI	R2, hi_addr(_SF+86)
ORI	R2, R2, lo_addr(_SF+86)
ADDU	R2, R2, R3
SH	R25, 12(SP)
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,479 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,477 :: 		for(i=0;i<SF.SimFlashPtr;i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 8 (R2)
;Sim800.c,480 :: 		}
SEH	R4, R2
; i end address is: 8 (R2)
J	L_WaitForSetupSMS71
NOP	
L_WaitForSetupSMS72:
;Sim800.c,481 :: 		UART1_Write(0x0D);
SH	R25, 12(SP)
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,482 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,484 :: 		}
L_WaitForSetupSMS70:
L_WaitForSetupSMS69:
;Sim800.c,487 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS74:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS74
NOP	
NOP	
NOP	
;Sim800.c,488 :: 		RemoveSMSText(res);
SH	R25, 12(SP)
LH	R25, 14(SP)
JAL	_RemoveSMSText+0
NOP	
;Sim800.c,489 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
; str_rcv start address is: 84 (R21)
MOVZ	R21, R2, R0
;Sim800.c,490 :: 		res     = strcmp(str_rcv,"OK,");
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
;Sim800.c,491 :: 		sprintf(txtA,"%d",res);
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
;Sim800.c,497 :: 		,SimTestTxt,str_rcv,txtA);
ADDIU	R2, SP, 16
ADDIU	SP, SP, -20
SW	R2, 16(SP)
SW	R21, 12(SP)
; str_rcv end address is: 84 (R21)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SW	R2, 8(SP)
;Sim800.c,496 :: 		" * OK-0: %s\r\n"
LUI	R2, hi_addr(?lstr_38_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_38_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,493 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,497 :: 		,SimTestTxt,str_rcv,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,499 :: 		if((res == 0)&&(Indx == 1)){
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS218
NOP	
J	L__WaitForSetupSMS168
NOP	
L__WaitForSetupSMS218:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS219
NOP	
J	L__WaitForSetupSMS167
NOP	
L__WaitForSetupSMS219:
L__WaitForSetupSMS166:
;Sim800.c,500 :: 		WriteToFlashTemp();
JAL	_WriteToFlashTemp+0
NOP	
;Sim800.c,501 :: 		return 3;
ORI	R2, R0, 3
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,499 :: 		if((res == 0)&&(Indx == 1)){
L__WaitForSetupSMS168:
L__WaitForSetupSMS167:
;Sim800.c,503 :: 		else if ((res == 0)&&(Indx == 0))
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS220
NOP	
J	L__WaitForSetupSMS170
NOP	
L__WaitForSetupSMS220:
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS221
NOP	
J	L__WaitForSetupSMS169
NOP	
L__WaitForSetupSMS221:
L__WaitForSetupSMS165:
;Sim800.c,504 :: 		return 2;
ORI	R2, R0, 2
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,503 :: 		else if ((res == 0)&&(Indx == 0))
L__WaitForSetupSMS170:
L__WaitForSetupSMS169:
;Sim800.c,506 :: 		return res;
LH	R2, 14(SP)
;Sim800.c,507 :: 		}
;Sim800.c,506 :: 		return res;
;Sim800.c,507 :: 		}
L_end_WaitForSetupSMS:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 52
JR	RA
NOP	
; end of _WaitForSetupSMS
_AT_Initial:
;Sim800.c,513 :: 		void AT_Initial(){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Sim800.c,516 :: 		UART2_Write_Text("AT&W+CNMI=2,1,0,0,0");
SW	R25, 4(SP)
ADDIU	R23, SP, 8
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr39_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr39_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,517 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,518 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,521 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,522 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_AT_Initial84:
ADDIU	R24, R24, -1
BNE	R24, R0, L_AT_Initial84
NOP	
;Sim800.c,523 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,524 :: 		}
L_end_AT_Initial:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _AT_Initial
_GetAPI_Key_SMS:
;Sim800.c,529 :: 		char GetAPI_Key_SMS(){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Sim800.c,534 :: 		UART2_Write_Text("AT+CMGS=");
SW	R25, 4(SP)
ADDIU	R23, SP, 8
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr40_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr40_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,535 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,536 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,537 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,540 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,541 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,542 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_GetAPI_Key_SMS86:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetAPI_Key_SMS86
NOP	
NOP	
NOP	
;Sim800.c,546 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,545 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_41_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_41_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,544 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,546 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,549 :: 		UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
ADDIU	R23, SP, 17
ADDIU	R22, R23, 63
LUI	R24, hi_addr(?ICS?lstr42_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr42_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,550 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,551 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,552 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,554 :: 		response = WaitForSetupSMS(1);
ORI	R25, R0, 1
JAL	_WaitForSetupSMS+0
NOP	
;Sim800.c,556 :: 		return response;
;Sim800.c,557 :: 		}
;Sim800.c,556 :: 		return response;
;Sim800.c,557 :: 		}
L_end_GetAPI_Key_SMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _GetAPI_Key_SMS
_SendSMS:
;Sim800.c,562 :: 		char SendSMS(char sms_type){
ADDIU	SP, SP, -184
SW	RA, 0(SP)
;Sim800.c,566 :: 		if(!onecA){
SW	R25, 4(SP)
LB	R2, Offset(SendSMS_onecA_L0+0)(GP)
BEQ	R2, R0, L__SendSMS225
NOP	
J	L_SendSMS88
NOP	
L__SendSMS225:
;Sim800.c,567 :: 		onecA = 1;
ORI	R2, R0, 1
SB	R2, Offset(SendSMS_onecA_L0+0)(GP)
;Sim800.c,568 :: 		AT_Initial();
JAL	_AT_Initial+0
NOP	
;Sim800.c,569 :: 		}
L_SendSMS88:
;Sim800.c,570 :: 		UART2_Write_Text("AT+CMGF=1");
ADDIU	R23, SP, 9
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr43_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr43_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 9
SB	R25, 8(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,571 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,572 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,573 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS89:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS89
NOP	
;Sim800.c,574 :: 		UART2_Write_Text("AT+CMGS=");
ADDIU	R23, SP, 19
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr44_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr44_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 19
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,575 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,576 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,577 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,578 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS91:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS91
NOP	
NOP	
NOP	
;Sim800.c,579 :: 		switch(sms_type){
J	L_SendSMS93
NOP	
;Sim800.c,580 :: 		case 0:
L_SendSMS95:
;Sim800.c,581 :: 		UART2_Write_Text("ERROR in setup Power down and start again!");
ADDIU	R23, SP, 28
ADDIU	R22, R23, 43
LUI	R24, hi_addr(?ICS?lstr45_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr45_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 28
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,582 :: 		break;
J	L_SendSMS94
NOP	
;Sim800.c,583 :: 		case 1:
L_SendSMS96:
;Sim800.c,584 :: 		UART2_Write_Text("Reply WebSite");
ADDIU	R23, SP, 71
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr46_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr46_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 71
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,585 :: 		break;
J	L_SendSMS94
NOP	
;Sim800.c,586 :: 		case 2:
L_SendSMS97:
;Sim800.c,587 :: 		UART2_Write_Text("Reply API Key");
ADDIU	R23, SP, 85
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr47_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr47_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 85
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,588 :: 		break;
J	L_SendSMS94
NOP	
;Sim800.c,589 :: 		case 3:
L_SendSMS98:
;Sim800.c,590 :: 		UART2_Write_Text("Setup Complete!");
ADDIU	R23, SP, 99
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr48_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr48_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 99
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,591 :: 		break;
J	L_SendSMS94
NOP	
;Sim800.c,592 :: 		case 4:
L_SendSMS99:
;Sim800.c,593 :: 		UART2_Write_Text("Device Powered up!");
ADDIU	R23, SP, 115
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr49_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr49_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,594 :: 		break;
J	L_SendSMS94
NOP	
;Sim800.c,595 :: 		case 5:
L_SendSMS100:
;Sim800.c,596 :: 		UART2_Write_Text("SMS Not recieved!");
ADDIU	R23, SP, 134
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr50_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr50_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 134
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,597 :: 		break;
J	L_SendSMS94
NOP	
;Sim800.c,598 :: 		default:
L_SendSMS101:
;Sim800.c,599 :: 		UART2_Write_Text("Error Power cycle the device!");
ADDIU	R23, SP, 152
ADDIU	R22, R23, 30
LUI	R24, hi_addr(?ICS?lstr51_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr51_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 152
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,600 :: 		break;
J	L_SendSMS94
NOP	
;Sim800.c,601 :: 		}
L_SendSMS93:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS227
NOP	
J	L_SendSMS95
NOP	
L__SendSMS227:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS229
NOP	
J	L_SendSMS96
NOP	
L__SendSMS229:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS231
NOP	
J	L_SendSMS97
NOP	
L__SendSMS231:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__SendSMS233
NOP	
J	L_SendSMS98
NOP	
L__SendSMS233:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__SendSMS235
NOP	
J	L_SendSMS99
NOP	
L__SendSMS235:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__SendSMS237
NOP	
J	L_SendSMS100
NOP	
L__SendSMS237:
J	L_SendSMS101
NOP	
L_SendSMS94:
;Sim800.c,602 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,603 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,604 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,605 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendSMS102:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS102
NOP	
NOP	
NOP	
;Sim800.c,607 :: 		}
L_end_SendSMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 184
JR	RA
NOP	
; end of _SendSMS
_GetSMSText:
;Sim800.c,612 :: 		char* GetSMSText(){
ADDIU	SP, SP, -56
SW	RA, 0(SP)
;Sim800.c,617 :: 		UART1_Write_Text("=================\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 36
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr52_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr52_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 36
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,618 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,621 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,622 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
; num_strs start address is: 20 (R5)
SEH	R5, R2
;Sim800.c,624 :: 		err = strncmp(sms_test,string[0],4);
ORI	R27, R0, 4
LUI	R26, hi_addr(_string+0)
ORI	R26, R26, lo_addr(_string+0)
LUI	R25, hi_addr(_sms_test+0)
ORI	R25, R25, lo_addr(_sms_test+0)
JAL	_strncmp+0
NOP	
SH	R2, 34(SP)
;Sim800.c,626 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SH	R5, 8(SP)
; num_strs end address is: 20 (R5)
LUI	R2, hi_addr(?lstr_53_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_53_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,627 :: 		sprintf(txtB,"%d",err);
ADDIU	R3, SP, 26
LH	R2, 34(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_54_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_54_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,638 :: 		,txtA,txtB,string[0],
ADDIU	R4, SP, 26
ADDIU	R3, SP, 20
;Sim800.c,641 :: 		string[5],string[6]);
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
ADDIU	SP, SP, -44
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 36(SP)
;Sim800.c,640 :: 		string[3],string[4],
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 28(SP)
;Sim800.c,639 :: 		string[1],string[2],
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 20(SP)
;Sim800.c,638 :: 		,txtA,txtB,string[0],
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 16(SP)
SW	R4, 12(SP)
SW	R3, 8(SP)
;Sim800.c,637 :: 		" *string[6]  %s\r\n"
LUI	R2, hi_addr(?lstr_55_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_55_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,628 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,641 :: 		string[5],string[6]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 44
;Sim800.c,644 :: 		if(!err){
LH	R2, 34(SP)
BEQ	R2, R0, L__GetSMSText239
NOP	
J	L_GetSMSText104
NOP	
L__GetSMSText239:
;Sim800.c,646 :: 		is_digit = isdigit(*string[1]);
LBU	R25, Offset(_string+64)(GP)
JAL	_isdigit+0
NOP	
;Sim800.c,647 :: 		if(is_digit == 1){
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__GetSMSText240
NOP	
J	L_GetSMSText105
NOP	
L__GetSMSText240:
;Sim800.c,648 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 32(SP)
;Sim800.c,650 :: 		sprintf(sms,"%d",res);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_56_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_56_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,653 :: 		,sms);
ADDIU	R2, SP, 16
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,652 :: 		" *no of sms's:= %s\r\n"
LUI	R2, hi_addr(?lstr_57_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_57_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,651 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,653 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,655 :: 		ReadMSG(res);
LH	R25, 32(SP)
JAL	_ReadMSG+0
NOP	
;Sim800.c,656 :: 		}else{
J	L_GetSMSText106
NOP	
L_GetSMSText105:
;Sim800.c,657 :: 		SendSMS(5);
ORI	R25, R0, 5
JAL	_SendSMS+0
NOP	
;Sim800.c,658 :: 		res = 1;
ORI	R2, R0, 1
SH	R2, 32(SP)
;Sim800.c,659 :: 		}
L_GetSMSText106:
;Sim800.c,660 :: 		RemoveSMSText(res);
LH	R25, 32(SP)
JAL	_RemoveSMSText+0
NOP	
;Sim800.c,661 :: 		}
L_GetSMSText104:
;Sim800.c,664 :: 		}
L_end_GetSMSText:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 56
JR	RA
NOP	
; end of _GetSMSText
_ReadMSG:
;Sim800.c,670 :: 		char* ReadMSG(int msg_num){
ADDIU	SP, SP, -48
SW	RA, 0(SP)
;Sim800.c,676 :: 		sprintf(sms,"%d",msg_num);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_58_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_58_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,677 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG107:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG107
NOP	
;Sim800.c,681 :: 		,sms);
ADDIU	R2, SP, 20
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,680 :: 		" *num_sms's:= %s\r\n"
LUI	R2, hi_addr(?lstr_59_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_59_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,679 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,681 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,684 :: 		UART2_Write_Text("AT+CMGF=1");
ADDIU	R23, SP, 28
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr60_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr60_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 28
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,685 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,686 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,687 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,688 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,689 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG109:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG109
NOP	
;Sim800.c,692 :: 		UART2_Write_Text("AT+CMGR=");
ADDIU	R23, SP, 38
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr61_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr61_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 38
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,693 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,694 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,695 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,697 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,698 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,699 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG111:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG111
NOP	
;Sim800.c,702 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,703 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
SH	R2, 26(SP)
;Sim800.c,704 :: 		text = strchr(string[4], '"');
ORI	R26, R0, 34
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strchr+0
NOP	
SW	R2, 16(SP)
;Sim800.c,705 :: 		strcpy(string[3], RemoveChars(string[3],'"',0x0A));
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
;Sim800.c,706 :: 		strcpy(string[4], RemoveChars(string[4],0x02,'+'));
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
;Sim800.c,707 :: 		strcpy(string[5], RemoveChars(text,'"','O'));
ORI	R27, R0, 79
ORI	R26, R0, 34
LW	R25, 16(SP)
JAL	_RemoveChars+0
NOP	
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strcpy+0
NOP	
;Sim800.c,711 :: 		sprintf(sms,"%d",num_strs);
ADDIU	R3, SP, 20
LH	R2, 26(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_62_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_62_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,720 :: 		,sms,string[0],string[1],
ADDIU	R3, SP, 20
;Sim800.c,722 :: 		string[4],string[5]);
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,721 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,720 :: 		,sms,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,719 :: 		" *string[5]  %s\r\n"
LUI	R2, hi_addr(?lstr_63_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_63_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,712 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,722 :: 		string[4],string[5]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
;Sim800.c,724 :: 		}
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
;Sim800.c,729 :: 		int RemoveSMSText(int sms_cnt){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,733 :: 		sprintf(sms,"%d",sms_cnt);
ADDIU	R3, SP, 6
SH	R25, 4(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_64_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_64_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,736 :: 		,sms);
ADDIU	R2, SP, 6
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,735 :: 		" *num_strs:= %s\r\n"
LUI	R2, hi_addr(?lstr_65_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_65_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,734 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,736 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 4(SP)
;Sim800.c,738 :: 		do{
L_RemoveSMSText113:
;Sim800.c,739 :: 		sprintf(sms,"%d",sms_cnt);
ADDIU	R3, SP, 6
SH	R25, 4(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_66_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_66_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,740 :: 		UART2_Write_Text("AT+CMGD=");
ADDIU	R23, SP, 10
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr67_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr67_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 10
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,741 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 6
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,742 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,743 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,746 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LH	R25, 4(SP)
;Sim800.c,747 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_RemoveSMSText116:
ADDIU	R24, R24, -1
BNE	R24, R0, L_RemoveSMSText116
NOP	
;Sim800.c,748 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,749 :: 		sms_cnt--;
ADDIU	R2, R25, -1
SEH	R25, R2
;Sim800.c,750 :: 		}while(sms_cnt > 0);
SEH	R2, R2
SLTI	R2, R2, 1
BNE	R2, R0, L__RemoveSMSText243
NOP	
J	L_RemoveSMSText113
NOP	
L__RemoveSMSText243:
;Sim800.c,752 :: 		return sms_cnt;
SEH	R2, R25
;Sim800.c,753 :: 		}
L_end_RemoveSMSText:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _RemoveSMSText
_Test_Update_ThingSpeak:
;Sim800.c,759 :: 		int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,767 :: 		if(s != sLast){
SW	R25, 4(SP)
ANDI	R3, R25, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak246
NOP	
J	L_Test_Update_ThingSpeak118
NOP	
L__Test_Update_ThingSpeak246:
;Sim800.c,768 :: 		sLast = s;
SB	R25, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
;Sim800.c,774 :: 		}
L_Test_Update_ThingSpeak118:
;Sim800.c,775 :: 		if(m != mLast){
ANDI	R3, R26, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak248
NOP	
J	L_Test_Update_ThingSpeak119
NOP	
L__Test_Update_ThingSpeak248:
;Sim800.c,776 :: 		mLast = m;
SB	R26, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
;Sim800.c,782 :: 		}
L_Test_Update_ThingSpeak119:
;Sim800.c,783 :: 		if(h != hLast){
ANDI	R3, R27, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak250
NOP	
J	L_Test_Update_ThingSpeak120
NOP	
L__Test_Update_ThingSpeak250:
;Sim800.c,784 :: 		hLast = h;
SB	R27, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
;Sim800.c,790 :: 		}
L_Test_Update_ThingSpeak120:
;Sim800.c,793 :: 		m > SimVars.time_to_log){
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_Update_ThingSpeak251
NOP	
J	L__Test_Update_ThingSpeak173
NOP	
L__Test_Update_ThingSpeak251:
ANDI	R3, R26, 65535
LHU	R2, Offset(_SimVars+514)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Test_Update_ThingSpeak252
NOP	
J	L__Test_Update_ThingSpeak172
NOP	
L__Test_Update_ThingSpeak252:
L__Test_Update_ThingSpeak171:
;Sim800.c,794 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,795 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,796 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Test_Update_ThingSpeak
NOP	
;Sim800.c,793 :: 		m > SimVars.time_to_log){
L__Test_Update_ThingSpeak173:
L__Test_Update_ThingSpeak172:
;Sim800.c,798 :: 		return -1;
ORI	R2, R0, 65535
;Sim800.c,799 :: 		}
;Sim800.c,798 :: 		return -1;
;Sim800.c,799 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,804 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -276
SW	RA, 0(SP)
;Sim800.c,814 :: 		sprintf(txtC,"%u",rgbc[0]);
SW	R25, 4(SP)
SW	R26, 8(SP)
LHU	R2, 0(R25)
ADDIU	R3, SP, 20
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_68_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_68_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,815 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R3, SP, 35
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_69_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_69_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,816 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDIU	R3, SP, 50
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_70_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_70_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,817 :: 		sprintf(txtB,"%u",rgbc[3]);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R3, SP, 65
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_71_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_71_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,820 :: 		str = (char*)Malloc(200*sizeof(char));
ORI	R25, R0, 200
JAL	_Malloc+0
NOP	
SW	R2, 16(SP)
;Sim800.c,822 :: 		*str  = 0;
SB	R0, 0(R2)
;Sim800.c,824 :: 		strcat(str,str_api);
LUI	R26, hi_addr(_str_api+0)
ORI	R26, R26, lo_addr(_str_api+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,825 :: 		strcat(str,SF.WriteAPIKey);
LUI	R26, hi_addr(_SF+38)
ORI	R26, R26, lo_addr(_SF+38)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,826 :: 		strcat(str,field1);
LUI	R26, hi_addr(_field1+0)
ORI	R26, R26, lo_addr(_field1+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,827 :: 		strcat(str,txtC);
ADDIU	R2, SP, 20
MOVZ	R26, R2, R0
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,828 :: 		strcat(str,field2);
LUI	R26, hi_addr(_field2+0)
ORI	R26, R26, lo_addr(_field2+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,829 :: 		strcat(str,txtR);
ADDIU	R2, SP, 35
MOVZ	R26, R2, R0
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,830 :: 		strcat(str,field3);
LUI	R26, hi_addr(_field3+0)
ORI	R26, R26, lo_addr(_field3+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,831 :: 		strcat(str,txtG);
ADDIU	R2, SP, 50
MOVZ	R26, R2, R0
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,832 :: 		strcat(str,field4);
LUI	R26, hi_addr(_field4+0)
ORI	R26, R26, lo_addr(_field4+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,833 :: 		strcat(str,txtB);
ADDIU	R2, SP, 65
MOVZ	R26, R2, R0
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,836 :: 		UART2_Write_Text("AT+CPIN?");
ADDIU	R23, SP, 80
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr72_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr72_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 80
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,837 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,838 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,839 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,840 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData124:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData124
NOP	
NOP	
NOP	
;Sim800.c,841 :: 		UART2_Write_Text("AT+CREG?");
ADDIU	R23, SP, 89
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr73_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr73_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 89
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,842 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,843 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,844 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,845 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData126:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData126
NOP	
NOP	
NOP	
;Sim800.c,846 :: 		UART2_Write_Text("AT+CGATT?");
ADDIU	R23, SP, 98
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr74_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr74_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,847 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,848 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,849 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,850 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData128:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData128
NOP	
NOP	
NOP	
;Sim800.c,851 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 108
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr75_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr75_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 108
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,852 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,853 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,854 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,855 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData130:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData130
NOP	
NOP	
NOP	
;Sim800.c,856 :: 		UART2_Write_Text("AT+CIPSTATUS");
ADDIU	R23, SP, 119
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr76_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr76_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 119
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,857 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,858 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,859 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,860 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData132:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData132
NOP	
NOP	
NOP	
;Sim800.c,861 :: 		UART2_Write_Text("AT+CIPMUX=0");
ADDIU	R23, SP, 132
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr77_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr77_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 132
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,862 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,863 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,864 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,865 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData134:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData134
NOP	
NOP	
NOP	
;Sim800.c,866 :: 		UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
ADDIU	R23, SP, 144
ADDIU	R22, R23, 35
LUI	R24, hi_addr(?ICS?lstr78_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr78_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 144
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,867 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,868 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,869 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,870 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData136:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData136
NOP	
NOP	
NOP	
;Sim800.c,871 :: 		UART2_Write_Text("AT+CIICR");
ADDIU	R23, SP, 179
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr79_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr79_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 179
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,872 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,873 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,874 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,875 :: 		UART2_Write_Text("AT+CIFSR");
ADDIU	R23, SP, 188
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr80_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr80_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 188
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,876 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,877 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,878 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData138:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData138
NOP	
;Sim800.c,879 :: 		UART2_Write_Text("AT+CIPSPRT=1");
ADDIU	R23, SP, 197
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr81_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr81_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 197
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,880 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,881 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,882 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,883 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData140:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData140
NOP	
NOP	
NOP	
;Sim800.c,884 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
ADDIU	R23, SP, 210
ADDIU	R22, R23, 42
LUI	R24, hi_addr(?ICS?lstr82_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr82_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 210
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,885 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,886 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,887 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,888 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData142:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData142
NOP	
;Sim800.c,889 :: 		UART2_Write_Text("AT+CIPSEND");
ADDIU	R23, SP, 252
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr83_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr83_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 252
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,890 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,891 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,892 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData144:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData144
NOP	
;Sim800.c,893 :: 		UART2_Write_Text(str);
LW	R25, 16(SP)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,894 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,895 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,896 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,897 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,898 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,899 :: 		TestForOK(1);
ORI	R25, R0, 1
JAL	_TestForOK+0
NOP	
;Sim800.c,900 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData146:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData146
NOP	
NOP	
NOP	
;Sim800.c,901 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 263
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr84_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr84_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 263
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,902 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,903 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,904 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,905 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData148:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData148
NOP	
NOP	
NOP	
;Sim800.c,907 :: 		Free(str,150*sizeof(char*));
ORI	R26, R0, 600
LW	R25, 16(SP)
JAL	_Free+0
NOP	
;Sim800.c,908 :: 		}
L_end_SendData:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 276
JR	RA
NOP	
; end of _SendData
_TestForOK:
;Sim800.c,914 :: 		void TestForOK(char c){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,916 :: 		WaitForResponse(1);
SW	R26, 4(SP)
SB	R25, 8(SP)
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,917 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_TestForOK150:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TestForOK150
NOP	
;Sim800.c,918 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,922 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SB	R25, 8(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,921 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_85_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_85_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,920 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,922 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LBU	R25, 8(SP)
;Sim800.c,924 :: 		lastMillis = TMR0.millis;
; lastMillis start address is: 16 (R4)
LW	R4, Offset(_TMR0+0)(GP)
;Sim800.c,925 :: 		if(c == 0)
ANDI	R2, R25, 255
BEQ	R2, R0, L__TestForOK255
NOP	
J	L_TestForOK152
NOP	
L__TestForOK255:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
;Sim800.c,926 :: 		while(!strstr(SimTestTxt, "OK")){
L_TestForOK153:
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
BEQ	R2, R0, L__TestForOK256
NOP	
J	L_TestForOK154
NOP	
L__TestForOK256:
; lastMillis end address is: 20 (R5)
;Sim800.c,927 :: 		newMillis = TMR0.millis - lastMillis;
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,928 :: 		if(newMillis > 5000)
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK257
NOP	
J	L_TestForOK155
NOP	
L__TestForOK257:
; lastMillis end address is: 20 (R5)
;Sim800.c,929 :: 		break;
J	L_TestForOK154
NOP	
L_TestForOK155:
;Sim800.c,930 :: 		}
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK153
NOP	
L_TestForOK154:
J	L_TestForOK156
NOP	
L_TestForOK152:
;Sim800.c,931 :: 		else if(c == 1)
; lastMillis start address is: 16 (R4)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__TestForOK258
NOP	
J	L_TestForOK157
NOP	
L__TestForOK258:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
;Sim800.c,932 :: 		while(!strstr(SimTestTxt, "CONNECT")){
L_TestForOK158:
; lastMillis start address is: 20 (R5)
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
ADDIU	R23, SP, 12
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr87_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr87_Sim800+0)
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
BEQ	R2, R0, L__TestForOK259
NOP	
J	L_TestForOK159
NOP	
L__TestForOK259:
; lastMillis end address is: 20 (R5)
;Sim800.c,933 :: 		newMillis = TMR0.millis - lastMillis;
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,934 :: 		if(newMillis > 5000)
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK260
NOP	
J	L_TestForOK160
NOP	
L__TestForOK260:
; lastMillis end address is: 20 (R5)
;Sim800.c,935 :: 		break;
J	L_TestForOK159
NOP	
L_TestForOK160:
;Sim800.c,936 :: 		}
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK158
NOP	
L_TestForOK159:
L_TestForOK157:
L_TestForOK156:
;Sim800.c,937 :: 		}
L_end_TestForOK:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _TestForOK
