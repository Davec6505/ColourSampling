_main:
;ColourSampling.c,28 :: 		void main() {
ADDIU	SP, SP, -56
;ColourSampling.c,33 :: 		int resA=0, resB=0, diff = 0;
;ColourSampling.c,39 :: 		Update_Test = Test_Update_ThingSpeak;
LUI	R2, hi_addr(_Test_Update_ThingSpeak+0)
ORI	R2, R2, lo_addr(_Test_Update_ThingSpeak+0)
SW	R2, Offset(_Update_Test+0)(GP)
;ColourSampling.c,41 :: 		ConfigPic();
JAL	_ConfigPic+0
NOP	
;ColourSampling.c,43 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_main0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main0
NOP	
NOP	
NOP	
;ColourSampling.c,45 :: 		it = TCS3472_INTEGRATIONTIME_24MS;//TCS3472_INTEGRATIONTIME_2_4MS;
ORI	R2, R0, 246
SB	R2, Offset(_it+0)(GP)
;ColourSampling.c,46 :: 		G  = TCS3472_GAIN_1X;
SB	R0, Offset(_G+0)(GP)
;ColourSampling.c,47 :: 		device_Id = TCS3472_1_5;          //TCS347_11_15;
ORI	R2, R0, 68
SB	R2, Offset(_device_Id+0)(GP)
;ColourSampling.c,49 :: 		i = TCS3472_Init(it,G,device_Id);
ORI	R27, R0, 68
MOVZ	R26, R0, R0
ORI	R25, R0, 246
JAL	_TCS3472_Init+0
NOP	
;ColourSampling.c,50 :: 		sprintf(txtR,"%2x",i);
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
;ColourSampling.c,51 :: 		strcat(writebuff,txtR);
ADDIU	R2, SP, 24
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
;ColourSampling.c,52 :: 		while(!HID_Write(&writebuff,64));
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
;ColourSampling.c,57 :: 		UART1_Write_Text("Start");
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
;ColourSampling.c,58 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;ColourSampling.c,59 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;ColourSampling.c,61 :: 		T0_SP.sec = 0;
SH	R0, Offset(_T0_SP+2)(GP)
;ColourSampling.c,62 :: 		T0_SP.min = 0;
SH	R0, Offset(_T0_SP+4)(GP)
;ColourSampling.c,63 :: 		T0_SP.hr  = 0;
SH	R0, Offset(_T0_SP+6)(GP)
;ColourSampling.c,70 :: 		strcpy(cel_num,GetValuesFromFlash());
JAL	_GetValuesFromFlash+0
NOP	
ADDIU	R3, SP, 0
MOVZ	R26, R2, R0
MOVZ	R25, R3, R0
JAL	_strcpy+0
NOP	
;ColourSampling.c,71 :: 		str_num = strncmp(cel_num,sub_txt,4);
ADDIU	R2, SP, 0
ORI	R27, R0, 4
LUI	R26, hi_addr(_sub_txt+0)
ORI	R26, R26, lo_addr(_sub_txt+0)
MOVZ	R25, R2, R0
JAL	_strncmp+0
NOP	
SH	R2, 22(SP)
;ColourSampling.c,73 :: 		sprintf(txtR,"%u",str_num);
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
;ColourSampling.c,77 :: 		,cel_num,txtR);
ADDIU	R3, SP, 24
ADDIU	R2, SP, 0
ADDIU	SP, SP, -16
SW	R3, 12(SP)
SW	R2, 8(SP)
;ColourSampling.c,76 :: 		" *Result of cmp: %s\r\n"
LUI	R2, hi_addr(?lstr_4_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_4_ColourSampling+0)
SW	R2, 4(SP)
;ColourSampling.c,74 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;ColourSampling.c,77 :: 		,cel_num,txtR);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
;ColourSampling.c,79 :: 		if(str_num != 0){
LHU	R2, 22(SP)
BNE	R2, R0, L__main26
NOP	
J	L_main4
NOP	
L__main26:
;ColourSampling.c,80 :: 		SimVars.init_inc = SetupIOT();           //ret 1
JAL	_SetupIOT+0
NOP	
SB	R2, Offset(_SimVars+1)(GP)
;ColourSampling.c,81 :: 		SimVars.init_inc = WaitForSetupSMS(0);   //ret 2
MOVZ	R25, R0, R0
JAL	_WaitForSetupSMS+0
NOP	
SB	R2, Offset(_SimVars+1)(GP)
;ColourSampling.c,82 :: 		SimVars.init_inc = GetAPI_Key_SMS();     //ret 3
JAL	_GetAPI_Key_SMS+0
NOP	
SB	R2, Offset(_SimVars+1)(GP)
;ColourSampling.c,83 :: 		if(SimVars.init_inc != 0)
ANDI	R2, R2, 255
BNE	R2, R0, L__main28
NOP	
J	L_main5
NOP	
L__main28:
;ColourSampling.c,84 :: 		SendSMS(SimVars.init_inc,1);
ORI	R26, R0, 1
LBU	R25, Offset(_SimVars+1)(GP)
JAL	_SendSMS+0
NOP	
J	L_main6
NOP	
L_main5:
;ColourSampling.c,86 :: 		SendSMS(SimVars.init_inc,1);
ORI	R26, R0, 1
LBU	R25, Offset(_SimVars+1)(GP)
JAL	_SendSMS+0
NOP	
L_main6:
;ColourSampling.c,87 :: 		cell_ok = 0;
; cell_ok start address is: 8 (R2)
MOVZ	R2, R0, R0
;ColourSampling.c,88 :: 		}else{
; cell_ok end address is: 8 (R2)
J	L_main7
NOP	
L_main4:
;ColourSampling.c,89 :: 		WaitForResponse(3);
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
;ColourSampling.c,90 :: 		SimVars.init_inc = 3;
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
;ColourSampling.c,91 :: 		cell_ok = 1;
; cell_ok start address is: 8 (R2)
ORI	R2, R0, 1
; cell_ok end address is: 8 (R2)
;ColourSampling.c,92 :: 		}
L_main7:
;ColourSampling.c,97 :: 		if(cell_ok == 1){ //only if primary cell num has been saved
; cell_ok start address is: 8 (R2)
ANDI	R3, R2, 65535
; cell_ok end address is: 8 (R2)
ORI	R2, R0, 1
BEQ	R3, R2, L__main29
NOP	
J	L_main8
NOP	
L__main29:
;ColourSampling.c,98 :: 		Read_Thresholds();
JAL	_Read_Thresholds+0
NOP	
;ColourSampling.c,99 :: 		Delay_ms(3000);
LUI	R24, 1220
ORI	R24, R24, 46079
L_main9:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main9
NOP	
NOP	
;ColourSampling.c,100 :: 		SendSMS(4,1);
ORI	R26, R0, 1
ORI	R25, R0, 4
JAL	_SendSMS+0
NOP	
;ColourSampling.c,101 :: 		SimVars.init_inc = 3;
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
;ColourSampling.c,102 :: 		}
L_main8:
;ColourSampling.c,105 :: 		sprintf(txtR,"%d",SimVars.init_inc);
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
;ColourSampling.c,109 :: 		,txtR);
ADDIU	R2, SP, 24
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;ColourSampling.c,108 :: 		" *Initial Incrament:= %s\r\n"
LUI	R2, hi_addr(?lstr_6_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_6_ColourSampling+0)
SW	R2, 4(SP)
;ColourSampling.c,106 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;ColourSampling.c,109 :: 		,txtR);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,111 :: 		T0_SP.one_per_Xmin = 0;
LBU	R2, Offset(_T0_SP+10)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_T0_SP+10)(GP)
;ColourSampling.c,112 :: 		resA = resB = 0;
SH	R0, 54(SP)
;ColourSampling.c,116 :: 		while(1){
L_main11:
;ColourSampling.c,119 :: 		num = HID_Read();
JAL	_HID_Read+0
NOP	
; num start address is: 12 (R3)
ANDI	R3, R2, 255
;ColourSampling.c,120 :: 		if(num != 0){
ANDI	R2, R2, 255
BNE	R2, R0, L__main31
NOP	
J	L_main13
NOP	
L__main31:
;ColourSampling.c,121 :: 		DoStrings(num);
ANDI	R25, R3, 255
; num end address is: 12 (R3)
JAL	_DoStrings+0
NOP	
;ColourSampling.c,122 :: 		}
L_main13:
;ColourSampling.c,125 :: 		if(SimVars.init_inc >= 5){
LBU	R2, Offset(_SimVars+1)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__main32
NOP	
J	L_main14
NOP	
L__main32:
;ColourSampling.c,126 :: 		if(T0_SP.one_per_Xmin){
LBU	R2, Offset(_T0_SP+10)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__main34
NOP	
J	L_main15
NOP	
L__main34:
;ColourSampling.c,127 :: 		Update_Test();
LW	R30, Offset(_Update_Test+0)(GP)
JALR	RA, R30
NOP	
;ColourSampling.c,128 :: 		T0_SP.sec = T0_SP.min = T0_SP.hr = 0; //start timming again
SH	R0, Offset(_T0_SP+6)(GP)
SH	R0, Offset(_T0_SP+4)(GP)
SH	R0, Offset(_T0_SP+2)(GP)
;ColourSampling.c,129 :: 		T0_SP.one_per_Xmin = 0;
LBU	R2, Offset(_T0_SP+10)(GP)
INS	R2, R0, 1, 1
SB	R2, Offset(_T0_SP+10)(GP)
;ColourSampling.c,130 :: 		}
L_main15:
;ColourSampling.c,131 :: 		}
L_main14:
;ColourSampling.c,134 :: 		if(!T0_SP.one_per_sec){
LBU	R2, Offset(_T0_SP+10)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__main35
NOP	
J	L_main16
NOP	
L__main35:
;ColourSampling.c,135 :: 		diff = TestRingPointers();
JAL	_TestRingPointers+0
NOP	
; diff start address is: 84 (R21)
SEH	R21, R2
;ColourSampling.c,136 :: 		if(diff > 1){
SEH	R2, R2
SLTI	R2, R2, 2
BEQ	R2, R0, L__main36
NOP	
J	L_main17
NOP	
L__main36:
;ColourSampling.c,137 :: 		last_rec_inc = SimVars.init_inc;
LBU	R2, Offset(_SimVars+1)(GP)
SB	R2, 20(SP)
;ColourSampling.c,138 :: 		SimVars.init_inc = 3;
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
;ColourSampling.c,140 :: 		sprintf(txtI,"%d",resB);
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
;ColourSampling.c,141 :: 		sprintf(txtR,"%d",diff);
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
;ColourSampling.c,142 :: 		sprintf(txtT,"%d",RB.tail);
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
;ColourSampling.c,143 :: 		sprintf(txtH,"%d",RB.head);
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
;ColourSampling.c,149 :: 		,txtT,txtH,txtR,txtI);
ADDIU	R5, SP, 42
ADDIU	R4, SP, 24
ADDIU	R3, SP, 30
ADDIU	R2, SP, 36
ADDIU	SP, SP, -24
SW	R5, 20(SP)
SW	R4, 16(SP)
SW	R3, 12(SP)
SW	R2, 8(SP)
;ColourSampling.c,148 :: 		" *Reply from GetSmsTxt():= %s\r\n"
LUI	R2, hi_addr(?lstr_11_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_11_ColourSampling+0)
SW	R2, 4(SP)
;ColourSampling.c,144 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;ColourSampling.c,149 :: 		,txtT,txtH,txtR,txtI);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 24
;ColourSampling.c,151 :: 		GetSMSText();
JAL	_GetSMSText+0
NOP	
;ColourSampling.c,152 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_main18:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main18
NOP	
NOP	
NOP	
;ColourSampling.c,153 :: 		if(SimVars.init_inc != 5)
LBU	R3, Offset(_SimVars+1)(GP)
ORI	R2, R0, 5
BNE	R3, R2, L__main38
NOP	
J	L_main20
NOP	
L__main38:
;ColourSampling.c,154 :: 		SimVars.init_inc = last_rec_inc;
LBU	R2, 20(SP)
SB	R2, Offset(_SimVars+1)(GP)
L_main20:
;ColourSampling.c,155 :: 		}
L_main17:
;ColourSampling.c,157 :: 		}
L_main16:
;ColourSampling.c,160 :: 		if(!RG9_bit)
_LX	
EXT	R2, R2, BitPos(RG9_bit+0), 1
BEQ	R2, R0, L__main39
NOP	
J	L_main21
NOP	
L__main39:
;ColourSampling.c,161 :: 		NVMErasePage(FLASH_Settings_PAddr);//SendSMS(100);
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
L_main21:
;ColourSampling.c,162 :: 		if(!RE4_bit){
_LX	
EXT	R2, R2, BitPos(RE4_bit+0), 1
BEQ	R2, R0, L__main40
NOP	
J	L_main22
NOP	
L__main40:
;ColourSampling.c,163 :: 		GetValuesFromFlash();
JAL	_GetValuesFromFlash+0
NOP	
;ColourSampling.c,164 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;ColourSampling.c,165 :: 		GetScaledValues(RawData,&FltData);
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_GetScaledValues+0
NOP	
;ColourSampling.c,166 :: 		FltData[3] = TCS3472_CalcHue(&FltData);
LUI	R25, hi_addr(_FltData+0)
ORI	R25, R25, lo_addr(_FltData+0)
JAL	_TCS3472_CalcHue+0
NOP	
SW	R2, Offset(_FltData+12)(GP)
;ColourSampling.c,167 :: 		SendData(RawData,FltData);
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;ColourSampling.c,168 :: 		}
L_main22:
;ColourSampling.c,169 :: 		}
J	L_main11
NOP	
;ColourSampling.c,170 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
