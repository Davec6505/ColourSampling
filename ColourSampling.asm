_main:
ADDIU	SP, SP, -40
LUI	R2, hi_addr(_Test_Update_ThingSpeak+0)
ORI	R2, R2, lo_addr(_Test_Update_ThingSpeak+0)
SW	R2, Offset(_Update_Test+0)(GP)
JAL	_ConfigPic+0
NOP	
LUI	R24, 203
ORI	R24, R24, 29524
L_main0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main0
NOP	
NOP	
NOP	
ORI	R2, R0, 255
SB	R2, Offset(_it+0)(GP)
SB	R0, Offset(_G+0)(GP)
ORI	R2, R0, 68
SB	R2, Offset(_device_Id+0)(GP)
ORI	R27, R0, 68
MOVZ	R26, R0, R0
ORI	R25, R0, 255
JAL	_TCS3472_Init+0
NOP	
SH	R0, Offset(_T0_SP+2)(GP)
SH	R0, Offset(_T0_SP+4)(GP)
SH	R0, Offset(_T0_SP+6)(GP)
JAL	_GetValuesFromFlash+0
NOP	
ADDIU	R3, SP, 0
MOVZ	R26, R2, R0
MOVZ	R25, R3, R0
JAL	_strcpy+0
NOP	
ADDIU	R2, SP, 0
ORI	R27, R0, 4
LUI	R26, hi_addr(_sub_txt+0)
ORI	R26, R26, lo_addr(_sub_txt+0)
MOVZ	R25, R2, R0
JAL	_strncmp+0
NOP	
ANDI	R2, R2, 65535
BNE	R2, R0, L__main43
NOP	
J	L_main2
NOP	
L__main43:
JAL	_SetupIOT+0
NOP	
SB	R2, Offset(_SimVars+1)(GP)
MOVZ	R25, R0, R0
JAL	_WaitForSetupSMS+0
NOP	
SB	R2, Offset(_SimVars+1)(GP)
JAL	_GetAPI_Key_SMS+0
NOP	
SB	R2, Offset(_SimVars+1)(GP)
ANDI	R2, R2, 255
BNE	R2, R0, L__main45
NOP	
J	L_main3
NOP	
L__main45:
ORI	R26, R0, 1
LBU	R25, Offset(_SimVars+1)(GP)
JAL	_SendSMS+0
NOP	
J	L_main4
NOP	
L_main3:
ORI	R26, R0, 1
LBU	R25, Offset(_SimVars+1)(GP)
JAL	_SendSMS+0
NOP	
L_main4:
; cell_ok start address is: 8 (R2)
MOVZ	R2, R0, R0
; cell_ok end address is: 8 (R2)
J	L_main5
NOP	
L_main2:
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
; cell_ok start address is: 8 (R2)
ORI	R2, R0, 1
; cell_ok end address is: 8 (R2)
L_main5:
; cell_ok start address is: 8 (R2)
ANDI	R3, R2, 65535
; cell_ok end address is: 8 (R2)
ORI	R2, R0, 1
BEQ	R3, R2, L__main46
NOP	
J	L_main6
NOP	
L__main46:
JAL	_Read_Thresholds+0
NOP	
LUI	R24, 1220
ORI	R24, R24, 46079
L_main7:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main7
NOP	
NOP	
ORI	R26, R0, 1
ORI	R25, R0, 4
JAL	_SendSMS+0
NOP	
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
L_main6:
LBU	R2, Offset(_T0_SP+10)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_T0_SP+10)(GP)
LW	R2, Offset(_TMR0+0)(GP)
SW	R2, Offset(main_last_millis_sigstr_L0+0)(GP)
ORI	R2, R0, 5000
SW	R2, Offset(main_millis_sigstr_sp_L0+0)(GP)
ORI	R25, R0, 2
JAL	_PWM_Start+0
NOP	
LUI	R24, 203
ORI	R24, R24, 29524
L_main9:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main9
NOP	
NOP	
NOP	
JAL	_SetLedPWM+0
NOP	
ORI	R25, R0, 2
JAL	_PWM_Stop+0
NOP	
ORI	R25, R0, 3
JAL	_PWM_Start+0
NOP	
L_main11:
JAL	_HID_Read+0
NOP	
; num start address is: 12 (R3)
ANDI	R3, R2, 255
ANDI	R2, R2, 255
BNE	R2, R0, L__main48
NOP	
J	L_main13
NOP	
L__main48:
ANDI	R25, R3, 255
; num end address is: 12 (R3)
JAL	_DoStrings+0
NOP	
L_main13:
LBU	R2, Offset(_SimVars+2)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__main50
NOP	
J	L__main38
NOP	
L__main50:
LBU	R2, Offset(main_last_start_L1+0)(GP)
BEQ	R2, R0, L__main51
NOP	
J	L__main37
NOP	
L__main51:
L__main36:
ORI	R2, R0, 1
SB	R2, Offset(main_last_start_L1+0)(GP)
J	L_main17
NOP	
L__main38:
L__main37:
LBU	R2, Offset(_SimVars+2)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__main52
NOP	
J	L__main40
NOP	
L__main52:
LBU	R2, Offset(main_last_start_L1+0)(GP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main53
NOP	
J	L__main39
NOP	
L__main53:
L__main35:
SB	R0, Offset(main_last_start_L1+0)(GP)
L__main40:
L__main39:
L_main17:
LW	R3, Offset(main_last_millis_thermister_L0+0)(GP)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R3, R2, R3
LW	R2, Offset(main_millis_thermister_sp_L0+0)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__main54
NOP	
J	L_main21
NOP	
L__main54:
ORI	R2, R0, 999
SW	R2, Offset(main_millis_thermister_sp_L0+0)(GP)
LW	R2, Offset(_TMR0+0)(GP)
SW	R2, Offset(main_last_millis_thermister_L0+0)(GP)
ORI	R26, R0, 15
LUI	R25, hi_addr(main_ave_adc_L0+0)
ORI	R25, R25, lo_addr(main_ave_adc_L0+0)
JAL	_LM35_Adc_Average+0
NOP	
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__main55
NOP	
J	L_main22
NOP	
L__main55:
ADDIU	R2, SP, 24
LH	R26, Offset(main_ave_adc_L0+0)(GP)
MOVZ	R25, R2, R0
JAL	_getLM35Temp+0
NOP	
SH	R0, Offset(main_ave_adc_L0+0)(GP)
ADDIU	R2, SP, 24
ADDIU	R2, R2, 4
LW	R26, 0(R2)
LUI	R25, 16908
ORI	R25, R25, 0
JAL	_PID_Calculate+0
NOP	
ORI	R3, R0, 3780
SUBU	R2, R3, R2
SH	R2, Offset(_current_duty3+0)(GP)
ORI	R26, R0, 3
ANDI	R25, R2, 65535
JAL	_PWM_Set_Duty+0
NOP	
L_main22:
L_main21:
LW	R3, Offset(main_last_millis_sigstr_L0+0)(GP)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R3, R2, R3
LW	R2, Offset(main_millis_sigstr_sp_L0+0)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__main56
NOP	
J	L_main23
NOP	
L__main56:
LUI	R2, 9
ORI	R2, R2, 10176
SW	R2, Offset(main_millis_sigstr_sp_L0+0)(GP)
LW	R2, Offset(_TMR0+0)(GP)
SW	R2, Offset(main_last_millis_sigstr_L0+0)(GP)
_LX	
EXT	R2, R2, BitPos(STAT+0), 1
BNE	R2, R0, L__main58
NOP	
J	L_main24
NOP	
L__main58:
JAL	_SignalStrength+0
NOP	
L_main24:
L_main23:
LBU	R2, Offset(_SimVars+1)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__main59
NOP	
J	L_main25
NOP	
L__main59:
LBU	R2, Offset(_T0_SP+10)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__main61
NOP	
J	L_main26
NOP	
L__main61:
ORI	R25, R0, 2
JAL	_PWM_Start+0
NOP	
LUI	R24, 203
ORI	R24, R24, 29524
L_main27:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main27
NOP	
NOP	
NOP	
ADDIU	R2, SP, 24
ADDIU	R2, R2, 4
LW	R25, 0(R2)
LW	R30, Offset(_Update_Test+0)(GP)
JALR	RA, R30
NOP	
SH	R0, Offset(_T0_SP+6)(GP)
SH	R0, Offset(_T0_SP+4)(GP)
SH	R0, Offset(_T0_SP+2)(GP)
LBU	R2, Offset(_T0_SP+10)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_T0_SP+10)(GP)
ORI	R25, R0, 2
JAL	_PWM_Stop+0
NOP	
L_main26:
L_main25:
LBU	R2, Offset(_T0_SP+10)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__main62
NOP	
J	L_main29
NOP	
L__main62:
JAL	_TestRingPointers+0
NOP	
SEH	R2, R2
SLTI	R2, R2, 2
BEQ	R2, R0, L__main63
NOP	
J	L_main30
NOP	
L__main63:
LBU	R2, Offset(_SimVars+1)(GP)
SB	R2, 20(SP)
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
JAL	_GetSMSText+0
NOP	
LUI	R24, 203
ORI	R24, R24, 29524
L_main31:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main31
NOP	
NOP	
NOP	
LBU	R3, Offset(_SimVars+1)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__main65
NOP	
J	L_main33
NOP	
L__main65:
LBU	R2, 20(SP)
SB	R2, Offset(_SimVars+1)(GP)
L_main33:
L_main30:
L_main29:
_LX	
EXT	R2, R2, BitPos(RE4_bit+0), 1
BEQ	R2, R0, L__main66
NOP	
J	L_main34
NOP	
L__main66:
L_main34:
J	L_main11
NOP	
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
