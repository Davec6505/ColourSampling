_main:
;ColourSampling.c,16 :: 		void main() {
ADDIU	SP, SP, -8
;ColourSampling.c,23 :: 		ConfigPic();
JAL	_ConfigPic+0
NOP	
;ColourSampling.c,25 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_main0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main0
NOP	
NOP	
NOP	
;ColourSampling.c,26 :: 		it = TCS3472_INTEGRATIONTIME_24MS;//TCS3472_INTEGRATIONTIME_2_4MS;
ORI	R2, R0, 246
SB	R2, Offset(_it+0)(GP)
;ColourSampling.c,27 :: 		G  = TCS3472_GAIN_1X;
SB	R0, Offset(_G+0)(GP)
;ColourSampling.c,28 :: 		device_Id = TCS3472_1_5;
ORI	R2, R0, 68
SB	R2, Offset(_device_Id+0)(GP)
;ColourSampling.c,30 :: 		i = TCS3472_Init(it,G,device_Id);
ORI	R27, R0, 68
MOVZ	R26, R0, R0
ORI	R25, R0, 246
JAL	_TCS3472_Init+0
NOP	
;ColourSampling.c,31 :: 		sprintf(txtR,"%2x",i);
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
;ColourSampling.c,32 :: 		strcat(writebuff,txtR);
ADDIU	R2, SP, 0
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
;ColourSampling.c,33 :: 		while(!HID_Write(&writebuff,64));
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
;ColourSampling.c,36 :: 		while(1){
L_main4:
;ColourSampling.c,39 :: 		num = HID_Read();
JAL	_HID_Read+0
NOP	
; num start address is: 12 (R3)
ANDI	R3, R2, 255
;ColourSampling.c,40 :: 		if(num != 0){
ANDI	R2, R2, 255
BNE	R2, R0, L__main10
NOP	
J	L_main6
NOP	
L__main10:
;ColourSampling.c,41 :: 		DoStrings(num);
ANDI	R25, R3, 255
; num end address is: 12 (R3)
JAL	_DoStrings+0
NOP	
;ColourSampling.c,42 :: 		}
L_main6:
;ColourSampling.c,43 :: 		}
J	L_main4
NOP	
;ColourSampling.c,44 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
