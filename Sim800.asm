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
SH	R0, Offset(_SF+292)(GP)
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
BNE	R2, R0, L__RcvSimTxt142
NOP	
J	L_RcvSimTxt1
NOP	
L__RcvSimTxt142:
;Sim800.c,53 :: 		txt = U2RXREG;
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Sim800.c,54 :: 		U1TXREG = txt;
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,55 :: 		if(txt >= 0x20){
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt143
NOP	
J	L_RcvSimTxt2
NOP	
L__RcvSimTxt143:
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
BEQ	R3, R2, L__RcvSimTxt144
NOP	
J	L_RcvSimTxt4
NOP	
L__RcvSimTxt144:
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
BEQ	R2, R0, L__RcvSimTxt145
NOP	
J	L_RcvSimTxt5
NOP	
L__RcvSimTxt145:
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
BNE	R2, R0, L__PwrUpGSM3148
NOP	
J	L_PwrUpGSM39
NOP	
L__PwrUpGSM3148:
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
_SetupIOT:
;Sim800.c,89 :: 		char SetupIOT(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,98 :: 		UART1_Write_Text("ATE0");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R25, hi_addr(?lstr2_Sim800+0)
ORI	R25, R25, lo_addr(?lstr2_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,99 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,100 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,102 :: 		RB.rcv_txt_fin = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,103 :: 		RB.last_head = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,104 :: 		do{
L_SetupIOT14:
;Sim800.c,105 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,106 :: 		UART2_Write_Text("ATE0");
LUI	R25, hi_addr(?lstr3_Sim800+0)
ORI	R25, R25, lo_addr(?lstr3_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,107 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,108 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,109 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SetupIOT17:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT17
NOP	
;Sim800.c,110 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__SetupIOT151
NOP	
J	L_SetupIOT14
NOP	
L__SetupIOT151:
;Sim800.c,111 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT19:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT19
NOP	
;Sim800.c,112 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,113 :: 		RB.tail = RB.last_tail++;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1008)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,114 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT152
NOP	
J	L_SetupIOT21
NOP	
L__SetupIOT152:
; i end address is: 20 (R5)
;Sim800.c,115 :: 		while(RB.tail <= RB.head){
L_SetupIOT22:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__SetupIOT153
NOP	
J	L_SetupIOT23
NOP	
L__SetupIOT153:
;Sim800.c,116 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,117 :: 		UART1_Write(SimTestTxt[i]);
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,118 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
;Sim800.c,119 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,120 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,121 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__SetupIOT154
NOP	
J	L_SetupIOT24
NOP	
L__SetupIOT154:
; ?FLOC___SetupIOT?T38 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___SetupIOT?T38 end address is: 8 (R2)
J	L_SetupIOT25
NOP	
L_SetupIOT24:
; ?FLOC___SetupIOT?T38 start address is: 8 (R2)
LHU	R2, Offset(_RB+1004)(GP)
; ?FLOC___SetupIOT?T38 end address is: 8 (R2)
L_SetupIOT25:
; ?FLOC___SetupIOT?T38 start address is: 8 (R2)
SH	R2, Offset(_RB+1004)(GP)
; ?FLOC___SetupIOT?T38 end address is: 8 (R2)
;Sim800.c,122 :: 		};
J	L_SetupIOT22
NOP	
L_SetupIOT23:
;Sim800.c,123 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,124 :: 		}
L_SetupIOT21:
;Sim800.c,125 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,128 :: 		UART1_Write_Text("1st Result:= ");
LUI	R25, hi_addr(?lstr4_Sim800+0)
ORI	R25, R25, lo_addr(?lstr4_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,129 :: 		UART1_Write_Text(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,130 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,131 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,132 :: 		UART1_Write_Text("Check if Sim is Registered");
LUI	R25, hi_addr(?lstr5_Sim800+0)
ORI	R25, R25, lo_addr(?lstr5_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,133 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,134 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,136 :: 		wait:
___SetupIOT_wait:
;Sim800.c,138 :: 		RB.rcv_txt_fin   = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,139 :: 		RB.last_head     = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,140 :: 		do{
L_SetupIOT26:
;Sim800.c,141 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,142 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr6_Sim800+0)
ORI	R25, R25, lo_addr(?lstr6_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,143 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,144 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,145 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT29:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT29
NOP	
NOP	
NOP	
;Sim800.c,146 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__SetupIOT156
NOP	
J	L_SetupIOT26
NOP	
L__SetupIOT156:
;Sim800.c,147 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT31:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT31
NOP	
NOP	
NOP	
;Sim800.c,148 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,149 :: 		RB.tail = RB.last_tail++;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1008)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,150 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT157
NOP	
J	L_SetupIOT33
NOP	
L__SetupIOT157:
; i end address is: 20 (R5)
;Sim800.c,151 :: 		while(RB.tail <= RB.head){
L_SetupIOT34:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__SetupIOT158
NOP	
J	L_SetupIOT35
NOP	
L__SetupIOT158:
;Sim800.c,152 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,153 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,154 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,155 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__SetupIOT159
NOP	
J	L_SetupIOT36
NOP	
L__SetupIOT159:
; ?FLOC___SetupIOT?T62 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___SetupIOT?T62 end address is: 8 (R2)
J	L_SetupIOT37
NOP	
L_SetupIOT36:
; ?FLOC___SetupIOT?T62 start address is: 8 (R2)
LHU	R2, Offset(_RB+1004)(GP)
; ?FLOC___SetupIOT?T62 end address is: 8 (R2)
L_SetupIOT37:
; ?FLOC___SetupIOT?T62 start address is: 8 (R2)
SH	R2, Offset(_RB+1004)(GP)
; ?FLOC___SetupIOT?T62 end address is: 8 (R2)
;Sim800.c,156 :: 		};
J	L_SetupIOT34
NOP	
L_SetupIOT35:
;Sim800.c,157 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,158 :: 		}
L_SetupIOT33:
;Sim800.c,159 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,161 :: 		UART1_Write_Text("2n Result:= ");
LUI	R25, hi_addr(?lstr7_Sim800+0)
ORI	R25, R25, lo_addr(?lstr7_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,162 :: 		UART1_Write_Text(SimTestTxt);//string[0]);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,163 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,164 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,168 :: 		if(RB.head > RB.last_head){//(SimVars.num_of_sms_bytes > 0){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT160
NOP	
J	L_SetupIOT38
NOP	
L__SetupIOT160:
;Sim800.c,169 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,170 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,173 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,174 :: 		UART1_Write_Text("num_strs:= ");
LUI	R25, hi_addr(?lstr9_Sim800+0)
ORI	R25, R25, lo_addr(?lstr9_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,175 :: 		UART1_Write_Text(txtA);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,176 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,177 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,178 :: 		UART1_Write_Text("string[0]");
LUI	R25, hi_addr(?lstr10_Sim800+0)
ORI	R25, R25, lo_addr(?lstr10_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,179 :: 		UART1_Write_Text(string[0]);
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,180 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,181 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,182 :: 		UART1_Write_Text("string[1]");
LUI	R25, hi_addr(?lstr11_Sim800+0)
ORI	R25, R25, lo_addr(?lstr11_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,183 :: 		UART1_Write_Text(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,184 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,185 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,186 :: 		UART1_Write_Text("string[2]");
LUI	R25, hi_addr(?lstr12_Sim800+0)
ORI	R25, R25, lo_addr(?lstr12_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,187 :: 		UART1_Write_Text(string[2]);
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,188 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,189 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
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
BEQ	R3, R2, L__SetupIOT161
NOP	
J	L_SetupIOT39
NOP	
L__SetupIOT161:
;Sim800.c,195 :: 		sprintf(txtA,"%d",res);
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SH	R4, 8(SP)
; res end address is: 16 (R4)
LUI	R2, hi_addr(?lstr_13_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_13_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,196 :: 		UART1_Write_Text("Registered with:= ");
LUI	R25, hi_addr(?lstr14_Sim800+0)
ORI	R25, R25, lo_addr(?lstr14_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,197 :: 		UART1_Write_Text(txtA);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
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
;Sim800.c,202 :: 		}else{
J	L_SetupIOT40
NOP	
L_SetupIOT39:
;Sim800.c,204 :: 		UART1_Write_Text("Sim Not Registered");
LUI	R25, hi_addr(?lstr15_Sim800+0)
ORI	R25, R25, lo_addr(?lstr15_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,205 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,206 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,208 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT41:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT41
NOP	
NOP	
NOP	
;Sim800.c,209 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,210 :: 		}
L_SetupIOT40:
;Sim800.c,211 :: 		}
L_SetupIOT38:
;Sim800.c,213 :: 		UART1_Write_Text("Sim Registered");
LUI	R25, hi_addr(?lstr16_Sim800+0)
ORI	R25, R25, lo_addr(?lstr16_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,214 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,215 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,217 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,218 :: 		}
;Sim800.c,217 :: 		return 1;
;Sim800.c,218 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,225 :: 		char WaitForSetupSMS(){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Sim800.c,231 :: 		UART2_Write_Text("AT+CMGF=1");
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LUI	R25, hi_addr(?lstr17_Sim800+0)
ORI	R25, R25, lo_addr(?lstr17_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,232 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,233 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,236 :: 		RB.rcv_txt_fin = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,237 :: 		RB.last_head   = RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,238 :: 		do{
L_WaitForSetupSMS43:
;Sim800.c,239 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,240 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_WaitForSetupSMS46:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS46
NOP	
NOP	
;Sim800.c,241 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForSetupSMS164
NOP	
J	L_WaitForSetupSMS43
NOP	
L__WaitForSetupSMS164:
;Sim800.c,242 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,243 :: 		RB.tail = RB.last_tail++;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1008)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,244 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS165
NOP	
J	L_WaitForSetupSMS48
NOP	
L__WaitForSetupSMS165:
; i end address is: 20 (R5)
;Sim800.c,245 :: 		while(RB.tail <= RB.head){
L_WaitForSetupSMS49:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__WaitForSetupSMS166
NOP	
J	L_WaitForSetupSMS50
NOP	
L__WaitForSetupSMS166:
;Sim800.c,246 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__WaitForSetupSMS167
NOP	
J	L_WaitForSetupSMS51
NOP	
L__WaitForSetupSMS167:
; ?FLOC___WaitForSetupSMS?T101 start address is: 24 (R6)
MOVZ	R6, R0, R0
; ?FLOC___WaitForSetupSMS?T101 end address is: 24 (R6)
J	L_WaitForSetupSMS52
NOP	
L_WaitForSetupSMS51:
; ?FLOC___WaitForSetupSMS?T101 start address is: 24 (R6)
LHU	R6, Offset(_RB+1004)(GP)
; ?FLOC___WaitForSetupSMS?T101 end address is: 24 (R6)
L_WaitForSetupSMS52:
; ?FLOC___WaitForSetupSMS?T101 start address is: 24 (R6)
SH	R6, Offset(_RB+1004)(GP)
;Sim800.c,247 :: 		SimTestTxt[i] = RB.buff[RB.tail];
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R4, R2, R3
ANDI	R3, R6, 65535
; ?FLOC___WaitForSetupSMS?T101 end address is: 24 (R6)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Sim800.c,248 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,249 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,250 :: 		};
J	L_WaitForSetupSMS49
NOP	
L_WaitForSetupSMS50:
;Sim800.c,251 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,252 :: 		}
L_WaitForSetupSMS48:
;Sim800.c,253 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,255 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS53:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS53
NOP	
;Sim800.c,257 :: 		RB.rcv_txt_fin = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,258 :: 		RB.last_head   = RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,259 :: 		do{
L_WaitForSetupSMS55:
;Sim800.c,260 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,261 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_WaitForSetupSMS58:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS58
NOP	
NOP	
;Sim800.c,262 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForSetupSMS169
NOP	
J	L_WaitForSetupSMS55
NOP	
L__WaitForSetupSMS169:
;Sim800.c,263 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS60:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS60
NOP	
;Sim800.c,265 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,266 :: 		RB.tail = RB.last_tail++;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1008)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,267 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS170
NOP	
J	L_WaitForSetupSMS62
NOP	
L__WaitForSetupSMS170:
; i end address is: 20 (R5)
;Sim800.c,268 :: 		while(RB.tail <= RB.head){
L_WaitForSetupSMS63:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__WaitForSetupSMS171
NOP	
J	L_WaitForSetupSMS64
NOP	
L__WaitForSetupSMS171:
;Sim800.c,269 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__WaitForSetupSMS172
NOP	
J	L_WaitForSetupSMS65
NOP	
L__WaitForSetupSMS172:
; ?FLOC___WaitForSetupSMS?T122 start address is: 24 (R6)
MOVZ	R6, R0, R0
; ?FLOC___WaitForSetupSMS?T122 end address is: 24 (R6)
J	L_WaitForSetupSMS66
NOP	
L_WaitForSetupSMS65:
; ?FLOC___WaitForSetupSMS?T122 start address is: 24 (R6)
LHU	R6, Offset(_RB+1004)(GP)
; ?FLOC___WaitForSetupSMS?T122 end address is: 24 (R6)
L_WaitForSetupSMS66:
; ?FLOC___WaitForSetupSMS?T122 start address is: 24 (R6)
SH	R6, Offset(_RB+1004)(GP)
;Sim800.c,270 :: 		SimTestTxt[i] = RB.buff[RB.tail];
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R4, R2, R3
ANDI	R3, R6, 65535
; ?FLOC___WaitForSetupSMS?T122 end address is: 24 (R6)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Sim800.c,271 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,272 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,273 :: 		};
J	L_WaitForSetupSMS63
NOP	
L_WaitForSetupSMS64:
;Sim800.c,274 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,275 :: 		}
L_WaitForSetupSMS62:
;Sim800.c,276 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,279 :: 		num_strs = strsplit(SimTestTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
;Sim800.c,282 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_18_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_18_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,283 :: 		UART1_Write_Text("num_strs:= ");
LUI	R25, hi_addr(?lstr19_Sim800+0)
ORI	R25, R25, lo_addr(?lstr19_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,284 :: 		UART1_Write_Text(txtA);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,285 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,286 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,287 :: 		UART1_Write_Text("string[0]");
LUI	R25, hi_addr(?lstr20_Sim800+0)
ORI	R25, R25, lo_addr(?lstr20_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,288 :: 		UART1_Write_Text(string[0]);
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,289 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,290 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,291 :: 		UART1_Write_Text("string[1]");
LUI	R25, hi_addr(?lstr21_Sim800+0)
ORI	R25, R25, lo_addr(?lstr21_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,292 :: 		UART1_Write_Text(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,293 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,294 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,295 :: 		UART1_Write_Text("string[2]");
LUI	R25, hi_addr(?lstr22_Sim800+0)
ORI	R25, R25, lo_addr(?lstr22_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,296 :: 		UART1_Write_Text(string[2]);
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,297 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,298 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,299 :: 		UART1_Write_Text("string[3]");
LUI	R25, hi_addr(?lstr23_Sim800+0)
ORI	R25, R25, lo_addr(?lstr23_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,300 :: 		UART1_Write_Text(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,301 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,302 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,306 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
;Sim800.c,307 :: 		sprintf(sms,"%d",res);
ADDIU	R3, SP, 22
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_24_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_24_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,308 :: 		UART1_Write_Text("res= ");
LUI	R25, hi_addr(?lstr25_Sim800+0)
ORI	R25, R25, lo_addr(?lstr25_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,309 :: 		UART1_Write_Text(sms);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,312 :: 		UART2_Write_Text("AT+CMGR=");
LUI	R25, hi_addr(?lstr26_Sim800+0)
ORI	R25, R25, lo_addr(?lstr26_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,313 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,314 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,315 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,317 :: 		RB.rcv_txt_fin = 0; //reset bit and wait for response
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,318 :: 		RB.last_head   = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,319 :: 		do{
L_WaitForSetupSMS67:
;Sim800.c,320 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,321 :: 		Delay_ms(350);
LUI	R24, 142
ORI	R24, R24, 27220
L_WaitForSetupSMS70:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS70
NOP	
NOP	
NOP	
;Sim800.c,322 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForSetupSMS174
NOP	
J	L_WaitForSetupSMS67
NOP	
L__WaitForSetupSMS174:
;Sim800.c,323 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS72:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS72
NOP	
NOP	
NOP	
;Sim800.c,324 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,325 :: 		RB.tail = RB.last_tail;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,326 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS175
NOP	
J	L_WaitForSetupSMS74
NOP	
L__WaitForSetupSMS175:
; i end address is: 20 (R5)
;Sim800.c,327 :: 		while(RB.tail <= RB.head){
L_WaitForSetupSMS75:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__WaitForSetupSMS176
NOP	
J	L_WaitForSetupSMS76
NOP	
L__WaitForSetupSMS176:
;Sim800.c,328 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__WaitForSetupSMS177
NOP	
J	L_WaitForSetupSMS77
NOP	
L__WaitForSetupSMS177:
; ?FLOC___WaitForSetupSMS?T166 start address is: 24 (R6)
MOVZ	R6, R0, R0
; ?FLOC___WaitForSetupSMS?T166 end address is: 24 (R6)
J	L_WaitForSetupSMS78
NOP	
L_WaitForSetupSMS77:
; ?FLOC___WaitForSetupSMS?T166 start address is: 24 (R6)
LHU	R6, Offset(_RB+1004)(GP)
; ?FLOC___WaitForSetupSMS?T166 end address is: 24 (R6)
L_WaitForSetupSMS78:
; ?FLOC___WaitForSetupSMS?T166 start address is: 24 (R6)
SH	R6, Offset(_RB+1004)(GP)
;Sim800.c,329 :: 		SimTestTxt[i] = RB.buff[RB.tail];
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R4, R2, R3
ANDI	R3, R6, 65535
; ?FLOC___WaitForSetupSMS?T166 end address is: 24 (R6)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Sim800.c,330 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,331 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,332 :: 		};
J	L_WaitForSetupSMS75
NOP	
L_WaitForSetupSMS76:
;Sim800.c,333 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,334 :: 		}
L_WaitForSetupSMS74:
;Sim800.c,335 :: 		RB.last_tail = RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,336 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,337 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,339 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 16
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_27_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_27_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,340 :: 		UART1_Write_Text("num_strs:= ");
LUI	R25, hi_addr(?lstr28_Sim800+0)
ORI	R25, R25, lo_addr(?lstr28_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,341 :: 		UART1_Write_Text(txtA);
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,342 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,343 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,344 :: 		UART1_Write_Text("string[0]");
LUI	R25, hi_addr(?lstr29_Sim800+0)
ORI	R25, R25, lo_addr(?lstr29_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,345 :: 		UART1_Write_Text(string[0]);
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,346 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,347 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,348 :: 		UART1_Write_Text("string[1]");
LUI	R25, hi_addr(?lstr30_Sim800+0)
ORI	R25, R25, lo_addr(?lstr30_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,349 :: 		UART1_Write_Text(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,350 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,351 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,352 :: 		UART1_Write_Text("string[2]");
LUI	R25, hi_addr(?lstr31_Sim800+0)
ORI	R25, R25, lo_addr(?lstr31_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,353 :: 		UART1_Write_Text(string[2]);
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,354 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,355 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,356 :: 		UART1_Write_Text("string[3]");
LUI	R25, hi_addr(?lstr32_Sim800+0)
ORI	R25, R25, lo_addr(?lstr32_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,357 :: 		UART1_Write_Text(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,358 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,359 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,360 :: 		UART1_Write_Text("string[4]");
LUI	R25, hi_addr(?lstr33_Sim800+0)
ORI	R25, R25, lo_addr(?lstr33_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,361 :: 		UART1_Write_Text(string[4]);
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,362 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,363 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,367 :: 		SF.SimFlashPtr = strlen(string[1])+1;
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+292)(GP)
;Sim800.c,368 :: 		memcpy(SF.SimFlashBuff,string[1],SF.SimFlashPtr);
ANDI	R27, R2, 65535
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+35)
ORI	R25, R25, lo_addr(_SF+35)
JAL	_memcpy+0
NOP	
;Sim800.c,369 :: 		strncpy(SF.SimCelNum,string[1],strlen(string[1])+1);
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
;Sim800.c,370 :: 		strncpy(SF.SimDate,string[3]+1,strlen(string[3]));
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
;Sim800.c,371 :: 		strncpy(SF.SimTime,string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+26)
ORI	R25, R25, lo_addr(_SF+26)
JAL	_strncpy+0
NOP	
;Sim800.c,372 :: 		SF.SimFlashPtr++;
LHU	R2, Offset(_SF+292)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+292)(GP)
;Sim800.c,380 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
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
;Sim800.c,379 :: 		" * SF.SimTime: %s\r\n"
LUI	R2, hi_addr(?lstr_34_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_34_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,376 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,380 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
;Sim800.c,384 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS79:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS79
NOP	
;Sim800.c,385 :: 		UART2_Write_Text("AT+CMGD=");
LUI	R25, hi_addr(?lstr35_Sim800+0)
ORI	R25, R25, lo_addr(?lstr35_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,386 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
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
;Sim800.c,391 :: 		RB.rcv_txt_fin = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,392 :: 		RB.last_head   = RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,393 :: 		do{
L_WaitForSetupSMS81:
;Sim800.c,394 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,395 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_WaitForSetupSMS84:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS84
NOP	
NOP	
;Sim800.c,396 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForSetupSMS179
NOP	
J	L_WaitForSetupSMS81
NOP	
L__WaitForSetupSMS179:
;Sim800.c,397 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,398 :: 		RB.tail = RB.last_tail++;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1008)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,399 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS180
NOP	
J	L_WaitForSetupSMS86
NOP	
L__WaitForSetupSMS180:
; i end address is: 20 (R5)
;Sim800.c,400 :: 		while(RB.tail <= RB.head){
L_WaitForSetupSMS87:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__WaitForSetupSMS181
NOP	
J	L_WaitForSetupSMS88
NOP	
L__WaitForSetupSMS181:
;Sim800.c,401 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__WaitForSetupSMS182
NOP	
J	L_WaitForSetupSMS89
NOP	
L__WaitForSetupSMS182:
; ?FLOC___WaitForSetupSMS?T236 start address is: 24 (R6)
MOVZ	R6, R0, R0
; ?FLOC___WaitForSetupSMS?T236 end address is: 24 (R6)
J	L_WaitForSetupSMS90
NOP	
L_WaitForSetupSMS89:
; ?FLOC___WaitForSetupSMS?T236 start address is: 24 (R6)
LHU	R6, Offset(_RB+1004)(GP)
; ?FLOC___WaitForSetupSMS?T236 end address is: 24 (R6)
L_WaitForSetupSMS90:
; ?FLOC___WaitForSetupSMS?T236 start address is: 24 (R6)
SH	R6, Offset(_RB+1004)(GP)
;Sim800.c,402 :: 		SimTestTxt[i] = RB.buff[RB.tail];
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R4, R2, R3
ANDI	R3, R6, 65535
; ?FLOC___WaitForSetupSMS?T236 end address is: 24 (R6)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Sim800.c,403 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,404 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,405 :: 		};
J	L_WaitForSetupSMS87
NOP	
L_WaitForSetupSMS88:
;Sim800.c,406 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,407 :: 		}
L_WaitForSetupSMS86:
;Sim800.c,408 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,409 :: 		return 2;
ORI	R2, R0, 2
;Sim800.c,410 :: 		}
;Sim800.c,409 :: 		return 2;
;Sim800.c,410 :: 		}
L_end_WaitForSetupSMS:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _WaitForSetupSMS
_SendResponseSMS:
;Sim800.c,415 :: 		char SendResponseSMS(){
;Sim800.c,417 :: 		return 3;
ORI	R2, R0, 3
;Sim800.c,418 :: 		}
L_end_SendResponseSMS:
JR	RA
NOP	
; end of _SendResponseSMS
_Test_Update_ThingSpeak:
;Sim800.c,423 :: 		int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,431 :: 		if(s != sLast){
SW	R25, 4(SP)
ANDI	R3, R25, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak186
NOP	
J	L_Test_Update_ThingSpeak91
NOP	
L__Test_Update_ThingSpeak186:
;Sim800.c,432 :: 		sLast = s;
SB	R25, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
;Sim800.c,438 :: 		}
L_Test_Update_ThingSpeak91:
;Sim800.c,439 :: 		if(m != mLast){
ANDI	R3, R26, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak188
NOP	
J	L_Test_Update_ThingSpeak92
NOP	
L__Test_Update_ThingSpeak188:
;Sim800.c,440 :: 		mLast = m;
SB	R26, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
;Sim800.c,446 :: 		}
L_Test_Update_ThingSpeak92:
;Sim800.c,447 :: 		if(h != hLast){
ANDI	R3, R27, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak190
NOP	
J	L_Test_Update_ThingSpeak93
NOP	
L__Test_Update_ThingSpeak190:
;Sim800.c,448 :: 		hLast = h;
SB	R27, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
;Sim800.c,454 :: 		}
L_Test_Update_ThingSpeak93:
;Sim800.c,457 :: 		m > SimVars.time_to_log){
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_Update_ThingSpeak191
NOP	
J	L__Test_Update_ThingSpeak138
NOP	
L__Test_Update_ThingSpeak191:
ANDI	R3, R26, 65535
LHU	R2, Offset(_SimVars+2)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Test_Update_ThingSpeak192
NOP	
J	L__Test_Update_ThingSpeak137
NOP	
L__Test_Update_ThingSpeak192:
L__Test_Update_ThingSpeak136:
;Sim800.c,458 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,459 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,460 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Test_Update_ThingSpeak
NOP	
;Sim800.c,457 :: 		m > SimVars.time_to_log){
L__Test_Update_ThingSpeak138:
L__Test_Update_ThingSpeak137:
;Sim800.c,463 :: 		return -1;
ORI	R2, R0, 65535
;Sim800.c,464 :: 		}
;Sim800.c,463 :: 		return -1;
;Sim800.c,464 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,466 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;Sim800.c,472 :: 		sprintf(txtC,"%u",rgbc[0]);
SW	R25, 4(SP)
LHU	R2, 0(R25)
ADDIU	R3, SP, 12
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
;Sim800.c,473 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R3, SP, 27
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
;Sim800.c,474 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDIU	R3, SP, 42
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_38_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_38_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,475 :: 		sprintf(txtB,"%u",rgbc[3]);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R3, SP, 57
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_39_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_39_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,477 :: 		UART2_Write_Text("AT+CPIN?");
LUI	R25, hi_addr(?lstr40_Sim800+0)
ORI	R25, R25, lo_addr(?lstr40_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,478 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,479 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,480 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData97:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData97
NOP	
;Sim800.c,481 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr41_Sim800+0)
ORI	R25, R25, lo_addr(?lstr41_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,482 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,483 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,484 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData99:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData99
NOP	
;Sim800.c,485 :: 		UART2_Write_Text("AT+CGATT?");
LUI	R25, hi_addr(?lstr42_Sim800+0)
ORI	R25, R25, lo_addr(?lstr42_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,486 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,487 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,488 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData101:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData101
NOP	
;Sim800.c,489 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr43_Sim800+0)
ORI	R25, R25, lo_addr(?lstr43_Sim800+0)
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
;Sim800.c,492 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData103:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData103
NOP	
NOP	
;Sim800.c,493 :: 		UART2_Write_Text("AT+CIPSTATUS");
LUI	R25, hi_addr(?lstr44_Sim800+0)
ORI	R25, R25, lo_addr(?lstr44_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,494 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,495 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,496 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData105:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData105
NOP	
NOP	
;Sim800.c,497 :: 		UART2_Write_Text("AT+CIPMUX=0");
LUI	R25, hi_addr(?lstr45_Sim800+0)
ORI	R25, R25, lo_addr(?lstr45_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,498 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,499 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,500 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData107:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData107
NOP	
;Sim800.c,501 :: 		UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
LUI	R25, hi_addr(?lstr46_Sim800+0)
ORI	R25, R25, lo_addr(?lstr46_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,502 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,503 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,504 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData109:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData109
NOP	
NOP	
;Sim800.c,505 :: 		UART2_Write_Text("AT+CIICR");
LUI	R25, hi_addr(?lstr47_Sim800+0)
ORI	R25, R25, lo_addr(?lstr47_Sim800+0)
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
;Sim800.c,508 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData111:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData111
NOP	
;Sim800.c,509 :: 		UART2_Write_Text("AT+CIFSR");
LUI	R25, hi_addr(?lstr48_Sim800+0)
ORI	R25, R25, lo_addr(?lstr48_Sim800+0)
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
L_SendData113:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData113
NOP	
;Sim800.c,513 :: 		UART2_Write_Text("AT+CIPSPRT=1");
LUI	R25, hi_addr(?lstr49_Sim800+0)
ORI	R25, R25, lo_addr(?lstr49_Sim800+0)
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
L_SendData115:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData115
NOP	
;Sim800.c,517 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
LUI	R25, hi_addr(?lstr50_Sim800+0)
ORI	R25, R25, lo_addr(?lstr50_Sim800+0)
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
;Sim800.c,520 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData117:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData117
NOP	
;Sim800.c,521 :: 		UART2_Write_Text("AT+CIPSEND");
LUI	R25, hi_addr(?lstr51_Sim800+0)
ORI	R25, R25, lo_addr(?lstr51_Sim800+0)
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
;Sim800.c,524 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData119:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData119
NOP	
;Sim800.c,525 :: 		UART2_Write_Text("GET https://api.thingspeak.com/update?api_key=W2NO15EASX7P7CDK&field1=");
LUI	R25, hi_addr(?lstr52_Sim800+0)
ORI	R25, R25, lo_addr(?lstr52_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,526 :: 		UART2_Write_Text(txtC);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,527 :: 		UART2_Write_Text("&field2=");
LUI	R25, hi_addr(?lstr53_Sim800+0)
ORI	R25, R25, lo_addr(?lstr53_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,528 :: 		UART2_Write_Text(txtR);
ADDIU	R2, SP, 27
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,529 :: 		UART2_Write_Text("&field3=");
LUI	R25, hi_addr(?lstr54_Sim800+0)
ORI	R25, R25, lo_addr(?lstr54_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,530 :: 		UART2_Write_Text(txtG);
ADDIU	R2, SP, 42
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,531 :: 		UART2_Write_Text("&field4=");
LUI	R25, hi_addr(?lstr55_Sim800+0)
ORI	R25, R25, lo_addr(?lstr55_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,532 :: 		UART2_Write_Text(txtB);
ADDIU	R2, SP, 57
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
;Sim800.c,535 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendData121:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData121
NOP	
NOP	
NOP	
;Sim800.c,536 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,537 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SendData123:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData123
NOP	
NOP	
NOP	
;Sim800.c,538 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr56_Sim800+0)
ORI	R25, R25, lo_addr(?lstr56_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,539 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,540 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,541 :: 		}
L_end_SendData:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 72
JR	RA
NOP	
; end of _SendData
_SendSMS:
;Sim800.c,543 :: 		char SendSMS(char sms_type){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,546 :: 		UART2_Write_Text("AT+CNMI=2,2,0,0,0");
SW	R25, 4(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(?lstr57_Sim800+0)
ORI	R25, R25, lo_addr(?lstr57_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,547 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,548 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,549 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS125:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS125
NOP	
;Sim800.c,550 :: 		UART2_Write_Text("AT+CMGF=1");
LUI	R25, hi_addr(?lstr58_Sim800+0)
ORI	R25, R25, lo_addr(?lstr58_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,551 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,552 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,553 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS127:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS127
NOP	
;Sim800.c,554 :: 		UART2_Write_Text("AT+CMGS=\"+447946455348\"");
LUI	R25, hi_addr(?lstr59_Sim800+0)
ORI	R25, R25, lo_addr(?lstr59_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,555 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,556 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,557 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS129:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS129
NOP	
NOP	
NOP	
;Sim800.c,558 :: 		switch(sms_type){
J	L_SendSMS131
NOP	
;Sim800.c,559 :: 		case 0:
L_SendSMS133:
;Sim800.c,560 :: 		UART2_Write_Text("Reply Start");
LUI	R25, hi_addr(?lstr60_Sim800+0)
ORI	R25, R25, lo_addr(?lstr60_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,561 :: 		break;
J	L_SendSMS132
NOP	
;Sim800.c,562 :: 		case 1:
L_SendSMS134:
;Sim800.c,563 :: 		UART2_Write_Text("Reply WebSite");
LUI	R25, hi_addr(?lstr61_Sim800+0)
ORI	R25, R25, lo_addr(?lstr61_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,564 :: 		break;
J	L_SendSMS132
NOP	
;Sim800.c,565 :: 		case 2:
L_SendSMS135:
;Sim800.c,566 :: 		UART2_Write_Text("Reply API Key");
LUI	R25, hi_addr(?lstr62_Sim800+0)
ORI	R25, R25, lo_addr(?lstr62_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,567 :: 		break;
J	L_SendSMS132
NOP	
;Sim800.c,568 :: 		}
L_SendSMS131:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS196
NOP	
J	L_SendSMS133
NOP	
L__SendSMS196:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS198
NOP	
J	L_SendSMS134
NOP	
L__SendSMS198:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS200
NOP	
J	L_SendSMS135
NOP	
L__SendSMS200:
L_SendSMS132:
;Sim800.c,569 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,571 :: 		}
L_end_SendSMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _SendSMS
