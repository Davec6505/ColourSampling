_main:
;ColourSampling.c,17 :: 		void main() {
ADDIU	SP, SP, -668
;ColourSampling.c,23 :: 		testStr = StrChecker;
LUI	R2, hi_addr(_StrChecker+0)
ORI	R2, R2, lo_addr(_StrChecker+0)
SW	R2, Offset(_testStr+0)(GP)
;ColourSampling.c,24 :: 		ConfigPic();
JAL	_ConfigPic+0
NOP	
;ColourSampling.c,25 :: 		it = TCS3472_INTEGRATIONTIME_101MS;//TCS3472_INTEGRATIONTIME_2_4MS;
ORI	R2, R0, 213
SB	R2, Offset(_it+0)(GP)
;ColourSampling.c,26 :: 		it = TCS3472_INTEGRATIONTIME_24MS;//2_4MS;
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
; i start address is: 20 (R5)
ANDI	R5, R2, 255
;ColourSampling.c,31 :: 		UART2_Write_Text("Device Id:= ");
ADDIU	R23, SP, 1
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr1_ColourSampling+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_ColourSampling+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 1
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;ColourSampling.c,32 :: 		ByteToStr(i, txt);
LUI	R26, hi_addr(_txt+0)
ORI	R26, R26, lo_addr(_txt+0)
ANDI	R25, R5, 255
; i end address is: 20 (R5)
JAL	_ByteToStr+0
NOP	
;ColourSampling.c,33 :: 		UART2_Write_Text(txt);
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_UART2_Write_Text+0
NOP	
;ColourSampling.c,34 :: 		str_t = InitString('+');
ORI	R25, R0, 43
ADDIU	R30, SP, 16
JAL	_InitString+0
NOP	
ORI	R4, R0, 652
ADDIU	R3, GP, Offset(_str_t+0)
ADDIU	R2, SP, 16
L_main0:
LBU	R30, 0(R2)
SB	R30, 0(R3)
ADDIU	R4, R4, -1
ADDIU	R2, R2, 1
ADDIU	R3, R3, 1
BEQ	R4, R0, L__main7
NOP	
J	L_main0
NOP	
L__main7:
;ColourSampling.c,36 :: 		while(1){
L_main1:
;ColourSampling.c,39 :: 		num = HID_Read();
JAL	_HID_Read+0
NOP	
SB	R2, 0(SP)
;ColourSampling.c,41 :: 		if(num != 0){
ANDI	R2, R2, 255
BNE	R2, R0, L__main9
NOP	
J	L_main3
NOP	
L__main9:
;ColourSampling.c,42 :: 		clr_str_arrays(string);
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_clr_str_arrays+0
NOP	
;ColourSampling.c,43 :: 		memcpy(conf,readbuff,num);
LBU	R27, 0(SP)
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
LUI	R25, hi_addr(_conf+0)
ORI	R25, R25, lo_addr(_conf+0)
JAL	_memcpy+0
NOP	
;ColourSampling.c,44 :: 		result = setstr(conf);
LUI	R25, hi_addr(_conf+0)
ORI	R25, R25, lo_addr(_conf+0)
JAL	_setstr+0
NOP	
;ColourSampling.c,45 :: 		res = strsplit(result,'+');
ORI	R26, R0, 43
MOVZ	R25, R2, R0
JAL	_strsplit+0
NOP	
;ColourSampling.c,46 :: 		memset(writebuff,0,64);
ORI	R27, R0, 64
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memset+0
NOP	
;ColourSampling.c,47 :: 		testStrings(&writebuff);
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_testStrings+0
NOP	
;ColourSampling.c,49 :: 		while(!HID_Write(&writebuff,64));
L_main4:
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
BEQ	R2, R0, L__main10
NOP	
J	L_main5
NOP	
L__main10:
J	L_main4
NOP	
L_main5:
;ColourSampling.c,50 :: 		}
L_main3:
;ColourSampling.c,51 :: 		}
J	L_main1
NOP	
;ColourSampling.c,52 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
