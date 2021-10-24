_InitGSM3:
;Sim800.c,28 :: 		void InitGSM3(){
;Sim800.c,29 :: 		SimVars.initial_str = 0;
SB	R0, Offset(_SimVars+0)(GP)
;Sim800.c,30 :: 		SimVars.init_inc    = 0;
SB	R0, Offset(_SimVars+6)(GP)
;Sim800.c,31 :: 		*SimTestTxt = "Hello World this is a test";
ORI	R2, R0, lo_addr(?lstr_1_Sim800+0)
ANDI	R2, R2, 255
SB	R2, Offset(_SimTestTxt+0)(GP)
;Sim800.c,32 :: 		RB.head = 0;
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,33 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
;Sim800.c,34 :: 		RB.rcv_txt_fin = -1;
ORI	R2, R0, 255
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,35 :: 		}
L_end_InitGSM3:
JR	RA
NOP	
; end of _InitGSM3
_RcvSimTxt:
;Sim800.c,40 :: 		void RcvSimTxt(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,42 :: 		while(UART2_Data_Ready()) {     // If data is received
L_RcvSimTxt0:
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__RcvSimTxt106
NOP	
J	L_RcvSimTxt1
NOP	
L__RcvSimTxt106:
;Sim800.c,43 :: 		U1TXREG = U2RXREG;
LW	R2, Offset(U2RXREG+0)(GP)
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,45 :: 		if(U2RXREG >= 0x20){
LW	R2, Offset(U2RXREG+0)(GP)
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt107
NOP	
J	L_RcvSimTxt2
NOP	
L__RcvSimTxt107:
;Sim800.c,46 :: 		RB.buff[RB.head] = U2RXREG;
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
LW	R2, Offset(U2RXREG+0)(GP)
SB	R2, 0(R3)
;Sim800.c,47 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,48 :: 		}else if(U2RXREG == 0x0A){
J	L_RcvSimTxt3
NOP	
L_RcvSimTxt2:
LW	R3, Offset(U2RXREG+0)(GP)
ORI	R2, R0, 10
BEQ	R3, R2, L__RcvSimTxt108
NOP	
J	L_RcvSimTxt4
NOP	
L__RcvSimTxt108:
;Sim800.c,49 :: 		RB.buff[RB.head] = ',';
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
ORI	R2, R0, 44
SB	R2, 0(R3)
;Sim800.c,50 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,51 :: 		}
L_RcvSimTxt4:
L_RcvSimTxt3:
;Sim800.c,53 :: 		if(RB.head > 999)
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RcvSimTxt109
NOP	
J	L_RcvSimTxt5
NOP	
L__RcvSimTxt109:
;Sim800.c,54 :: 		RB.head = 0;             //rest head when buffer is full
SH	R0, Offset(_RB+1002)(GP)
L_RcvSimTxt5:
;Sim800.c,56 :: 		}
J	L_RcvSimTxt0
NOP	
L_RcvSimTxt1:
;Sim800.c,57 :: 		RB.buff[RB.head] = U2RXREG;
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
LW	R2, Offset(U2RXREG+0)(GP)
SB	R2, 0(R3)
;Sim800.c,58 :: 		RB.rcv_txt_fin = 1;
ORI	R2, R0, 1
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,59 :: 		}
L_end_RcvSimTxt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RcvSimTxt
_PwrUpGSM3:
;Sim800.c,64 :: 		void PwrUpGSM3(){
;Sim800.c,65 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,66 :: 		PWR = 0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,67 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM36
NOP	
;Sim800.c,68 :: 		PWR = 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,70 :: 		while(STAT){
L_PwrUpGSM38:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrUpGSM3112
NOP	
J	L_PwrUpGSM39
NOP	
L__PwrUpGSM3112:
;Sim800.c,71 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,72 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM310:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM310
NOP	
;Sim800.c,73 :: 		}
J	L_PwrUpGSM38
NOP	
L_PwrUpGSM39:
;Sim800.c,74 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM312:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM312
NOP	
NOP	
NOP	
;Sim800.c,75 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_SetupIOT:
;Sim800.c,80 :: 		char SetupIOT(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,89 :: 		UART1_Write_Text("ATE0");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R25, hi_addr(?lstr2_Sim800+0)
ORI	R25, R25, lo_addr(?lstr2_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,90 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,91 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,93 :: 		RB.rcv_txt_fin = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,94 :: 		RB.last_head = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,95 :: 		do{
L_SetupIOT14:
;Sim800.c,96 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,97 :: 		UART2_Write_Text("ATE0");
LUI	R25, hi_addr(?lstr3_Sim800+0)
ORI	R25, R25, lo_addr(?lstr3_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,98 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,99 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,100 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SetupIOT17:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT17
NOP	
;Sim800.c,101 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__SetupIOT115
NOP	
J	L_SetupIOT14
NOP	
L__SetupIOT115:
;Sim800.c,102 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT19:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT19
NOP	
;Sim800.c,103 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,104 :: 		RB.tail = RB.last_tail;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,105 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT116
NOP	
J	L_SetupIOT21
NOP	
L__SetupIOT116:
; i end address is: 20 (R5)
;Sim800.c,106 :: 		while(RB.tail != RB.head){
L_SetupIOT22:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
BNE	R2, R3, L__SetupIOT118
NOP	
J	L_SetupIOT23
NOP	
L__SetupIOT118:
;Sim800.c,107 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,108 :: 		UART1_Write(SimTestTxt[i]);
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,109 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
;Sim800.c,110 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,111 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,112 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__SetupIOT119
NOP	
J	L_SetupIOT24
NOP	
L__SetupIOT119:
; ?FLOC___SetupIOT?T40 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___SetupIOT?T40 end address is: 8 (R2)
J	L_SetupIOT25
NOP	
L_SetupIOT24:
; ?FLOC___SetupIOT?T40 start address is: 8 (R2)
LHU	R2, Offset(_RB+1004)(GP)
; ?FLOC___SetupIOT?T40 end address is: 8 (R2)
L_SetupIOT25:
; ?FLOC___SetupIOT?T40 start address is: 8 (R2)
SH	R2, Offset(_RB+1004)(GP)
; ?FLOC___SetupIOT?T40 end address is: 8 (R2)
;Sim800.c,113 :: 		};
J	L_SetupIOT22
NOP	
L_SetupIOT23:
;Sim800.c,114 :: 		SimTestTxt[i] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,115 :: 		}
L_SetupIOT21:
;Sim800.c,116 :: 		RB.last_tail = RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,119 :: 		UART1_Write_Text("1st Result:= ");
LUI	R25, hi_addr(?lstr4_Sim800+0)
ORI	R25, R25, lo_addr(?lstr4_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,120 :: 		UART1_Write_Text(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,121 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,122 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,123 :: 		UART1_Write_Text("Check if Sim is Registered");
LUI	R25, hi_addr(?lstr5_Sim800+0)
ORI	R25, R25, lo_addr(?lstr5_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,124 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,125 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,127 :: 		wait:
___SetupIOT_wait:
;Sim800.c,129 :: 		RB.rcv_txt_fin   = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,130 :: 		RB.last_head     = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,131 :: 		do{
L_SetupIOT26:
;Sim800.c,132 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,133 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr6_Sim800+0)
ORI	R25, R25, lo_addr(?lstr6_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,134 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,135 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,136 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT29:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT29
NOP	
NOP	
NOP	
;Sim800.c,137 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__SetupIOT121
NOP	
J	L_SetupIOT26
NOP	
L__SetupIOT121:
;Sim800.c,138 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT31:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT31
NOP	
NOP	
NOP	
;Sim800.c,139 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,140 :: 		RB.tail = RB.last_tail++;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1008)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,141 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT122
NOP	
J	L_SetupIOT33
NOP	
L__SetupIOT122:
; i end address is: 20 (R5)
;Sim800.c,142 :: 		while(RB.tail != RB.head){
L_SetupIOT34:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
BNE	R2, R3, L__SetupIOT124
NOP	
J	L_SetupIOT35
NOP	
L__SetupIOT124:
;Sim800.c,143 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,144 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,145 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,146 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__SetupIOT125
NOP	
J	L_SetupIOT36
NOP	
L__SetupIOT125:
; ?FLOC___SetupIOT?T64 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___SetupIOT?T64 end address is: 8 (R2)
J	L_SetupIOT37
NOP	
L_SetupIOT36:
; ?FLOC___SetupIOT?T64 start address is: 8 (R2)
LHU	R2, Offset(_RB+1004)(GP)
; ?FLOC___SetupIOT?T64 end address is: 8 (R2)
L_SetupIOT37:
; ?FLOC___SetupIOT?T64 start address is: 8 (R2)
SH	R2, Offset(_RB+1004)(GP)
; ?FLOC___SetupIOT?T64 end address is: 8 (R2)
;Sim800.c,147 :: 		};
J	L_SetupIOT34
NOP	
L_SetupIOT35:
;Sim800.c,148 :: 		SimTestTxt[i] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,149 :: 		}
L_SetupIOT33:
;Sim800.c,150 :: 		RB.last_tail = RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,152 :: 		UART1_Write_Text("2n Result:= ");
LUI	R25, hi_addr(?lstr7_Sim800+0)
ORI	R25, R25, lo_addr(?lstr7_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,153 :: 		UART1_Write_Text(SimTestTxt);//string[0]);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,154 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,155 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,159 :: 		if(RB.head > RB.last_head){//(SimVars.num_of_sms_bytes > 0){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT126
NOP	
J	L_SetupIOT38
NOP	
L__SetupIOT126:
;Sim800.c,160 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,162 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
; num_strs start address is: 20 (R5)
SEH	R5, R2
;Sim800.c,165 :: 		UART1_Write_Text("string[3]");
LUI	R25, hi_addr(?lstr8_Sim800+0)
ORI	R25, R25, lo_addr(?lstr8_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,166 :: 		UART1_Write_Text(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,167 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,168 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,169 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SH	R5, 8(SP)
; num_strs end address is: 20 (R5)
LUI	R2, hi_addr(?lstr_9_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_9_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,170 :: 		UART1_Write_Text("num_strs:= ");
LUI	R25, hi_addr(?lstr10_Sim800+0)
ORI	R25, R25, lo_addr(?lstr10_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,171 :: 		UART1_Write_Text(txtA);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,172 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,173 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,176 :: 		res = atoi(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,177 :: 		if(res == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT127
NOP	
J	L_SetupIOT39
NOP	
L__SetupIOT127:
;Sim800.c,179 :: 		sprintf(txtA,"%d",res);
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SH	R4, 8(SP)
; res end address is: 16 (R4)
LUI	R2, hi_addr(?lstr_11_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_11_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,180 :: 		UART1_Write_Text("Registered with:= ");
LUI	R25, hi_addr(?lstr12_Sim800+0)
ORI	R25, R25, lo_addr(?lstr12_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,181 :: 		UART1_Write_Text(txtA);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,182 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,183 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,185 :: 		SimVars.init_inc = 0;
SB	R0, Offset(_SimVars+6)(GP)
;Sim800.c,186 :: 		}else{
J	L_SetupIOT40
NOP	
L_SetupIOT39:
;Sim800.c,188 :: 		UART1_Write_Text("Sim Not Registered");
LUI	R25, hi_addr(?lstr13_Sim800+0)
ORI	R25, R25, lo_addr(?lstr13_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,189 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,190 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,192 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT41:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT41
NOP	
NOP	
NOP	
;Sim800.c,193 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,194 :: 		}
L_SetupIOT40:
;Sim800.c,195 :: 		}
L_SetupIOT38:
;Sim800.c,197 :: 		UART1_Write_Text("Sim Registered");
LUI	R25, hi_addr(?lstr14_Sim800+0)
ORI	R25, R25, lo_addr(?lstr14_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,198 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,199 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,201 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,202 :: 		}
;Sim800.c,201 :: 		return 1;
;Sim800.c,202 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,209 :: 		char WaitForSetupSMS(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,214 :: 		RB.rcv_txt_fin = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,215 :: 		RB.last_head   = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,218 :: 		do{
L_WaitForSetupSMS43:
;Sim800.c,219 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,220 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_WaitForSetupSMS46:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS46
NOP	
NOP	
;Sim800.c,221 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForSetupSMS130
NOP	
J	L_WaitForSetupSMS43
NOP	
L__WaitForSetupSMS130:
;Sim800.c,222 :: 		clr_str_arrays(string);
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_clr_str_arrays+0
NOP	
;Sim800.c,223 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_WaitForSetupSMS48:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS48
NOP	
NOP	
NOP	
;Sim800.c,225 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,226 :: 		RB.tail = RB.last_tail++;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1008)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,227 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS131
NOP	
J	L_WaitForSetupSMS50
NOP	
L__WaitForSetupSMS131:
; i end address is: 20 (R5)
;Sim800.c,228 :: 		while(RB.tail != RB.head){
L_WaitForSetupSMS51:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
BNE	R2, R3, L__WaitForSetupSMS133
NOP	
J	L_WaitForSetupSMS52
NOP	
L__WaitForSetupSMS133:
;Sim800.c,229 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,230 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__WaitForSetupSMS134
NOP	
J	L_WaitForSetupSMS53
NOP	
L__WaitForSetupSMS134:
; ?FLOC___WaitForSetupSMS?T99 start address is: 24 (R6)
MOVZ	R6, R0, R0
; ?FLOC___WaitForSetupSMS?T99 end address is: 24 (R6)
J	L_WaitForSetupSMS54
NOP	
L_WaitForSetupSMS53:
; ?FLOC___WaitForSetupSMS?T99 start address is: 24 (R6)
LHU	R6, Offset(_RB+1004)(GP)
; ?FLOC___WaitForSetupSMS?T99 end address is: 24 (R6)
L_WaitForSetupSMS54:
; ?FLOC___WaitForSetupSMS?T99 start address is: 24 (R6)
SH	R6, Offset(_RB+1004)(GP)
;Sim800.c,231 :: 		SimTestTxt[i] = RB.buff[RB.tail];
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R4, R2, R3
ANDI	R3, R6, 65535
; ?FLOC___WaitForSetupSMS?T99 end address is: 24 (R6)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Sim800.c,232 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,233 :: 		};
J	L_WaitForSetupSMS51
NOP	
L_WaitForSetupSMS52:
;Sim800.c,234 :: 		SimTestTxt[i] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,235 :: 		}
L_WaitForSetupSMS50:
;Sim800.c,236 :: 		RB.last_tail = RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,237 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,239 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,242 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_15_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_15_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,243 :: 		UART1_Write_Text("num_strs:= ");
LUI	R25, hi_addr(?lstr16_Sim800+0)
ORI	R25, R25, lo_addr(?lstr16_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,244 :: 		UART1_Write_Text(txtA);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,245 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,246 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,247 :: 		UART1_Write_Text("string[0]");
LUI	R25, hi_addr(?lstr17_Sim800+0)
ORI	R25, R25, lo_addr(?lstr17_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,248 :: 		UART1_Write_Text(string[0]);
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,249 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,250 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,251 :: 		UART1_Write_Text("string[1]");
LUI	R25, hi_addr(?lstr18_Sim800+0)
ORI	R25, R25, lo_addr(?lstr18_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,252 :: 		UART1_Write_Text(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,253 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,254 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,255 :: 		UART1_Write_Text("string[2]");
LUI	R25, hi_addr(?lstr19_Sim800+0)
ORI	R25, R25, lo_addr(?lstr19_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,256 :: 		UART1_Write_Text(string[2]);
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,257 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,258 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,259 :: 		UART1_Write_Text("string[3]");
LUI	R25, hi_addr(?lstr20_Sim800+0)
ORI	R25, R25, lo_addr(?lstr20_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,260 :: 		UART1_Write_Text(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,261 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,262 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,265 :: 		return 2;
ORI	R2, R0, 2
;Sim800.c,266 :: 		}
;Sim800.c,265 :: 		return 2;
;Sim800.c,266 :: 		}
L_end_WaitForSetupSMS:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _WaitForSetupSMS
_Test_Update_ThingSpeak:
;Sim800.c,268 :: 		int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,276 :: 		if(s != sLast){
SW	R25, 4(SP)
ANDI	R3, R25, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak137
NOP	
J	L_Test_Update_ThingSpeak55
NOP	
L__Test_Update_ThingSpeak137:
;Sim800.c,277 :: 		sLast = s;
SB	R25, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
;Sim800.c,283 :: 		}
L_Test_Update_ThingSpeak55:
;Sim800.c,284 :: 		if(m != mLast){
ANDI	R3, R26, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak139
NOP	
J	L_Test_Update_ThingSpeak56
NOP	
L__Test_Update_ThingSpeak139:
;Sim800.c,285 :: 		mLast = m;
SB	R26, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
;Sim800.c,291 :: 		}
L_Test_Update_ThingSpeak56:
;Sim800.c,292 :: 		if(h != hLast){
ANDI	R3, R27, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak141
NOP	
J	L_Test_Update_ThingSpeak57
NOP	
L__Test_Update_ThingSpeak141:
;Sim800.c,293 :: 		hLast = h;
SB	R27, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
;Sim800.c,299 :: 		}
L_Test_Update_ThingSpeak57:
;Sim800.c,302 :: 		m > SimVars.time_to_log){
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_Update_ThingSpeak142
NOP	
J	L__Test_Update_ThingSpeak102
NOP	
L__Test_Update_ThingSpeak142:
ANDI	R3, R26, 65535
LHU	R2, Offset(_SimVars+2)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Test_Update_ThingSpeak143
NOP	
J	L__Test_Update_ThingSpeak101
NOP	
L__Test_Update_ThingSpeak143:
L__Test_Update_ThingSpeak100:
;Sim800.c,303 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,304 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,305 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Test_Update_ThingSpeak
NOP	
;Sim800.c,302 :: 		m > SimVars.time_to_log){
L__Test_Update_ThingSpeak102:
L__Test_Update_ThingSpeak101:
;Sim800.c,308 :: 		return -1;
ORI	R2, R0, 65535
;Sim800.c,309 :: 		}
;Sim800.c,308 :: 		return -1;
;Sim800.c,309 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,311 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;Sim800.c,317 :: 		sprintf(txtC,"%u",rgbc[0]);
SW	R25, 4(SP)
LHU	R2, 0(R25)
ADDIU	R3, SP, 12
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_21_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_21_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,318 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R3, SP, 27
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_22_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_22_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,319 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDIU	R3, SP, 42
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_23_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_23_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,320 :: 		sprintf(txtB,"%u",rgbc[3]);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R3, SP, 57
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_24_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_24_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,322 :: 		UART2_Write_Text("AT+CPIN?");
LUI	R25, hi_addr(?lstr25_Sim800+0)
ORI	R25, R25, lo_addr(?lstr25_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,323 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,324 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,325 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData61:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData61
NOP	
;Sim800.c,326 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr26_Sim800+0)
ORI	R25, R25, lo_addr(?lstr26_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,327 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,328 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,329 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData63:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData63
NOP	
;Sim800.c,330 :: 		UART2_Write_Text("AT+CGATT?");
LUI	R25, hi_addr(?lstr27_Sim800+0)
ORI	R25, R25, lo_addr(?lstr27_Sim800+0)
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
;Sim800.c,333 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData65:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData65
NOP	
;Sim800.c,334 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr28_Sim800+0)
ORI	R25, R25, lo_addr(?lstr28_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,335 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,336 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,337 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData67:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData67
NOP	
NOP	
;Sim800.c,338 :: 		UART2_Write_Text("AT+CIPSTATUS");
LUI	R25, hi_addr(?lstr29_Sim800+0)
ORI	R25, R25, lo_addr(?lstr29_Sim800+0)
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
;Sim800.c,341 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData69:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData69
NOP	
NOP	
;Sim800.c,342 :: 		UART2_Write_Text("AT+CIPMUX=0");
LUI	R25, hi_addr(?lstr30_Sim800+0)
ORI	R25, R25, lo_addr(?lstr30_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,343 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,344 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,345 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData71:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData71
NOP	
;Sim800.c,346 :: 		UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
LUI	R25, hi_addr(?lstr31_Sim800+0)
ORI	R25, R25, lo_addr(?lstr31_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,347 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,348 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,349 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData73:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData73
NOP	
NOP	
;Sim800.c,350 :: 		UART2_Write_Text("AT+CIICR");
LUI	R25, hi_addr(?lstr32_Sim800+0)
ORI	R25, R25, lo_addr(?lstr32_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,351 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,352 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,353 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData75:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData75
NOP	
;Sim800.c,354 :: 		UART2_Write_Text("AT+CIFSR");
LUI	R25, hi_addr(?lstr33_Sim800+0)
ORI	R25, R25, lo_addr(?lstr33_Sim800+0)
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
;Sim800.c,357 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData77:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData77
NOP	
;Sim800.c,358 :: 		UART2_Write_Text("AT+CIPSPRT=1");
LUI	R25, hi_addr(?lstr34_Sim800+0)
ORI	R25, R25, lo_addr(?lstr34_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,359 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,360 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,361 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData79:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData79
NOP	
;Sim800.c,362 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
LUI	R25, hi_addr(?lstr35_Sim800+0)
ORI	R25, R25, lo_addr(?lstr35_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,363 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,364 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,365 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData81:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData81
NOP	
;Sim800.c,366 :: 		UART2_Write_Text("AT+CIPSEND");
LUI	R25, hi_addr(?lstr36_Sim800+0)
ORI	R25, R25, lo_addr(?lstr36_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,367 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,368 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,369 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData83:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData83
NOP	
;Sim800.c,370 :: 		UART2_Write_Text("GET https://api.thingspeak.com/update?api_key=W2NO15EASX7P7CDK&field1=");
LUI	R25, hi_addr(?lstr37_Sim800+0)
ORI	R25, R25, lo_addr(?lstr37_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,371 :: 		UART2_Write_Text(txtC);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,372 :: 		UART2_Write_Text("&field2=");
LUI	R25, hi_addr(?lstr38_Sim800+0)
ORI	R25, R25, lo_addr(?lstr38_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,373 :: 		UART2_Write_Text(txtR);
ADDIU	R2, SP, 27
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,374 :: 		UART2_Write_Text("&field3=");
LUI	R25, hi_addr(?lstr39_Sim800+0)
ORI	R25, R25, lo_addr(?lstr39_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,375 :: 		UART2_Write_Text(txtG);
ADDIU	R2, SP, 42
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,376 :: 		UART2_Write_Text("&field4=");
LUI	R25, hi_addr(?lstr40_Sim800+0)
ORI	R25, R25, lo_addr(?lstr40_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,377 :: 		UART2_Write_Text(txtB);
ADDIU	R2, SP, 57
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,378 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,379 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,380 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendData85:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData85
NOP	
NOP	
NOP	
;Sim800.c,381 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,382 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SendData87:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData87
NOP	
NOP	
NOP	
;Sim800.c,383 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr41_Sim800+0)
ORI	R25, R25, lo_addr(?lstr41_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,384 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,385 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,386 :: 		}
L_end_SendData:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 72
JR	RA
NOP	
; end of _SendData
_SendSMS:
;Sim800.c,388 :: 		char SendSMS(char sms_type){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,391 :: 		UART2_Write_Text("AT+CNMI=2,2,0,0,0");
SW	R25, 4(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(?lstr42_Sim800+0)
ORI	R25, R25, lo_addr(?lstr42_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,392 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,393 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,394 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS89:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS89
NOP	
;Sim800.c,395 :: 		UART2_Write_Text("AT+CMGF=1");
LUI	R25, hi_addr(?lstr43_Sim800+0)
ORI	R25, R25, lo_addr(?lstr43_Sim800+0)
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
;Sim800.c,398 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS91:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS91
NOP	
;Sim800.c,399 :: 		UART2_Write_Text("AT+CMGS=\"+447946455348\"");
LUI	R25, hi_addr(?lstr44_Sim800+0)
ORI	R25, R25, lo_addr(?lstr44_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,400 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,401 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,402 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS93:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS93
NOP	
NOP	
NOP	
;Sim800.c,403 :: 		switch(sms_type){
J	L_SendSMS95
NOP	
;Sim800.c,404 :: 		case 0:
L_SendSMS97:
;Sim800.c,405 :: 		UART2_Write_Text("Reply Start");
LUI	R25, hi_addr(?lstr45_Sim800+0)
ORI	R25, R25, lo_addr(?lstr45_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,406 :: 		break;
J	L_SendSMS96
NOP	
;Sim800.c,407 :: 		case 1:
L_SendSMS98:
;Sim800.c,408 :: 		UART2_Write_Text("Reply WebSite");
LUI	R25, hi_addr(?lstr46_Sim800+0)
ORI	R25, R25, lo_addr(?lstr46_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,409 :: 		break;
J	L_SendSMS96
NOP	
;Sim800.c,410 :: 		case 2:
L_SendSMS99:
;Sim800.c,411 :: 		UART2_Write_Text("Reply API Key");
LUI	R25, hi_addr(?lstr47_Sim800+0)
ORI	R25, R25, lo_addr(?lstr47_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,412 :: 		break;
J	L_SendSMS96
NOP	
;Sim800.c,413 :: 		}
L_SendSMS95:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS147
NOP	
J	L_SendSMS97
NOP	
L__SendSMS147:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS149
NOP	
J	L_SendSMS98
NOP	
L__SendSMS149:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS151
NOP	
J	L_SendSMS99
NOP	
L__SendSMS151:
L_SendSMS96:
;Sim800.c,414 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
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
