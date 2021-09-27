_main:
;ColourSampling.c,17 :: 		void main() {
ADDIU	SP, SP, -16
;ColourSampling.c,23 :: 		testStr = StrChecker;
LUI	R2, hi_addr(_StrChecker+0)
ORI	R2, R2, lo_addr(_StrChecker+0)
SW	R2, Offset(_testStr+0)(GP)
;ColourSampling.c,24 :: 		ConfigPic();
JAL	_ConfigPic+0
NOP	
;ColourSampling.c,25 :: 		it = TCS3472_INTEGRATIONTIME_24MS;//2_4MS;
ORI	R2, R0, 246
SB	R2, Offset(_it+0)(GP)
;ColourSampling.c,26 :: 		G  = TCS3472_GAIN_1X;
SB	R0, Offset(_G+0)(GP)
;ColourSampling.c,27 :: 		device_Id = TCS3472_1_5;
ORI	R2, R0, 68
SB	R2, Offset(_device_Id+0)(GP)
;ColourSampling.c,29 :: 		i = TCS3472_Init(it,G,device_Id);
ORI	R27, R0, 68
MOVZ	R26, R0, R0
ORI	R25, R0, 246
JAL	_TCS3472_Init+0
NOP	
; i start address is: 20 (R5)
ANDI	R5, R2, 255
;ColourSampling.c,30 :: 		UART2_Write_Text("Device Id:= ");
ADDIU	R23, SP, 0
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr1_ColourSampling+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_ColourSampling+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 0
MOVZ	R25, R2, R0
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
;ColourSampling.c,36 :: 		USB_Polling_Proc();               // Call this routine periodically
JAL	_USB_Polling_Proc+0
NOP	
;ColourSampling.c,37 :: 		num = HID_Read();
JAL	_HID_Read+0
NOP	
; num start address is: 12 (R3)
ANDI	R3, R2, 255
;ColourSampling.c,43 :: 		if(num != 0)
ANDI	R2, R2, 255
BNE	R2, R0, L__main21
NOP	
J	L_main2
NOP	
L__main21:
;ColourSampling.c,48 :: 		memcpy(conf,readbuff,num);
ANDI	R27, R3, 255
; num end address is: 12 (R3)
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
LUI	R25, hi_addr(_conf+0)
ORI	R25, R25, lo_addr(_conf+0)
JAL	_memcpy+0
NOP	
;ColourSampling.c,50 :: 		str_num = 0;
; str_num start address is: 20 (R5)
MOVZ	R5, R0, R0
;ColourSampling.c,52 :: 		for(i=2;i < 63;i++){
; i start address is: 16 (R4)
ORI	R4, R0, 2
; str_num end address is: 20 (R5)
; i end address is: 16 (R4)
L_main3:
; i start address is: 16 (R4)
; str_num start address is: 20 (R5)
ANDI	R2, R4, 255
SLTIU	R2, R2, 63
BNE	R2, R0, L__main22
NOP	
J	L_main4
NOP	
L__main22:
;ColourSampling.c,53 :: 		if((conf[i] == 0x0A)||(conf[i] == 0x0D))
ANDI	R3, R4, 255
LUI	R2, hi_addr(_conf+0)
ORI	R2, R2, lo_addr(_conf+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 10
BNE	R3, R2, L__main24
NOP	
J	L__main18
NOP	
L__main24:
ANDI	R3, R4, 255
LUI	R2, hi_addr(_conf+0)
ORI	R2, R2, lo_addr(_conf+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BNE	R3, R2, L__main26
NOP	
J	L__main17
NOP	
L__main26:
J	L_main8
NOP	
; i end address is: 16 (R4)
L__main18:
L__main17:
;ColourSampling.c,54 :: 		break;
J	L_main4
NOP	
L_main8:
;ColourSampling.c,55 :: 		str_num++;
; i start address is: 16 (R4)
ADDIU	R2, R5, 1
ANDI	R5, R2, 65535
;ColourSampling.c,52 :: 		for(i=2;i < 63;i++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;ColourSampling.c,56 :: 		}
; i end address is: 16 (R4)
J	L_main3
NOP	
L_main4:
;ColourSampling.c,58 :: 		sprintf(txtR,"%u",str_num);
ADDIU	SP, SP, -12
SH	R5, 8(SP)
; str_num end address is: 20 (R5)
LUI	R2, hi_addr(?lstr_2_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_2_ColourSampling+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR+0)
ORI	R2, R2, lo_addr(_txtR+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,59 :: 		memcpy(writebuff,txtR,3);
ORI	R27, R0, 3
LUI	R26, hi_addr(_txtR+0)
ORI	R26, R26, lo_addr(_txtR+0)
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memcpy+0
NOP	
;ColourSampling.c,61 :: 		HID_Write(writebuff,64);
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
;ColourSampling.c,67 :: 		}
L_main2:
;ColourSampling.c,96 :: 		}
J	L_main0
NOP	
;ColourSampling.c,98 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_WriteData:
;ColourSampling.c,100 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;ColourSampling.c,102 :: 		HID_Write(_data,64) ;
SW	R26, 4(SP)
ORI	R26, R0, 64
JAL	_HID_Write+0
NOP	
;ColourSampling.c,103 :: 		}
L_end_WriteData:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WriteData
_StrChecker:
;ColourSampling.c,106 :: 		char* StrChecker(int i){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;ColourSampling.c,107 :: 		switch(i){
J	L_StrChecker9
NOP	
;ColourSampling.c,108 :: 		case 0:
L_StrChecker11:
;ColourSampling.c,109 :: 		return "AT?";
ORI	R30, R0, 65
SB	R30, 4(SP)
ORI	R30, R0, 84
SB	R30, 5(SP)
ORI	R30, R0, 63
SB	R30, 6(SP)
MOVZ	R30, R0, R0
SB	R30, 7(SP)
ADDIU	R2, SP, 4
J	L_end_StrChecker
NOP	
;ColourSampling.c,111 :: 		case 1:
L_StrChecker12:
;ColourSampling.c,112 :: 		return "AT+SET";
ORI	R30, R0, 65
SB	R30, 8(SP)
ORI	R30, R0, 84
SB	R30, 9(SP)
ORI	R30, R0, 43
SB	R30, 10(SP)
ORI	R30, R0, 83
SB	R30, 11(SP)
ORI	R30, R0, 69
SB	R30, 12(SP)
ORI	R30, R0, 84
SB	R30, 13(SP)
MOVZ	R30, R0, R0
SB	R30, 14(SP)
ADDIU	R2, SP, 8
J	L_end_StrChecker
NOP	
;ColourSampling.c,114 :: 		case 2:
L_StrChecker13:
;ColourSampling.c,115 :: 		return "AT+CONF";
ADDIU	R23, SP, 15
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr5_ColourSampling+0)
ORI	R24, R24, lo_addr(?ICS?lstr5_ColourSampling+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 15
J	L_end_StrChecker
NOP	
;ColourSampling.c,117 :: 		case 3:
L_StrChecker14:
;ColourSampling.c,118 :: 		return "AT!";
ORI	R30, R0, 65
SB	R30, 23(SP)
ORI	R30, R0, 84
SB	R30, 24(SP)
ORI	R30, R0, 33
SB	R30, 25(SP)
MOVZ	R30, R0, R0
SB	R30, 26(SP)
ADDIU	R2, SP, 23
J	L_end_StrChecker
NOP	
;ColourSampling.c,120 :: 		default:
L_StrChecker15:
;ColourSampling.c,121 :: 		return " ";
ORI	R30, R0, 32
SB	R30, 27(SP)
MOVZ	R30, R0, R0
SB	R30, 28(SP)
ADDIU	R2, SP, 27
J	L_end_StrChecker
NOP	
;ColourSampling.c,123 :: 		}
L_StrChecker9:
SEH	R2, R25
BNE	R2, R0, L__StrChecker31
NOP	
J	L_StrChecker11
NOP	
L__StrChecker31:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__StrChecker33
NOP	
J	L_StrChecker12
NOP	
L__StrChecker33:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__StrChecker35
NOP	
J	L_StrChecker13
NOP	
L__StrChecker35:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__StrChecker37
NOP	
J	L_StrChecker14
NOP	
L__StrChecker37:
J	L_StrChecker15
NOP	
;ColourSampling.c,125 :: 		}
L_end_StrChecker:
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _StrChecker
