_InitGSM3:
;Sim800.c,17 :: 		void InitGSM3(){
;Sim800.c,18 :: 		SimVars.initial_str = 0;
SH	R0, Offset(_SimVars+0)(GP)
;Sim800.c,20 :: 		Update_Thing = Update_ThingSpeak;
LUI	R2, hi_addr(_Update_ThingSpeak+0)
ORI	R2, R2, lo_addr(_Update_ThingSpeak+0)
SW	R2, Offset(_Update_Thing+0)(GP)
;Sim800.c,21 :: 		}
L_end_InitGSM3:
JR	RA
NOP	
; end of _InitGSM3
_PwrUpGSM3:
;Sim800.c,26 :: 		void PwrUpGSM3(){
;Sim800.c,27 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,28 :: 		start:
___PwrUpGSM3_start:
;Sim800.c,29 :: 		PWR = 0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,30 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM30
NOP	
;Sim800.c,31 :: 		PWR = 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,33 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM32:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM32
NOP	
NOP	
NOP	
;Sim800.c,35 :: 		if(SimVars.initial_str == -1)
LH	R3, Offset(_SimVars+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__PwrUpGSM335
NOP	
J	L_PwrUpGSM34
NOP	
L__PwrUpGSM335:
;Sim800.c,36 :: 		goto start;
J	___PwrUpGSM3_start
NOP	
L_PwrUpGSM34:
;Sim800.c,37 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_SendData:
;Sim800.c,39 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -364
SW	RA, 0(SP)
;Sim800.c,45 :: 		sprintf(txtC,"%u",rgbc[0]);
SW	R25, 4(SP)
LHU	R2, 0(R25)
ADDIU	R3, SP, 12
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_1_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_1_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,46 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
ADDIU	R3, SP, 27
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_2_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_2_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,47 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDIU	R3, SP, 42
SW	R25, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_3_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 8(SP)
;Sim800.c,48 :: 		sprintf(txtB,"%u",rgbc[3]);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	R3, SP, 57
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_4_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,50 :: 		UART2_Write_Text("AT+CPIN?");
ADDIU	R23, SP, 72
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr5_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr5_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 72
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,51 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,52 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,53 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData5:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData5
NOP	
;Sim800.c,54 :: 		UART2_Write_Text("AT+CREG?");
ADDIU	R23, SP, 81
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr6_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr6_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 81
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,55 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,56 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,57 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData7:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData7
NOP	
;Sim800.c,58 :: 		UART2_Write_Text("AT+CGATT?");
ADDIU	R23, SP, 90
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr7_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr7_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 90
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,59 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,60 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,61 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData9:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData9
NOP	
;Sim800.c,62 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 100
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr8_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr8_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 100
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,63 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,64 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,65 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData11:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData11
NOP	
NOP	
;Sim800.c,66 :: 		UART2_Write_Text("AT+CIPSTATUS");
ADDIU	R23, SP, 111
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr9_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr9_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 111
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,67 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,68 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,69 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData13:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData13
NOP	
NOP	
;Sim800.c,70 :: 		UART2_Write_Text("AT+CIPMUX=0");
ADDIU	R23, SP, 124
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr10_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr10_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 124
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,71 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,72 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,73 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData15:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData15
NOP	
;Sim800.c,74 :: 		UART2_Write_Text("AT+CSTT=\"data.uk\",\"user\",\"one2one\"");
ADDIU	R23, SP, 136
ADDIU	R22, R23, 35
LUI	R24, hi_addr(?ICS?lstr11_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr11_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 136
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,75 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,76 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,77 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_SendData17:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData17
NOP	
NOP	
;Sim800.c,78 :: 		UART2_Write_Text("AT+CIICR");
ADDIU	R23, SP, 171
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr12_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr12_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 171
MOVZ	R25, R2, R0
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
;Sim800.c,81 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData19:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData19
NOP	
;Sim800.c,82 :: 		UART2_Write_Text("AT+CIFSR");
ADDIU	R23, SP, 180
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr13_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr13_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 180
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,83 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,84 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,85 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData21:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData21
NOP	
;Sim800.c,86 :: 		UART2_Write_Text("AT+CIPSPRT=1");
ADDIU	R23, SP, 189
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr14_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr14_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 189
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,87 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,88 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,89 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData23:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData23
NOP	
;Sim800.c,90 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
ADDIU	R23, SP, 202
ADDIU	R22, R23, 42
LUI	R24, hi_addr(?ICS?lstr15_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr15_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 202
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,91 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,92 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,93 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SendData25:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData25
NOP	
;Sim800.c,94 :: 		UART2_Write_Text("AT+CIPSEND");
ADDIU	R23, SP, 244
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr16_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr16_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 244
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,95 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,96 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,97 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData27:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData27
NOP	
;Sim800.c,98 :: 		UART2_Write_Text("GET https://api.thingspeak.com/update?api_key=W2NO15EASX7P7CDK&field1=");
ADDIU	R23, SP, 255
ADDIU	R22, R23, 71
LUI	R24, hi_addr(?ICS?lstr17_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr17_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 255
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,99 :: 		UART2_Write_Text(txtC);
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,100 :: 		UART2_Write_Text("&field2=");
ADDIU	R23, SP, 326
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr18_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr18_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 326
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,101 :: 		UART2_Write_Text(txtR);
ADDIU	R2, SP, 27
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,102 :: 		UART2_Write_Text("&field3=");
ADDIU	R23, SP, 335
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr19_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr19_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 335
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,103 :: 		UART2_Write_Text(txtG);
ADDIU	R2, SP, 42
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,104 :: 		UART2_Write_Text("&field4=");
ADDIU	R23, SP, 344
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr20_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr20_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 344
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,105 :: 		UART2_Write_Text(txtB);
ADDIU	R2, SP, 57
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,106 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,107 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,108 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendData29:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData29
NOP	
NOP	
NOP	
;Sim800.c,109 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,110 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SendData31:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData31
NOP	
NOP	
NOP	
;Sim800.c,111 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 353
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr21_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr21_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 353
MOVZ	R25, R2, R0
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
;Sim800.c,114 :: 		}
L_end_SendData:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 364
JR	RA
NOP	
; end of _SendData
