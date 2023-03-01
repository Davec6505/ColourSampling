_main:
;ColourSampling.c,33 :: 		void main() {
ADDIU	SP, SP, -72
;ColourSampling.c,40 :: 		int resA=0, resB=0, diff = 0;
;ColourSampling.c,41 :: 		long res_millis_sigstr = 0;
;ColourSampling.c,53 :: 		int sample_test = 0;
;ColourSampling.c,54 :: 		unsigned int pid_out = 0;
;ColourSampling.c,61 :: 		Update_Test = Test_Update_ThingSpeak;
LUI	R2, hi_addr(_Test_Update_ThingSpeak+0)
ORI	R2, R2, lo_addr(_Test_Update_ThingSpeak+0)
SW	R2, Offset(_Update_Test+0)(GP)
;ColourSampling.c,64 :: 		ConfigPic();
JAL	_ConfigPic+0
NOP	
;ColourSampling.c,66 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_main0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main0
NOP	
NOP	
NOP	
;ColourSampling.c,69 :: 		it = TCS3472_INTEGRATIONTIME_24MS;//TCS3472_INTEGRATIONTIME_2_4MS;
ORI	R2, R0, 246
SB	R2, Offset(_it+0)(GP)
;ColourSampling.c,70 :: 		G  = TCS3472_GAIN_1X;
SB	R0, Offset(_G+0)(GP)
;ColourSampling.c,71 :: 		device_Id = TCS3472_1_5;          //TCS347_11_15;
ORI	R2, R0, 68
SB	R2, Offset(_device_Id+0)(GP)
;ColourSampling.c,73 :: 		i = TCS3472_Init(it,G,device_Id);
ORI	R27, R0, 68
MOVZ	R26, R0, R0
ORI	R25, R0, 246
JAL	_TCS3472_Init+0
NOP	
<<<<<<< HEAD
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
=======
;ColourSampling.c,78 :: 		T0_SP.sec = 0;
>>>>>>> temp
SH	R0, Offset(_T0_SP+2)(GP)
;ColourSampling.c,79 :: 		T0_SP.min = 0;
SH	R0, Offset(_T0_SP+4)(GP)
;ColourSampling.c,80 :: 		T0_SP.hr  = 0;
SH	R0, Offset(_T0_SP+6)(GP)
;ColourSampling.c,89 :: 		strcpy(cel_num,GetValuesFromFlash());
JAL	_GetValuesFromFlash+0
NOP	
ADDIU	R3, SP, 0
MOVZ	R26, R2, R0
MOVZ	R25, R3, R0
JAL	_strcpy+0
NOP	
;ColourSampling.c,90 :: 		str_num = strncmp(cel_num,sub_txt,4);
ADDIU	R2, SP, 0
ORI	R27, R0, 4
LUI	R26, hi_addr(_sub_txt+0)
ORI	R26, R26, lo_addr(_sub_txt+0)
MOVZ	R25, R2, R0
JAL	_strncmp+0
NOP	
SH	R2, 22(SP)
;ColourSampling.c,93 :: 		sprintf(txtR,"%u",str_num);
ADDIU	R3, SP, 46
ADDIU	SP, SP, -12
SH	R2, 8(SP)
<<<<<<< HEAD
LUI	R2, hi_addr(?lstr_3_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_3_ColourSampling+0)
=======
LUI	R2, hi_addr(?lstr_1_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_1_ColourSampling+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,97 :: 		,cel_num,txtR);
ADDIU	R3, SP, 46
ADDIU	R2, SP, 0
ADDIU	SP, SP, -16
SW	R3, 12(SP)
SW	R2, 8(SP)
<<<<<<< HEAD
LUI	R2, hi_addr(?lstr_4_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_4_ColourSampling+0)
=======
;ColourSampling.c,96 :: 		" *Result of cmp: %s\r\n"
LUI	R2, hi_addr(?lstr_2_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_2_ColourSampling+0)
>>>>>>> temp
SW	R2, 4(SP)
;ColourSampling.c,94 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;ColourSampling.c,97 :: 		,cel_num,txtR);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
;ColourSampling.c,108 :: 		if(str_num != 0){   //value will be 0 if
LHU	R2, 22(SP)
<<<<<<< HEAD
BNE	R2, R0, L__main26
=======
BNE	R2, R0, L__main52
>>>>>>> temp
NOP	
J	L_main4
NOP	
<<<<<<< HEAD
L__main26:
=======
L__main52:
;ColourSampling.c,109 :: 		SimVars.init_inc = SetupIOT();           //ret 1
>>>>>>> temp
JAL	_SetupIOT+0
NOP	
ANDI	R2, R2, 255
SH	R2, Offset(_SimVars+2)(GP)
;ColourSampling.c,110 :: 		SimVars.init_inc = WaitForSetupSMS(0);   //ret 2
MOVZ	R25, R0, R0
JAL	_WaitForSetupSMS+0
NOP	
ANDI	R2, R2, 255
SH	R2, Offset(_SimVars+2)(GP)
;ColourSampling.c,111 :: 		SimVars.init_inc = GetAPI_Key_SMS();     //ret 3
JAL	_GetAPI_Key_SMS+0
NOP	
ANDI	R2, R2, 255
<<<<<<< HEAD
BNE	R2, R0, L__main28
=======
SH	R2, Offset(_SimVars+2)(GP)
;ColourSampling.c,112 :: 		if(SimVars.init_inc != 0)
LH	R2, Offset(_SimVars+2)(GP)
BNE	R2, R0, L__main54
>>>>>>> temp
NOP	
J	L_main5
NOP	
<<<<<<< HEAD
L__main28:
=======
L__main54:
;ColourSampling.c,113 :: 		SendSMS(SimVars.init_inc,1);  //Device not setup
>>>>>>> temp
ORI	R26, R0, 1
LH	R25, Offset(_SimVars+2)(GP)
JAL	_SendSMS+0
NOP	
J	L_main6
NOP	
<<<<<<< HEAD
L_main5:
=======
L_main3:
;ColourSampling.c,115 :: 		SendSMS(SimVars.init_inc,1); //Device setup
>>>>>>> temp
ORI	R26, R0, 1
LH	R25, Offset(_SimVars+2)(GP)
JAL	_SendSMS+0
NOP	
<<<<<<< HEAD
L_main6:
=======
L_main4:
;ColourSampling.c,116 :: 		cell_ok = 0;
>>>>>>> temp
; cell_ok start address is: 8 (R2)
MOVZ	R2, R0, R0
;ColourSampling.c,117 :: 		}else{
; cell_ok end address is: 8 (R2)
J	L_main7
NOP	
<<<<<<< HEAD
L_main4:
=======
L_main2:
;ColourSampling.c,118 :: 		WaitForResponse(3);
>>>>>>> temp
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
;ColourSampling.c,119 :: 		SimVars.init_inc = 3;
ORI	R2, R0, 3
SH	R2, Offset(_SimVars+2)(GP)
;ColourSampling.c,120 :: 		cell_ok = 1;
; cell_ok start address is: 8 (R2)
ORI	R2, R0, 1
; cell_ok end address is: 8 (R2)
<<<<<<< HEAD
L_main7:
=======
;ColourSampling.c,121 :: 		}
L_main5:
;ColourSampling.c,123 :: 		if(cell_ok == 1){ //only if primary cell num has been saved
>>>>>>> temp
; cell_ok start address is: 8 (R2)
ANDI	R3, R2, 65535
; cell_ok end address is: 8 (R2)
ORI	R2, R0, 1
<<<<<<< HEAD
BEQ	R3, R2, L__main29
=======
BEQ	R3, R2, L__main55
>>>>>>> temp
NOP	
J	L_main8
NOP	
<<<<<<< HEAD
L__main29:
=======
L__main55:
;ColourSampling.c,124 :: 		Read_Thresholds();
>>>>>>> temp
JAL	_Read_Thresholds+0
NOP	
;ColourSampling.c,125 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_main9:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main9
NOP	
NOP	
;ColourSampling.c,126 :: 		SendSMS(4,1); //"Device powered up" =>msg is sent
ORI	R26, R0, 1
ORI	R25, R0, 4
JAL	_SendSMS+0
NOP	
;ColourSampling.c,127 :: 		SimVars.init_inc = 3;
ORI	R2, R0, 3
<<<<<<< HEAD
SB	R2, Offset(_SimVars+1)(GP)
L_main8:
ADDIU	R3, SP, 24
LBU	R2, Offset(_SimVars+1)(GP)
ADDIU	SP, SP, -12
SB	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_5_ColourSampling+0)
=======
SH	R2, Offset(_SimVars+2)(GP)
;ColourSampling.c,128 :: 		}
L_main6:
;ColourSampling.c,131 :: 		sprintf(txtInit,"%d",SimVars.init_inc);
ADDIU	R3, SP, 40
LH	R2, Offset(_SimVars+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_3_ColourSampling+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
ADDIU	R2, SP, 24
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_6_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_6_ColourSampling+0)
=======
;ColourSampling.c,136 :: 		,txtInit,pwm_period2);
ADDIU	R3, SP, 40
LHU	R2, Offset(_pwm_period2+0)(GP)
ADDIU	SP, SP, -16
SH	R2, 12(SP)
SW	R3, 8(SP)
;ColourSampling.c,135 :: 		" *PWM_Period:= %u\r\n"
LUI	R2, hi_addr(?lstr_4_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_4_ColourSampling+0)
>>>>>>> temp
SW	R2, 4(SP)
;ColourSampling.c,132 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;ColourSampling.c,136 :: 		,txtInit,pwm_period2);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
;ColourSampling.c,141 :: 		T0_SP.one_per_Xmin = 0;
LBU	R2, Offset(_T0_SP+10)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_T0_SP+10)(GP)
<<<<<<< HEAD
SH	R0, 54(SP)
L_main11:
=======
;ColourSampling.c,142 :: 		resA = resB = 0;
SH	R0, 70(SP)
;ColourSampling.c,143 :: 		last_millis_sigstr = TMR0.millis;
LW	R2, Offset(_TMR0+0)(GP)
SW	R2, Offset(main_last_millis_sigstr_L0+0)(GP)
;ColourSampling.c,144 :: 		millis_sigstr_sp = 5000;
ORI	R2, R0, 5000
SW	R2, Offset(main_millis_sigstr_sp_L0+0)(GP)
;ColourSampling.c,145 :: 		last_start = 0;
SB	R0, Offset(main_last_start_L0+0)(GP)
;ColourSampling.c,146 :: 		SimVars.start = 0;
LBU	R2, Offset(_SimVars+4)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_SimVars+4)(GP)
;ColourSampling.c,147 :: 		delay_sigstr = 0;
SB	R0, Offset(main_delay_sigstr_L0+0)(GP)
;ColourSampling.c,152 :: 		Initialize_Led_On();
JAL	_Initialize_Led_On+0
NOP	
;ColourSampling.c,158 :: 		RemoveSMSText(10);
ORI	R25, R0, 10
JAL	_RemoveSMSText+0
NOP	
;ColourSampling.c,163 :: 		while(1){
L_main9:
;ColourSampling.c,166 :: 		num = HID_Read();
>>>>>>> temp
JAL	_HID_Read+0
NOP	
; num start address is: 12 (R3)
ANDI	R3, R2, 255
;ColourSampling.c,167 :: 		if(num != 0){
ANDI	R2, R2, 255
<<<<<<< HEAD
BNE	R2, R0, L__main31
NOP	
J	L_main13
NOP	
L__main31:
=======
BNE	R2, R0, L__main57
NOP	
J	L_main11
NOP	
L__main57:
;ColourSampling.c,168 :: 		DoStrings(num);
>>>>>>> temp
ANDI	R25, R3, 255
; num end address is: 12 (R3)
JAL	_DoStrings+0
NOP	
<<<<<<< HEAD
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
=======
;ColourSampling.c,169 :: 		}
L_main11:
;ColourSampling.c,173 :: 		if(SimVars.start && !last_start){
LBU	R2, Offset(_SimVars+4)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__main59
>>>>>>> temp
NOP	
J	L__main45
NOP	
<<<<<<< HEAD
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
=======
L__main59:
LBU	R2, Offset(main_last_start_L0+0)(GP)
BEQ	R2, R0, L__main60
NOP	
J	L__main44
NOP	
L__main60:
L__main43:
;ColourSampling.c,174 :: 		last_start = 1;
ORI	R2, R0, 1
SB	R2, Offset(main_last_start_L0+0)(GP)
;ColourSampling.c,176 :: 		PWM_Start(3); //start temp control
ORI	R25, R0, 3
JAL	_PWM_Start+0
NOP	
;ColourSampling.c,177 :: 		}else if(!SimVars.start && (last_start > 0)){
J	L_main15
NOP	
;ColourSampling.c,173 :: 		if(SimVars.start && !last_start){
L__main45:
L__main44:
;ColourSampling.c,177 :: 		}else if(!SimVars.start && (last_start > 0)){
LBU	R2, Offset(_SimVars+4)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__main61
NOP	
J	L__main47
NOP	
L__main61:
LBU	R2, Offset(main_last_start_L0+0)(GP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main62
NOP	
J	L__main46
NOP	
L__main62:
L__main42:
;ColourSampling.c,178 :: 		last_start = 0;
SB	R0, Offset(main_last_start_L0+0)(GP)
;ColourSampling.c,179 :: 		PWM_Stop(3); //stop temp control
ORI	R25, R0, 3
JAL	_PWM_Stop+0
NOP	
;ColourSampling.c,177 :: 		}else if(!SimVars.start && (last_start > 0)){
L__main47:
L__main46:
;ColourSampling.c,180 :: 		}
L_main15:
;ColourSampling.c,184 :: 		millis_thermister = TMR0.millis - last_millis_thermister;
LW	R3, Offset(main_last_millis_thermister_L0+0)(GP)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R3, R2, R3
;ColourSampling.c,185 :: 		if(millis_thermister > millis_thermister_sp){
LW	R2, Offset(main_millis_thermister_sp_L0+0)(GP)
SLT	R2, R2, R3
BNE	R2, R0, L__main63
>>>>>>> temp
NOP	
J	L_main16
NOP	
<<<<<<< HEAD
L__main35:
=======
L__main63:
;ColourSampling.c,186 :: 		millis_thermister_sp   = 999;
ORI	R2, R0, 999
SW	R2, Offset(main_millis_thermister_sp_L0+0)(GP)
;ColourSampling.c,187 :: 		last_millis_thermister = TMR0.millis;
LW	R2, Offset(_TMR0+0)(GP)
SW	R2, Offset(main_last_millis_thermister_L0+0)(GP)
;ColourSampling.c,189 :: 		sample_test = LM35_Adc_Average(&ave_adc,LM35Pin);
ORI	R26, R0, 15
LUI	R25, hi_addr(main_ave_adc_L0+0)
ORI	R25, R25, lo_addr(main_ave_adc_L0+0)
JAL	_LM35_Adc_Average+0
NOP	
;ColourSampling.c,190 :: 		if(sample_test < 0){
SEH	R2, R2
SLTI	R2, R2, 0
BNE	R2, R0, L__main64
NOP	
J	L_main20
NOP	
L__main64:
;ColourSampling.c,191 :: 		getLM35Temp(_temp,ave_adc);
ADDIU	R2, SP, 24
LH	R26, Offset(main_ave_adc_L0+0)(GP)
MOVZ	R25, R2, R0
JAL	_getLM35Temp+0
NOP	
;ColourSampling.c,192 :: 		ave_adc = 0;
SH	R0, Offset(main_ave_adc_L0+0)(GP)
;ColourSampling.c,193 :: 		current_duty3 = PID_Calculate( 35.00, _temp[1]);
ADDIU	R2, SP, 24
ADDIU	R2, R2, 4
LW	R26, 0(R2)
LUI	R25, 16908
ORI	R25, R25, 0
JAL	_PID_Calculate+0
NOP	
SH	R2, Offset(_current_duty3+0)(GP)
;ColourSampling.c,194 :: 		PWM_Set_Duty(current_duty3, 3);
ORI	R26, R0, 3
ANDI	R25, R2, 65535
JAL	_PWM_Set_Duty+0
NOP	
;ColourSampling.c,210 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_main21:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main21
NOP	
NOP	
NOP	
;ColourSampling.c,212 :: 		}
L_main20:
;ColourSampling.c,214 :: 		}
L_main19:
;ColourSampling.c,218 :: 		if(delay_sigstr > 5){
LBU	R2, Offset(main_delay_sigstr_L0+0)(GP)
SLTIU	R2, R2, 6
BEQ	R2, R0, L__main65
NOP	
J	L_main23
NOP	
L__main65:
;ColourSampling.c,219 :: 		res_millis_sigstr = TMR0.millis - last_millis_sigstr;
LW	R3, Offset(main_last_millis_sigstr_L0+0)(GP)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R3, R2, R3
;ColourSampling.c,220 :: 		if(res_millis_sigstr >= millis_sigstr_sp){
LW	R2, Offset(main_millis_sigstr_sp_L0+0)(GP)
SLT	R2, R3, R2
BEQ	R2, R0, L__main66
NOP	
J	L_main24
NOP	
L__main66:
;ColourSampling.c,221 :: 		millis_sigstr_sp   = 600000;
LUI	R2, 9
ORI	R2, R2, 10176
SW	R2, Offset(main_millis_sigstr_sp_L0+0)(GP)
;ColourSampling.c,222 :: 		last_millis_sigstr = TMR0.millis;
LW	R2, Offset(_TMR0+0)(GP)
SW	R2, Offset(main_last_millis_sigstr_L0+0)(GP)
;ColourSampling.c,224 :: 		if(STAT)
_LX	
EXT	R2, R2, BitPos(STAT+0), 1
BNE	R2, R0, L__main68
NOP	
J	L_main25
NOP	
L__main68:
;ColourSampling.c,225 :: 		SignalStrength();
JAL	_SignalStrength+0
NOP	
L_main25:
;ColourSampling.c,226 :: 		}
L_main24:
;ColourSampling.c,227 :: 		}else
J	L_main26
NOP	
L_main23:
;ColourSampling.c,228 :: 		delay_sigstr++;
LBU	R2, Offset(main_delay_sigstr_L0+0)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(main_delay_sigstr_L0+0)(GP)
L_main26:
;ColourSampling.c,232 :: 		if(SimVars.init_inc >= 5 && last_start > 0){
LH	R2, Offset(_SimVars+2)(GP)
SLTI	R2, R2, 5
BEQ	R2, R0, L__main69
NOP	
J	L__main49
NOP	
L__main69:
LBU	R2, Offset(main_last_start_L0+0)(GP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main70
NOP	
J	L__main48
NOP	
L__main70:
L__main41:
;ColourSampling.c,233 :: 		if(T0_SP.one_per_Xmin){
LBU	R2, Offset(_T0_SP+10)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__main72
NOP	
J	L_main30
NOP	
L__main72:
;ColourSampling.c,234 :: 		PWM_Start(2);
ORI	R25, R0, 2
JAL	_PWM_Start+0
NOP	
;ColourSampling.c,235 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_main31:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main31
NOP	
NOP	
NOP	
;ColourSampling.c,237 :: 		Update_Test(_temp[1]);
ADDIU	R2, SP, 24
ADDIU	R2, R2, 4
LW	R25, 0(R2)
LW	R30, Offset(_Update_Test+0)(GP)
JALR	RA, R30
NOP	
;ColourSampling.c,238 :: 		T0_SP.sec = T0_SP.min = T0_SP.hr = 0; //start timming again
SH	R0, Offset(_T0_SP+6)(GP)
SH	R0, Offset(_T0_SP+4)(GP)
SH	R0, Offset(_T0_SP+2)(GP)
;ColourSampling.c,239 :: 		T0_SP.one_per_Xmin = 0;
LBU	R2, Offset(_T0_SP+10)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_T0_SP+10)(GP)
;ColourSampling.c,240 :: 		PWM_Stop(2);
ORI	R25, R0, 2
JAL	_PWM_Stop+0
NOP	
;ColourSampling.c,241 :: 		}
L_main30:
;ColourSampling.c,232 :: 		if(SimVars.init_inc >= 5 && last_start > 0){
L__main49:
L__main48:
;ColourSampling.c,246 :: 		if(!T0_SP.one_per_sec){
LBU	R2, Offset(_T0_SP+10)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__main73
NOP	
J	L_main33
NOP	
L__main73:
;ColourSampling.c,247 :: 		diff = TestRingPointers();
>>>>>>> temp
JAL	_TestRingPointers+0
NOP	
; diff start address is: 84 (R21)
SEH	R21, R2
;ColourSampling.c,248 :: 		if(diff > 1){
SEH	R2, R2
SLTI	R2, R2, 2
<<<<<<< HEAD
BEQ	R2, R0, L__main36
NOP	
J	L_main17
NOP	
L__main36:
LBU	R2, Offset(_SimVars+1)(GP)
=======
BEQ	R2, R0, L__main74
NOP	
J	L_main34
NOP	
L__main74:
;ColourSampling.c,249 :: 		last_rec_inc = SimVars.init_inc;
LH	R2, Offset(_SimVars+2)(GP)
>>>>>>> temp
SB	R2, 20(SP)
;ColourSampling.c,250 :: 		SimVars.init_inc = 3;
ORI	R2, R0, 3
SH	R2, Offset(_SimVars+2)(GP)
;ColourSampling.c,252 :: 		sprintf(txtI,"%d",resB);
ADDIU	R3, SP, 64
LH	R2, 70(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
<<<<<<< HEAD
LUI	R2, hi_addr(?lstr_7_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_7_ColourSampling+0)
=======
LUI	R2, hi_addr(?lstr_5_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_5_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,253 :: 		sprintf(txtR,"%d",diff);
ADDIU	R3, SP, 46
ADDIU	SP, SP, -12
SH	R21, 8(SP)
; diff end address is: 84 (R21)
LUI	R2, hi_addr(?lstr_6_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_6_ColourSampling+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,254 :: 		sprintf(txtT,"%d",RB.tail);
ADDIU	R3, SP, 58
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	SP, SP, -12
<<<<<<< HEAD
SH	R21, 8(SP)
; diff end address is: 84 (R21)
LUI	R2, hi_addr(?lstr_8_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_8_ColourSampling+0)
=======
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_7_ColourSampling+0)
>>>>>>> temp
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,255 :: 		sprintf(txtH,"%d",RB.head);
ADDIU	R3, SP, 52
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_9_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_9_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
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
=======
;ColourSampling.c,261 :: 		,txtT,txtH,txtR,txtI);
ADDIU	R5, SP, 64
ADDIU	R4, SP, 46
ADDIU	R3, SP, 52
ADDIU	R2, SP, 58
>>>>>>> temp
ADDIU	SP, SP, -24
SW	R5, 20(SP)
SW	R4, 16(SP)
SW	R3, 12(SP)
SW	R2, 8(SP)
<<<<<<< HEAD
LUI	R2, hi_addr(?lstr_11_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_11_ColourSampling+0)
=======
;ColourSampling.c,260 :: 		" *Reply from GetSmsTxt():= %s\r\n"
LUI	R2, hi_addr(?lstr_9_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_9_ColourSampling+0)
>>>>>>> temp
SW	R2, 4(SP)
;ColourSampling.c,256 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;ColourSampling.c,261 :: 		,txtT,txtH,txtR,txtI);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 24
;ColourSampling.c,265 :: 		GetSMSText();
JAL	_GetSMSText+0
NOP	
;ColourSampling.c,266 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
<<<<<<< HEAD
L_main18:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main18
=======
L_main35:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main35
>>>>>>> temp
NOP	
NOP	
NOP	
;ColourSampling.c,267 :: 		if(SimVars.init_inc != 5)
LH	R3, Offset(_SimVars+2)(GP)
ORI	R2, R0, 5
<<<<<<< HEAD
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
=======
BNE	R3, R2, L__main76
NOP	
J	L_main37
NOP	
L__main76:
;ColourSampling.c,268 :: 		SimVars.init_inc = last_rec_inc;
LBU	R2, 20(SP)
SH	R2, Offset(_SimVars+2)(GP)
L_main37:
;ColourSampling.c,269 :: 		}
L_main34:
;ColourSampling.c,271 :: 		}
L_main33:
;ColourSampling.c,276 :: 		if(!RG9_bit)
_LX	
EXT	R2, R2, BitPos(RG9_bit+0), 1
BEQ	R2, R0, L__main77
NOP	
J	L_main38
NOP	
L__main77:
;ColourSampling.c,277 :: 		NVMErasePage(FLASH_Settings_PAddr);//SendSMS(100);
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
L_main38:
;ColourSampling.c,282 :: 		if(!RE4_bit){
_LX	
EXT	R2, R2, BitPos(RE4_bit+0), 1
BEQ	R2, R0, L__main78
NOP	
J	L_main39
NOP	
L__main78:
;ColourSampling.c,284 :: 		ApplicationDebug();
JAL	_ApplicationDebug+0
NOP	
;ColourSampling.c,286 :: 		}
L_main39:
;ColourSampling.c,290 :: 		if (RCON & 0x0010) {
LW	R2, Offset(RCON+0)(GP)
ANDI	R2, R2, 16
BNE	R2, R0, L__main80
>>>>>>> temp
NOP	
J	L_main40
NOP	
L__main80:
;ColourSampling.c,292 :: 		Reset();
JAL	_Reset+0
NOP	
;ColourSampling.c,293 :: 		}
L_main40:
;ColourSampling.c,297 :: 		WDTCLR_bit = 1;
LUI	R2, BitMask(WDTCLR_bit+0)
ORI	R2, R2, BitMask(WDTCLR_bit+0)
_SX	
;ColourSampling.c,298 :: 		}
J	L_main9
NOP	
;ColourSampling.c,299 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
