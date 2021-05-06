_USB1Interrupt:
;ISR.c,5 :: 		void USB1Interrupt() iv IVT_USB_1 ilevel 7 ics ICS_SRS{
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
;ISR.c,6 :: 		USB_Interrupt_Proc();
JAL	_USB_Interrupt_Proc+0
NOP	
;ISR.c,7 :: 		}
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
;ISR.c,9 :: 		void InitISR(){
;ISR.c,10 :: 		Get_Timer_Values = &Get_Time;
LUI	R2, hi_addr(_Get_Time+0)
ORI	R2, R2, lo_addr(_Get_Time+0)
SW	R2, Offset(_Get_Timer_Values+0)(GP)
;ISR.c,11 :: 		EI();
EI	R30
;ISR.c,12 :: 		}
L_end_InitISR:
JR	RA
NOP	
; end of _InitISR
_Timer1Interrupt:
;ISR.c,14 :: 		void Timer1Interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_SRS {
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
;ISR.c,15 :: 		T1IF_bit         = 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;ISR.c,17 :: 		Get_Timer_Values();
LW	R30, Offset(_Get_Timer_Values+0)(GP)
JALR	RA, R30
NOP	
;ISR.c,18 :: 		}
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
