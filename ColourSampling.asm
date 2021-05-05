_main:
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
ORI	R27, R0, 68
ORI	R26, R0, 1
ORI	R25, R0, 255
JAL	_TCS3472_Init+0
NOP	
; i start address is: 20 (R5)
ANDI	R5, R2, 255
;ColourSampling.c,30 :: 		UART2_Write_Text("Device Id:= ");
LUI	R25, hi_addr(?lstr1_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr1_ColourSampling+0)
JAL	_UART2_Write_Text+0
NOP	
;ColourSampling.c,31 :: 		ByteToStr(i, txt);
LUI	R26, hi_addr(_txt+0)
ORI	R26, R26, lo_addr(_txt+0)
ANDI	R25, R5, 255
; i end address is: 20 (R5)
JAL	_ByteToStr+0
NOP	
;ColourSampling.c,32 :: 		UART2_Write_Text(txt);
LUI	R25, hi_addr(_txt+0)
ORI	R25, R25, lo_addr(_txt+0)
JAL	_UART2_Write_Text+0
NOP	
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
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
JAL	_TCS3472_getRawData+0
NOP	
;ColourSampling.c,45 :: 		WriteData("C | R | G | B | = ");
LUI	R25, hi_addr(?lstr2_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr2_ColourSampling+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,46 :: 		sprintf(txtR,"%d",RawData[0]);
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
;ColourSampling.c,47 :: 		WriteData(txtR);
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,48 :: 		WriteData("|");
LUI	R25, hi_addr(?lstr4_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr4_ColourSampling+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,50 :: 		sprintf(txtR,"%d",RawData[1]);
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
;ColourSampling.c,51 :: 		WriteData(txtR);
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,52 :: 		WriteData("|");
LUI	R25, hi_addr(?lstr6_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr6_ColourSampling+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,54 :: 		sprintf(txtR,"%d",RawData[2]);
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
;ColourSampling.c,55 :: 		WriteData(txtR);
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,56 :: 		WriteData("|");
LUI	R25, hi_addr(?lstr8_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr8_ColourSampling+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,58 :: 		sprintf(txtR,"%d",RawData[3]);
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
;ColourSampling.c,59 :: 		WriteData(txtR);
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,60 :: 		WriteData("| \r\n");
LUI	R25, hi_addr(?lstr10_ColourSampling+0)
ORI	R25, R25, lo_addr(?lstr10_ColourSampling+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,64 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_main8:
ADDIU	R24, R24, -1
BNE	R24, R0, L_main8
NOP	
;ColourSampling.c,65 :: 		}
J	L_main0
NOP	
;ColourSampling.c,67 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_WriteData:
;ColourSampling.c,69 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;ColourSampling.c,71 :: 		HID_Write(_data,64) ;
SW	R26, 4(SP)
ORI	R26, R0, 64
JAL	_HID_Write+0
NOP	
;ColourSampling.c,72 :: 		}
L_end_WriteData:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WriteData
