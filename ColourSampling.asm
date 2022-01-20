_main:
ADDIU	SP, SP, -132
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
ORI	R2, R0, 246
SB	R2, Offset(_it+0)(GP)
SB	R0, Offset(_G+0)(GP)
ORI	R2, R0, 68
SB	R2, Offset(_device_Id+0)(GP)
ORI	R27, R0, 68
MOVZ	R26, R0, R0
ORI	R25, R0, 246
JAL	_TCS3472_Init+0
NOP	
ORI	R30, R0, 83
SB	R30, 124(SP)
ORI	R30, R0, 116
SB	R30, 125(SP)
ORI	R30, R0, 97
SB	R30, 126(SP)
ORI	R30, R0, 114
SB	R30, 127(SP)
ORI	R30, R0, 116
SB	R30, 128(SP)
MOVZ	R30, R0, R0
SB	R30, 129(SP)
ADDIU	R2, SP, 124
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
ORI	R25, R0, 10
JAL	_UART1_Write+0
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
SH	R2, 22(SP)
ADDIU	R3, SP, 40
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_2_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_2_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 40
ADDIU	R2, SP, 0
ADDIU	SP, SP, -16
SW	R3, 12(SP)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_3_ColourSampling+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LHU	R2, 22(SP)
BNE	R2, R0, L__main29
NOP	
J	L_main2
NOP	
L__main29:
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
BNE	R2, R0, L__main31
NOP	
J	L_main3
NOP	
L__main31:
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
BEQ	R3, R2, L__main32
NOP	
J	L_main6
NOP	
L__main32:
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
ADDIU	R3, SP, 40
LBU	R2, Offset(_SimVars+1)(GP)
ADDIU	SP, SP, -12
SB	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_4_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R2, SP, 40
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_5_ColourSampling+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LBU	R2, Offset(_T0_SP+10)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_T0_SP+10)(GP)
SH	R0, 130(SP)
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
L_main11:
LW	R3, Offset(main_last_millis_thermister_L0+0)(GP)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R3, R2, R3
LW	R2, Offset(main_millis_thermister_sp_L0+0)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__main33
NOP	
J	L_main13
NOP	
L__main33:
ORI	R2, R0, 999
SW	R2, Offset(main_millis_thermister_sp_L0+0)(GP)
LW	R2, Offset(_TMR0+0)(GP)
SW	R2, Offset(main_last_millis_thermister_L0+0)(GP)
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_getTemp+0
NOP	
ADDIU	R2, SP, 24
LW	R2, 0(R2)
ADDIU	R3, SP, 64
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_6_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_6_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R2, SP, 24
ADDIU	R2, R2, 4
LW	R2, 0(R2)
ADDIU	R3, SP, 79
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_7_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R2, SP, 24
ADDIU	R2, R2, 8
LW	R2, 0(R2)
ADDIU	R3, SP, 94
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_8_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_8_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R2, SP, 24
ADDIU	R2, R2, 12
LW	R2, 0(R2)
ADDIU	R3, SP, 109
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_9_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_9_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R5, SP, 109
ADDIU	R4, SP, 94
ADDIU	R3, SP, 79
ADDIU	R2, SP, 64
ADDIU	SP, SP, -24
SW	R5, 20(SP)
SW	R4, 16(SP)
SW	R3, 12(SP)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_10_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_10_ColourSampling+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 24
L_main13:
LW	R3, Offset(main_last_millis_sigstr_L0+0)(GP)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R3, R2, R3
LW	R2, Offset(main_millis_sigstr_sp_L0+0)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__main34
NOP	
J	L_main14
NOP	
L__main34:
LUI	R2, 9
ORI	R2, R2, 10176
SW	R2, Offset(main_millis_sigstr_sp_L0+0)(GP)
LW	R2, Offset(_TMR0+0)(GP)
SW	R2, Offset(main_last_millis_sigstr_L0+0)(GP)
JAL	_SignalStrength+0
NOP	
L_main14:
JAL	_HID_Read+0
NOP	
; num start address is: 12 (R3)
ANDI	R3, R2, 255
ANDI	R2, R2, 255
BNE	R2, R0, L__main36
NOP	
J	L_main15
NOP	
L__main36:
ANDI	R25, R3, 255
; num end address is: 12 (R3)
JAL	_DoStrings+0
NOP	
L_main15:
LBU	R2, Offset(_SimVars+1)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__main37
NOP	
J	L_main16
NOP	
L__main37:
LBU	R2, Offset(_T0_SP+10)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__main39
NOP	
J	L_main17
NOP	
L__main39:
ORI	R25, R0, 2
JAL	_PWM_Start+0
NOP	
LUI	R24, 203
ORI	R24, R24, 29524
L_main18:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main18
NOP	
NOP	
NOP	
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
L_main17:
L_main16:
LBU	R2, Offset(_T0_SP+10)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__main40
NOP	
J	L_main20
NOP	
L__main40:
JAL	_TestRingPointers+0
NOP	
; diff start address is: 84 (R21)
SEH	R21, R2
SEH	R2, R2
SLTI	R2, R2, 2
BEQ	R2, R0, L__main41
NOP	
J	L_main21
NOP	
L__main41:
LBU	R2, Offset(_SimVars+1)(GP)
SB	R2, 20(SP)
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
ADDIU	R3, SP, 58
LH	R2, 130(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_11_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_11_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 40
ADDIU	SP, SP, -12
SH	R21, 8(SP)
; diff end address is: 84 (R21)
LUI	R2, hi_addr(?lstr_12_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_12_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 52
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_13_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_13_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 46
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_14_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_14_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R5, SP, 58
ADDIU	R4, SP, 40
ADDIU	R3, SP, 46
ADDIU	R2, SP, 52
ADDIU	SP, SP, -24
SW	R5, 20(SP)
SW	R4, 16(SP)
SW	R3, 12(SP)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_15_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_15_ColourSampling+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 24
JAL	_GetSMSText+0
NOP	
LUI	R24, 203
ORI	R24, R24, 29524
L_main22:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main22
NOP	
NOP	
NOP	
LBU	R3, Offset(_SimVars+1)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__main43
NOP	
J	L_main24
NOP	
L__main43:
LBU	R2, 20(SP)
SB	R2, Offset(_SimVars+1)(GP)
L_main24:
L_main21:
L_main20:
_LX	
EXT	R2, R2, BitPos(RG9_bit+0), 1
BEQ	R2, R0, L__main44
NOP	
J	L_main25
NOP	
L__main44:
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
L_main25:
_LX	
EXT	R2, R2, BitPos(RE4_bit+0), 1
BEQ	R2, R0, L__main45
NOP	
J	L_main26
NOP	
L__main45:
JAL	_GetValuesFromFlash+0
NOP	
L_main26:
J	L_main11
NOP	
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
