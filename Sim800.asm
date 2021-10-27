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
BNE	R2, R0, L__RcvSimTxt155
NOP	
J	L_RcvSimTxt1
NOP	
L__RcvSimTxt155:
;Sim800.c,53 :: 		txt = U2RXREG;
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Sim800.c,54 :: 		U1TXREG = txt;
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,55 :: 		if(txt >= 0x20){
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt156
NOP	
J	L_RcvSimTxt2
NOP	
L__RcvSimTxt156:
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
BEQ	R3, R2, L__RcvSimTxt157
NOP	
J	L_RcvSimTxt4
NOP	
L__RcvSimTxt157:
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
BEQ	R2, R0, L__RcvSimTxt158
NOP	
J	L_RcvSimTxt5
NOP	
L__RcvSimTxt158:
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
BNE	R2, R0, L__PwrUpGSM3161
NOP	
J	L_PwrUpGSM39
NOP	
L__PwrUpGSM3161:
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
;Sim800.c,94 :: 		char SetupIOT(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,103 :: 		UART1_Write_Text("ATE0");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R25, hi_addr(?lstr2_Sim800+0)
ORI	R25, R25, lo_addr(?lstr2_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,104 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,105 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,107 :: 		RB.rcv_txt_fin = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,108 :: 		RB.last_head = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,109 :: 		do{
L_SetupIOT14:
;Sim800.c,110 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,111 :: 		UART2_Write_Text("ATE0");
LUI	R25, hi_addr(?lstr3_Sim800+0)
ORI	R25, R25, lo_addr(?lstr3_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,112 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,113 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,114 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SetupIOT17:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT17
NOP	
;Sim800.c,115 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__SetupIOT164
NOP	
J	L_SetupIOT14
NOP	
L__SetupIOT164:
;Sim800.c,116 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT19:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT19
NOP	
;Sim800.c,117 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,118 :: 		RB.tail = RB.last_tail++;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1008)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,119 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT165
NOP	
J	L_SetupIOT21
NOP	
L__SetupIOT165:
; i end address is: 20 (R5)
;Sim800.c,120 :: 		while(RB.tail <= RB.head){
L_SetupIOT22:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__SetupIOT166
NOP	
J	L_SetupIOT23
NOP	
L__SetupIOT166:
;Sim800.c,121 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,122 :: 		UART1_Write(SimTestTxt[i]);
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,123 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
;Sim800.c,124 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,125 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,126 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__SetupIOT167
NOP	
J	L_SetupIOT24
NOP	
L__SetupIOT167:
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
;Sim800.c,127 :: 		};
J	L_SetupIOT22
NOP	
L_SetupIOT23:
;Sim800.c,128 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,129 :: 		}
L_SetupIOT21:
;Sim800.c,130 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,133 :: 		UART1_Write_Text("1st Result:= ");
LUI	R25, hi_addr(?lstr4_Sim800+0)
ORI	R25, R25, lo_addr(?lstr4_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,134 :: 		UART1_Write_Text(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,135 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,136 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,137 :: 		UART1_Write_Text("Check if Sim is Registered");
LUI	R25, hi_addr(?lstr5_Sim800+0)
ORI	R25, R25, lo_addr(?lstr5_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,138 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,139 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,141 :: 		wait:
___SetupIOT_wait:
;Sim800.c,143 :: 		RB.rcv_txt_fin   = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,144 :: 		RB.last_head     = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,145 :: 		do{
L_SetupIOT26:
;Sim800.c,146 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,147 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr6_Sim800+0)
ORI	R25, R25, lo_addr(?lstr6_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,148 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,149 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,150 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT29:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT29
NOP	
NOP	
NOP	
;Sim800.c,151 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__SetupIOT169
NOP	
J	L_SetupIOT26
NOP	
L__SetupIOT169:
;Sim800.c,152 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT31:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT31
NOP	
NOP	
NOP	
;Sim800.c,153 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,154 :: 		RB.tail = RB.last_tail++;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1008)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,155 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT170
NOP	
J	L_SetupIOT33
NOP	
L__SetupIOT170:
; i end address is: 20 (R5)
;Sim800.c,156 :: 		while(RB.tail <= RB.head){
L_SetupIOT34:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__SetupIOT171
NOP	
J	L_SetupIOT35
NOP	
L__SetupIOT171:
;Sim800.c,157 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,158 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,159 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,160 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__SetupIOT172
NOP	
J	L_SetupIOT36
NOP	
L__SetupIOT172:
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
;Sim800.c,161 :: 		};
J	L_SetupIOT34
NOP	
L_SetupIOT35:
;Sim800.c,162 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,163 :: 		}
L_SetupIOT33:
;Sim800.c,164 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,166 :: 		UART1_Write_Text("2n Result:= ");
LUI	R25, hi_addr(?lstr7_Sim800+0)
ORI	R25, R25, lo_addr(?lstr7_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,167 :: 		UART1_Write_Text(SimTestTxt);//string[0]);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,168 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,169 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,173 :: 		if(RB.head > RB.last_head){//(SimVars.num_of_sms_bytes > 0){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT173
NOP	
J	L_SetupIOT38
NOP	
L__SetupIOT173:
;Sim800.c,174 :: 		str_rcv = setstr(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,175 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,178 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,179 :: 		UART1_Write_Text("num_strs:= ");
LUI	R25, hi_addr(?lstr9_Sim800+0)
ORI	R25, R25, lo_addr(?lstr9_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,180 :: 		UART1_Write_Text(txtA);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,181 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,182 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,183 :: 		UART1_Write_Text("string[0]");
LUI	R25, hi_addr(?lstr10_Sim800+0)
ORI	R25, R25, lo_addr(?lstr10_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,184 :: 		UART1_Write_Text(string[0]);
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,185 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,186 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,187 :: 		UART1_Write_Text("string[1]");
LUI	R25, hi_addr(?lstr11_Sim800+0)
ORI	R25, R25, lo_addr(?lstr11_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,188 :: 		UART1_Write_Text(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
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
;Sim800.c,191 :: 		UART1_Write_Text("string[2]");
LUI	R25, hi_addr(?lstr12_Sim800+0)
ORI	R25, R25, lo_addr(?lstr12_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,192 :: 		UART1_Write_Text(string[2]);
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,193 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,194 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,196 :: 		str_rcv = findnumber(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
;Sim800.c,197 :: 		res = atoi(str_rcv);
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,198 :: 		if(res == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT174
NOP	
J	L_SetupIOT39
NOP	
L__SetupIOT174:
;Sim800.c,200 :: 		sprintf(txtA,"%d",res);
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
;Sim800.c,201 :: 		UART1_Write_Text("Registered with:= ");
LUI	R25, hi_addr(?lstr14_Sim800+0)
ORI	R25, R25, lo_addr(?lstr14_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,202 :: 		UART1_Write_Text(txtA);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,203 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,204 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,207 :: 		}else{
J	L_SetupIOT40
NOP	
L_SetupIOT39:
;Sim800.c,209 :: 		UART1_Write_Text("Sim Not Registered");
LUI	R25, hi_addr(?lstr15_Sim800+0)
ORI	R25, R25, lo_addr(?lstr15_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,210 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,211 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,213 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT41:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT41
NOP	
NOP	
NOP	
;Sim800.c,214 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,215 :: 		}
L_SetupIOT40:
;Sim800.c,216 :: 		}
L_SetupIOT38:
;Sim800.c,218 :: 		UART1_Write_Text("Sim Registered");
LUI	R25, hi_addr(?lstr16_Sim800+0)
ORI	R25, R25, lo_addr(?lstr16_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,219 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,220 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,222 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,223 :: 		}
;Sim800.c,222 :: 		return 1;
;Sim800.c,223 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,230 :: 		char WaitForSetupSMS(unsigned int Indx){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Sim800.c,236 :: 		UART2_Write_Text("AT+CMGF=1");
SW	R26, 4(SP)
SW	R27, 8(SP)
SH	R25, 12(SP)
LUI	R25, hi_addr(?lstr17_Sim800+0)
ORI	R25, R25, lo_addr(?lstr17_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,237 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,238 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,241 :: 		RB.rcv_txt_fin = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,242 :: 		RB.last_head   = RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,243 :: 		do{
L_WaitForSetupSMS43:
;Sim800.c,244 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,245 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_WaitForSetupSMS46:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS46
NOP	
NOP	
;Sim800.c,246 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForSetupSMS177
NOP	
J	L_WaitForSetupSMS43
NOP	
L__WaitForSetupSMS177:
;Sim800.c,247 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,248 :: 		RB.tail = RB.last_tail++;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1008)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,249 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS178
NOP	
J	L_WaitForSetupSMS48
NOP	
L__WaitForSetupSMS178:
; i end address is: 20 (R5)
;Sim800.c,250 :: 		while(RB.tail <= RB.head){
L_WaitForSetupSMS49:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__WaitForSetupSMS179
NOP	
J	L_WaitForSetupSMS50
NOP	
L__WaitForSetupSMS179:
;Sim800.c,251 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__WaitForSetupSMS180
NOP	
J	L_WaitForSetupSMS51
NOP	
L__WaitForSetupSMS180:
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
;Sim800.c,252 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,253 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,254 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,255 :: 		};
J	L_WaitForSetupSMS49
NOP	
L_WaitForSetupSMS50:
;Sim800.c,256 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,257 :: 		}
L_WaitForSetupSMS48:
;Sim800.c,258 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,260 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS53:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS53
NOP	
;Sim800.c,262 :: 		RB.rcv_txt_fin = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,263 :: 		RB.last_head   = RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,264 :: 		do{
L_WaitForSetupSMS55:
;Sim800.c,265 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,266 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_WaitForSetupSMS58:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS58
NOP	
NOP	
;Sim800.c,267 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForSetupSMS182
NOP	
J	L_WaitForSetupSMS55
NOP	
L__WaitForSetupSMS182:
;Sim800.c,268 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS60:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS60
NOP	
;Sim800.c,270 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,271 :: 		RB.tail = RB.last_tail++;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1008)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,272 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS183
NOP	
J	L_WaitForSetupSMS62
NOP	
L__WaitForSetupSMS183:
; i end address is: 20 (R5)
;Sim800.c,273 :: 		while(RB.tail <= RB.head){
L_WaitForSetupSMS63:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__WaitForSetupSMS184
NOP	
J	L_WaitForSetupSMS64
NOP	
L__WaitForSetupSMS184:
;Sim800.c,274 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__WaitForSetupSMS185
NOP	
J	L_WaitForSetupSMS65
NOP	
L__WaitForSetupSMS185:
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
;Sim800.c,275 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,276 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,277 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,278 :: 		};
J	L_WaitForSetupSMS63
NOP	
L_WaitForSetupSMS64:
;Sim800.c,279 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,280 :: 		}
L_WaitForSetupSMS62:
;Sim800.c,281 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,284 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
;Sim800.c,287 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 14
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_18_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_18_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,288 :: 		UART1_Write_Text("num_strs:= ");
LUI	R25, hi_addr(?lstr19_Sim800+0)
ORI	R25, R25, lo_addr(?lstr19_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,289 :: 		UART1_Write_Text(txtA);
ADDIU	R2, SP, 14
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,290 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,291 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,292 :: 		UART1_Write_Text("string[0]");
LUI	R25, hi_addr(?lstr20_Sim800+0)
ORI	R25, R25, lo_addr(?lstr20_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,293 :: 		UART1_Write_Text(string[0]);
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,294 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,295 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,296 :: 		UART1_Write_Text("string[1]");
LUI	R25, hi_addr(?lstr21_Sim800+0)
ORI	R25, R25, lo_addr(?lstr21_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,297 :: 		UART1_Write_Text(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,298 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,299 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,300 :: 		UART1_Write_Text("string[2]");
LUI	R25, hi_addr(?lstr22_Sim800+0)
ORI	R25, R25, lo_addr(?lstr22_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,301 :: 		UART1_Write_Text(string[2]);
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,302 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,303 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,304 :: 		UART1_Write_Text("string[3]");
LUI	R25, hi_addr(?lstr23_Sim800+0)
ORI	R25, R25, lo_addr(?lstr23_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,305 :: 		UART1_Write_Text(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,306 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,307 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,308 :: 		UART1_Write_Text("string[4]");
LUI	R25, hi_addr(?lstr24_Sim800+0)
ORI	R25, R25, lo_addr(?lstr24_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,309 :: 		UART1_Write_Text(string[4]);
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,310 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,311 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,312 :: 		UART1_Write_Text("string[5]");
LUI	R25, hi_addr(?lstr25_Sim800+0)
ORI	R25, R25, lo_addr(?lstr25_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,313 :: 		UART1_Write_Text(string[5]);
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,314 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,315 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,319 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
;Sim800.c,320 :: 		sprintf(sms,"%d",res);
ADDIU	R3, SP, 20
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_26_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_26_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,321 :: 		UART1_Write_Text("res= ");
LUI	R25, hi_addr(?lstr27_Sim800+0)
ORI	R25, R25, lo_addr(?lstr27_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,322 :: 		UART1_Write_Text(sms);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,325 :: 		UART2_Write_Text("AT+CMGR=");
LUI	R25, hi_addr(?lstr28_Sim800+0)
ORI	R25, R25, lo_addr(?lstr28_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,326 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
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
LHU	R25, 12(SP)
;Sim800.c,330 :: 		RB.rcv_txt_fin = 0; //reset bit and wait for response
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,331 :: 		RB.last_head   = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,332 :: 		do{
L_WaitForSetupSMS67:
;Sim800.c,333 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,334 :: 		Delay_ms(350);
LUI	R24, 142
ORI	R24, R24, 27220
L_WaitForSetupSMS70:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS70
NOP	
NOP	
NOP	
;Sim800.c,335 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForSetupSMS187
NOP	
J	L_WaitForSetupSMS67
NOP	
L__WaitForSetupSMS187:
;Sim800.c,336 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS72:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS72
NOP	
NOP	
NOP	
;Sim800.c,337 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,338 :: 		RB.tail = RB.last_tail;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,339 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS188
NOP	
J	L_WaitForSetupSMS74
NOP	
L__WaitForSetupSMS188:
; i end address is: 20 (R5)
;Sim800.c,340 :: 		while(RB.tail <= RB.head){
L_WaitForSetupSMS75:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__WaitForSetupSMS189
NOP	
J	L_WaitForSetupSMS76
NOP	
L__WaitForSetupSMS189:
;Sim800.c,341 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__WaitForSetupSMS190
NOP	
J	L_WaitForSetupSMS77
NOP	
L__WaitForSetupSMS190:
; ?FLOC___WaitForSetupSMS?T172 start address is: 24 (R6)
MOVZ	R6, R0, R0
; ?FLOC___WaitForSetupSMS?T172 end address is: 24 (R6)
J	L_WaitForSetupSMS78
NOP	
L_WaitForSetupSMS77:
; ?FLOC___WaitForSetupSMS?T172 start address is: 24 (R6)
LHU	R6, Offset(_RB+1004)(GP)
; ?FLOC___WaitForSetupSMS?T172 end address is: 24 (R6)
L_WaitForSetupSMS78:
; ?FLOC___WaitForSetupSMS?T172 start address is: 24 (R6)
SH	R6, Offset(_RB+1004)(GP)
;Sim800.c,342 :: 		SimTestTxt[i] = RB.buff[RB.tail];
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R4, R2, R3
ANDI	R3, R6, 65535
; ?FLOC___WaitForSetupSMS?T172 end address is: 24 (R6)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Sim800.c,343 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,344 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,345 :: 		};
J	L_WaitForSetupSMS75
NOP	
L_WaitForSetupSMS76:
;Sim800.c,346 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,347 :: 		}
L_WaitForSetupSMS74:
;Sim800.c,348 :: 		RB.last_tail = RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,349 :: 		str_rcv = setstr(SimTestTxt);
SH	R25, 12(SP)
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_setstr+0
NOP	
;Sim800.c,350 :: 		num_strs = strsplit(str_rcv,',');
ORI	R26, R0, 44
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;Sim800.c,352 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	R3, SP, 14
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_29_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_29_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,353 :: 		UART1_Write_Text("num_strs:= ");
LUI	R25, hi_addr(?lstr30_Sim800+0)
ORI	R25, R25, lo_addr(?lstr30_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,354 :: 		UART1_Write_Text(txtA);
ADDIU	R2, SP, 14
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,355 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,356 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,357 :: 		UART1_Write_Text("string[0]");
LUI	R25, hi_addr(?lstr31_Sim800+0)
ORI	R25, R25, lo_addr(?lstr31_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,358 :: 		UART1_Write_Text(string[0]);
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,359 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,360 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,361 :: 		UART1_Write_Text("string[1]");
LUI	R25, hi_addr(?lstr32_Sim800+0)
ORI	R25, R25, lo_addr(?lstr32_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,362 :: 		UART1_Write_Text(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,363 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,364 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,365 :: 		UART1_Write_Text("string[2]");
LUI	R25, hi_addr(?lstr33_Sim800+0)
ORI	R25, R25, lo_addr(?lstr33_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,366 :: 		UART1_Write_Text(string[2]);
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,367 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,368 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,369 :: 		UART1_Write_Text("string[3]");
LUI	R25, hi_addr(?lstr34_Sim800+0)
ORI	R25, R25, lo_addr(?lstr34_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,370 :: 		UART1_Write_Text(string[3]);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,371 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,372 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,373 :: 		UART1_Write_Text("string[4]");
LUI	R25, hi_addr(?lstr35_Sim800+0)
ORI	R25, R25, lo_addr(?lstr35_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,374 :: 		UART1_Write_Text(string[4]);
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,375 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,376 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,377 :: 		UART1_Write_Text("string[5]");
LUI	R25, hi_addr(?lstr36_Sim800+0)
ORI	R25, R25, lo_addr(?lstr36_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,378 :: 		UART1_Write_Text(string[5]);
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,379 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,380 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,384 :: 		if(Indx == 0){
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS191
NOP	
J	L_WaitForSetupSMS79
NOP	
L__WaitForSetupSMS191:
;Sim800.c,385 :: 		SF.SimFlashPtr = strlen(string[1])+1;
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+326)(GP)
;Sim800.c,386 :: 		memcpy(SF.SimFlashBuff,string[1],SF.SimFlashPtr);
ANDI	R27, R2, 65535
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+69)
ORI	R25, R25, lo_addr(_SF+69)
JAL	_memcpy+0
NOP	
;Sim800.c,387 :: 		strncpy(SF.SimCelNum,string[1],strlen(string[1])+1);
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
;Sim800.c,388 :: 		strncpy(SF.SimDate,string[3]+1,strlen(string[3]));
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
;Sim800.c,389 :: 		strncpy(SF.SimTime,string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+26)
ORI	R25, R25, lo_addr(_SF+26)
JAL	_strncpy+0
NOP	
;Sim800.c,390 :: 		SF.SimFlashPtr++;
LHU	R2, Offset(_SF+326)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+326)(GP)
;Sim800.c,397 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
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
;Sim800.c,396 :: 		" * SF.SimTime: %s\r\n"
LUI	R2, hi_addr(?lstr_37_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_37_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,393 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,397 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,399 :: 		}else if(Indx == 1){
J	L_WaitForSetupSMS80
NOP	
L_WaitForSetupSMS79:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS192
NOP	
J	L_WaitForSetupSMS81
NOP	
L__WaitForSetupSMS192:
;Sim800.c,401 :: 		int indx = SF.SimFlashPtr + strlen(string[1])+1;
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
LHU	R3, Offset(_SF+326)(GP)
ADDU	R2, R3, R2
ADDIU	R2, R2, 1
; indx start address is: 20 (R5)
ANDI	R5, R2, 65535
;Sim800.c,402 :: 		memcpy(SF.SimFlashBuff+indx,string[1],strlen(string[1])+1);
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
;Sim800.c,403 :: 		indx = SF.SimFlashPtr + strlen(string[2])+1;
LUI	R25, hi_addr(_string+128)
ORI	R25, R25, lo_addr(_string+128)
JAL	_strlen+0
NOP	
LHU	R3, Offset(_SF+326)(GP)
ADDU	R2, R3, R2
ADDIU	R2, R2, 1
; indx start address is: 20 (R5)
ANDI	R5, R2, 65535
;Sim800.c,404 :: 		memcpy(SF.SimFlashBuff+indx,string[2],strlen(string[2])+1);
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
;Sim800.c,405 :: 		strncpy(SF.WriteAPIKey,string[1],strlen(string[1])+1);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+35)
ORI	R25, R25, lo_addr(_SF+35)
JAL	_strncpy+0
NOP	
;Sim800.c,406 :: 		strncpy(SF.ReadAPIKey,string[2]+1,strlen(string[3])+1);
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
;Sim800.c,407 :: 		SF.SimFlashPtr = strlen(string[1])+1;
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SH	R2, Offset(_SF+326)(GP)
;Sim800.c,413 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
LUI	R2, hi_addr(_SF+52)
ORI	R2, R2, lo_addr(_SF+52)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+35)
ORI	R2, R2, lo_addr(_SF+35)
SW	R2, 8(SP)
;Sim800.c,412 :: 		" * SF.ReadAPIKey:  %s\r\n"
LUI	R2, hi_addr(?lstr_38_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_38_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,410 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,413 :: 		,SF.WriteAPIKey,SF.ReadAPIKey);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LHU	R25, 12(SP)
;Sim800.c,415 :: 		}
L_WaitForSetupSMS81:
L_WaitForSetupSMS80:
;Sim800.c,421 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS82:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS82
NOP	
;Sim800.c,422 :: 		UART2_Write_Text("AT+CMGD=");
SH	R25, 12(SP)
LUI	R25, hi_addr(?lstr39_Sim800+0)
ORI	R25, R25, lo_addr(?lstr39_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,423 :: 		UART2_Write_Text(sms);
ADDIU	R2, SP, 20
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
LHU	R25, 12(SP)
;Sim800.c,428 :: 		RB.rcv_txt_fin = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,429 :: 		RB.last_head   = RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,430 :: 		do{
L_WaitForSetupSMS84:
;Sim800.c,431 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,432 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_WaitForSetupSMS87:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS87
NOP	
NOP	
;Sim800.c,433 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForSetupSMS194
NOP	
J	L_WaitForSetupSMS84
NOP	
L__WaitForSetupSMS194:
;Sim800.c,434 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,435 :: 		RB.tail = RB.last_tail++;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1008)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,436 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__WaitForSetupSMS195
NOP	
J	L_WaitForSetupSMS89
NOP	
L__WaitForSetupSMS195:
; i end address is: 20 (R5)
;Sim800.c,437 :: 		while(RB.tail <= RB.head){
L_WaitForSetupSMS90:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__WaitForSetupSMS196
NOP	
J	L_WaitForSetupSMS91
NOP	
L__WaitForSetupSMS196:
;Sim800.c,438 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__WaitForSetupSMS197
NOP	
J	L_WaitForSetupSMS92
NOP	
L__WaitForSetupSMS197:
; ?FLOC___WaitForSetupSMS?T290 start address is: 24 (R6)
MOVZ	R6, R0, R0
; ?FLOC___WaitForSetupSMS?T290 end address is: 24 (R6)
J	L_WaitForSetupSMS93
NOP	
L_WaitForSetupSMS92:
; ?FLOC___WaitForSetupSMS?T290 start address is: 24 (R6)
LHU	R6, Offset(_RB+1004)(GP)
; ?FLOC___WaitForSetupSMS?T290 end address is: 24 (R6)
L_WaitForSetupSMS93:
; ?FLOC___WaitForSetupSMS?T290 start address is: 24 (R6)
SH	R6, Offset(_RB+1004)(GP)
;Sim800.c,439 :: 		SimTestTxt[i] = RB.buff[RB.tail];
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R4, R2, R3
ANDI	R3, R6, 65535
; ?FLOC___WaitForSetupSMS?T290 end address is: 24 (R6)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Sim800.c,440 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,441 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,442 :: 		};
J	L_WaitForSetupSMS90
NOP	
L_WaitForSetupSMS91:
;Sim800.c,443 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,444 :: 		}
L_WaitForSetupSMS89:
;Sim800.c,445 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,446 :: 		return 2;
ORI	R2, R0, 2
;Sim800.c,447 :: 		}
;Sim800.c,446 :: 		return 2;
;Sim800.c,447 :: 		}
L_end_WaitForSetupSMS:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _WaitForSetupSMS
_GetAPI_Key_SMS:
;Sim800.c,452 :: 		char GetAPI_Key_SMS(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,456 :: 		UART2_Write_Text("AT+CMGS=");
SW	R25, 4(SP)
LUI	R25, hi_addr(?lstr40_Sim800+0)
ORI	R25, R25, lo_addr(?lstr40_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,457 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,458 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,459 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,462 :: 		RB.rcv_txt_fin = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,463 :: 		RB.last_head   = RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,464 :: 		do{
L_GetAPI_Key_SMS94:
;Sim800.c,465 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_GetAPI_Key_SMS97:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetAPI_Key_SMS97
NOP	
;Sim800.c,466 :: 		}while(!RB.rcv_txt_fin);
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__GetAPI_Key_SMS200
NOP	
J	L_GetAPI_Key_SMS94
NOP	
L__GetAPI_Key_SMS200:
;Sim800.c,467 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,468 :: 		RB.tail = RB.last_tail++;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1008)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,469 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__GetAPI_Key_SMS201
NOP	
J	L_GetAPI_Key_SMS99
NOP	
L__GetAPI_Key_SMS201:
; i end address is: 20 (R5)
;Sim800.c,470 :: 		while(RB.tail <= RB.head){
L_GetAPI_Key_SMS100:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BEQ	R2, R0, L__GetAPI_Key_SMS202
NOP	
J	L_GetAPI_Key_SMS101
NOP	
L__GetAPI_Key_SMS202:
;Sim800.c,471 :: 		RB.tail = (RB.tail > 999)? 0: RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__GetAPI_Key_SMS203
NOP	
J	L_GetAPI_Key_SMS102
NOP	
L__GetAPI_Key_SMS203:
; ?FLOC___GetAPI_Key_SMS?T312 start address is: 24 (R6)
MOVZ	R6, R0, R0
; ?FLOC___GetAPI_Key_SMS?T312 end address is: 24 (R6)
J	L_GetAPI_Key_SMS103
NOP	
L_GetAPI_Key_SMS102:
; ?FLOC___GetAPI_Key_SMS?T312 start address is: 24 (R6)
LHU	R6, Offset(_RB+1004)(GP)
; ?FLOC___GetAPI_Key_SMS?T312 end address is: 24 (R6)
L_GetAPI_Key_SMS103:
; ?FLOC___GetAPI_Key_SMS?T312 start address is: 24 (R6)
SH	R6, Offset(_RB+1004)(GP)
;Sim800.c,472 :: 		SimTestTxt[i] = RB.buff[RB.tail];
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R4, R2, R3
ANDI	R3, R6, 65535
; ?FLOC___GetAPI_Key_SMS?T312 end address is: 24 (R6)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Sim800.c,473 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,474 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,475 :: 		};
J	L_GetAPI_Key_SMS100
NOP	
L_GetAPI_Key_SMS101:
;Sim800.c,476 :: 		SimTestTxt[i] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,477 :: 		}
L_GetAPI_Key_SMS99:
;Sim800.c,478 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,480 :: 		UART1_Write_Text(SimTestTxt);
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,481 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,482 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,485 :: 		UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
LUI	R25, hi_addr(?lstr41_Sim800+0)
ORI	R25, R25, lo_addr(?lstr41_Sim800+0)
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
;Sim800.c,488 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,490 :: 		WaitForSetupSMS(1);
ORI	R25, R0, 1
JAL	_WaitForSetupSMS+0
NOP	
;Sim800.c,493 :: 		return 3;
ORI	R2, R0, 3
;Sim800.c,494 :: 		}
;Sim800.c,493 :: 		return 3;
;Sim800.c,494 :: 		}
L_end_GetAPI_Key_SMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _GetAPI_Key_SMS
_Test_Update_ThingSpeak:
;Sim800.c,499 :: 		int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,507 :: 		if(s != sLast){
SW	R25, 4(SP)
ANDI	R3, R25, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak206
NOP	
J	L_Test_Update_ThingSpeak104
NOP	
L__Test_Update_ThingSpeak206:
;Sim800.c,508 :: 		sLast = s;
SB	R25, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
;Sim800.c,514 :: 		}
L_Test_Update_ThingSpeak104:
;Sim800.c,515 :: 		if(m != mLast){
ANDI	R3, R26, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak208
NOP	
J	L_Test_Update_ThingSpeak105
NOP	
L__Test_Update_ThingSpeak208:
;Sim800.c,516 :: 		mLast = m;
SB	R26, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
;Sim800.c,522 :: 		}
L_Test_Update_ThingSpeak105:
;Sim800.c,523 :: 		if(h != hLast){
ANDI	R3, R27, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak210
NOP	
J	L_Test_Update_ThingSpeak106
NOP	
L__Test_Update_ThingSpeak210:
;Sim800.c,524 :: 		hLast = h;
SB	R27, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
;Sim800.c,530 :: 		}
L_Test_Update_ThingSpeak106:
;Sim800.c,533 :: 		m > SimVars.time_to_log){
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_Update_ThingSpeak211
NOP	
J	L__Test_Update_ThingSpeak151
NOP	
L__Test_Update_ThingSpeak211:
ANDI	R3, R26, 65535
LHU	R2, Offset(_SimVars+2)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Test_Update_ThingSpeak212
NOP	
J	L__Test_Update_ThingSpeak150
NOP	
L__Test_Update_ThingSpeak212:
L__Test_Update_ThingSpeak149:
;Sim800.c,534 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,535 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,536 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Test_Update_ThingSpeak
NOP	
;Sim800.c,533 :: 		m > SimVars.time_to_log){
L__Test_Update_ThingSpeak151:
L__Test_Update_ThingSpeak150:
;Sim800.c,539 :: 		return -1;
ORI	R2, R0, 65535
;Sim800.c,540 :: 		}
;Sim800.c,539 :: 		return -1;
;Sim800.c,540 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,545 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;Sim800.c,551 :: 		sprintf(txtC,"%u",rgbc[0]);
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
;Sim800.c,552 :: 		sprintf(txtR,"%u",rgbc[1]);
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
;Sim800.c,553 :: 		sprintf(txtG,"%u",rgbc[2]);
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
;Sim800.c,554 :: 		sprintf(txtB,"%u",rgbc[3]);
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
;Sim800.c,556 :: 		UART2_Write_Text("AT+CPIN?");
LUI	R25, hi_addr(?lstr46_Sim800+0)
ORI	R25, R25, lo_addr(?lstr46_Sim800+0)
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
;Sim800.c,559 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData110:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData110
NOP	
;Sim800.c,560 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr47_Sim800+0)
ORI	R25, R25, lo_addr(?lstr47_Sim800+0)
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
L_SendData112:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData112
NOP	
;Sim800.c,564 :: 		UART2_Write_Text("AT+CGATT?");
LUI	R25, hi_addr(?lstr48_Sim800+0)
ORI	R25, R25, lo_addr(?lstr48_Sim800+0)
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
;Sim800.c,567 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData114:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData114
NOP	
;Sim800.c,568 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr49_Sim800+0)
ORI	R25, R25, lo_addr(?lstr49_Sim800+0)
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
;Sim800.c,571 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData116:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData116
NOP	
NOP	
;Sim800.c,572 :: 		UART2_Write_Text("AT+CIPSTATUS");
LUI	R25, hi_addr(?lstr50_Sim800+0)
ORI	R25, R25, lo_addr(?lstr50_Sim800+0)
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
;Sim800.c,575 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData118:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData118
NOP	
NOP	
;Sim800.c,576 :: 		UART2_Write_Text("AT+CIPMUX=0");
LUI	R25, hi_addr(?lstr51_Sim800+0)
ORI	R25, R25, lo_addr(?lstr51_Sim800+0)
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
L_SendData120:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData120
NOP	
;Sim800.c,580 :: 		UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
LUI	R25, hi_addr(?lstr52_Sim800+0)
ORI	R25, R25, lo_addr(?lstr52_Sim800+0)
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
;Sim800.c,583 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData122:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData122
NOP	
NOP	
;Sim800.c,584 :: 		UART2_Write_Text("AT+CIICR");
LUI	R25, hi_addr(?lstr53_Sim800+0)
ORI	R25, R25, lo_addr(?lstr53_Sim800+0)
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
;Sim800.c,587 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData124:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData124
NOP	
;Sim800.c,588 :: 		UART2_Write_Text("AT+CIFSR");
LUI	R25, hi_addr(?lstr54_Sim800+0)
ORI	R25, R25, lo_addr(?lstr54_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,589 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,590 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,591 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData126:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData126
NOP	
;Sim800.c,592 :: 		UART2_Write_Text("AT+CIPSPRT=1");
LUI	R25, hi_addr(?lstr55_Sim800+0)
ORI	R25, R25, lo_addr(?lstr55_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,593 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,594 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,595 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData128:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData128
NOP	
;Sim800.c,596 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
LUI	R25, hi_addr(?lstr56_Sim800+0)
ORI	R25, R25, lo_addr(?lstr56_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,597 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,598 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,599 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData130:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData130
NOP	
;Sim800.c,600 :: 		UART2_Write_Text("AT+CIPSEND");
LUI	R25, hi_addr(?lstr57_Sim800+0)
ORI	R25, R25, lo_addr(?lstr57_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,601 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,602 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,603 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData132:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData132
NOP	
;Sim800.c,604 :: 		UART2_Write_Text("GET https://api.thingspeak.com/update?api_key=W2NO15EASX7P7CDK&field1=");
LUI	R25, hi_addr(?lstr58_Sim800+0)
ORI	R25, R25, lo_addr(?lstr58_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,605 :: 		UART2_Write_Text(txtC);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,606 :: 		UART2_Write_Text("&field2=");
LUI	R25, hi_addr(?lstr59_Sim800+0)
ORI	R25, R25, lo_addr(?lstr59_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,607 :: 		UART2_Write_Text(txtR);
ADDIU	R2, SP, 27
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,608 :: 		UART2_Write_Text("&field3=");
LUI	R25, hi_addr(?lstr60_Sim800+0)
ORI	R25, R25, lo_addr(?lstr60_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,609 :: 		UART2_Write_Text(txtG);
ADDIU	R2, SP, 42
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,610 :: 		UART2_Write_Text("&field4=");
LUI	R25, hi_addr(?lstr61_Sim800+0)
ORI	R25, R25, lo_addr(?lstr61_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,611 :: 		UART2_Write_Text(txtB);
ADDIU	R2, SP, 57
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,612 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,613 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,614 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendData134:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData134
NOP	
NOP	
NOP	
;Sim800.c,615 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,616 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SendData136:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData136
NOP	
NOP	
NOP	
;Sim800.c,617 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr62_Sim800+0)
ORI	R25, R25, lo_addr(?lstr62_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,618 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,619 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,620 :: 		}
L_end_SendData:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 72
JR	RA
NOP	
; end of _SendData
_SendSMS:
;Sim800.c,622 :: 		char SendSMS(char sms_type){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,625 :: 		UART2_Write_Text("AT+CNMI=2,2,0,0,0");
SW	R25, 4(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(?lstr63_Sim800+0)
ORI	R25, R25, lo_addr(?lstr63_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,626 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,627 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,628 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS138:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS138
NOP	
;Sim800.c,629 :: 		UART2_Write_Text("AT+CMGF=1");
LUI	R25, hi_addr(?lstr64_Sim800+0)
ORI	R25, R25, lo_addr(?lstr64_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,630 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,631 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,632 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS140:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS140
NOP	
;Sim800.c,633 :: 		UART2_Write_Text("AT+CMGS=\"+447946455348\"");
LUI	R25, hi_addr(?lstr65_Sim800+0)
ORI	R25, R25, lo_addr(?lstr65_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,634 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,635 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,636 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS142:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS142
NOP	
NOP	
NOP	
;Sim800.c,637 :: 		switch(sms_type){
J	L_SendSMS144
NOP	
;Sim800.c,638 :: 		case 0:
L_SendSMS146:
;Sim800.c,639 :: 		UART2_Write_Text("Reply Start");
LUI	R25, hi_addr(?lstr66_Sim800+0)
ORI	R25, R25, lo_addr(?lstr66_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,640 :: 		break;
J	L_SendSMS145
NOP	
;Sim800.c,641 :: 		case 1:
L_SendSMS147:
;Sim800.c,642 :: 		UART2_Write_Text("Reply WebSite");
LUI	R25, hi_addr(?lstr67_Sim800+0)
ORI	R25, R25, lo_addr(?lstr67_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,643 :: 		break;
J	L_SendSMS145
NOP	
;Sim800.c,644 :: 		case 2:
L_SendSMS148:
;Sim800.c,645 :: 		UART2_Write_Text("Reply API Key");
LUI	R25, hi_addr(?lstr68_Sim800+0)
ORI	R25, R25, lo_addr(?lstr68_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,646 :: 		break;
J	L_SendSMS145
NOP	
;Sim800.c,647 :: 		}
L_SendSMS144:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS216
NOP	
J	L_SendSMS146
NOP	
L__SendSMS216:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS218
NOP	
J	L_SendSMS147
NOP	
L__SendSMS218:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS220
NOP	
J	L_SendSMS148
NOP	
L__SendSMS220:
L_SendSMS145:
;Sim800.c,648 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,650 :: 		}
L_end_SendSMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _SendSMS
