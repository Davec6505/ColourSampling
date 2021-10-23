_InitGSM3:
;Sim800.c,22 :: 		void InitGSM3(){
;Sim800.c,23 :: 		SimVars.initial_str = 0;
SB	R0, Offset(_SimVars+0)(GP)
;Sim800.c,24 :: 		}
L_end_InitGSM3:
JR	RA
NOP	
; end of _InitGSM3
_PwrUpGSM3:
;Sim800.c,28 :: 		void PwrUpGSM3(){
;Sim800.c,29 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,30 :: 		start:
___PwrUpGSM3_start:
;Sim800.c,31 :: 		PWR = 0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,32 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM30
NOP	
;Sim800.c,33 :: 		PWR = 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,35 :: 		while(STAT){
L_PwrUpGSM32:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrUpGSM365
NOP	
J	L_PwrUpGSM33
NOP	
L__PwrUpGSM365:
;Sim800.c,36 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,37 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM34
NOP	
;Sim800.c,38 :: 		}
J	L_PwrUpGSM32
NOP	
L_PwrUpGSM33:
;Sim800.c,39 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM36
NOP	
NOP	
NOP	
;Sim800.c,41 :: 		if(SimVars.initial_str == -1)
LBU	R3, Offset(_SimVars+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__PwrUpGSM366
NOP	
J	L_PwrUpGSM38
NOP	
L__PwrUpGSM366:
;Sim800.c,42 :: 		goto start;
J	___PwrUpGSM3_start
NOP	
L_PwrUpGSM38:
;Sim800.c,43 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_SetupIOT:
;Sim800.c,48 :: 		char SetupIOT(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,57 :: 		UART1_Write_Text("Check if Sim is Registered");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R25, hi_addr(?lstr1_Sim800+0)
ORI	R25, R25, lo_addr(?lstr1_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,58 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,59 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,61 :: 		wait:
___SetupIOT_wait:
;Sim800.c,62 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,63 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr2_Sim800+0)
ORI	R25, R25, lo_addr(?lstr2_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,64 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,65 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,66 :: 		T0_SP.sec = 0;
SH	R0, Offset(_T0_SP+2)(GP)
;Sim800.c,67 :: 		SimVars.num_of_sms_bytes = 0;
SH	R0, Offset(_SimVars+4)(GP)
;Sim800.c,68 :: 		while(!SimVars.num_of_sms_bytes){
L_SetupIOT9:
LHU	R2, Offset(_SimVars+4)(GP)
BEQ	R2, R0, L__SetupIOT68
NOP	
J	L_SetupIOT10
NOP	
L__SetupIOT68:
;Sim800.c,69 :: 		if(TMR0.millis > last_millis){
LW	R3, Offset(SetupIOT_last_millis_L0+0)(GP)
LW	R2, Offset(_TMR0+0)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT69
NOP	
J	L_SetupIOT11
NOP	
L__SetupIOT69:
;Sim800.c,70 :: 		last_millis = TMR0.millis + 20000;
LW	R2, Offset(_TMR0+0)(GP)
ADDIU	R2, R2, 20000
SW	R2, Offset(SetupIOT_last_millis_L0+0)(GP)
;Sim800.c,72 :: 		break;
J	L_SetupIOT10
NOP	
;Sim800.c,73 :: 		}
L_SetupIOT11:
;Sim800.c,74 :: 		}
J	L_SetupIOT9
NOP	
L_SetupIOT10:
;Sim800.c,77 :: 		UART2_Write_Text("string[1]");
LUI	R25, hi_addr(?lstr3_Sim800+0)
ORI	R25, R25, lo_addr(?lstr3_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,78 :: 		UART2_Write_Text(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,79 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,80 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,82 :: 		test = strsplit(rcvSimTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_rcvSimTxt+0)
ORI	R25, R25, lo_addr(_rcvSimTxt+0)
JAL	_strsplit+0
NOP	
;Sim800.c,83 :: 		if(test > 0){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__SetupIOT70
NOP	
J	L_SetupIOT12
NOP	
L__SetupIOT70:
;Sim800.c,84 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
;Sim800.c,86 :: 		sprintf(txt,"u",res);
ADDIU	R3, SP, 12
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_4_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,87 :: 		UART1_Write_Text("Registered with:= ");
LUI	R25, hi_addr(?lstr5_Sim800+0)
ORI	R25, R25, lo_addr(?lstr5_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,88 :: 		UART1_Write_Text(txt);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,89 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,90 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,92 :: 		}
J	L_SetupIOT13
NOP	
L_SetupIOT12:
;Sim800.c,95 :: 		UART1_Write_Text("Sim Not Registered");
LUI	R25, hi_addr(?lstr6_Sim800+0)
ORI	R25, R25, lo_addr(?lstr6_Sim800+0)
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,96 :: 		UART1_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;Sim800.c,97 :: 		UART1_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;Sim800.c,100 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,101 :: 		}
L_SetupIOT13:
;Sim800.c,103 :: 		UART1_Write_Text("Sim Registered");
LUI	R25, hi_addr(?lstr7_Sim800+0)
ORI	R25, R25, lo_addr(?lstr7_Sim800+0)
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
;Sim800.c,108 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SetupIOT
_Test_Update_ThingSpeak:
;Sim800.c,110 :: 		int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,118 :: 		if(s != sLast){
SW	R25, 4(SP)
ANDI	R3, R25, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak73
NOP	
J	L_Test_Update_ThingSpeak14
NOP	
L__Test_Update_ThingSpeak73:
;Sim800.c,119 :: 		sLast = s;
SB	R25, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
;Sim800.c,125 :: 		}
L_Test_Update_ThingSpeak14:
;Sim800.c,126 :: 		if(m != mLast){
ANDI	R3, R26, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak75
NOP	
J	L_Test_Update_ThingSpeak15
NOP	
L__Test_Update_ThingSpeak75:
;Sim800.c,127 :: 		mLast = m;
SB	R26, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
;Sim800.c,133 :: 		}
L_Test_Update_ThingSpeak15:
;Sim800.c,134 :: 		if(h != hLast){
ANDI	R3, R27, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak77
NOP	
J	L_Test_Update_ThingSpeak16
NOP	
L__Test_Update_ThingSpeak77:
;Sim800.c,135 :: 		hLast = h;
SB	R27, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
;Sim800.c,141 :: 		}
L_Test_Update_ThingSpeak16:
;Sim800.c,144 :: 		m > SimVars.time_to_log){
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__Test_Update_ThingSpeak78
NOP	
J	L__Test_Update_ThingSpeak61
NOP	
L__Test_Update_ThingSpeak78:
ANDI	R3, R26, 65535
LHU	R2, Offset(_SimVars+2)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Test_Update_ThingSpeak79
NOP	
J	L__Test_Update_ThingSpeak60
NOP	
L__Test_Update_ThingSpeak79:
L__Test_Update_ThingSpeak59:
;Sim800.c,145 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,146 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,147 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Test_Update_ThingSpeak
NOP	
;Sim800.c,144 :: 		m > SimVars.time_to_log){
L__Test_Update_ThingSpeak61:
L__Test_Update_ThingSpeak60:
;Sim800.c,150 :: 		return -1;
ORI	R2, R0, 65535
;Sim800.c,151 :: 		}
;Sim800.c,150 :: 		return -1;
;Sim800.c,151 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,153 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -72
SW	RA, 0(SP)
;Sim800.c,159 :: 		sprintf(txtC,"%u",rgbc[0]);
SW	R25, 4(SP)
LHU	R2, 0(R25)
ADDIU	R3, SP, 12
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_8_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_8_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,160 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R3, SP, 27
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_9_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_9_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,161 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDIU	R3, SP, 42
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_10_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_10_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,162 :: 		sprintf(txtB,"%u",rgbc[3]);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R3, SP, 57
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_11_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_11_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,164 :: 		UART2_Write_Text("AT+CPIN?");
LUI	R25, hi_addr(?lstr12_Sim800+0)
ORI	R25, R25, lo_addr(?lstr12_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,165 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,166 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,167 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData20:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData20
NOP	
;Sim800.c,168 :: 		UART2_Write_Text("AT+CREG?");
LUI	R25, hi_addr(?lstr13_Sim800+0)
ORI	R25, R25, lo_addr(?lstr13_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,169 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,170 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,171 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData22:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData22
NOP	
;Sim800.c,172 :: 		UART2_Write_Text("AT+CGATT?");
LUI	R25, hi_addr(?lstr14_Sim800+0)
ORI	R25, R25, lo_addr(?lstr14_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,173 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,174 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,175 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData24:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData24
NOP	
;Sim800.c,176 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr15_Sim800+0)
ORI	R25, R25, lo_addr(?lstr15_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,177 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,178 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,179 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData26:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData26
NOP	
NOP	
;Sim800.c,180 :: 		UART2_Write_Text("AT+CIPSTATUS");
LUI	R25, hi_addr(?lstr16_Sim800+0)
ORI	R25, R25, lo_addr(?lstr16_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,181 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,182 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,183 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData28:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData28
NOP	
NOP	
;Sim800.c,184 :: 		UART2_Write_Text("AT+CIPMUX=0");
LUI	R25, hi_addr(?lstr17_Sim800+0)
ORI	R25, R25, lo_addr(?lstr17_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,185 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,186 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,187 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData30
NOP	
;Sim800.c,188 :: 		UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
LUI	R25, hi_addr(?lstr18_Sim800+0)
ORI	R25, R25, lo_addr(?lstr18_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,189 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,190 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,191 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData32:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData32
NOP	
NOP	
;Sim800.c,192 :: 		UART2_Write_Text("AT+CIICR");
LUI	R25, hi_addr(?lstr19_Sim800+0)
ORI	R25, R25, lo_addr(?lstr19_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,193 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,194 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,195 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData34
NOP	
;Sim800.c,196 :: 		UART2_Write_Text("AT+CIFSR");
LUI	R25, hi_addr(?lstr20_Sim800+0)
ORI	R25, R25, lo_addr(?lstr20_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,197 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,198 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,199 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData36
NOP	
;Sim800.c,200 :: 		UART2_Write_Text("AT+CIPSPRT=1");
LUI	R25, hi_addr(?lstr21_Sim800+0)
ORI	R25, R25, lo_addr(?lstr21_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,201 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,202 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,203 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData38:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData38
NOP	
;Sim800.c,204 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
LUI	R25, hi_addr(?lstr22_Sim800+0)
ORI	R25, R25, lo_addr(?lstr22_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,205 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,206 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,207 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData40:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData40
NOP	
;Sim800.c,208 :: 		UART2_Write_Text("AT+CIPSEND");
LUI	R25, hi_addr(?lstr23_Sim800+0)
ORI	R25, R25, lo_addr(?lstr23_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,209 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,210 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,211 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData42:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData42
NOP	
;Sim800.c,212 :: 		UART2_Write_Text("GET https://api.thingspeak.com/update?api_key=W2NO15EASX7P7CDK&field1=");
LUI	R25, hi_addr(?lstr24_Sim800+0)
ORI	R25, R25, lo_addr(?lstr24_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,213 :: 		UART2_Write_Text(txtC);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,214 :: 		UART2_Write_Text("&field2=");
LUI	R25, hi_addr(?lstr25_Sim800+0)
ORI	R25, R25, lo_addr(?lstr25_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,215 :: 		UART2_Write_Text(txtR);
ADDIU	R2, SP, 27
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,216 :: 		UART2_Write_Text("&field3=");
LUI	R25, hi_addr(?lstr26_Sim800+0)
ORI	R25, R25, lo_addr(?lstr26_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,217 :: 		UART2_Write_Text(txtG);
ADDIU	R2, SP, 42
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,218 :: 		UART2_Write_Text("&field4=");
LUI	R25, hi_addr(?lstr27_Sim800+0)
ORI	R25, R25, lo_addr(?lstr27_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,219 :: 		UART2_Write_Text(txtB);
ADDIU	R2, SP, 57
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
;Sim800.c,222 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendData44:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData44
NOP	
NOP	
NOP	
;Sim800.c,223 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,224 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SendData46:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData46
NOP	
NOP	
NOP	
;Sim800.c,225 :: 		UART2_Write_Text("AT+CIPSHUT");
LUI	R25, hi_addr(?lstr28_Sim800+0)
ORI	R25, R25, lo_addr(?lstr28_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,226 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,227 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,228 :: 		}
L_end_SendData:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 72
JR	RA
NOP	
; end of _SendData
_SendSMS:
;Sim800.c,230 :: 		char SendSMS(char sms_type){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,233 :: 		UART2_Write_Text("AT+CNMI=2,2,0,0,0");
SW	R25, 4(SP)
SB	R25, 8(SP)
LUI	R25, hi_addr(?lstr29_Sim800+0)
ORI	R25, R25, lo_addr(?lstr29_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,234 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,235 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,236 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS48:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS48
NOP	
;Sim800.c,237 :: 		UART2_Write_Text("AT+CMGF=1");
LUI	R25, hi_addr(?lstr30_Sim800+0)
ORI	R25, R25, lo_addr(?lstr30_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,238 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,239 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,240 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS50:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS50
NOP	
;Sim800.c,241 :: 		UART2_Write_Text("AT+CMGS=\"+447946455348\"");
LUI	R25, hi_addr(?lstr31_Sim800+0)
ORI	R25, R25, lo_addr(?lstr31_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,242 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,243 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,244 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS52:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS52
NOP	
NOP	
NOP	
;Sim800.c,245 :: 		switch(sms_type){
J	L_SendSMS54
NOP	
;Sim800.c,246 :: 		case 0:
L_SendSMS56:
;Sim800.c,247 :: 		UART2_Write_Text("Reply Start");
LUI	R25, hi_addr(?lstr32_Sim800+0)
ORI	R25, R25, lo_addr(?lstr32_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,248 :: 		break;
J	L_SendSMS55
NOP	
;Sim800.c,249 :: 		case 1:
L_SendSMS57:
;Sim800.c,250 :: 		UART2_Write_Text("Reply WebSite");
LUI	R25, hi_addr(?lstr33_Sim800+0)
ORI	R25, R25, lo_addr(?lstr33_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,251 :: 		break;
J	L_SendSMS55
NOP	
;Sim800.c,252 :: 		case 2:
L_SendSMS58:
;Sim800.c,253 :: 		UART2_Write_Text("Reply API Key");
LUI	R25, hi_addr(?lstr34_Sim800+0)
ORI	R25, R25, lo_addr(?lstr34_Sim800+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,254 :: 		break;
J	L_SendSMS55
NOP	
;Sim800.c,255 :: 		}
L_SendSMS54:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS83
NOP	
J	L_SendSMS56
NOP	
L__SendSMS83:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS85
NOP	
J	L_SendSMS57
NOP	
L__SendSMS85:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS87
NOP	
J	L_SendSMS58
NOP	
L__SendSMS87:
L_SendSMS55:
;Sim800.c,256 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,258 :: 		}
L_end_SendSMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _SendSMS
