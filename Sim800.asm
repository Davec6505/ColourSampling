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
BNE	R2, R0, L__RcvSimTxt121
NOP	
J	L_RcvSimTxt1
NOP	
L__RcvSimTxt121:
;Sim800.c,53 :: 		txt = U2RXREG;
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Sim800.c,54 :: 		U1TXREG = txt;
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,55 :: 		if(txt >= 0x20){
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt122
NOP	
J	L_RcvSimTxt2
NOP	
L__RcvSimTxt122:
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
BEQ	R3, R2, L__RcvSimTxt123
NOP	
J	L_RcvSimTxt4
NOP	
L__RcvSimTxt123:
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
BEQ	R2, R0, L__RcvSimTxt124
NOP	
J	L_RcvSimTxt5
NOP	
L__RcvSimTxt124:
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
BNE	R2, R0, L__PwrUpGSM3127
NOP	
J	L_PwrUpGSM39
NOP	
L__PwrUpGSM3127:
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
;Sim800.c,91 :: 		RB.tail = RB.last_tail;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,92 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__RingToTempBuf129
NOP	
J	L_RingToTempBuf14
NOP	
L__RingToTempBuf129:
; i end address is: 20 (R5)
;Sim800.c,93 :: 		while(RB.tail < RB.head){
L_RingToTempBuf15:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__RingToTempBuf130
NOP	
J	L_RingToTempBuf16
NOP	
L__RingToTempBuf130:
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
BEQ	R2, R0, L__RingToTempBuf131
NOP	
J	L_RingToTempBuf17
NOP	
L__RingToTempBuf131:
; ?FLOC___RingToTempBuf?T29 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___RingToTempBuf?T29 end address is: 8 (R2)
J	L_RingToTempBuf18
NOP	
L_RingToTempBuf17:
; ?FLOC___RingToTempBuf?T29 start address is: 8 (R2)
LHU	R2, Offset(_RB+1004)(GP)
; ?FLOC___RingToTempBuf?T29 end address is: 8 (R2)
L_RingToTempBuf18:
; ?FLOC___RingToTempBuf?T29 start address is: 8 (R2)
SH	R2, Offset(_RB+1004)(GP)
; ?FLOC___RingToTempBuf?T29 end address is: 8 (R2)
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
ADDIU	SP, SP, -8
SW	RA, 0(SP)
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
BEQ	R2, R0, L__WaitForResponse133
NOP	
J	L_WaitForResponse22
NOP	
L__WaitForResponse133:
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
BEQ	R3, R2, L__WaitForResponse134
NOP	
J	L_WaitForResponse26
NOP	
L__WaitForResponse134:
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
;Sim800.c,120 :: 		else if(dly == 3){
SEB	R3, R25
ORI	R2, R0, 3
BEQ	R3, R2, L__WaitForResponse135
NOP	
J	L_WaitForResponse30
NOP	
L__WaitForResponse135:
;Sim800.c,121 :: 		UART2_Write_Text("ATE0");
SB	R25, 4(SP)
LUI	R25, hi_addr(?lstr2_Sim800+0)
ORI	R25, R25, lo_addr(?lstr2_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,122 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,123 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LB	R25, 4(SP)
;Sim800.c,124 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse31:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse31
NOP	
;Sim800.c,125 :: 		}
J	L_WaitForResponse33
NOP	
L_WaitForResponse30:
;Sim800.c,127 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse34
NOP	
L_WaitForResponse33:
L_WaitForResponse29:
L_WaitForResponse25:
;Sim800.c,128 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForResponse137
NOP	
J	L_WaitForResponse19
NOP	
L__WaitForResponse137:
;Sim800.c,129 :: 		}
L_end_WaitForResponse:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WaitForResponse
_SetupIOT:
;Sim800.c,135 :: 		char SetupIOT(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,146 :: 		" * ATE0\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(?lstr_3_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_3_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,145 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,146 :: 		" * ATE0\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,149 :: 		WaitForResponse(3);
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
;Sim800.c,150 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT36
NOP	
;Sim800.c,151 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,157 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,156 :: 		" * Check if Sim is Registered\r\n"
LUI	R2, hi_addr(?lstr_4_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_4_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,154 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,157 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,159 :: 		wait:
___SetupIOT_wait:
;Sim800.c,161 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr5_Sim800+0)
ORI	R25, R25, lo_addr(?lstr5_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,162 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,163 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,164 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,165 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT38:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT38
NOP	
NOP	
NOP	
;Sim800.c,166 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,171 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,170 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_6_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_6_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,169 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,171 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,175 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT139
NOP	
J	L_SetupIOT40
NOP	
L__SetupIOT139:
;Sim800.c,176 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,177 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,180 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,188 :: 		,txtA,string[0],string[1],string[2],string[3],string[4]);
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
;Sim800.c,187 :: 		" *string[4]  %s\r\n"
LUI	R2, hi_addr(?lstr_8_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_8_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,181 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,188 :: 		,txtA,string[0],string[1],string[2],string[3],string[4]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,190 :: 		str_rcv = findnumber(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
;Sim800.c,191 :: 		res = atoi(str_rcv);  //get the sms rec number
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,192 :: 		if(res == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT140
NOP	
J	L_SetupIOT41
NOP	
L__SetupIOT140:
;Sim800.c,194 :: 		sprintf(txtA,"%d",res);
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
;Sim800.c,197 :: 		,txtA);
ADDIU	R2, SP, 12
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,196 :: 		" *Registered with:= %s\r\n"
LUI	R2, hi_addr(?lstr_10_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_10_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,195 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,197 :: 		,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,200 :: 		}else{
J	L_SetupIOT42
NOP	
L_SetupIOT41:
;Sim800.c,203 :: 		" *Sim Not Registered\r\n");
LUI	R2, hi_addr(?lstr_11_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_11_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,202 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,203 :: 		" *Sim Not Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,205 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT43:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT43
NOP	
NOP	
NOP	
;Sim800.c,206 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,207 :: 		}
L_SetupIOT42:
;Sim800.c,208 :: 		}
L_SetupIOT40:
;Sim800.c,211 :: 		" *Sim Registered\r\n");
LUI	R2, hi_addr(?lstr_12_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_12_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,210 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,211 :: 		" *Sim Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,213 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,214 :: 		}
;Sim800.c,213 :: 		return 1;
;Sim800.c,214 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,221 :: 		char WaitForSetupSMS(unsigned int Indx){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;Sim800.c,227 :: 		UART2_Write_Text("AT+CMGF=1");
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SH	R25, 16(SP)
LUI	R25, hi_addr(?lstr13_Sim800+0)
ORI	R25, R25, lo_addr(?lstr13_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,228 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,229 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,232 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 16(SP)
;Sim800.c,233 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,235 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS45:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS45
NOP	
;Sim800.c,237 :: 		WaitForResponse(0);
SH	R25, 16(SP)
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 16(SP)
;Sim800.c,238 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS47:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS47
NOP	
;Sim800.c,239 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,241 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 16(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 84 (R21)
SEH	R21, R2
;Sim800.c,244 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_14_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_14_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,245 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 20
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
;Sim800.c,254 :: 		,txtA,string[0],string[1],
ADDIU	R3, SP, 20
;Sim800.c,256 :: 		string[4],string[5]);
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,255 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,254 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,253 :: 		" *string[5]  %s\r\n"
LUI	R2, hi_addr(?lstr_16_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_16_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,246 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,256 :: 		string[4],string[5]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
;Sim800.c,259 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 18(SP)
;Sim800.c,260 :: 		sprintf(sms,"%d",res);
ADDIU	R3, SP, 26
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_17_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_17_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,264 :: 		,sms);
ADDIU	R2, SP, 26
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,263 :: 		" *sms no:= %s\r\n"
LUI	R2, hi_addr(?lstr_18_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_18_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,262 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,264 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,268 :: 		UART2_Write_Text("AT+CMGR=");
LUI	R25, hi_addr(?lstr19_Sim800+0)
ORI	R25, R25, lo_addr(?lstr19_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,269 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 26
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,270 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,271 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,273 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 16(SP)
;Sim800.c,274 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS49:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS49
NOP	
;Sim800.c,275 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,276 :: 		str_rcv = setstr(SimTestTxt);
SH	R25, 16(SP)
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,277 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,279 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_20_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_20_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,289 :: 		,txtA,string[0],string[1],
ADDIU	R3, SP, 20
;Sim800.c,292 :: 		string[6]);
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
;Sim800.c,291 :: 		string[4],string[5],
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,290 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,289 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
SW	R3, 8(SP)
;Sim800.c,288 :: 		" *string[6]  %s\r\n"
LUI	R2, hi_addr(?lstr_21_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_21_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,280 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,292 :: 		string[6]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 40
LHU	R25, 16(SP)
;Sim800.c,295 :: 		if(Indx == 0){
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS142
NOP	
J	L_WaitForSetupSMS51
NOP	
L__WaitForSetupSMS142:
;Sim800.c,296 :: 		SF.SimFlashPtr = strlen(string[1])+1;
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+326)(GP)
;Sim800.c,297 :: 		memcpy(SF.SimFlashBuff,string[1],SF.SimFlashPtr);
ANDI	R27, R2, 65535
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+69)
ORI	R25, R25, lo_addr(_SF+69)
JAL	_memcpy+0
NOP	
;Sim800.c,298 :: 		strncpy(SF.SimCelNum,string[1],strlen(string[1])+1);
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
;Sim800.c,299 :: 		strncpy(SF.SimDate,string[3],strlen(string[3]));
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
;Sim800.c,300 :: 		strncpy(SF.SimTime,string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+26)
ORI	R25, R25, lo_addr(_SF+26)
JAL	_strncpy+0
NOP	
;Sim800.c,307 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
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
;Sim800.c,306 :: 		" * SF.SimTime: %s\r\n"
LUI	R2, hi_addr(?lstr_22_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_22_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,303 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,307 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
;Sim800.c,309 :: 		}else if(Indx == 1){
J	L_WaitForSetupSMS52
NOP	
L_WaitForSetupSMS51:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS143
NOP	
J	L_WaitForSetupSMS53
NOP	
L__WaitForSetupSMS143:
;Sim800.c,311 :: 		memcpy(SF.SimFlashBuff+SF.SimFlashPtr,string[5],strlen(string[5])+1);
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R4, R2, 1
LHU	R3, Offset(_SF+326)(GP)
LUI	R2, hi_addr(_SF+69)
ORI	R2, R2, lo_addr(_SF+69)
ADDU	R2, R2, R3
SEH	R27, R4
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,312 :: 		strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);
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
;Sim800.c,313 :: 		SF.SimFlashPtr += strlen(string[5])+1;
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
LHU	R2, Offset(_SF+326)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SF+326)(GP)
;Sim800.c,315 :: 		memcpy(SF.SimFlashBuff+SF.SimFlashPtr,string[6],strlen(string[6]));
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
LHU	R4, Offset(_SF+326)(GP)
LUI	R3, hi_addr(_SF+69)
ORI	R3, R3, lo_addr(_SF+69)
ADDU	R3, R3, R4
SEH	R27, R2
LUI	R26, hi_addr(_string+384)
ORI	R26, R26, lo_addr(_string+384)
MOVZ	R25, R3, R0
JAL	_memcpy+0
NOP	
;Sim800.c,316 :: 		strncpy(SF.ReadAPIKey,string[6],strlen(string[6])+1);
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
;Sim800.c,317 :: 		SF.SimFlashPtr += strlen(string[6])+1;
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R3, R2, 1
LHU	R2, Offset(_SF+326)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_SF+326)(GP)
;Sim800.c,322 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
LUI	R2, hi_addr(_SF+52)
ORI	R2, R2, lo_addr(_SF+52)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+35)
ORI	R2, R2, lo_addr(_SF+35)
SW	R2, 8(SP)
;Sim800.c,321 :: 		" * SF.ReadAPIKey:  %s\r\n"
LUI	R2, hi_addr(?lstr_23_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_23_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,319 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,322 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
;Sim800.c,325 :: 		for(i=0;i<SF.SimFlashPtr;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_WaitForSetupSMS54:
; i start address is: 16 (R4)
SEH	R3, R4
LHU	R2, Offset(_SF+326)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS144
NOP	
J	L_WaitForSetupSMS55
NOP	
L__WaitForSetupSMS144:
;Sim800.c,326 :: 		UART1_Write(SF.SimFlashBuff[i]);
SEH	R3, R4
LUI	R2, hi_addr(_SF+69)
ORI	R2, R2, lo_addr(_SF+69)
ADDU	R2, R2, R3
SH	R25, 16(SP)
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,327 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
LHU	R25, 16(SP)
;Sim800.c,325 :: 		for(i=0;i<SF.SimFlashPtr;i++){
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 8 (R2)
;Sim800.c,328 :: 		}
SEH	R4, R2
; i end address is: 8 (R2)
J	L_WaitForSetupSMS54
NOP	
L_WaitForSetupSMS55:
;Sim800.c,329 :: 		UART1_Write(0x0D);
SH	R25, 16(SP)
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,330 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
LHU	R25, 16(SP)
;Sim800.c,332 :: 		}
L_WaitForSetupSMS53:
L_WaitForSetupSMS52:
;Sim800.c,335 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS57:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS57
NOP	
NOP	
NOP	
;Sim800.c,336 :: 		do{
L_WaitForSetupSMS59:
;Sim800.c,337 :: 		UART2_Write_Text("AT+CMGD=");
SH	R25, 16(SP)
LUI	R25, hi_addr(?lstr24_Sim800+0)
ORI	R25, R25, lo_addr(?lstr24_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,338 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 26
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,339 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,340 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,343 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 16(SP)
;Sim800.c,344 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS62:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS62
NOP	
NOP	
NOP	
;Sim800.c,345 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,346 :: 		res--;
LH	R2, 18(SP)
ADDIU	R2, R2, -1
SH	R2, 18(SP)
;Sim800.c,347 :: 		sprintf(sms,"%d",res);
ADDIU	R3, SP, 26
SH	R25, 16(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_25_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_25_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LHU	R25, 16(SP)
;Sim800.c,348 :: 		}while(res > 0);
LH	R2, 18(SP)
SLTI	R2, R2, 1
BNE	R2, R0, L__WaitForSetupSMS145
NOP	
J	L_WaitForSetupSMS59
NOP	
L__WaitForSetupSMS145:
;Sim800.c,350 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
; str_rcv start address is: 84 (R21)
MOVZ	R21, R2, R0
;Sim800.c,351 :: 		res = strcmp(str_rcv,"OK,");
LUI	R26, hi_addr(?lstr26_Sim800+0)
ORI	R26, R26, lo_addr(?lstr26_Sim800+0)
MOVZ	R25, R2, R0
JAL	_strcmp+0
NOP	
SH	R2, 18(SP)
;Sim800.c,352 :: 		sprintf(txtA,"%d",res);
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_27_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_27_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,358 :: 		,SimTestTxt,str_rcv,txtA);
ADDIU	R2, SP, 20
ADDIU	SP, SP, -20
SW	R2, 16(SP)
SW	R21, 12(SP)
; str_rcv end address is: 84 (R21)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SW	R2, 8(SP)
;Sim800.c,357 :: 		" * res: %s\r\n"
LUI	R2, hi_addr(?lstr_28_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_28_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,354 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,358 :: 		,SimTestTxt,str_rcv,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
;Sim800.c,361 :: 		if(res == 0)
LH	R2, 18(SP)
BEQ	R2, R0, L__WaitForSetupSMS146
NOP	
J	L_WaitForSetupSMS64
NOP	
L__WaitForSetupSMS146:
;Sim800.c,362 :: 		return 3;
ORI	R2, R0, 3
J	L_end_WaitForSetupSMS
NOP	
L_WaitForSetupSMS64:
;Sim800.c,364 :: 		return 0;
MOVZ	R2, R0, R0
;Sim800.c,365 :: 		}
;Sim800.c,364 :: 		return 0;
;Sim800.c,365 :: 		}
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
;Sim800.c,370 :: 		char GetAPI_Key_SMS(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,375 :: 		UART2_Write_Text("AT+CMGS=");
SW	R25, 4(SP)
LUI	R25, hi_addr(?lstr29_Sim800+0)
ORI	R25, R25, lo_addr(?lstr29_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,376 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,377 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,378 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,381 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,382 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,383 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_GetAPI_Key_SMS66:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetAPI_Key_SMS66
NOP	
NOP	
NOP	
;Sim800.c,387 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,386 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_30_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_30_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,385 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,387 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,390 :: 		UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
LUI	R25, hi_addr(?lstr31_Sim800+0)
ORI	R25, R25, lo_addr(?lstr31_Sim800+0)
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
;Sim800.c,393 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,395 :: 		response = WaitForSetupSMS(0);
MOVZ	R25, R0, R0
JAL	_WaitForSetupSMS+0
NOP	
;Sim800.c,397 :: 		return response;
;Sim800.c,398 :: 		}
;Sim800.c,397 :: 		return response;
;Sim800.c,398 :: 		}
L_end_GetAPI_Key_SMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _GetAPI_Key_SMS
_SendSMS:
;Sim800.c,403 :: 		char SendSMS(char sms_type){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,406 :: 		UART2_Write_Text("AT+CNMI=2,2,0,0,0");
SW	R25, 4(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(?lstr32_Sim800+0)
ORI	R25, R25, lo_addr(?lstr32_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,407 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,408 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,409 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS68:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS68
NOP	
;Sim800.c,410 :: 		UART2_Write_Text("AT+CMGF=1");
LUI	R25, hi_addr(?lstr33_Sim800+0)
ORI	R25, R25, lo_addr(?lstr33_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,411 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,412 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,413 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS70:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS70
NOP	
;Sim800.c,414 :: 		UART2_Write_Text("AT+CMGS=\"+447946455348\"");
LUI	R25, hi_addr(?lstr34_Sim800+0)
ORI	R25, R25, lo_addr(?lstr34_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,415 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,416 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,417 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS72:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS72
NOP	
NOP	
NOP	
;Sim800.c,418 :: 		switch(sms_type){
J	L_SendSMS74
NOP	
;Sim800.c,419 :: 		case 0:
L_SendSMS76:
;Sim800.c,420 :: 		UART2_Write_Text("ERROR in setup Power down and start again!");
LUI	R25, hi_addr(?lstr35_Sim800+0)
ORI	R25, R25, lo_addr(?lstr35_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,421 :: 		break;
J	L_SendSMS75
NOP	
;Sim800.c,422 :: 		case 1:
L_SendSMS77:
;Sim800.c,423 :: 		UART2_Write_Text("Reply WebSite");
LUI	R25, hi_addr(?lstr36_Sim800+0)
ORI	R25, R25, lo_addr(?lstr36_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,424 :: 		break;
J	L_SendSMS75
NOP	
;Sim800.c,425 :: 		case 2:
L_SendSMS78:
;Sim800.c,426 :: 		UART2_Write_Text("Reply API Key");
LUI	R25, hi_addr(?lstr37_Sim800+0)
ORI	R25, R25, lo_addr(?lstr37_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,427 :: 		break;
J	L_SendSMS75
NOP	
;Sim800.c,428 :: 		case 3:
L_SendSMS79:
;Sim800.c,429 :: 		UART2_Write_Text("Setup Complete!");
LUI	R25, hi_addr(?lstr38_Sim800+0)
ORI	R25, R25, lo_addr(?lstr38_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,430 :: 		break;
J	L_SendSMS75
NOP	
;Sim800.c,431 :: 		default:
L_SendSMS80:
;Sim800.c,432 :: 		UART2_Write_Text("ERROR in setup Power down and start again!");
LUI	R25, hi_addr(?lstr39_Sim800+0)
ORI	R25, R25, lo_addr(?lstr39_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,433 :: 		break;
J	L_SendSMS75
NOP	
;Sim800.c,434 :: 		}
L_SendSMS74:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS150
NOP	
J	L_SendSMS76
NOP	
L__SendSMS150:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS152
NOP	
J	L_SendSMS77
NOP	
L__SendSMS152:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS154
NOP	
J	L_SendSMS78
NOP	
L__SendSMS154:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__SendSMS156
NOP	
J	L_SendSMS79
NOP	
L__SendSMS156:
J	L_SendSMS80
NOP	
L_SendSMS75:
;Sim800.c,435 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,436 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendSMS81:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS81
NOP	
NOP	
NOP	
;Sim800.c,437 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,438 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SendSMS83:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS83
NOP	
NOP	
NOP	
;Sim800.c,439 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr40_Sim800+0)
ORI	R25, R25, lo_addr(?lstr40_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,440 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,441 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,442 :: 		}
L_end_SendSMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _SendSMS
_Test_Update_ThingSpeak:
;Sim800.c,448 :: 		int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,456 :: 		if(s != sLast){
SW	R25, 4(SP)
ANDI	R3, R25, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak159
NOP	
J	L_Test_Update_ThingSpeak85
NOP	
L__Test_Update_ThingSpeak159:
;Sim800.c,457 :: 		sLast = s;
SB	R25, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
;Sim800.c,463 :: 		}
L_Test_Update_ThingSpeak85:
;Sim800.c,464 :: 		if(m != mLast){
ANDI	R3, R26, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak161
NOP	
J	L_Test_Update_ThingSpeak86
NOP	
L__Test_Update_ThingSpeak161:
;Sim800.c,465 :: 		mLast = m;
SB	R26, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
;Sim800.c,471 :: 		}
L_Test_Update_ThingSpeak86:
;Sim800.c,472 :: 		if(h != hLast){
ANDI	R3, R27, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak163
NOP	
J	L_Test_Update_ThingSpeak87
NOP	
L__Test_Update_ThingSpeak163:
;Sim800.c,473 :: 		hLast = h;
SB	R27, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
;Sim800.c,479 :: 		}
L_Test_Update_ThingSpeak87:
;Sim800.c,482 :: 		m > SimVars.time_to_log){
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_Update_ThingSpeak164
NOP	
J	L__Test_Update_ThingSpeak117
NOP	
L__Test_Update_ThingSpeak164:
ANDI	R3, R26, 65535
LHU	R2, Offset(_SimVars+2)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Test_Update_ThingSpeak165
NOP	
J	L__Test_Update_ThingSpeak116
NOP	
L__Test_Update_ThingSpeak165:
L__Test_Update_ThingSpeak115:
;Sim800.c,483 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,484 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,485 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Test_Update_ThingSpeak
NOP	
;Sim800.c,482 :: 		m > SimVars.time_to_log){
L__Test_Update_ThingSpeak117:
L__Test_Update_ThingSpeak116:
;Sim800.c,488 :: 		return -1;
ORI	R2, R0, 65535
;Sim800.c,489 :: 		}
;Sim800.c,488 :: 		return -1;
;Sim800.c,489 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,494 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;Sim800.c,500 :: 		sprintf(txtC,"%u",rgbc[0]);
SW	R25, 4(SP)
LHU	R2, 0(R25)
ADDIU	R3, SP, 12
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_41_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_41_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,501 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R3, SP, 27
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
;Sim800.c,502 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDIU	R3, SP, 42
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
;Sim800.c,503 :: 		sprintf(txtB,"%u",rgbc[3]);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R3, SP, 57
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_44_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_44_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,505 :: 		UART2_Write_Text("AT+CPIN?");
LUI	R25, hi_addr(?lstr45_Sim800+0)
ORI	R25, R25, lo_addr(?lstr45_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,506 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,507 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,508 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData91:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData91
NOP	
;Sim800.c,509 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr46_Sim800+0)
ORI	R25, R25, lo_addr(?lstr46_Sim800+0)
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
;Sim800.c,512 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData93:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData93
NOP	
;Sim800.c,513 :: 		UART2_Write_Text("AT+CGATT?");
LUI	R25, hi_addr(?lstr47_Sim800+0)
ORI	R25, R25, lo_addr(?lstr47_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,514 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,515 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,516 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData95:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData95
NOP	
;Sim800.c,517 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr48_Sim800+0)
ORI	R25, R25, lo_addr(?lstr48_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,518 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,519 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,520 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData97:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData97
NOP	
NOP	
;Sim800.c,521 :: 		UART2_Write_Text("AT+CIPSTATUS");
LUI	R25, hi_addr(?lstr49_Sim800+0)
ORI	R25, R25, lo_addr(?lstr49_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,522 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,523 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,524 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData99:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData99
NOP	
NOP	
;Sim800.c,525 :: 		UART2_Write_Text("AT+CIPMUX=0");
LUI	R25, hi_addr(?lstr50_Sim800+0)
ORI	R25, R25, lo_addr(?lstr50_Sim800+0)
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
L_SendData101:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData101
NOP	
;Sim800.c,529 :: 		UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
LUI	R25, hi_addr(?lstr51_Sim800+0)
ORI	R25, R25, lo_addr(?lstr51_Sim800+0)
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
;Sim800.c,532 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData103:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData103
NOP	
NOP	
;Sim800.c,533 :: 		UART2_Write_Text("AT+CIICR");
LUI	R25, hi_addr(?lstr52_Sim800+0)
ORI	R25, R25, lo_addr(?lstr52_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,534 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,535 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,536 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData105:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData105
NOP	
;Sim800.c,537 :: 		UART2_Write_Text("AT+CIFSR");
LUI	R25, hi_addr(?lstr53_Sim800+0)
ORI	R25, R25, lo_addr(?lstr53_Sim800+0)
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
;Sim800.c,540 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData107:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData107
NOP	
;Sim800.c,541 :: 		UART2_Write_Text("AT+CIPSPRT=1");
LUI	R25, hi_addr(?lstr54_Sim800+0)
ORI	R25, R25, lo_addr(?lstr54_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,542 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,543 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,544 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData109:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData109
NOP	
;Sim800.c,545 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
LUI	R25, hi_addr(?lstr55_Sim800+0)
ORI	R25, R25, lo_addr(?lstr55_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,546 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,547 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,548 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData111:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData111
NOP	
;Sim800.c,549 :: 		UART2_Write_Text("AT+CIPSEND");
LUI	R25, hi_addr(?lstr56_Sim800+0)
ORI	R25, R25, lo_addr(?lstr56_Sim800+0)
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
;Sim800.c,552 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData113:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData113
NOP	
;Sim800.c,553 :: 		UART2_Write_Text("GET https://api.thingspeak.com/update?api_key=W2NO15EASX7P7CDK&field1=");
LUI	R25, hi_addr(?lstr57_Sim800+0)
ORI	R25, R25, lo_addr(?lstr57_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,554 :: 		UART2_Write_Text(txtC);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,555 :: 		UART2_Write_Text("&field2=");
LUI	R25, hi_addr(?lstr58_Sim800+0)
ORI	R25, R25, lo_addr(?lstr58_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,556 :: 		UART2_Write_Text(txtR);
ADDIU	R2, SP, 27
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,557 :: 		UART2_Write_Text("&field3=");
LUI	R25, hi_addr(?lstr59_Sim800+0)
ORI	R25, R25, lo_addr(?lstr59_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,558 :: 		UART2_Write_Text(txtG);
ADDIU	R2, SP, 42
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,559 :: 		UART2_Write_Text("&field4=");
LUI	R25, hi_addr(?lstr60_Sim800+0)
ORI	R25, R25, lo_addr(?lstr60_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,560 :: 		UART2_Write_Text(txtB);
ADDIU	R2, SP, 57
MOVZ	R25, R2, R0
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
;Sim800.c,563 :: 		}
L_end_SendData:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 72
JR	RA
NOP	
; end of _SendData
