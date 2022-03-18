_ConfigPic:
ADDIU	SP, SP, -24
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ORI	R2, R0, 30
SW	R2, Offset(CHECON+0)(GP)
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
_LX	
INS	R2, R0, BitPos(JTAGEN_bit+0), 1
_SX	
ORI	R2, R0, 512
SW	R2, Offset(TRISA+0)(GP)
ORI	R2, R0, 16
SW	R2, Offset(TRISB+0)(GP)
SW	R0, Offset(TRISC+0)(GP)
SW	R0, Offset(TRISD+0)(GP)
ORI	R2, R0, 528
SW	R2, Offset(TRISE+0)(GP)
SW	R0, Offset(TRISF+0)(GP)
ORI	R2, R0, 512
SW	R2, Offset(TRISG+0)(GP)
SW	R0, Offset(LATD+0)(GP)
JAL	_FSCM_SetUP+0
NOP	
LUI	R2, BitMask(USBIE_bit+0)
ORI	R2, R2, BitMask(USBIE_bit+0)
_SX	
ORI	R2, R0, 7168
SH	R2, Offset(IPC11bits+8)(GP)
LUI	R26, hi_addr(_writebuff+0)
ORI	R26, R26, lo_addr(_writebuff+0)
LUI	R25, hi_addr(_readbuff+0)
ORI	R25, R25, lo_addr(_readbuff+0)
JAL	_HID_Enable+0
NOP	
LUI	R26, 1
ORI	R26, R26, 34464
LUI	R25, 1
ORI	R25, R25, 14464
JAL	_I2C2_Init_Advanced+0
NOP	
LUI	R28, hi_addr(_I2C2_Write+0)
ORI	R28, R28, lo_addr(_I2C2_Write+0)
LUI	R27, hi_addr(_I2C2_Read+0)
ORI	R27, R27, lo_addr(_I2C2_Read+0)
LUI	R26, hi_addr(_I2C2_Restart+0)
ORI	R26, R26, lo_addr(_I2C2_Restart+0)
LUI	R25, hi_addr(_I2C2_Start+0)
ORI	R25, R25, lo_addr(_I2C2_Start+0)
LUI	R2, hi_addr(_I2C2_Is_Idle+0)
ORI	R2, R2, lo_addr(_I2C2_Is_Idle+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(_I2C2_Stop+0)
ORI	R2, R2, lo_addr(_I2C2_Stop+0)
SW	R2, 0(SP)
JAL	_I2C_Set_Active+0
NOP	
ADDIU	SP, SP, 8
LUI	R26, hi_addr(_I2C2_TimeoutCallback+0)
ORI	R26, R26, lo_addr(_I2C2_TimeoutCallback+0)
ORI	R25, R0, 1000
JAL	_I2C2_SetTimeoutCallback+0
NOP	
LUI	R24, 40
ORI	R24, R24, 45226
L_ConfigPic0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ConfigPic0
NOP	
JAL	_InitUart1+0
NOP	
LUI	R24, 40
ORI	R24, R24, 45226
L_ConfigPic2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ConfigPic2
NOP	
JAL	_InitUart2+0
NOP	
ORI	R2, R0, 5000
SH	R2, Offset(_current_duty2+0)(GP)
ORI	R2, R0, 500
SH	R2, Offset(_current_duty3+0)(GP)
ORI	R28, R0, 2
MOVZ	R27, R0, R0
ORI	R26, R0, 2
ORI	R25, R0, 5000
JAL	_PWM_Init+0
NOP	
SH	R2, Offset(_pwm_period2+0)(GP)
ORI	R28, R0, 3
ORI	R27, R0, 4
ORI	R26, R0, 3
ORI	R25, R0, 5000
JAL	_PWM_Init+0
NOP	
SH	R2, Offset(_pwm_period3+0)(GP)
ORI	R26, R0, 2
LHU	R25, Offset(_current_duty2+0)(GP)
JAL	_PWM_Set_Duty+0
NOP	
ORI	R26, R0, 3
LHU	R25, Offset(_current_duty3+0)(GP)
JAL	_PWM_Set_Duty+0
NOP	
ORI	R25, R0, 2
JAL	_PWM_Stop+0
NOP	
ORI	R25, R0, 3
JAL	_PWM_Stop+0
NOP	
JAL	_MM_Init+0
NOP	
LUI	R2, BitMask(LATA10_bit+0)
ORI	R2, R2, BitMask(LATA10_bit+0)
_SX	
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
JAL	_InitTimers+0
NOP	
JAL	_InitISR+0
NOP	
JAL	_InitGSM3+0
NOP	
JAL	_PwrDownGSM3+0
NOP	
JAL	_PwrUpGSM3+0
NOP	
ORI	R25, R0, 5
JAL	_setup_LM35+0
NOP	
MOVZ	R28, R0, R0
LUI	R27, 16288
ORI	R27, R27, 0
LUI	R26, 16832
ORI	R26, R26, 0
LUI	R25, 17026
ORI	R25, R25, 32768
ADDIU	SP, SP, -4
SH	R0, 2(SP)
ORI	R2, R0, 3780
SH	R2, 0(SP)
JAL	_Init_PID+0
NOP	
ADDIU	SP, SP, 4
ORI	R30, R0, 80
SB	R30, 20(SP)
ORI	R30, R0, 73
SB	R30, 21(SP)
ORI	R30, R0, 68
SB	R30, 22(SP)
MOVZ	R30, R0, R0
SB	R30, 23(SP)
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_PID_Control+0
NOP	
L_end_ConfigPic:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _ConfigPic
_FSCM_SetUP:
LW	R2, Offset(OSCCON+0)(GP)
ANDI	R2, R2, 8
BNE	R2, R0, L__FSCM_SetUP28
NOP	
J	L_FSCM_SetUP4
NOP	
L__FSCM_SetUP28:
J	L_FSCM_SetUP5
NOP	
L_FSCM_SetUP4:
ORI	R2, R0, 7936
SW	R2, Offset(IPC8CLR+0)(GP)
ORI	R2, R0, 1024
SW	R2, Offset(IPC8SET+0)(GP)
ORI	R2, R0, 256
SW	R2, Offset(IPC8SET+0)(GP)
ORI	R2, R0, 16384
SW	R2, Offset(IFS1CLR+0)(GP)
ORI	R2, R0, 16384
SW	R2, Offset(IEC1SET+0)(GP)
L_FSCM_SetUP5:
L_end_FSCM_SetUP:
JR	RA
NOP	
; end of _FSCM_SetUP
_InitUart1:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
SW	R25, 4(SP)
ORI	R25, R0, 9600
JAL	_UART1_Init+0
NOP	
LUI	R2, BitMask(URXISEL0_bit+0)
ORI	R2, R2, BitMask(URXISEL0_bit+0)
_SX	
LUI	R2, BitMask(URXISEL1_bit+0)
ORI	R2, R2, BitMask(URXISEL1_bit+0)
_SX	
ORI	R2, R0, 31
SW	R2, Offset(IPC6CLR+0)(GP)
ORI	R2, R0, 27
SW	R2, Offset(IPC6SET+0)(GP)
LUI	R2, BitMask(U1RXIE_bit+0)
ORI	R2, R2, BitMask(U1RXIE_bit+0)
_SX	
LUI	R2, BitMask(U1RXIF_bit+0)
ORI	R2, R2, BitMask(U1RXIF_bit+0)
_SX	
L_end_InitUart1:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _InitUart1
_InitUart2:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
SW	R25, 4(SP)
ORI	R25, R0, 9600
JAL	_UART2_Init+0
NOP	
ORI	R2, R0, 31
SW	R2, Offset(IPC8CLR+0)(GP)
ORI	R2, R0, 26
SW	R2, Offset(IPC8SET+0)(GP)
LUI	R2, BitMask(U2RXIE_bit+0)
ORI	R2, R2, BitMask(U2RXIE_bit+0)
_SX	
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
L_end_InitUart2:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _InitUart2
_Initialize_Led_On:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
SW	R25, 4(SP)
ORI	R25, R0, 2
JAL	_PWM_Start+0
NOP	
LUI	R24, 203
ORI	R24, R24, 29524
L_Initialize_Led_On6:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Initialize_Led_On6
NOP	
NOP	
NOP	
JAL	_SetLedPWM+0
NOP	
ORI	R25, R0, 2
JAL	_PWM_Stop+0
NOP	
L_end_Initialize_Led_On:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Initialize_Led_On
_SetLedPWM:
ADDIU	SP, SP, -16
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_SetLedPWM8:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__SetLedPWM33
NOP	
J	L_SetLedPWM9
NOP	
L__SetLedPWM33:
SEH	R2, R4
SLL	R3, R2, 1
LUI	R2, hi_addr(_RawData+0)
ORI	R2, R2, lo_addr(_RawData+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
ADDIU	R2, R4, 1
SEH	R4, R2
; i end address is: 16 (R4)
J	L_SetLedPWM8
NOP	
L_SetLedPWM9:
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_C2RGB_Error+0
NOP	
; err start address is: 12 (R3)
SEH	R3, R2
; err end address is: 12 (R3)
J	L__SetLedPWM22
NOP	
L__SetLedPWM23:
L__SetLedPWM22:
; err start address is: 12 (R3)
; err end address is: 12 (R3)
J	L__SetLedPWM21
NOP	
L__SetLedPWM24:
L__SetLedPWM21:
; err start address is: 12 (R3)
SEH	R2, R3
; err end address is: 12 (R3)
SLTI	R2, R2, 1
BEQ	R2, R0, L__SetLedPWM34
NOP	
J	L_SetLedPWM14
NOP	
L__SetLedPWM34:
; ?FLOC___SetLedPWM?T23 start address is: 8 (R2)
ORI	R2, R0, 100
; ?FLOC___SetLedPWM?T23 end address is: 8 (R2)
J	L_SetLedPWM15
NOP	
L_SetLedPWM14:
; ?FLOC___SetLedPWM?T23 start address is: 8 (R2)
ORI	R2, R0, 156
; ?FLOC___SetLedPWM?T23 end address is: 8 (R2)
L_SetLedPWM15:
; ?FLOC___SetLedPWM?T23 start address is: 8 (R2)
SEB	R3, R2
; ?FLOC___SetLedPWM?T23 end address is: 8 (R2)
LHU	R2, Offset(_current_duty2+0)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_current_duty2+0)(GP)
ORI	R26, R0, 2
ANDI	R25, R2, 65535
JAL	_PWM_Set_Duty+0
NOP	
LUI	R24, 203
ORI	R24, R24, 29524
L_SetLedPWM16:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetLedPWM16
NOP	
NOP	
NOP	
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_C2RGB_Error+0
NOP	
; err start address is: 12 (R3)
SEH	R3, R2
SH	R3, 12(SP)
ADDIU	SP, SP, -16
SH	R2, 12(SP)
LHU	R2, Offset(_current_duty2+0)(GP)
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_2_Config+0)
ORI	R2, R2, lo_addr(?lstr_2_Config+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LH	R3, 12(SP)
SEH	R2, R3
SLTI	R2, R2, -150
BEQ	R2, R0, L__SetLedPWM35
NOP	
J	L__SetLedPWM23
NOP	
L__SetLedPWM35:
SEH	R2, R3
SLTI	R2, R2, 151
BNE	R2, R0, L__SetLedPWM36
NOP	
J	L__SetLedPWM24
NOP	
L__SetLedPWM36:
; err end address is: 12 (R3)
L__SetLedPWM20:
L_end_SetLedPWM:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _SetLedPWM
_ApplicationDebug:
L_end_ApplicationDebug:
JR	RA
NOP	
; end of _ApplicationDebug
