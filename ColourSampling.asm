_main:
;ColourSampling.c,17 :: 		void main() {
ADDIU	SP, SP, -28
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
ADDIU	R23, SP, 6
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr1_ColourSampling+0)
ORI	R24, R24, lo_addr(?ICS?lstr1_ColourSampling+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
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
;ColourSampling.c,36 :: 		num = HID_Read();
JAL	_HID_Read+0
NOP	
SB	R2, 1(SP)
;ColourSampling.c,37 :: 		res = -1;
ORI	R3, R0, 255
SB	R3, 2(SP)
;ColourSampling.c,38 :: 		if(num != 0)
ANDI	R2, R2, 255
BNE	R2, R0, L__main27
NOP	
J	L_main2
NOP	
L__main27:
;ColourSampling.c,42 :: 		memcpy(writebuff,readbuff,num);
LBU	R27, 1(SP)
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memcpy+0
NOP	
;ColourSampling.c,43 :: 		memcpy(conf,readbuff,num);
LBU	R27, 1(SP)
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
LUI	R25, hi_addr(_conf+0)
ORI	R25, R25, lo_addr(_conf+0)
JAL	_memcpy+0
NOP	
;ColourSampling.c,45 :: 		str_num = 0;
SH	R0, 4(SP)
;ColourSampling.c,46 :: 		res = -1;
ORI	R2, R0, 255
SB	R2, 2(SP)
;ColourSampling.c,47 :: 		for(i=0;i < 64;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_main3:
; i start address is: 16 (R4)
ANDI	R2, R4, 255
SLTIU	R2, R2, 64
BNE	R2, R0, L__main28
NOP	
J	L_main4
NOP	
L__main28:
;ColourSampling.c,48 :: 		if(conf[i] == '\r')
ANDI	R3, R4, 255
LUI	R2, hi_addr(_conf+0)
ORI	R2, R2, lo_addr(_conf+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ORI	R2, R0, 13
BEQ	R3, R2, L__main29
NOP	
J	L_main6
NOP	
L__main29:
; i end address is: 16 (R4)
;ColourSampling.c,49 :: 		break;
J	L_main4
NOP	
L_main6:
;ColourSampling.c,50 :: 		str_num++;
; i start address is: 16 (R4)
LHU	R2, 4(SP)
ADDIU	R2, R2, 1
SH	R2, 4(SP)
;ColourSampling.c,47 :: 		for(i=0;i < 64;i++){
ADDIU	R2, R4, 1
ANDI	R4, R2, 255
;ColourSampling.c,51 :: 		}
; i end address is: 16 (R4)
J	L_main3
NOP	
L_main4:
;ColourSampling.c,52 :: 		memset(conf+str_num+1,'\0',1);
LHU	R3, 4(SP)
LUI	R2, hi_addr(_conf+0)
ORI	R2, R2, lo_addr(_conf+0)
ADDU	R2, R2, R3
ADDIU	R2, R2, 1
ORI	R27, R0, 1
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
;ColourSampling.c,54 :: 		sprintf(txtR,"%u",str_num);
LHU	R2, 4(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_2_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_2_ColourSampling+0)
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
;ColourSampling.c,56 :: 		WriteData("\r\n");
ORI	R30, R0, 13
SB	R30, 19(SP)
ORI	R30, R0, 10
SB	R30, 20(SP)
MOVZ	R30, R0, R0
SB	R30, 21(SP)
ADDIU	R2, SP, 19
MOVZ	R25, R2, R0
JAL	_WriteData+0
NOP	
;ColourSampling.c,57 :: 		if(str_num == 3 || str_num == 6){
LHU	R3, 4(SP)
ORI	R2, R0, 3
BNE	R3, R2, L__main31
NOP	
J	L__main24
NOP	
L__main31:
LHU	R3, 4(SP)
ORI	R2, R0, 6
BNE	R3, R2, L__main33
NOP	
J	L__main23
NOP	
L__main33:
J	L_main9
NOP	
L__main24:
L__main23:
;ColourSampling.c,58 :: 		for(i = 0;i < 5;i++){
; i start address is: 12 (R3)
MOVZ	R3, R0, R0
; i end address is: 12 (R3)
L_main10:
; i start address is: 12 (R3)
ANDI	R2, R3, 255
SLTIU	R2, R2, 5
BNE	R2, R0, L__main34
NOP	
J	L_main11
NOP	
L__main34:
;ColourSampling.c,59 :: 		res = strncmp(conf,testStr(i),str_num);
SB	R3, 0(SP)
ANDI	R25, R3, 255
LW	R30, Offset(_testStr+0)(GP)
JALR	RA, R30
NOP	
LHU	R27, 4(SP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_conf+0)
ORI	R25, R25, lo_addr(_conf+0)
JAL	_strncmp+0
NOP	
SB	R2, 2(SP)
;ColourSampling.c,61 :: 		sprintf(txtR,"%u",res);
ADDIU	SP, SP, -12
SB	R2, 8(SP)
LUI	R2, hi_addr(?lstr_4_ColourSampling+0)
ORI	R2, R2, lo_addr(?lstr_4_ColourSampling+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR+0)
ORI	R2, R2, lo_addr(_txtR+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;ColourSampling.c,62 :: 		WriteData(txtR);
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,63 :: 		WriteData("\r\n");
ORI	R30, R0, 13
SB	R30, 22(SP)
ORI	R30, R0, 10
SB	R30, 23(SP)
MOVZ	R30, R0, R0
SB	R30, 24(SP)
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_WriteData+0
NOP	
LBU	R3, 0(SP)
;ColourSampling.c,64 :: 		if(res == 0)
LBU	R2, 2(SP)
BEQ	R2, R0, L__main35
NOP	
J	L_main13
NOP	
L__main35:
; i end address is: 12 (R3)
;ColourSampling.c,65 :: 		break;
J	L_main11
NOP	
L_main13:
;ColourSampling.c,58 :: 		for(i = 0;i < 5;i++){
; i start address is: 12 (R3)
ADDIU	R2, R3, 1
ANDI	R3, R2, 255
;ColourSampling.c,66 :: 		}
; i end address is: 12 (R3)
J	L_main10
NOP	
L_main11:
;ColourSampling.c,67 :: 		}
L_main9:
;ColourSampling.c,70 :: 		if(res == 0){
LBU	R2, 2(SP)
BEQ	R2, R0, L__main36
NOP	
J	L_main14
NOP	
L__main36:
;ColourSampling.c,71 :: 		WriteData(conf);
LUI	R25, hi_addr(_conf+0)
ORI	R25, R25, lo_addr(_conf+0)
JAL	_WriteData+0
NOP	
;ColourSampling.c,72 :: 		WriteData("\r\n");
ORI	R30, R0, 13
SB	R30, 25(SP)
ORI	R30, R0, 10
SB	R30, 26(SP)
MOVZ	R30, R0, R0
SB	R30, 27(SP)
ADDIU	R2, SP, 25
MOVZ	R25, R2, R0
JAL	_WriteData+0
NOP	
;ColourSampling.c,73 :: 		}
L_main14:
;ColourSampling.c,74 :: 		}
L_main2:
;ColourSampling.c,103 :: 		}
J	L_main0
NOP	
;ColourSampling.c,105 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_WriteData:
;ColourSampling.c,107 :: 		void WriteData(char *_data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;ColourSampling.c,109 :: 		HID_Write(_data,64) ;
SW	R26, 4(SP)
ORI	R26, R0, 64
JAL	_HID_Write+0
NOP	
;ColourSampling.c,110 :: 		}
L_end_WriteData:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _WriteData
_StrChecker:
;ColourSampling.c,113 :: 		char* StrChecker(int i){
ADDIU	SP, SP, -32
SW	RA, 0(SP)
;ColourSampling.c,114 :: 		switch(i){
J	L_StrChecker15
NOP	
;ColourSampling.c,115 :: 		case 0:
L_StrChecker17:
;ColourSampling.c,116 :: 		return "AT?";
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
;ColourSampling.c,118 :: 		case 1:
L_StrChecker18:
;ColourSampling.c,119 :: 		return "AT+SET";
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
;ColourSampling.c,121 :: 		case 2:
L_StrChecker19:
;ColourSampling.c,122 :: 		return "AT+CONF";
ADDIU	R23, SP, 15
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr9_ColourSampling+0)
ORI	R24, R24, lo_addr(?ICS?lstr9_ColourSampling+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 15
J	L_end_StrChecker
NOP	
;ColourSampling.c,124 :: 		case 3:
L_StrChecker20:
;ColourSampling.c,125 :: 		return "AT!";
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
;ColourSampling.c,127 :: 		default:
L_StrChecker21:
;ColourSampling.c,128 :: 		return " ";
ORI	R30, R0, 32
SB	R30, 27(SP)
MOVZ	R30, R0, R0
SB	R30, 28(SP)
ADDIU	R2, SP, 27
J	L_end_StrChecker
NOP	
;ColourSampling.c,130 :: 		}
L_StrChecker15:
SEH	R2, R25
BNE	R2, R0, L__StrChecker41
NOP	
J	L_StrChecker17
NOP	
L__StrChecker41:
SEH	R3, R25
ORI	R2, R0, 1
BNE	R3, R2, L__StrChecker43
NOP	
J	L_StrChecker18
NOP	
L__StrChecker43:
SEH	R3, R25
ORI	R2, R0, 2
BNE	R3, R2, L__StrChecker45
NOP	
J	L_StrChecker19
NOP	
L__StrChecker45:
SEH	R3, R25
ORI	R2, R0, 3
BNE	R3, R2, L__StrChecker47
NOP	
J	L_StrChecker20
NOP	
L__StrChecker47:
J	L_StrChecker21
NOP	
;ColourSampling.c,132 :: 		}
L_end_StrChecker:
LW	RA, 0(SP)
ADDIU	SP, SP, 32
JR	RA
NOP	
; end of _StrChecker
