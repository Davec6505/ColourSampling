_USB1Interrupt:
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
JAL	_USB_Interrupt_Proc+0
NOP	
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
LUI	R2, hi_addr(_Get_Time+0)
ORI	R2, R2, lo_addr(_Get_Time+0)
SW	R2, Offset(_Get_Timer_Values+0)(GP)
LUI	R2, hi_addr(_RcvSimTxt+0)
ORI	R2, R2, lo_addr(_RcvSimTxt+0)
SW	R2, Offset(_Sim800Text+0)(GP)
EI	R30
L_end_InitISR:
JR	RA
NOP	
; end of _InitISR
_Timer1Interrupt:
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
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
LW	R30, Offset(_Get_Timer_Values+0)(GP)
JALR	RA, R30
NOP	
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
_Timer4_5Interrupt:
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
LUI	R2, BitMask(T5IF_bit+0)
ORI	R2, R2, BitMask(T5IF_bit+0)
_SX	
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
L_end_Timer4_5Interrupt:
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
; end of _Timer4_5Interrupt
_PC_Uart1:
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
LUI	R2, BitMask(U1RXIF_bit+0)
ORI	R2, R2, BitMask(U1RXIF_bit+0)
_SX	
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_PC_Uart10:
; i start address is: 20 (R5)
JAL	_UART1_Data_Ready+0
NOP	
BNE	R2, R0, L__PC_Uart113
NOP	
J	L_PC_Uart11
NOP	
L__PC_Uart113:
SEH	R3, R5
LUI	R2, hi_addr(_rcvPcTxt+0)
ORI	R2, R2, lo_addr(_rcvPcTxt+0)
ADDU	R3, R2, R3
LW	R2, Offset(U1RXREG+0)(GP)
SB	R2, 0(R3)
ADDIU	R2, R5, 1
SEH	R5, R2
J	L_PC_Uart10
NOP	
L_PC_Uart11:
SEH	R3, R5
LUI	R2, hi_addr(_rcvPcTxt+0)
ORI	R2, R2, lo_addr(_rcvPcTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
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
BNE	R2, R0, L__PC_Uart114
NOP	
J	L_PC_Uart13
NOP	
L__PC_Uart114:
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
L_PC_Uart15:
; i start address is: 20 (R5)
; j start address is: 12 (R3)
_LX	
EXT	R2, R2, BitPos(TRMT_bit+0), 1
BEQ	R2, R0, L__PC_Uart115
NOP	
J	L_PC_Uart16
NOP	
L__PC_Uart115:
J	L_PC_Uart15
NOP	
L_PC_Uart16:
ADDIU	R2, R3, 1
; j end address is: 12 (R3)
; j start address is: 16 (R4)
SEH	R4, R2
; i end address is: 20 (R5)
; j end address is: 16 (R4)
J	L_PC_Uart12
NOP	
L_PC_Uart13:
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
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
LW	R30, Offset(_Sim800Text+0)(GP)
JALR	RA, R30
NOP	
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
