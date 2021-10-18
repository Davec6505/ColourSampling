_InitGSM3:
;Sim800.c,15 :: 		void InitGSM3(){
;Sim800.c,16 :: 		SimVars.initial_str = 0;
SH	R0, Offset(_SimVars+0)(GP)
;Sim800.c,17 :: 		}
L_end_InitGSM3:
JR	RA
NOP	
; end of _InitGSM3
_PwrUpGSM3:
;Sim800.c,19 :: 		void PwrUpGSM3(){
;Sim800.c,20 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,21 :: 		start:
___PwrUpGSM3_start:
;Sim800.c,22 :: 		PWR = 0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,23 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM30
NOP	
;Sim800.c,24 :: 		PWR = 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,26 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM32:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM32
NOP	
NOP	
NOP	
;Sim800.c,28 :: 		if(SimVars.initial_str == -1)
LH	R3, Offset(_SimVars+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__PwrUpGSM37
NOP	
J	L_PwrUpGSM34
NOP	
L__PwrUpGSM37:
;Sim800.c,29 :: 		goto start;
J	___PwrUpGSM3_start
NOP	
L_PwrUpGSM34:
;Sim800.c,30 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_SendData:
;Sim800.c,32 :: 		void SendData(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,34 :: 		UART2_Write_Text("AT+CPIN?");
SW	R25, 4(SP)
ADDIU	R23, SP, 8
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr1_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,35 :: 		}
L_end_SendData:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _SendData
