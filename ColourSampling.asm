_main:
ADDIU	SP, SP, -56
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
ADDIU	R3, SP, 24
ADDIU	SP, SP, -12
SB	R2, 8(SP)
LUI	R2, hi_addr(?lstr_1_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_1_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
L_main2:
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
BEQ	R2, R0, L__main24
NOP	
J	L_main3
NOP	
L__main24:
J	L_main2
NOP	
L_main3:
ORI	R30, R0, 83
SB	R30, 48(SP)
ORI	R30, R0, 116
SB	R30, 49(SP)
ORI	R30, R0, 97
SB	R30, 50(SP)
ORI	R30, R0, 114
SB	R30, 51(SP)
ORI	R30, R0, 116
SB	R30, 52(SP)
MOVZ	R30, R0, R0
SB	R30, 53(SP)
ADDIU	R2, SP, 48
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
ADDIU	R3, SP, 24
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_3_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 24
ADDIU	R2, SP, 0
ADDIU	SP, SP, -16
SW	R3, 12(SP)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_4_ColourSampling+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LHU	R2, 22(SP)
BNE	R2, R0, L__main26
NOP	
J	L_main4
NOP	
L__main26:
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
BNE	R2, R0, L__main28
NOP	
J	L_main5
NOP	
L__main28:
ORI	R26, R0, 1
LBU	R25, Offset(_SimVars+1)(GP)
JAL	_SendSMS+0
NOP	
J	L_main6
NOP	
L_main5:
ORI	R26, R0, 1
LBU	R25, Offset(_SimVars+1)(GP)
JAL	_SendSMS+0
NOP	
L_main6:
; cell_ok start address is: 8 (R2)
MOVZ	R2, R0, R0
; cell_ok end address is: 8 (R2)
J	L_main7
NOP	
L_main4:
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
; cell_ok start address is: 8 (R2)
ORI	R2, R0, 1
; cell_ok end address is: 8 (R2)
L_main7:
; cell_ok start address is: 8 (R2)
ANDI	R3, R2, 65535
; cell_ok end address is: 8 (R2)
ORI	R2, R0, 1
BEQ	R3, R2, L__main29
NOP	
J	L_main8
NOP	
L__main29:
JAL	_Read_Thresholds+0
NOP	
LUI	R24, 1220
ORI	R24, R24, 46079
L_main9:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main9
NOP	
NOP	
ORI	R26, R0, 1
ORI	R25, R0, 4
JAL	_SendSMS+0
NOP	
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
L_main8:
ADDIU	R3, SP, 24
LBU	R2, Offset(_SimVars+1)(GP)
ADDIU	SP, SP, -12
SB	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_5_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R2, SP, 24
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_6_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_6_ColourSampling+0)
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
SH	R0, 54(SP)
L_main11:
JAL	_HID_Read+0
NOP	
; num start address is: 12 (R3)
ANDI	R3, R2, 255
ANDI	R2, R2, 255
BNE	R2, R0, L__main31
NOP	
J	L_main13
NOP	
L__main31:
ANDI	R25, R3, 255
; num end address is: 12 (R3)
JAL	_DoStrings+0
NOP	
L_main13:
LBU	R2, Offset(_SimVars+1)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__main32
NOP	
J	L_main14
NOP	
L__main32:
LBU	R2, Offset(_T0_SP+10)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__main34
NOP	
J	L_main15
NOP	
L__main34:
LW	R30, Offset(_Update_Test+0)(GP)
JALR	RA, R30
NOP	
SH	R0, Offset(_T0_SP+6)(GP)
SH	R0, Offset(_T0_SP+4)(GP)
SH	R0, Offset(_T0_SP+2)(GP)
LBU	R2, Offset(_T0_SP+10)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_T0_SP+10)(GP)
L_main15:
L_main14:
LBU	R2, Offset(_T0_SP+10)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__main35
NOP	
J	L_main16
NOP	
L__main35:
JAL	_TestRingPointers+0
NOP	
; diff start address is: 84 (R21)
SEH	R21, R2
SEH	R2, R2
SLTI	R2, R2, 2
BEQ	R2, R0, L__main36
NOP	
J	L_main17
NOP	
L__main36:
LBU	R2, Offset(_SimVars+1)(GP)
SB	R2, 20(SP)
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
ADDIU	R3, SP, 42
LH	R2, 54(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_7_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 24
ADDIU	SP, SP, -12
SH	R21, 8(SP)
; diff end address is: 84 (R21)
LUI	R2, hi_addr(?lstr_8_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_8_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 36
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_9_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_9_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R3, SP, 30
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_10_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_10_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
ADDIU	R5, SP, 42
ADDIU	R4, SP, 24
ADDIU	R3, SP, 30
ADDIU	R2, SP, 36
ADDIU	SP, SP, -24
SW	R5, 20(SP)
SW	R4, 16(SP)
SW	R3, 12(SP)
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_11_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_11_ColourSampling+0)
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
L_main18:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main18
NOP	
NOP	
NOP	
LBU	R3, Offset(_SimVars+1)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__main38
NOP	
J	L_main20
NOP	
L__main38:
LBU	R2, 20(SP)
SB	R2, Offset(_SimVars+1)(GP)
L_main20:
L_main17:
L_main16:
_LX	
EXT	R2, R2, BitPos(RG9_bit+0), 1
BEQ	R2, R0, L__main39
NOP	
J	L_main21
NOP	
L__main39:
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
L_main21:
_LX	
EXT	R2, R2, BitPos(RE4_bit+0), 1
BEQ	R2, R0, L__main40
NOP	
J	L_main22
NOP	
L__main40:
JAL	_SignalStrength+0
NOP	
SEH	R25, R2
JAL	_PWM_SigStrength+0
NOP	
L_main22:
J	L_main11
NOP	
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
