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
_WriteToFlashTemp:
;Sim800.c,67 :: 		void WriteToFlashTemp(){
ADDIU	SP, SP, -84
SW	RA, 0(SP)
;Sim800.c,72 :: 		if(SL.l1 <= 0)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LH	R2, Offset(_SL+0)(GP)
SLTI	R2, R2, 1
BNE	R2, R0, L__WriteToFlashTemp156
NOP	
J	L_WriteToFlashTemp0
NOP	
L__WriteToFlashTemp156:
;Sim800.c,73 :: 		GetStrLengths();
JAL	_GetStrLengths+0
NOP	
L_WriteToFlashTemp0:
;Sim800.c,75 :: 		memset(holding_buff,0,SL.l5+5);
LH	R2, Offset(_SL+8)(GP)
ADDIU	R3, R2, 5
ADDIU	R2, SP, 20
SEH	R27, R3
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Sim800.c,76 :: 		memcpy(holding_buff,SF.SimCelNum,SL.l1);
ADDIU	R2, SP, 20
LH	R27, Offset(_SL+0)(GP)
LUI	R26, hi_addr(_SF+0)
ORI	R26, R26, lo_addr(_SF+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,77 :: 		memcpy(holding_buff+SL.l1+1,SF.WriteAPIKey,SL.l2);
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
;Sim800.c,78 :: 		memcpy(holding_buff+SL.l3+1,SF.ReadAPIKey,SL.l4);
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
;Sim800.c,79 :: 		memcpy(temp,holding_buff,SL.l5+3);
LH	R2, Offset(_SL+8)(GP)
ADDIU	R3, R2, 3
ADDIU	R2, SP, 20
SEH	R27, R3
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_temp+0)
ORI	R25, R25, lo_addr(_temp+0)
JAL	_memcpy+0
NOP	
;Sim800.c,81 :: 		pos = FLASH_Settings_PAddr;
; pos start address is: 12 (R3)
LW	R3, Offset(_FLASH_Settings_PAddr+0)(GP)
;Sim800.c,82 :: 		j = NVMErasePage(pos);
SW	R3, 16(SP)
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R3, 16(SP)
SH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
;Sim800.c,83 :: 		if(j==0){
SEH	R2, R2
BEQ	R2, R0, L__WriteToFlashTemp157
NOP	
J	L_WriteToFlashTemp1
NOP	
L__WriteToFlashTemp157:
;Sim800.c,84 :: 		pos += 16 ;
ADDIU	R2, R3, 16
; pos end address is: 12 (R3)
; pos start address is: 16 (R4)
MOVZ	R4, R2, R0
;Sim800.c,85 :: 		for(i=0;i<SL.l4;i++){
SH	R0, Offset(WriteToFlashTemp_i_L0+0)(GP)
; pos end address is: 16 (R4)
L_WriteToFlashTemp2:
; pos start address is: 16 (R4)
LH	R3, Offset(_SL+6)(GP)
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__WriteToFlashTemp158
NOP	
J	L_WriteToFlashTemp3
NOP	
L__WriteToFlashTemp158:
;Sim800.c,86 :: 		j = NVMWriteWord(pos,temp[i]);
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
;Sim800.c,87 :: 		pos += 4;
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
;Sim800.c,88 :: 		Delay_ms(5);
LUI	R24, 2
ORI	R24, R24, 2260
L_WriteToFlashTemp5:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WriteToFlashTemp5
NOP	
NOP	
NOP	
;Sim800.c,85 :: 		for(i=0;i<SL.l4;i++){
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
;Sim800.c,89 :: 		}
; pos end address is: 16 (R4)
J	L_WriteToFlashTemp2
NOP	
L_WriteToFlashTemp3:
;Sim800.c,90 :: 		}
L_WriteToFlashTemp1:
;Sim800.c,92 :: 		sprintf(c,"%d",j);
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
;Sim800.c,97 :: 		,c);
LUI	R2, hi_addr(_c+0)
ORI	R2, R2, lo_addr(_c+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,96 :: 		" * flash err: %s\r\n"
LUI	R2, hi_addr(?lstr_6_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_6_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,94 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,97 :: 		,c);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,99 :: 		}
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
;Sim800.c,101 :: 		char* GetValuesFromFlash(){
ADDIU	SP, SP, -528
SW	RA, 0(SP)
;Sim800.c,106 :: 		if(SL.l1 <= 0)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LH	R2, Offset(_SL+0)(GP)
SLTI	R2, R2, 1
BNE	R2, R0, L__GetValuesFromFlash160
NOP	
J	L_GetValuesFromFlash7
NOP	
L__GetValuesFromFlash160:
;Sim800.c,107 :: 		GetStrLengths();
JAL	_GetStrLengths+0
NOP	
L_GetValuesFromFlash7:
;Sim800.c,110 :: 		ptr += 16;
LW	R2, Offset(_FLASH_Settings_VAddr+0)(GP)
ADDIU	R2, R2, 16
; ptr start address is: 20 (R5)
MOVZ	R5, R2, R0
;Sim800.c,112 :: 		for(i=0;i<SL.l5;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_GetValuesFromFlash8:
; i start address is: 24 (R6)
; ptr start address is: 20 (R5)
; ptr end address is: 20 (R5)
LH	R2, Offset(_SL+8)(GP)
SLTU	R2, R6, R2
BNE	R2, R0, L__GetValuesFromFlash161
NOP	
J	L_GetValuesFromFlash9
NOP	
L__GetValuesFromFlash161:
; ptr end address is: 20 (R5)
;Sim800.c,113 :: 		buff[i] = ptr[i];
; ptr start address is: 20 (R5)
ADDIU	R4, SP, 16
ADDU	R3, R4, R6
ADDU	R2, R5, R6
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Sim800.c,115 :: 		UART1_Write(buff[i]);
ADDU	R2, R4, R6
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,116 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
;Sim800.c,112 :: 		for(i=0;i<SL.l5;i++){
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Sim800.c,118 :: 		}
; ptr end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_GetValuesFromFlash8
NOP	
L_GetValuesFromFlash9:
;Sim800.c,119 :: 		strncpy(SF.SimCelNum,buff,SL.l1);
ADDIU	R2, SP, 16
LH	R27, Offset(_SL+0)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strncpy+0
NOP	
;Sim800.c,120 :: 		strncpy(SF.WriteAPIKey,buff+SL.l1+1,SL.l2);
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
;Sim800.c,121 :: 		strncpy(SF.ReadAPIKey,buff+SL.l3+1,SL.l4);
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
;Sim800.c,128 :: 		,SF.SimCelNum,SF.WriteAPIKey,SF.ReadAPIKey);
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
;Sim800.c,127 :: 		" * SF.ReadAPIKey:  %s\r\n"
LUI	R2, hi_addr(?lstr_7_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_7_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,124 :: 		PrintOut(PrintHandler, " * Flash Read        \r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,128 :: 		,SF.SimCelNum,SF.WriteAPIKey,SF.ReadAPIKey);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
;Sim800.c,130 :: 		return SF.SimCelNum;
LUI	R2, hi_addr(_SF+0)
ORI	R2, R2, lo_addr(_SF+0)
;Sim800.c,131 :: 		}
;Sim800.c,130 :: 		return SF.SimCelNum;
;Sim800.c,131 :: 		}
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
;Sim800.c,133 :: 		void GetStrLengths(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,134 :: 		SL.l1 = strlen(SF.SimCelNum)+1;   //len of cell num
SW	R25, 4(SP)
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SL+0)(GP)
;Sim800.c,135 :: 		SL.l2 = strlen(SF.WriteAPIKey)+1; //len of API Write key
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
SH	R3, Offset(_SL+2)(GP)
;Sim800.c,136 :: 		SL.l3 = SL.l1 + SL.l2;                  //len Cell + API Wr k
LH	R2, Offset(_SL+0)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SL+4)(GP)
;Sim800.c,137 :: 		SL.l4 = strlen(SF.ReadAPIKey)+1;  //len of API Read Key
LUI	R25, hi_addr(_SF+62)
ORI	R25, R25, lo_addr(_SF+62)
JAL	_strlen+0
NOP	
ADDIU	R4, R2, 1
SH	R4, Offset(_SL+6)(GP)
;Sim800.c,138 :: 		SL.l5 = SL.l1 + SL.l2 + SL.l4;             //total length
LH	R3, Offset(_SL+2)(GP)
LH	R2, Offset(_SL+0)(GP)
ADDU	R2, R2, R3
ADDU	R3, R2, R4
SH	R3, Offset(_SL+8)(GP)
;Sim800.c,139 :: 		SL.mod = SL.l5 % 4;
ORI	R2, R0, 4
DIV	R3, R2
MFHI	R3
SH	R3, Offset(_SL+10)(GP)
;Sim800.c,140 :: 		SL.l5 += SL.mod;
LH	R2, Offset(_SL+8)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SL+8)(GP)
;Sim800.c,142 :: 		sprintf(a,"%d",SL.l1);
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
;Sim800.c,143 :: 		sprintf(b,"%d",SL.l2);
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
;Sim800.c,144 :: 		sprintf(c,"%d",SL.l3);
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
;Sim800.c,145 :: 		sprintf(d,"%d",SL.l4);
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
;Sim800.c,146 :: 		sprintf(e,"%d",SL.l5);
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
;Sim800.c,153 :: 		,a,b,c,d,e);
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
;Sim800.c,152 :: 		" * l5: %s\r\n"
LUI	R2, hi_addr(?lstr_13_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_13_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,147 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,153 :: 		,a,b,c,d,e);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 28
;Sim800.c,155 :: 		}
L_end_GetStrLengths:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _GetStrLengths
_RcvSimTxt:
;Sim800.c,159 :: 		void RcvSimTxt(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,161 :: 		while(UART2_Data_Ready()) {     // If data is received
L_RcvSimTxt11:
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__RcvSimTxt165
NOP	
J	L_RcvSimTxt12
NOP	
L__RcvSimTxt165:
;Sim800.c,162 :: 		txt = U2RXREG;
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Sim800.c,163 :: 		U1TXREG = txt;
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,164 :: 		if(txt >= 0x20){
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt166
NOP	
J	L_RcvSimTxt13
NOP	
L__RcvSimTxt166:
;Sim800.c,165 :: 		RB.buff[RB.head] = txt;
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
SB	R4, 0(R2)
; txt end address is: 16 (R4)
;Sim800.c,166 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,167 :: 		}else if(U2RXREG == 0x0A){
J	L_RcvSimTxt14
NOP	
L_RcvSimTxt13:
LW	R3, Offset(U2RXREG+0)(GP)
ORI	R2, R0, 10
BEQ	R3, R2, L__RcvSimTxt167
NOP	
J	L_RcvSimTxt15
NOP	
L__RcvSimTxt167:
;Sim800.c,168 :: 		RB.buff[RB.head] = ',';
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
ORI	R2, R0, 44
SB	R2, 0(R3)
;Sim800.c,169 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,170 :: 		}
L_RcvSimTxt15:
L_RcvSimTxt14:
;Sim800.c,171 :: 		if(RB.head > 999)
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RcvSimTxt168
NOP	
J	L_RcvSimTxt16
NOP	
L__RcvSimTxt168:
;Sim800.c,172 :: 		RB.head = 0;             //rest head when buffer is full
SH	R0, Offset(_RB+1002)(GP)
L_RcvSimTxt16:
;Sim800.c,174 :: 		}
J	L_RcvSimTxt11
NOP	
L_RcvSimTxt12:
;Sim800.c,175 :: 		RB.rcv_txt_fin = 1;
ORI	R2, R0, 1
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,176 :: 		}
L_end_RcvSimTxt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RcvSimTxt
_PwrUpGSM3:
;Sim800.c,181 :: 		void PwrUpGSM3(){
;Sim800.c,182 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,183 :: 		PWR = 0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,184 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM317:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM317
NOP	
;Sim800.c,185 :: 		PWR = 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,187 :: 		while(STAT){
L_PwrUpGSM319:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrUpGSM3171
NOP	
J	L_PwrUpGSM320
NOP	
L__PwrUpGSM3171:
;Sim800.c,188 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,189 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM321:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM321
NOP	
;Sim800.c,190 :: 		}
J	L_PwrUpGSM319
NOP	
L_PwrUpGSM320:
;Sim800.c,191 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM323:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM323
NOP	
NOP	
NOP	
;Sim800.c,192 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_RingToTempBuf:
;Sim800.c,197 :: 		void RingToTempBuf(){
;Sim800.c,199 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,200 :: 		RB.tail = RB.last_tail;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,201 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__RingToTempBuf173
NOP	
J	L_RingToTempBuf25
NOP	
L__RingToTempBuf173:
; i end address is: 20 (R5)
;Sim800.c,202 :: 		while(RB.tail < RB.head){
L_RingToTempBuf26:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__RingToTempBuf174
NOP	
J	L_RingToTempBuf27
NOP	
L__RingToTempBuf174:
;Sim800.c,203 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,208 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,209 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,210 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RingToTempBuf175
NOP	
J	L_RingToTempBuf28
NOP	
L__RingToTempBuf175:
; ?FLOC___RingToTempBuf?T133 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___RingToTempBuf?T133 end address is: 8 (R2)
J	L_RingToTempBuf29
NOP	
L_RingToTempBuf28:
; ?FLOC___RingToTempBuf?T133 start address is: 8 (R2)
LHU	R2, Offset(_RB+1004)(GP)
; ?FLOC___RingToTempBuf?T133 end address is: 8 (R2)
L_RingToTempBuf29:
; ?FLOC___RingToTempBuf?T133 start address is: 8 (R2)
SH	R2, Offset(_RB+1004)(GP)
; ?FLOC___RingToTempBuf?T133 end address is: 8 (R2)
;Sim800.c,211 :: 		};
J	L_RingToTempBuf26
NOP	
L_RingToTempBuf27:
;Sim800.c,212 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,213 :: 		}
L_RingToTempBuf25:
;Sim800.c,214 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,215 :: 		}
L_end_RingToTempBuf:
JR	RA
NOP	
; end of _RingToTempBuf
_WaitForResponse:
;Sim800.c,220 :: 		void WaitForResponse(short dly){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,221 :: 		RB.rcv_txt_fin   = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,222 :: 		RB.last_head     = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,223 :: 		do{
L_WaitForResponse30:
;Sim800.c,224 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,225 :: 		if(dly == 0)
SEB	R2, R25
BEQ	R2, R0, L__WaitForResponse177
NOP	
J	L_WaitForResponse33
NOP	
L__WaitForResponse177:
;Sim800.c,226 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_WaitForResponse34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse34
NOP	
J	L_WaitForResponse36
NOP	
L_WaitForResponse33:
;Sim800.c,227 :: 		else if(dly == 1)
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForResponse178
NOP	
J	L_WaitForResponse37
NOP	
L__WaitForResponse178:
;Sim800.c,228 :: 		Delay_ms(500);
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
;Sim800.c,229 :: 		else if(dly == 3){
SEB	R3, R25
ORI	R2, R0, 3
BEQ	R3, R2, L__WaitForResponse179
NOP	
J	L_WaitForResponse41
NOP	
L__WaitForResponse179:
;Sim800.c,230 :: 		UART2_Write_Text("ATE0");
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
;Sim800.c,231 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,232 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LB	R25, 4(SP)
;Sim800.c,233 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse42:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse42
NOP	
;Sim800.c,234 :: 		}
J	L_WaitForResponse44
NOP	
L_WaitForResponse41:
;Sim800.c,236 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse45:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse45
NOP	
L_WaitForResponse44:
L_WaitForResponse40:
L_WaitForResponse36:
;Sim800.c,237 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForResponse181
NOP	
J	L_WaitForResponse30
NOP	
L__WaitForResponse181:
;Sim800.c,238 :: 		}
L_end_WaitForResponse:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WaitForResponse
_SetupIOT:
;Sim800.c,244 :: 		char SetupIOT(){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Sim800.c,255 :: 		" * ATE0\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(?lstr_15_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_15_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,254 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,255 :: 		" * ATE0\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,258 :: 		WaitForResponse(3);
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
;Sim800.c,259 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT47:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT47
NOP	
;Sim800.c,260 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,266 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,265 :: 		" * Check if Sim is Registered\r\n"
LUI	R2, hi_addr(?lstr_16_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_16_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,263 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,266 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,268 :: 		wait:
___SetupIOT_wait:
;Sim800.c,270 :: 		UART2_Write_Text("AT+CREG?");
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
;Sim800.c,271 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,272 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,273 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,274 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT49:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT49
NOP	
NOP	
NOP	
;Sim800.c,275 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,280 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,279 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_18_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_18_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,278 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,280 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,284 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT183
NOP	
J	L_SetupIOT51
NOP	
L__SetupIOT183:
;Sim800.c,285 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,286 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,289 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,297 :: 		,txtA,string[0],string[1],string[2],string[3],string[4]);
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
;Sim800.c,296 :: 		" *string[4]  %s\r\n"
LUI	R2, hi_addr(?lstr_20_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_20_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,290 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,297 :: 		,txtA,string[0],string[1],string[2],string[3],string[4]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,299 :: 		str_rcv = findnumber(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
;Sim800.c,300 :: 		res = atoi(str_rcv);  //get the sms rec number
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,301 :: 		if(res == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT184
NOP	
J	L_SetupIOT52
NOP	
L__SetupIOT184:
;Sim800.c,303 :: 		sprintf(txtA,"%d",res);
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
;Sim800.c,306 :: 		,txtA);
ADDIU	R2, SP, 12
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,305 :: 		" *Registered with:= %s\r\n"
LUI	R2, hi_addr(?lstr_22_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_22_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,304 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,306 :: 		,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,309 :: 		}else{
J	L_SetupIOT53
NOP	
L_SetupIOT52:
;Sim800.c,312 :: 		" *Sim Not Registered\r\n");
LUI	R2, hi_addr(?lstr_23_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_23_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,311 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,312 :: 		" *Sim Not Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,314 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT54:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT54
NOP	
NOP	
NOP	
;Sim800.c,315 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,316 :: 		}
L_SetupIOT53:
;Sim800.c,317 :: 		}
L_SetupIOT51:
;Sim800.c,320 :: 		" *Sim Registered\r\n");
LUI	R2, hi_addr(?lstr_24_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_24_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,319 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,320 :: 		" *Sim Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,322 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,323 :: 		}
;Sim800.c,322 :: 		return 1;
;Sim800.c,323 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,330 :: 		char WaitForSetupSMS(unsigned int Indx){
ADDIU	SP, SP, -60
SW	RA, 0(SP)
;Sim800.c,336 :: 		UART2_Write_Text("AT+CMGF=1");
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
;Sim800.c,337 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,338 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,341 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,342 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,344 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS56:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS56
NOP	
;Sim800.c,346 :: 		WaitForResponse(0);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,347 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS58:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS58
NOP	
;Sim800.c,348 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,350 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 84 (R21)
SEH	R21, R2
;Sim800.c,353 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,354 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,363 :: 		,txtA,string[0],string[1],
ADDIU	R3, SP, 16
;Sim800.c,365 :: 		string[4],string[5]);
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,364 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,363 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,362 :: 		" *string[5]  %s\r\n"
LUI	R2, hi_addr(?lstr_28_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_28_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,355 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,365 :: 		string[4],string[5]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
;Sim800.c,368 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 14(SP)
;Sim800.c,369 :: 		sprintf(sms,"%d",res);
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
;Sim800.c,373 :: 		,sms);
ADDIU	R2, SP, 22
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,372 :: 		" *sms no:= %s\r\n"
LUI	R2, hi_addr(?lstr_30_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_30_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,371 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,373 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,377 :: 		UART2_Write_Text("AT+CMGR=");
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
;Sim800.c,378 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,379 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,380 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,382 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,383 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS60:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS60
NOP	
;Sim800.c,384 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,385 :: 		str_rcv = setstr(SimTestTxt);
SH	R25, 12(SP)
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,386 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,388 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,398 :: 		,txtA,string[0],string[1],
ADDIU	R3, SP, 16
;Sim800.c,401 :: 		string[6]);
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
;Sim800.c,400 :: 		string[4],string[5],
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,399 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,398 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,397 :: 		" *string[6]  %s\r\n"
LUI	R2, hi_addr(?lstr_33_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_33_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,389 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,401 :: 		string[6]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 40
LHU	R25, 12(SP)
;Sim800.c,404 :: 		if(Indx == 0){
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS186
NOP	
J	L_WaitForSetupSMS62
NOP	
L__WaitForSetupSMS186:
;Sim800.c,405 :: 		SF.SimFlashPtr = strlen(string[1])+1;
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+598)(GP)
;Sim800.c,406 :: 		SF.SimFlashCellByteCount = SF.SimFlashPtr;
SH	R2, Offset(_SF+602)(GP)
;Sim800.c,407 :: 		memcpy(SF.SimFlashBuff,string[1],SF.SimFlashPtr);
LHU	R27, Offset(_SF+598)(GP)
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+86)
ORI	R25, R25, lo_addr(_SF+86)
JAL	_memcpy+0
NOP	
;Sim800.c,408 :: 		strncpy(SF.SimCelNum,string[1],strlen(string[1])+1);
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
;Sim800.c,409 :: 		strncpy(SF.SimDate,string[3],strlen(string[3]));
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
;Sim800.c,410 :: 		strncpy(SF.SimTime,string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+29)
ORI	R25, R25, lo_addr(_SF+29)
JAL	_strncpy+0
NOP	
;Sim800.c,417 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
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
;Sim800.c,416 :: 		" * SF.SimTime: %s\r\n"
LUI	R2, hi_addr(?lstr_34_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_34_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,413 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,417 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,419 :: 		}else if(Indx == 1){
J	L_WaitForSetupSMS63
NOP	
L_WaitForSetupSMS62:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS187
NOP	
J	L_WaitForSetupSMS64
NOP	
L__WaitForSetupSMS187:
;Sim800.c,421 :: 		SF.SimFlashAPIWriteIndx = SF.SimFlashPtr;
LHU	R2, Offset(_SF+598)(GP)
SH	R2, Offset(_SF+608)(GP)
;Sim800.c,422 :: 		SF.SimFlashAPIWriteCount = strlen(string[5])+1;
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+604)(GP)
;Sim800.c,423 :: 		memcpy(SF.SimFlashBuff+SF.SimFlashPtr,string[5],strlen(string[5])+1);
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
;Sim800.c,424 :: 		strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);
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
;Sim800.c,425 :: 		SF.SimFlashPtr += strlen(string[5])+1;
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
LHU	R2, Offset(_SF+598)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SF+598)(GP)
;Sim800.c,428 :: 		SF.SimFlashAPIReadIndx = SF.SimFlashPtr;
SH	R2, Offset(_SF+610)(GP)
;Sim800.c,429 :: 		memcpy(SF.SimFlashBuff+SF.SimFlashPtr,string[6],strlen(string[6]));
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
;Sim800.c,430 :: 		strncpy(SF.ReadAPIKey,string[6],strlen(string[6])+1);
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
;Sim800.c,431 :: 		SF.SimFlashPtr += strlen(string[6])+1;
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
LHU	R2, Offset(_SF+598)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SF+598)(GP)
;Sim800.c,432 :: 		SF.SimFlashAPIReadCount = strlen(string[6])+1;
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+606)(GP)
;Sim800.c,437 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
LUI	R2, hi_addr(_SF+62)
ORI	R2, R2, lo_addr(_SF+62)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+38)
ORI	R2, R2, lo_addr(_SF+38)
SW	R2, 8(SP)
;Sim800.c,436 :: 		" * SF.ReadAPIKey:  %s\r\n"
LUI	R2, hi_addr(?lstr_35_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_35_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,434 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,437 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LHU	R25, 12(SP)
;Sim800.c,440 :: 		for(i=0;i<SF.SimFlashPtr;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_WaitForSetupSMS65:
; i start address is: 16 (R4)
SEH	R3, R4
LHU	R2, Offset(_SF+598)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS188
NOP	
J	L_WaitForSetupSMS66
NOP	
L__WaitForSetupSMS188:
;Sim800.c,441 :: 		UART1_Write(SF.SimFlashBuff[i]);
SEH	R3, R4
LUI	R2, hi_addr(_SF+86)
ORI	R2, R2, lo_addr(_SF+86)
ADDU	R2, R2, R3
SH	R25, 12(SP)
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,442 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,440 :: 		for(i=0;i<SF.SimFlashPtr;i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 8 (R2)
;Sim800.c,443 :: 		}
SEH	R4, R2
; i end address is: 8 (R2)
J	L_WaitForSetupSMS65
NOP	
L_WaitForSetupSMS66:
;Sim800.c,444 :: 		UART1_Write(0x0D);
SH	R25, 12(SP)
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,445 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,447 :: 		}
L_WaitForSetupSMS64:
L_WaitForSetupSMS63:
;Sim800.c,450 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS68:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS68
NOP	
NOP	
NOP	
;Sim800.c,451 :: 		do{
L_WaitForSetupSMS70:
;Sim800.c,452 :: 		UART2_Write_Text("AT+CMGD=");
ADDIU	R23, SP, 45
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr36_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr36_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 45
SH	R25, 12(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,453 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,454 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,455 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,458 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,459 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS73:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS73
NOP	
NOP	
NOP	
;Sim800.c,460 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,461 :: 		res--;
LH	R2, 14(SP)
ADDIU	R2, R2, -1
SH	R2, 14(SP)
;Sim800.c,463 :: 		sprintf(sms,"%d",res);
ADDIU	R3, SP, 22
SH	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_37_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_37_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LHU	R25, 12(SP)
;Sim800.c,464 :: 		}while(res > 0);
LH	R2, 14(SP)
SLTI	R2, R2, 1
BNE	R2, R0, L__WaitForSetupSMS189
NOP	
J	L_WaitForSetupSMS70
NOP	
L__WaitForSetupSMS189:
;Sim800.c,466 :: 		str_rcv = setstr(SimTestTxt);
SH	R25, 12(SP)
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
; str_rcv start address is: 84 (R21)
MOVZ	R21, R2, R0
;Sim800.c,467 :: 		res     = strcmp(str_rcv,"OK,");
ORI	R30, R0, 79
SB	R30, 54(SP)
ORI	R30, R0, 75
SB	R30, 55(SP)
ORI	R30, R0, 44
SB	R30, 56(SP)
MOVZ	R30, R0, R0
SB	R30, 57(SP)
ADDIU	R3, SP, 54
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_strcmp+0
NOP	
SH	R2, 14(SP)
;Sim800.c,468 :: 		sprintf(txtA,"%d",res);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_39_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_39_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,474 :: 		,SimTestTxt,str_rcv,txtA);
ADDIU	R2, SP, 16
ADDIU	SP, SP, -20
SW	R2, 16(SP)
SW	R21, 12(SP)
; str_rcv end address is: 84 (R21)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SW	R2, 8(SP)
;Sim800.c,473 :: 		" * OK-0: %s\r\n"
LUI	R2, hi_addr(?lstr_40_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_40_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,470 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,474 :: 		,SimTestTxt,str_rcv,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,476 :: 		if((res == 0)&&(Indx == 1)){
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS190
NOP	
J	L__WaitForSetupSMS148
NOP	
L__WaitForSetupSMS190:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS191
NOP	
J	L__WaitForSetupSMS147
NOP	
L__WaitForSetupSMS191:
L__WaitForSetupSMS146:
;Sim800.c,477 :: 		WriteToFlashTemp();
JAL	_WriteToFlashTemp+0
NOP	
;Sim800.c,478 :: 		return 3;
ORI	R2, R0, 3
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,476 :: 		if((res == 0)&&(Indx == 1)){
L__WaitForSetupSMS148:
L__WaitForSetupSMS147:
;Sim800.c,480 :: 		else if ((res == 0)&&(Indx == 0))
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS192
NOP	
J	L__WaitForSetupSMS150
NOP	
L__WaitForSetupSMS192:
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS193
NOP	
J	L__WaitForSetupSMS149
NOP	
L__WaitForSetupSMS193:
L__WaitForSetupSMS145:
;Sim800.c,481 :: 		return 2;
ORI	R2, R0, 2
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,480 :: 		else if ((res == 0)&&(Indx == 0))
L__WaitForSetupSMS150:
L__WaitForSetupSMS149:
;Sim800.c,483 :: 		return res;
LH	R2, 14(SP)
;Sim800.c,484 :: 		}
;Sim800.c,483 :: 		return res;
;Sim800.c,484 :: 		}
L_end_WaitForSetupSMS:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 60
JR	RA
NOP	
; end of _WaitForSetupSMS
_GetAPI_Key_SMS:
;Sim800.c,489 :: 		char GetAPI_Key_SMS(){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Sim800.c,494 :: 		UART2_Write_Text("AT+CMGS=");
SW	R25, 4(SP)
ADDIU	R23, SP, 8
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr41_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr41_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,495 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,496 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,497 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,500 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,501 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,502 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_GetAPI_Key_SMS83:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetAPI_Key_SMS83
NOP	
NOP	
NOP	
;Sim800.c,506 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,505 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_42_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_42_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,504 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,506 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,509 :: 		UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
ADDIU	R23, SP, 17
ADDIU	R22, R23, 63
LUI	R24, hi_addr(?ICS?lstr43_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr43_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,510 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,511 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,512 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,514 :: 		response = WaitForSetupSMS(1);
ORI	R25, R0, 1
JAL	_WaitForSetupSMS+0
NOP	
;Sim800.c,516 :: 		return response;
;Sim800.c,517 :: 		}
;Sim800.c,516 :: 		return response;
;Sim800.c,517 :: 		}
L_end_GetAPI_Key_SMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _GetAPI_Key_SMS
_SendSMS:
;Sim800.c,522 :: 		char SendSMS(char sms_type){
ADDIU	SP, SP, -148
SW	RA, 0(SP)
;Sim800.c,525 :: 		UART2_Write_Text("AT+CNMI=2,2,0,0,0");
SW	R25, 4(SP)
ADDIU	R23, SP, 9
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr44_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr44_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 9
SB	R25, 8(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,526 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,527 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,528 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS85:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS85
NOP	
;Sim800.c,529 :: 		UART2_Write_Text("AT+CMGF=1");
ADDIU	R23, SP, 27
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr45_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr45_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 27
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,530 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,531 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,532 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS87:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS87
NOP	
;Sim800.c,533 :: 		UART2_Write_Text("AT+CMGS=");
ADDIU	R23, SP, 37
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr46_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr46_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 37
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,534 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,535 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,536 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,537 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS89:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS89
NOP	
NOP	
NOP	
;Sim800.c,538 :: 		switch(sms_type){
J	L_SendSMS91
NOP	
;Sim800.c,539 :: 		case 0:
L_SendSMS93:
;Sim800.c,540 :: 		UART2_Write_Text("ERROR in setup Power down and start again!");
ADDIU	R23, SP, 46
ADDIU	R22, R23, 43
LUI	R24, hi_addr(?ICS?lstr47_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr47_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 46
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,541 :: 		break;
J	L_SendSMS92
NOP	
;Sim800.c,542 :: 		case 1:
L_SendSMS94:
;Sim800.c,543 :: 		UART2_Write_Text("Reply WebSite");
ADDIU	R23, SP, 89
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr48_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr48_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 89
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,544 :: 		break;
J	L_SendSMS92
NOP	
;Sim800.c,545 :: 		case 2:
L_SendSMS95:
;Sim800.c,546 :: 		UART2_Write_Text("Reply API Key");
ADDIU	R23, SP, 103
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr49_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr49_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 103
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,547 :: 		break;
J	L_SendSMS92
NOP	
;Sim800.c,548 :: 		case 3:
L_SendSMS96:
;Sim800.c,549 :: 		UART2_Write_Text("Setup Complete!");
ADDIU	R23, SP, 117
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr50_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr50_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 117
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,550 :: 		break;
J	L_SendSMS92
NOP	
;Sim800.c,551 :: 		default:
L_SendSMS97:
;Sim800.c,552 :: 		UART2_Write_Text("his is a test!");
ADDIU	R23, SP, 133
ADDIU	R22, R23, 15
LUI	R24, hi_addr(?ICS?lstr51_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr51_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 133
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,553 :: 		break;
J	L_SendSMS92
NOP	
;Sim800.c,554 :: 		}
L_SendSMS91:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS197
NOP	
J	L_SendSMS93
NOP	
L__SendSMS197:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS199
NOP	
J	L_SendSMS94
NOP	
L__SendSMS199:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS201
NOP	
J	L_SendSMS95
NOP	
L__SendSMS201:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__SendSMS203
NOP	
J	L_SendSMS96
NOP	
L__SendSMS203:
J	L_SendSMS97
NOP	
L_SendSMS92:
;Sim800.c,555 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,556 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendSMS98:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS98
NOP	
NOP	
NOP	
;Sim800.c,557 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,558 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SendSMS100:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS100
NOP	
NOP	
NOP	
;Sim800.c,560 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,561 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,563 :: 		}
L_end_SendSMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 148
JR	RA
NOP	
; end of _SendSMS
_Test_Update_ThingSpeak:
;Sim800.c,569 :: 		int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,577 :: 		if(s != sLast){
SW	R25, 4(SP)
ANDI	R3, R25, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak206
NOP	
J	L_Test_Update_ThingSpeak102
NOP	
L__Test_Update_ThingSpeak206:
;Sim800.c,578 :: 		sLast = s;
SB	R25, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
;Sim800.c,584 :: 		}
L_Test_Update_ThingSpeak102:
;Sim800.c,585 :: 		if(m != mLast){
ANDI	R3, R26, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak208
NOP	
J	L_Test_Update_ThingSpeak103
NOP	
L__Test_Update_ThingSpeak208:
;Sim800.c,586 :: 		mLast = m;
SB	R26, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
;Sim800.c,592 :: 		}
L_Test_Update_ThingSpeak103:
;Sim800.c,593 :: 		if(h != hLast){
ANDI	R3, R27, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak210
NOP	
J	L_Test_Update_ThingSpeak104
NOP	
L__Test_Update_ThingSpeak210:
;Sim800.c,594 :: 		hLast = h;
SB	R27, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
;Sim800.c,600 :: 		}
L_Test_Update_ThingSpeak104:
;Sim800.c,603 :: 		m > SimVars.time_to_log){
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_Update_ThingSpeak211
NOP	
J	L__Test_Update_ThingSpeak153
NOP	
L__Test_Update_ThingSpeak211:
ANDI	R3, R26, 65535
LHU	R2, Offset(_SimVars+514)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Test_Update_ThingSpeak212
NOP	
J	L__Test_Update_ThingSpeak152
NOP	
L__Test_Update_ThingSpeak212:
L__Test_Update_ThingSpeak151:
;Sim800.c,604 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,605 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,606 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Test_Update_ThingSpeak
NOP	
;Sim800.c,603 :: 		m > SimVars.time_to_log){
L__Test_Update_ThingSpeak153:
L__Test_Update_ThingSpeak152:
;Sim800.c,608 :: 		return -1;
ORI	R2, R0, 65535
;Sim800.c,609 :: 		}
;Sim800.c,608 :: 		return -1;
;Sim800.c,609 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,614 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -276
SW	RA, 0(SP)
;Sim800.c,624 :: 		sprintf(txtC,"%u",rgbc[0]);
SW	R25, 4(SP)
SW	R26, 8(SP)
LHU	R2, 0(R25)
ADDIU	R3, SP, 20
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_52_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_52_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,625 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R3, SP, 35
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_53_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_53_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,626 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDIU	R3, SP, 50
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_54_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_54_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,627 :: 		sprintf(txtB,"%u",rgbc[3]);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R3, SP, 65
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_55_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_55_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,630 :: 		str = (char*)Malloc(200*sizeof(char));
ORI	R25, R0, 200
JAL	_Malloc+0
NOP	
SW	R2, 16(SP)
;Sim800.c,632 :: 		*str  = 0;
SB	R0, 0(R2)
;Sim800.c,634 :: 		strcat(str,str_api);
LUI	R26, hi_addr(_str_api+0)
ORI	R26, R26, lo_addr(_str_api+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,635 :: 		strcat(str,SF.WriteAPIKey);
LUI	R26, hi_addr(_SF+38)
ORI	R26, R26, lo_addr(_SF+38)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,636 :: 		strcat(str,field1);
LUI	R26, hi_addr(_field1+0)
ORI	R26, R26, lo_addr(_field1+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,637 :: 		strcat(str,txtC);
ADDIU	R2, SP, 20
MOVZ	R26, R2, R0
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,638 :: 		strcat(str,field2);
LUI	R26, hi_addr(_field2+0)
ORI	R26, R26, lo_addr(_field2+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,639 :: 		strcat(str,txtR);
ADDIU	R2, SP, 35
MOVZ	R26, R2, R0
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,640 :: 		strcat(str,field3);
LUI	R26, hi_addr(_field3+0)
ORI	R26, R26, lo_addr(_field3+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,641 :: 		strcat(str,txtG);
ADDIU	R2, SP, 50
MOVZ	R26, R2, R0
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,642 :: 		strcat(str,field4);
LUI	R26, hi_addr(_field4+0)
ORI	R26, R26, lo_addr(_field4+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,643 :: 		strcat(str,txtB);
ADDIU	R2, SP, 65
MOVZ	R26, R2, R0
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,646 :: 		UART2_Write_Text("AT+CPIN?");
ADDIU	R23, SP, 80
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr56_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr56_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 80
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,647 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,648 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,649 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,650 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData108:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData108
NOP	
NOP	
NOP	
;Sim800.c,651 :: 		UART2_Write_Text("AT+CREG?");
ADDIU	R23, SP, 89
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr57_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr57_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 89
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,652 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,653 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,654 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,655 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData110:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData110
NOP	
NOP	
NOP	
;Sim800.c,656 :: 		UART2_Write_Text("AT+CGATT?");
ADDIU	R23, SP, 98
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr58_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr58_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 98
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,657 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,658 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,659 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,660 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData112:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData112
NOP	
NOP	
NOP	
;Sim800.c,661 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 108
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr59_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr59_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 108
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,662 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,663 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,664 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,665 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData114:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData114
NOP	
NOP	
NOP	
;Sim800.c,666 :: 		UART2_Write_Text("AT+CIPSTATUS");
ADDIU	R23, SP, 119
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr60_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr60_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 119
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,667 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,668 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,669 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,670 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData116:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData116
NOP	
NOP	
NOP	
;Sim800.c,671 :: 		UART2_Write_Text("AT+CIPMUX=0");
ADDIU	R23, SP, 132
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr61_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr61_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 132
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,672 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,673 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,674 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,675 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData118:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData118
NOP	
NOP	
NOP	
;Sim800.c,676 :: 		UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
ADDIU	R23, SP, 144
ADDIU	R22, R23, 35
LUI	R24, hi_addr(?ICS?lstr62_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr62_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 144
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,677 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,678 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,679 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,680 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData120:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData120
NOP	
NOP	
NOP	
;Sim800.c,681 :: 		UART2_Write_Text("AT+CIICR");
ADDIU	R23, SP, 179
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr63_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr63_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 179
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,682 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,683 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,684 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData122:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData122
NOP	
;Sim800.c,685 :: 		UART2_Write_Text("AT+CIFSR");
ADDIU	R23, SP, 188
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr64_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr64_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 188
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,686 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,687 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,688 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData124:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData124
NOP	
;Sim800.c,689 :: 		UART2_Write_Text("AT+CIPSPRT=1");
ADDIU	R23, SP, 197
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr65_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr65_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 197
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,690 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,691 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,692 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,693 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData126:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData126
NOP	
NOP	
NOP	
;Sim800.c,694 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
ADDIU	R23, SP, 210
ADDIU	R22, R23, 42
LUI	R24, hi_addr(?ICS?lstr66_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr66_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 210
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,695 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,696 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,697 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,698 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData128:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData128
NOP	
;Sim800.c,699 :: 		UART2_Write_Text("AT+CIPSEND");
ADDIU	R23, SP, 252
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr67_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr67_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 252
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,700 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,701 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,702 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData130:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData130
NOP	
;Sim800.c,703 :: 		UART2_Write_Text(str);
LW	R25, 16(SP)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,704 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,705 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,706 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,707 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,708 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,709 :: 		TestForOK(1);
ORI	R25, R0, 1
JAL	_TestForOK+0
NOP	
;Sim800.c,710 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData132:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData132
NOP	
NOP	
NOP	
;Sim800.c,711 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 263
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr68_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr68_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 263
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,712 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,713 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,714 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,715 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData134:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData134
NOP	
NOP	
NOP	
;Sim800.c,717 :: 		Free(str,150*sizeof(char*));
ORI	R26, R0, 600
LW	R25, 16(SP)
JAL	_Free+0
NOP	
;Sim800.c,718 :: 		}
L_end_SendData:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 276
JR	RA
NOP	
; end of _SendData
_TestForOK:
;Sim800.c,720 :: 		void TestForOK(char c){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,722 :: 		WaitForResponse(1);
SW	R26, 4(SP)
SB	R25, 8(SP)
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,723 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_TestForOK136:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TestForOK136
NOP	
;Sim800.c,724 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,728 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SB	R25, 8(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,727 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_69_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_69_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,726 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,728 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LBU	R25, 8(SP)
;Sim800.c,730 :: 		if(c == 0)
ANDI	R2, R25, 255
BEQ	R2, R0, L__TestForOK215
NOP	
J	L_TestForOK138
NOP	
L__TestForOK215:
;Sim800.c,731 :: 		while(!strstr(SimTestTxt, "OK"));
L_TestForOK139:
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
BEQ	R2, R0, L__TestForOK216
NOP	
J	L_TestForOK140
NOP	
L__TestForOK216:
J	L_TestForOK139
NOP	
L_TestForOK140:
J	L_TestForOK141
NOP	
L_TestForOK138:
;Sim800.c,732 :: 		else if(c == 1)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__TestForOK217
NOP	
J	L_TestForOK142
NOP	
L__TestForOK217:
;Sim800.c,733 :: 		while(!strstr(SimTestTxt, "CONNECT"));
L_TestForOK143:
ADDIU	R23, SP, 12
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr71_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr71_Sim800+0)
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
BEQ	R2, R0, L__TestForOK218
NOP	
J	L_TestForOK144
NOP	
L__TestForOK218:
J	L_TestForOK143
NOP	
L_TestForOK144:
L_TestForOK142:
L_TestForOK141:
;Sim800.c,734 :: 		}
L_end_TestForOK:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _TestForOK
