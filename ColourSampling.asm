_main:
;ColourSampling.c,27 :: 		void main() {
ADDIU	SP, SP, -36
;ColourSampling.c,36 :: 		Update_Test = Test_Update_ThingSpeak;
LUI	R2, hi_addr(_Test_Update_ThingSpeak+0)
ORI	R2, R2, lo_addr(_Test_Update_ThingSpeak+0)
SW	R2, Offset(_Update_Test+0)(GP)
;ColourSampling.c,38 :: 		ConfigPic();
JAL	_ConfigPic+0
NOP	
;ColourSampling.c,40 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_main0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main0
NOP	
NOP	
NOP	
;ColourSampling.c,42 :: 		it = TCS3472_INTEGRATIONTIME_24MS;//TCS3472_INTEGRATIONTIME_2_4MS;
ORI	R2, R0, 246
SB	R2, Offset(_it+0)(GP)
;ColourSampling.c,43 :: 		G  = TCS3472_GAIN_1X;
SB	R0, Offset(_G+0)(GP)
;ColourSampling.c,44 :: 		device_Id = TCS3472_1_5;  //TCS347_11_15;
ORI	R2, R0, 68
SB	R2, Offset(_device_Id+0)(GP)
;ColourSampling.c,46 :: 		i = TCS3472_Init(it,G,device_Id);
ORI	R27, R0, 68
MOVZ	R26, R0, R0
ORI	R25, R0, 246
JAL	_TCS3472_Init+0
NOP	
;ColourSampling.c,47 :: 		sprintf(txtR,"%2x",i);
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
;ColourSampling.c,48 :: 		strcat(writebuff,txtR);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
;ColourSampling.c,49 :: 		while(!HID_Write(&writebuff,64));
L_main2:
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
BEQ	R2, R0, L__main18
NOP	
J	L_main3
NOP	
L__main18:
J	L_main2
NOP	
L_main3:
;ColourSampling.c,54 :: 		UART1_Write_Text("Start");
ORI	R30, R0, 83
SB	R30, 30(SP)
ORI	R30, R0, 116
SB	R30, 31(SP)
ORI	R30, R0, 97
SB	R30, 32(SP)
ORI	R30, R0, 114
SB	R30, 33(SP)
ORI	R30, R0, 116
SB	R30, 34(SP)
MOVZ	R30, R0, R0
SB	R30, 35(SP)
ADDIU	R2, SP, 30
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;ColourSampling.c,55 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;ColourSampling.c,56 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;ColourSampling.c,58 :: 		T0_SP.sec = 0;
SH	R0, Offset(_T0_SP+2)(GP)
;ColourSampling.c,59 :: 		T0_SP.min = 0;
SH	R0, Offset(_T0_SP+4)(GP)
;ColourSampling.c,60 :: 		T0_SP.hr  = 0;
SH	R0, Offset(_T0_SP+6)(GP)
;ColourSampling.c,67 :: 		strcpy(cel_num,GetValuesFromFlash());
JAL	_GetValuesFromFlash+0
NOP	
ADDIU	R3, SP, 4
MOVZ	R26, R2, R0
MOVZ	R25, R3, R0
JAL	_strcpy+0
NOP	
;ColourSampling.c,68 :: 		str_num = strncmp(cel_num,sub_txt,4);
ADDIU	R2, SP, 4
ORI	R27, R0, 4
LUI	R26, hi_addr(_sub_txt+0)
ORI	R26, R26, lo_addr(_sub_txt+0)
MOVZ	R25, R2, R0
JAL	_strncmp+0
NOP	
; str_num start address is: 16 (R4)
SEH	R4, R2
;ColourSampling.c,70 :: 		sprintf(txtR,"%u",str_num);
ADDIU	R3, SP, 24
SH	R4, 0(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_3_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,74 :: 		,cel_num,txtR);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 4
ADDIU	SP, SP, -16
SW	R3, 12(SP)
SW	R2, 8(SP)
;ColourSampling.c,73 :: 		" *Result of cmp: %s\r\n"
LUI	R2, hi_addr(?lstr_4_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_4_ColourSampling+0)
SW	R2, 4(SP)
;ColourSampling.c,71 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;ColourSampling.c,74 :: 		,cel_num,txtR);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LHU	R4, 0(SP)
;ColourSampling.c,76 :: 		if(str_num > 0){
ANDI	R2, R4, 65535
; str_num end address is: 16 (R4)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main19
NOP	
J	L_main4
NOP	
L__main19:
;ColourSampling.c,77 :: 		SimVars.init_inc = SetupIOT();           //ret 1
JAL	_SetupIOT+0
NOP	
SB	R2, Offset(_SimVars+518)(GP)
;ColourSampling.c,78 :: 		SimVars.init_inc = WaitForSetupSMS(0);   //ret 2
MOVZ	R25, R0, R0
JAL	_WaitForSetupSMS+0
NOP	
SB	R2, Offset(_SimVars+518)(GP)
;ColourSampling.c,79 :: 		SimVars.init_inc = GetAPI_Key_SMS();     //ret 3
JAL	_GetAPI_Key_SMS+0
NOP	
SB	R2, Offset(_SimVars+518)(GP)
;ColourSampling.c,80 :: 		if(SimVars.init_inc != 0)
ANDI	R2, R2, 255
BNE	R2, R0, L__main21
NOP	
J	L_main5
NOP	
L__main21:
;ColourSampling.c,81 :: 		SimVars.init_inc = SendSMS(SimVars.init_inc);
LBU	R25, Offset(_SimVars+518)(GP)
JAL	_SendSMS+0
NOP	
SB	R2, Offset(_SimVars+518)(GP)
J	L_main6
NOP	
L_main5:
;ColourSampling.c,83 :: 		SimVars.init_inc = SendSMS(SimVars.init_inc);
LBU	R25, Offset(_SimVars+518)(GP)
JAL	_SendSMS+0
NOP	
SB	R2, Offset(_SimVars+518)(GP)
L_main6:
;ColourSampling.c,84 :: 		}else{
J	L_main7
NOP	
L_main4:
;ColourSampling.c,85 :: 		SimVars.init_inc = 5;
ORI	R2, R0, 5
SB	R2, Offset(_SimVars+518)(GP)
;ColourSampling.c,86 :: 		}
L_main7:
;ColourSampling.c,92 :: 		" *Run");
LUI	R2, hi_addr(?lstr_5_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_5_ColourSampling+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;ColourSampling.c,91 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;ColourSampling.c,92 :: 		" *Run");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;ColourSampling.c,93 :: 		while(1){
L_main8:
;ColourSampling.c,97 :: 		num = HID_Read();
JAL	_HID_Read+0
NOP	
; num start address is: 12 (R3)
ANDI	R3, R2, 255
;ColourSampling.c,98 :: 		if(num != 0){
ANDI	R2, R2, 255
BNE	R2, R0, L__main23
NOP	
J	L_main10
NOP	
L__main23:
;ColourSampling.c,99 :: 		DoStrings(num);
ANDI	R25, R3, 255
; num end address is: 12 (R3)
JAL	_DoStrings+0
NOP	
;ColourSampling.c,100 :: 		}
L_main10:
;ColourSampling.c,103 :: 		if(SimVars.init_inc >= 5){
LBU	R2, Offset(_SimVars+518)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__main24
NOP	
J	L_main11
NOP	
L__main24:
;ColourSampling.c,104 :: 		if(T0_SP.one_per_sec){
LBU	R2, Offset(_T0_SP+8)(GP)
BNE	R2, R0, L__main26
NOP	
J	L_main12
NOP	
L__main26:
;ColourSampling.c,105 :: 		T0_SP.one_per_sec = 0;
SB	R0, Offset(_T0_SP+8)(GP)
;ColourSampling.c,106 :: 		res =  Update_Test(T0_SP.sec,T0_SP.min,T0_SP.hr);
LHU	R27, Offset(_T0_SP+6)(GP)
LHU	R26, Offset(_T0_SP+4)(GP)
LHU	R25, Offset(_T0_SP+2)(GP)
LW	R30, Offset(_Update_Test+0)(GP)
JALR	RA, R30
NOP	
SH	R2, 2(SP)
;ColourSampling.c,107 :: 		if(res >= 1){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__main27
NOP	
J	L_main13
NOP	
L__main27:
;ColourSampling.c,108 :: 		T0_SP.sec = 0;
SH	R0, Offset(_T0_SP+2)(GP)
;ColourSampling.c,109 :: 		T0_SP.min = 0;
SH	R0, Offset(_T0_SP+4)(GP)
;ColourSampling.c,110 :: 		T0_SP.hr = 0;
SH	R0, Offset(_T0_SP+6)(GP)
;ColourSampling.c,111 :: 		}
L_main13:
;ColourSampling.c,112 :: 		}
L_main12:
;ColourSampling.c,113 :: 		}
L_main11:
;ColourSampling.c,116 :: 		res = TestRingPointers();
JAL	_TestRingPointers+0
NOP	
SH	R2, 2(SP)
;ColourSampling.c,117 :: 		if(res > 1){
SEH	R2, R2
SLTI	R2, R2, 2
BEQ	R2, R0, L__main28
NOP	
J	L_main14
NOP	
L__main28:
;ColourSampling.c,119 :: 		sprintf(txtR,"d",res);
ADDIU	R3, SP, 24
LH	R2, 2(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_6_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_6_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,122 :: 		,txtR);
ADDIU	R2, SP, 24
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;ColourSampling.c,121 :: 		" *Diff in pointers"
LUI	R2, hi_addr(?lstr_7_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_7_ColourSampling+0)
SW	R2, 4(SP)
;ColourSampling.c,120 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;ColourSampling.c,122 :: 		,txtR);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,123 :: 		GetSMSText();
JAL	_GetSMSText+0
NOP	
;ColourSampling.c,125 :: 		}
L_main14:
;ColourSampling.c,128 :: 		if(!RG9_bit)
_LX	
EXT	R2, R2, BitPos(RG9_bit+0), 1
BEQ	R2, R0, L__main29
NOP	
J	L_main15
NOP	
L__main29:
;ColourSampling.c,129 :: 		NVMErasePage(FLASH_Settings_PAddr);//SendSMS(100);
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
L_main15:
;ColourSampling.c,130 :: 		if(!RE4_bit){
_LX	
EXT	R2, R2, BitPos(RE4_bit+0), 1
BEQ	R2, R0, L__main30
NOP	
J	L_main16
NOP	
L__main30:
;ColourSampling.c,131 :: 		GetValuesFromFlash();
JAL	_GetValuesFromFlash+0
NOP	
;ColourSampling.c,132 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;ColourSampling.c,133 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;ColourSampling.c,134 :: 		}
L_main16:
;ColourSampling.c,135 :: 		}
J	L_main8
NOP	
;ColourSampling.c,136 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
