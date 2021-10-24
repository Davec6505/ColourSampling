_USB1Interrupt:
;ISR.c,7 :: 		void USB1Interrupt() iv IVT_USB_1 ilevel 7 ics ICS_SRS{
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
;ISR.c,8 :: 		USB_Interrupt_Proc();
JAL	_USB_Interrupt_Proc+0
NOP	
;ISR.c,9 :: 		}
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
;ISR.c,11 :: 		void InitISR(){
;ISR.c,12 :: 		Get_Timer_Values = &Get_Time;
LUI	R2, hi_addr(_Get_Time+0)
ORI	R2, R2, lo_addr(_Get_Time+0)
SW	R2, Offset(_Get_Timer_Values+0)(GP)
;ISR.c,13 :: 		Sim800Text = &RcvSimTxt;
LUI	R2, hi_addr(_RcvSimTxt+0)
ORI	R2, R2, lo_addr(_RcvSimTxt+0)
SW	R2, Offset(_Sim800Text+0)(GP)
;ISR.c,14 :: 		EI();
EI	R30
;ISR.c,15 :: 		}
L_end_InitISR:
JR	RA
NOP	
; end of _InitISR
_Timer1Interrupt:
;ISR.c,17 :: 		void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_SRS {
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
;ISR.c,18 :: 		T1IF_bit         = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;ISR.c,20 :: 		Get_Timer_Values();
LW	R30, Offset(_Get_Timer_Values+0)(GP)
JALR	RA, R30
NOP	
;ISR.c,21 :: 		}
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
;ISR.c,24 :: 		void PC_Uart1() iv IVT_UART_1 ilevel 6 ics ICS_AUTO {
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
;ISR.c,26 :: 		U1RXIF_bit = 0;
LUI	R2, BitMask(U1RXIF_bit+0)
ORI	R2, R2, BitMask(U1RXIF_bit+0)
_SX	
;ISR.c,27 :: 		i = 0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
;ISR.c,28 :: 		while (UART1_Data_Ready()) {  // If data is received
L_PC_Uart10:
; i start address is: 20 (R5)
JAL	_UART1_Data_Ready+0
NOP	
BNE	R2, R0, L__PC_Uart112
NOP	
J	L_PC_Uart11
NOP	
L__PC_Uart112:
;ISR.c,29 :: 		rcvPcTxt[i] = U1RXREG;     //  rxPc = UART1_Read();   // read the received data
SEH	R3, R5
LUI	R2, hi_addr(_rcvPcTxt+0)
ORI	R2, R2, lo_addr(_rcvPcTxt+0)
ADDU	R3, R2, R3
LW	R2, Offset(U1RXREG+0)(GP)
SB	R2, 0(R3)
;ISR.c,30 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;ISR.c,31 :: 		}
J	L_PC_Uart10
NOP	
L_PC_Uart11:
;ISR.c,32 :: 		rcvPcTxt[i] = 0;
SEH	R3, R5
LUI	R2, hi_addr(_rcvPcTxt+0)
ORI	R2, R2, lo_addr(_rcvPcTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;ISR.c,33 :: 		for(j= 0; j<i ;j++){
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
BNE	R2, R0, L__PC_Uart113
NOP	
J	L_PC_Uart13
NOP	
L__PC_Uart113:
;ISR.c,34 :: 		U2TXREG =  rcvPcTxt[j];
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
;ISR.c,35 :: 		while(!TRMT_bit);
L_PC_Uart15:
; i start address is: 20 (R5)
; j start address is: 12 (R3)
_LX	
EXT	R2, R2, BitPos(TRMT_bit+0), 1
BEQ	R2, R0, L__PC_Uart114
NOP	
J	L_PC_Uart16
NOP	
L__PC_Uart114:
J	L_PC_Uart15
NOP	
L_PC_Uart16:
;ISR.c,33 :: 		for(j= 0; j<i ;j++){
ADDIU	R2, R3, 1
; j end address is: 12 (R3)
; j start address is: 16 (R4)
SEH	R4, R2
;ISR.c,36 :: 		}
; i end address is: 20 (R5)
; j end address is: 16 (R4)
J	L_PC_Uart12
NOP	
L_PC_Uart13:
;ISR.c,37 :: 		}
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
_Sim800_Uart2:
;ISR.c,39 :: 		void Sim800_Uart2() iv IVT_UART_2 ilevel 6 ics ICS_AUTO {
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
;ISR.c,41 :: 		U2RXIF_bit = 0;
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
;ISR.c,42 :: 		Sim800Text();
LW	R30, Offset(_Sim800Text+0)(GP)
JALR	RA, R30
NOP	
;ISR.c,44 :: 		}
L_end_Sim800_Uart2:
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
; end of _Sim800_Uart2
