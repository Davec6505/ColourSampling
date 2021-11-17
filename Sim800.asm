_InitGSM3:
;Sim800.c,79 :: 		void InitGSM3(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,80 :: 		SimVars.initial_str = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R0, Offset(_SimVars+0)(GP)
;Sim800.c,81 :: 		SimVars.init_inc    = 0;
SB	R0, Offset(_SimVars+1)(GP)
;Sim800.c,82 :: 		*SimTestTxt = "Hello World this is a test";
ORI	R2, R0, lo_addr(?lstr_1_Sim800+0)
ANDI	R2, R2, 255
SB	R2, Offset(_SimTestTxt+0)(GP)
;Sim800.c,83 :: 		RB.head = 0;
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,84 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
;Sim800.c,85 :: 		RB.rcv_txt_fin = -1;
ORI	R2, R0, 255
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,86 :: 		memset(SF.SimCelNum,0,sizeof(SF.SimCelNum));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_memset+0
NOP	
;Sim800.c,87 :: 		memset(SF.StartCell,0,sizeof(SF.StartCell));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_memset+0
NOP	
;Sim800.c,88 :: 		memset(SF.WriteAPIKey,0,sizeof(SF.WriteAPIKey));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_memset+0
NOP	
;Sim800.c,89 :: 		memset(SF.ReadAPIKey,0,sizeof(SF.ReadAPIKey));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_memset+0
NOP	
;Sim800.c,90 :: 		memset(SF.APN,0,sizeof(SF.APN));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_memset+0
NOP	
;Sim800.c,91 :: 		memset(SF.PWD,0,sizeof(SF.PWD));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+118)
ORI	R25, R25, lo_addr(_SF+118)
JAL	_memset+0
NOP	
;Sim800.c,92 :: 		}
L_end_InitGSM3:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _InitGSM3
_PwrUpGSM3:
;Sim800.c,97 :: 		void PwrUpGSM3(){
;Sim800.c,98 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,99 :: 		PWR = 0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,100 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM30
NOP	
;Sim800.c,101 :: 		PWR = 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,103 :: 		while(STAT){
L_PwrUpGSM32:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrUpGSM3232
NOP	
J	L_PwrUpGSM33
NOP	
L__PwrUpGSM3232:
;Sim800.c,104 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,105 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM34
NOP	
;Sim800.c,106 :: 		}
J	L_PwrUpGSM32
NOP	
L_PwrUpGSM33:
;Sim800.c,107 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM36
NOP	
NOP	
NOP	
;Sim800.c,108 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_WriteToFlashTemp:
;Sim800.c,113 :: 		void WriteToFlashTemp(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,117 :: 		GetStrLengths();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_GetStrLengths+0
NOP	
;Sim800.c,119 :: 		memset(buff,0,512);                  //make every byte NULL
ORI	R27, R0, 512
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_buff+0)
ORI	R25, R25, lo_addr(_buff+0)
JAL	_memset+0
NOP	
;Sim800.c,120 :: 		memcpy(buff,SF.SimCelNum,SL.l1);          //Save Cell num
LH	R27, Offset(_SL+0)(GP)
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
LUI	R25, hi_addr(_buff+0)
ORI	R25, R25, lo_addr(_buff+0)
JAL	_memcpy+0
NOP	
;Sim800.c,121 :: 		memcpy(buff+SL.l1,SF.WriteAPIKey,SL.l2);//Save API Wr Key
LH	R3, Offset(_SL+0)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+2)(GP)
LUI	R26, hi_addr(_SF+58)
ORI	R26, R26, lo_addr(_SF+58)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,122 :: 		memcpy(buff+SL.l1l2,SF.ReadAPIKey,SL.l3); //Save API Rd Key
LH	R3, Offset(_SL+18)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+4)(GP)
LUI	R26, hi_addr(_SF+78)
ORI	R26, R26, lo_addr(_SF+78)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,123 :: 		memcpy(buff+SL.l1l2l3,SF.APN,SL.l4);        //Save APN
LH	R3, Offset(_SL+20)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+6)(GP)
LUI	R26, hi_addr(_SF+98)
ORI	R26, R26, lo_addr(_SF+98)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,124 :: 		memcpy(buff+SL.l1l2l3l4,SF.PWD,SL.l5);        //Save PWD
LH	R3, Offset(_SL+22)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+8)(GP)
LUI	R26, hi_addr(_SF+118)
ORI	R26, R26, lo_addr(_SF+118)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,126 :: 		memcpy(temp,buff,SL.lTotA+4);
LH	R2, Offset(_SL+14)(GP)
ADDIU	R2, R2, 4
SEH	R27, R2
LUI	R26, hi_addr(_buff+0)
ORI	R26, R26, lo_addr(_buff+0)
LUI	R25, hi_addr(_temp+0)
ORI	R25, R25, lo_addr(_temp+0)
JAL	_memcpy+0
NOP	
;Sim800.c,128 :: 		pos = FLASH_Settings_PAddr;
; pos start address is: 12 (R3)
LW	R3, Offset(_FLASH_Settings_PAddr+0)(GP)
;Sim800.c,129 :: 		j = NVMErasePage(pos);
SW	R3, 16(SP)
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R3, 16(SP)
SH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
;Sim800.c,130 :: 		if(j==0){
SEH	R2, R2
BEQ	R2, R0, L__WriteToFlashTemp234
NOP	
J	L_WriteToFlashTemp8
NOP	
L__WriteToFlashTemp234:
;Sim800.c,131 :: 		pos += 20 ;
ADDIU	R2, R3, 20
; pos end address is: 12 (R3)
; pos start address is: 16 (R4)
MOVZ	R4, R2, R0
;Sim800.c,132 :: 		for(i=0;i<100;i++){
SH	R0, Offset(WriteToFlashTemp_i_L0+0)(GP)
; pos end address is: 16 (R4)
L_WriteToFlashTemp9:
; pos start address is: 16 (R4)
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLTI	R2, R2, 100
BNE	R2, R0, L__WriteToFlashTemp235
NOP	
J	L_WriteToFlashTemp10
NOP	
L__WriteToFlashTemp235:
;Sim800.c,133 :: 		j = NVMWriteWord(pos,temp[i]);
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_temp+0)
ORI	R2, R2, lo_addr(_temp+0)
ADDU	R2, R2, R3
SW	R4, 16(SP)
LW	R26, 0(R2)
MOVZ	R25, R4, R0
JAL	_NVMWriteWord+0
NOP	
LW	R4, 16(SP)
SH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
;Sim800.c,134 :: 		pos += 4;
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
;Sim800.c,135 :: 		Delay_ms(5);
LUI	R24, 2
ORI	R24, R24, 2260
L_WriteToFlashTemp12:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WriteToFlashTemp12
NOP	
NOP	
NOP	
;Sim800.c,132 :: 		for(i=0;i<100;i++){
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
;Sim800.c,136 :: 		}
; pos end address is: 16 (R4)
J	L_WriteToFlashTemp9
NOP	
L_WriteToFlashTemp10:
;Sim800.c,137 :: 		}
L_WriteToFlashTemp8:
;Sim800.c,141 :: 		sprintf(a,"%d",i);
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_2_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_2_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,142 :: 		sprintf(b,"%d",j);
LH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_3_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_3_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,146 :: 		,a,b);
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 8(SP)
;Sim800.c,145 :: 		" * flash err:   %s\r\n"
LUI	R2, hi_addr(?lstr_4_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_4_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,143 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,146 :: 		,a,b);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
;Sim800.c,148 :: 		}
L_end_WriteToFlashTemp:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _WriteToFlashTemp
_GetValuesFromFlash:
;Sim800.c,153 :: 		char* GetValuesFromFlash(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,156 :: 		GetStrLengths();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_GetStrLengths+0
NOP	
;Sim800.c,158 :: 		ptr += 20;
LW	R2, Offset(_FLASH_Settings_VAddr+0)(GP)
ADDIU	R2, R2, 20
; ptr start address is: 16 (R4)
MOVZ	R4, R2, R0
;Sim800.c,160 :: 		for(i=0;i<SL.lTotA;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_GetValuesFromFlash14:
; i start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
LH	R2, Offset(_SL+14)(GP)
SLTU	R2, R5, R2
BNE	R2, R0, L__GetValuesFromFlash237
NOP	
J	L_GetValuesFromFlash15
NOP	
L__GetValuesFromFlash237:
; ptr end address is: 16 (R4)
;Sim800.c,161 :: 		buff[i] = ptr[i];
; ptr start address is: 16 (R4)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R3, R2, R5
ADDU	R2, R4, R5
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Sim800.c,163 :: 		UART1_Write(buff[i]);
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R5
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,164 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
;Sim800.c,160 :: 		for(i=0;i<SL.lTotA;i++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Sim800.c,166 :: 		}
; ptr end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_GetValuesFromFlash14
NOP	
L_GetValuesFromFlash15:
;Sim800.c,167 :: 		strncpy(SF.SimCelNum,buff,SL.l1);
LH	R27, Offset(_SL+0)(GP)
LUI	R26, hi_addr(_buff+0)
ORI	R26, R26, lo_addr(_buff+0)
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_strncpy+0
NOP	
;Sim800.c,168 :: 		strncpy(SF.WriteAPIKey,buff+SL.l1,SL.l2);
LH	R3, Offset(_SL+0)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+2)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_strncpy+0
NOP	
;Sim800.c,169 :: 		strncpy(SF.ReadAPIKey,buff+SL.l1l2,SL.l3);
LH	R3, Offset(_SL+18)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+4)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_strncpy+0
NOP	
;Sim800.c,170 :: 		strncpy(SF.APN,buff+SL.l1l2l3,SL.l4);
LH	R3, Offset(_SL+20)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+6)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_strncpy+0
NOP	
;Sim800.c,171 :: 		strncpy(SF.PWD,buff+SL.l1l2l3l4,SL.l5);
LH	R3, Offset(_SL+22)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+8)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+118)
ORI	R25, R25, lo_addr(_SF+118)
JAL	_strncpy+0
NOP	
;Sim800.c,180 :: 		,SF.ReadAPIKey,SF.APN,SF.PWD);
LUI	R2, hi_addr(_SF+118)
ORI	R2, R2, lo_addr(_SF+118)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LUI	R2, hi_addr(_SF+98)
ORI	R2, R2, lo_addr(_SF+98)
SW	R2, 20(SP)
LUI	R2, hi_addr(_SF+78)
ORI	R2, R2, lo_addr(_SF+78)
SW	R2, 16(SP)
;Sim800.c,179 :: 		,SF.SimCelNum,SF.WriteAPIKey
LUI	R2, hi_addr(_SF+58)
ORI	R2, R2, lo_addr(_SF+58)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
SW	R2, 8(SP)
;Sim800.c,178 :: 		" * SF.PWD:         %s\r\n"
LUI	R2, hi_addr(?lstr_5_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_5_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,173 :: 		PrintOut(PrintHandler, " * Flash Read        \r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,180 :: 		,SF.ReadAPIKey,SF.APN,SF.PWD);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 28
;Sim800.c,182 :: 		return SF.SimCelNum;
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
;Sim800.c,183 :: 		}
;Sim800.c,182 :: 		return SF.SimCelNum;
;Sim800.c,183 :: 		}
L_end_GetValuesFromFlash:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _GetValuesFromFlash
_GetStrLengths:
;Sim800.c,188 :: 		void GetStrLengths(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,190 :: 		SL.l1 = sizeof(SF.SimCelNum)-1;   //len of cell num
ORI	R2, R0, 19
SH	R2, Offset(_SL+0)(GP)
;Sim800.c,191 :: 		SL.l2 = sizeof(SF.WriteAPIKey)-1; //len of API Write key
ORI	R2, R0, 19
SH	R2, Offset(_SL+2)(GP)
;Sim800.c,192 :: 		SL.l3 = sizeof(SF.ReadAPIKey)-1;  //len of API Read Key
ORI	R2, R0, 19
SH	R2, Offset(_SL+4)(GP)
;Sim800.c,193 :: 		SL.l4 = sizeof(SF.APN)-1;         //len of APN
ORI	R2, R0, 19
SH	R2, Offset(_SL+6)(GP)
;Sim800.c,194 :: 		SL.l5 = sizeof(SF.PWD)-1;         //len of PWD
ORI	R2, R0, 19
SH	R2, Offset(_SL+8)(GP)
;Sim800.c,197 :: 		SL.lTotA     = SL.l1 + SL.l2 + SL.l3 + SL.l4 + SL.l5;
ORI	R2, R0, 95
SH	R2, Offset(_SL+14)(GP)
;Sim800.c,198 :: 		SL.l1l2      = SL.l1 + SL.l2;
ORI	R2, R0, 38
SH	R2, Offset(_SL+18)(GP)
;Sim800.c,199 :: 		SL.l1l2l3    = SL.l1l2 + SL.l3;
ORI	R2, R0, 57
SH	R2, Offset(_SL+20)(GP)
;Sim800.c,200 :: 		SL.l1l2l3l4  = SL.l1l2l3 + SL.l4;
ORI	R2, R0, 76
SH	R2, Offset(_SL+22)(GP)
;Sim800.c,202 :: 		SL.mod = SL.lTotA % 4;  //total divisable by 4 = flash Wrd size
ORI	R2, R0, 3
SH	R2, Offset(_SL+16)(GP)
;Sim800.c,203 :: 		SL.mod = 4 - SL.mod;
ORI	R2, R0, 1
SH	R2, Offset(_SL+16)(GP)
;Sim800.c,204 :: 		SL.lTotA += SL.mod;
ORI	R2, R0, 96
SH	R2, Offset(_SL+14)(GP)
;Sim800.c,207 :: 		sprintf(a,"%d",SL.l1);
ORI	R2, R0, 19
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_6_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_6_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,208 :: 		sprintf(b,"%d",SL.l2);
LH	R2, Offset(_SL+2)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_7_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_7_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,209 :: 		sprintf(c,"%d",SL.l3);
LH	R2, Offset(_SL+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_8_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_8_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_c+0)
ORI	R2, R2, lo_addr(_c+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,210 :: 		sprintf(d,"%d",SL.l4);
LH	R2, Offset(_SL+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_9_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_9_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_d+0)
ORI	R2, R2, lo_addr(_d+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,211 :: 		sprintf(e,"%d",SL.l5);
LH	R2, Offset(_SL+8)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_10_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_10_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_e+0)
ORI	R2, R2, lo_addr(_e+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,212 :: 		sprintf(f,"%d",SL.lTotA);
LH	R2, Offset(_SL+14)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_11_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_11_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_f+0)
ORI	R2, R2, lo_addr(_f+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,220 :: 		,a,b,c,d,e,f);
LUI	R2, hi_addr(_f+0)
ORI	R2, R2, lo_addr(_f+0)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
LUI	R2, hi_addr(_e+0)
ORI	R2, R2, lo_addr(_e+0)
SW	R2, 24(SP)
LUI	R2, hi_addr(_d+0)
ORI	R2, R2, lo_addr(_d+0)
SW	R2, 20(SP)
LUI	R2, hi_addr(_c+0)
ORI	R2, R2, lo_addr(_c+0)
SW	R2, 16(SP)
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 8(SP)
;Sim800.c,219 :: 		" * lTotA: %s\r\n"
LUI	R2, hi_addr(?lstr_12_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_12_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,213 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,220 :: 		,a,b,c,d,e,f);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,222 :: 		}
L_end_GetStrLengths:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _GetStrLengths
_RcvSimTxt:
;Sim800.c,227 :: 		void RcvSimTxt(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,229 :: 		while(UART2_Data_Ready()) {     // If data is received
L_RcvSimTxt17:
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__RcvSimTxt241
NOP	
J	L_RcvSimTxt18
NOP	
L__RcvSimTxt241:
;Sim800.c,230 :: 		if (U2STAbits.FERR || U2STAbits.OERR){
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__RcvSimTxt242
NOP	
J	L__RcvSimTxt207
NOP	
L__RcvSimTxt242:
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__RcvSimTxt243
NOP	
J	L__RcvSimTxt206
NOP	
L__RcvSimTxt243:
J	L_RcvSimTxt21
NOP	
L__RcvSimTxt207:
L__RcvSimTxt206:
;Sim800.c,231 :: 		if (U2STAbits.FERR ){
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BNE	R2, R0, L__RcvSimTxt245
NOP	
J	L_RcvSimTxt22
NOP	
L__RcvSimTxt245:
;Sim800.c,232 :: 		U2STAbits.FERR = 0;
ORI	R2, R0, 4
SW	R2, Offset(U2STAbits+4)(GP)
;Sim800.c,233 :: 		goto m0;
J	___RcvSimTxt_m0
NOP	
;Sim800.c,234 :: 		}
L_RcvSimTxt22:
;Sim800.c,235 :: 		if(U2STAbits.OERR)
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__RcvSimTxt247
NOP	
J	L_RcvSimTxt23
NOP	
L__RcvSimTxt247:
;Sim800.c,236 :: 		U2STAbits.OERR = 0;
ORI	R2, R0, 2
SW	R2, Offset(U2STAbits+4)(GP)
L_RcvSimTxt23:
;Sim800.c,237 :: 		}
L_RcvSimTxt21:
;Sim800.c,238 :: 		m0:
___RcvSimTxt_m0:
;Sim800.c,239 :: 		txt = U2RXREG;
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Sim800.c,240 :: 		U1TXREG = txt;
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,241 :: 		if(txt >= 0x20){
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt248
NOP	
J	L_RcvSimTxt24
NOP	
L__RcvSimTxt248:
;Sim800.c,242 :: 		RB.buff[RB.head] = txt;
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
SB	R4, 0(R2)
; txt end address is: 16 (R4)
;Sim800.c,243 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,244 :: 		}else if(U2RXREG == 0x0A){
J	L_RcvSimTxt25
NOP	
L_RcvSimTxt24:
LW	R3, Offset(U2RXREG+0)(GP)
ORI	R2, R0, 10
BEQ	R3, R2, L__RcvSimTxt249
NOP	
J	L_RcvSimTxt26
NOP	
L__RcvSimTxt249:
;Sim800.c,245 :: 		RB.buff[RB.head] = ',';
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
ORI	R2, R0, 44
SB	R2, 0(R3)
;Sim800.c,246 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,247 :: 		}
L_RcvSimTxt26:
L_RcvSimTxt25:
;Sim800.c,248 :: 		if(RB.head > 999){
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RcvSimTxt250
NOP	
J	L_RcvSimTxt27
NOP	
L__RcvSimTxt250:
;Sim800.c,249 :: 		RB.head = 0;             //rest head when buffer is full
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,250 :: 		}
L_RcvSimTxt27:
;Sim800.c,251 :: 		}
J	L_RcvSimTxt17
NOP	
L_RcvSimTxt18:
;Sim800.c,252 :: 		RB.rcv_txt_fin = 1;
ORI	R2, R0, 1
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,253 :: 		}
L_end_RcvSimTxt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RcvSimTxt
_TestRingPointers:
;Sim800.c,258 :: 		int TestRingPointers(){
;Sim800.c,260 :: 		if(RB.tail > RB.head){
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__TestRingPointers252
NOP	
J	L_TestRingPointers28
NOP	
L__TestRingPointers252:
;Sim800.c,261 :: 		diff = 1000 - RB.tail;
LHU	R3, Offset(_RB+1004)(GP)
ORI	R2, R0, 1000
SUBU	R3, R2, R3
;Sim800.c,262 :: 		diff += RB.head;
LHU	R2, Offset(_RB+1002)(GP)
ADDU	R2, R3, R2
; diff start address is: 8 (R2)
;Sim800.c,263 :: 		}else{
; diff end address is: 8 (R2)
J	L_TestRingPointers29
NOP	
L_TestRingPointers28:
;Sim800.c,264 :: 		diff = RB.head - RB.tail;
LHU	R3, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SUBU	R2, R2, R3
; diff start address is: 12 (R3)
ANDI	R3, R2, 65535
; diff end address is: 12 (R3)
SEH	R2, R3
;Sim800.c,265 :: 		}
L_TestRingPointers29:
;Sim800.c,266 :: 		return diff;
; diff start address is: 8 (R2)
; diff end address is: 8 (R2)
;Sim800.c,267 :: 		}
L_end_TestRingPointers:
JR	RA
NOP	
; end of _TestRingPointers
_WaitForResponse:
;Sim800.c,272 :: 		void WaitForResponse(short dly){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,274 :: 		lastMillis = TMR0.millis;
; lastMillis start address is: 20 (R5)
LW	R5, Offset(_TMR0+0)(GP)
;Sim800.c,275 :: 		RB.rcv_txt_fin   = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,276 :: 		RB.last_head     = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,277 :: 		do{
J	L_WaitForResponse30
NOP	
L__WaitForResponse208:
;Sim800.c,296 :: 		}while(!RB.rcv_txt_fin);
;Sim800.c,277 :: 		do{
L_WaitForResponse30:
;Sim800.c,278 :: 		LATE3_bit = !LATE3_bit;
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,279 :: 		if(dly == 0)
SEB	R2, R25
BEQ	R2, R0, L__WaitForResponse254
NOP	
J	L_WaitForResponse33
NOP	
L__WaitForResponse254:
; lastMillis end address is: 20 (R5)
;Sim800.c,280 :: 		Delay_ms(100);
; lastMillis start address is: 20 (R5)
LUI	R24, 40
ORI	R24, R24, 45226
L_WaitForResponse34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse34
NOP	
J	L_WaitForResponse36
NOP	
L_WaitForResponse33:
;Sim800.c,281 :: 		else if(dly == 1)
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForResponse255
NOP	
J	L_WaitForResponse37
NOP	
L__WaitForResponse255:
;Sim800.c,282 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForResponse38:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse38
NOP	
NOP	
NOP	
J	L_WaitForResponse40
NOP	
L_WaitForResponse37:
;Sim800.c,283 :: 		else if(dly == 3){
SEB	R3, R25
ORI	R2, R0, 3
BEQ	R3, R2, L__WaitForResponse256
NOP	
J	L_WaitForResponse41
NOP	
L__WaitForResponse256:
;Sim800.c,284 :: 		UART2_Write_Text("ATE0");
ORI	R30, R0, 65
SB	R30, 5(SP)
ORI	R30, R0, 84
SB	R30, 6(SP)
ORI	R30, R0, 69
SB	R30, 7(SP)
ORI	R30, R0, 48
SB	R30, 8(SP)
MOVZ	R30, R0, R0
SB	R30, 9(SP)
ADDIU	R2, SP, 5
SB	R25, 4(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,285 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,286 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LB	R25, 4(SP)
;Sim800.c,287 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_WaitForResponse42:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse42
NOP	
NOP	
NOP	
;Sim800.c,288 :: 		}
J	L_WaitForResponse44
NOP	
L_WaitForResponse41:
;Sim800.c,290 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse45:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse45
NOP	
L_WaitForResponse44:
L_WaitForResponse40:
L_WaitForResponse36:
;Sim800.c,293 :: 		newMillis = TMR0.millis - lastMillis;
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R3, R2, R5
;Sim800.c,294 :: 		if(newMillis > 59000)
ORI	R2, R0, 59000
SLTU	R2, R2, R3
BNE	R2, R0, L__WaitForResponse257
NOP	
J	L_WaitForResponse47
NOP	
L__WaitForResponse257:
; lastMillis end address is: 20 (R5)
;Sim800.c,295 :: 		break;
J	L_WaitForResponse31
NOP	
L_WaitForResponse47:
;Sim800.c,296 :: 		}while(!RB.rcv_txt_fin);
; lastMillis start address is: 20 (R5)
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForResponse259
NOP	
J	L__WaitForResponse208
NOP	
L__WaitForResponse259:
; lastMillis end address is: 20 (R5)
L_WaitForResponse31:
;Sim800.c,297 :: 		}
L_end_WaitForResponse:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WaitForResponse
_RingToTempBuf:
;Sim800.c,302 :: 		void RingToTempBuf(){
;Sim800.c,304 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,305 :: 		RB.tail = RB.last_tail;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
; i end address is: 20 (R5)
;Sim800.c,307 :: 		while(RB.tail != RB.head){
L_RingToTempBuf48:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
BNE	R2, R3, L__RingToTempBuf262
NOP	
J	L_RingToTempBuf49
NOP	
L__RingToTempBuf262:
;Sim800.c,308 :: 		SimTestTxt[i] = RB.buff[RB.tail];
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R4, R2, R3
LHU	R3, Offset(_RB+1004)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
;Sim800.c,313 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,314 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,315 :: 		if(RB.tail > 999)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RingToTempBuf263
NOP	
J	L_RingToTempBuf50
NOP	
L__RingToTempBuf263:
;Sim800.c,316 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
L_RingToTempBuf50:
;Sim800.c,317 :: 		};
J	L_RingToTempBuf48
NOP	
L_RingToTempBuf49:
;Sim800.c,318 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,320 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,321 :: 		}
L_end_RingToTempBuf:
JR	RA
NOP	
; end of _RingToTempBuf
_SetupIOT:
;Sim800.c,327 :: 		char SetupIOT(){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Sim800.c,337 :: 		" * ATE0\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(?lstr_14_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_14_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,336 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,337 :: 		" * ATE0\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,340 :: 		WaitForResponse(3);
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
;Sim800.c,341 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT51:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT51
NOP	
;Sim800.c,342 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,348 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,347 :: 		" * Check if Sim is Registered\r\n"
LUI	R2, hi_addr(?lstr_15_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_15_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,345 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,348 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,350 :: 		wait:
___SetupIOT_wait:
;Sim800.c,352 :: 		UART2_Write_Text("AT+CREG?");
ADDIU	R23, SP, 12
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr16_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr16_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 12
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,353 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,354 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,355 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,356 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT53:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT53
NOP	
NOP	
NOP	
;Sim800.c,357 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,362 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,361 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_17_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_17_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,360 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,362 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,366 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT265
NOP	
J	L_SetupIOT55
NOP	
L__SetupIOT265:
;Sim800.c,368 :: 		num_strs = strsplit(SimTestTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
;Sim800.c,371 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_18_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_18_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,381 :: 		,string[3],string[4]);
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
;Sim800.c,380 :: 		,string[1],string[2]
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
;Sim800.c,379 :: 		,txtA,string[0]
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,378 :: 		" *string[4]  %s\r\n"
LUI	R2, hi_addr(?lstr_19_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_19_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,372 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,381 :: 		,string[3],string[4]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,383 :: 		str_rcv = findnumber(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
;Sim800.c,384 :: 		res = atoi(str_rcv);  //get the sms rec number
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,385 :: 		if(res == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT266
NOP	
J	L_SetupIOT56
NOP	
L__SetupIOT266:
;Sim800.c,387 :: 		sprintf(txtA,"%d",res);
ADDIU	SP, SP, -12
SH	R4, 8(SP)
; res end address is: 16 (R4)
LUI	R2, hi_addr(?lstr_20_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_20_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,390 :: 		,txtA);
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,389 :: 		" *Registered with:= %s\r\n"
LUI	R2, hi_addr(?lstr_21_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_21_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,388 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,390 :: 		,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,393 :: 		}else{
J	L_SetupIOT57
NOP	
L_SetupIOT56:
;Sim800.c,396 :: 		" *Sim Not Registered\r\n");
LUI	R2, hi_addr(?lstr_22_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_22_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,395 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,396 :: 		" *Sim Not Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,398 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT58:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT58
NOP	
NOP	
NOP	
;Sim800.c,399 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,400 :: 		}
L_SetupIOT57:
;Sim800.c,401 :: 		}
L_SetupIOT55:
;Sim800.c,404 :: 		" *Sim Registered\r\n");
LUI	R2, hi_addr(?lstr_23_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_23_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,403 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,404 :: 		" *Sim Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,408 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,409 :: 		}
;Sim800.c,408 :: 		return 1;
;Sim800.c,409 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,416 :: 		char WaitForSetupSMS(unsigned int Indx){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Sim800.c,420 :: 		UART2_Write_Text("AT+CMGF=1");
SW	R26, 4(SP)
SW	R27, 8(SP)
ADDIU	R23, SP, 16
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr24_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr24_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 16
SH	R25, 12(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,421 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,422 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,425 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,426 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,428 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS60:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS60
NOP	
;Sim800.c,430 :: 		WaitForResponse(0);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,431 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS62:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS62
NOP	
;Sim800.c,432 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,434 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 84 (R21)
SEH	R21, R2
;Sim800.c,437 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_25_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_25_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,438 :: 		sprintf(txtA,"%d",num_strs);
; num_strs end address is: 84 (R21)
ADDIU	SP, SP, -12
SH	R21, 8(SP)
LUI	R2, hi_addr(?lstr_26_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_26_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,449 :: 		string[4],string[5]);
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,448 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,447 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,446 :: 		" *string[5]  %s\r\n"
LUI	R2, hi_addr(?lstr_27_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_27_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,439 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,449 :: 		string[4],string[5]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
;Sim800.c,452 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 14(SP)
;Sim800.c,453 :: 		sprintf(sms,"%d",res);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_28_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_28_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,457 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,456 :: 		" *sms no:= %s\r\n"
LUI	R2, hi_addr(?lstr_29_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_29_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,455 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,457 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,461 :: 		UART2_Write_Text("AT+CMGR=");
ADDIU	R23, SP, 26
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr30_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr30_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 26
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,462 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,463 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,464 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,466 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,467 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS64:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS64
NOP	
;Sim800.c,468 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,469 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
;Sim800.c,471 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_31_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_31_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,487 :: 		,string[8]);
LUI	R2, hi_addr(_string+512)
ORI	R2, R2, lo_addr(_string+512)
ADDIU	SP, SP, -48
SW	R2, 44(SP)
;Sim800.c,486 :: 		,string[6],string[7]
LUI	R2, hi_addr(_string+448)
ORI	R2, R2, lo_addr(_string+448)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 36(SP)
;Sim800.c,485 :: 		,string[4],string[5]
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,484 :: 		,string[2],string[3]
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,483 :: 		,txtA,string[0],string[1]
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,482 :: 		" *string[8]  %s\r\n"
LUI	R2, hi_addr(?lstr_32_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_32_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,472 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,487 :: 		,string[8]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 48
LHU	R25, 12(SP)
;Sim800.c,490 :: 		if(Indx == 0){
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS268
NOP	
J	L_WaitForSetupSMS66
NOP	
L__WaitForSetupSMS268:
;Sim800.c,492 :: 		strncpy(SF.SimCelNum,string[1],strlen(string[1])+11);
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 11
SEH	R27, R2
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_strncpy+0
NOP	
;Sim800.c,493 :: 		strncpy(SF.SimDate,string[3],strlen(string[3])+1);
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+192)
ORI	R26, R26, lo_addr(_string+192)
LUI	R25, hi_addr(_SF+0)
ORI	R25, R25, lo_addr(_SF+0)
JAL	_strncpy+0
NOP	
;Sim800.c,494 :: 		strncpy(SF.SimTime,string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+9)
ORI	R25, R25, lo_addr(_SF+9)
JAL	_strncpy+0
NOP	
;Sim800.c,501 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
LUI	R2, hi_addr(_SF+9)
ORI	R2, R2, lo_addr(_SF+9)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
LUI	R2, hi_addr(_SF+0)
ORI	R2, R2, lo_addr(_SF+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
SW	R2, 8(SP)
;Sim800.c,500 :: 		" * SF.SimTime: %s\r\n"
LUI	R2, hi_addr(?lstr_33_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_33_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,497 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,501 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,503 :: 		}else if(Indx == 1){
J	L_WaitForSetupSMS67
NOP	
L_WaitForSetupSMS66:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS269
NOP	
J	L_WaitForSetupSMS68
NOP	
L__WaitForSetupSMS269:
;Sim800.c,505 :: 		strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_strncpy+0
NOP	
;Sim800.c,508 :: 		strncpy(SF.ReadAPIKey,string[6],strlen(string[6])+1);
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+384)
ORI	R26, R26, lo_addr(_string+384)
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_strncpy+0
NOP	
;Sim800.c,511 :: 		strncpy(SF.APN,string[7],strlen(string[7])+1);
LUI	R25, hi_addr(_string+448)
ORI	R25, R25, lo_addr(_string+448)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+448)
ORI	R26, R26, lo_addr(_string+448)
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_strncpy+0
NOP	
;Sim800.c,514 :: 		strncpy(SF.PWD,string[8],strlen(string[8])+1);
LUI	R25, hi_addr(_string+512)
ORI	R25, R25, lo_addr(_string+512)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+512)
ORI	R26, R26, lo_addr(_string+512)
LUI	R25, hi_addr(_SF+118)
ORI	R25, R25, lo_addr(_SF+118)
JAL	_strncpy+0
NOP	
;Sim800.c,523 :: 		,SF.APN,SF.PWD);
LUI	R2, hi_addr(_SF+118)
ORI	R2, R2, lo_addr(_SF+118)
ADDIU	SP, SP, -24
SW	R2, 20(SP)
LUI	R2, hi_addr(_SF+98)
ORI	R2, R2, lo_addr(_SF+98)
SW	R2, 16(SP)
;Sim800.c,522 :: 		,SF.WriteAPIKey,SF.ReadAPIKey
LUI	R2, hi_addr(_SF+78)
ORI	R2, R2, lo_addr(_SF+78)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+58)
ORI	R2, R2, lo_addr(_SF+58)
SW	R2, 8(SP)
;Sim800.c,521 :: 		" * SF.PWD:         %s\r\n"
LUI	R2, hi_addr(?lstr_34_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_34_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,517 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,523 :: 		,SF.APN,SF.PWD);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 24
LHU	R25, 12(SP)
;Sim800.c,526 :: 		}
L_WaitForSetupSMS68:
L_WaitForSetupSMS67:
;Sim800.c,529 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS69:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS69
NOP	
NOP	
NOP	
;Sim800.c,530 :: 		RemoveSMSText(res);
SH	R25, 12(SP)
LH	R25, 14(SP)
JAL	_RemoveSMSText+0
NOP	
;Sim800.c,531 :: 		res = strcmp(SimTestTxt,"OK,");
ORI	R30, R0, 79
SB	R30, 35(SP)
ORI	R30, R0, 75
SB	R30, 36(SP)
ORI	R30, R0, 44
SB	R30, 37(SP)
MOVZ	R30, R0, R0
SB	R30, 38(SP)
ADDIU	R2, SP, 35
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strcmp+0
NOP	
SH	R2, 14(SP)
;Sim800.c,533 :: 		sprintf(txtA,"%d",res);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_36_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_36_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,537 :: 		,SimTestTxt,txtA);
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SW	R2, 8(SP)
;Sim800.c,536 :: 		" * OK-0: %s\r\n"
LUI	R2, hi_addr(?lstr_37_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_37_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,534 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,537 :: 		,SimTestTxt,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LHU	R25, 12(SP)
;Sim800.c,540 :: 		if((res == 0)&&(Indx == 1)){
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS270
NOP	
J	L__WaitForSetupSMS212
NOP	
L__WaitForSetupSMS270:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS271
NOP	
J	L__WaitForSetupSMS211
NOP	
L__WaitForSetupSMS271:
L__WaitForSetupSMS210:
;Sim800.c,541 :: 		WriteToFlashTemp();
JAL	_WriteToFlashTemp+0
NOP	
;Sim800.c,542 :: 		return 3;
ORI	R2, R0, 3
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,540 :: 		if((res == 0)&&(Indx == 1)){
L__WaitForSetupSMS212:
L__WaitForSetupSMS211:
;Sim800.c,544 :: 		else if ((res == 0)&&(Indx == 0))
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS272
NOP	
J	L__WaitForSetupSMS214
NOP	
L__WaitForSetupSMS272:
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS273
NOP	
J	L__WaitForSetupSMS213
NOP	
L__WaitForSetupSMS273:
L__WaitForSetupSMS209:
;Sim800.c,545 :: 		return 2;
ORI	R2, R0, 2
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,544 :: 		else if ((res == 0)&&(Indx == 0))
L__WaitForSetupSMS214:
L__WaitForSetupSMS213:
;Sim800.c,547 :: 		return res;
LH	R2, 14(SP)
;Sim800.c,548 :: 		}
;Sim800.c,547 :: 		return res;
;Sim800.c,548 :: 		}
L_end_WaitForSetupSMS:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _WaitForSetupSMS
_AT_Initial:
;Sim800.c,554 :: 		void AT_Initial(){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Sim800.c,557 :: 		UART2_Write_Text("AT&W+CNMI=2,1,0,0,0");
SW	R25, 4(SP)
ADDIU	R23, SP, 8
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr38_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr38_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,558 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,559 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,562 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,563 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_AT_Initial79:
ADDIU	R24, R24, -1
BNE	R24, R0, L_AT_Initial79
NOP	
;Sim800.c,564 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,565 :: 		}
L_end_AT_Initial:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _AT_Initial
_GetAPI_Key_SMS:
;Sim800.c,570 :: 		char GetAPI_Key_SMS(){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Sim800.c,575 :: 		UART2_Write_Text("AT+CMGS=");
SW	R25, 4(SP)
ADDIU	R23, SP, 8
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr39_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr39_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,576 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,577 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,578 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,581 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,582 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,583 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_GetAPI_Key_SMS81:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetAPI_Key_SMS81
NOP	
NOP	
NOP	
;Sim800.c,587 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,586 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_40_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_40_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,585 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,587 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,590 :: 		UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
ADDIU	R23, SP, 17
ADDIU	R22, R23, 63
LUI	R24, hi_addr(?ICS?lstr41_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr41_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,591 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,592 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,593 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,595 :: 		response = WaitForSetupSMS(1);
ORI	R25, R0, 1
JAL	_WaitForSetupSMS+0
NOP	
;Sim800.c,597 :: 		return response;
;Sim800.c,598 :: 		}
;Sim800.c,597 :: 		return response;
;Sim800.c,598 :: 		}
L_end_GetAPI_Key_SMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _GetAPI_Key_SMS
_SendSMS:
;Sim800.c,603 :: 		char SendSMS(char sms_type,char cellNum){
ADDIU	SP, SP, -528
SW	RA, 0(SP)
;Sim800.c,609 :: 		str = (char*)Malloc(100*sizeof(char*));
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R25, 16(SP)
ORI	R25, R0, 400
JAL	_Malloc+0
NOP	
LBU	R25, 16(SP)
; str start address is: 24 (R6)
MOVZ	R6, R2, R0
;Sim800.c,610 :: 		if(!cellNum)
BEQ	R26, R0, L__SendSMS277
NOP	
J	L_SendSMS83
NOP	
L__SendSMS277:
;Sim800.c,611 :: 		strcpy(tempCellNum,string[1]);
ADDIU	R2, SP, 81
SB	R25, 16(SP)
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LBU	R25, 16(SP)
J	L_SendSMS84
NOP	
L_SendSMS83:
;Sim800.c,613 :: 		strcpy(tempCellNum,SF.SimCelNum);
ADDIU	R2, SP, 81
SB	R25, 16(SP)
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LBU	R25, 16(SP)
L_SendSMS84:
;Sim800.c,615 :: 		if(!onecA){
LB	R2, Offset(SendSMS_onecA_L0+0)(GP)
BEQ	R2, R0, L__SendSMS278
NOP	
J	L_SendSMS85
NOP	
L__SendSMS278:
;Sim800.c,616 :: 		onecA = 1;
ORI	R2, R0, 1
SB	R2, Offset(SendSMS_onecA_L0+0)(GP)
;Sim800.c,617 :: 		AT_Initial();
JAL	_AT_Initial+0
NOP	
;Sim800.c,618 :: 		}
L_SendSMS85:
;Sim800.c,620 :: 		UART2_Write_Text("AT+CMGF=1");
ADDIU	R23, SP, 101
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr42_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr42_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 101
SB	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,621 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,622 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,623 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS86:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS86
NOP	
;Sim800.c,624 :: 		UART2_Write_Text("AT+CMGS=");
ADDIU	R23, SP, 111
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr43_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr43_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 111
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,625 :: 		UART2_Write_Text(tempCellNum);//SF.SimCelNum);
ADDIU	R2, SP, 81
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,626 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,627 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 16(SP)
;Sim800.c,628 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS88:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS88
NOP	
NOP	
NOP	
;Sim800.c,629 :: 		switch(sms_type){
J	L_SendSMS90
NOP	
;Sim800.c,630 :: 		case 0:
L_SendSMS92:
;Sim800.c,631 :: 		UART2_Write_Text("ERROR in setup Power down and start again!");
ADDIU	R23, SP, 120
ADDIU	R22, R23, 43
LUI	R24, hi_addr(?ICS?lstr44_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr44_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 120
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,632 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS91
NOP	
;Sim800.c,633 :: 		case 1:
L_SendSMS93:
;Sim800.c,634 :: 		UART2_Write_Text("Reply WebSite");
ADDIU	R23, SP, 163
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr45_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr45_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 163
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,635 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS91
NOP	
;Sim800.c,636 :: 		case 2:
L_SendSMS94:
;Sim800.c,637 :: 		UART2_Write_Text("Reply API Key");
ADDIU	R23, SP, 177
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr46_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr46_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 177
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,638 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS91
NOP	
;Sim800.c,639 :: 		case 3:
L_SendSMS95:
;Sim800.c,640 :: 		UART2_Write_Text("Setup Complete!");
ADDIU	R23, SP, 191
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr47_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr47_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 191
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,641 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS91
NOP	
;Sim800.c,642 :: 		case 4:
L_SendSMS96:
;Sim800.c,643 :: 		UART2_Write_Text("Device Powered up!");
ADDIU	R23, SP, 207
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr48_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr48_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 207
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,644 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS91
NOP	
;Sim800.c,645 :: 		case 5:
L_SendSMS97:
;Sim800.c,646 :: 		UART2_Write_Text("SMS Not recieved!");
ADDIU	R23, SP, 226
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr49_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr49_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 226
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,647 :: 		break;
MOVZ	R3, R6, R0
; str end address is: 24 (R6)
J	L_SendSMS91
NOP	
;Sim800.c,648 :: 		case 6: //read the set points
L_SendSMS98:
;Sim800.c,649 :: 		str = Read_Thresholds();
JAL	_Read_Thresholds+0
NOP	
; str start address is: 24 (R6)
MOVZ	R6, R2, R0
;Sim800.c,650 :: 		strncpy(b,str,strlen(str)-4);
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, R2, -4
ADDIU	R2, SP, 17
SEH	R27, R3
MOVZ	R26, R6, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Sim800.c,651 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,652 :: 		break;
MOVZ	R3, R6, R0
; str end address is: 24 (R6)
J	L_SendSMS91
NOP	
;Sim800.c,653 :: 		case 7: //read raw values
L_SendSMS99:
;Sim800.c,654 :: 		str = Read_Send_AllColour(0);
MOVZ	R25, R0, R0
JAL	_Read_Send_AllColour+0
NOP	
; str start address is: 24 (R6)
MOVZ	R6, R2, R0
;Sim800.c,655 :: 		strncpy(b,str,strlen(str));
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 17
SEH	R27, R2
MOVZ	R26, R6, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Sim800.c,656 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,657 :: 		break;
MOVZ	R3, R6, R0
; str end address is: 24 (R6)
J	L_SendSMS91
NOP	
;Sim800.c,658 :: 		case 8: //read scaled values
L_SendSMS100:
;Sim800.c,659 :: 		str = Read_Send_AllColour(1);
ORI	R25, R0, 1
JAL	_Read_Send_AllColour+0
NOP	
; str start address is: 24 (R6)
MOVZ	R6, R2, R0
;Sim800.c,660 :: 		strncpy(b,str,strlen(str));
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 17
SEH	R27, R2
MOVZ	R26, R6, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Sim800.c,661 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,662 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS91
NOP	
;Sim800.c,663 :: 		case 9:
L_SendSMS101:
;Sim800.c,664 :: 		UART2_Write_Text("Test Started!");
ADDIU	R23, SP, 244
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr50_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr50_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 244
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,665 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS91
NOP	
;Sim800.c,666 :: 		case 10:
L_SendSMS102:
;Sim800.c,667 :: 		UART2_Write_Text("Test Stopped!");
ADDIU	R23, SP, 258
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr51_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr51_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 258
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,668 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS91
NOP	
;Sim800.c,669 :: 		case 11:
L_SendSMS103:
;Sim800.c,670 :: 		UART2_Write_Text("You are not permitted to set the threshold contact the supplier!");
ADDIU	R23, SP, 272
ADDIU	R22, R23, 65
LUI	R24, hi_addr(?ICS?lstr52_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr52_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 272
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,671 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS91
NOP	
;Sim800.c,672 :: 		case 12:
L_SendSMS104:
;Sim800.c,673 :: 		UART2_Write_Text("Not a recognised command!");
ADDIU	R23, SP, 337
ADDIU	R22, R23, 26
LUI	R24, hi_addr(?ICS?lstr53_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr53_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 337
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,674 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS91
NOP	
;Sim800.c,675 :: 		case 13:
L_SendSMS105:
;Sim800.c,676 :: 		UART2_Write_Text("You cannot stop this test contact the owner of this test!");
ADDIU	R23, SP, 363
ADDIU	R22, R23, 58
LUI	R24, hi_addr(?ICS?lstr54_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr54_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 363
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,677 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS91
NOP	
;Sim800.c,678 :: 		case 14:
L_SendSMS106:
;Sim800.c,679 :: 		UART2_Write_Text("Test already started contact owner of this test!");
ADDIU	R23, SP, 421
ADDIU	R22, R23, 49
LUI	R24, hi_addr(?ICS?lstr55_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr55_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 421
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,680 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS91
NOP	
;Sim800.c,681 :: 		case 15:
L_SendSMS107:
;Sim800.c,682 :: 		UART2_Write_Text("Test has not been started!");
ADDIU	R23, SP, 470
ADDIU	R22, R23, 27
LUI	R24, hi_addr(?ICS?lstr56_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr56_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 470
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,683 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS91
NOP	
;Sim800.c,684 :: 		default:
L_SendSMS108:
;Sim800.c,685 :: 		UART2_Write_Text("Error Power cycle the device!");
ADDIU	R23, SP, 497
ADDIU	R22, R23, 30
LUI	R24, hi_addr(?ICS?lstr57_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr57_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 497
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,686 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS91
NOP	
;Sim800.c,687 :: 		}
L_SendSMS90:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS280
NOP	
J	L_SendSMS92
NOP	
L__SendSMS280:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS282
NOP	
J	L_SendSMS93
NOP	
L__SendSMS282:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS284
NOP	
J	L_SendSMS94
NOP	
L__SendSMS284:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__SendSMS286
NOP	
J	L_SendSMS95
NOP	
L__SendSMS286:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__SendSMS288
NOP	
J	L_SendSMS96
NOP	
L__SendSMS288:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__SendSMS290
NOP	
J	L_SendSMS97
NOP	
L__SendSMS290:
ANDI	R3, R25, 255
ORI	R2, R0, 6
BNE	R3, R2, L__SendSMS292
NOP	
J	L_SendSMS98
NOP	
L__SendSMS292:
ANDI	R3, R25, 255
ORI	R2, R0, 7
BNE	R3, R2, L__SendSMS294
NOP	
J	L_SendSMS99
NOP	
L__SendSMS294:
ANDI	R3, R25, 255
ORI	R2, R0, 8
BNE	R3, R2, L__SendSMS296
NOP	
J	L_SendSMS100
NOP	
L__SendSMS296:
ANDI	R3, R25, 255
ORI	R2, R0, 9
BNE	R3, R2, L__SendSMS298
NOP	
J	L_SendSMS101
NOP	
L__SendSMS298:
ANDI	R3, R25, 255
ORI	R2, R0, 10
BNE	R3, R2, L__SendSMS300
NOP	
J	L_SendSMS102
NOP	
L__SendSMS300:
ANDI	R3, R25, 255
ORI	R2, R0, 11
BNE	R3, R2, L__SendSMS302
NOP	
J	L_SendSMS103
NOP	
L__SendSMS302:
ANDI	R3, R25, 255
ORI	R2, R0, 12
BNE	R3, R2, L__SendSMS304
NOP	
J	L_SendSMS104
NOP	
L__SendSMS304:
ANDI	R3, R25, 255
ORI	R2, R0, 13
BNE	R3, R2, L__SendSMS306
NOP	
J	L_SendSMS105
NOP	
L__SendSMS306:
ANDI	R3, R25, 255
ORI	R2, R0, 14
BNE	R3, R2, L__SendSMS308
NOP	
J	L_SendSMS106
NOP	
L__SendSMS308:
ANDI	R3, R25, 255
ORI	R2, R0, 15
BNE	R3, R2, L__SendSMS310
NOP	
J	L_SendSMS107
NOP	
L__SendSMS310:
J	L_SendSMS108
NOP	
; str end address is: 24 (R6)
L_SendSMS91:
;Sim800.c,688 :: 		UART2_Write(0x0D);
; str start address is: 12 (R3)
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,689 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,690 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,691 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendSMS109:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS109
NOP	
NOP	
NOP	
;Sim800.c,693 :: 		Free(str,100*sizeof(char*));
ORI	R26, R0, 400
MOVZ	R25, R3, R0
; str end address is: 12 (R3)
JAL	_Free+0
NOP	
;Sim800.c,695 :: 		}
L_end_SendSMS:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 528
JR	RA
NOP	
; end of _SendSMS
_GetSMSText:
;Sim800.c,700 :: 		char* GetSMSText(){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Sim800.c,703 :: 		UART1_Write_Text("=================\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 20
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr58_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr58_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,704 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,708 :: 		num_strs = strsplit(SimTestTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 20 (R5)
SEH	R5, R2
;Sim800.c,710 :: 		err = strncmp(sms_test,string[0],4);
ORI	R27, R0, 4
LUI	R26, hi_addr(_string+0)
ORI	R26, R26, lo_addr(_string+0)
LUI	R25, hi_addr(_sms_test+0)
ORI	R25, R25, lo_addr(_sms_test+0)
JAL	_strncmp+0
NOP	
SH	R2, 18(SP)
;Sim800.c,712 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	SP, SP, -12
SH	R5, 8(SP)
; num_strs end address is: 20 (R5)
LUI	R2, hi_addr(?lstr_59_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_59_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,713 :: 		sprintf(txtB,"%d",err);
LH	R2, 18(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_60_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_60_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtB+0)
ORI	R2, R2, lo_addr(_txtB+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,730 :: 		,string[7],string[8]);
LUI	R2, hi_addr(_string+512)
ORI	R2, R2, lo_addr(_string+512)
ADDIU	SP, SP, -52
SW	R2, 48(SP)
LUI	R2, hi_addr(_string+448)
ORI	R2, R2, lo_addr(_string+448)
SW	R2, 44(SP)
;Sim800.c,729 :: 		,string[5],string[6]
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 36(SP)
;Sim800.c,728 :: 		,string[3],string[4]
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 28(SP)
;Sim800.c,727 :: 		,string[1],string[2]
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 20(SP)
;Sim800.c,726 :: 		,txtA,txtB,string[0]
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 16(SP)
LUI	R2, hi_addr(_txtB+0)
ORI	R2, R2, lo_addr(_txtB+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,725 :: 		" *string[8]  %s\r\n"
LUI	R2, hi_addr(?lstr_61_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_61_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,714 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,730 :: 		,string[7],string[8]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 52
;Sim800.c,733 :: 		if(!err){
LH	R2, 18(SP)
BEQ	R2, R0, L__GetSMSText312
NOP	
J	L_GetSMSText111
NOP	
L__GetSMSText312:
;Sim800.c,735 :: 		is_digit = isdigit(*string[1]);
LBU	R25, Offset(_string+64)(GP)
JAL	_isdigit+0
NOP	
;Sim800.c,737 :: 		if(is_digit == 1){
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__GetSMSText313
NOP	
J	L_GetSMSText112
NOP	
L__GetSMSText313:
;Sim800.c,738 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 16(SP)
;Sim800.c,740 :: 		sprintf(sms,"%d",res);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_62_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_62_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,743 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,742 :: 		" *no of sms's:= %s\r\n"
LUI	R2, hi_addr(?lstr_63_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_63_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,741 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,743 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,745 :: 		ReadMSG(res);
LH	R25, 16(SP)
JAL	_ReadMSG+0
NOP	
;Sim800.c,746 :: 		}else{
J	L_GetSMSText113
NOP	
L_GetSMSText112:
;Sim800.c,747 :: 		SendSMS(5,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 5
JAL	_SendSMS+0
NOP	
;Sim800.c,748 :: 		res = 1;
ORI	R2, R0, 1
SH	R2, 16(SP)
;Sim800.c,749 :: 		}
L_GetSMSText113:
;Sim800.c,750 :: 		return RemoveSMSText(res);
LH	R25, 16(SP)
JAL	_RemoveSMSText+0
NOP	
SEH	R2, R2
J	L_end_GetSMSText
NOP	
;Sim800.c,751 :: 		}
L_GetSMSText111:
;Sim800.c,753 :: 		return -1;
LUI	R2, 65535
ORI	R2, R2, 65535
;Sim800.c,754 :: 		}
;Sim800.c,753 :: 		return -1;
;Sim800.c,754 :: 		}
L_end_GetSMSText:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _GetSMSText
_ReadMSG:
;Sim800.c,760 :: 		char* ReadMSG(int msg_num){
ADDIU	SP, SP, -52
SW	RA, 0(SP)
;Sim800.c,763 :: 		sprintf(sms,"%d",msg_num);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_64_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_64_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,764 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG114:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG114
NOP	
;Sim800.c,768 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,767 :: 		" *num_sms's:= %s\r\n"
LUI	R2, hi_addr(?lstr_65_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_65_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,766 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,768 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,771 :: 		UART2_Write_Text("AT+CMGF=1");
ADDIU	R23, SP, 22
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr66_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr66_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 22
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,772 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,773 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,774 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,775 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,776 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG116:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG116
NOP	
;Sim800.c,779 :: 		UART2_Write_Text("AT+CMGR=");
ADDIU	R23, SP, 32
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr67_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr67_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 32
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,780 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,781 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,782 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,784 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,785 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,786 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG118:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG118
NOP	
;Sim800.c,790 :: 		"************** \r\n");
LUI	R2, hi_addr(?lstr_68_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_68_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,789 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,790 :: 		"************** \r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,793 :: 		for(i = 0;i<strlen(SimTestTxt);i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_ReadMSG120:
; i start address is: 20 (R5)
SH	R25, 16(SP)
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strlen+0
NOP	
LH	R25, 16(SP)
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__ReadMSG315
NOP	
J	L_ReadMSG121
NOP	
L__ReadMSG315:
;Sim800.c,794 :: 		SimTestTxt[i] =  toupper(SimTestTxt[i]);
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SW	R2, 48(SP)
SH	R25, 16(SP)
LBU	R25, 0(R2)
JAL	_toupper+0
NOP	
LH	R25, 16(SP)
LW	R3, 48(SP)
SB	R2, 0(R3)
;Sim800.c,793 :: 		for(i = 0;i<strlen(SimTestTxt);i++){
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 8 (R2)
;Sim800.c,795 :: 		}
SEH	R5, R2
; i end address is: 8 (R2)
J	L_ReadMSG120
NOP	
L_ReadMSG121:
;Sim800.c,797 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 16(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
SH	R2, 18(SP)
;Sim800.c,798 :: 		text = strchr(string[4], '"');
ORI	R26, R0, 34
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strchr+0
NOP	
;Sim800.c,799 :: 		strcpy(string[6], RemoveChars(text,'"','O'));
ORI	R27, R0, 79
ORI	R26, R0, 34
MOVZ	R25, R2, R0
JAL	_RemoveChars+0
NOP	
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strcpy+0
NOP	
;Sim800.c,800 :: 		strcpy(string[3], RemoveChars(string[3],'"',0x0A));
ORI	R27, R0, 10
ORI	R26, R0, 34
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_RemoveChars+0
NOP	
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+192)
ORI	R25, R25, lo_addr(_string+192)
JAL	_strcpy+0
NOP	
;Sim800.c,801 :: 		memset(string[4]+8,0,1);
ORI	R27, R0, 1
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_string+264)
ORI	R25, R25, lo_addr(_string+264)
JAL	_memset+0
NOP	
;Sim800.c,802 :: 		strncpy(string[4],string[4],8);//RemoveChars(string[4],0x02,'+'));
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strncpy+0
NOP	
;Sim800.c,806 :: 		sprintf(sms,"%d",num_strs);
LH	R2, 18(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_69_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_69_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,819 :: 		,string[6]);
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
;Sim800.c,818 :: 		,string[4],string[5]
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,817 :: 		,string[2],string[3]
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,816 :: 		,sms,string[0],string[1]
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 8(SP)
;Sim800.c,815 :: 		" *string[6]  %s\r\n"
LUI	R2, hi_addr(?lstr_70_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_70_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,807 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,819 :: 		,string[6]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 40
LH	R25, 16(SP)
;Sim800.c,821 :: 		if(string[6] != NULL){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
BNE	R3, R2, L__ReadMSG317
NOP	
J	L_ReadMSG123
NOP	
L__ReadMSG317:
;Sim800.c,822 :: 		strcpy(string[6],RemoveWhiteSpace(string[6]));
SH	R25, 16(SP)
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_RemoveWhiteSpace+0
NOP	
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strcpy+0
NOP	
;Sim800.c,823 :: 		res = StrChecker(string[6]);
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_StrChecker+0
NOP	
LH	R25, 16(SP)
SH	R2, 20(SP)
;Sim800.c,826 :: 		if((res == 16) && (strncmp(string[1],SF.SimCelNum,15))){
SEH	R3, R2
ORI	R2, R0, 16
BEQ	R3, R2, L__ReadMSG318
NOP	
J	L__ReadMSG221
NOP	
L__ReadMSG318:
SH	R25, 16(SP)
ORI	R27, R0, 15
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strncmp+0
NOP	
LH	R25, 16(SP)
BNE	R2, R0, L__ReadMSG320
NOP	
J	L__ReadMSG220
NOP	
L__ReadMSG320:
L__ReadMSG219:
;Sim800.c,827 :: 		SendSMS(11,0);
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 11
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,828 :: 		return 255;
ORI	R2, R0, 255
J	L_end_ReadMSG
NOP	
;Sim800.c,826 :: 		if((res == 16) && (strncmp(string[1],SF.SimCelNum,15))){
L__ReadMSG221:
L__ReadMSG220:
;Sim800.c,831 :: 		if(res == 18){
LH	R3, 20(SP)
ORI	R2, R0, 18
BEQ	R3, R2, L__ReadMSG321
NOP	
J	L_ReadMSG127
NOP	
L__ReadMSG321:
;Sim800.c,834 :: 		!strncmp(string[1],SF.SimCelNum,15))){
LBU	R2, Offset(_SimVars+2)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__ReadMSG323
NOP	
J	L__ReadMSG224
NOP	
L__ReadMSG323:
;Sim800.c,833 :: 		(!strncmp(string[1],SF.StartCell,15)||
SH	R25, 16(SP)
ORI	R27, R0, 15
LUI	R26, hi_addr(_SF+38)
ORI	R26, R26, lo_addr(_SF+38)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strncmp+0
NOP	
LH	R25, 16(SP)
;Sim800.c,834 :: 		!strncmp(string[1],SF.SimCelNum,15))){
BNE	R2, R0, L__ReadMSG325
NOP	
J	L__ReadMSG223
NOP	
L__ReadMSG325:
SH	R25, 16(SP)
ORI	R27, R0, 15
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strncmp+0
NOP	
LH	R25, 16(SP)
BNE	R2, R0, L__ReadMSG327
NOP	
J	L__ReadMSG222
NOP	
L__ReadMSG327:
J	L_ReadMSG132
NOP	
L__ReadMSG223:
L__ReadMSG222:
L__ReadMSG217:
;Sim800.c,835 :: 		SimVars.start = 0;
LBU	R2, Offset(_SimVars+2)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_SimVars+2)(GP)
;Sim800.c,841 :: 		,SF.StartCell,string[1]);
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SH	R25, 16(SP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+38)
ORI	R2, R2, lo_addr(_SF+38)
SW	R2, 8(SP)
;Sim800.c,840 :: 		" *string[1]:=      %s\r\n"
LUI	R2, hi_addr(?lstr_71_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_71_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,837 :: 		PrintOut(PrintHandler,       "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,841 :: 		,SF.StartCell,string[1]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LH	R25, 16(SP)
;Sim800.c,843 :: 		goto next; //if cell matches allow to CANCEL
J	___ReadMSG_next
NOP	
;Sim800.c,844 :: 		}else{
L_ReadMSG132:
;Sim800.c,834 :: 		!strncmp(string[1],SF.SimCelNum,15))){
L__ReadMSG224:
;Sim800.c,845 :: 		if(!SimVars.start){
LBU	R2, Offset(_SimVars+2)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__ReadMSG328
NOP	
J	L_ReadMSG134
NOP	
L__ReadMSG328:
;Sim800.c,846 :: 		SendSMS(15,0);
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 15
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,847 :: 		return 15;
ORI	R2, R0, 15
J	L_end_ReadMSG
NOP	
;Sim800.c,848 :: 		}
L_ReadMSG134:
;Sim800.c,850 :: 		SendSMS(13,0);
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 13
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,851 :: 		return 13;
ORI	R2, R0, 13
J	L_end_ReadMSG
NOP	
;Sim800.c,854 :: 		}else if(res == 17 && !SimVars.start){
L_ReadMSG127:
LH	R3, 20(SP)
ORI	R2, R0, 17
BEQ	R3, R2, L__ReadMSG329
NOP	
J	L__ReadMSG226
NOP	
L__ReadMSG329:
LBU	R2, Offset(_SimVars+2)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__ReadMSG330
NOP	
J	L__ReadMSG225
NOP	
L__ReadMSG330:
L__ReadMSG216:
;Sim800.c,855 :: 		strncpy(SF.StartCell,string[1],15);
SH	R25, 16(SP)
ORI	R27, R0, 15
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strncpy+0
NOP	
LH	R25, 16(SP)
;Sim800.c,856 :: 		SimVars.start = 1;
LBU	R2, Offset(_SimVars+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SimVars+2)(GP)
;Sim800.c,857 :: 		}else if(res == 17 && SimVars.start){
J	L_ReadMSG140
NOP	
;Sim800.c,854 :: 		}else if(res == 17 && !SimVars.start){
L__ReadMSG226:
L__ReadMSG225:
;Sim800.c,857 :: 		}else if(res == 17 && SimVars.start){
LH	R3, 20(SP)
ORI	R2, R0, 17
BEQ	R3, R2, L__ReadMSG331
NOP	
J	L__ReadMSG228
NOP	
L__ReadMSG331:
LBU	R2, Offset(_SimVars+2)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__ReadMSG333
NOP	
J	L__ReadMSG227
NOP	
L__ReadMSG333:
L__ReadMSG215:
;Sim800.c,858 :: 		SendSMS(14,0);
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 14
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,859 :: 		return 14;
ORI	R2, R0, 14
J	L_end_ReadMSG
NOP	
;Sim800.c,857 :: 		}else if(res == 17 && SimVars.start){
L__ReadMSG228:
L__ReadMSG227:
;Sim800.c,861 :: 		goto next;
J	___ReadMSG_next
NOP	
L_ReadMSG140:
;Sim800.c,863 :: 		next:
___ReadMSG_next:
;Sim800.c,864 :: 		TestRecievedSMS(res);
SH	R25, 16(SP)
LH	R25, 20(SP)
JAL	_TestRecievedSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,865 :: 		}
L_ReadMSG123:
;Sim800.c,866 :: 		return 0;
MOVZ	R2, R0, R0
;Sim800.c,867 :: 		}
;Sim800.c,866 :: 		return 0;
;Sim800.c,867 :: 		}
L_end_ReadMSG:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 52
JR	RA
NOP	
; end of _ReadMSG
_TestRecievedSMS:
;Sim800.c,872 :: 		void TestRecievedSMS(int res){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Sim800.c,877 :: 		sprintf(B,"%d",res);
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R3, SP, 14
SH	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_72_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_72_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,880 :: 		,B);
ADDIU	R2, SP, 14
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,879 :: 		" *Str check result:= %s\r\n"
LUI	R2, hi_addr(?lstr_73_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_73_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,878 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,880 :: 		,B);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 12(SP)
;Sim800.c,883 :: 		switch(res){
J	L_TestRecievedSMS145
NOP	
;Sim800.c,884 :: 		case 6:
L_TestRecievedSMS147:
;Sim800.c,885 :: 		SendSMS(7,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 7
JAL	_SendSMS+0
NOP	
;Sim800.c,886 :: 		break;
J	L_TestRecievedSMS146
NOP	
;Sim800.c,887 :: 		case 7: //R
L_TestRecievedSMS148:
;Sim800.c,888 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,889 :: 		break;
J	L_TestRecievedSMS146
NOP	
;Sim800.c,890 :: 		case 8: //G
L_TestRecievedSMS149:
;Sim800.c,891 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,892 :: 		break;
J	L_TestRecievedSMS146
NOP	
;Sim800.c,893 :: 		case 9: //B
L_TestRecievedSMS150:
;Sim800.c,894 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,895 :: 		break;
J	L_TestRecievedSMS146
NOP	
;Sim800.c,896 :: 		case 10: //C
L_TestRecievedSMS151:
;Sim800.c,897 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,898 :: 		break;
J	L_TestRecievedSMS146
NOP	
;Sim800.c,899 :: 		case 13:
L_TestRecievedSMS152:
;Sim800.c,900 :: 		SendSMS(8,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 8
JAL	_SendSMS+0
NOP	
;Sim800.c,901 :: 		break;
J	L_TestRecievedSMS146
NOP	
;Sim800.c,902 :: 		case 14:
L_TestRecievedSMS153:
;Sim800.c,903 :: 		SendSMS(6,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 6
JAL	_SendSMS+0
NOP	
;Sim800.c,904 :: 		break;
J	L_TestRecievedSMS146
NOP	
;Sim800.c,905 :: 		case 15: //write,
L_TestRecievedSMS154:
;Sim800.c,906 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,907 :: 		break;
J	L_TestRecievedSMS146
NOP	
;Sim800.c,908 :: 		case 16:
L_TestRecievedSMS155:
;Sim800.c,909 :: 		GetValuesFromFlash();
JAL	_GetValuesFromFlash+0
NOP	
;Sim800.c,910 :: 		NVMErasePage(FLASH_Settings_PAddr);
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
;Sim800.c,911 :: 		if(string[5] != NULL){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__TestRecievedSMS336
NOP	
J	L_TestRecievedSMS156
NOP	
L__TestRecievedSMS336:
;Sim800.c,912 :: 		strcpy(B,string[5]);
ADDIU	R2, SP, 14
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;Sim800.c,913 :: 		Threshold.time_to_log = atoi(B);
ADDIU	R2, SP, 14
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, Offset(_Threshold+8)(GP)
;Sim800.c,914 :: 		Threshold.time_to_log -= 1;
ADDIU	R2, R2, -1
SH	R2, Offset(_Threshold+8)(GP)
;Sim800.c,915 :: 		}
L_TestRecievedSMS156:
;Sim800.c,916 :: 		WriteToFlashTemp();
JAL	_WriteToFlashTemp+0
NOP	
;Sim800.c,917 :: 		t =  Write_Thresholds(0);
MOVZ	R25, R0, R0
JAL	_Write_Thresholds+0
NOP	
;Sim800.c,922 :: 		,t);
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,921 :: 		" *CRGB:= %s\r\n"
LUI	R2, hi_addr(?lstr_74_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_74_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,920 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,922 :: 		,t);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,924 :: 		SendSMS(6,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 6
JAL	_SendSMS+0
NOP	
;Sim800.c,925 :: 		break;
J	L_TestRecievedSMS146
NOP	
;Sim800.c,926 :: 		case 17:
L_TestRecievedSMS157:
;Sim800.c,927 :: 		SimVars.init_inc = 5;  //Test started
ORI	R2, R0, 5
SB	R2, Offset(_SimVars+1)(GP)
;Sim800.c,928 :: 		T0_SP.sec = T0_SP.min = T0_SP.hr = 0;
SH	R0, Offset(_T0_SP+6)(GP)
SH	R0, Offset(_T0_SP+4)(GP)
SH	R0, Offset(_T0_SP+2)(GP)
;Sim800.c,929 :: 		SendSMS(9,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 9
JAL	_SendSMS+0
NOP	
;Sim800.c,930 :: 		break;
J	L_TestRecievedSMS146
NOP	
;Sim800.c,931 :: 		case 18:
L_TestRecievedSMS158:
;Sim800.c,932 :: 		SimVars.init_inc = 3;  //Test Stopped
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
;Sim800.c,933 :: 		SendSMS(10,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 10
JAL	_SendSMS+0
NOP	
;Sim800.c,934 :: 		break;
J	L_TestRecievedSMS146
NOP	
;Sim800.c,935 :: 		case 20:
L_TestRecievedSMS159:
;Sim800.c,936 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,937 :: 		break;
J	L_TestRecievedSMS146
NOP	
;Sim800.c,938 :: 		default:
L_TestRecievedSMS160:
;Sim800.c,939 :: 		break;
J	L_TestRecievedSMS146
NOP	
;Sim800.c,940 :: 		}
L_TestRecievedSMS145:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__TestRecievedSMS338
NOP	
J	L_TestRecievedSMS147
NOP	
L__TestRecievedSMS338:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__TestRecievedSMS340
NOP	
J	L_TestRecievedSMS148
NOP	
L__TestRecievedSMS340:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__TestRecievedSMS342
NOP	
J	L_TestRecievedSMS149
NOP	
L__TestRecievedSMS342:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__TestRecievedSMS344
NOP	
J	L_TestRecievedSMS150
NOP	
L__TestRecievedSMS344:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__TestRecievedSMS346
NOP	
J	L_TestRecievedSMS151
NOP	
L__TestRecievedSMS346:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__TestRecievedSMS348
NOP	
J	L_TestRecievedSMS152
NOP	
L__TestRecievedSMS348:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__TestRecievedSMS350
NOP	
J	L_TestRecievedSMS153
NOP	
L__TestRecievedSMS350:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__TestRecievedSMS352
NOP	
J	L_TestRecievedSMS154
NOP	
L__TestRecievedSMS352:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__TestRecievedSMS354
NOP	
J	L_TestRecievedSMS155
NOP	
L__TestRecievedSMS354:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__TestRecievedSMS356
NOP	
J	L_TestRecievedSMS157
NOP	
L__TestRecievedSMS356:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__TestRecievedSMS358
NOP	
J	L_TestRecievedSMS158
NOP	
L__TestRecievedSMS358:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__TestRecievedSMS360
NOP	
J	L_TestRecievedSMS159
NOP	
L__TestRecievedSMS360:
J	L_TestRecievedSMS160
NOP	
L_TestRecievedSMS146:
;Sim800.c,942 :: 		}
L_end_TestRecievedSMS:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _TestRecievedSMS
_RemoveSMSText:
;Sim800.c,948 :: 		int RemoveSMSText(int sms_cnt){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,951 :: 		sprintf(sms,"%d",sms_cnt);
SH	R25, 4(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_75_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_75_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,954 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,953 :: 		" *num_strs:= %s\r\n"
LUI	R2, hi_addr(?lstr_76_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_76_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,952 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,954 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 4(SP)
;Sim800.c,956 :: 		do{
L_RemoveSMSText161:
;Sim800.c,957 :: 		sprintf(sms,"%d",sms_cnt);
SH	R25, 4(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_77_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_77_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,958 :: 		UART2_Write_Text("AT+CMGD=");
ADDIU	R23, SP, 6
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr78_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr78_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,959 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,960 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,961 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,964 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LH	R25, 4(SP)
;Sim800.c,965 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_RemoveSMSText164:
ADDIU	R24, R24, -1
BNE	R24, R0, L_RemoveSMSText164
NOP	
;Sim800.c,966 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,967 :: 		sms_cnt--;
ADDIU	R2, R25, -1
SEH	R25, R2
;Sim800.c,968 :: 		}while(sms_cnt > 0);
SEH	R2, R2
SLTI	R2, R2, 1
BNE	R2, R0, L__RemoveSMSText362
NOP	
J	L_RemoveSMSText161
NOP	
L__RemoveSMSText362:
;Sim800.c,970 :: 		return sms_cnt;
SEH	R2, R25
;Sim800.c,971 :: 		}
L_end_RemoveSMSText:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _RemoveSMSText
_Test_Update_ThingSpeak:
;Sim800.c,977 :: 		int Test_Update_ThingSpeak(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,979 :: 		TCS3472_getRawData(RawData);
SW	R25, 4(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,980 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,981 :: 		return 2;
ORI	R2, R0, 2
;Sim800.c,982 :: 		}
;Sim800.c,981 :: 		return 2;
;Sim800.c,982 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,987 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -208
SW	RA, 0(SP)
;Sim800.c,991 :: 		str = (char*)Malloc(200*sizeof(char*));
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R25, 12(SP)
ORI	R25, R0, 800
JAL	_Malloc+0
NOP	
LW	R25, 12(SP)
SW	R2, 16(SP)
;Sim800.c,993 :: 		sprintf(txtC,"%u",rgbc[0]);
LHU	R2, 0(R25)
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_79_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_79_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtC+0)
ORI	R2, R2, lo_addr(_txtC+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,994 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_80_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_80_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR+0)
ORI	R2, R2, lo_addr(_txtR+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,995 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_81_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_81_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtG+0)
ORI	R2, R2, lo_addr(_txtG+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,996 :: 		sprintf(txtB,"%u",rgbc[3]);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_82_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_82_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtB+0)
ORI	R2, R2, lo_addr(_txtB+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,999 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 20
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr83_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr83_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1000 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1001 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1002 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1003 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData166:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData166
NOP	
NOP	
NOP	
;Sim800.c,1007 :: 		str[0]  = 0;
LW	R2, 16(SP)
SB	R0, 0(R2)
;Sim800.c,1009 :: 		strcat(str,str_api);
LUI	R26, hi_addr(_str_api+0)
ORI	R26, R26, lo_addr(_str_api+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,1010 :: 		strcat(str,SF.WriteAPIKey);
LUI	R26, hi_addr(_SF+58)
ORI	R26, R26, lo_addr(_SF+58)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,1011 :: 		strcat(str,field1);
LUI	R26, hi_addr(_field1+0)
ORI	R26, R26, lo_addr(_field1+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,1012 :: 		strcat(str,txtC);
LUI	R26, hi_addr(_txtC+0)
ORI	R26, R26, lo_addr(_txtC+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,1013 :: 		strcat(str,field2);
LUI	R26, hi_addr(_field2+0)
ORI	R26, R26, lo_addr(_field2+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,1014 :: 		strcat(str,txtR);
LUI	R26, hi_addr(_txtR+0)
ORI	R26, R26, lo_addr(_txtR+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,1015 :: 		strcat(str,field3);
LUI	R26, hi_addr(_field3+0)
ORI	R26, R26, lo_addr(_field3+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,1016 :: 		strcat(str,txtG);
LUI	R26, hi_addr(_txtG+0)
ORI	R26, R26, lo_addr(_txtG+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,1017 :: 		strcat(str,field4);
LUI	R26, hi_addr(_field4+0)
ORI	R26, R26, lo_addr(_field4+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,1018 :: 		strcat(str,txtB);
LUI	R26, hi_addr(_txtB+0)
ORI	R26, R26, lo_addr(_txtB+0)
LW	R25, 16(SP)
JAL	_strcat+0
NOP	
;Sim800.c,1021 :: 		UART2_Write_Text("AT+CPIN?");
ADDIU	R23, SP, 31
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr84_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr84_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 31
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1022 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1023 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1024 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1025 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData168:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData168
NOP	
NOP	
NOP	
;Sim800.c,1026 :: 		UART2_Write_Text("AT+CREG?");
ADDIU	R23, SP, 40
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr85_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr85_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 40
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1027 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1028 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1029 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1030 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData170:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData170
NOP	
NOP	
NOP	
;Sim800.c,1031 :: 		UART2_Write_Text("AT+CGATT?");
ADDIU	R23, SP, 49
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr86_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr86_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 49
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1032 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1033 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1034 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1035 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData172:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData172
NOP	
NOP	
NOP	
;Sim800.c,1036 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 59
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr87_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr87_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 59
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1037 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1038 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1039 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1040 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData174:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData174
NOP	
NOP	
NOP	
;Sim800.c,1041 :: 		UART2_Write_Text("AT+CIPSTATUS");
ADDIU	R23, SP, 70
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr88_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr88_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 70
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1042 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1043 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1044 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1045 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData176:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData176
NOP	
NOP	
NOP	
;Sim800.c,1046 :: 		UART2_Write_Text("AT+CIPMUX=0");
ADDIU	R23, SP, 83
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr89_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr89_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 83
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1047 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1048 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1049 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1050 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData178:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData178
NOP	
NOP	
NOP	
;Sim800.c,1051 :: 		UART2_Write_Text("AT+CSTT=");//\"data.uk\",\"user\",\"one2one\"");
ADDIU	R23, SP, 95
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr90_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr90_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 95
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1052 :: 		UART2_Write_Text(SF.APN);
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1053 :: 		UART2_Write_Text(",\"user\",");
ADDIU	R23, SP, 104
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr91_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr91_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 104
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1054 :: 		UART2_Write_Text(SF.PWD);
LUI	R25, hi_addr(_SF+118)
ORI	R25, R25, lo_addr(_SF+118)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1055 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1056 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1057 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1058 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData180:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData180
NOP	
NOP	
NOP	
;Sim800.c,1059 :: 		UART2_Write_Text("AT+CIICR");
ADDIU	R23, SP, 113
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr92_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr92_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 113
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1060 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1061 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1062 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1063 :: 		UART2_Write_Text("AT+CIFSR");
ADDIU	R23, SP, 122
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr93_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr93_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 122
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1064 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1065 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1066 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData182:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData182
NOP	
;Sim800.c,1067 :: 		UART2_Write_Text("AT+CIPSPRT=1");
ADDIU	R23, SP, 131
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr94_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr94_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 131
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1068 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1069 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1070 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1071 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData184:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData184
NOP	
NOP	
NOP	
;Sim800.c,1072 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
ADDIU	R23, SP, 144
ADDIU	R22, R23, 42
LUI	R24, hi_addr(?ICS?lstr95_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr95_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 144
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1073 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1074 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1075 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1076 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData186:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData186
NOP	
;Sim800.c,1077 :: 		UART2_Write_Text("AT+CIPSEND");
ADDIU	R23, SP, 186
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr96_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr96_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 186
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1078 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1079 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1080 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData188:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData188
NOP	
;Sim800.c,1081 :: 		UART2_Write_Text(str);
LW	R25, 16(SP)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1082 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1083 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1084 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1085 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1086 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,1087 :: 		TestForOK(1);
ORI	R25, R0, 1
JAL	_TestForOK+0
NOP	
;Sim800.c,1088 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData190:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData190
NOP	
NOP	
NOP	
;Sim800.c,1089 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 197
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr97_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr97_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 197
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1090 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1091 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1092 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1093 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData192:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData192
NOP	
NOP	
NOP	
;Sim800.c,1095 :: 		Free(str,200*sizeof(char*));
ORI	R26, R0, 800
LW	R25, 16(SP)
JAL	_Free+0
NOP	
;Sim800.c,1096 :: 		}
L_end_SendData:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 208
JR	RA
NOP	
; end of _SendData
_TestForOK:
;Sim800.c,1102 :: 		void TestForOK(char c){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,1104 :: 		WaitForResponse(1);
SW	R26, 4(SP)
SB	R25, 8(SP)
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,1105 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_TestForOK194:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TestForOK194
NOP	
;Sim800.c,1106 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,1110 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SB	R25, 8(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,1109 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_98_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_98_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,1108 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1110 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LBU	R25, 8(SP)
;Sim800.c,1112 :: 		lastMillis = TMR0.millis;
; lastMillis start address is: 16 (R4)
LW	R4, Offset(_TMR0+0)(GP)
;Sim800.c,1113 :: 		if(c == 0)
ANDI	R2, R25, 255
BEQ	R2, R0, L__TestForOK366
NOP	
J	L_TestForOK196
NOP	
L__TestForOK366:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
;Sim800.c,1114 :: 		while(!strstr(SimTestTxt, "OK")){
L_TestForOK197:
; lastMillis start address is: 20 (R5)
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
ORI	R30, R0, 79
SB	R30, 9(SP)
ORI	R30, R0, 75
SB	R30, 10(SP)
MOVZ	R30, R0, R0
SB	R30, 11(SP)
ADDIU	R2, SP, 9
SB	R25, 8(SP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strstr+0
NOP	
LBU	R25, 8(SP)
BEQ	R2, R0, L__TestForOK367
NOP	
J	L_TestForOK198
NOP	
L__TestForOK367:
; lastMillis end address is: 20 (R5)
;Sim800.c,1115 :: 		newMillis = TMR0.millis - lastMillis;
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,1116 :: 		if(newMillis > 5000)
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK368
NOP	
J	L_TestForOK199
NOP	
L__TestForOK368:
; lastMillis end address is: 20 (R5)
;Sim800.c,1117 :: 		break;
J	L_TestForOK198
NOP	
L_TestForOK199:
;Sim800.c,1118 :: 		}
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK197
NOP	
L_TestForOK198:
J	L_TestForOK200
NOP	
L_TestForOK196:
;Sim800.c,1119 :: 		else if(c == 1)
; lastMillis start address is: 16 (R4)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__TestForOK369
NOP	
J	L_TestForOK201
NOP	
L__TestForOK369:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
;Sim800.c,1120 :: 		while(!strstr(SimTestTxt, "CONNECT")){
L_TestForOK202:
; lastMillis start address is: 20 (R5)
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
ADDIU	R23, SP, 12
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr100_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr100_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 12
SB	R25, 8(SP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strstr+0
NOP	
LBU	R25, 8(SP)
BEQ	R2, R0, L__TestForOK370
NOP	
J	L_TestForOK203
NOP	
L__TestForOK370:
; lastMillis end address is: 20 (R5)
;Sim800.c,1121 :: 		newMillis = TMR0.millis - lastMillis;
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,1122 :: 		if(newMillis > 5000)
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK371
NOP	
J	L_TestForOK204
NOP	
L__TestForOK371:
; lastMillis end address is: 20 (R5)
;Sim800.c,1123 :: 		break;
J	L_TestForOK203
NOP	
L_TestForOK204:
;Sim800.c,1124 :: 		}
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK202
NOP	
L_TestForOK203:
L_TestForOK201:
L_TestForOK200:
;Sim800.c,1125 :: 		}
L_end_TestForOK:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _TestForOK
