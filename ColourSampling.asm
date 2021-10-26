_main:
;ColourSampling.c,27 :: 		void main() {
ADDIU	SP, SP, -8
;ColourSampling.c,34 :: 		Update_Test = Test_Update_ThingSpeak;
LUI	R2, hi_addr(_Test_Update_ThingSpeak+0)
ORI	R2, R2, lo_addr(_Test_Update_ThingSpeak+0)
SW	R2, Offset(_Update_Test+0)(GP)
;ColourSampling.c,36 :: 		ConfigPic();
JAL	_ConfigPic+0
NOP	
;ColourSampling.c,38 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_main0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main0
NOP	
NOP	
NOP	
;ColourSampling.c,40 :: 		it = TCS3472_INTEGRATIONTIME_24MS;//TCS3472_INTEGRATIONTIME_2_4MS;
ORI	R2, R0, 246
SB	R2, Offset(_it+0)(GP)
;ColourSampling.c,41 :: 		G  = TCS3472_GAIN_1X;
SB	R0, Offset(_G+0)(GP)
;ColourSampling.c,42 :: 		device_Id = TCS3472_1_5;  //TCS347_11_15;
ORI	R2, R0, 68
SB	R2, Offset(_device_Id+0)(GP)
;ColourSampling.c,44 :: 		i = TCS3472_Init(it,G,device_Id);
ORI	R27, R0, 68
MOVZ	R26, R0, R0
ORI	R25, R0, 246
JAL	_TCS3472_Init+0
NOP	
;ColourSampling.c,45 :: 		sprintf(txtR,"%2x",i);
ADDIU	R3, SP, 0
ADDIU	SP, SP, -12
SB	R2, 8(SP)
LUI	R2, hi_addr(?lstr_1_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_1_ColourSampling+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,46 :: 		strcat(writebuff,txtR);
ADDIU	R2, SP, 0
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
;ColourSampling.c,47 :: 		while(!HID_Write(&writebuff,64));
L_main2:
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
BEQ	R2, R0, L__main12
NOP	
J	L_main3
NOP	
L__main12:
J	L_main2
NOP	
L_main3:
;ColourSampling.c,52 :: 		UART1_Write_Text("Start");
LUI	R25, hi_addr(?lstr2_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr2_ColourSampling+0)
JAL	_UART1_Write_Text+0
NOP	
;ColourSampling.c,53 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;ColourSampling.c,54 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;ColourSampling.c,61 :: 		SimVars.init_inc = 0;
SB	R0, Offset(_SimVars+6)(GP)
;ColourSampling.c,62 :: 		SimVars.init_inc = SetupIOT();        //ret 1
JAL	_SetupIOT+0
NOP	
SB	R2, Offset(_SimVars+6)(GP)
;ColourSampling.c,63 :: 		SimVars.init_inc = WaitForSetupSMS(); //ret 2
JAL	_WaitForSetupSMS+0
NOP	
SB	R2, Offset(_SimVars+6)(GP)
;ColourSampling.c,64 :: 		SimVars.init_inc = SendResponseSMS();    //ret 3
JAL	_SendResponseSMS+0
NOP	
SB	R2, Offset(_SimVars+6)(GP)
;ColourSampling.c,70 :: 		while(1){
L_main4:
;ColourSampling.c,74 :: 		num = HID_Read();
JAL	_HID_Read+0
NOP	
; num start address is: 12 (R3)
ANDI	R3, R2, 255
;ColourSampling.c,75 :: 		if(num != 0){
ANDI	R2, R2, 255
BNE	R2, R0, L__main14
NOP	
J	L_main6
NOP	
L__main14:
;ColourSampling.c,76 :: 		DoStrings(num);
ANDI	R25, R3, 255
; num end address is: 12 (R3)
JAL	_DoStrings+0
NOP	
;ColourSampling.c,77 :: 		}
L_main6:
;ColourSampling.c,80 :: 		if(SimVars.init_inc >= 5){
LBU	R2, Offset(_SimVars+6)(GP)
SLTIU	R2, R2, 5
BEQ	R2, R0, L__main15
NOP	
J	L_main7
NOP	
L__main15:
;ColourSampling.c,81 :: 		if(T0_SP.one_per_sec){
LBU	R2, Offset(_T0_SP+8)(GP)
BNE	R2, R0, L__main17
NOP	
J	L_main8
NOP	
L__main17:
;ColourSampling.c,82 :: 		T0_SP.one_per_sec = 0;
SB	R0, Offset(_T0_SP+8)(GP)
;ColourSampling.c,83 :: 		res =  Update_Test(T0_SP.sec,T0_SP.min,T0_SP.hr);
LHU	R27, Offset(_T0_SP+6)(GP)
LHU	R26, Offset(_T0_SP+4)(GP)
LHU	R25, Offset(_T0_SP+2)(GP)
LW	R30, Offset(_Update_Test+0)(GP)
JALR	RA, R30
NOP	
;ColourSampling.c,84 :: 		if(res >= 1){
SEH	R2, R2
SLTI	R2, R2, 1
BEQ	R2, R0, L__main18
NOP	
J	L_main9
NOP	
L__main18:
;ColourSampling.c,85 :: 		T0_SP.sec = 0;
SH	R0, Offset(_T0_SP+2)(GP)
;ColourSampling.c,86 :: 		T0_SP.min = 0;
SH	R0, Offset(_T0_SP+4)(GP)
;ColourSampling.c,87 :: 		T0_SP.hr = 0;
SH	R0, Offset(_T0_SP+6)(GP)
;ColourSampling.c,88 :: 		}
L_main9:
;ColourSampling.c,89 :: 		}
L_main8:
;ColourSampling.c,90 :: 		}
L_main7:
;ColourSampling.c,92 :: 		if(!RG9_bit)
_LX	
EXT	R2, R2, BitPos(RG9_bit+0), 1
BEQ	R2, R0, L__main19
NOP	
J	L_main10
NOP	
L__main19:
;ColourSampling.c,93 :: 		SendSMS(0);
MOVZ	R25, R0, R0
JAL	_SendSMS+0
NOP	
L_main10:
;ColourSampling.c,94 :: 		}
J	L_main4
NOP	
;ColourSampling.c,95 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
