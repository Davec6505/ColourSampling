_main:
;ColourSampling.c,28 :: 		void main() {
ADDIU	SP, SP, -56
;ColourSampling.c,35 :: 		long res_millis_sigstr = 0;
;ColourSampling.c,36 :: 		int resA=0, resB=0, diff = 0;
;ColourSampling.c,42 :: 		Update_Test = Test_Update_ThingSpeak;
LUI	R2, hi_addr(_Test_Update_ThingSpeak+0)
ORI	R2, R2, lo_addr(_Test_Update_ThingSpeak+0)
SW	R2, Offset(_Update_Test+0)(GP)
;ColourSampling.c,44 :: 		ConfigPic();
JAL	_ConfigPic+0
NOP	
;ColourSampling.c,46 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_main0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main0
NOP	
NOP	
NOP	
;ColourSampling.c,48 :: 		it = TCS3472_INTEGRATIONTIME_24MS;//TCS3472_INTEGRATIONTIME_2_4MS;
ORI	R2, R0, 246
SB	R2, Offset(_it+0)(GP)
;ColourSampling.c,49 :: 		G  = TCS3472_GAIN_1X;
SB	R0, Offset(_G+0)(GP)
;ColourSampling.c,50 :: 		device_Id = TCS3472_1_5;          //TCS347_11_15;
ORI	R2, R0, 68
SB	R2, Offset(_device_Id+0)(GP)
;ColourSampling.c,52 :: 		i = TCS3472_Init(it,G,device_Id);
ORI	R27, R0, 68
MOVZ	R26, R0, R0
ORI	R25, R0, 246
JAL	_TCS3472_Init+0
NOP	
;ColourSampling.c,53 :: 		sprintf(txtR,"%2x",i);
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
;ColourSampling.c,54 :: 		strcat(writebuff,txtR);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
;ColourSampling.c,55 :: 		while(!HID_Write(&writebuff,64));
L_main2:
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
BEQ	R2, R0, L__main25
NOP	
J	L_main3
NOP	
L__main25:
J	L_main2
NOP	
L_main3:
;ColourSampling.c,60 :: 		UART1_Write_Text("Start");
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
;ColourSampling.c,61 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;ColourSampling.c,62 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;ColourSampling.c,64 :: 		T0_SP.sec = 0;
SH	R0, Offset(_T0_SP+2)(GP)
;ColourSampling.c,65 :: 		T0_SP.min = 0;
SH	R0, Offset(_T0_SP+4)(GP)
;ColourSampling.c,66 :: 		T0_SP.hr  = 0;
SH	R0, Offset(_T0_SP+6)(GP)
;ColourSampling.c,73 :: 		strcpy(cel_num,GetValuesFromFlash());
JAL	_GetValuesFromFlash+0
NOP	
ADDIU	R3, SP, 0
MOVZ	R26, R2, R0
MOVZ	R25, R3, R0
JAL	_strcpy+0
NOP	
;ColourSampling.c,74 :: 		str_num = strncmp(cel_num,sub_txt,4);
ADDIU	R2, SP, 0
ORI	R27, R0, 4
LUI	R26, hi_addr(_sub_txt+0)
ORI	R26, R26, lo_addr(_sub_txt+0)
MOVZ	R25, R2, R0
JAL	_strncmp+0
NOP	
SH	R2, 22(SP)
;ColourSampling.c,76 :: 		sprintf(txtR,"%u",str_num);
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
;ColourSampling.c,80 :: 		,cel_num,txtR);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 0
ADDIU	SP, SP, -16
SW	R3, 12(SP)
SW	R2, 8(SP)
;ColourSampling.c,79 :: 		" *Result of cmp: %s\r\n"
LUI	R2, hi_addr(?lstr_4_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_4_ColourSampling+0)
SW	R2, 4(SP)
;ColourSampling.c,77 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;ColourSampling.c,80 :: 		,cel_num,txtR);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
;ColourSampling.c,82 :: 		if(str_num != 0){
LHU	R2, 22(SP)
BNE	R2, R0, L__main27
NOP	
J	L_main4
NOP	
L__main27:
;ColourSampling.c,83 :: 		SimVars.init_inc = SetupIOT();           //ret 1
JAL	_SetupIOT+0
NOP	
SB	R2, Offset(_SimVars+1)(GP)
;ColourSampling.c,84 :: 		SimVars.init_inc = WaitForSetupSMS(0);   //ret 2
MOVZ	R25, R0, R0
JAL	_WaitForSetupSMS+0
NOP	
SB	R2, Offset(_SimVars+1)(GP)
;ColourSampling.c,85 :: 		SimVars.init_inc = GetAPI_Key_SMS();     //ret 3
JAL	_GetAPI_Key_SMS+0
NOP	
SB	R2, Offset(_SimVars+1)(GP)
;ColourSampling.c,86 :: 		if(SimVars.init_inc != 0)
ANDI	R2, R2, 255
BNE	R2, R0, L__main29
NOP	
J	L_main5
NOP	
L__main29:
;ColourSampling.c,87 :: 		SendSMS(SimVars.init_inc,1);
ORI	R26, R0, 1
LBU	R25, Offset(_SimVars+1)(GP)
JAL	_SendSMS+0
NOP	
J	L_main6
NOP	
L_main5:
;ColourSampling.c,89 :: 		SendSMS(SimVars.init_inc,1);
ORI	R26, R0, 1
LBU	R25, Offset(_SimVars+1)(GP)
JAL	_SendSMS+0
NOP	
L_main6:
;ColourSampling.c,90 :: 		cell_ok = 0;
; cell_ok start address is: 8 (R2)
MOVZ	R2, R0, R0
;ColourSampling.c,91 :: 		}else{
; cell_ok end address is: 8 (R2)
J	L_main7
NOP	
L_main4:
;ColourSampling.c,92 :: 		WaitForResponse(3);
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
;ColourSampling.c,93 :: 		SimVars.init_inc = 3;
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
;ColourSampling.c,94 :: 		cell_ok = 1;
; cell_ok start address is: 8 (R2)
ORI	R2, R0, 1
; cell_ok end address is: 8 (R2)
;ColourSampling.c,95 :: 		}
L_main7:
;ColourSampling.c,100 :: 		if(cell_ok == 1){ //only if primary cell num has been saved
; cell_ok start address is: 8 (R2)
ANDI	R3, R2, 65535
; cell_ok end address is: 8 (R2)
ORI	R2, R0, 1
BEQ	R3, R2, L__main30
NOP	
J	L_main8
NOP	
L__main30:
;ColourSampling.c,101 :: 		Read_Thresholds();
JAL	_Read_Thresholds+0
NOP	
;ColourSampling.c,102 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_main9:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main9
NOP	
NOP	
;ColourSampling.c,103 :: 		SendSMS(4,1);
ORI	R26, R0, 1
ORI	R25, R0, 4
JAL	_SendSMS+0
NOP	
;ColourSampling.c,104 :: 		SimVars.init_inc = 3;
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
;ColourSampling.c,105 :: 		}
L_main8:
;ColourSampling.c,108 :: 		sprintf(txtR,"%d",SimVars.init_inc);
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
;ColourSampling.c,112 :: 		,txtR);
ADDIU	R2, SP, 24
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;ColourSampling.c,111 :: 		" *Initial Incrament:= %s\r\n"
LUI	R2, hi_addr(?lstr_6_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_6_ColourSampling+0)
SW	R2, 4(SP)
;ColourSampling.c,109 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;ColourSampling.c,112 :: 		,txtR);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,114 :: 		T0_SP.one_per_Xmin = 0;
LBU	R2, Offset(_T0_SP+10)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_T0_SP+10)(GP)
;ColourSampling.c,115 :: 		resA = resB = 0;
SH	R0, 54(SP)
;ColourSampling.c,118 :: 		last_millis_sigstr = TMR0.millis;
LW	R2, Offset(_TMR0+0)(GP)
SW	R2, Offset(main_last_millis_sigstr_L0+0)(GP)
;ColourSampling.c,119 :: 		millis_sigstr_sp = 5000;
ORI	R2, R0, 5000
SW	R2, Offset(main_millis_sigstr_sp_L0+0)(GP)
;ColourSampling.c,121 :: 		Led_Pwm_Control();
JAL	_Led_Pwm_Control+0
NOP	
;ColourSampling.c,125 :: 		while(1){
L_main11:
;ColourSampling.c,129 :: 		res_millis_sigstr = TMR0.millis - last_millis_sigstr;
LW	R3, Offset(main_last_millis_sigstr_L0+0)(GP)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R3, R2, R3
;ColourSampling.c,130 :: 		if(res_millis_sigstr >= millis_sigstr_sp){
LW	R2, Offset(main_millis_sigstr_sp_L0+0)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__main31
NOP	
J	L_main13
NOP	
L__main31:
;ColourSampling.c,131 :: 		millis_sigstr_sp   = 600000;
LUI	R2, 9
ORI	R2, R2, 10176
SW	R2, Offset(main_millis_sigstr_sp_L0+0)(GP)
;ColourSampling.c,132 :: 		last_millis_sigstr = TMR0.millis;
LW	R2, Offset(_TMR0+0)(GP)
SW	R2, Offset(main_last_millis_sigstr_L0+0)(GP)
;ColourSampling.c,134 :: 		SignalStrength();
JAL	_SignalStrength+0
NOP	
;ColourSampling.c,135 :: 		}
L_main13:
;ColourSampling.c,140 :: 		num = HID_Read();
JAL	_HID_Read+0
NOP	
; num start address is: 12 (R3)
ANDI	R3, R2, 255
;ColourSampling.c,141 :: 		if(num != 0){
ANDI	R2, R2, 255
BNE	R2, R0, L__main33
NOP	
J	L_main14
NOP	
L__main33:
;ColourSampling.c,142 :: 		DoStrings(num);
ANDI	R25, R3, 255
; num end address is: 12 (R3)
JAL	_DoStrings+0
NOP	
;ColourSampling.c,143 :: 		}
L_main14:
;ColourSampling.c,146 :: 		if(SimVars.init_inc >= 5){
LBU	R2, Offset(_SimVars+1)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__main34
NOP	
J	L_main15
NOP	
L__main34:
;ColourSampling.c,147 :: 		if(T0_SP.one_per_Xmin){
LBU	R2, Offset(_T0_SP+10)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__main36
NOP	
J	L_main16
NOP	
L__main36:
;ColourSampling.c,148 :: 		Update_Test();
LW	R30, Offset(_Update_Test+0)(GP)
JALR	RA, R30
NOP	
;ColourSampling.c,149 :: 		T0_SP.sec = T0_SP.min = T0_SP.hr = 0; //start timming again
SH	R0, Offset(_T0_SP+6)(GP)
SH	R0, Offset(_T0_SP+4)(GP)
SH	R0, Offset(_T0_SP+2)(GP)
;ColourSampling.c,150 :: 		T0_SP.one_per_Xmin = 0;
LBU	R2, Offset(_T0_SP+10)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_T0_SP+10)(GP)
;ColourSampling.c,151 :: 		}
L_main16:
;ColourSampling.c,152 :: 		}
L_main15:
;ColourSampling.c,155 :: 		if(!T0_SP.one_per_sec){
LBU	R2, Offset(_T0_SP+10)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__main37
NOP	
J	L_main17
NOP	
L__main37:
;ColourSampling.c,156 :: 		diff = TestRingPointers();
JAL	_TestRingPointers+0
NOP	
; diff start address is: 84 (R21)
SEH	R21, R2
;ColourSampling.c,157 :: 		if(diff > 1){
SEH	R2, R2
SLTI	R2, R2, 2
BEQ	R2, R0, L__main38
NOP	
J	L_main18
NOP	
L__main38:
;ColourSampling.c,158 :: 		last_rec_inc = SimVars.init_inc;
LBU	R2, Offset(_SimVars+1)(GP)
SB	R2, 20(SP)
;ColourSampling.c,159 :: 		SimVars.init_inc = 3;
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
;ColourSampling.c,161 :: 		sprintf(txtI,"%d",resB);
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
;ColourSampling.c,162 :: 		sprintf(txtR,"%d",diff);
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
;ColourSampling.c,163 :: 		sprintf(txtT,"%d",RB.tail);
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
;ColourSampling.c,164 :: 		sprintf(txtH,"%d",RB.head);
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
;ColourSampling.c,170 :: 		,txtT,txtH,txtR,txtI);
ADDIU	R5, SP, 42
ADDIU	R4, SP, 24
ADDIU	R3, SP, 30
ADDIU	R2, SP, 36
ADDIU	SP, SP, -24
SW	R5, 20(SP)
SW	R4, 16(SP)
SW	R3, 12(SP)
SW	R2, 8(SP)
;ColourSampling.c,169 :: 		" *Reply from GetSmsTxt():= %s\r\n"
LUI	R2, hi_addr(?lstr_11_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_11_ColourSampling+0)
SW	R2, 4(SP)
;ColourSampling.c,165 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;ColourSampling.c,170 :: 		,txtT,txtH,txtR,txtI);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 24
;ColourSampling.c,172 :: 		GetSMSText();
JAL	_GetSMSText+0
NOP	
;ColourSampling.c,173 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_main19:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main19
NOP	
NOP	
NOP	
;ColourSampling.c,174 :: 		if(SimVars.init_inc != 5)
LBU	R3, Offset(_SimVars+1)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__main40
NOP	
J	L_main21
NOP	
L__main40:
;ColourSampling.c,175 :: 		SimVars.init_inc = last_rec_inc;
LBU	R2, 20(SP)
SB	R2, Offset(_SimVars+1)(GP)
L_main21:
;ColourSampling.c,176 :: 		}
L_main18:
;ColourSampling.c,178 :: 		}
L_main17:
;ColourSampling.c,181 :: 		if(!RG9_bit)
_LX	
EXT	R2, R2, BitPos(RG9_bit+0), 1
BEQ	R2, R0, L__main41
NOP	
J	L_main22
NOP	
L__main41:
;ColourSampling.c,182 :: 		NVMErasePage(FLASH_Settings_PAddr);//SendSMS(100);
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
L_main22:
;ColourSampling.c,183 :: 		if(!RE4_bit){
_LX	
EXT	R2, R2, BitPos(RE4_bit+0), 1
BEQ	R2, R0, L__main42
NOP	
J	L_main23
NOP	
L__main42:
;ColourSampling.c,194 :: 		SignalStrength();
JAL	_SignalStrength+0
NOP	
;ColourSampling.c,196 :: 		}
L_main23:
;ColourSampling.c,197 :: 		}
J	L_main11
NOP	
;ColourSampling.c,198 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
