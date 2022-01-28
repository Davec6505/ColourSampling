_ConfigPic:
ADDIU	SP, SP, -20
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
ORI	R2, R0, 2000
SH	R2, Offset(_current_duty1+0)(GP)
ORI	R2, R0, 10000
SH	R2, Offset(_current_duty2+0)(GP)
ORI	R28, R0, 3
MOVZ	R27, R0, R0
ORI	R26, R0, 1
ORI	R25, R0, 5000
JAL	_PWM_Init+0
NOP	
SH	R2, Offset(_pwm_period1+0)(GP)
ORI	R28, R0, 3
MOVZ	R27, R0, R0
ORI	R26, R0, 2
ORI	R25, R0, 5000
JAL	_PWM_Init+0
NOP	
SH	R2, Offset(_pwm_period2+0)(GP)
ORI	R26, R0, 1
LHU	R25, Offset(_current_duty1+0)(GP)
JAL	_PWM_Set_Duty+0
NOP	
ORI	R26, R0, 2
LHU	R25, Offset(_current_duty2+0)(GP)
JAL	_PWM_Set_Duty+0
NOP	
ORI	R25, R0, 1
JAL	_PWM_Stop+0
NOP	
ORI	R25, R0, 2
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
JAL	_PwrUpGSM3+0
NOP	
ORI	R25, R0, 5
JAL	_setup_LM35+0
NOP	
L_end_ConfigPic:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ConfigPic
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
_SetLedPWM:
ADDIU	SP, SP, -12
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
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
J	L__SetLedPWM13
NOP	
L__SetLedPWM14:
L__SetLedPWM13:
; err start address is: 12 (R3)
; err end address is: 12 (R3)
J	L__SetLedPWM12
NOP	
L__SetLedPWM15:
L__SetLedPWM12:
; err start address is: 12 (R3)
LHU	R2, Offset(_current_duty2+0)(GP)
ADDU	R2, R2, R3
; err end address is: 12 (R3)
SH	R2, Offset(_current_duty2+0)(GP)
ORI	R26, R0, 2
ANDI	R25, R2, 65535
JAL	_PWM_Set_Duty+0
NOP	
LUI	R24, 203
ORI	R24, R24, 29524
L_SetLedPWM7:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetLedPWM7
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
SEH	R2, R2
SLTI	R2, R2, -50
BEQ	R2, R0, L__SetLedPWM20
NOP	
J	L__SetLedPWM14
NOP	
L__SetLedPWM20:
SEH	R2, R3
SLTI	R2, R2, 51
BNE	R2, R0, L__SetLedPWM21
NOP	
J	L__SetLedPWM15
NOP	
L__SetLedPWM21:
; err end address is: 12 (R3)
L__SetLedPWM11:
L_end_SetLedPWM:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _SetLedPWM
