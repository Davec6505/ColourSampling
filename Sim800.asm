_InitGSM3:
;Sim800.c,37 :: 		void InitGSM3(){
;Sim800.c,38 :: 		SimVars.initial_str = 0;
SB	R0, Offset(_SimVars+512)(GP)
;Sim800.c,39 :: 		SimVars.init_inc    = 0;
SB	R0, Offset(_SimVars+518)(GP)
;Sim800.c,40 :: 		*SimTestTxt = "Hello World this is a test";
ORI	R2, R0, lo_addr(?lstr_1_Sim800+0)
ANDI	R2, R2, 255
SB	R2, Offset(_SimTestTxt+0)(GP)
;Sim800.c,41 :: 		RB.head = 0;
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,42 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
;Sim800.c,43 :: 		RB.rcv_txt_fin = -1;
ORI	R2, R0, 255
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,44 :: 		SF.SimFlashPtr = 0;
SH	R0, Offset(_SF+582)(GP)
;Sim800.c,45 :: 		SF.SimFlashCellByteCount = 17;
ORI	R2, R0, 17
SH	R2, Offset(_SF+586)(GP)
;Sim800.c,46 :: 		SF.SimFlashAPIWriteIndx  = 18;
ORI	R2, R0, 18
SH	R2, Offset(_SF+592)(GP)
;Sim800.c,47 :: 		SF.SimFlashAPIWriteCount = 18;
ORI	R2, R0, 18
SH	R2, Offset(_SF+588)(GP)
;Sim800.c,48 :: 		SF.SimFlashAPIReadIndx   = 35;
ORI	R2, R0, 35
SH	R2, Offset(_SF+594)(GP)
;Sim800.c,49 :: 		SF.SimFlashAPIReadCount  = 18;
ORI	R2, R0, 18
SH	R2, Offset(_SF+590)(GP)
;Sim800.c,50 :: 		}
L_end_InitGSM3:
JR	RA
NOP	
; end of _InitGSM3
_GetValuesFromFlash:
;Sim800.c,55 :: 		char* GetValuesFromFlash(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,58 :: 		ptr = (unsigned char*)(FLASH_Settings_VAddr_Sim800);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
; ptr start address is: 20 (R5)
LWR	R5, Offset(_FLASH_Settings_VAddr_Sim800+0)(GP)
LWL	R5, Offset(_FLASH_Settings_VAddr_Sim800+3)(GP)
;Sim800.c,59 :: 		for(i=0;i<512;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; ptr end address is: 20 (R5)
; i end address is: 16 (R4)
L_GetValuesFromFlash0:
; i start address is: 16 (R4)
; ptr start address is: 20 (R5)
SLTIU	R2, R4, 512
BNE	R2, R0, L__GetValuesFromFlash123
NOP	
J	L_GetValuesFromFlash1
NOP	
L__GetValuesFromFlash123:
;Sim800.c,60 :: 		SF.SimFlashBuff[i] = *ptr;
LUI	R2, hi_addr(_SF+69)
ORI	R2, R2, lo_addr(_SF+69)
ADDU	R3, R2, R4
LBU	R2, 0(R5)
SB	R2, 0(R3)
;Sim800.c,61 :: 		ptr++;
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Sim800.c,59 :: 		for(i=0;i<512;i++){
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Sim800.c,62 :: 		}
; ptr end address is: 20 (R5)
; i end address is: 16 (R4)
J	L_GetValuesFromFlash0
NOP	
L_GetValuesFromFlash1:
;Sim800.c,63 :: 		strncpy(SF.SimCelNum,SF.SimFlashBuff,SF.SimFlashCellByteCount);
LHU	R27, Offset(_SF+586)(GP)
LUI	R26, hi_addr(_SF+69)
ORI	R26, R26, lo_addr(_SF+69)
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strncpy+0
NOP	
;Sim800.c,64 :: 		strncpy(SF.WriteAPIKey,SF.SimFlashBuff+SF.SimFlashAPIWriteIndx,SF.SimFlashAPIWriteCount);
LHU	R3, Offset(_SF+592)(GP)
LUI	R2, hi_addr(_SF+69)
ORI	R2, R2, lo_addr(_SF+69)
ADDU	R2, R2, R3
LHU	R27, Offset(_SF+588)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+35)
ORI	R25, R25, lo_addr(_SF+35)
JAL	_strncpy+0
NOP	
;Sim800.c,65 :: 		strncpy(SF.ReadAPIKey,SF.SimFlashBuff+SF.SimFlashAPIReadIndx,SF.SimFlashAPIReadCount);
LHU	R3, Offset(_SF+594)(GP)
LUI	R2, hi_addr(_SF+69)
ORI	R2, R2, lo_addr(_SF+69)
ADDU	R2, R2, R3
LHU	R27, Offset(_SF+590)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+52)
ORI	R25, R25, lo_addr(_SF+52)
JAL	_strncpy+0
NOP	
;Sim800.c,71 :: 		,SF.SimCelNum,SF.WriteAPIKey,SF.ReadAPIKey);
LUI	R2, hi_addr(_SF+52)
ORI	R2, R2, lo_addr(_SF+52)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
LUI	R2, hi_addr(_SF+35)
ORI	R2, R2, lo_addr(_SF+35)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+0)
ORI	R2, R2, lo_addr(_SF+0)
SW	R2, 8(SP)
;Sim800.c,70 :: 		" * SF.ReadAPIKey: %s\r\n"
LUI	R2, hi_addr(?lstr_2_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_2_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,67 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,71 :: 		,SF.SimCelNum,SF.WriteAPIKey,SF.ReadAPIKey);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
;Sim800.c,73 :: 		return SF.SimCelNum;
LUI	R2, hi_addr(_SF+0)
ORI	R2, R2, lo_addr(_SF+0)
;Sim800.c,74 :: 		}
;Sim800.c,73 :: 		return SF.SimCelNum;
;Sim800.c,74 :: 		}
L_end_GetValuesFromFlash:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _GetValuesFromFlash
_RcvSimTxt:
;Sim800.c,78 :: 		void RcvSimTxt(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,80 :: 		while(UART2_Data_Ready()) {     // If data is received
L_RcvSimTxt3:
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__RcvSimTxt126
NOP	
J	L_RcvSimTxt4
NOP	
L__RcvSimTxt126:
;Sim800.c,81 :: 		txt = U2RXREG;
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Sim800.c,82 :: 		U1TXREG = txt;
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,83 :: 		if(txt >= 0x20){
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt127
NOP	
J	L_RcvSimTxt5
NOP	
L__RcvSimTxt127:
;Sim800.c,84 :: 		RB.buff[RB.head] = txt;
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
SB	R4, 0(R2)
; txt end address is: 16 (R4)
;Sim800.c,85 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,86 :: 		}else if(U2RXREG == 0x0A){
J	L_RcvSimTxt6
NOP	
L_RcvSimTxt5:
LW	R3, Offset(U2RXREG+0)(GP)
ORI	R2, R0, 10
BEQ	R3, R2, L__RcvSimTxt128
NOP	
J	L_RcvSimTxt7
NOP	
L__RcvSimTxt128:
;Sim800.c,87 :: 		RB.buff[RB.head] = ',';
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
ORI	R2, R0, 44
SB	R2, 0(R3)
;Sim800.c,88 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,89 :: 		}
L_RcvSimTxt7:
L_RcvSimTxt6:
;Sim800.c,90 :: 		if(RB.head > 999)
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RcvSimTxt129
NOP	
J	L_RcvSimTxt8
NOP	
L__RcvSimTxt129:
;Sim800.c,91 :: 		RB.head = 0;             //rest head when buffer is full
SH	R0, Offset(_RB+1002)(GP)
L_RcvSimTxt8:
;Sim800.c,93 :: 		}
J	L_RcvSimTxt3
NOP	
L_RcvSimTxt4:
;Sim800.c,94 :: 		RB.rcv_txt_fin = 1;
ORI	R2, R0, 1
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,95 :: 		}
L_end_RcvSimTxt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RcvSimTxt
_PwrUpGSM3:
;Sim800.c,100 :: 		void PwrUpGSM3(){
;Sim800.c,101 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,102 :: 		PWR = 0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,103 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM39:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM39
NOP	
;Sim800.c,104 :: 		PWR = 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,106 :: 		while(STAT){
L_PwrUpGSM311:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrUpGSM3132
NOP	
J	L_PwrUpGSM312
NOP	
L__PwrUpGSM3132:
;Sim800.c,107 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,108 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM313:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM313
NOP	
;Sim800.c,109 :: 		}
J	L_PwrUpGSM311
NOP	
L_PwrUpGSM312:
;Sim800.c,110 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM315:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM315
NOP	
NOP	
NOP	
;Sim800.c,111 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_RingToTempBuf:
;Sim800.c,116 :: 		void RingToTempBuf(){
;Sim800.c,118 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,119 :: 		RB.tail = RB.last_tail;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,120 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__RingToTempBuf134
NOP	
J	L_RingToTempBuf17
NOP	
L__RingToTempBuf134:
; i end address is: 20 (R5)
;Sim800.c,121 :: 		while(RB.tail < RB.head){
L_RingToTempBuf18:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__RingToTempBuf135
NOP	
J	L_RingToTempBuf19
NOP	
L__RingToTempBuf135:
;Sim800.c,122 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,127 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,128 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,129 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RingToTempBuf136
NOP	
J	L_RingToTempBuf20
NOP	
L__RingToTempBuf136:
; ?FLOC___RingToTempBuf?T53 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___RingToTempBuf?T53 end address is: 8 (R2)
J	L_RingToTempBuf21
NOP	
L_RingToTempBuf20:
; ?FLOC___RingToTempBuf?T53 start address is: 8 (R2)
LHU	R2, Offset(_RB+1004)(GP)
; ?FLOC___RingToTempBuf?T53 end address is: 8 (R2)
L_RingToTempBuf21:
; ?FLOC___RingToTempBuf?T53 start address is: 8 (R2)
SH	R2, Offset(_RB+1004)(GP)
; ?FLOC___RingToTempBuf?T53 end address is: 8 (R2)
;Sim800.c,130 :: 		};
J	L_RingToTempBuf18
NOP	
L_RingToTempBuf19:
;Sim800.c,131 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,132 :: 		}
L_RingToTempBuf17:
;Sim800.c,133 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,134 :: 		}
L_end_RingToTempBuf:
JR	RA
NOP	
; end of _RingToTempBuf
_WaitForResponse:
;Sim800.c,139 :: 		void WaitForResponse(short dly){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,140 :: 		RB.rcv_txt_fin   = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,141 :: 		RB.last_head     = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,142 :: 		do{
L_WaitForResponse22:
;Sim800.c,143 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,144 :: 		if(dly == 0)
SEB	R2, R25
BEQ	R2, R0, L__WaitForResponse138
NOP	
J	L_WaitForResponse25
NOP	
L__WaitForResponse138:
;Sim800.c,145 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_WaitForResponse26:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse26
NOP	
J	L_WaitForResponse28
NOP	
L_WaitForResponse25:
;Sim800.c,146 :: 		else if(dly == 1)
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForResponse139
NOP	
J	L_WaitForResponse29
NOP	
L__WaitForResponse139:
;Sim800.c,147 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForResponse30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse30
NOP	
NOP	
NOP	
J	L_WaitForResponse32
NOP	
L_WaitForResponse29:
;Sim800.c,148 :: 		else if(dly == 3){
SEB	R3, R25
ORI	R2, R0, 3
BEQ	R3, R2, L__WaitForResponse140
NOP	
J	L_WaitForResponse33
NOP	
L__WaitForResponse140:
;Sim800.c,149 :: 		UART2_Write_Text("ATE0");
SB	R25, 4(SP)
LUI	R25, hi_addr(?lstr3_Sim800+0)
ORI	R25, R25, lo_addr(?lstr3_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,150 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,151 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LB	R25, 4(SP)
;Sim800.c,152 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse34
NOP	
;Sim800.c,153 :: 		}
J	L_WaitForResponse36
NOP	
L_WaitForResponse33:
;Sim800.c,155 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse37:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse37
NOP	
L_WaitForResponse36:
L_WaitForResponse32:
L_WaitForResponse28:
;Sim800.c,156 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForResponse142
NOP	
J	L_WaitForResponse22
NOP	
L__WaitForResponse142:
;Sim800.c,157 :: 		}
L_end_WaitForResponse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WaitForResponse
_SetupIOT:
;Sim800.c,163 :: 		char SetupIOT(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,174 :: 		" * ATE0\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(?lstr_4_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_4_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,173 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,174 :: 		" * ATE0\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,177 :: 		WaitForResponse(3);
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
;Sim800.c,178 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT39:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT39
NOP	
;Sim800.c,179 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,185 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,184 :: 		" * Check if Sim is Registered\r\n"
LUI	R2, hi_addr(?lstr_5_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_5_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,182 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,185 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,187 :: 		wait:
___SetupIOT_wait:
;Sim800.c,189 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr6_Sim800+0)
ORI	R25, R25, lo_addr(?lstr6_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,190 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,191 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,192 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,193 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT41:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT41
NOP	
NOP	
NOP	
;Sim800.c,194 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,199 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,198 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_7_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_7_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,197 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,199 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,203 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT144
NOP	
J	L_SetupIOT43
NOP	
L__SetupIOT144:
;Sim800.c,204 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,205 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,208 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_8_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_8_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,216 :: 		,txtA,string[0],string[1],string[2],string[3],string[4]);
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
;Sim800.c,215 :: 		" *string[4]  %s\r\n"
LUI	R2, hi_addr(?lstr_9_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_9_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,209 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,216 :: 		,txtA,string[0],string[1],string[2],string[3],string[4]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,218 :: 		str_rcv = findnumber(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
;Sim800.c,219 :: 		res = atoi(str_rcv);  //get the sms rec number
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,220 :: 		if(res == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT145
NOP	
J	L_SetupIOT44
NOP	
L__SetupIOT145:
;Sim800.c,222 :: 		sprintf(txtA,"%d",res);
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SH	R4, 8(SP)
; res end address is: 16 (R4)
LUI	R2, hi_addr(?lstr_10_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_10_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,225 :: 		,txtA);
ADDIU	R2, SP, 12
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,224 :: 		" *Registered with:= %s\r\n"
LUI	R2, hi_addr(?lstr_11_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_11_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,223 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,225 :: 		,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,228 :: 		}else{
J	L_SetupIOT45
NOP	
L_SetupIOT44:
;Sim800.c,231 :: 		" *Sim Not Registered\r\n");
LUI	R2, hi_addr(?lstr_12_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_12_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,230 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,231 :: 		" *Sim Not Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,233 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT46:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT46
NOP	
NOP	
NOP	
;Sim800.c,234 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,235 :: 		}
L_SetupIOT45:
;Sim800.c,236 :: 		}
L_SetupIOT43:
;Sim800.c,239 :: 		" *Sim Registered\r\n");
LUI	R2, hi_addr(?lstr_13_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_13_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,238 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,239 :: 		" *Sim Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,241 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,242 :: 		}
;Sim800.c,241 :: 		return 1;
;Sim800.c,242 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,249 :: 		char WaitForSetupSMS(unsigned int Indx){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Sim800.c,255 :: 		UART2_Write_Text("AT+CMGF=1");
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SH	R25, 16(SP)
LUI	R25, hi_addr(?lstr14_Sim800+0)
ORI	R25, R25, lo_addr(?lstr14_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,256 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,257 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,260 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 16(SP)
;Sim800.c,261 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,263 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS48:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS48
NOP	
;Sim800.c,265 :: 		WaitForResponse(0);
SH	R25, 16(SP)
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 16(SP)
;Sim800.c,266 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS50:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS50
NOP	
;Sim800.c,267 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,269 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 16(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 84 (R21)
SEH	R21, R2
;Sim800.c,272 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_15_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_15_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,273 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 20
; num_strs end address is: 84 (R21)
ADDIU	SP, SP, -12
SH	R21, 8(SP)
LUI	R2, hi_addr(?lstr_16_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_16_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,282 :: 		,txtA,string[0],string[1],
ADDIU	R3, SP, 20
;Sim800.c,284 :: 		string[4],string[5]);
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,283 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,282 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,281 :: 		" *string[5]  %s\r\n"
LUI	R2, hi_addr(?lstr_17_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_17_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,274 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,284 :: 		string[4],string[5]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
;Sim800.c,287 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 18(SP)
;Sim800.c,288 :: 		sprintf(sms,"%d",res);
ADDIU	R3, SP, 26
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_18_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_18_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,292 :: 		,sms);
ADDIU	R2, SP, 26
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,291 :: 		" *sms no:= %s\r\n"
LUI	R2, hi_addr(?lstr_19_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_19_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,290 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,292 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,296 :: 		UART2_Write_Text("AT+CMGR=");
LUI	R25, hi_addr(?lstr20_Sim800+0)
ORI	R25, R25, lo_addr(?lstr20_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,297 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 26
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,298 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,299 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,301 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 16(SP)
;Sim800.c,302 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS52:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS52
NOP	
;Sim800.c,303 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,304 :: 		str_rcv = setstr(SimTestTxt);
SH	R25, 16(SP)
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,305 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,307 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_21_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_21_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,317 :: 		,txtA,string[0],string[1],
ADDIU	R3, SP, 20
;Sim800.c,320 :: 		string[6]);
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
;Sim800.c,319 :: 		string[4],string[5],
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,318 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,317 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,316 :: 		" *string[6]  %s\r\n"
LUI	R2, hi_addr(?lstr_22_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_22_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,308 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,320 :: 		string[6]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 40
LHU	R25, 16(SP)
;Sim800.c,323 :: 		if(Indx == 0){
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS147
NOP	
J	L_WaitForSetupSMS54
NOP	
L__WaitForSetupSMS147:
;Sim800.c,324 :: 		SF.SimFlashPtr = strlen(string[1])+1;
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+582)(GP)
;Sim800.c,325 :: 		SF.SimFlashCellByteCount = SF.SimFlashPtr;
SH	R2, Offset(_SF+586)(GP)
;Sim800.c,326 :: 		memcpy(SF.SimFlashBuff,string[1],SF.SimFlashPtr);
LHU	R27, Offset(_SF+582)(GP)
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+69)
ORI	R25, R25, lo_addr(_SF+69)
JAL	_memcpy+0
NOP	
;Sim800.c,327 :: 		strncpy(SF.SimCelNum,string[1],strlen(string[1])+1);
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
;Sim800.c,328 :: 		strncpy(SF.SimDate,string[3],strlen(string[3]));
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
SEH	R27, R2
LUI	R26, hi_addr(_string+192)
ORI	R26, R26, lo_addr(_string+192)
LUI	R25, hi_addr(_SF+17)
ORI	R25, R25, lo_addr(_SF+17)
JAL	_strncpy+0
NOP	
;Sim800.c,329 :: 		strncpy(SF.SimTime,string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+26)
ORI	R25, R25, lo_addr(_SF+26)
JAL	_strncpy+0
NOP	
;Sim800.c,336 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
LUI	R2, hi_addr(_SF+26)
ORI	R2, R2, lo_addr(_SF+26)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
LUI	R2, hi_addr(_SF+17)
ORI	R2, R2, lo_addr(_SF+17)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+0)
ORI	R2, R2, lo_addr(_SF+0)
SW	R2, 8(SP)
;Sim800.c,335 :: 		" * SF.SimTime: %s\r\n"
LUI	R2, hi_addr(?lstr_23_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_23_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,332 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,336 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
;Sim800.c,338 :: 		}else if(Indx == 1){
J	L_WaitForSetupSMS55
NOP	
L_WaitForSetupSMS54:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS148
NOP	
J	L_WaitForSetupSMS56
NOP	
L__WaitForSetupSMS148:
;Sim800.c,340 :: 		SF.SimFlashAPIWriteIndx = SF.SimFlashPtr;
LHU	R2, Offset(_SF+582)(GP)
SH	R2, Offset(_SF+592)(GP)
;Sim800.c,341 :: 		SF.SimFlashAPIWriteCount = strlen(string[5])+1;
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+588)(GP)
;Sim800.c,342 :: 		memcpy(SF.SimFlashBuff+SF.SimFlashPtr,string[5],strlen(string[5])+1);
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R4, R2, 1
LHU	R3, Offset(_SF+582)(GP)
LUI	R2, hi_addr(_SF+69)
ORI	R2, R2, lo_addr(_SF+69)
ADDU	R2, R2, R3
SEH	R27, R4
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,343 :: 		strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
LUI	R25, hi_addr(_SF+35)
ORI	R25, R25, lo_addr(_SF+35)
JAL	_strncpy+0
NOP	
;Sim800.c,344 :: 		SF.SimFlashPtr += strlen(string[5])+1;
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
LHU	R2, Offset(_SF+582)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SF+582)(GP)
;Sim800.c,346 :: 		SF.SimFlashAPIReadIndx = SF.SimFlashPtr;
SH	R2, Offset(_SF+594)(GP)
;Sim800.c,347 :: 		memcpy(SF.SimFlashBuff+SF.SimFlashPtr,string[6],strlen(string[6]));
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
LHU	R4, Offset(_SF+582)(GP)
LUI	R3, hi_addr(_SF+69)
ORI	R3, R3, lo_addr(_SF+69)
ADDU	R3, R3, R4
SEH	R27, R2
LUI	R26, hi_addr(_string+384)
ORI	R26, R26, lo_addr(_string+384)
MOVZ	R25, R3, R0
JAL	_memcpy+0
NOP	
;Sim800.c,348 :: 		strncpy(SF.ReadAPIKey,string[6],strlen(string[6])+1);
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+384)
ORI	R26, R26, lo_addr(_string+384)
LUI	R25, hi_addr(_SF+52)
ORI	R25, R25, lo_addr(_SF+52)
JAL	_strncpy+0
NOP	
;Sim800.c,349 :: 		SF.SimFlashPtr += strlen(string[6])+1;
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
LHU	R2, Offset(_SF+582)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SF+582)(GP)
;Sim800.c,350 :: 		SF.SimFlashAPIReadCount = strlen(string[6])+1;
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+590)(GP)
;Sim800.c,355 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
LUI	R2, hi_addr(_SF+52)
ORI	R2, R2, lo_addr(_SF+52)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+35)
ORI	R2, R2, lo_addr(_SF+35)
SW	R2, 8(SP)
;Sim800.c,354 :: 		" * SF.ReadAPIKey:  %s\r\n"
LUI	R2, hi_addr(?lstr_24_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_24_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,352 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,355 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
;Sim800.c,358 :: 		for(i=0;i<SF.SimFlashPtr;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_WaitForSetupSMS57:
; i start address is: 16 (R4)
SEH	R3, R4
LHU	R2, Offset(_SF+582)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS149
NOP	
J	L_WaitForSetupSMS58
NOP	
L__WaitForSetupSMS149:
;Sim800.c,359 :: 		UART1_Write(SF.SimFlashBuff[i]);
SEH	R3, R4
LUI	R2, hi_addr(_SF+69)
ORI	R2, R2, lo_addr(_SF+69)
ADDU	R2, R2, R3
SH	R25, 16(SP)
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,360 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
LHU	R25, 16(SP)
;Sim800.c,358 :: 		for(i=0;i<SF.SimFlashPtr;i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 8 (R2)
;Sim800.c,361 :: 		}
SEH	R4, R2
; i end address is: 8 (R2)
J	L_WaitForSetupSMS57
NOP	
L_WaitForSetupSMS58:
;Sim800.c,362 :: 		UART1_Write(0x0D);
SH	R25, 16(SP)
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,363 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
LHU	R25, 16(SP)
;Sim800.c,365 :: 		}
L_WaitForSetupSMS56:
L_WaitForSetupSMS55:
;Sim800.c,368 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS60:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS60
NOP	
NOP	
NOP	
;Sim800.c,369 :: 		do{
L_WaitForSetupSMS62:
;Sim800.c,370 :: 		UART2_Write_Text("AT+CMGD=");
SH	R25, 16(SP)
LUI	R25, hi_addr(?lstr25_Sim800+0)
ORI	R25, R25, lo_addr(?lstr25_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,371 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 26
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,372 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,373 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,376 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 16(SP)
;Sim800.c,377 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS65:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS65
NOP	
NOP	
NOP	
;Sim800.c,378 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,379 :: 		res--;
LH	R2, 18(SP)
ADDIU	R2, R2, -1
SH	R2, 18(SP)
;Sim800.c,380 :: 		sprintf(sms,"%d",res);
ADDIU	R3, SP, 26
SH	R25, 16(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_26_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_26_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LHU	R25, 16(SP)
;Sim800.c,381 :: 		}while(res > 0);
LH	R2, 18(SP)
SLTI	R2, R2, 1
BNE	R2, R0, L__WaitForSetupSMS150
NOP	
J	L_WaitForSetupSMS62
NOP	
L__WaitForSetupSMS150:
;Sim800.c,383 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
; str_rcv start address is: 84 (R21)
MOVZ	R21, R2, R0
;Sim800.c,384 :: 		res = strcmp(str_rcv,"OK,");
LUI	R26, hi_addr(?lstr27_Sim800+0)
ORI	R26, R26, lo_addr(?lstr27_Sim800+0)
MOVZ	R25, R2, R0
JAL	_strcmp+0
NOP	
SH	R2, 18(SP)
;Sim800.c,385 :: 		sprintf(txtA,"%d",res);
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_28_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_28_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,391 :: 		,SimTestTxt,str_rcv,txtA);
ADDIU	R2, SP, 20
ADDIU	SP, SP, -20
SW	R2, 16(SP)
SW	R21, 12(SP)
; str_rcv end address is: 84 (R21)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SW	R2, 8(SP)
;Sim800.c,390 :: 		" * res: %s\r\n"
LUI	R2, hi_addr(?lstr_29_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_29_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,387 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,391 :: 		,SimTestTxt,str_rcv,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
;Sim800.c,394 :: 		if(res == 0){
LH	R2, 18(SP)
BEQ	R2, R0, L__WaitForSetupSMS151
NOP	
J	L_WaitForSetupSMS67
NOP	
L__WaitForSetupSMS151:
;Sim800.c,395 :: 		NVMWriteRow (FLASH_Settings_VAddr_Sim800, SF.SimFlashBuff);
LUI	R26, hi_addr(_SF+69)
ORI	R26, R26, lo_addr(_SF+69)
LW	R25, Offset(_FLASH_Settings_VAddr_Sim800+0)(GP)
JAL	_NVMWriteRow+0
NOP	
;Sim800.c,396 :: 		return 3;
ORI	R2, R0, 3
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,397 :: 		}
L_WaitForSetupSMS67:
;Sim800.c,399 :: 		return 0;
MOVZ	R2, R0, R0
;Sim800.c,400 :: 		}
;Sim800.c,399 :: 		return 0;
;Sim800.c,400 :: 		}
L_end_WaitForSetupSMS:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _WaitForSetupSMS
_GetAPI_Key_SMS:
;Sim800.c,405 :: 		char GetAPI_Key_SMS(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,410 :: 		UART2_Write_Text("AT+CMGS=");
SW	R25, 4(SP)
LUI	R25, hi_addr(?lstr30_Sim800+0)
ORI	R25, R25, lo_addr(?lstr30_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,411 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,412 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,413 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,416 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,417 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,418 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_GetAPI_Key_SMS69:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetAPI_Key_SMS69
NOP	
NOP	
NOP	
;Sim800.c,422 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,421 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_31_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_31_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,420 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,422 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,425 :: 		UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
LUI	R25, hi_addr(?lstr32_Sim800+0)
ORI	R25, R25, lo_addr(?lstr32_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,426 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,427 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,428 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,430 :: 		response = WaitForSetupSMS(0);
MOVZ	R25, R0, R0
JAL	_WaitForSetupSMS+0
NOP	
;Sim800.c,432 :: 		return response;
;Sim800.c,433 :: 		}
;Sim800.c,432 :: 		return response;
;Sim800.c,433 :: 		}
L_end_GetAPI_Key_SMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _GetAPI_Key_SMS
_SendSMS:
;Sim800.c,438 :: 		char SendSMS(char sms_type){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,441 :: 		UART2_Write_Text("AT+CNMI=2,2,0,0,0");
SW	R25, 4(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(?lstr33_Sim800+0)
ORI	R25, R25, lo_addr(?lstr33_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,442 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,443 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,444 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS71:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS71
NOP	
;Sim800.c,445 :: 		UART2_Write_Text("AT+CMGF=1");
LUI	R25, hi_addr(?lstr34_Sim800+0)
ORI	R25, R25, lo_addr(?lstr34_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,446 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,447 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,448 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS73:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS73
NOP	
;Sim800.c,449 :: 		UART2_Write_Text("AT+CMGS=\"+447946455348\"");
LUI	R25, hi_addr(?lstr35_Sim800+0)
ORI	R25, R25, lo_addr(?lstr35_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,450 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,451 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,452 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS75:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS75
NOP	
NOP	
NOP	
;Sim800.c,453 :: 		switch(sms_type){
J	L_SendSMS77
NOP	
;Sim800.c,454 :: 		case 0:
L_SendSMS79:
;Sim800.c,455 :: 		UART2_Write_Text("ERROR in setup Power down and start again!");
LUI	R25, hi_addr(?lstr36_Sim800+0)
ORI	R25, R25, lo_addr(?lstr36_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,456 :: 		break;
J	L_SendSMS78
NOP	
;Sim800.c,457 :: 		case 1:
L_SendSMS80:
;Sim800.c,458 :: 		UART2_Write_Text("Reply WebSite");
LUI	R25, hi_addr(?lstr37_Sim800+0)
ORI	R25, R25, lo_addr(?lstr37_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,459 :: 		break;
J	L_SendSMS78
NOP	
;Sim800.c,460 :: 		case 2:
L_SendSMS81:
;Sim800.c,461 :: 		UART2_Write_Text("Reply API Key");
LUI	R25, hi_addr(?lstr38_Sim800+0)
ORI	R25, R25, lo_addr(?lstr38_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,462 :: 		break;
J	L_SendSMS78
NOP	
;Sim800.c,463 :: 		case 3:
L_SendSMS82:
;Sim800.c,464 :: 		UART2_Write_Text("Setup Complete!");
LUI	R25, hi_addr(?lstr39_Sim800+0)
ORI	R25, R25, lo_addr(?lstr39_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,465 :: 		break;
J	L_SendSMS78
NOP	
;Sim800.c,466 :: 		default:
L_SendSMS83:
;Sim800.c,467 :: 		UART2_Write_Text("ERROR in setup Power down and start again!");
LUI	R25, hi_addr(?lstr40_Sim800+0)
ORI	R25, R25, lo_addr(?lstr40_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,468 :: 		break;
J	L_SendSMS78
NOP	
;Sim800.c,469 :: 		}
L_SendSMS77:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS155
NOP	
J	L_SendSMS79
NOP	
L__SendSMS155:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS157
NOP	
J	L_SendSMS80
NOP	
L__SendSMS157:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS159
NOP	
J	L_SendSMS81
NOP	
L__SendSMS159:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__SendSMS161
NOP	
J	L_SendSMS82
NOP	
L__SendSMS161:
J	L_SendSMS83
NOP	
L_SendSMS78:
;Sim800.c,470 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,471 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendSMS84:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS84
NOP	
NOP	
NOP	
;Sim800.c,472 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,473 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SendSMS86:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS86
NOP	
NOP	
NOP	
;Sim800.c,474 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr41_Sim800+0)
ORI	R25, R25, lo_addr(?lstr41_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,475 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,476 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,477 :: 		}
L_end_SendSMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _SendSMS
_Test_Update_ThingSpeak:
;Sim800.c,483 :: 		int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,491 :: 		if(s != sLast){
SW	R25, 4(SP)
ANDI	R3, R25, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak164
NOP	
J	L_Test_Update_ThingSpeak88
NOP	
L__Test_Update_ThingSpeak164:
;Sim800.c,492 :: 		sLast = s;
SB	R25, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
;Sim800.c,498 :: 		}
L_Test_Update_ThingSpeak88:
;Sim800.c,499 :: 		if(m != mLast){
ANDI	R3, R26, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak166
NOP	
J	L_Test_Update_ThingSpeak89
NOP	
L__Test_Update_ThingSpeak166:
;Sim800.c,500 :: 		mLast = m;
SB	R26, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
;Sim800.c,506 :: 		}
L_Test_Update_ThingSpeak89:
;Sim800.c,507 :: 		if(h != hLast){
ANDI	R3, R27, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak168
NOP	
J	L_Test_Update_ThingSpeak90
NOP	
L__Test_Update_ThingSpeak168:
;Sim800.c,508 :: 		hLast = h;
SB	R27, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
;Sim800.c,514 :: 		}
L_Test_Update_ThingSpeak90:
;Sim800.c,517 :: 		m > SimVars.time_to_log){
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_Update_ThingSpeak169
NOP	
J	L__Test_Update_ThingSpeak120
NOP	
L__Test_Update_ThingSpeak169:
ANDI	R3, R26, 65535
LHU	R2, Offset(_SimVars+514)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Test_Update_ThingSpeak170
NOP	
J	L__Test_Update_ThingSpeak119
NOP	
L__Test_Update_ThingSpeak170:
L__Test_Update_ThingSpeak118:
;Sim800.c,518 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,519 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,520 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Test_Update_ThingSpeak
NOP	
;Sim800.c,517 :: 		m > SimVars.time_to_log){
L__Test_Update_ThingSpeak120:
L__Test_Update_ThingSpeak119:
;Sim800.c,523 :: 		return -1;
ORI	R2, R0, 65535
;Sim800.c,524 :: 		}
;Sim800.c,523 :: 		return -1;
;Sim800.c,524 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,529 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;Sim800.c,535 :: 		sprintf(txtC,"%u",rgbc[0]);
SW	R25, 4(SP)
LHU	R2, 0(R25)
ADDIU	R3, SP, 12
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_42_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_42_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,536 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R3, SP, 27
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_43_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_43_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,537 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDIU	R3, SP, 42
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_44_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_44_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,538 :: 		sprintf(txtB,"%u",rgbc[3]);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R3, SP, 57
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_45_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_45_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,540 :: 		UART2_Write_Text("AT+CPIN?");
LUI	R25, hi_addr(?lstr46_Sim800+0)
ORI	R25, R25, lo_addr(?lstr46_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,541 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,542 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,543 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData94:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData94
NOP	
;Sim800.c,544 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr47_Sim800+0)
ORI	R25, R25, lo_addr(?lstr47_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,545 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,546 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,547 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData96:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData96
NOP	
;Sim800.c,548 :: 		UART2_Write_Text("AT+CGATT?");
LUI	R25, hi_addr(?lstr48_Sim800+0)
ORI	R25, R25, lo_addr(?lstr48_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,549 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,550 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,551 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData98:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData98
NOP	
;Sim800.c,552 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr49_Sim800+0)
ORI	R25, R25, lo_addr(?lstr49_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,553 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,554 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,555 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData100:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData100
NOP	
NOP	
;Sim800.c,556 :: 		UART2_Write_Text("AT+CIPSTATUS");
LUI	R25, hi_addr(?lstr50_Sim800+0)
ORI	R25, R25, lo_addr(?lstr50_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,557 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,558 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,559 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData102:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData102
NOP	
NOP	
;Sim800.c,560 :: 		UART2_Write_Text("AT+CIPMUX=0");
LUI	R25, hi_addr(?lstr51_Sim800+0)
ORI	R25, R25, lo_addr(?lstr51_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,561 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,562 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,563 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData104:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData104
NOP	
;Sim800.c,564 :: 		UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
LUI	R25, hi_addr(?lstr52_Sim800+0)
ORI	R25, R25, lo_addr(?lstr52_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,565 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,566 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,567 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData106:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData106
NOP	
NOP	
;Sim800.c,568 :: 		UART2_Write_Text("AT+CIICR");
LUI	R25, hi_addr(?lstr53_Sim800+0)
ORI	R25, R25, lo_addr(?lstr53_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,569 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,570 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,571 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData108:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData108
NOP	
;Sim800.c,572 :: 		UART2_Write_Text("AT+CIFSR");
LUI	R25, hi_addr(?lstr54_Sim800+0)
ORI	R25, R25, lo_addr(?lstr54_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,573 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,574 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,575 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData110:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData110
NOP	
;Sim800.c,576 :: 		UART2_Write_Text("AT+CIPSPRT=1");
LUI	R25, hi_addr(?lstr55_Sim800+0)
ORI	R25, R25, lo_addr(?lstr55_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,577 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,578 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,579 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData112:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData112
NOP	
;Sim800.c,580 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
LUI	R25, hi_addr(?lstr56_Sim800+0)
ORI	R25, R25, lo_addr(?lstr56_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,581 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,582 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,583 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData114:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData114
NOP	
;Sim800.c,584 :: 		UART2_Write_Text("AT+CIPSEND");
LUI	R25, hi_addr(?lstr57_Sim800+0)
ORI	R25, R25, lo_addr(?lstr57_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,585 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,586 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,587 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData116:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData116
NOP	
;Sim800.c,588 :: 		UART2_Write_Text("GET https://api.thingspeak.com/update?api_key=W2NO15EASX7P7CDK&field1=");
LUI	R25, hi_addr(?lstr58_Sim800+0)
ORI	R25, R25, lo_addr(?lstr58_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,589 :: 		UART2_Write_Text(txtC);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,590 :: 		UART2_Write_Text("&field2=");
LUI	R25, hi_addr(?lstr59_Sim800+0)
ORI	R25, R25, lo_addr(?lstr59_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,591 :: 		UART2_Write_Text(txtR);
ADDIU	R2, SP, 27
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,592 :: 		UART2_Write_Text("&field3=");
LUI	R25, hi_addr(?lstr60_Sim800+0)
ORI	R25, R25, lo_addr(?lstr60_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,593 :: 		UART2_Write_Text(txtG);
ADDIU	R2, SP, 42
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,594 :: 		UART2_Write_Text("&field4=");
LUI	R25, hi_addr(?lstr61_Sim800+0)
ORI	R25, R25, lo_addr(?lstr61_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,595 :: 		UART2_Write_Text(txtB);
ADDIU	R2, SP, 57
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,596 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,597 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,598 :: 		}
L_end_SendData:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 72
JR	RA
NOP	
; end of _SendData
