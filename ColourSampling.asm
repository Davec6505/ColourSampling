_main:
;ColourSampling.c,8 :: 		void main() {
;ColourSampling.c,10 :: 		ConfigPic();
JAL	_ConfigPic+0
NOP	
;ColourSampling.c,11 :: 		it = TCS3472_INTEGRATIONTIME_2_4MS;
ORI	R2, R0, 255
SB	R2, Offset(_it+0)(GP)
;ColourSampling.c,12 :: 		G  = TCS3472_GAIN_4X;
ORI	R2, R0, 1
SB	R2, Offset(_G+0)(GP)
;ColourSampling.c,13 :: 		i  = 0;
; i start address is: 20 (R5)
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
;ColourSampling.c,15 :: 		while(1){
L_main0:
;ColourSampling.c,16 :: 		ByteToStr(i, txt);
; i start address is: 20 (R5)
LUI	R26, hi_addr(_txt+0)
ORI	R26, R26, lo_addr(_txt+0)
ANDI	R25, R5, 255
JAL	_ByteToStr+0
NOP	
;ColourSampling.c,18 :: 		WriteData(txt);
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,19 :: 		LATE3_bit = i;
_LX	
INS	R2, R5, BitPos(LATE3_bit+0), 1
; i end address is: 20 (R5)
_SX	
;ColourSampling.c,20 :: 		i = TCS3472_Init(it,G);
LBU	R26, Offset(_G+0)(GP)
LBU	R25, Offset(_it+0)(GP)
JAL	_TCS3472_Init+0
NOP	
; i start address is: 20 (R5)
ANDI	R5, R2, 255
; i end address is: 20 (R5)
;ColourSampling.c,21 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_main2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main2
NOP	
;ColourSampling.c,22 :: 		}
; i end address is: 20 (R5)
J	L_main0
NOP	
;ColourSampling.c,24 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_WriteData:
;ColourSampling.c,26 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;ColourSampling.c,27 :: 		UART2_Write_Text(_data);
JAL	_UART2_Write_Text+0
NOP	
;ColourSampling.c,28 :: 		}
L_end_WriteData:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _WriteData
