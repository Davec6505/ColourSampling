_InitGSM3:
;Sim800.c,44 :: 		void InitGSM3(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,45 :: 		SimVars.initial_str = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SB	R0, Offset(_SimVars+512)(GP)
;Sim800.c,46 :: 		SimVars.init_inc    = 0;
SB	R0, Offset(_SimVars+518)(GP)
;Sim800.c,47 :: 		*SimTestTxt = "Hello World this is a test";
ORI	R2, R0, lo_addr(?lstr_1_Sim800+0)
ANDI	R2, R2, 255
SB	R2, Offset(_SimTestTxt+0)(GP)
;Sim800.c,48 :: 		RB.head = 0;
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,49 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
;Sim800.c,50 :: 		RB.rcv_txt_fin = -1;
ORI	R2, R0, 255
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,51 :: 		SF.SimFlashPtr = 0;
SH	R0, Offset(_SF+598)(GP)
;Sim800.c,52 :: 		strcpy(SF.SimCelNum,"\"***************\"");
LUI	R26, hi_addr(?lstr2_Sim800+0)
ORI	R26, R26, lo_addr(?lstr2_Sim800+0)
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strcpy+0
NOP	
;Sim800.c,53 :: 		strcpy(SF.WriteAPIKey,"\"****************\"");
LUI	R26, hi_addr(?lstr3_Sim800+0)
ORI	R26, R26, lo_addr(?lstr3_Sim800+0)
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strcpy+0
NOP	
;Sim800.c,54 :: 		strcpy(SF.ReadAPIKey,"\"****************\"");
LUI	R26, hi_addr(?lstr4_Sim800+0)
ORI	R26, R26, lo_addr(?lstr4_Sim800+0)
LUI	R25, hi_addr(_SF+62)
ORI	R25, R25, lo_addr(_SF+62)
JAL	_strcpy+0
NOP	
;Sim800.c,55 :: 		}
L_end_InitGSM3:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _InitGSM3
_WriteToFlashTemp:
;Sim800.c,60 :: 		void WriteToFlashTemp(){
ADDIU	SP, SP, -84
SW	RA, 0(SP)
;Sim800.c,65 :: 		if(SL.l1 <= 0)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LH	R2, Offset(_SL+0)(GP)
SLTI	R2, R2, 1
BNE	R2, R0, L__WriteToFlashTemp143
NOP	
J	L_WriteToFlashTemp0
NOP	
L__WriteToFlashTemp143:
;Sim800.c,66 :: 		GetStrLengths();
JAL	_GetStrLengths+0
NOP	
L_WriteToFlashTemp0:
;Sim800.c,68 :: 		memset(holding_buff,0,SL.l5+5);
LH	R2, Offset(_SL+8)(GP)
ADDIU	R3, R2, 5
ADDIU	R2, SP, 20
SEH	R27, R3
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;Sim800.c,69 :: 		memcpy(holding_buff,SF.SimCelNum,SL.l1);
ADDIU	R2, SP, 20
LH	R27, Offset(_SL+0)(GP)
LUI	R26, hi_addr(_SF+0)
ORI	R26, R26, lo_addr(_SF+0)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,70 :: 		memcpy(holding_buff+SL.l1+1,SF.WriteAPIKey,SL.l2);
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
;Sim800.c,71 :: 		memcpy(holding_buff+SL.l3+1,SF.ReadAPIKey,SL.l4);
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
;Sim800.c,72 :: 		memcpy(temp,holding_buff,SL.l5+3);
LH	R2, Offset(_SL+8)(GP)
ADDIU	R3, R2, 3
ADDIU	R2, SP, 20
SEH	R27, R3
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_temp+0)
ORI	R25, R25, lo_addr(_temp+0)
JAL	_memcpy+0
NOP	
;Sim800.c,74 :: 		pos = FLASH_Settings_PAddr;
; pos start address is: 12 (R3)
LW	R3, Offset(_FLASH_Settings_PAddr+0)(GP)
;Sim800.c,75 :: 		j = NVMErasePage(pos);
SW	R3, 16(SP)
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R3, 16(SP)
SH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
;Sim800.c,76 :: 		if(j==0){
SEH	R2, R2
BEQ	R2, R0, L__WriteToFlashTemp144
NOP	
J	L_WriteToFlashTemp1
NOP	
L__WriteToFlashTemp144:
;Sim800.c,77 :: 		pos += 16 ;
ADDIU	R2, R3, 16
; pos end address is: 12 (R3)
; pos start address is: 16 (R4)
MOVZ	R4, R2, R0
;Sim800.c,78 :: 		for(i=0;i<SL.l4;i++){
SH	R0, Offset(WriteToFlashTemp_i_L0+0)(GP)
; pos end address is: 16 (R4)
L_WriteToFlashTemp2:
; pos start address is: 16 (R4)
LH	R3, Offset(_SL+6)(GP)
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__WriteToFlashTemp145
NOP	
J	L_WriteToFlashTemp3
NOP	
L__WriteToFlashTemp145:
;Sim800.c,79 :: 		j = NVMWriteWord(pos,temp[i]);
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
;Sim800.c,80 :: 		pos += 4;
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
;Sim800.c,81 :: 		Delay_ms(5);
LUI	R24, 2
ORI	R24, R24, 2260
L_WriteToFlashTemp5:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WriteToFlashTemp5
NOP	
NOP	
NOP	
;Sim800.c,78 :: 		for(i=0;i<SL.l4;i++){
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
;Sim800.c,82 :: 		}
; pos end address is: 16 (R4)
J	L_WriteToFlashTemp2
NOP	
L_WriteToFlashTemp3:
;Sim800.c,83 :: 		}
L_WriteToFlashTemp1:
;Sim800.c,85 :: 		sprintf(c,"%d",j);
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
;Sim800.c,90 :: 		,c);
LUI	R2, hi_addr(_c+0)
ORI	R2, R2, lo_addr(_c+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,89 :: 		" * flash err: %s\r\n"
LUI	R2, hi_addr(?lstr_6_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_6_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,87 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,90 :: 		,c);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,92 :: 		}
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
;Sim800.c,94 :: 		char* GetValuesFromFlash(){
ADDIU	SP, SP, -532
SW	RA, 0(SP)
;Sim800.c,99 :: 		if(SL.l1 <= 0)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LH	R2, Offset(_SL+0)(GP)
SLTI	R2, R2, 1
BNE	R2, R0, L__GetValuesFromFlash147
NOP	
J	L_GetValuesFromFlash7
NOP	
L__GetValuesFromFlash147:
;Sim800.c,100 :: 		GetStrLengths();
JAL	_GetStrLengths+0
NOP	
L_GetValuesFromFlash7:
;Sim800.c,103 :: 		ptr += 16;
LW	R2, Offset(_FLASH_Settings_VAddr+0)(GP)
ADDIU	R2, R2, 16
; ptr start address is: 20 (R5)
MOVZ	R5, R2, R0
;Sim800.c,105 :: 		for(i=0;i<SL.l5;i++){
; i start address is: 24 (R6)
MOVZ	R6, R0, R0
; i end address is: 24 (R6)
L_GetValuesFromFlash8:
; i start address is: 24 (R6)
; ptr start address is: 20 (R5)
; ptr end address is: 20 (R5)
LH	R2, Offset(_SL+8)(GP)
SLTU	R2, R6, R2
BNE	R2, R0, L__GetValuesFromFlash148
NOP	
J	L_GetValuesFromFlash9
NOP	
L__GetValuesFromFlash148:
; ptr end address is: 20 (R5)
;Sim800.c,106 :: 		buff[i] = ptr[i];
; ptr start address is: 20 (R5)
ADDIU	R4, SP, 16
ADDU	R3, R4, R6
ADDU	R2, R5, R6
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Sim800.c,108 :: 		UART1_Write(buff[i]);
ADDU	R2, R4, R6
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,109 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
;Sim800.c,105 :: 		for(i=0;i<SL.l5;i++){
ADDIU	R2, R6, 1
MOVZ	R6, R2, R0
;Sim800.c,111 :: 		}
; ptr end address is: 20 (R5)
; i end address is: 24 (R6)
J	L_GetValuesFromFlash8
NOP	
L_GetValuesFromFlash9:
;Sim800.c,112 :: 		strncpy(SF.SimCelNum,buff,SL.l1);
ADDIU	R2, SP, 16
LH	R27, Offset(_SL+0)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strncpy+0
NOP	
;Sim800.c,113 :: 		strncpy(SF.WriteAPIKey,buff+SL.l1+1,SL.l2);
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
;Sim800.c,114 :: 		strncpy(SF.ReadAPIKey,buff+SL.l3+1,SL.l4);
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
;Sim800.c,121 :: 		,SF.SimCelNum,SF.WriteAPIKey,SF.ReadAPIKey);
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
;Sim800.c,120 :: 		" * SF.ReadAPIKey:  %s\r\n"
LUI	R2, hi_addr(?lstr_7_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_7_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,117 :: 		PrintOut(PrintHandler, " * Flash Read        \r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,121 :: 		,SF.SimCelNum,SF.WriteAPIKey,SF.ReadAPIKey);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
;Sim800.c,123 :: 		strcpy(str,SF.SimCelNum);
LUI	R26, hi_addr(_SF+0)
ORI	R26, R26, lo_addr(_SF+0)
LW	R25, 528(SP)
JAL	_strcpy+0
NOP	
;Sim800.c,124 :: 		return str;
LW	R2, 528(SP)
;Sim800.c,125 :: 		}
;Sim800.c,124 :: 		return str;
;Sim800.c,125 :: 		}
L_end_GetValuesFromFlash:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 532
JR	RA
NOP	
; end of _GetValuesFromFlash
_GetStrLengths:
;Sim800.c,127 :: 		void GetStrLengths(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,128 :: 		SL.l1 = strlen(SF.SimCelNum)+1;   //len of cell num
SW	R25, 4(SP)
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SL+0)(GP)
;Sim800.c,129 :: 		SL.l2 = strlen(SF.WriteAPIKey)+1; //len of API Write key
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
SH	R3, Offset(_SL+2)(GP)
;Sim800.c,130 :: 		SL.l3 = SL.l1 + SL.l2;                  //len Cell + API Wr k
LH	R2, Offset(_SL+0)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SL+4)(GP)
;Sim800.c,131 :: 		SL.l4 = strlen(SF.ReadAPIKey)+1;  //len of API Read Key
LUI	R25, hi_addr(_SF+62)
ORI	R25, R25, lo_addr(_SF+62)
JAL	_strlen+0
NOP	
ADDIU	R4, R2, 1
SH	R4, Offset(_SL+6)(GP)
;Sim800.c,132 :: 		SL.l5 = SL.l1 + SL.l2 + SL.l4;             //total length
LH	R3, Offset(_SL+2)(GP)
LH	R2, Offset(_SL+0)(GP)
ADDU	R2, R2, R3
ADDU	R3, R2, R4
SH	R3, Offset(_SL+8)(GP)
;Sim800.c,133 :: 		SL.mod = SL.l5 % 4;
ORI	R2, R0, 4
DIV	R3, R2
MFHI	R3
SH	R3, Offset(_SL+10)(GP)
;Sim800.c,134 :: 		SL.l5 += SL.mod;
LH	R2, Offset(_SL+8)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SL+8)(GP)
;Sim800.c,136 :: 		sprintf(a,"%d",SL.l1);
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
;Sim800.c,137 :: 		sprintf(b,"%d",SL.l2);
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
;Sim800.c,138 :: 		sprintf(c,"%d",SL.l3);
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
;Sim800.c,139 :: 		sprintf(d,"%d",SL.l4);
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
;Sim800.c,140 :: 		sprintf(e,"%d",SL.l5);
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
;Sim800.c,147 :: 		,a,b,c,d,e);
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
;Sim800.c,146 :: 		" * l5: %s\r\n"
LUI	R2, hi_addr(?lstr_13_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_13_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,141 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,147 :: 		,a,b,c,d,e);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 28
;Sim800.c,149 :: 		}
L_end_GetStrLengths:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _GetStrLengths
_RcvSimTxt:
;Sim800.c,153 :: 		void RcvSimTxt(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,155 :: 		while(UART2_Data_Ready()) {     // If data is received
L_RcvSimTxt11:
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__RcvSimTxt152
NOP	
J	L_RcvSimTxt12
NOP	
L__RcvSimTxt152:
;Sim800.c,156 :: 		txt = U2RXREG;
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Sim800.c,157 :: 		U1TXREG = txt;
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,158 :: 		if(txt >= 0x20){
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt153
NOP	
J	L_RcvSimTxt13
NOP	
L__RcvSimTxt153:
;Sim800.c,159 :: 		RB.buff[RB.head] = txt;
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
SB	R4, 0(R2)
; txt end address is: 16 (R4)
;Sim800.c,160 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,161 :: 		}else if(U2RXREG == 0x0A){
J	L_RcvSimTxt14
NOP	
L_RcvSimTxt13:
LW	R3, Offset(U2RXREG+0)(GP)
ORI	R2, R0, 10
BEQ	R3, R2, L__RcvSimTxt154
NOP	
J	L_RcvSimTxt15
NOP	
L__RcvSimTxt154:
;Sim800.c,162 :: 		RB.buff[RB.head] = ',';
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
ORI	R2, R0, 44
SB	R2, 0(R3)
;Sim800.c,163 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,164 :: 		}
L_RcvSimTxt15:
L_RcvSimTxt14:
;Sim800.c,165 :: 		if(RB.head > 999)
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RcvSimTxt155
NOP	
J	L_RcvSimTxt16
NOP	
L__RcvSimTxt155:
;Sim800.c,166 :: 		RB.head = 0;             //rest head when buffer is full
SH	R0, Offset(_RB+1002)(GP)
L_RcvSimTxt16:
;Sim800.c,168 :: 		}
J	L_RcvSimTxt11
NOP	
L_RcvSimTxt12:
;Sim800.c,169 :: 		RB.rcv_txt_fin = 1;
ORI	R2, R0, 1
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,170 :: 		}
L_end_RcvSimTxt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RcvSimTxt
_PwrUpGSM3:
;Sim800.c,175 :: 		void PwrUpGSM3(){
;Sim800.c,176 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,177 :: 		PWR = 0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,178 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM317:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM317
NOP	
;Sim800.c,179 :: 		PWR = 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,181 :: 		while(STAT){
L_PwrUpGSM319:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrUpGSM3158
NOP	
J	L_PwrUpGSM320
NOP	
L__PwrUpGSM3158:
;Sim800.c,182 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,183 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM321:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM321
NOP	
;Sim800.c,184 :: 		}
J	L_PwrUpGSM319
NOP	
L_PwrUpGSM320:
;Sim800.c,185 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM323:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM323
NOP	
NOP	
NOP	
;Sim800.c,186 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_RingToTempBuf:
;Sim800.c,191 :: 		void RingToTempBuf(){
;Sim800.c,193 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,194 :: 		RB.tail = RB.last_tail;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,195 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__RingToTempBuf160
NOP	
J	L_RingToTempBuf25
NOP	
L__RingToTempBuf160:
; i end address is: 20 (R5)
;Sim800.c,196 :: 		while(RB.tail < RB.head){
L_RingToTempBuf26:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__RingToTempBuf161
NOP	
J	L_RingToTempBuf27
NOP	
L__RingToTempBuf161:
;Sim800.c,197 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,202 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,203 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,204 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RingToTempBuf162
NOP	
J	L_RingToTempBuf28
NOP	
L__RingToTempBuf162:
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
;Sim800.c,205 :: 		};
J	L_RingToTempBuf26
NOP	
L_RingToTempBuf27:
;Sim800.c,206 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,207 :: 		}
L_RingToTempBuf25:
;Sim800.c,208 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,209 :: 		}
L_end_RingToTempBuf:
JR	RA
NOP	
; end of _RingToTempBuf
_WaitForResponse:
;Sim800.c,214 :: 		void WaitForResponse(short dly){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,215 :: 		RB.rcv_txt_fin   = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,216 :: 		RB.last_head     = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,217 :: 		do{
L_WaitForResponse30:
;Sim800.c,218 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,219 :: 		if(dly == 0)
SEB	R2, R25
BEQ	R2, R0, L__WaitForResponse164
NOP	
J	L_WaitForResponse33
NOP	
L__WaitForResponse164:
;Sim800.c,220 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_WaitForResponse34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse34
NOP	
J	L_WaitForResponse36
NOP	
L_WaitForResponse33:
;Sim800.c,221 :: 		else if(dly == 1)
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForResponse165
NOP	
J	L_WaitForResponse37
NOP	
L__WaitForResponse165:
;Sim800.c,222 :: 		Delay_ms(500);
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
;Sim800.c,223 :: 		else if(dly == 3){
SEB	R3, R25
ORI	R2, R0, 3
BEQ	R3, R2, L__WaitForResponse166
NOP	
J	L_WaitForResponse41
NOP	
L__WaitForResponse166:
;Sim800.c,224 :: 		UART2_Write_Text("ATE0");
SB	R25, 4(SP)
LUI	R25, hi_addr(?lstr14_Sim800+0)
ORI	R25, R25, lo_addr(?lstr14_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,225 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,226 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LB	R25, 4(SP)
;Sim800.c,227 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse42:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse42
NOP	
;Sim800.c,228 :: 		}
J	L_WaitForResponse44
NOP	
L_WaitForResponse41:
;Sim800.c,230 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse45:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse45
NOP	
L_WaitForResponse44:
L_WaitForResponse40:
L_WaitForResponse36:
;Sim800.c,231 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForResponse168
NOP	
J	L_WaitForResponse30
NOP	
L__WaitForResponse168:
;Sim800.c,232 :: 		}
L_end_WaitForResponse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WaitForResponse
_SetupIOT:
;Sim800.c,238 :: 		char SetupIOT(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,249 :: 		" * ATE0\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(?lstr_15_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_15_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,248 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,249 :: 		" * ATE0\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,252 :: 		WaitForResponse(3);
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
;Sim800.c,253 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT47:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT47
NOP	
;Sim800.c,254 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,260 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,259 :: 		" * Check if Sim is Registered\r\n"
LUI	R2, hi_addr(?lstr_16_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_16_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,257 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,260 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,262 :: 		wait:
___SetupIOT_wait:
;Sim800.c,264 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr17_Sim800+0)
ORI	R25, R25, lo_addr(?lstr17_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,265 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,266 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,267 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,268 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT49:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT49
NOP	
NOP	
NOP	
;Sim800.c,269 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,274 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,273 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_18_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_18_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,272 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,274 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,278 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT170
NOP	
J	L_SetupIOT51
NOP	
L__SetupIOT170:
;Sim800.c,279 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,280 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,283 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,291 :: 		,txtA,string[0],string[1],string[2],string[3],string[4]);
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
;Sim800.c,290 :: 		" *string[4]  %s\r\n"
LUI	R2, hi_addr(?lstr_20_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_20_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,284 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,291 :: 		,txtA,string[0],string[1],string[2],string[3],string[4]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,293 :: 		str_rcv = findnumber(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
;Sim800.c,294 :: 		res = atoi(str_rcv);  //get the sms rec number
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,295 :: 		if(res == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT171
NOP	
J	L_SetupIOT52
NOP	
L__SetupIOT171:
;Sim800.c,297 :: 		sprintf(txtA,"%d",res);
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
;Sim800.c,300 :: 		,txtA);
ADDIU	R2, SP, 12
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,299 :: 		" *Registered with:= %s\r\n"
LUI	R2, hi_addr(?lstr_22_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_22_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,298 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,300 :: 		,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,303 :: 		}else{
J	L_SetupIOT53
NOP	
L_SetupIOT52:
;Sim800.c,306 :: 		" *Sim Not Registered\r\n");
LUI	R2, hi_addr(?lstr_23_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_23_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,305 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,306 :: 		" *Sim Not Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,308 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT54:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT54
NOP	
NOP	
NOP	
;Sim800.c,309 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,310 :: 		}
L_SetupIOT53:
;Sim800.c,311 :: 		}
L_SetupIOT51:
;Sim800.c,314 :: 		" *Sim Registered\r\n");
LUI	R2, hi_addr(?lstr_24_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_24_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,313 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,314 :: 		" *Sim Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,316 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,317 :: 		}
;Sim800.c,316 :: 		return 1;
;Sim800.c,317 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,324 :: 		char WaitForSetupSMS(unsigned int Indx){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Sim800.c,330 :: 		UART2_Write_Text("AT+CMGF=1");
SW	R26, 4(SP)
SW	R27, 8(SP)
SH	R25, 12(SP)
LUI	R25, hi_addr(?lstr25_Sim800+0)
ORI	R25, R25, lo_addr(?lstr25_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,331 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,332 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,335 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,336 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,338 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS56:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS56
NOP	
;Sim800.c,340 :: 		WaitForResponse(0);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,341 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS58:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS58
NOP	
;Sim800.c,342 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,344 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 84 (R21)
SEH	R21, R2
;Sim800.c,347 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,348 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,357 :: 		,txtA,string[0],string[1],
ADDIU	R3, SP, 16
;Sim800.c,359 :: 		string[4],string[5]);
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,358 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,357 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,356 :: 		" *string[5]  %s\r\n"
LUI	R2, hi_addr(?lstr_28_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_28_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,349 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,359 :: 		string[4],string[5]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
;Sim800.c,362 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 14(SP)
;Sim800.c,363 :: 		sprintf(sms,"%d",res);
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
;Sim800.c,367 :: 		,sms);
ADDIU	R2, SP, 22
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,366 :: 		" *sms no:= %s\r\n"
LUI	R2, hi_addr(?lstr_30_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_30_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,365 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,367 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,371 :: 		UART2_Write_Text("AT+CMGR=");
LUI	R25, hi_addr(?lstr31_Sim800+0)
ORI	R25, R25, lo_addr(?lstr31_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,372 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,373 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,374 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,376 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,377 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS60:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS60
NOP	
;Sim800.c,378 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,379 :: 		str_rcv = setstr(SimTestTxt);
SH	R25, 12(SP)
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,380 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,382 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,392 :: 		,txtA,string[0],string[1],
ADDIU	R3, SP, 16
;Sim800.c,395 :: 		string[6]);
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
;Sim800.c,394 :: 		string[4],string[5],
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,393 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,392 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,391 :: 		" *string[6]  %s\r\n"
LUI	R2, hi_addr(?lstr_33_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_33_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,383 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,395 :: 		string[6]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 40
LHU	R25, 12(SP)
;Sim800.c,398 :: 		if(Indx == 0){
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS173
NOP	
J	L_WaitForSetupSMS62
NOP	
L__WaitForSetupSMS173:
;Sim800.c,399 :: 		SF.SimFlashPtr = strlen(string[1])+1;
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+598)(GP)
;Sim800.c,400 :: 		SF.SimFlashCellByteCount = SF.SimFlashPtr;
SH	R2, Offset(_SF+602)(GP)
;Sim800.c,401 :: 		memcpy(SF.SimFlashBuff,string[1],SF.SimFlashPtr);
LHU	R27, Offset(_SF+598)(GP)
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+86)
ORI	R25, R25, lo_addr(_SF+86)
JAL	_memcpy+0
NOP	
;Sim800.c,402 :: 		strncpy(SF.SimCelNum,string[1],strlen(string[1])+1);
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
;Sim800.c,403 :: 		strncpy(SF.SimDate,string[3],strlen(string[3]));
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
;Sim800.c,404 :: 		strncpy(SF.SimTime,string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+29)
ORI	R25, R25, lo_addr(_SF+29)
JAL	_strncpy+0
NOP	
;Sim800.c,411 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
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
;Sim800.c,410 :: 		" * SF.SimTime: %s\r\n"
LUI	R2, hi_addr(?lstr_34_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_34_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,407 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,411 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,413 :: 		}else if(Indx == 1){
J	L_WaitForSetupSMS63
NOP	
L_WaitForSetupSMS62:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS174
NOP	
J	L_WaitForSetupSMS64
NOP	
L__WaitForSetupSMS174:
;Sim800.c,415 :: 		SF.SimFlashAPIWriteIndx = SF.SimFlashPtr;
LHU	R2, Offset(_SF+598)(GP)
SH	R2, Offset(_SF+608)(GP)
;Sim800.c,416 :: 		SF.SimFlashAPIWriteCount = strlen(string[5])+1;
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+604)(GP)
;Sim800.c,417 :: 		memcpy(SF.SimFlashBuff+SF.SimFlashPtr,string[5],strlen(string[5])+1);
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
;Sim800.c,418 :: 		strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);
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
;Sim800.c,419 :: 		SF.SimFlashPtr += strlen(string[5])+1;
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
LHU	R2, Offset(_SF+598)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SF+598)(GP)
;Sim800.c,422 :: 		SF.SimFlashAPIReadIndx = SF.SimFlashPtr;
SH	R2, Offset(_SF+610)(GP)
;Sim800.c,423 :: 		memcpy(SF.SimFlashBuff+SF.SimFlashPtr,string[6],strlen(string[6]));
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
;Sim800.c,424 :: 		strncpy(SF.ReadAPIKey,string[6],strlen(string[6])+1);
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
;Sim800.c,425 :: 		SF.SimFlashPtr += strlen(string[6])+1;
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
LHU	R2, Offset(_SF+598)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SF+598)(GP)
;Sim800.c,426 :: 		SF.SimFlashAPIReadCount = strlen(string[6])+1;
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+606)(GP)
;Sim800.c,431 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
LUI	R2, hi_addr(_SF+62)
ORI	R2, R2, lo_addr(_SF+62)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+38)
ORI	R2, R2, lo_addr(_SF+38)
SW	R2, 8(SP)
;Sim800.c,430 :: 		" * SF.ReadAPIKey:  %s\r\n"
LUI	R2, hi_addr(?lstr_35_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_35_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,428 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,431 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LHU	R25, 12(SP)
;Sim800.c,434 :: 		for(i=0;i<SF.SimFlashPtr;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_WaitForSetupSMS65:
; i start address is: 16 (R4)
SEH	R3, R4
LHU	R2, Offset(_SF+598)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS175
NOP	
J	L_WaitForSetupSMS66
NOP	
L__WaitForSetupSMS175:
;Sim800.c,435 :: 		UART1_Write(SF.SimFlashBuff[i]);
SEH	R3, R4
LUI	R2, hi_addr(_SF+86)
ORI	R2, R2, lo_addr(_SF+86)
ADDU	R2, R2, R3
SH	R25, 12(SP)
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,436 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,434 :: 		for(i=0;i<SF.SimFlashPtr;i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 8 (R2)
;Sim800.c,437 :: 		}
SEH	R4, R2
; i end address is: 8 (R2)
J	L_WaitForSetupSMS65
NOP	
L_WaitForSetupSMS66:
;Sim800.c,438 :: 		UART1_Write(0x0D);
SH	R25, 12(SP)
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,439 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,441 :: 		}
L_WaitForSetupSMS64:
L_WaitForSetupSMS63:
;Sim800.c,444 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS68:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS68
NOP	
NOP	
NOP	
;Sim800.c,445 :: 		do{
L_WaitForSetupSMS70:
;Sim800.c,446 :: 		UART2_Write_Text("AT+CMGD=");
SH	R25, 12(SP)
LUI	R25, hi_addr(?lstr36_Sim800+0)
ORI	R25, R25, lo_addr(?lstr36_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,447 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,448 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,449 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,452 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,453 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS73:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS73
NOP	
NOP	
NOP	
;Sim800.c,454 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,455 :: 		res--;
LH	R2, 14(SP)
ADDIU	R2, R2, -1
SH	R2, 14(SP)
;Sim800.c,457 :: 		sprintf(sms,"%d",res);
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
;Sim800.c,458 :: 		}while(res > 0);
LH	R2, 14(SP)
SLTI	R2, R2, 1
BNE	R2, R0, L__WaitForSetupSMS176
NOP	
J	L_WaitForSetupSMS70
NOP	
L__WaitForSetupSMS176:
;Sim800.c,460 :: 		str_rcv = setstr(SimTestTxt);
SH	R25, 12(SP)
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
; str_rcv start address is: 84 (R21)
MOVZ	R21, R2, R0
;Sim800.c,461 :: 		res     = strcmp(str_rcv,"OK,");
LUI	R26, hi_addr(?lstr38_Sim800+0)
ORI	R26, R26, lo_addr(?lstr38_Sim800+0)
MOVZ	R25, R2, R0
JAL	_strcmp+0
NOP	
SH	R2, 14(SP)
;Sim800.c,462 :: 		sprintf(txtA,"%d",res);
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
;Sim800.c,468 :: 		,SimTestTxt,str_rcv,txtA);
ADDIU	R2, SP, 16
ADDIU	SP, SP, -20
SW	R2, 16(SP)
SW	R21, 12(SP)
; str_rcv end address is: 84 (R21)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SW	R2, 8(SP)
;Sim800.c,467 :: 		" * OK-0: %s\r\n"
LUI	R2, hi_addr(?lstr_40_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_40_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,464 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,468 :: 		,SimTestTxt,str_rcv,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,470 :: 		if((res == 0)&&(Indx == 1)){
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS177
NOP	
J	L__WaitForSetupSMS135
NOP	
L__WaitForSetupSMS177:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS178
NOP	
J	L__WaitForSetupSMS134
NOP	
L__WaitForSetupSMS178:
L__WaitForSetupSMS133:
;Sim800.c,471 :: 		WriteToFlashTemp();
JAL	_WriteToFlashTemp+0
NOP	
;Sim800.c,472 :: 		return 3;
ORI	R2, R0, 3
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,470 :: 		if((res == 0)&&(Indx == 1)){
L__WaitForSetupSMS135:
L__WaitForSetupSMS134:
;Sim800.c,474 :: 		else if ((res == 0)&&(Indx == 0))
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS179
NOP	
J	L__WaitForSetupSMS137
NOP	
L__WaitForSetupSMS179:
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS180
NOP	
J	L__WaitForSetupSMS136
NOP	
L__WaitForSetupSMS180:
L__WaitForSetupSMS132:
;Sim800.c,475 :: 		return 2;
ORI	R2, R0, 2
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,474 :: 		else if ((res == 0)&&(Indx == 0))
L__WaitForSetupSMS137:
L__WaitForSetupSMS136:
;Sim800.c,477 :: 		return res;
LH	R2, 14(SP)
;Sim800.c,478 :: 		}
;Sim800.c,477 :: 		return res;
;Sim800.c,478 :: 		}
L_end_WaitForSetupSMS:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _WaitForSetupSMS
_GetAPI_Key_SMS:
;Sim800.c,483 :: 		char GetAPI_Key_SMS(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,488 :: 		UART2_Write_Text("AT+CMGS=");
SW	R25, 4(SP)
LUI	R25, hi_addr(?lstr41_Sim800+0)
ORI	R25, R25, lo_addr(?lstr41_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,489 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,490 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,491 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,494 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,495 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,496 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_GetAPI_Key_SMS83:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetAPI_Key_SMS83
NOP	
NOP	
NOP	
;Sim800.c,500 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,499 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_42_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_42_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,498 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,500 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,503 :: 		UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
LUI	R25, hi_addr(?lstr43_Sim800+0)
ORI	R25, R25, lo_addr(?lstr43_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,504 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,505 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,506 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,508 :: 		response = WaitForSetupSMS(1);
ORI	R25, R0, 1
JAL	_WaitForSetupSMS+0
NOP	
;Sim800.c,510 :: 		return response;
;Sim800.c,511 :: 		}
;Sim800.c,510 :: 		return response;
;Sim800.c,511 :: 		}
L_end_GetAPI_Key_SMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _GetAPI_Key_SMS
_SendSMS:
;Sim800.c,516 :: 		char SendSMS(char sms_type){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,519 :: 		UART2_Write_Text("AT+CNMI=2,2,0,0,0");
SW	R25, 4(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(?lstr44_Sim800+0)
ORI	R25, R25, lo_addr(?lstr44_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,520 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,521 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,522 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS85:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS85
NOP	
;Sim800.c,523 :: 		UART2_Write_Text("AT+CMGF=1");
LUI	R25, hi_addr(?lstr45_Sim800+0)
ORI	R25, R25, lo_addr(?lstr45_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,524 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,525 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,526 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS87:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS87
NOP	
;Sim800.c,527 :: 		UART2_Write_Text("AT+CMGS=");
LUI	R25, hi_addr(?lstr46_Sim800+0)
ORI	R25, R25, lo_addr(?lstr46_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,528 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
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
LBU	R25, 8(SP)
;Sim800.c,531 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS89:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS89
NOP	
NOP	
NOP	
;Sim800.c,532 :: 		switch(sms_type){
J	L_SendSMS91
NOP	
;Sim800.c,533 :: 		case 0:
L_SendSMS93:
;Sim800.c,534 :: 		UART2_Write_Text("ERROR in setup Power down and start again!");
LUI	R25, hi_addr(?lstr47_Sim800+0)
ORI	R25, R25, lo_addr(?lstr47_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,535 :: 		break;
J	L_SendSMS92
NOP	
;Sim800.c,536 :: 		case 1:
L_SendSMS94:
;Sim800.c,537 :: 		UART2_Write_Text("Reply WebSite");
LUI	R25, hi_addr(?lstr48_Sim800+0)
ORI	R25, R25, lo_addr(?lstr48_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,538 :: 		break;
J	L_SendSMS92
NOP	
;Sim800.c,539 :: 		case 2:
L_SendSMS95:
;Sim800.c,540 :: 		UART2_Write_Text("Reply API Key");
LUI	R25, hi_addr(?lstr49_Sim800+0)
ORI	R25, R25, lo_addr(?lstr49_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,541 :: 		break;
J	L_SendSMS92
NOP	
;Sim800.c,542 :: 		case 3:
L_SendSMS96:
;Sim800.c,543 :: 		UART2_Write_Text("Setup Complete!");
LUI	R25, hi_addr(?lstr50_Sim800+0)
ORI	R25, R25, lo_addr(?lstr50_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,544 :: 		break;
J	L_SendSMS92
NOP	
;Sim800.c,545 :: 		default:
L_SendSMS97:
;Sim800.c,546 :: 		UART2_Write_Text("his is a test!");
LUI	R25, hi_addr(?lstr51_Sim800+0)
ORI	R25, R25, lo_addr(?lstr51_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,547 :: 		break;
J	L_SendSMS92
NOP	
;Sim800.c,548 :: 		}
L_SendSMS91:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS184
NOP	
J	L_SendSMS93
NOP	
L__SendSMS184:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS186
NOP	
J	L_SendSMS94
NOP	
L__SendSMS186:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS188
NOP	
J	L_SendSMS95
NOP	
L__SendSMS188:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__SendSMS190
NOP	
J	L_SendSMS96
NOP	
L__SendSMS190:
J	L_SendSMS97
NOP	
L_SendSMS92:
;Sim800.c,549 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,550 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendSMS98:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS98
NOP	
NOP	
NOP	
;Sim800.c,551 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,552 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SendSMS100:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS100
NOP	
NOP	
NOP	
;Sim800.c,553 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr52_Sim800+0)
ORI	R25, R25, lo_addr(?lstr52_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,554 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,555 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,556 :: 		}
L_end_SendSMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _SendSMS
_Test_Update_ThingSpeak:
;Sim800.c,562 :: 		int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,570 :: 		if(s != sLast){
SW	R25, 4(SP)
ANDI	R3, R25, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak193
NOP	
J	L_Test_Update_ThingSpeak102
NOP	
L__Test_Update_ThingSpeak193:
;Sim800.c,571 :: 		sLast = s;
SB	R25, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
;Sim800.c,577 :: 		}
L_Test_Update_ThingSpeak102:
;Sim800.c,578 :: 		if(m != mLast){
ANDI	R3, R26, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak195
NOP	
J	L_Test_Update_ThingSpeak103
NOP	
L__Test_Update_ThingSpeak195:
;Sim800.c,579 :: 		mLast = m;
SB	R26, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
;Sim800.c,585 :: 		}
L_Test_Update_ThingSpeak103:
;Sim800.c,586 :: 		if(h != hLast){
ANDI	R3, R27, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak197
NOP	
J	L_Test_Update_ThingSpeak104
NOP	
L__Test_Update_ThingSpeak197:
;Sim800.c,587 :: 		hLast = h;
SB	R27, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
;Sim800.c,593 :: 		}
L_Test_Update_ThingSpeak104:
;Sim800.c,596 :: 		m > SimVars.time_to_log){
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_Update_ThingSpeak198
NOP	
J	L__Test_Update_ThingSpeak140
NOP	
L__Test_Update_ThingSpeak198:
ANDI	R3, R26, 65535
LHU	R2, Offset(_SimVars+514)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Test_Update_ThingSpeak199
NOP	
J	L__Test_Update_ThingSpeak139
NOP	
L__Test_Update_ThingSpeak199:
L__Test_Update_ThingSpeak138:
;Sim800.c,597 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,598 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,599 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Test_Update_ThingSpeak
NOP	
;Sim800.c,596 :: 		m > SimVars.time_to_log){
L__Test_Update_ThingSpeak140:
L__Test_Update_ThingSpeak139:
;Sim800.c,602 :: 		return -1;
ORI	R2, R0, 65535
;Sim800.c,603 :: 		}
;Sim800.c,602 :: 		return -1;
;Sim800.c,603 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,608 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;Sim800.c,614 :: 		sprintf(txtC,"%u",rgbc[0]);
SW	R25, 4(SP)
LHU	R2, 0(R25)
ADDIU	R3, SP, 12
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_53_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_53_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,615 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R3, SP, 27
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_54_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_54_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,616 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDIU	R3, SP, 42
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_55_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_55_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,617 :: 		sprintf(txtB,"%u",rgbc[3]);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R3, SP, 57
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_56_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_56_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,619 :: 		UART2_Write_Text("AT+CPIN?");
LUI	R25, hi_addr(?lstr57_Sim800+0)
ORI	R25, R25, lo_addr(?lstr57_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,620 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,621 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,622 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData108:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData108
NOP	
;Sim800.c,623 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr58_Sim800+0)
ORI	R25, R25, lo_addr(?lstr58_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,624 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,625 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,626 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData110:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData110
NOP	
;Sim800.c,627 :: 		UART2_Write_Text("AT+CGATT?");
LUI	R25, hi_addr(?lstr59_Sim800+0)
ORI	R25, R25, lo_addr(?lstr59_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,628 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,629 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,630 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData112:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData112
NOP	
;Sim800.c,631 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr60_Sim800+0)
ORI	R25, R25, lo_addr(?lstr60_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,632 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,633 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,634 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData114:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData114
NOP	
NOP	
;Sim800.c,635 :: 		UART2_Write_Text("AT+CIPSTATUS");
LUI	R25, hi_addr(?lstr61_Sim800+0)
ORI	R25, R25, lo_addr(?lstr61_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,636 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,637 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,638 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData116:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData116
NOP	
NOP	
;Sim800.c,639 :: 		UART2_Write_Text("AT+CIPMUX=0");
LUI	R25, hi_addr(?lstr62_Sim800+0)
ORI	R25, R25, lo_addr(?lstr62_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,640 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,641 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,642 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData118:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData118
NOP	
;Sim800.c,643 :: 		UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
LUI	R25, hi_addr(?lstr63_Sim800+0)
ORI	R25, R25, lo_addr(?lstr63_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,644 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,645 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,646 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData120:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData120
NOP	
NOP	
;Sim800.c,647 :: 		UART2_Write_Text("AT+CIICR");
LUI	R25, hi_addr(?lstr64_Sim800+0)
ORI	R25, R25, lo_addr(?lstr64_Sim800+0)
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
;Sim800.c,650 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData122:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData122
NOP	
;Sim800.c,651 :: 		UART2_Write_Text("AT+CIFSR");
LUI	R25, hi_addr(?lstr65_Sim800+0)
ORI	R25, R25, lo_addr(?lstr65_Sim800+0)
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
;Sim800.c,654 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData124:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData124
NOP	
;Sim800.c,655 :: 		UART2_Write_Text("AT+CIPSPRT=1");
LUI	R25, hi_addr(?lstr66_Sim800+0)
ORI	R25, R25, lo_addr(?lstr66_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,656 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,657 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,658 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData126:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData126
NOP	
;Sim800.c,659 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
LUI	R25, hi_addr(?lstr67_Sim800+0)
ORI	R25, R25, lo_addr(?lstr67_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,660 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,661 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,662 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData128:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData128
NOP	
;Sim800.c,663 :: 		UART2_Write_Text("AT+CIPSEND");
LUI	R25, hi_addr(?lstr68_Sim800+0)
ORI	R25, R25, lo_addr(?lstr68_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,664 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,665 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,666 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData130:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData130
NOP	
;Sim800.c,667 :: 		UART2_Write_Text("GET https://api.thingspeak.com/update?api_key=W2NO15EASX7P7CDK&field1=");
LUI	R25, hi_addr(?lstr69_Sim800+0)
ORI	R25, R25, lo_addr(?lstr69_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,668 :: 		UART2_Write_Text(txtC);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,669 :: 		UART2_Write_Text("&field2=");
LUI	R25, hi_addr(?lstr70_Sim800+0)
ORI	R25, R25, lo_addr(?lstr70_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,670 :: 		UART2_Write_Text(txtR);
ADDIU	R2, SP, 27
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,671 :: 		UART2_Write_Text("&field3=");
LUI	R25, hi_addr(?lstr71_Sim800+0)
ORI	R25, R25, lo_addr(?lstr71_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,672 :: 		UART2_Write_Text(txtG);
ADDIU	R2, SP, 42
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,673 :: 		UART2_Write_Text("&field4=");
LUI	R25, hi_addr(?lstr72_Sim800+0)
ORI	R25, R25, lo_addr(?lstr72_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,674 :: 		UART2_Write_Text(txtB);
ADDIU	R2, SP, 57
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,675 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,676 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,677 :: 		}
L_end_SendData:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 72
JR	RA
NOP	
; end of _SendData
