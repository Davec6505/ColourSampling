_main:
;ColourSampling.c,19 :: 		void main() {
ADDIU	SP, SP, -12
;ColourSampling.c,26 :: 		ConfigPic();
JAL	_ConfigPic+0
NOP	
;ColourSampling.c,28 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_main0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main0
NOP	
NOP	
NOP	
;ColourSampling.c,30 :: 		it = TCS3472_INTEGRATIONTIME_24MS;//TCS3472_INTEGRATIONTIME_2_4MS;
ORI	R2, R0, 246
SB	R2, Offset(_it+0)(GP)
;ColourSampling.c,31 :: 		G  = TCS3472_GAIN_1X;
SB	R0, Offset(_G+0)(GP)
;ColourSampling.c,32 :: 		device_Id = TCS347_11_15;//TCS3472_1_5;
ORI	R2, R0, 20
SB	R2, Offset(_device_Id+0)(GP)
;ColourSampling.c,34 :: 		i = TCS3472_Init(it,G,device_Id);
ORI	R27, R0, 20
MOVZ	R26, R0, R0
ORI	R25, R0, 246
JAL	_TCS3472_Init+0
NOP	
;ColourSampling.c,35 :: 		sprintf(txtR,"%2x",i);
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
;ColourSampling.c,36 :: 		strcat(writebuff,txtR);
ADDIU	R2, SP, 0
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
;ColourSampling.c,37 :: 		while(!HID_Write(&writebuff,64));
L_main2:
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
BEQ	R2, R0, L__main8
NOP	
J	L_main3
NOP	
L__main8:
J	L_main2
NOP	
L_main3:
;ColourSampling.c,41 :: 		UART1_Write_Text("Start");
ORI	R30, R0, 83
SB	R30, 6(SP)
ORI	R30, R0, 116
SB	R30, 7(SP)
ORI	R30, R0, 97
SB	R30, 8(SP)
ORI	R30, R0, 114
SB	R30, 9(SP)
ORI	R30, R0, 116
SB	R30, 10(SP)
MOVZ	R30, R0, R0
SB	R30, 11(SP)
ADDIU	R2, SP, 6
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;ColourSampling.c,42 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;ColourSampling.c,43 :: 		UART1_Write(10);
ORI	R25, R0, 10
JAL	_UART1_Write+0
NOP	
;ColourSampling.c,45 :: 		while(1){
L_main4:
;ColourSampling.c,49 :: 		num = HID_Read();
JAL	_HID_Read+0
NOP	
; num start address is: 12 (R3)
ANDI	R3, R2, 255
;ColourSampling.c,50 :: 		if(num != 0){
ANDI	R2, R2, 255
BNE	R2, R0, L__main10
NOP	
J	L_main6
NOP	
L__main10:
;ColourSampling.c,51 :: 		DoStrings(num);
ANDI	R25, R3, 255
; num end address is: 12 (R3)
JAL	_DoStrings+0
NOP	
;ColourSampling.c,52 :: 		}
L_main6:
;ColourSampling.c,53 :: 		}
J	L_main4
NOP	
;ColourSampling.c,54 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
