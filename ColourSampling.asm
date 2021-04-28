_main:
;ColourSampling.c,8 :: 		void main() {
ADDIU	SP, SP, -8
;ColourSampling.c,12 :: 		ConfigPic();
JAL	_ConfigPic+0
NOP	
;ColourSampling.c,13 :: 		it = TCS3472_INTEGRATIONTIME_2_4MS;
ORI	R2, R0, 255
SB	R2, Offset(_it+0)(GP)
;ColourSampling.c,14 :: 		G  = TCS3472_GAIN_4X;
ORI	R2, R0, 1
SB	R2, Offset(_G+0)(GP)
;ColourSampling.c,15 :: 		device_Id = TCS3472_1_5;
ORI	R2, R0, 68
SB	R2, Offset(_device_Id+0)(GP)
;ColourSampling.c,17 :: 		i = TCS3472_Init(it,G,device_Id);
ORI	R27, R0, 68
ORI	R26, R0, 1
ORI	R25, R0, 255
JAL	_TCS3472_Init+0
NOP	
; i start address is: 20 (R5)
ANDI	R5, R2, 255
;ColourSampling.c,18 :: 		UART2_Write_Text("Device Id:= ");
LUI	R25, hi_addr(?lstr1_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr1_ColourSampling+0)
JAL	_UART2_Write_Text+0
NOP	
;ColourSampling.c,19 :: 		ByteToStr(i, txt);
LUI	R26, hi_addr(_txt+0)
ORI	R26, R26, lo_addr(_txt+0)
ANDI	R25, R5, 255
; i end address is: 20 (R5)
JAL	_ByteToStr+0
NOP	
;ColourSampling.c,20 :: 		UART2_Write_Text(txt);
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_UART2_Write_Text+0
NOP	
;ColourSampling.c,22 :: 		while(1){
L_main0:
;ColourSampling.c,24 :: 		TCS3472_getRawData(RawData);
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_TCS3472_getRawData+0
NOP	
;ColourSampling.c,26 :: 		WriteData("C | R | G | B | = ");
LUI	R25, hi_addr(?lstr2_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr2_ColourSampling+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,27 :: 		sprintf(txtR,"%d",RawData[0]);
ADDIU	R2, SP, 0
LHU	R2, 0(R2)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_3_ColourSampling+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR+0)
ORI	R2, R2, lo_addr(_txtR+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,28 :: 		WriteData(txtR);
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,29 :: 		UART2_Write('\t');
ORI	R25, R0, 9
JAL	_UART2_Write+0
NOP	
;ColourSampling.c,30 :: 		sprintf(txtR,"%d",RawData[1]);
ADDIU	R2, SP, 0
ADDIU	R2, R2, 2
LHU	R2, 0(R2)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_4_ColourSampling+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR+0)
ORI	R2, R2, lo_addr(_txtR+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,31 :: 		WriteData(txtR);
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,32 :: 		UART2_Write('\t');
ORI	R25, R0, 9
JAL	_UART2_Write+0
NOP	
;ColourSampling.c,33 :: 		sprintf(txtR,"%d",RawData[2]);
ADDIU	R2, SP, 0
ADDIU	R2, R2, 4
LHU	R2, 0(R2)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_5_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_5_ColourSampling+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR+0)
ORI	R2, R2, lo_addr(_txtR+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,34 :: 		WriteData(txtR);
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,35 :: 		UART2_Write('\t');
ORI	R25, R0, 9
JAL	_UART2_Write+0
NOP	
;ColourSampling.c,36 :: 		sprintf(txtR,"%d",RawData[3]);
ADDIU	R2, SP, 0
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_6_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_6_ColourSampling+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR+0)
ORI	R2, R2, lo_addr(_txtR+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,37 :: 		WriteData(txtR);
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,38 :: 		UART2_Write('\r');
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;ColourSampling.c,39 :: 		UART2_Write('\n');
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;ColourSampling.c,41 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_main2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main2
NOP	
;ColourSampling.c,42 :: 		}
J	L_main0
NOP	
;ColourSampling.c,44 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_WriteData:
;ColourSampling.c,46 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;ColourSampling.c,47 :: 		UART2_Write_Text(_data);
JAL	_UART2_Write_Text+0
NOP	
;ColourSampling.c,48 :: 		}
L_end_WriteData:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _WriteData
