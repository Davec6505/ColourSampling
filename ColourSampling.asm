_main:
<<<<<<< HEAD
;ColourSampling.c,9 :: 		void main() {
ADDIU	SP, SP, -12
;ColourSampling.c,14 :: 		ConfigPic();
JAL	_ConfigPic+0
NOP	
;ColourSampling.c,15 :: 		it = TCS3472_INTEGRATIONTIME_2_4MS;
ORI	R2, R0, 255
SB	R2, Offset(_it+0)(GP)
;ColourSampling.c,16 :: 		G  = TCS3472_GAIN_4X;
ORI	R2, R0, 1
SB	R2, Offset(_G+0)(GP)
;ColourSampling.c,17 :: 		device_Id = TCS3472_1_5;
ORI	R2, R0, 68
SB	R2, Offset(_device_Id+0)(GP)
;ColourSampling.c,19 :: 		i = TCS3472_Init(it,G,device_Id);
=======
;ColourSampling.c,20 :: 		void main() {
ADDIU	SP, SP, -8
;ColourSampling.c,24 :: 		ConfigPic();
JAL	_ConfigPic+0
NOP	
;ColourSampling.c,25 :: 		it = TCS3472_INTEGRATIONTIME_2_4MS;
ORI	R2, R0, 255
SB	R2, Offset(_it+0)(GP)
;ColourSampling.c,26 :: 		G  = TCS3472_GAIN_4X;
ORI	R2, R0, 1
SB	R2, Offset(_G+0)(GP)
;ColourSampling.c,27 :: 		device_Id = TCS3472_1_5;
ORI	R2, R0, 68
SB	R2, Offset(_device_Id+0)(GP)
;ColourSampling.c,29 :: 		i = TCS3472_Init(it,G,device_Id);
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
ORI	R27, R0, 68
ORI	R26, R0, 1
ORI	R25, R0, 255
JAL	_TCS3472_Init+0
NOP	
; i start address is: 20 (R5)
ANDI	R5, R2, 255
<<<<<<< HEAD
;ColourSampling.c,20 :: 		UART2_Write_Text("Device Id:= ");
=======
;ColourSampling.c,30 :: 		UART2_Write_Text("Device Id:= ");
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
LUI	R25, hi_addr(?lstr1_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr1_ColourSampling+0)
JAL	_UART2_Write_Text+0
NOP	
<<<<<<< HEAD
;ColourSampling.c,21 :: 		ByteToStr(i, txt);
=======
;ColourSampling.c,31 :: 		ByteToStr(i, txt);
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
LUI	R26, hi_addr(_txt+0)
ORI	R26, R26, lo_addr(_txt+0)
ANDI	R25, R5, 255
; i end address is: 20 (R5)
JAL	_ByteToStr+0
NOP	
<<<<<<< HEAD
;ColourSampling.c,22 :: 		UART2_Write_Text(txt);
=======
;ColourSampling.c,32 :: 		UART2_Write_Text(txt);
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_UART2_Write_Text+0
NOP	
<<<<<<< HEAD
;ColourSampling.c,24 :: 		while(1){
L_main0:
;ColourSampling.c,26 :: 		TCS3472_getRawData(RawData);
=======
;ColourSampling.c,34 :: 		while(1){
L_main0:
;ColourSampling.c,36 :: 		if(HID_Read() != 0)
JAL	_HID_Read+0
NOP	
ANDI	R2, R2, 255
BNE	R2, R0, L__main12
NOP	
J	L_main2
NOP	
L__main12:
;ColourSampling.c,38 :: 		for(cnt=0;cnt<64;cnt++)
SB	R0, Offset(_cnt+0)(GP)
L_main3:
LBU	R2, Offset(_cnt+0)(GP)
SLTIU	R2, R2, 64
BNE	R2, R0, L__main13
NOP	
J	L_main4
NOP	
L__main13:
;ColourSampling.c,39 :: 		writebuff[cnt]=readbuff[cnt];
LBU	R3, Offset(_cnt+0)(GP)
LUI	R2, hi_addr(_writebuff+0)
ORI	R2, R2, lo_addr(_writebuff+0)
ADDU	R4, R2, R3
LBU	R3, Offset(_cnt+0)(GP)
LUI	R2, hi_addr(_readbuff+0)
ORI	R2, R2, lo_addr(_readbuff+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;ColourSampling.c,38 :: 		for(cnt=0;cnt<64;cnt++)
LBU	R2, Offset(_cnt+0)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(_cnt+0)(GP)
;ColourSampling.c,39 :: 		writebuff[cnt]=readbuff[cnt];
J	L_main3
NOP	
L_main4:
;ColourSampling.c,40 :: 		while(!HID_Write(&writebuff,64)) ;
L_main6:
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
BEQ	R2, R0, L__main14
NOP	
J	L_main7
NOP	
L__main14:
J	L_main6
NOP	
L_main7:
;ColourSampling.c,41 :: 		}
L_main2:
;ColourSampling.c,43 :: 		TCS3472_getRawData(RawData);
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_TCS3472_getRawData+0
NOP	
<<<<<<< HEAD
;ColourSampling.c,28 :: 		WriteData("C | R | G | B |  | deg | =   ");
=======
;ColourSampling.c,45 :: 		WriteData("C | R | G | B | = ");
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
LUI	R25, hi_addr(?lstr2_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr2_ColourSampling+0)
JAL	_WriteData+0
NOP	
<<<<<<< HEAD
;ColourSampling.c,29 :: 		sprintf(txtR,"%d",RawData[0]);
=======
;ColourSampling.c,46 :: 		sprintf(txtR,"%d",RawData[0]);
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
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
<<<<<<< HEAD
;ColourSampling.c,30 :: 		WriteData(txtR);
=======
;ColourSampling.c,47 :: 		WriteData(txtR);
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_WriteData+0
NOP	
<<<<<<< HEAD
;ColourSampling.c,31 :: 		UART2_Write(9);
ORI	R25, R0, 9
JAL	_UART2_Write+0
NOP	
;ColourSampling.c,32 :: 		sprintf(txtR,"%d",RawData[1]);
=======
;ColourSampling.c,48 :: 		WriteData("|");
LUI	R25, hi_addr(?lstr4_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr4_ColourSampling+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,50 :: 		sprintf(txtR,"%d",RawData[1]);
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
ADDIU	R2, SP, 0
ADDIU	R2, R2, 2
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
<<<<<<< HEAD
;ColourSampling.c,33 :: 		WriteData(txtR);
=======
;ColourSampling.c,51 :: 		WriteData(txtR);
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_WriteData+0
NOP	
<<<<<<< HEAD
;ColourSampling.c,34 :: 		UART2_Write(9);
ORI	R25, R0, 9
JAL	_UART2_Write+0
NOP	
;ColourSampling.c,35 :: 		sprintf(txtR,"%d",RawData[2]);
=======
;ColourSampling.c,52 :: 		WriteData("|");
LUI	R25, hi_addr(?lstr6_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr6_ColourSampling+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,54 :: 		sprintf(txtR,"%d",RawData[2]);
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
ADDIU	R2, SP, 0
ADDIU	R2, R2, 4
LHU	R2, 0(R2)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_7_ColourSampling+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR+0)
ORI	R2, R2, lo_addr(_txtR+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;ColourSampling.c,36 :: 		WriteData(txtR);
=======
;ColourSampling.c,55 :: 		WriteData(txtR);
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_WriteData+0
NOP	
<<<<<<< HEAD
;ColourSampling.c,37 :: 		UART2_Write(9);
ORI	R25, R0, 9
JAL	_UART2_Write+0
NOP	
;ColourSampling.c,38 :: 		sprintf(txtR,"%d",RawData[3]);
=======
;ColourSampling.c,56 :: 		WriteData("|");
LUI	R25, hi_addr(?lstr8_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr8_ColourSampling+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,58 :: 		sprintf(txtR,"%d",RawData[3]);
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
ADDIU	R2, SP, 0
ADDIU	R2, R2, 6
LHU	R2, 0(R2)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_9_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_9_ColourSampling+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR+0)
ORI	R2, R2, lo_addr(_txtR+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
<<<<<<< HEAD
;ColourSampling.c,39 :: 		WriteData(txtR);
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,40 :: 		UART2_Write(9);
ORI	R25, R0, 9
JAL	_UART2_Write+0
NOP	
;ColourSampling.c,41 :: 		UART2_Write(9);
ORI	R25, R0, 9
JAL	_UART2_Write+0
NOP	
;ColourSampling.c,44 :: 		sprintf(txtR,"%d",deg);
LHU	R2, 8(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_7_ColourSampling+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR+0)
ORI	R2, R2, lo_addr(_txtR+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,45 :: 		WriteData(txtR);
=======
;ColourSampling.c,59 :: 		WriteData(txtR);
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_WriteData+0
NOP	
<<<<<<< HEAD
;ColourSampling.c,46 :: 		UART2_Write(13);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;ColourSampling.c,47 :: 		UART2_Write(10);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;ColourSampling.c,49 :: 		Delay_ms(1000);
=======
;ColourSampling.c,60 :: 		WriteData("| \r\n");
LUI	R25, hi_addr(?lstr10_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr10_ColourSampling+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,64 :: 		Delay_ms(1000);
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
LUI	R24, 406
ORI	R24, R24, 59050
L_main8:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main8
NOP	
<<<<<<< HEAD
;ColourSampling.c,50 :: 		}
J	L_main0
NOP	
;ColourSampling.c,52 :: 		}
=======
;ColourSampling.c,65 :: 		}
J	L_main0
NOP	
;ColourSampling.c,67 :: 		}
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_WriteData:
<<<<<<< HEAD
;ColourSampling.c,54 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;ColourSampling.c,55 :: 		UART2_Write_Text(_data);
JAL	_UART2_Write_Text+0
NOP	
;ColourSampling.c,56 :: 		}
=======
;ColourSampling.c,69 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;ColourSampling.c,71 :: 		HID_Write(_data,64) ;
SW	R26, 4(SP)
ORI	R26, R0, 64
JAL	_HID_Write+0
NOP	
;ColourSampling.c,72 :: 		}
>>>>>>> 1eaea05460290339656224bd6318061f885bd184
L_end_WriteData:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WriteData
