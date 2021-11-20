_InitGSM3:
;Sim800.c,105 :: 		void InitGSM3(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,106 :: 		SimVars.initial_str = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R0, Offset(_SimVars+0)(GP)
;Sim800.c,107 :: 		SimVars.init_inc    = 0;
SB	R0, Offset(_SimVars+1)(GP)
;Sim800.c,108 :: 		*SimTestTxt = "Hello World this is a test";
ORI	R2, R0, lo_addr(?lstr_1_Sim800+0)
ANDI	R2, R2, 255
SB	R2, Offset(_SimTestTxt+0)(GP)
;Sim800.c,109 :: 		RB.head = 0;
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,110 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
;Sim800.c,111 :: 		RB.rcv_txt_fin = -1;
ORI	R2, R0, 255
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,112 :: 		memset(SF.SimCelNum,0,sizeof(SF.SimCelNum));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_memset+0
NOP	
;Sim800.c,113 :: 		memset(SF.StartCell,0,sizeof(SF.StartCell));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_memset+0
NOP	
;Sim800.c,114 :: 		memset(SF.WriteAPIKey,0,sizeof(SF.WriteAPIKey));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_memset+0
NOP	
;Sim800.c,115 :: 		memset(SF.ReadAPIKey,0,sizeof(SF.ReadAPIKey));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_memset+0
NOP	
;Sim800.c,116 :: 		memset(SF.APN,0,sizeof(SF.APN));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_memset+0
NOP	
;Sim800.c,117 :: 		memset(SF.PWD,0,sizeof(SF.PWD));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+118)
ORI	R25, R25, lo_addr(_SF+118)
JAL	_memset+0
NOP	
;Sim800.c,118 :: 		}
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
;Sim800.c,123 :: 		void PwrUpGSM3(){
;Sim800.c,124 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,125 :: 		PWR = 0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,126 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM30
NOP	
;Sim800.c,127 :: 		PWR = 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,129 :: 		while(STAT){
L_PwrUpGSM32:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrUpGSM3262
NOP	
J	L_PwrUpGSM33
NOP	
L__PwrUpGSM3262:
;Sim800.c,130 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,131 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM34
NOP	
;Sim800.c,132 :: 		}
J	L_PwrUpGSM32
NOP	
L_PwrUpGSM33:
;Sim800.c,133 :: 		LATE3_bit = 0;
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
;Sim800.c,134 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM36
NOP	
NOP	
NOP	
;Sim800.c,135 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_WriteToFlashTemp:
;Sim800.c,140 :: 		void WriteToFlashTemp(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,144 :: 		GetStrLengths();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_GetStrLengths+0
NOP	
;Sim800.c,146 :: 		memset(buff,0,512);                  //make every byte NULL
ORI	R27, R0, 512
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_buff+0)
ORI	R25, R25, lo_addr(_buff+0)
JAL	_memset+0
NOP	
;Sim800.c,147 :: 		memcpy(buff,SF.SimCelNum,SL.l1);          //Save Cell num
LH	R27, Offset(_SL+0)(GP)
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
LUI	R25, hi_addr(_buff+0)
ORI	R25, R25, lo_addr(_buff+0)
JAL	_memcpy+0
NOP	
;Sim800.c,148 :: 		memcpy(buff+SL.l1,SF.WriteAPIKey,SL.l2);//Save API Wr Key
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
;Sim800.c,149 :: 		memcpy(buff+SL.l1l2,SF.ReadAPIKey,SL.l3); //Save API Rd Key
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
;Sim800.c,150 :: 		memcpy(buff+SL.l1l2l3,SF.APN,SL.l4);        //Save APN
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
;Sim800.c,151 :: 		memcpy(buff+SL.l1l2l3l4,SF.PWD,SL.l5);        //Save PWD
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
;Sim800.c,153 :: 		memcpy(temp,buff,SL.lTotA+4);
LH	R2, Offset(_SL+14)(GP)
ADDIU	R2, R2, 4
SEH	R27, R2
LUI	R26, hi_addr(_buff+0)
ORI	R26, R26, lo_addr(_buff+0)
LUI	R25, hi_addr(_temp+0)
ORI	R25, R25, lo_addr(_temp+0)
JAL	_memcpy+0
NOP	
;Sim800.c,155 :: 		pos = FLASH_Settings_PAddr;
; pos start address is: 12 (R3)
LW	R3, Offset(_FLASH_Settings_PAddr+0)(GP)
;Sim800.c,156 :: 		j = NVMErasePage(pos);
SW	R3, 16(SP)
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R3, 16(SP)
SH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
;Sim800.c,157 :: 		if(j==0){
SEH	R2, R2
BEQ	R2, R0, L__WriteToFlashTemp264
NOP	
J	L_WriteToFlashTemp8
NOP	
L__WriteToFlashTemp264:
;Sim800.c,158 :: 		pos += 20 ;
ADDIU	R2, R3, 20
; pos end address is: 12 (R3)
; pos start address is: 16 (R4)
MOVZ	R4, R2, R0
;Sim800.c,159 :: 		for(i=0;i<100;i++){
SH	R0, Offset(WriteToFlashTemp_i_L0+0)(GP)
; pos end address is: 16 (R4)
L_WriteToFlashTemp9:
; pos start address is: 16 (R4)
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLTI	R2, R2, 100
BNE	R2, R0, L__WriteToFlashTemp265
NOP	
J	L_WriteToFlashTemp10
NOP	
L__WriteToFlashTemp265:
;Sim800.c,160 :: 		j = NVMWriteWord(pos,temp[i]);
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
;Sim800.c,161 :: 		pos += 4;
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
;Sim800.c,162 :: 		Delay_ms(5);
LUI	R24, 2
ORI	R24, R24, 2260
L_WriteToFlashTemp12:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WriteToFlashTemp12
NOP	
NOP	
NOP	
;Sim800.c,159 :: 		for(i=0;i<100;i++){
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
;Sim800.c,163 :: 		}
; pos end address is: 16 (R4)
J	L_WriteToFlashTemp9
NOP	
L_WriteToFlashTemp10:
;Sim800.c,164 :: 		}
L_WriteToFlashTemp8:
;Sim800.c,168 :: 		sprintf(a,"%d",i);
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
;Sim800.c,169 :: 		sprintf(b,"%d",j);
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
;Sim800.c,173 :: 		,a,b);
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 8(SP)
;Sim800.c,172 :: 		" * flash err:   %s\r\n"
LUI	R2, hi_addr(?lstr_4_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_4_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,170 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,173 :: 		,a,b);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
;Sim800.c,175 :: 		}
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
;Sim800.c,180 :: 		char* GetValuesFromFlash(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,183 :: 		GetStrLengths();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_GetStrLengths+0
NOP	
;Sim800.c,185 :: 		ptr += 20;
LW	R2, Offset(_FLASH_Settings_VAddr+0)(GP)
ADDIU	R2, R2, 20
; ptr start address is: 16 (R4)
MOVZ	R4, R2, R0
;Sim800.c,187 :: 		for(i=0;i<SL.lTotA;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_GetValuesFromFlash14:
; i start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
LH	R2, Offset(_SL+14)(GP)
SLTU	R2, R5, R2
BNE	R2, R0, L__GetValuesFromFlash267
NOP	
J	L_GetValuesFromFlash15
NOP	
L__GetValuesFromFlash267:
; ptr end address is: 16 (R4)
;Sim800.c,188 :: 		buff[i] = ptr[i];
; ptr start address is: 16 (R4)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R3, R2, R5
ADDU	R2, R4, R5
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Sim800.c,190 :: 		UART1_Write(buff[i]);
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R5
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,191 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
;Sim800.c,187 :: 		for(i=0;i<SL.lTotA;i++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Sim800.c,193 :: 		}
; ptr end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_GetValuesFromFlash14
NOP	
L_GetValuesFromFlash15:
;Sim800.c,194 :: 		strncpy(SF.SimCelNum,buff,SL.l1);
LH	R27, Offset(_SL+0)(GP)
LUI	R26, hi_addr(_buff+0)
ORI	R26, R26, lo_addr(_buff+0)
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_strncpy+0
NOP	
;Sim800.c,195 :: 		strncpy(SF.WriteAPIKey,buff+SL.l1,SL.l2);
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
;Sim800.c,196 :: 		strncpy(SF.ReadAPIKey,buff+SL.l1l2,SL.l3);
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
;Sim800.c,197 :: 		strncpy(SF.APN,buff+SL.l1l2l3,SL.l4);
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
;Sim800.c,198 :: 		strncpy(SF.PWD,buff+SL.l1l2l3l4,SL.l5);
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
;Sim800.c,207 :: 		,SF.ReadAPIKey,SF.APN,SF.PWD);
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
;Sim800.c,206 :: 		,SF.SimCelNum,SF.WriteAPIKey
LUI	R2, hi_addr(_SF+58)
ORI	R2, R2, lo_addr(_SF+58)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
SW	R2, 8(SP)
;Sim800.c,205 :: 		" * SF.PWD:         %s\r\n"
LUI	R2, hi_addr(?lstr_5_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_5_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,200 :: 		PrintOut(PrintHandler, " * Flash Read        \r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,207 :: 		,SF.ReadAPIKey,SF.APN,SF.PWD);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 28
;Sim800.c,209 :: 		return SF.SimCelNum;
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
;Sim800.c,210 :: 		}
;Sim800.c,209 :: 		return SF.SimCelNum;
;Sim800.c,210 :: 		}
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
;Sim800.c,215 :: 		void GetStrLengths(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,217 :: 		SL.l1 = sizeof(SF.SimCelNum)-1;   //len of cell num
ORI	R2, R0, 19
SH	R2, Offset(_SL+0)(GP)
;Sim800.c,218 :: 		SL.l2 = sizeof(SF.WriteAPIKey)-1; //len of API Write key
ORI	R2, R0, 19
SH	R2, Offset(_SL+2)(GP)
;Sim800.c,219 :: 		SL.l3 = sizeof(SF.ReadAPIKey)-1;  //len of API Read Key
ORI	R2, R0, 19
SH	R2, Offset(_SL+4)(GP)
;Sim800.c,220 :: 		SL.l4 = sizeof(SF.APN)-1;         //len of APN
ORI	R2, R0, 19
SH	R2, Offset(_SL+6)(GP)
;Sim800.c,221 :: 		SL.l5 = sizeof(SF.PWD)-1;         //len of PWD
ORI	R2, R0, 19
SH	R2, Offset(_SL+8)(GP)
;Sim800.c,224 :: 		SL.lTotA     = SL.l1 + SL.l2 + SL.l3 + SL.l4 + SL.l5;
ORI	R2, R0, 95
SH	R2, Offset(_SL+14)(GP)
;Sim800.c,225 :: 		SL.l1l2      = SL.l1 + SL.l2;
ORI	R2, R0, 38
SH	R2, Offset(_SL+18)(GP)
;Sim800.c,226 :: 		SL.l1l2l3    = SL.l1l2 + SL.l3;
ORI	R2, R0, 57
SH	R2, Offset(_SL+20)(GP)
;Sim800.c,227 :: 		SL.l1l2l3l4  = SL.l1l2l3 + SL.l4;
ORI	R2, R0, 76
SH	R2, Offset(_SL+22)(GP)
;Sim800.c,229 :: 		SL.mod = SL.lTotA % 4;  //total divisable by 4 = flash Wrd size
ORI	R2, R0, 3
SH	R2, Offset(_SL+16)(GP)
;Sim800.c,230 :: 		SL.mod = 4 - SL.mod;
ORI	R2, R0, 1
SH	R2, Offset(_SL+16)(GP)
;Sim800.c,231 :: 		SL.lTotA += SL.mod;
ORI	R2, R0, 96
SH	R2, Offset(_SL+14)(GP)
;Sim800.c,234 :: 		sprintf(a,"%d",SL.l1);
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
;Sim800.c,235 :: 		sprintf(b,"%d",SL.l2);
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
;Sim800.c,236 :: 		sprintf(c,"%d",SL.l3);
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
;Sim800.c,237 :: 		sprintf(d,"%d",SL.l4);
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
;Sim800.c,238 :: 		sprintf(e,"%d",SL.l5);
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
;Sim800.c,239 :: 		sprintf(f,"%d",SL.lTotA);
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
;Sim800.c,247 :: 		,a,b,c,d,e,f);
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
;Sim800.c,246 :: 		" * lTotA: %s\r\n"
LUI	R2, hi_addr(?lstr_12_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_12_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,240 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,247 :: 		,a,b,c,d,e,f);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,249 :: 		}
L_end_GetStrLengths:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _GetStrLengths
_RcvSimTxt:
;Sim800.c,254 :: 		void RcvSimTxt(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,256 :: 		while(UART2_Data_Ready()) {     // If data is received
L_RcvSimTxt17:
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__RcvSimTxt271
NOP	
J	L_RcvSimTxt18
NOP	
L__RcvSimTxt271:
;Sim800.c,257 :: 		if (U2STAbits.FERR || U2STAbits.OERR){
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__RcvSimTxt272
NOP	
J	L__RcvSimTxt234
NOP	
L__RcvSimTxt272:
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__RcvSimTxt273
NOP	
J	L__RcvSimTxt233
NOP	
L__RcvSimTxt273:
J	L_RcvSimTxt21
NOP	
L__RcvSimTxt234:
L__RcvSimTxt233:
;Sim800.c,258 :: 		if (U2STAbits.FERR ){
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BNE	R2, R0, L__RcvSimTxt275
NOP	
J	L_RcvSimTxt22
NOP	
L__RcvSimTxt275:
;Sim800.c,259 :: 		U2STAbits.FERR = 0;
ORI	R2, R0, 4
SW	R2, Offset(U2STAbits+4)(GP)
;Sim800.c,260 :: 		goto m0;
J	___RcvSimTxt_m0
NOP	
;Sim800.c,261 :: 		}
L_RcvSimTxt22:
;Sim800.c,262 :: 		if(U2STAbits.OERR)
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__RcvSimTxt277
NOP	
J	L_RcvSimTxt23
NOP	
L__RcvSimTxt277:
;Sim800.c,263 :: 		U2STAbits.OERR = 0;
ORI	R2, R0, 2
SW	R2, Offset(U2STAbits+4)(GP)
L_RcvSimTxt23:
;Sim800.c,264 :: 		}
L_RcvSimTxt21:
;Sim800.c,265 :: 		m0:
___RcvSimTxt_m0:
;Sim800.c,266 :: 		txt = U2RXREG;
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Sim800.c,267 :: 		U1TXREG = txt;
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,268 :: 		if(txt >= 0x20){
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt278
NOP	
J	L_RcvSimTxt24
NOP	
L__RcvSimTxt278:
;Sim800.c,269 :: 		RB.buff[RB.head] = txt;
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
SB	R4, 0(R2)
; txt end address is: 16 (R4)
;Sim800.c,270 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,271 :: 		}else if(U2RXREG == 0x0A){
J	L_RcvSimTxt25
NOP	
L_RcvSimTxt24:
LW	R3, Offset(U2RXREG+0)(GP)
ORI	R2, R0, 10
BEQ	R3, R2, L__RcvSimTxt279
NOP	
J	L_RcvSimTxt26
NOP	
L__RcvSimTxt279:
;Sim800.c,272 :: 		RB.buff[RB.head] = ',';
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
ORI	R2, R0, 44
SB	R2, 0(R3)
;Sim800.c,273 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,274 :: 		}
L_RcvSimTxt26:
L_RcvSimTxt25:
;Sim800.c,275 :: 		if(RB.head > 999){
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RcvSimTxt280
NOP	
J	L_RcvSimTxt27
NOP	
L__RcvSimTxt280:
;Sim800.c,276 :: 		RB.head = 0;             //reset head when buffer is full
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,277 :: 		}
L_RcvSimTxt27:
;Sim800.c,278 :: 		}
J	L_RcvSimTxt17
NOP	
L_RcvSimTxt18:
;Sim800.c,279 :: 		RB.rcv_txt_fin = 1;
ORI	R2, R0, 1
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,280 :: 		}
L_end_RcvSimTxt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RcvSimTxt
_TestRingPointers:
;Sim800.c,285 :: 		int TestRingPointers(){
;Sim800.c,287 :: 		if(RB.tail > RB.head){
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__TestRingPointers282
NOP	
J	L_TestRingPointers28
NOP	
L__TestRingPointers282:
;Sim800.c,288 :: 		diff = 1000 - RB.tail;
LHU	R3, Offset(_RB+1004)(GP)
ORI	R2, R0, 1000
SUBU	R3, R2, R3
;Sim800.c,289 :: 		diff += RB.head;
LHU	R2, Offset(_RB+1002)(GP)
ADDU	R2, R3, R2
; diff start address is: 8 (R2)
;Sim800.c,290 :: 		}else{
; diff end address is: 8 (R2)
J	L_TestRingPointers29
NOP	
L_TestRingPointers28:
;Sim800.c,291 :: 		diff = RB.head - RB.tail;
LHU	R3, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SUBU	R2, R2, R3
; diff start address is: 12 (R3)
ANDI	R3, R2, 65535
; diff end address is: 12 (R3)
SEH	R2, R3
;Sim800.c,292 :: 		}
L_TestRingPointers29:
;Sim800.c,293 :: 		return diff;
; diff start address is: 8 (R2)
; diff end address is: 8 (R2)
;Sim800.c,294 :: 		}
L_end_TestRingPointers:
JR	RA
NOP	
; end of _TestRingPointers
_WaitForResponse:
;Sim800.c,299 :: 		void WaitForResponse(short dly){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,301 :: 		lastMillis = TMR0.millis;
; lastMillis start address is: 20 (R5)
LW	R5, Offset(_TMR0+0)(GP)
;Sim800.c,302 :: 		RB.rcv_txt_fin   = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,303 :: 		RB.last_head     = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,304 :: 		do{
J	L_WaitForResponse30
NOP	
L__WaitForResponse235:
;Sim800.c,323 :: 		}while(!RB.rcv_txt_fin);
;Sim800.c,304 :: 		do{
L_WaitForResponse30:
;Sim800.c,305 :: 		LATE3_bit = !LATE3_bit;
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,306 :: 		if(dly == 0)
SEB	R2, R25
BEQ	R2, R0, L__WaitForResponse284
NOP	
J	L_WaitForResponse33
NOP	
L__WaitForResponse284:
; lastMillis end address is: 20 (R5)
;Sim800.c,307 :: 		Delay_ms(100);
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
;Sim800.c,308 :: 		else if(dly == 1)
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForResponse285
NOP	
J	L_WaitForResponse37
NOP	
L__WaitForResponse285:
;Sim800.c,309 :: 		Delay_ms(500);
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
;Sim800.c,310 :: 		else if(dly == 3){
SEB	R3, R25
ORI	R2, R0, 3
BEQ	R3, R2, L__WaitForResponse286
NOP	
J	L_WaitForResponse41
NOP	
L__WaitForResponse286:
;Sim800.c,311 :: 		UART2_Write_Text("ATE0");
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
;Sim800.c,312 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,313 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LB	R25, 4(SP)
;Sim800.c,314 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_WaitForResponse42:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse42
NOP	
NOP	
NOP	
;Sim800.c,315 :: 		}
J	L_WaitForResponse44
NOP	
L_WaitForResponse41:
;Sim800.c,317 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse45:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse45
NOP	
L_WaitForResponse44:
L_WaitForResponse40:
L_WaitForResponse36:
;Sim800.c,320 :: 		newMillis = TMR0.millis - lastMillis;
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R3, R2, R5
;Sim800.c,321 :: 		if(newMillis > 59000)
ORI	R2, R0, 59000
SLTU	R2, R2, R3
BNE	R2, R0, L__WaitForResponse287
NOP	
J	L_WaitForResponse47
NOP	
L__WaitForResponse287:
; lastMillis end address is: 20 (R5)
;Sim800.c,322 :: 		break;
J	L_WaitForResponse31
NOP	
L_WaitForResponse47:
;Sim800.c,323 :: 		}while(!RB.rcv_txt_fin);
; lastMillis start address is: 20 (R5)
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForResponse289
NOP	
J	L__WaitForResponse235
NOP	
L__WaitForResponse289:
; lastMillis end address is: 20 (R5)
L_WaitForResponse31:
;Sim800.c,324 :: 		LATE3_bit = 0;
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
;Sim800.c,325 :: 		}
L_end_WaitForResponse:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WaitForResponse
_RingToTempBuf:
;Sim800.c,330 :: 		void RingToTempBuf(){
;Sim800.c,332 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,333 :: 		RB.tail = RB.last_tail;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
; i end address is: 20 (R5)
;Sim800.c,335 :: 		while(RB.tail != RB.head){
L_RingToTempBuf48:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
BNE	R2, R3, L__RingToTempBuf292
NOP	
J	L_RingToTempBuf49
NOP	
L__RingToTempBuf292:
;Sim800.c,337 :: 		if(RB.tail > RB.head && RB.head > 150)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__RingToTempBuf293
NOP	
J	L__RingToTempBuf238
NOP	
L__RingToTempBuf293:
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 151
BEQ	R2, R0, L__RingToTempBuf294
NOP	
J	L__RingToTempBuf237
NOP	
L__RingToTempBuf294:
L__RingToTempBuf236:
;Sim800.c,338 :: 		RB.tail = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,337 :: 		if(RB.tail > RB.head && RB.head > 150)
L__RingToTempBuf238:
L__RingToTempBuf237:
;Sim800.c,340 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,345 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,346 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,347 :: 		if(RB.tail > 999)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RingToTempBuf295
NOP	
J	L_RingToTempBuf53
NOP	
L__RingToTempBuf295:
;Sim800.c,348 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
L_RingToTempBuf53:
;Sim800.c,349 :: 		};
J	L_RingToTempBuf48
NOP	
L_RingToTempBuf49:
;Sim800.c,350 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,352 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,353 :: 		}
L_end_RingToTempBuf:
JR	RA
NOP	
; end of _RingToTempBuf
_SetupIOT:
;Sim800.c,359 :: 		char SetupIOT(){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Sim800.c,369 :: 		" * ATE0\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(?lstr_14_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_14_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,368 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,369 :: 		" * ATE0\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,372 :: 		WaitForResponse(3);
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
;Sim800.c,373 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT54:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT54
NOP	
;Sim800.c,374 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,380 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,379 :: 		" * Check if Sim is Registered\r\n"
LUI	R2, hi_addr(?lstr_15_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_15_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,377 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,380 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,382 :: 		wait:
___SetupIOT_wait:
;Sim800.c,384 :: 		UART2_Write_Text("AT+CREG?");
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
;Sim800.c,385 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,386 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,387 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,388 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT56:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT56
NOP	
NOP	
NOP	
;Sim800.c,389 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,394 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,393 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_17_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_17_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,392 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,394 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,398 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT297
NOP	
J	L_SetupIOT58
NOP	
L__SetupIOT297:
;Sim800.c,400 :: 		num_strs = strsplit(SimTestTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
;Sim800.c,403 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,413 :: 		,string[3],string[4]);
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
;Sim800.c,412 :: 		,string[1],string[2]
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
;Sim800.c,411 :: 		,txtA,string[0]
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,410 :: 		" *string[4]  %s\r\n"
LUI	R2, hi_addr(?lstr_19_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_19_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,404 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,413 :: 		,string[3],string[4]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,415 :: 		str_rcv = findnumber(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
;Sim800.c,416 :: 		res = atoi(str_rcv);  //get the sms rec number
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,417 :: 		if(res == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT298
NOP	
J	L_SetupIOT59
NOP	
L__SetupIOT298:
;Sim800.c,419 :: 		sprintf(txtA,"%d",res);
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
;Sim800.c,422 :: 		,txtA);
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,421 :: 		" *Registered with:= %s\r\n"
LUI	R2, hi_addr(?lstr_21_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_21_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,420 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,422 :: 		,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,425 :: 		}else{
J	L_SetupIOT60
NOP	
L_SetupIOT59:
;Sim800.c,428 :: 		" *Sim Not Registered\r\n");
LUI	R2, hi_addr(?lstr_22_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_22_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,427 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,428 :: 		" *Sim Not Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,430 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT61:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT61
NOP	
NOP	
NOP	
;Sim800.c,431 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,432 :: 		}
L_SetupIOT60:
;Sim800.c,433 :: 		}
L_SetupIOT58:
;Sim800.c,436 :: 		" *Sim Registered\r\n");
LUI	R2, hi_addr(?lstr_23_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_23_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,435 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,436 :: 		" *Sim Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,440 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,441 :: 		}
;Sim800.c,440 :: 		return 1;
;Sim800.c,441 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,448 :: 		char WaitForSetupSMS(unsigned int Indx){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Sim800.c,452 :: 		UART2_Write_Text("AT+CMGF=1");
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
;Sim800.c,453 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,454 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,457 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,458 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,460 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS63:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS63
NOP	
;Sim800.c,462 :: 		WaitForResponse(0);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,463 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS65:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS65
NOP	
;Sim800.c,464 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,466 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 84 (R21)
SEH	R21, R2
;Sim800.c,469 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,470 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,481 :: 		string[4],string[5]);
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,480 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,479 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,478 :: 		" *string[5]  %s\r\n"
LUI	R2, hi_addr(?lstr_27_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_27_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,471 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,481 :: 		string[4],string[5]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
;Sim800.c,484 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 14(SP)
;Sim800.c,485 :: 		sprintf(sms,"%d",res);
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
;Sim800.c,489 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,488 :: 		" *sms no:= %s\r\n"
LUI	R2, hi_addr(?lstr_29_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_29_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,487 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,489 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,493 :: 		UART2_Write_Text("AT+CMGR=");
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
;Sim800.c,494 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,495 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,496 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,498 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,499 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS67:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS67
NOP	
;Sim800.c,500 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,501 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
;Sim800.c,503 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,519 :: 		,string[8]);
LUI	R2, hi_addr(_string+512)
ORI	R2, R2, lo_addr(_string+512)
ADDIU	SP, SP, -48
SW	R2, 44(SP)
;Sim800.c,518 :: 		,string[6],string[7]
LUI	R2, hi_addr(_string+448)
ORI	R2, R2, lo_addr(_string+448)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 36(SP)
;Sim800.c,517 :: 		,string[4],string[5]
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,516 :: 		,string[2],string[3]
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,515 :: 		,txtA,string[0],string[1]
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,514 :: 		" *string[8]  %s\r\n"
LUI	R2, hi_addr(?lstr_32_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_32_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,504 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,519 :: 		,string[8]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 48
LHU	R25, 12(SP)
;Sim800.c,522 :: 		if(Indx == 0){
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS300
NOP	
J	L_WaitForSetupSMS69
NOP	
L__WaitForSetupSMS300:
;Sim800.c,524 :: 		strncpy(SF.SimCelNum,string[1],strlen(string[1])+11);
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
;Sim800.c,525 :: 		strncpy(SF.SimDate,string[3],strlen(string[3])+1);
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
;Sim800.c,526 :: 		strncpy(SF.SimTime,string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+9)
ORI	R25, R25, lo_addr(_SF+9)
JAL	_strncpy+0
NOP	
;Sim800.c,533 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
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
;Sim800.c,532 :: 		" * SF.SimTime: %s\r\n"
LUI	R2, hi_addr(?lstr_33_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_33_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,529 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,533 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,535 :: 		}else if(Indx == 1){
J	L_WaitForSetupSMS70
NOP	
L_WaitForSetupSMS69:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS301
NOP	
J	L_WaitForSetupSMS71
NOP	
L__WaitForSetupSMS301:
;Sim800.c,537 :: 		strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);
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
;Sim800.c,540 :: 		strncpy(SF.ReadAPIKey,string[6],strlen(string[6])+1);
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
;Sim800.c,543 :: 		strncpy(SF.APN,string[7],strlen(string[7])+1);
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
;Sim800.c,546 :: 		strncpy(SF.PWD,string[8],strlen(string[8])+1);
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
;Sim800.c,555 :: 		,SF.APN,SF.PWD);
LUI	R2, hi_addr(_SF+118)
ORI	R2, R2, lo_addr(_SF+118)
ADDIU	SP, SP, -24
SW	R2, 20(SP)
LUI	R2, hi_addr(_SF+98)
ORI	R2, R2, lo_addr(_SF+98)
SW	R2, 16(SP)
;Sim800.c,554 :: 		,SF.WriteAPIKey,SF.ReadAPIKey
LUI	R2, hi_addr(_SF+78)
ORI	R2, R2, lo_addr(_SF+78)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+58)
ORI	R2, R2, lo_addr(_SF+58)
SW	R2, 8(SP)
;Sim800.c,553 :: 		" * SF.PWD:         %s\r\n"
LUI	R2, hi_addr(?lstr_34_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_34_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,549 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,555 :: 		,SF.APN,SF.PWD);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 24
LHU	R25, 12(SP)
;Sim800.c,558 :: 		}
L_WaitForSetupSMS71:
L_WaitForSetupSMS70:
;Sim800.c,561 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS72:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS72
NOP	
NOP	
NOP	
;Sim800.c,562 :: 		RemoveSMSText(res);
SH	R25, 12(SP)
LH	R25, 14(SP)
JAL	_RemoveSMSText+0
NOP	
;Sim800.c,563 :: 		res = strcmp(SimTestTxt,"OK,");
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
;Sim800.c,565 :: 		sprintf(txtA,"%d",res);
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
;Sim800.c,569 :: 		,SimTestTxt,txtA);
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SW	R2, 8(SP)
;Sim800.c,568 :: 		" * OK-0: %s\r\n"
LUI	R2, hi_addr(?lstr_37_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_37_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,566 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,569 :: 		,SimTestTxt,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LHU	R25, 12(SP)
;Sim800.c,572 :: 		if((res == 0)&&(Indx == 1)){
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS302
NOP	
J	L__WaitForSetupSMS242
NOP	
L__WaitForSetupSMS302:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS303
NOP	
J	L__WaitForSetupSMS241
NOP	
L__WaitForSetupSMS303:
L__WaitForSetupSMS240:
;Sim800.c,573 :: 		WriteToFlashTemp();
JAL	_WriteToFlashTemp+0
NOP	
;Sim800.c,574 :: 		return 3;
ORI	R2, R0, 3
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,572 :: 		if((res == 0)&&(Indx == 1)){
L__WaitForSetupSMS242:
L__WaitForSetupSMS241:
;Sim800.c,576 :: 		else if ((res == 0)&&(Indx == 0))
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS304
NOP	
J	L__WaitForSetupSMS244
NOP	
L__WaitForSetupSMS304:
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS305
NOP	
J	L__WaitForSetupSMS243
NOP	
L__WaitForSetupSMS305:
L__WaitForSetupSMS239:
;Sim800.c,577 :: 		return 2;
ORI	R2, R0, 2
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,576 :: 		else if ((res == 0)&&(Indx == 0))
L__WaitForSetupSMS244:
L__WaitForSetupSMS243:
;Sim800.c,579 :: 		return res;
LH	R2, 14(SP)
;Sim800.c,580 :: 		}
;Sim800.c,579 :: 		return res;
;Sim800.c,580 :: 		}
L_end_WaitForSetupSMS:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _WaitForSetupSMS
_AT_Initial:
;Sim800.c,586 :: 		void AT_Initial(){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Sim800.c,589 :: 		UART2_Write_Text("AT&W+CNMI=2,1,0,0,0");
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
;Sim800.c,590 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,591 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,594 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,595 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_AT_Initial82:
ADDIU	R24, R24, -1
BNE	R24, R0, L_AT_Initial82
NOP	
;Sim800.c,596 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,597 :: 		}
L_end_AT_Initial:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _AT_Initial
_GetAPI_Key_SMS:
;Sim800.c,602 :: 		char GetAPI_Key_SMS(){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Sim800.c,607 :: 		UART2_Write_Text("AT+CMGS=");
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
;Sim800.c,608 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,609 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,610 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,613 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,614 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,615 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_GetAPI_Key_SMS84:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetAPI_Key_SMS84
NOP	
NOP	
NOP	
;Sim800.c,619 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,618 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_40_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_40_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,617 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,619 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,622 :: 		UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
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
;Sim800.c,623 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,624 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,625 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,627 :: 		response = WaitForSetupSMS(1);
ORI	R25, R0, 1
JAL	_WaitForSetupSMS+0
NOP	
;Sim800.c,629 :: 		return response;
;Sim800.c,630 :: 		}
;Sim800.c,629 :: 		return response;
;Sim800.c,630 :: 		}
L_end_GetAPI_Key_SMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _GetAPI_Key_SMS
_SendSMS:
;Sim800.c,635 :: 		char SendSMS(char sms_type,char cellNum){
ADDIU	SP, SP, -500
SW	RA, 0(SP)
;Sim800.c,642 :: 		str_ = (char*)Malloc(100*sizeof(char*));
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R25, 16(SP)
ORI	R25, R0, 400
JAL	_Malloc+0
NOP	
LBU	R25, 16(SP)
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
;Sim800.c,644 :: 		if(!cellNum)
BEQ	R26, R0, L__SendSMS309
NOP	
J	L_SendSMS86
NOP	
L__SendSMS309:
;Sim800.c,645 :: 		strcpy(tempCellNum,string[1]);
ADDIU	R2, SP, 81
SB	R25, 16(SP)
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LBU	R25, 16(SP)
J	L_SendSMS87
NOP	
L_SendSMS86:
;Sim800.c,647 :: 		strcpy(tempCellNum,SF.SimCelNum);
ADDIU	R2, SP, 81
SB	R25, 16(SP)
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LBU	R25, 16(SP)
L_SendSMS87:
;Sim800.c,649 :: 		if(!onecA){
LB	R2, Offset(SendSMS_onecA_L0+0)(GP)
BEQ	R2, R0, L__SendSMS310
NOP	
J	L_SendSMS88
NOP	
L__SendSMS310:
;Sim800.c,650 :: 		onecA = 1;
ORI	R2, R0, 1
SB	R2, Offset(SendSMS_onecA_L0+0)(GP)
;Sim800.c,651 :: 		AT_Initial();
JAL	_AT_Initial+0
NOP	
;Sim800.c,652 :: 		}
L_SendSMS88:
;Sim800.c,654 :: 		UART2_Write_Text("AT+CMGF=1");
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
;Sim800.c,655 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,656 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,657 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS89:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS89
NOP	
;Sim800.c,658 :: 		UART2_Write_Text("AT+CMGS=");
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
;Sim800.c,659 :: 		UART2_Write_Text(tempCellNum);//SF.SimCelNum);
ADDIU	R2, SP, 81
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,660 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,661 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 16(SP)
;Sim800.c,662 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS91:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS91
NOP	
NOP	
NOP	
;Sim800.c,663 :: 		switch(sms_type){
J	L_SendSMS93
NOP	
;Sim800.c,664 :: 		case 0:
L_SendSMS95:
;Sim800.c,665 :: 		UART2_Write_Text("ERROR in setup Power down and start again!");
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
;Sim800.c,666 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
;Sim800.c,667 :: 		case 1:
L_SendSMS96:
;Sim800.c,668 :: 		UART2_Write_Text("Reply WebSite");
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
;Sim800.c,669 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
;Sim800.c,670 :: 		case 2:
L_SendSMS97:
;Sim800.c,671 :: 		UART2_Write_Text("Reply API Key");
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
;Sim800.c,672 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
;Sim800.c,673 :: 		case 3:
L_SendSMS98:
;Sim800.c,674 :: 		UART2_Write_Text("Setup Complete!");
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
;Sim800.c,675 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
;Sim800.c,676 :: 		case 4:
L_SendSMS99:
;Sim800.c,677 :: 		UART2_Write_Text("Device Powered up!");
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
;Sim800.c,678 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
;Sim800.c,679 :: 		case 5:
L_SendSMS100:
;Sim800.c,680 :: 		UART2_Write_Text("SMS Not recieved!");
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
;Sim800.c,681 :: 		break;
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS94
NOP	
;Sim800.c,682 :: 		case 6: //read the set points
L_SendSMS101:
;Sim800.c,683 :: 		str_ = Read_Thresholds();
JAL	_Read_Thresholds+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
;Sim800.c,684 :: 		strncpy(b,str_,strlen(str_)-4);
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
;Sim800.c,685 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,686 :: 		break;
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS94
NOP	
;Sim800.c,687 :: 		case 7: //read raw values
L_SendSMS102:
;Sim800.c,688 :: 		str_ = Read_Send_AllColour(0);
MOVZ	R25, R0, R0
JAL	_Read_Send_AllColour+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
;Sim800.c,689 :: 		strncpy(b,str_,strlen(str_));
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 17
SEH	R27, R2
MOVZ	R26, R6, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Sim800.c,690 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,691 :: 		break;
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS94
NOP	
;Sim800.c,692 :: 		case 8: //read scaled values
L_SendSMS103:
;Sim800.c,693 :: 		str_ = Read_Send_AllColour(1);
ORI	R25, R0, 1
JAL	_Read_Send_AllColour+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
;Sim800.c,694 :: 		strncpy(b,str_,strlen(str_));
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 17
SEH	R27, R2
MOVZ	R26, R6, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Sim800.c,695 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,696 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
;Sim800.c,697 :: 		case 9:
L_SendSMS104:
;Sim800.c,698 :: 		UART2_Write_Text("Test Started!");
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
;Sim800.c,699 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
;Sim800.c,700 :: 		case 10:
L_SendSMS105:
;Sim800.c,701 :: 		UART2_Write_Text("Test Stopped!");
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
;Sim800.c,702 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
;Sim800.c,703 :: 		case 11:
L_SendSMS106:
;Sim800.c,704 :: 		UART2_Write_Text("You are not permitted to set the threshold contact the supplier!");
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
;Sim800.c,705 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
;Sim800.c,706 :: 		case 12:
L_SendSMS107:
;Sim800.c,707 :: 		UART2_Write_Text("Not a recognised command!");
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
;Sim800.c,708 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
;Sim800.c,709 :: 		case 13:
L_SendSMS108:
;Sim800.c,710 :: 		UART2_Write_Text("You are not permitted to stop this test contact ");
ADDIU	R23, SP, 363
ADDIU	R22, R23, 49
LUI	R24, hi_addr(?ICS?lstr54_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr54_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 363
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,711 :: 		UART2_Write_Text(SF.StartCell);
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,712 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
;Sim800.c,713 :: 		case 14:
L_SendSMS109:
;Sim800.c,714 :: 		UART2_Write_Text("Test already started contact ");
ADDIU	R23, SP, 412
ADDIU	R22, R23, 30
LUI	R24, hi_addr(?ICS?lstr55_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr55_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 412
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,715 :: 		UART2_Write_Text(SF.StartCell);
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,716 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
;Sim800.c,717 :: 		case 15:
L_SendSMS110:
;Sim800.c,718 :: 		UART2_Write_Text("Test has not been started!");
ADDIU	R23, SP, 442
ADDIU	R22, R23, 27
LUI	R24, hi_addr(?ICS?lstr56_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr56_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 442
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,719 :: 		break;
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS94
NOP	
;Sim800.c,720 :: 		case 16: //read scaled values
L_SendSMS111:
;Sim800.c,721 :: 		str_ = ReadHUE();
JAL	_ReadHUE+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
;Sim800.c,722 :: 		strncpy(b,str_,strlen(str_));
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 17
SEH	R27, R2
MOVZ	R26, R6, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Sim800.c,723 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,724 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
;Sim800.c,725 :: 		default:
L_SendSMS112:
;Sim800.c,726 :: 		UART2_Write_Text("Error Power cycle the device!");
ADDIU	R23, SP, 469
ADDIU	R22, R23, 30
LUI	R24, hi_addr(?ICS?lstr57_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr57_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 469
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,727 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS94
NOP	
;Sim800.c,728 :: 		}
L_SendSMS93:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS312
NOP	
J	L_SendSMS95
NOP	
L__SendSMS312:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS314
NOP	
J	L_SendSMS96
NOP	
L__SendSMS314:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS316
NOP	
J	L_SendSMS97
NOP	
L__SendSMS316:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__SendSMS318
NOP	
J	L_SendSMS98
NOP	
L__SendSMS318:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__SendSMS320
NOP	
J	L_SendSMS99
NOP	
L__SendSMS320:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__SendSMS322
NOP	
J	L_SendSMS100
NOP	
L__SendSMS322:
ANDI	R3, R25, 255
ORI	R2, R0, 6
BNE	R3, R2, L__SendSMS324
NOP	
J	L_SendSMS101
NOP	
L__SendSMS324:
ANDI	R3, R25, 255
ORI	R2, R0, 7
BNE	R3, R2, L__SendSMS326
NOP	
J	L_SendSMS102
NOP	
L__SendSMS326:
ANDI	R3, R25, 255
ORI	R2, R0, 8
BNE	R3, R2, L__SendSMS328
NOP	
J	L_SendSMS103
NOP	
L__SendSMS328:
ANDI	R3, R25, 255
ORI	R2, R0, 9
BNE	R3, R2, L__SendSMS330
NOP	
J	L_SendSMS104
NOP	
L__SendSMS330:
ANDI	R3, R25, 255
ORI	R2, R0, 10
BNE	R3, R2, L__SendSMS332
NOP	
J	L_SendSMS105
NOP	
L__SendSMS332:
ANDI	R3, R25, 255
ORI	R2, R0, 11
BNE	R3, R2, L__SendSMS334
NOP	
J	L_SendSMS106
NOP	
L__SendSMS334:
ANDI	R3, R25, 255
ORI	R2, R0, 12
BNE	R3, R2, L__SendSMS336
NOP	
J	L_SendSMS107
NOP	
L__SendSMS336:
ANDI	R3, R25, 255
ORI	R2, R0, 13
BNE	R3, R2, L__SendSMS338
NOP	
J	L_SendSMS108
NOP	
L__SendSMS338:
ANDI	R3, R25, 255
ORI	R2, R0, 14
BNE	R3, R2, L__SendSMS340
NOP	
J	L_SendSMS109
NOP	
L__SendSMS340:
ANDI	R3, R25, 255
ORI	R2, R0, 15
BNE	R3, R2, L__SendSMS342
NOP	
J	L_SendSMS110
NOP	
L__SendSMS342:
ANDI	R3, R25, 255
ORI	R2, R0, 16
BNE	R3, R2, L__SendSMS344
NOP	
J	L_SendSMS111
NOP	
L__SendSMS344:
J	L_SendSMS112
NOP	
; str_ end address is: 24 (R6)
L_SendSMS94:
;Sim800.c,729 :: 		UART2_Write(0x0D);
; str_ start address is: 12 (R3)
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,730 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,731 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,732 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendSMS113:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS113
NOP	
NOP	
NOP	
;Sim800.c,734 :: 		Free(str_,100*sizeof(char*));
ORI	R26, R0, 400
MOVZ	R25, R3, R0
; str_ end address is: 12 (R3)
JAL	_Free+0
NOP	
;Sim800.c,736 :: 		}
L_end_SendSMS:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 500
JR	RA
NOP	
; end of _SendSMS
_GetSMSText:
;Sim800.c,741 :: 		char GetSMSText(){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Sim800.c,743 :: 		UART1_Write_Text("=================\r\n");
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
;Sim800.c,744 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,748 :: 		num_strs = strsplit(SimTestTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 20 (R5)
SEH	R5, R2
;Sim800.c,750 :: 		err = strncmp(sms_test,string[0],4);
ORI	R27, R0, 4
LUI	R26, hi_addr(_string+0)
ORI	R26, R26, lo_addr(_string+0)
LUI	R25, hi_addr(_sms_test+0)
ORI	R25, R25, lo_addr(_sms_test+0)
JAL	_strncmp+0
NOP	
SH	R2, 18(SP)
;Sim800.c,752 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,753 :: 		sprintf(txtB,"%d",err);
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
;Sim800.c,770 :: 		,string[7],string[8]);
LUI	R2, hi_addr(_string+512)
ORI	R2, R2, lo_addr(_string+512)
ADDIU	SP, SP, -52
SW	R2, 48(SP)
LUI	R2, hi_addr(_string+448)
ORI	R2, R2, lo_addr(_string+448)
SW	R2, 44(SP)
;Sim800.c,769 :: 		,string[5],string[6]
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 36(SP)
;Sim800.c,768 :: 		,string[3],string[4]
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 28(SP)
;Sim800.c,767 :: 		,string[1],string[2]
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 20(SP)
;Sim800.c,766 :: 		,txtA,txtB,string[0]
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 16(SP)
LUI	R2, hi_addr(_txtB+0)
ORI	R2, R2, lo_addr(_txtB+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,765 :: 		" *string[8]  %s\r\n"
LUI	R2, hi_addr(?lstr_61_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_61_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,754 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,770 :: 		,string[7],string[8]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 52
;Sim800.c,773 :: 		if(!err){
LH	R2, 18(SP)
BEQ	R2, R0, L__GetSMSText346
NOP	
J	L_GetSMSText115
NOP	
L__GetSMSText346:
;Sim800.c,775 :: 		is_digit = isdigit(*string[1]);
LBU	R25, Offset(_string+64)(GP)
JAL	_isdigit+0
NOP	
;Sim800.c,777 :: 		if(is_digit == 1){
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__GetSMSText347
NOP	
J	L_GetSMSText116
NOP	
L__GetSMSText347:
;Sim800.c,778 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 16(SP)
;Sim800.c,780 :: 		sprintf(sms,"%d",res);
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
;Sim800.c,783 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,782 :: 		" *no of sms's:= %s\r\n"
LUI	R2, hi_addr(?lstr_63_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_63_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,781 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,783 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,785 :: 		ReadMSG(res);
LH	R25, 16(SP)
JAL	_ReadMSG+0
NOP	
;Sim800.c,786 :: 		}else{
J	L_GetSMSText117
NOP	
L_GetSMSText116:
;Sim800.c,787 :: 		SendSMS(5,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 5
JAL	_SendSMS+0
NOP	
;Sim800.c,788 :: 		res = 1;
ORI	R2, R0, 1
SH	R2, 16(SP)
;Sim800.c,789 :: 		}
L_GetSMSText117:
;Sim800.c,790 :: 		return RemoveSMSText(res);
LH	R25, 16(SP)
JAL	_RemoveSMSText+0
NOP	
J	L_end_GetSMSText
NOP	
;Sim800.c,791 :: 		}
L_GetSMSText115:
;Sim800.c,793 :: 		return -1;
ORI	R2, R0, 255
;Sim800.c,794 :: 		}
;Sim800.c,793 :: 		return -1;
;Sim800.c,794 :: 		}
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
;Sim800.c,800 :: 		char ReadMSG(int msg_num){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Sim800.c,803 :: 		sprintf(sms,"%d",msg_num);
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
;Sim800.c,804 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG118:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG118
NOP	
;Sim800.c,808 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,807 :: 		" *num_sms's:= %s\r\n"
LUI	R2, hi_addr(?lstr_65_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_65_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,806 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,808 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,811 :: 		UART2_Write_Text("AT+CMGF=1");
ADDIU	R23, SP, 20
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr66_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr66_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,812 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,813 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,814 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,815 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,816 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG120:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG120
NOP	
;Sim800.c,819 :: 		UART2_Write_Text("AT+CMGR=");
ADDIU	R23, SP, 30
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr67_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr67_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 30
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,820 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,821 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,822 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,824 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,825 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,826 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG122:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG122
NOP	
;Sim800.c,830 :: 		"************** \r\n");
LUI	R2, hi_addr(?lstr_68_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_68_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,829 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,830 :: 		"************** \r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,833 :: 		for(i = 0;i<strlen(SimTestTxt);i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_ReadMSG124:
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
BNE	R2, R0, L__ReadMSG349
NOP	
J	L_ReadMSG125
NOP	
L__ReadMSG349:
;Sim800.c,834 :: 		SimTestTxt[i] =  toupper(SimTestTxt[i]);
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SW	R2, 40(SP)
SH	R25, 16(SP)
LBU	R25, 0(R2)
JAL	_toupper+0
NOP	
LH	R25, 16(SP)
LW	R3, 40(SP)
SB	R2, 0(R3)
;Sim800.c,833 :: 		for(i = 0;i<strlen(SimTestTxt);i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,835 :: 		}
; i end address is: 20 (R5)
J	L_ReadMSG124
NOP	
L_ReadMSG125:
;Sim800.c,837 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 16(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
LH	R25, 16(SP)
; num_strs start address is: 12 (R3)
SEH	R3, R2
;Sim800.c,838 :: 		text = strchr(string[4], '"');
SH	R3, 16(SP)
SH	R25, 18(SP)
ORI	R26, R0, 34
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strchr+0
NOP	
;Sim800.c,839 :: 		strcpy(string[6], RemoveChars(text,'"','O'));
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
;Sim800.c,840 :: 		strcpy(string[3], RemoveChars(string[3],'"',0x0A));
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
;Sim800.c,841 :: 		memset(string[4]+8,0,1);
ORI	R27, R0, 1
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_string+264)
ORI	R25, R25, lo_addr(_string+264)
JAL	_memset+0
NOP	
;Sim800.c,842 :: 		strncpy(string[4],string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strncpy+0
NOP	
LH	R25, 18(SP)
LH	R3, 16(SP)
;Sim800.c,846 :: 		sprintf(sms,"%d",num_strs);
SH	R25, 16(SP)
; num_strs end address is: 12 (R3)
ADDIU	SP, SP, -12
SH	R3, 8(SP)
LUI	R2, hi_addr(?lstr_69_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_69_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,859 :: 		,string[6]);
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
;Sim800.c,858 :: 		,string[4],string[5]
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,857 :: 		,string[2],string[3]
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,856 :: 		,sms,string[0],string[1]
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 8(SP)
;Sim800.c,855 :: 		" *string[6]  %s\r\n"
LUI	R2, hi_addr(?lstr_70_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_70_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,847 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,859 :: 		,string[6]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 40
LH	R25, 16(SP)
;Sim800.c,861 :: 		if(string[6] != NULL){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
BNE	R3, R2, L__ReadMSG351
NOP	
J	L_ReadMSG127
NOP	
L__ReadMSG351:
;Sim800.c,862 :: 		strcpy(string[6],RemoveWhiteSpace(string[6]));
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
;Sim800.c,863 :: 		res = StrChecker(string[6]);
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_StrChecker+0
NOP	
LH	R25, 16(SP)
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,866 :: 		if(res == 6){         //Reada_Scl
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__ReadMSG352
NOP	
J	L_ReadMSG128
NOP	
L__ReadMSG352:
;Sim800.c,867 :: 		goto next;
J	___ReadMSG_next
NOP	
;Sim800.c,868 :: 		}
L_ReadMSG128:
;Sim800.c,869 :: 		else if(res == 10){         //Readc
SEH	R3, R4
ORI	R2, R0, 10
BEQ	R3, R2, L__ReadMSG353
NOP	
J	L_ReadMSG130
NOP	
L__ReadMSG353:
;Sim800.c,870 :: 		goto next;
J	___ReadMSG_next
NOP	
;Sim800.c,871 :: 		}
L_ReadMSG130:
;Sim800.c,872 :: 		else if(res == 11){         //Readt
SEH	R3, R4
ORI	R2, R0, 11
BEQ	R3, R2, L__ReadMSG354
NOP	
J	L_ReadMSG132
NOP	
L__ReadMSG354:
;Sim800.c,873 :: 		goto next;
J	___ReadMSG_next
NOP	
;Sim800.c,874 :: 		}
L_ReadMSG132:
;Sim800.c,875 :: 		else if(res == 13){         //Reada_Scl
SEH	R3, R4
ORI	R2, R0, 13
BEQ	R3, R2, L__ReadMSG355
NOP	
J	L_ReadMSG134
NOP	
L__ReadMSG355:
;Sim800.c,876 :: 		goto next;
J	___ReadMSG_next
NOP	
;Sim800.c,877 :: 		}
L_ReadMSG134:
;Sim800.c,878 :: 		else if(res == 14){         //Reada_thv
SEH	R3, R4
ORI	R2, R0, 14
BEQ	R3, R2, L__ReadMSG356
NOP	
J	L_ReadMSG136
NOP	
L__ReadMSG356:
;Sim800.c,879 :: 		goto next;
J	___ReadMSG_next
NOP	
;Sim800.c,880 :: 		}
L_ReadMSG136:
;Sim800.c,881 :: 		else if(res == 16){   //write_raw
SEH	R3, R4
ORI	R2, R0, 16
BEQ	R3, R2, L__ReadMSG357
NOP	
J	L_ReadMSG138
NOP	
L__ReadMSG357:
;Sim800.c,882 :: 		if((res == 16) && (strncmp(string[1],SF.SimCelNum,15))){
SEH	R3, R4
ORI	R2, R0, 16
BEQ	R3, R2, L__ReadMSG358
NOP	
J	L__ReadMSG251
NOP	
L__ReadMSG358:
SH	R4, 16(SP)
SH	R25, 18(SP)
ORI	R27, R0, 15
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strncmp+0
NOP	
LH	R25, 18(SP)
LH	R4, 16(SP)
BNE	R2, R0, L__ReadMSG360
NOP	
J	L__ReadMSG250
NOP	
L__ReadMSG360:
; res end address is: 16 (R4)
L__ReadMSG249:
;Sim800.c,883 :: 		SendSMS(11,0);
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 11
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,884 :: 		return 11;
ORI	R2, R0, 11
J	L_end_ReadMSG
NOP	
;Sim800.c,882 :: 		if((res == 16) && (strncmp(string[1],SF.SimCelNum,15))){
L__ReadMSG251:
; res start address is: 16 (R4)
L__ReadMSG250:
;Sim800.c,886 :: 		}else if(res == 17){  //start
J	L_ReadMSG142
NOP	
L_ReadMSG138:
SEH	R3, R4
ORI	R2, R0, 17
BEQ	R3, R2, L__ReadMSG361
NOP	
J	L_ReadMSG143
NOP	
L__ReadMSG361:
;Sim800.c,887 :: 		if(res == 17 && !SimVars.start){
SEH	R3, R4
ORI	R2, R0, 17
BEQ	R3, R2, L__ReadMSG362
NOP	
J	L__ReadMSG253
NOP	
L__ReadMSG362:
LBU	R2, Offset(_SimVars+2)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__ReadMSG363
NOP	
J	L__ReadMSG252
NOP	
L__ReadMSG363:
L__ReadMSG248:
;Sim800.c,888 :: 		strncpy(SF.StartCell,string[1],15);
SH	R4, 16(SP)
SH	R25, 18(SP)
ORI	R27, R0, 15
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strncpy+0
NOP	
LH	R25, 18(SP)
LH	R4, 16(SP)
;Sim800.c,889 :: 		SimVars.start = 1;
LBU	R2, Offset(_SimVars+2)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SimVars+2)(GP)
;Sim800.c,890 :: 		}else if(res == 17 && SimVars.start){
J	L_ReadMSG147
NOP	
;Sim800.c,887 :: 		if(res == 17 && !SimVars.start){
L__ReadMSG253:
L__ReadMSG252:
;Sim800.c,890 :: 		}else if(res == 17 && SimVars.start){
SEH	R3, R4
ORI	R2, R0, 17
BEQ	R3, R2, L__ReadMSG364
NOP	
J	L__ReadMSG255
NOP	
L__ReadMSG364:
LBU	R2, Offset(_SimVars+2)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__ReadMSG366
NOP	
J	L__ReadMSG254
NOP	
L__ReadMSG366:
; res end address is: 16 (R4)
L__ReadMSG247:
;Sim800.c,891 :: 		SendSMS(14,0);
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 14
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,892 :: 		return 14;
ORI	R2, R0, 14
J	L_end_ReadMSG
NOP	
;Sim800.c,890 :: 		}else if(res == 17 && SimVars.start){
L__ReadMSG255:
; res start address is: 16 (R4)
L__ReadMSG254:
;Sim800.c,894 :: 		goto next;
J	___ReadMSG_next
NOP	
L_ReadMSG147:
;Sim800.c,895 :: 		}else if(res == 18){   //cancel
J	L_ReadMSG152
NOP	
L_ReadMSG143:
SEH	R3, R4
ORI	R2, R0, 18
BEQ	R3, R2, L__ReadMSG367
NOP	
J	L_ReadMSG153
NOP	
L__ReadMSG367:
;Sim800.c,898 :: 		!strncmp(string[1],SF.SimCelNum,15))){
LBU	R2, Offset(_SimVars+2)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__ReadMSG369
NOP	
J	L__ReadMSG258
NOP	
L__ReadMSG369:
;Sim800.c,897 :: 		(!strncmp(string[1],SF.StartCell,15)||
SH	R4, 16(SP)
SH	R25, 18(SP)
ORI	R27, R0, 15
LUI	R26, hi_addr(_SF+38)
ORI	R26, R26, lo_addr(_SF+38)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strncmp+0
NOP	
LH	R25, 18(SP)
LH	R4, 16(SP)
;Sim800.c,898 :: 		!strncmp(string[1],SF.SimCelNum,15))){
BNE	R2, R0, L__ReadMSG371
NOP	
J	L__ReadMSG257
NOP	
L__ReadMSG371:
SH	R4, 16(SP)
SH	R25, 18(SP)
ORI	R27, R0, 15
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strncmp+0
NOP	
LH	R25, 18(SP)
LH	R4, 16(SP)
BNE	R2, R0, L__ReadMSG373
NOP	
J	L__ReadMSG256
NOP	
L__ReadMSG373:
; res end address is: 16 (R4)
J	L_ReadMSG158
NOP	
L__ReadMSG257:
; res start address is: 16 (R4)
L__ReadMSG256:
L__ReadMSG245:
;Sim800.c,899 :: 		SimVars.start = 0;
LBU	R2, Offset(_SimVars+2)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_SimVars+2)(GP)
;Sim800.c,905 :: 		,SF.StartCell,string[1]);
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SH	R4, 16(SP)
SH	R25, 18(SP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+38)
ORI	R2, R2, lo_addr(_SF+38)
SW	R2, 8(SP)
;Sim800.c,904 :: 		" *string[1]:=      %s\r\n"
LUI	R2, hi_addr(?lstr_71_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_71_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,901 :: 		PrintOut(PrintHandler,       "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,905 :: 		,SF.StartCell,string[1]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LH	R25, 18(SP)
LH	R4, 16(SP)
;Sim800.c,907 :: 		goto next;   //if cell matches allow to CANCEL
J	___ReadMSG_next
NOP	
; res end address is: 16 (R4)
;Sim800.c,908 :: 		}else{
L_ReadMSG158:
;Sim800.c,898 :: 		!strncmp(string[1],SF.SimCelNum,15))){
L__ReadMSG258:
;Sim800.c,909 :: 		if(!SimVars.start){
LBU	R2, Offset(_SimVars+2)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__ReadMSG374
NOP	
J	L_ReadMSG160
NOP	
L__ReadMSG374:
;Sim800.c,910 :: 		SendSMS(15,0);  //test has not been started
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 15
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,911 :: 		return 15;
ORI	R2, R0, 15
J	L_end_ReadMSG
NOP	
;Sim800.c,912 :: 		}else{
L_ReadMSG160:
;Sim800.c,913 :: 		SendSMS(13,0);  //not a recognized command
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 13
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,914 :: 		return 13;
ORI	R2, R0, 13
J	L_end_ReadMSG
NOP	
;Sim800.c,917 :: 		}else if(res == 19){   //HUE
L_ReadMSG153:
; res start address is: 16 (R4)
SEH	R3, R4
ORI	R2, R0, 19
BEQ	R3, R2, L__ReadMSG375
NOP	
J	L_ReadMSG163
NOP	
L__ReadMSG375:
;Sim800.c,918 :: 		goto next;
J	___ReadMSG_next
NOP	
; res end address is: 16 (R4)
;Sim800.c,919 :: 		}else{
L_ReadMSG163:
;Sim800.c,920 :: 		SendSMS(12,0);
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,921 :: 		return 12;
ORI	R2, R0, 12
J	L_end_ReadMSG
NOP	
;Sim800.c,922 :: 		}
L_ReadMSG152:
; res start address is: 16 (R4)
L_ReadMSG142:
;Sim800.c,923 :: 		next:
___ReadMSG_next:
;Sim800.c,924 :: 		TestRecievedSMS(res);
SH	R25, 16(SP)
; res end address is: 16 (R4)
SEH	R25, R4
JAL	_TestRecievedSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,925 :: 		}
L_ReadMSG127:
;Sim800.c,926 :: 		return 0;
MOVZ	R2, R0, R0
;Sim800.c,927 :: 		}
;Sim800.c,926 :: 		return 0;
;Sim800.c,927 :: 		}
L_end_ReadMSG:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 44
JR	RA
NOP	
; end of _ReadMSG
_TestRecievedSMS:
;Sim800.c,932 :: 		void TestRecievedSMS(int res){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Sim800.c,937 :: 		sprintf(B,"%d",res);
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
;Sim800.c,940 :: 		,B);
ADDIU	R2, SP, 14
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,939 :: 		" *Str check result:= %s\r\n"
LUI	R2, hi_addr(?lstr_73_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_73_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,938 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,940 :: 		,B);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 12(SP)
;Sim800.c,943 :: 		switch(res){
J	L_TestRecievedSMS165
NOP	
;Sim800.c,944 :: 		case 6:
L_TestRecievedSMS167:
;Sim800.c,945 :: 		SendSMS(7,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 7
JAL	_SendSMS+0
NOP	
;Sim800.c,946 :: 		break;
J	L_TestRecievedSMS166
NOP	
;Sim800.c,947 :: 		case 7: //R
L_TestRecievedSMS168:
;Sim800.c,948 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,949 :: 		break;
J	L_TestRecievedSMS166
NOP	
;Sim800.c,950 :: 		case 8: //G
L_TestRecievedSMS169:
;Sim800.c,951 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,952 :: 		break;
J	L_TestRecievedSMS166
NOP	
;Sim800.c,953 :: 		case 9: //B
L_TestRecievedSMS170:
;Sim800.c,954 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,955 :: 		break;
J	L_TestRecievedSMS166
NOP	
;Sim800.c,956 :: 		case 10: //C
L_TestRecievedSMS171:
;Sim800.c,957 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,958 :: 		break;
J	L_TestRecievedSMS166
NOP	
;Sim800.c,959 :: 		case 13:
L_TestRecievedSMS172:
;Sim800.c,960 :: 		SendSMS(8,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 8
JAL	_SendSMS+0
NOP	
;Sim800.c,961 :: 		break;
J	L_TestRecievedSMS166
NOP	
;Sim800.c,962 :: 		case 14:
L_TestRecievedSMS173:
;Sim800.c,963 :: 		SendSMS(6,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 6
JAL	_SendSMS+0
NOP	
;Sim800.c,964 :: 		break;
J	L_TestRecievedSMS166
NOP	
;Sim800.c,965 :: 		case 15: //write,
L_TestRecievedSMS174:
;Sim800.c,966 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,967 :: 		break;
J	L_TestRecievedSMS166
NOP	
;Sim800.c,968 :: 		case 16:
L_TestRecievedSMS175:
;Sim800.c,969 :: 		GetValuesFromFlash();
JAL	_GetValuesFromFlash+0
NOP	
;Sim800.c,970 :: 		NVMErasePage(FLASH_Settings_PAddr);
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
;Sim800.c,971 :: 		if(string[5] != NULL){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__TestRecievedSMS378
NOP	
J	L_TestRecievedSMS176
NOP	
L__TestRecievedSMS378:
;Sim800.c,972 :: 		strcpy(B,string[5]);
ADDIU	R2, SP, 14
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;Sim800.c,973 :: 		Threshold.time_to_log = atoi(B);
ADDIU	R2, SP, 14
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, Offset(_Threshold+8)(GP)
;Sim800.c,974 :: 		Threshold.time_to_log -= 1;
ADDIU	R2, R2, -1
SH	R2, Offset(_Threshold+8)(GP)
;Sim800.c,975 :: 		}
L_TestRecievedSMS176:
;Sim800.c,976 :: 		WriteToFlashTemp();
JAL	_WriteToFlashTemp+0
NOP	
;Sim800.c,977 :: 		t =  Write_Thresholds(0);
MOVZ	R25, R0, R0
JAL	_Write_Thresholds+0
NOP	
;Sim800.c,982 :: 		,t);
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,981 :: 		" *CRGB:= %s\r\n"
LUI	R2, hi_addr(?lstr_74_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_74_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,980 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,982 :: 		,t);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,984 :: 		SendSMS(6,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 6
JAL	_SendSMS+0
NOP	
;Sim800.c,985 :: 		break;
J	L_TestRecievedSMS166
NOP	
;Sim800.c,986 :: 		case 17:
L_TestRecievedSMS177:
;Sim800.c,987 :: 		SimVars.init_inc = 5;  //Test started
ORI	R2, R0, 5
SB	R2, Offset(_SimVars+1)(GP)
;Sim800.c,988 :: 		T0_SP.sec = T0_SP.min = T0_SP.hr = 0;
SH	R0, Offset(_T0_SP+6)(GP)
SH	R0, Offset(_T0_SP+4)(GP)
SH	R0, Offset(_T0_SP+2)(GP)
;Sim800.c,989 :: 		SendSMS(9,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 9
JAL	_SendSMS+0
NOP	
;Sim800.c,990 :: 		break;
J	L_TestRecievedSMS166
NOP	
;Sim800.c,991 :: 		case 18:
L_TestRecievedSMS178:
;Sim800.c,992 :: 		SimVars.init_inc = 3;  //Test Stopped
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
;Sim800.c,993 :: 		SendSMS(10,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 10
JAL	_SendSMS+0
NOP	
;Sim800.c,994 :: 		break;
J	L_TestRecievedSMS166
NOP	
;Sim800.c,995 :: 		case 19:
L_TestRecievedSMS179:
;Sim800.c,996 :: 		SendSMS(16,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 16
JAL	_SendSMS+0
NOP	
;Sim800.c,997 :: 		break;
J	L_TestRecievedSMS166
NOP	
;Sim800.c,998 :: 		case 20:
L_TestRecievedSMS180:
;Sim800.c,999 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,1000 :: 		break;
J	L_TestRecievedSMS166
NOP	
;Sim800.c,1001 :: 		default:
L_TestRecievedSMS181:
;Sim800.c,1002 :: 		break;
J	L_TestRecievedSMS166
NOP	
;Sim800.c,1003 :: 		}
L_TestRecievedSMS165:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__TestRecievedSMS380
NOP	
J	L_TestRecievedSMS167
NOP	
L__TestRecievedSMS380:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__TestRecievedSMS382
NOP	
J	L_TestRecievedSMS168
NOP	
L__TestRecievedSMS382:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__TestRecievedSMS384
NOP	
J	L_TestRecievedSMS169
NOP	
L__TestRecievedSMS384:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__TestRecievedSMS386
NOP	
J	L_TestRecievedSMS170
NOP	
L__TestRecievedSMS386:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__TestRecievedSMS388
NOP	
J	L_TestRecievedSMS171
NOP	
L__TestRecievedSMS388:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__TestRecievedSMS390
NOP	
J	L_TestRecievedSMS172
NOP	
L__TestRecievedSMS390:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__TestRecievedSMS392
NOP	
J	L_TestRecievedSMS173
NOP	
L__TestRecievedSMS392:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__TestRecievedSMS394
NOP	
J	L_TestRecievedSMS174
NOP	
L__TestRecievedSMS394:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__TestRecievedSMS396
NOP	
J	L_TestRecievedSMS175
NOP	
L__TestRecievedSMS396:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__TestRecievedSMS398
NOP	
J	L_TestRecievedSMS177
NOP	
L__TestRecievedSMS398:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__TestRecievedSMS400
NOP	
J	L_TestRecievedSMS178
NOP	
L__TestRecievedSMS400:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L__TestRecievedSMS402
NOP	
J	L_TestRecievedSMS179
NOP	
L__TestRecievedSMS402:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__TestRecievedSMS404
NOP	
J	L_TestRecievedSMS180
NOP	
L__TestRecievedSMS404:
J	L_TestRecievedSMS181
NOP	
L_TestRecievedSMS166:
;Sim800.c,1005 :: 		}
L_end_TestRecievedSMS:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _TestRecievedSMS
_RemoveSMSText:
;Sim800.c,1011 :: 		int RemoveSMSText(int sms_cnt){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,1014 :: 		sprintf(sms,"%d",sms_cnt);
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
;Sim800.c,1017 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,1016 :: 		" *num_strs:= %s\r\n"
LUI	R2, hi_addr(?lstr_76_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_76_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,1015 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1017 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 4(SP)
;Sim800.c,1019 :: 		do{
L_RemoveSMSText182:
;Sim800.c,1020 :: 		sprintf(sms,"%d",sms_cnt);
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
;Sim800.c,1021 :: 		UART2_Write_Text("AT+CMGD=");
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
;Sim800.c,1022 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1023 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1024 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1027 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LH	R25, 4(SP)
;Sim800.c,1028 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_RemoveSMSText185:
ADDIU	R24, R24, -1
BNE	R24, R0, L_RemoveSMSText185
NOP	
;Sim800.c,1029 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,1030 :: 		sms_cnt--;
ADDIU	R2, R25, -1
SEH	R25, R2
;Sim800.c,1031 :: 		}while(sms_cnt > 0);
SEH	R2, R2
SLTI	R2, R2, 1
BNE	R2, R0, L__RemoveSMSText406
NOP	
J	L_RemoveSMSText182
NOP	
L__RemoveSMSText406:
;Sim800.c,1033 :: 		return sms_cnt;
SEH	R2, R25
;Sim800.c,1034 :: 		}
L_end_RemoveSMSText:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _RemoveSMSText
_Test_Update_ThingSpeak:
;Sim800.c,1040 :: 		int Test_Update_ThingSpeak(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,1042 :: 		TCS3472_getRawData(RawData);
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,1043 :: 		GetScaledValues(RawData,FltData);
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_GetScaledValues+0
NOP	
;Sim800.c,1044 :: 		FltData[3] = TCS3472_CalcHue(FltData);
LUI	R25, hi_addr(_FltData+0)
ORI	R25, R25, lo_addr(_FltData+0)
JAL	_TCS3472_CalcHue+0
NOP	
SW	R2, Offset(_FltData+12)(GP)
;Sim800.c,1045 :: 		SendData(RawData,FltData);
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,1046 :: 		return 2;
ORI	R2, R0, 2
;Sim800.c,1047 :: 		}
;Sim800.c,1046 :: 		return 2;
;Sim800.c,1047 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,1052 :: 		void SendData(unsigned int* rgbc,float* rgbh){
ADDIU	SP, SP, -412
SW	RA, 0(SP)
;Sim800.c,1056 :: 		memset(_str_,0,sizeof(_str_));
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R2, SP, 24
SW	R26, 16(SP)
SW	R25, 20(SP)
ORI	R27, R0, 200
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LW	R25, 20(SP)
;Sim800.c,1058 :: 		sprintf(txtC,"%u",rgbc[0]);
LHU	R2, 0(R25)
SW	R25, 20(SP)
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
LW	R25, 20(SP)
;Sim800.c,1059 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
SW	R25, 20(SP)
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
LW	R25, 20(SP)
;Sim800.c,1060 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
SW	R25, 20(SP)
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
LW	R25, 20(SP)
;Sim800.c,1061 :: 		sprintf(txtB,"%u",rgbc[3]);
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
LW	R26, 16(SP)
;Sim800.c,1062 :: 		sprintf(txtR_Scl,"%3.2f",rgbh[0]);
LW	R2, 0(R26)
SW	R26, 16(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_83_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_83_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR_Scl+0)
ORI	R2, R2, lo_addr(_txtR_Scl+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R26, 16(SP)
;Sim800.c,1063 :: 		sprintf(txtG_Scl,"%3.2f",rgbh[1]);
ADDIU	R2, R26, 4
LW	R2, 0(R2)
SW	R26, 16(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_84_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_84_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtG_Scl+0)
ORI	R2, R2, lo_addr(_txtG_Scl+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R26, 16(SP)
;Sim800.c,1064 :: 		sprintf(txtB_Scl,"%3.2f",rgbh[2]);
ADDIU	R2, R26, 8
LW	R2, 0(R2)
SW	R26, 16(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_85_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_85_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtB_Scl+0)
ORI	R2, R2, lo_addr(_txtB_Scl+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R26, 16(SP)
;Sim800.c,1065 :: 		sprintf(txtHUE  ,"%3.2f",rgbh[3]);
ADDIU	R2, R26, 12
LW	R2, 0(R2)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_86_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_86_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtHUE+0)
ORI	R2, R2, lo_addr(_txtHUE+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,1069 :: 		strncpy(_str_,str_api,46);//strlen(str_api));
ADDIU	R2, SP, 24
ORI	R27, R0, 46
LUI	R26, hi_addr(_str_api+0)
ORI	R26, R26, lo_addr(_str_api+0)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Sim800.c,1070 :: 		strncat(_str_,SF.WriteAPIKey,strlen(SF.WriteAPIKey));
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_SF+58)
ORI	R26, R26, lo_addr(_SF+58)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1071 :: 		strncat(_str_,field1,strlen(field1));
LUI	R25, hi_addr(_field1+0)
ORI	R25, R25, lo_addr(_field1+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field1+0)
ORI	R26, R26, lo_addr(_field1+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1072 :: 		strncat(_str_,txtC,strlen(txtC));
LUI	R25, hi_addr(_txtC+0)
ORI	R25, R25, lo_addr(_txtC+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtC+0)
ORI	R26, R26, lo_addr(_txtC+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1073 :: 		strncat(_str_,field2,strlen(field2));
LUI	R25, hi_addr(_field2+0)
ORI	R25, R25, lo_addr(_field2+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field2+0)
ORI	R26, R26, lo_addr(_field2+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1074 :: 		strncat(_str_,txtR,strlen(txtR));
LUI	R25, hi_addr(_txtR+0)
ORI	R25, R25, lo_addr(_txtR+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtR+0)
ORI	R26, R26, lo_addr(_txtR+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1075 :: 		strncat(_str_,field3,strlen(field3));
LUI	R25, hi_addr(_field3+0)
ORI	R25, R25, lo_addr(_field3+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field3+0)
ORI	R26, R26, lo_addr(_field3+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1076 :: 		strncat(_str_,txtG,strlen(txtG));
LUI	R25, hi_addr(_txtG+0)
ORI	R25, R25, lo_addr(_txtG+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtG+0)
ORI	R26, R26, lo_addr(_txtG+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1077 :: 		strncat(_str_,field4,strlen(field4));
LUI	R25, hi_addr(_field4+0)
ORI	R25, R25, lo_addr(_field4+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field4+0)
ORI	R26, R26, lo_addr(_field4+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1078 :: 		strncat(_str_,txtB,strlen(txtB));
LUI	R25, hi_addr(_txtB+0)
ORI	R25, R25, lo_addr(_txtB+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtB+0)
ORI	R26, R26, lo_addr(_txtB+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1080 :: 		strncat(_str_,field5,strlen(field5));
LUI	R25, hi_addr(_field5+0)
ORI	R25, R25, lo_addr(_field5+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field5+0)
ORI	R26, R26, lo_addr(_field5+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1081 :: 		strncat(_str_,txtR_Scl,strlen(txtR_Scl));
LUI	R25, hi_addr(_txtR_Scl+0)
ORI	R25, R25, lo_addr(_txtR_Scl+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtR_Scl+0)
ORI	R26, R26, lo_addr(_txtR_Scl+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1082 :: 		strncat(_str_,field6,strlen(field6));
LUI	R25, hi_addr(_field6+0)
ORI	R25, R25, lo_addr(_field6+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field6+0)
ORI	R26, R26, lo_addr(_field6+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1083 :: 		strncat(_str_,txtG_Scl,strlen(txtG_Scl));
LUI	R25, hi_addr(_txtG_Scl+0)
ORI	R25, R25, lo_addr(_txtG_Scl+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtG_Scl+0)
ORI	R26, R26, lo_addr(_txtG_Scl+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1084 :: 		strncat(_str_,field7,strlen(field7));
LUI	R25, hi_addr(_field7+0)
ORI	R25, R25, lo_addr(_field7+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field7+0)
ORI	R26, R26, lo_addr(_field7+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1085 :: 		strncat(_str_,txtB_Scl,strlen(txtB_Scl));
LUI	R25, hi_addr(_txtB_Scl+0)
ORI	R25, R25, lo_addr(_txtB_Scl+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtB_Scl+0)
ORI	R26, R26, lo_addr(_txtB_Scl+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1086 :: 		strncat(_str_,field8,strlen(field8));
LUI	R25, hi_addr(_field8+0)
ORI	R25, R25, lo_addr(_field8+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_field8+0)
ORI	R26, R26, lo_addr(_field8+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1087 :: 		strncat(_str_,txtHUE,strlen(txtHUE));
LUI	R25, hi_addr(_txtHUE+0)
ORI	R25, R25, lo_addr(_txtHUE+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 24
SEH	R27, R2
LUI	R26, hi_addr(_txtHUE+0)
ORI	R26, R26, lo_addr(_txtHUE+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1092 :: 		,_str_);
ADDIU	R2, SP, 24
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,1091 :: 		" *    %s\r\n"
LUI	R2, hi_addr(?lstr_87_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_87_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,1090 :: 		PrintOut(PrintHandler, "String for ThingSpeak: \r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1092 :: 		,_str_);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,1094 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 224
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr88_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr88_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 224
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1095 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1096 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1097 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1098 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SendData187:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData187
NOP	
NOP	
NOP	
;Sim800.c,1100 :: 		UART2_Write_Text("AT+CPIN?");
ADDIU	R23, SP, 235
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr89_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr89_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 235
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1101 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1102 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1103 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1104 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData189:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData189
NOP	
NOP	
;Sim800.c,1105 :: 		UART2_Write_Text("AT+CREG?");
ADDIU	R23, SP, 244
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr90_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr90_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 244
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1106 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1107 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1108 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1109 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData191:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData191
NOP	
NOP	
;Sim800.c,1110 :: 		UART2_Write_Text("AT+CGATT?");
ADDIU	R23, SP, 253
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr91_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr91_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 253
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1111 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1112 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1113 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1114 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData193:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData193
NOP	
NOP	
;Sim800.c,1115 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 263
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr92_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr92_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 263
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1116 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1117 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1118 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1119 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData195:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData195
NOP	
NOP	
;Sim800.c,1120 :: 		UART2_Write_Text("AT+CIPSTATUS");
ADDIU	R23, SP, 274
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr93_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr93_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 274
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1121 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1122 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1123 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1124 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData197:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData197
NOP	
NOP	
;Sim800.c,1125 :: 		UART2_Write_Text("AT+CIPMUX=0");
ADDIU	R23, SP, 287
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr94_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr94_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 287
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1126 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1127 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1128 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1129 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData199:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData199
NOP	
NOP	
;Sim800.c,1130 :: 		UART2_Write_Text("AT+CSTT=");//\"data.uk\",\"user\",\"one2one\"");
ADDIU	R23, SP, 299
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr95_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr95_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 299
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1131 :: 		UART2_Write_Text(SF.APN);
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1132 :: 		UART2_Write_Text(",\"user\",");
ADDIU	R23, SP, 308
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr96_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr96_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 308
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1133 :: 		UART2_Write_Text(SF.PWD);
LUI	R25, hi_addr(_SF+118)
ORI	R25, R25, lo_addr(_SF+118)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1134 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1135 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1136 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1137 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData201:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData201
NOP	
NOP	
;Sim800.c,1138 :: 		UART2_Write_Text("AT+CIICR");
ADDIU	R23, SP, 317
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr97_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr97_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 317
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1139 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1140 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1141 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1142 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData203:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData203
NOP	
NOP	
;Sim800.c,1143 :: 		UART2_Write_Text("AT+CIFSR");
ADDIU	R23, SP, 326
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr98_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr98_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 326
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1144 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1145 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1146 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData205:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData205
NOP	
;Sim800.c,1147 :: 		UART2_Write_Text("AT+CIPSPRT=1");
ADDIU	R23, SP, 335
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr99_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr99_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 335
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1148 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1149 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1150 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1151 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData207:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData207
NOP	
NOP	
;Sim800.c,1152 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
ADDIU	R23, SP, 348
ADDIU	R22, R23, 42
LUI	R24, hi_addr(?ICS?lstr100_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr100_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 348
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1153 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1154 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1155 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1156 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData209:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData209
NOP	
;Sim800.c,1157 :: 		UART2_Write_Text("AT+CIPSEND");
ADDIU	R23, SP, 390
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr101_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr101_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 390
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1158 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1159 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1160 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData211:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData211
NOP	
;Sim800.c,1161 :: 		UART2_Write_Text(_str_);
ADDIU	R2, SP, 24
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1162 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1163 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1164 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1165 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1166 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,1167 :: 		TestForOK(1);
ORI	R25, R0, 1
JAL	_TestForOK+0
NOP	
;Sim800.c,1168 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData213:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData213
NOP	
NOP	
NOP	
;Sim800.c,1169 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 401
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr102_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr102_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 401
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1170 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1171 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1172 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1173 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData215:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData215
NOP	
NOP	
NOP	
;Sim800.c,1176 :: 		}
L_end_SendData:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 412
JR	RA
NOP	
; end of _SendData
_SignalStrength:
;Sim800.c,1181 :: 		int  SignalStrength(){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Sim800.c,1185 :: 		UART2_Write_Text("AT+CSQ");
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R30, R0, 65
SB	R30, 18(SP)
ORI	R30, R0, 84
SB	R30, 19(SP)
ORI	R30, R0, 43
SB	R30, 20(SP)
ORI	R30, R0, 67
SB	R30, 21(SP)
ORI	R30, R0, 83
SB	R30, 22(SP)
ORI	R30, R0, 81
SB	R30, 23(SP)
MOVZ	R30, R0, R0
SB	R30, 24(SP)
ADDIU	R2, SP, 18
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1186 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1187 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1188 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,1189 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,1190 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SignalStrength217:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SignalStrength217
NOP	
NOP	
;Sim800.c,1194 :: 		"**Signal Strength** \r\n");
LUI	R2, hi_addr(?lstr_104_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_104_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,1193 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1194 :: 		"**Signal Strength** \r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,1199 :: 		num_strs = strsplit(SimTestTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
SH	R2, 16(SP)
;Sim800.c,1201 :: 		strncpy(string[0],RemoveChars(string[0],':','\0'),2);
MOVZ	R27, R0, R0
ORI	R26, R0, 58
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_RemoveChars+0
NOP	
ORI	R27, R0, 2
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_strncpy+0
NOP	
;Sim800.c,1203 :: 		strncpy(string[1], RemoveChars(string[1],0x02,'O'),2);
ORI	R27, R0, 79
ORI	R26, R0, 2
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_RemoveChars+0
NOP	
ORI	R27, R0, 2
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strncpy+0
NOP	
;Sim800.c,1204 :: 		is_digit = isdigit(string[0][1]);
LBU	R25, Offset(_string+1)(GP)
JAL	_isdigit+0
NOP	
; is_digit start address is: 84 (R21)
ANDI	R21, R2, 65535
;Sim800.c,1205 :: 		if(is_digit)
BNE	R2, R0, L__SignalStrength411
NOP	
J	L_SignalStrength219
NOP	
L__SignalStrength411:
;Sim800.c,1206 :: 		SimVars.rssi = atoi(string[0]);
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_atoi+0
NOP	
SH	R2, Offset(_SimVars+4)(GP)
J	L_SignalStrength220
NOP	
L_SignalStrength219:
;Sim800.c,1208 :: 		SimVars.rssi = 0;
SH	R0, Offset(_SimVars+4)(GP)
L_SignalStrength220:
;Sim800.c,1210 :: 		sprintf(sms,"%d",num_strs);
LH	R2, 16(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_105_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_105_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,1211 :: 		sprintf(txtA,"%d",is_digit);
ADDIU	SP, SP, -12
SH	R21, 8(SP)
; is_digit end address is: 84 (R21)
LUI	R2, hi_addr(?lstr_106_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_106_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,1212 :: 		sprintf(txtS,"%d",SimVars.rssi);
LH	R2, Offset(_SimVars+4)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_107_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_107_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtS+0)
ORI	R2, R2, lo_addr(_txtS+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,1227 :: 		,string[6],txtA,txtS);
LUI	R2, hi_addr(_txtS+0)
ORI	R2, R2, lo_addr(_txtS+0)
ADDIU	SP, SP, -48
SW	R2, 44(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 36(SP)
;Sim800.c,1226 :: 		,string[4],string[5]
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,1225 :: 		,string[2],string[3]
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,1224 :: 		,sms,string[0],string[1]
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 8(SP)
;Sim800.c,1223 :: 		" *rssi:=     %s\r\n"
LUI	R2, hi_addr(?lstr_108_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_108_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,1213 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1227 :: 		,string[6],txtA,txtS);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 48
;Sim800.c,1230 :: 		return SimVars.rssi;
LH	R2, Offset(_SimVars+4)(GP)
;Sim800.c,1231 :: 		}
;Sim800.c,1230 :: 		return SimVars.rssi;
;Sim800.c,1231 :: 		}
L_end_SignalStrength:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _SignalStrength
_PWM_SigStrength:
;Sim800.c,1236 :: 		void PWM_SigStrength(int sigstrength){
;Sim800.c,1238 :: 		}
L_end_PWM_SigStrength:
JR	RA
NOP	
; end of _PWM_SigStrength
_TestForOK:
;Sim800.c,1243 :: 		void TestForOK(char c){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,1245 :: 		WaitForResponse(1);
SW	R26, 4(SP)
SB	R25, 8(SP)
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,1246 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_TestForOK221:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TestForOK221
NOP	
;Sim800.c,1247 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,1251 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SB	R25, 8(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,1250 :: 		" *    %s\r\n"
LUI	R2, hi_addr(?lstr_109_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_109_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,1249 :: 		PrintOut(PrintHandler, "Test for OK:"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1251 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LBU	R25, 8(SP)
;Sim800.c,1253 :: 		lastMillis = TMR0.millis;
; lastMillis start address is: 16 (R4)
LW	R4, Offset(_TMR0+0)(GP)
;Sim800.c,1254 :: 		if(c == 0)
ANDI	R2, R25, 255
BEQ	R2, R0, L__TestForOK414
NOP	
J	L_TestForOK223
NOP	
L__TestForOK414:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
;Sim800.c,1255 :: 		while(!strstr(SimTestTxt, "OK")){
L_TestForOK224:
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
BEQ	R2, R0, L__TestForOK415
NOP	
J	L_TestForOK225
NOP	
L__TestForOK415:
; lastMillis end address is: 20 (R5)
;Sim800.c,1256 :: 		newMillis = TMR0.millis - lastMillis;
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,1257 :: 		if(newMillis > 5000)
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK416
NOP	
J	L_TestForOK226
NOP	
L__TestForOK416:
; lastMillis end address is: 20 (R5)
;Sim800.c,1258 :: 		break;
J	L_TestForOK225
NOP	
L_TestForOK226:
;Sim800.c,1259 :: 		}
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK224
NOP	
L_TestForOK225:
J	L_TestForOK227
NOP	
L_TestForOK223:
;Sim800.c,1260 :: 		else if(c == 1)
; lastMillis start address is: 16 (R4)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__TestForOK417
NOP	
J	L_TestForOK228
NOP	
L__TestForOK417:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
;Sim800.c,1261 :: 		while(!strstr(SimTestTxt, "CONNECT")){
L_TestForOK229:
; lastMillis start address is: 20 (R5)
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
ADDIU	R23, SP, 12
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr111_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr111_Sim800+0)
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
BEQ	R2, R0, L__TestForOK418
NOP	
J	L_TestForOK230
NOP	
L__TestForOK418:
; lastMillis end address is: 20 (R5)
;Sim800.c,1262 :: 		newMillis = TMR0.millis - lastMillis;
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,1263 :: 		if(newMillis > 5000)
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK419
NOP	
J	L_TestForOK231
NOP	
L__TestForOK419:
; lastMillis end address is: 20 (R5)
;Sim800.c,1264 :: 		break;
J	L_TestForOK230
NOP	
L_TestForOK231:
;Sim800.c,1265 :: 		}
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK229
NOP	
L_TestForOK230:
L_TestForOK228:
L_TestForOK227:
;Sim800.c,1266 :: 		}
L_end_TestForOK:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _TestForOK
