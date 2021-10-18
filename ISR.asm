_USB1Interrupt:
;ISR.c,6 :: 		void USB1Interrupt() iv IVT_USB_1 ilevel 7 ics ICS_SRS{
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 7168
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;ISR.c,7 :: 		USB_Interrupt_Proc();
JAL	_USB_Interrupt_Proc+0
NOP	
;ISR.c,8 :: 		}
L_end_USB1Interrupt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _USB1Interrupt
_InitISR:
;ISR.c,10 :: 		void InitISR(){
;ISR.c,11 :: 		Get_Timer_Values = &Get_Time;
LUI	R2, hi_addr(_Get_Time+0)
ORI	R2, R2, lo_addr(_Get_Time+0)
SW	R2, Offset(_Get_Timer_Values+0)(GP)
;ISR.c,12 :: 		EI();
EI	R30
;ISR.c,13 :: 		}
L_end_InitISR:
JR	RA
NOP	
; end of _InitISR
_Timer1Interrupt:
;ISR.c,15 :: 		void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_SRS {
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 7168
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;ISR.c,16 :: 		T1IF_bit         = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;ISR.c,18 :: 		Get_Timer_Values();
LW	R30, Offset(_Get_Timer_Values+0)(GP)
JALR	RA, R30
NOP	
;ISR.c,19 :: 		}
L_end_Timer1Interrupt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _Timer1Interrupt
_PC_Uart1:
;ISR.c,22 :: 		void PC_Uart1() iv IVT_UART_1 ilevel 6 ics ICS_AUTO {
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 6144
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;ISR.c,24 :: 		U1RXIF_bit = 0;
LUI	R2, BitMask(U1RXIF_bit+0)
ORI	R2, R2, BitMask(U1RXIF_bit+0)
_SX	
;ISR.c,25 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
;ISR.c,26 :: 		while (UART1_Data_Ready()) {  // If data is received
L_PC_Uart10:
; i start address is: 20 (R5)
JAL	_UART1_Data_Ready+0
NOP	
BNE	R2, R0, L__PC_Uart128
NOP	
J	L_PC_Uart11
NOP	
L__PC_Uart128:
;ISR.c,27 :: 		rcvPcTxt[i] = U1RXREG;     //  rxPc = UART1_Read();   // read the received data
SEH	R3, R5
LUI	R2, hi_addr(_rcvPcTxt+0)
ORI	R2, R2, lo_addr(_rcvPcTxt+0)
ADDU	R3, R2, R3
LW	R2, Offset(U1RXREG+0)(GP)
SB	R2, 0(R3)
;ISR.c,28 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;ISR.c,29 :: 		}
J	L_PC_Uart10
NOP	
L_PC_Uart11:
;ISR.c,30 :: 		rcvPcTxt[i] = 0;
SEH	R3, R5
LUI	R2, hi_addr(_rcvPcTxt+0)
ORI	R2, R2, lo_addr(_rcvPcTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;ISR.c,31 :: 		for(j= 0; j<i ;j++){
; j start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 20 (R5)
; j end address is: 16 (R4)
L_PC_Uart12:
; j start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R4
SEH	R2, R5
SLT	R2, R3, R2
BNE	R2, R0, L__PC_Uart129
NOP	
J	L_PC_Uart13
NOP	
L__PC_Uart129:
;ISR.c,32 :: 		U2TXREG =  rcvPcTxt[j];
SEH	R3, R4
LUI	R2, hi_addr(_rcvPcTxt+0)
ORI	R2, R2, lo_addr(_rcvPcTxt+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SW	R2, Offset(U2TXREG+0)(GP)
; i end address is: 20 (R5)
; j end address is: 16 (R4)
SEH	R3, R4
;ISR.c,33 :: 		while(!TRMT_bit);
L_PC_Uart15:
; i start address is: 20 (R5)
; j start address is: 12 (R3)
_LX	
EXT	R2, R2, BitPos(TRMT_bit+0), 1
BEQ	R2, R0, L__PC_Uart130
NOP	
J	L_PC_Uart16
NOP	
L__PC_Uart130:
J	L_PC_Uart15
NOP	
L_PC_Uart16:
;ISR.c,31 :: 		for(j= 0; j<i ;j++){
ADDIU	R2, R3, 1
; j end address is: 12 (R3)
; j start address is: 16 (R4)
SEH	R4, R2
;ISR.c,34 :: 		}
; i end address is: 20 (R5)
; j end address is: 16 (R4)
J	L_PC_Uart12
NOP	
L_PC_Uart13:
;ISR.c,35 :: 		}
L_end_PC_Uart1:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 12(SP)
ADDIU	SP, SP, 16
ERET	
; end of _PC_Uart1
_PC_Uart2:
;ISR.c,37 :: 		void PC_Uart2() iv IVT_UART_2 ilevel 6 ics ICS_AUTO {
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 6144
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;ISR.c,40 :: 		U2RXIF_bit = 0;
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
;ISR.c,41 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
;ISR.c,42 :: 		while(UART2_Data_Ready()) {     // If data is received
L_PC_Uart27:
; i start address is: 20 (R5)
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__PC_Uart233
NOP	
J	L_PC_Uart28
NOP	
L__PC_Uart233:
;ISR.c,43 :: 		rcvSimTxt[i] = U2RXREG;
SEH	R3, R5
LUI	R2, hi_addr(_rcvSimTxt+0)
ORI	R2, R2, lo_addr(_rcvSimTxt+0)
ADDU	R3, R2, R3
LW	R2, Offset(U2RXREG+0)(GP)
SB	R2, 0(R3)
;ISR.c,44 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;ISR.c,45 :: 		}
J	L_PC_Uart27
NOP	
L_PC_Uart28:
;ISR.c,46 :: 		rcvSimTxt[i] = 0;
SEH	R3, R5
LUI	R2, hi_addr(_rcvSimTxt+0)
ORI	R2, R2, lo_addr(_rcvSimTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;ISR.c,47 :: 		for(j= 0; j<i;j++){
; j start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 20 (R5)
; j end address is: 16 (R4)
L_PC_Uart29:
; j start address is: 16 (R4)
; i start address is: 20 (R5)
SEH	R3, R4
SEH	R2, R5
SLT	R2, R3, R2
BNE	R2, R0, L__PC_Uart234
NOP	
J	L_PC_Uart210
NOP	
L__PC_Uart234:
;ISR.c,48 :: 		U1TXREG =  rcvSimTxt[j];
SEH	R3, R4
LUI	R2, hi_addr(_rcvSimTxt+0)
ORI	R2, R2, lo_addr(_rcvSimTxt+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SW	R2, Offset(U1TXREG+0)(GP)
; i end address is: 20 (R5)
; j end address is: 16 (R4)
SEH	R3, R4
;ISR.c,49 :: 		while(!TRMT_bit);
L_PC_Uart212:
; i start address is: 20 (R5)
; j start address is: 12 (R3)
_LX	
EXT	R2, R2, BitPos(TRMT_bit+0), 1
BEQ	R2, R0, L__PC_Uart235
NOP	
J	L_PC_Uart213
NOP	
L__PC_Uart235:
J	L_PC_Uart212
NOP	
L_PC_Uart213:
;ISR.c,47 :: 		for(j= 0; j<i;j++){
ADDIU	R2, R3, 1
; j end address is: 12 (R3)
; j start address is: 16 (R4)
SEH	R4, R2
;ISR.c,50 :: 		}
; j end address is: 16 (R4)
J	L_PC_Uart29
NOP	
L_PC_Uart210:
;ISR.c,51 :: 		if(SimVars.initial_str == 1)
LH	R3, Offset(_SimVars+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__PC_Uart236
NOP	
J	L_PC_Uart214
NOP	
L__PC_Uart236:
; i end address is: 20 (R5)
;ISR.c,52 :: 		goto end;
J	___PC_Uart2_end
NOP	
L_PC_Uart214:
;ISR.c,54 :: 		if((SimVars.initial_str == 0) && (i != 0))
; i start address is: 20 (R5)
LH	R2, Offset(_SimVars+0)(GP)
BEQ	R2, R0, L__PC_Uart237
NOP	
J	L__PC_Uart222
NOP	
L__PC_Uart237:
SEH	R2, R5
; i end address is: 20 (R5)
BNE	R2, R0, L__PC_Uart239
NOP	
J	L__PC_Uart221
NOP	
L__PC_Uart239:
L__PC_Uart220:
;ISR.c,55 :: 		SimVars.initial_str = -1;    //in initialisation
ORI	R2, R0, 65535
SH	R2, Offset(_SimVars+0)(GP)
J	L_PC_Uart218
NOP	
;ISR.c,54 :: 		if((SimVars.initial_str == 0) && (i != 0))
L__PC_Uart222:
L__PC_Uart221:
;ISR.c,56 :: 		else if(SimVars.initial_str == -1)// && (i == 0))
LH	R3, Offset(_SimVars+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
BEQ	R3, R2, L__PC_Uart240
NOP	
J	L_PC_Uart219
NOP	
L__PC_Uart240:
;ISR.c,57 :: 		SimVars.initial_str = 1;     //initialised
ORI	R2, R0, 1
SH	R2, Offset(_SimVars+0)(GP)
L_PC_Uart219:
L_PC_Uart218:
;ISR.c,59 :: 		end:
___PC_Uart2_end:
;ISR.c,60 :: 		return;
;ISR.c,61 :: 		}
L_end_PC_Uart2:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 12(SP)
ADDIU	SP, SP, 16
ERET	
; end of _PC_Uart2
