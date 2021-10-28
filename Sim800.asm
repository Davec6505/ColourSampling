_InitGSM3:
;Sim800.c,37 :: 		void InitGSM3(){
;Sim800.c,38 :: 		SimVars.initial_str = 0;
SB	R0, Offset(_SimVars+0)(GP)
;Sim800.c,39 :: 		SimVars.init_inc    = 0;
SB	R0, Offset(_SimVars+6)(GP)
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
SH	R0, Offset(_SF+326)(GP)
;Sim800.c,45 :: 		}
L_end_InitGSM3:
JR	RA
NOP	
; end of _InitGSM3
_RcvSimTxt:
;Sim800.c,50 :: 		void RcvSimTxt(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,52 :: 		while(UART2_Data_Ready()) {     // If data is received
L_RcvSimTxt0:
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__RcvSimTxt113
NOP	
J	L_RcvSimTxt1
NOP	
L__RcvSimTxt113:
;Sim800.c,53 :: 		txt = U2RXREG;
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Sim800.c,54 :: 		U1TXREG = txt;
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,55 :: 		if(txt >= 0x20){
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt114
NOP	
J	L_RcvSimTxt2
NOP	
L__RcvSimTxt114:
;Sim800.c,56 :: 		RB.buff[RB.head] = txt;
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
SB	R4, 0(R2)
; txt end address is: 16 (R4)
;Sim800.c,57 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,58 :: 		}else if(U2RXREG == 0x0A){
J	L_RcvSimTxt3
NOP	
L_RcvSimTxt2:
LW	R3, Offset(U2RXREG+0)(GP)
ORI	R2, R0, 10
BEQ	R3, R2, L__RcvSimTxt115
NOP	
J	L_RcvSimTxt4
NOP	
L__RcvSimTxt115:
;Sim800.c,59 :: 		RB.buff[RB.head] = ',';
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
ORI	R2, R0, 44
SB	R2, 0(R3)
;Sim800.c,60 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,61 :: 		}
L_RcvSimTxt4:
L_RcvSimTxt3:
;Sim800.c,62 :: 		if(RB.head > 999)
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RcvSimTxt116
NOP	
J	L_RcvSimTxt5
NOP	
L__RcvSimTxt116:
;Sim800.c,63 :: 		RB.head = 0;             //rest head when buffer is full
SH	R0, Offset(_RB+1002)(GP)
L_RcvSimTxt5:
;Sim800.c,65 :: 		}
J	L_RcvSimTxt0
NOP	
L_RcvSimTxt1:
;Sim800.c,66 :: 		RB.rcv_txt_fin = 1;
ORI	R2, R0, 1
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,67 :: 		}
L_end_RcvSimTxt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RcvSimTxt
_PwrUpGSM3:
;Sim800.c,72 :: 		void PwrUpGSM3(){
;Sim800.c,73 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,74 :: 		PWR = 0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,75 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM36
NOP	
;Sim800.c,76 :: 		PWR = 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,78 :: 		while(STAT){
L_PwrUpGSM38:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrUpGSM3119
NOP	
J	L_PwrUpGSM39
NOP	
L__PwrUpGSM3119:
;Sim800.c,79 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,80 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM310:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM310
NOP	
;Sim800.c,81 :: 		}
J	L_PwrUpGSM38
NOP	
L_PwrUpGSM39:
;Sim800.c,82 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM312:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM312
NOP	
NOP	
NOP	
;Sim800.c,83 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_RingToTempBuf:
;Sim800.c,88 :: 		void RingToTempBuf(){
;Sim800.c,90 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,91 :: 		RB.tail = RB.last_tail++;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1008)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,92 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__RingToTempBuf121
NOP	
J	L_RingToTempBuf14
NOP	
L__RingToTempBuf121:
; i end address is: 20 (R5)
;Sim800.c,93 :: 		while(RB.tail <= RB.head){
L_RingToTempBuf15:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__RingToTempBuf122
NOP	
J	L_RingToTempBuf16
NOP	
L__RingToTempBuf122:
;Sim800.c,94 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,99 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,100 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,101 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RingToTempBuf123
NOP	
J	L_RingToTempBuf17
NOP	
L__RingToTempBuf123:
; ?FLOC___RingToTempBuf?T30 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___RingToTempBuf?T30 end address is: 8 (R2)
J	L_RingToTempBuf18
NOP	
L_RingToTempBuf17:
; ?FLOC___RingToTempBuf?T30 start address is: 8 (R2)
LHU	R2, Offset(_RB+1004)(GP)
; ?FLOC___RingToTempBuf?T30 end address is: 8 (R2)
L_RingToTempBuf18:
; ?FLOC___RingToTempBuf?T30 start address is: 8 (R2)
SH	R2, Offset(_RB+1004)(GP)
; ?FLOC___RingToTempBuf?T30 end address is: 8 (R2)
;Sim800.c,102 :: 		};
J	L_RingToTempBuf15
NOP	
L_RingToTempBuf16:
;Sim800.c,103 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,104 :: 		}
L_RingToTempBuf14:
;Sim800.c,105 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,106 :: 		}
L_end_RingToTempBuf:
JR	RA
NOP	
; end of _RingToTempBuf
_WaitForResponse:
;Sim800.c,111 :: 		void WaitForResponse(short dly){
;Sim800.c,112 :: 		RB.rcv_txt_fin   = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,113 :: 		RB.last_head     = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,114 :: 		do{
L_WaitForResponse19:
;Sim800.c,115 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,116 :: 		if(dly == 0)
SEB	R2, R25
BEQ	R2, R0, L__WaitForResponse125
NOP	
J	L_WaitForResponse22
NOP	
L__WaitForResponse125:
;Sim800.c,117 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_WaitForResponse23:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse23
NOP	
J	L_WaitForResponse25
NOP	
L_WaitForResponse22:
;Sim800.c,118 :: 		else if(dly == 1)
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForResponse126
NOP	
J	L_WaitForResponse26
NOP	
L__WaitForResponse126:
;Sim800.c,119 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForResponse27:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse27
NOP	
NOP	
NOP	
J	L_WaitForResponse29
NOP	
L_WaitForResponse26:
;Sim800.c,121 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse30
NOP	
L_WaitForResponse29:
L_WaitForResponse25:
;Sim800.c,122 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForResponse128
NOP	
J	L_WaitForResponse19
NOP	
L__WaitForResponse128:
;Sim800.c,123 :: 		}
L_end_WaitForResponse:
JR	RA
NOP	
; end of _WaitForResponse
_SetupIOT:
;Sim800.c,129 :: 		char SetupIOT(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,140 :: 		" * ATE0\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(?lstr_2_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_2_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,139 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,140 :: 		" * ATE0\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,142 :: 		RB.rcv_txt_fin = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,143 :: 		RB.last_head = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,144 :: 		do{
L_SetupIOT32:
;Sim800.c,145 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,146 :: 		UART2_Write_Text("ATE0");
LUI	R25, hi_addr(?lstr3_Sim800+0)
ORI	R25, R25, lo_addr(?lstr3_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,147 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,148 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,149 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SetupIOT35:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT35
NOP	
;Sim800.c,150 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__SetupIOT131
NOP	
J	L_SetupIOT32
NOP	
L__SetupIOT131:
;Sim800.c,151 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT37:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT37
NOP	
;Sim800.c,152 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,158 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,157 :: 		" * Check if Sim is Registered\r\n"
LUI	R2, hi_addr(?lstr_4_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_4_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,155 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,158 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,160 :: 		wait:
___SetupIOT_wait:
;Sim800.c,162 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr5_Sim800+0)
ORI	R25, R25, lo_addr(?lstr5_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,163 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,164 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,165 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,166 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT39:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT39
NOP	
NOP	
NOP	
;Sim800.c,167 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,172 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,171 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_6_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_6_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,170 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,172 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,176 :: 		if(RB.head > RB.last_head){//(SimVars.num_of_sms_bytes > 0){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT132
NOP	
J	L_SetupIOT41
NOP	
L__SetupIOT132:
;Sim800.c,177 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,178 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,181 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_7_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,189 :: 		,txtA,string[0],string[1],string[2],string[3],string[4]);
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
;Sim800.c,188 :: 		" *string[4]  %s\r\n"
LUI	R2, hi_addr(?lstr_8_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_8_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,182 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,189 :: 		,txtA,string[0],string[1],string[2],string[3],string[4]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,191 :: 		str_rcv = findnumber(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
;Sim800.c,192 :: 		res = atoi(str_rcv);
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,193 :: 		if(res == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT133
NOP	
J	L_SetupIOT42
NOP	
L__SetupIOT133:
;Sim800.c,195 :: 		sprintf(txtA,"%d",res);
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SH	R4, 8(SP)
; res end address is: 16 (R4)
LUI	R2, hi_addr(?lstr_9_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_9_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,198 :: 		,txtA);
ADDIU	R2, SP, 12
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,197 :: 		" *Registered with:= %s\r\n"
LUI	R2, hi_addr(?lstr_10_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_10_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,196 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,198 :: 		,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,201 :: 		}else{
J	L_SetupIOT43
NOP	
L_SetupIOT42:
;Sim800.c,204 :: 		" *Sim Not Registered\r\n");
LUI	R2, hi_addr(?lstr_11_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_11_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,203 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,204 :: 		" *Sim Not Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,206 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT44:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT44
NOP	
NOP	
NOP	
;Sim800.c,207 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,208 :: 		}
L_SetupIOT43:
;Sim800.c,209 :: 		}
L_SetupIOT41:
;Sim800.c,212 :: 		" *Sim Registered\r\n");
LUI	R2, hi_addr(?lstr_12_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_12_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,211 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,212 :: 		" *Sim Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,214 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,215 :: 		}
;Sim800.c,214 :: 		return 1;
;Sim800.c,215 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,222 :: 		char WaitForSetupSMS(unsigned int Indx){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Sim800.c,228 :: 		UART2_Write_Text("AT+CMGF=1");
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SH	R25, 16(SP)
LUI	R25, hi_addr(?lstr13_Sim800+0)
ORI	R25, R25, lo_addr(?lstr13_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,229 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,230 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,233 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 16(SP)
;Sim800.c,234 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,236 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS46:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS46
NOP	
;Sim800.c,238 :: 		RB.rcv_txt_fin = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,239 :: 		RB.last_head   = RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,240 :: 		do{
L_WaitForSetupSMS48:
;Sim800.c,241 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,242 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_WaitForSetupSMS51:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS51
NOP	
NOP	
;Sim800.c,243 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForSetupSMS136
NOP	
J	L_WaitForSetupSMS48
NOP	
L__WaitForSetupSMS136:
;Sim800.c,244 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS53:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS53
NOP	
;Sim800.c,246 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,248 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 16(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 84 (R21)
SEH	R21, R2
;Sim800.c,251 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 18
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_14_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_14_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,252 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 18
; num_strs end address is: 84 (R21)
ADDIU	SP, SP, -12
SH	R21, 8(SP)
LUI	R2, hi_addr(?lstr_15_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_15_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,261 :: 		,txtA,string[0],string[1],
ADDIU	R3, SP, 18
;Sim800.c,263 :: 		string[4],string[5]);
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,262 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,261 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,260 :: 		" *string[5]  %s\r\n"
LUI	R2, hi_addr(?lstr_16_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_16_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,253 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,263 :: 		string[4],string[5]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
;Sim800.c,266 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
;Sim800.c,267 :: 		sprintf(sms,"%d",res);
ADDIU	R3, SP, 24
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_17_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_17_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,271 :: 		,sms);
ADDIU	R2, SP, 24
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,270 :: 		" *Result:= %s\r\n"
LUI	R2, hi_addr(?lstr_18_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_18_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,269 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,271 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,275 :: 		UART2_Write_Text("AT+CMGR=");
LUI	R25, hi_addr(?lstr19_Sim800+0)
ORI	R25, R25, lo_addr(?lstr19_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,276 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,277 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,278 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,280 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 16(SP)
;Sim800.c,281 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS55:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS55
NOP	
NOP	
NOP	
;Sim800.c,282 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,283 :: 		str_rcv = setstr(SimTestTxt);
SH	R25, 16(SP)
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,284 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,286 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 18
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_20_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_20_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,295 :: 		,txtA,string[0],string[1],
ADDIU	R3, SP, 18
;Sim800.c,297 :: 		string[4],string[5]);
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,296 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,295 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,294 :: 		" *string[5]  %s\r\n"
LUI	R2, hi_addr(?lstr_21_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_21_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,287 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,297 :: 		string[4],string[5]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
LHU	R25, 16(SP)
;Sim800.c,300 :: 		if(Indx == 0){
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS137
NOP	
J	L_WaitForSetupSMS57
NOP	
L__WaitForSetupSMS137:
;Sim800.c,301 :: 		SF.SimFlashPtr = strlen(string[1])+1;
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+326)(GP)
;Sim800.c,302 :: 		memcpy(SF.SimFlashBuff,string[1],SF.SimFlashPtr);
ANDI	R27, R2, 65535
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+69)
ORI	R25, R25, lo_addr(_SF+69)
JAL	_memcpy+0
NOP	
;Sim800.c,303 :: 		strncpy(SF.SimCelNum,string[1],strlen(string[1])+1);
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
;Sim800.c,304 :: 		strncpy(SF.SimDate,string[3]+1,strlen(string[3]));
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
SEH	R27, R2
LUI	R26, hi_addr(_string+193)
ORI	R26, R26, lo_addr(_string+193)
LUI	R25, hi_addr(_SF+17)
ORI	R25, R25, lo_addr(_SF+17)
JAL	_strncpy+0
NOP	
;Sim800.c,305 :: 		strncpy(SF.SimTime,string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+26)
ORI	R25, R25, lo_addr(_SF+26)
JAL	_strncpy+0
NOP	
;Sim800.c,306 :: 		SF.SimFlashPtr++;
LHU	R2, Offset(_SF+326)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+326)(GP)
;Sim800.c,313 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
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
;Sim800.c,312 :: 		" * SF.SimTime: %s\r\n"
LUI	R2, hi_addr(?lstr_22_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_22_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,309 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,313 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
;Sim800.c,315 :: 		}else if(Indx == 1){
J	L_WaitForSetupSMS58
NOP	
L_WaitForSetupSMS57:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS138
NOP	
J	L_WaitForSetupSMS59
NOP	
L__WaitForSetupSMS138:
;Sim800.c,317 :: 		int indx = SF.SimFlashPtr + strlen(string[1])+1;
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LHU	R3, Offset(_SF+326)(GP)
ADDU	R2, R3, R2
ADDIU	R2, R2, 1
; indx start address is: 20 (R5)
ANDI	R5, R2, 65535
;Sim800.c,318 :: 		memcpy(SF.SimFlashBuff+indx,string[1],strlen(string[1])+1);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R4, R2, 1
SEH	R3, R5
; indx end address is: 20 (R5)
LUI	R2, hi_addr(_SF+69)
ORI	R2, R2, lo_addr(_SF+69)
ADDU	R2, R2, R3
SEH	R27, R4
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,319 :: 		indx = SF.SimFlashPtr + strlen(string[2])+1;
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LHU	R3, Offset(_SF+326)(GP)
ADDU	R2, R3, R2
ADDIU	R2, R2, 1
; indx start address is: 20 (R5)
ANDI	R5, R2, 65535
;Sim800.c,320 :: 		memcpy(SF.SimFlashBuff+indx,string[2],strlen(string[2])+1);
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
ADDIU	R4, R2, 1
SEH	R3, R5
; indx end address is: 20 (R5)
LUI	R2, hi_addr(_SF+69)
ORI	R2, R2, lo_addr(_SF+69)
ADDU	R2, R2, R3
SEH	R27, R4
LUI	R26, hi_addr(_string+128)
ORI	R26, R26, lo_addr(_string+128)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,321 :: 		strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);
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
;Sim800.c,322 :: 		strncpy(SF.ReadAPIKey,string[2]+1,strlen(string[3])+1);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+129)
ORI	R26, R26, lo_addr(_string+129)
LUI	R25, hi_addr(_SF+52)
ORI	R25, R25, lo_addr(_SF+52)
JAL	_strncpy+0
NOP	
;Sim800.c,323 :: 		SF.SimFlashPtr = strlen(string[1])+1;
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+326)(GP)
;Sim800.c,329 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
LUI	R2, hi_addr(_SF+52)
ORI	R2, R2, lo_addr(_SF+52)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+35)
ORI	R2, R2, lo_addr(_SF+35)
SW	R2, 8(SP)
;Sim800.c,328 :: 		" * SF.ReadAPIKey:  %s\r\n"
LUI	R2, hi_addr(?lstr_23_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_23_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,326 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,329 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
;Sim800.c,331 :: 		}
L_WaitForSetupSMS59:
L_WaitForSetupSMS58:
;Sim800.c,334 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS60:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS60
NOP	
;Sim800.c,335 :: 		UART2_Write_Text("AT+CMGD=");
LUI	R25, hi_addr(?lstr24_Sim800+0)
ORI	R25, R25, lo_addr(?lstr24_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,336 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 24
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
;Sim800.c,342 :: 		RingToTempBuf();//??
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,344 :: 		return 2;
ORI	R2, R0, 2
;Sim800.c,345 :: 		}
;Sim800.c,344 :: 		return 2;
;Sim800.c,345 :: 		}
L_end_WaitForSetupSMS:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _WaitForSetupSMS
_GetAPI_Key_SMS:
;Sim800.c,350 :: 		char GetAPI_Key_SMS(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,354 :: 		UART2_Write_Text("AT+CMGS=");
SW	R25, 4(SP)
LUI	R25, hi_addr(?lstr25_Sim800+0)
ORI	R25, R25, lo_addr(?lstr25_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,355 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,356 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,357 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,360 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,361 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,366 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,365 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_26_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_26_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,364 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,366 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,369 :: 		UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
LUI	R25, hi_addr(?lstr27_Sim800+0)
ORI	R25, R25, lo_addr(?lstr27_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,370 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,371 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,372 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,374 :: 		WaitForSetupSMS(1);
ORI	R25, R0, 1
JAL	_WaitForSetupSMS+0
NOP	
;Sim800.c,377 :: 		return 3;
ORI	R2, R0, 3
;Sim800.c,378 :: 		}
;Sim800.c,377 :: 		return 3;
;Sim800.c,378 :: 		}
L_end_GetAPI_Key_SMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _GetAPI_Key_SMS
_SendSMS:
;Sim800.c,383 :: 		char SendSMS(char sms_type){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,386 :: 		UART2_Write_Text("AT+CNMI=2,2,0,0,0");
SW	R25, 4(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(?lstr28_Sim800+0)
ORI	R25, R25, lo_addr(?lstr28_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,387 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,388 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,389 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS62:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS62
NOP	
;Sim800.c,390 :: 		UART2_Write_Text("AT+CMGF=1");
LUI	R25, hi_addr(?lstr29_Sim800+0)
ORI	R25, R25, lo_addr(?lstr29_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,391 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,392 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,393 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS64:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS64
NOP	
;Sim800.c,394 :: 		UART2_Write_Text("AT+CMGS=\"+447946455348\"");
LUI	R25, hi_addr(?lstr30_Sim800+0)
ORI	R25, R25, lo_addr(?lstr30_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,395 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,396 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,397 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS66:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS66
NOP	
NOP	
NOP	
;Sim800.c,398 :: 		switch(sms_type){
J	L_SendSMS68
NOP	
;Sim800.c,399 :: 		case 0:
L_SendSMS70:
;Sim800.c,400 :: 		UART2_Write_Text("Reply Start");
LUI	R25, hi_addr(?lstr31_Sim800+0)
ORI	R25, R25, lo_addr(?lstr31_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,401 :: 		break;
J	L_SendSMS69
NOP	
;Sim800.c,402 :: 		case 1:
L_SendSMS71:
;Sim800.c,403 :: 		UART2_Write_Text("Reply WebSite");
LUI	R25, hi_addr(?lstr32_Sim800+0)
ORI	R25, R25, lo_addr(?lstr32_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,404 :: 		break;
J	L_SendSMS69
NOP	
;Sim800.c,405 :: 		case 2:
L_SendSMS72:
;Sim800.c,406 :: 		UART2_Write_Text("Reply API Key");
LUI	R25, hi_addr(?lstr33_Sim800+0)
ORI	R25, R25, lo_addr(?lstr33_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,407 :: 		break;
J	L_SendSMS69
NOP	
;Sim800.c,408 :: 		}
L_SendSMS68:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS142
NOP	
J	L_SendSMS70
NOP	
L__SendSMS142:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS144
NOP	
J	L_SendSMS71
NOP	
L__SendSMS144:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS146
NOP	
J	L_SendSMS72
NOP	
L__SendSMS146:
L_SendSMS69:
;Sim800.c,409 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,410 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendSMS73:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS73
NOP	
NOP	
NOP	
;Sim800.c,411 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,412 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SendSMS75:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS75
NOP	
NOP	
NOP	
;Sim800.c,413 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr34_Sim800+0)
ORI	R25, R25, lo_addr(?lstr34_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,414 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,415 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,416 :: 		}
L_end_SendSMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _SendSMS
_Test_Update_ThingSpeak:
;Sim800.c,422 :: 		int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,430 :: 		if(s != sLast){
SW	R25, 4(SP)
ANDI	R3, R25, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak149
NOP	
J	L_Test_Update_ThingSpeak77
NOP	
L__Test_Update_ThingSpeak149:
;Sim800.c,431 :: 		sLast = s;
SB	R25, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
;Sim800.c,437 :: 		}
L_Test_Update_ThingSpeak77:
;Sim800.c,438 :: 		if(m != mLast){
ANDI	R3, R26, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak151
NOP	
J	L_Test_Update_ThingSpeak78
NOP	
L__Test_Update_ThingSpeak151:
;Sim800.c,439 :: 		mLast = m;
SB	R26, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
;Sim800.c,445 :: 		}
L_Test_Update_ThingSpeak78:
;Sim800.c,446 :: 		if(h != hLast){
ANDI	R3, R27, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak153
NOP	
J	L_Test_Update_ThingSpeak79
NOP	
L__Test_Update_ThingSpeak153:
;Sim800.c,447 :: 		hLast = h;
SB	R27, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
;Sim800.c,453 :: 		}
L_Test_Update_ThingSpeak79:
;Sim800.c,456 :: 		m > SimVars.time_to_log){
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_Update_ThingSpeak154
NOP	
J	L__Test_Update_ThingSpeak109
NOP	
L__Test_Update_ThingSpeak154:
ANDI	R3, R26, 65535
LHU	R2, Offset(_SimVars+2)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Test_Update_ThingSpeak155
NOP	
J	L__Test_Update_ThingSpeak108
NOP	
L__Test_Update_ThingSpeak155:
L__Test_Update_ThingSpeak107:
;Sim800.c,457 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,458 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,459 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Test_Update_ThingSpeak
NOP	
;Sim800.c,456 :: 		m > SimVars.time_to_log){
L__Test_Update_ThingSpeak109:
L__Test_Update_ThingSpeak108:
;Sim800.c,462 :: 		return -1;
ORI	R2, R0, 65535
;Sim800.c,463 :: 		}
;Sim800.c,462 :: 		return -1;
;Sim800.c,463 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,468 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;Sim800.c,474 :: 		sprintf(txtC,"%u",rgbc[0]);
SW	R25, 4(SP)
LHU	R2, 0(R25)
ADDIU	R3, SP, 12
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_35_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_35_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,475 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R3, SP, 27
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_36_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_36_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,476 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDIU	R3, SP, 42
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_37_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_37_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,477 :: 		sprintf(txtB,"%u",rgbc[3]);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R3, SP, 57
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_38_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_38_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,479 :: 		UART2_Write_Text("AT+CPIN?");
LUI	R25, hi_addr(?lstr39_Sim800+0)
ORI	R25, R25, lo_addr(?lstr39_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,480 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,481 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,482 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData83:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData83
NOP	
;Sim800.c,483 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr40_Sim800+0)
ORI	R25, R25, lo_addr(?lstr40_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,484 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,485 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,486 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData85:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData85
NOP	
;Sim800.c,487 :: 		UART2_Write_Text("AT+CGATT?");
LUI	R25, hi_addr(?lstr41_Sim800+0)
ORI	R25, R25, lo_addr(?lstr41_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,488 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,489 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,490 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData87:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData87
NOP	
;Sim800.c,491 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr42_Sim800+0)
ORI	R25, R25, lo_addr(?lstr42_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,492 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,493 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,494 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData89:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData89
NOP	
NOP	
;Sim800.c,495 :: 		UART2_Write_Text("AT+CIPSTATUS");
LUI	R25, hi_addr(?lstr43_Sim800+0)
ORI	R25, R25, lo_addr(?lstr43_Sim800+0)
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
;Sim800.c,498 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData91:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData91
NOP	
NOP	
;Sim800.c,499 :: 		UART2_Write_Text("AT+CIPMUX=0");
LUI	R25, hi_addr(?lstr44_Sim800+0)
ORI	R25, R25, lo_addr(?lstr44_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,500 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,501 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,502 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData93:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData93
NOP	
;Sim800.c,503 :: 		UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
LUI	R25, hi_addr(?lstr45_Sim800+0)
ORI	R25, R25, lo_addr(?lstr45_Sim800+0)
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
;Sim800.c,506 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData95:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData95
NOP	
NOP	
;Sim800.c,507 :: 		UART2_Write_Text("AT+CIICR");
LUI	R25, hi_addr(?lstr46_Sim800+0)
ORI	R25, R25, lo_addr(?lstr46_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,508 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,509 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,510 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData97:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData97
NOP	
;Sim800.c,511 :: 		UART2_Write_Text("AT+CIFSR");
LUI	R25, hi_addr(?lstr47_Sim800+0)
ORI	R25, R25, lo_addr(?lstr47_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,512 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,513 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,514 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData99:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData99
NOP	
;Sim800.c,515 :: 		UART2_Write_Text("AT+CIPSPRT=1");
LUI	R25, hi_addr(?lstr48_Sim800+0)
ORI	R25, R25, lo_addr(?lstr48_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,516 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,517 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,518 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData101:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData101
NOP	
;Sim800.c,519 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
LUI	R25, hi_addr(?lstr49_Sim800+0)
ORI	R25, R25, lo_addr(?lstr49_Sim800+0)
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
;Sim800.c,522 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData103:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData103
NOP	
;Sim800.c,523 :: 		UART2_Write_Text("AT+CIPSEND");
LUI	R25, hi_addr(?lstr50_Sim800+0)
ORI	R25, R25, lo_addr(?lstr50_Sim800+0)
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
L_SendData105:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData105
NOP	
;Sim800.c,527 :: 		UART2_Write_Text("GET https://api.thingspeak.com/update?api_key=W2NO15EASX7P7CDK&field1=");
LUI	R25, hi_addr(?lstr51_Sim800+0)
ORI	R25, R25, lo_addr(?lstr51_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,528 :: 		UART2_Write_Text(txtC);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,529 :: 		UART2_Write_Text("&field2=");
LUI	R25, hi_addr(?lstr52_Sim800+0)
ORI	R25, R25, lo_addr(?lstr52_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,530 :: 		UART2_Write_Text(txtR);
ADDIU	R2, SP, 27
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,531 :: 		UART2_Write_Text("&field3=");
LUI	R25, hi_addr(?lstr53_Sim800+0)
ORI	R25, R25, lo_addr(?lstr53_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,532 :: 		UART2_Write_Text(txtG);
ADDIU	R2, SP, 42
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,533 :: 		UART2_Write_Text("&field4=");
LUI	R25, hi_addr(?lstr54_Sim800+0)
ORI	R25, R25, lo_addr(?lstr54_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,534 :: 		UART2_Write_Text(txtB);
ADDIU	R2, SP, 57
MOVZ	R25, R2, R0
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
;Sim800.c,537 :: 		}
L_end_SendData:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 72
JR	RA
NOP	
; end of _SendData
