_InitGSM3:
;Sim800.c,84 :: 		void InitGSM3(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,85 :: 		SimVars.initial_str = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R0, Offset(_SimVars+0)(GP)
;Sim800.c,86 :: 		SimVars.init_inc    = 0;
SB	R0, Offset(_SimVars+1)(GP)
;Sim800.c,87 :: 		*SimTestTxt = "Hello World this is a test";
ORI	R2, R0, lo_addr(?lstr_1_Sim800+0)
ANDI	R2, R2, 255
SB	R2, Offset(_SimTestTxt+0)(GP)
;Sim800.c,88 :: 		RB.head = 0;
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,89 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
;Sim800.c,90 :: 		RB.rcv_txt_fin = -1;
ORI	R2, R0, 255
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,91 :: 		memset(SF.SimCelNum,0,sizeof(SF.SimCelNum));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_memset+0
NOP	
;Sim800.c,92 :: 		memset(SF.WriteAPIKey,0,sizeof(SF.WriteAPIKey));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_memset+0
NOP	
;Sim800.c,93 :: 		memset(SF.ReadAPIKey,0,sizeof(SF.ReadAPIKey));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_memset+0
NOP	
;Sim800.c,94 :: 		memset(SF.APN,0,sizeof(SF.APN));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_memset+0
NOP	
;Sim800.c,95 :: 		memset(SF.PWD,0,sizeof(SF.PWD));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_memset+0
NOP	
;Sim800.c,96 :: 		}
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
;Sim800.c,101 :: 		void PwrUpGSM3(){
;Sim800.c,102 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,103 :: 		PWR = 0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,104 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM30
NOP	
;Sim800.c,105 :: 		PWR = 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;Sim800.c,107 :: 		while(STAT){
L_PwrUpGSM32:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrUpGSM3195
NOP	
J	L_PwrUpGSM33
NOP	
L__PwrUpGSM3195:
;Sim800.c,108 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,109 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM34
NOP	
;Sim800.c,110 :: 		}
J	L_PwrUpGSM32
NOP	
L_PwrUpGSM33:
;Sim800.c,111 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM36
NOP	
NOP	
NOP	
;Sim800.c,112 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_WriteToFlashTemp:
;Sim800.c,117 :: 		void WriteToFlashTemp(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,121 :: 		GetStrLengths();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_GetStrLengths+0
NOP	
;Sim800.c,123 :: 		memset(buff,0,512);                  //make every byte NULL
ORI	R27, R0, 512
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_buff+0)
ORI	R25, R25, lo_addr(_buff+0)
JAL	_memset+0
NOP	
;Sim800.c,124 :: 		memcpy(buff,SF.SimCelNum,SL.l1);          //Save Cell num
LH	R27, Offset(_SL+0)(GP)
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
LUI	R25, hi_addr(_buff+0)
ORI	R25, R25, lo_addr(_buff+0)
JAL	_memcpy+0
NOP	
;Sim800.c,125 :: 		memcpy(buff+SL.l1,SF.WriteAPIKey,SL.l2);//Save API Wr Key
LH	R3, Offset(_SL+0)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+2)(GP)
LUI	R26, hi_addr(_SF+38)
ORI	R26, R26, lo_addr(_SF+38)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,126 :: 		memcpy(buff+SL.l1l2,SF.ReadAPIKey,SL.l3); //Save API Rd Key
LH	R3, Offset(_SL+18)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+4)(GP)
LUI	R26, hi_addr(_SF+58)
ORI	R26, R26, lo_addr(_SF+58)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,127 :: 		memcpy(buff+SL.l1l2l3,SF.APN,SL.l4);        //Save APN
LH	R3, Offset(_SL+20)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+6)(GP)
LUI	R26, hi_addr(_SF+78)
ORI	R26, R26, lo_addr(_SF+78)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,128 :: 		memcpy(buff+SL.l1l2l3l4,SF.PWD,SL.l5);        //Save PWD
LH	R3, Offset(_SL+22)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+8)(GP)
LUI	R26, hi_addr(_SF+98)
ORI	R26, R26, lo_addr(_SF+98)
MOVZ	R25, R2, R0
JAL	_memcpy+0
NOP	
;Sim800.c,130 :: 		memcpy(temp,buff,SL.lTotA+4);
LH	R2, Offset(_SL+14)(GP)
ADDIU	R2, R2, 4
SEH	R27, R2
LUI	R26, hi_addr(_buff+0)
ORI	R26, R26, lo_addr(_buff+0)
LUI	R25, hi_addr(_temp+0)
ORI	R25, R25, lo_addr(_temp+0)
JAL	_memcpy+0
NOP	
;Sim800.c,132 :: 		pos = FLASH_Settings_PAddr;
; pos start address is: 12 (R3)
LW	R3, Offset(_FLASH_Settings_PAddr+0)(GP)
;Sim800.c,133 :: 		j = NVMErasePage(pos);
SW	R3, 16(SP)
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R3, 16(SP)
SH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
;Sim800.c,134 :: 		if(j==0){
SEH	R2, R2
BEQ	R2, R0, L__WriteToFlashTemp197
NOP	
J	L_WriteToFlashTemp8
NOP	
L__WriteToFlashTemp197:
;Sim800.c,135 :: 		pos += 20 ;
ADDIU	R2, R3, 20
; pos end address is: 12 (R3)
; pos start address is: 16 (R4)
MOVZ	R4, R2, R0
;Sim800.c,136 :: 		for(i=0;i<100;i++){
SH	R0, Offset(WriteToFlashTemp_i_L0+0)(GP)
; pos end address is: 16 (R4)
L_WriteToFlashTemp9:
; pos start address is: 16 (R4)
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLTI	R2, R2, 100
BNE	R2, R0, L__WriteToFlashTemp198
NOP	
J	L_WriteToFlashTemp10
NOP	
L__WriteToFlashTemp198:
;Sim800.c,137 :: 		j = NVMWriteWord(pos,temp[i]);
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
;Sim800.c,138 :: 		pos += 4;
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
;Sim800.c,139 :: 		Delay_ms(5);
LUI	R24, 2
ORI	R24, R24, 2260
L_WriteToFlashTemp12:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WriteToFlashTemp12
NOP	
NOP	
NOP	
;Sim800.c,136 :: 		for(i=0;i<100;i++){
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
;Sim800.c,140 :: 		}
; pos end address is: 16 (R4)
J	L_WriteToFlashTemp9
NOP	
L_WriteToFlashTemp10:
;Sim800.c,141 :: 		}
L_WriteToFlashTemp8:
;Sim800.c,145 :: 		sprintf(a,"%d",i);
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
;Sim800.c,146 :: 		sprintf(b,"%d",j);
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
;Sim800.c,150 :: 		,a,b);
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 8(SP)
;Sim800.c,149 :: 		" * flash err:   %s\r\n"
LUI	R2, hi_addr(?lstr_4_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_4_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,147 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,150 :: 		,a,b);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
;Sim800.c,152 :: 		}
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
;Sim800.c,157 :: 		char* GetValuesFromFlash(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,160 :: 		GetStrLengths();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_GetStrLengths+0
NOP	
;Sim800.c,161 :: 		ptr = (unsigned char*)FLASH_Settings_VAddr;
LWR	R2, Offset(_FLASH_Settings_VAddr+0)(GP)
LWL	R2, Offset(_FLASH_Settings_VAddr+3)(GP)
SW	R2, Offset(_ptr+0)(GP)
;Sim800.c,162 :: 		ptr += 20;
LW	R2, Offset(_FLASH_Settings_VAddr+0)(GP)
ADDIU	R2, R2, 20
SW	R2, Offset(_ptr+0)(GP)
;Sim800.c,164 :: 		for(i=0;i<SL.lTotA;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_GetValuesFromFlash14:
; i start address is: 16 (R4)
LH	R2, Offset(_SL+14)(GP)
SLTU	R2, R4, R2
BNE	R2, R0, L__GetValuesFromFlash200
NOP	
J	L_GetValuesFromFlash15
NOP	
L__GetValuesFromFlash200:
;Sim800.c,165 :: 		buff[i] = ptr[i];
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R3, R2, R4
LW	R2, Offset(_ptr+0)(GP)
ADDU	R2, R2, R4
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Sim800.c,167 :: 		UART1_Write(buff[i]);
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R4
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,168 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
;Sim800.c,164 :: 		for(i=0;i<SL.lTotA;i++){
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Sim800.c,170 :: 		}
; i end address is: 16 (R4)
J	L_GetValuesFromFlash14
NOP	
L_GetValuesFromFlash15:
;Sim800.c,171 :: 		strncpy(SF.SimCelNum,buff,SL.l1);
LH	R27, Offset(_SL+0)(GP)
LUI	R26, hi_addr(_buff+0)
ORI	R26, R26, lo_addr(_buff+0)
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_strncpy+0
NOP	
;Sim800.c,172 :: 		strncpy(SF.WriteAPIKey,buff+SL.l1,SL.l2);
LH	R3, Offset(_SL+0)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+2)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strncpy+0
NOP	
;Sim800.c,173 :: 		strncpy(SF.ReadAPIKey,buff+SL.l1l2,SL.l3);
LH	R3, Offset(_SL+18)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+4)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_strncpy+0
NOP	
;Sim800.c,174 :: 		strncpy(SF.APN,buff+SL.l1l2l3,SL.l4);
LH	R3, Offset(_SL+20)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+6)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_strncpy+0
NOP	
;Sim800.c,175 :: 		strncpy(SF.PWD,buff+SL.l1l2l3l4,SL.l5);
LH	R3, Offset(_SL+22)(GP)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R3
LH	R27, Offset(_SL+8)(GP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_strncpy+0
NOP	
;Sim800.c,184 :: 		,SF.ReadAPIKey,SF.APN,SF.PWD);
LUI	R2, hi_addr(_SF+98)
ORI	R2, R2, lo_addr(_SF+98)
ADDIU	SP, SP, -28
SW	R2, 24(SP)
LUI	R2, hi_addr(_SF+78)
ORI	R2, R2, lo_addr(_SF+78)
SW	R2, 20(SP)
LUI	R2, hi_addr(_SF+58)
ORI	R2, R2, lo_addr(_SF+58)
SW	R2, 16(SP)
;Sim800.c,183 :: 		,SF.SimCelNum,SF.WriteAPIKey
LUI	R2, hi_addr(_SF+38)
ORI	R2, R2, lo_addr(_SF+38)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
SW	R2, 8(SP)
;Sim800.c,182 :: 		" * SF.PWD:         %s\r\n"
LUI	R2, hi_addr(?lstr_5_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_5_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,177 :: 		PrintOut(PrintHandler, " * Flash Read        \r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,184 :: 		,SF.ReadAPIKey,SF.APN,SF.PWD);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 28
;Sim800.c,186 :: 		return SF.SimCelNum;
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
;Sim800.c,187 :: 		}
;Sim800.c,186 :: 		return SF.SimCelNum;
;Sim800.c,187 :: 		}
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
;Sim800.c,192 :: 		void GetStrLengths(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,194 :: 		SL.l1 = sizeof(SF.SimCelNum)-1;   //len of cell num
ORI	R2, R0, 19
SH	R2, Offset(_SL+0)(GP)
;Sim800.c,195 :: 		SL.l2 = sizeof(SF.WriteAPIKey)-1; //len of API Write key
ORI	R2, R0, 19
SH	R2, Offset(_SL+2)(GP)
;Sim800.c,196 :: 		SL.l3 = sizeof(SF.ReadAPIKey)-1;  //len of API Read Key
ORI	R2, R0, 19
SH	R2, Offset(_SL+4)(GP)
;Sim800.c,197 :: 		SL.l4 = sizeof(SF.APN)-1;         //len of APN
ORI	R2, R0, 19
SH	R2, Offset(_SL+6)(GP)
;Sim800.c,198 :: 		SL.l5 = sizeof(SF.PWD)-1;         //len of PWD
ORI	R2, R0, 19
SH	R2, Offset(_SL+8)(GP)
;Sim800.c,201 :: 		SL.lTotA     = SL.l1 + SL.l2 + SL.l3 + SL.l4 + SL.l5;
ORI	R2, R0, 95
SH	R2, Offset(_SL+14)(GP)
;Sim800.c,202 :: 		SL.l1l2      = SL.l1 + SL.l2;
ORI	R2, R0, 38
SH	R2, Offset(_SL+18)(GP)
;Sim800.c,203 :: 		SL.l1l2l3    = SL.l1l2 + SL.l3;
ORI	R2, R0, 57
SH	R2, Offset(_SL+20)(GP)
;Sim800.c,204 :: 		SL.l1l2l3l4  = SL.l1l2l3 + SL.l4;
ORI	R2, R0, 76
SH	R2, Offset(_SL+22)(GP)
;Sim800.c,206 :: 		SL.mod = SL.lTotA % 4;  //total divisable by 4 = flash Wrd size
ORI	R2, R0, 3
SH	R2, Offset(_SL+16)(GP)
;Sim800.c,207 :: 		SL.mod = 4 - SL.mod;
ORI	R2, R0, 1
SH	R2, Offset(_SL+16)(GP)
;Sim800.c,208 :: 		SL.lTotA += SL.mod;
ORI	R2, R0, 96
SH	R2, Offset(_SL+14)(GP)
;Sim800.c,211 :: 		sprintf(a,"%d",SL.l1);
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
;Sim800.c,212 :: 		sprintf(b,"%d",SL.l2);
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
;Sim800.c,213 :: 		sprintf(c,"%d",SL.l3);
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
;Sim800.c,214 :: 		sprintf(d,"%d",SL.l4);
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
;Sim800.c,215 :: 		sprintf(e,"%d",SL.l5);
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
;Sim800.c,216 :: 		sprintf(f,"%d",SL.lTotA);
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
;Sim800.c,224 :: 		,a,b,c,d,e,f);
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
;Sim800.c,223 :: 		" * lTotA: %s\r\n"
LUI	R2, hi_addr(?lstr_12_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_12_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,217 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,224 :: 		,a,b,c,d,e,f);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,226 :: 		}
L_end_GetStrLengths:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _GetStrLengths
_RcvSimTxt:
;Sim800.c,231 :: 		void RcvSimTxt(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,233 :: 		while(UART2_Data_Ready()) {     // If data is received
L_RcvSimTxt17:
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__RcvSimTxt204
NOP	
J	L_RcvSimTxt18
NOP	
L__RcvSimTxt204:
;Sim800.c,234 :: 		if (U2STAbits.FERR || U2STAbits.OERR){
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__RcvSimTxt205
NOP	
J	L__RcvSimTxt181
NOP	
L__RcvSimTxt205:
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__RcvSimTxt206
NOP	
J	L__RcvSimTxt180
NOP	
L__RcvSimTxt206:
J	L_RcvSimTxt21
NOP	
L__RcvSimTxt181:
L__RcvSimTxt180:
;Sim800.c,235 :: 		if (U2STAbits.FERR ){
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BNE	R2, R0, L__RcvSimTxt208
NOP	
J	L_RcvSimTxt22
NOP	
L__RcvSimTxt208:
;Sim800.c,236 :: 		U2STAbits.FERR = 0;
ORI	R2, R0, 4
SW	R2, Offset(U2STAbits+4)(GP)
;Sim800.c,237 :: 		goto m0;
J	___RcvSimTxt_m0
NOP	
;Sim800.c,238 :: 		}
L_RcvSimTxt22:
;Sim800.c,239 :: 		if(U2STAbits.OERR)
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__RcvSimTxt210
NOP	
J	L_RcvSimTxt23
NOP	
L__RcvSimTxt210:
;Sim800.c,240 :: 		U2STAbits.OERR = 0;
ORI	R2, R0, 2
SW	R2, Offset(U2STAbits+4)(GP)
L_RcvSimTxt23:
;Sim800.c,241 :: 		}
L_RcvSimTxt21:
;Sim800.c,242 :: 		m0:
___RcvSimTxt_m0:
;Sim800.c,243 :: 		txt = U2RXREG;
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Sim800.c,244 :: 		U1TXREG = txt;
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,245 :: 		if(txt >= 0x20){
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt211
NOP	
J	L_RcvSimTxt24
NOP	
L__RcvSimTxt211:
;Sim800.c,246 :: 		RB.buff[RB.head] = txt;
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
SB	R4, 0(R2)
; txt end address is: 16 (R4)
;Sim800.c,247 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,248 :: 		}else if(U2RXREG == 0x0A){
J	L_RcvSimTxt25
NOP	
L_RcvSimTxt24:
LW	R3, Offset(U2RXREG+0)(GP)
ORI	R2, R0, 10
BEQ	R3, R2, L__RcvSimTxt212
NOP	
J	L_RcvSimTxt26
NOP	
L__RcvSimTxt212:
;Sim800.c,249 :: 		RB.buff[RB.head] = ',';
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
ORI	R2, R0, 44
SB	R2, 0(R3)
;Sim800.c,250 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,251 :: 		}
L_RcvSimTxt26:
L_RcvSimTxt25:
;Sim800.c,252 :: 		if(RB.head > 999){
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RcvSimTxt213
NOP	
J	L_RcvSimTxt27
NOP	
L__RcvSimTxt213:
;Sim800.c,253 :: 		RB.head = 0;             //rest head when buffer is full
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,254 :: 		}
L_RcvSimTxt27:
;Sim800.c,255 :: 		}
J	L_RcvSimTxt17
NOP	
L_RcvSimTxt18:
;Sim800.c,256 :: 		RB.rcv_txt_fin = 1;
ORI	R2, R0, 1
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,257 :: 		}
L_end_RcvSimTxt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RcvSimTxt
_TestRingPointers:
;Sim800.c,262 :: 		int TestRingPointers(){
;Sim800.c,264 :: 		if(RB.tail > RB.head){
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__TestRingPointers215
NOP	
J	L_TestRingPointers28
NOP	
L__TestRingPointers215:
;Sim800.c,265 :: 		diff = 1000 - RB.tail;
LHU	R3, Offset(_RB+1004)(GP)
ORI	R2, R0, 1000
SUBU	R3, R2, R3
;Sim800.c,266 :: 		diff += RB.head;
LHU	R2, Offset(_RB+1002)(GP)
ADDU	R2, R3, R2
; diff start address is: 8 (R2)
;Sim800.c,267 :: 		}else{
; diff end address is: 8 (R2)
J	L_TestRingPointers29
NOP	
L_TestRingPointers28:
;Sim800.c,268 :: 		diff = RB.head - RB.tail;
LHU	R3, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SUBU	R2, R2, R3
; diff start address is: 12 (R3)
ANDI	R3, R2, 65535
; diff end address is: 12 (R3)
SEH	R2, R3
;Sim800.c,269 :: 		}
L_TestRingPointers29:
;Sim800.c,270 :: 		return diff;
; diff start address is: 8 (R2)
; diff end address is: 8 (R2)
;Sim800.c,271 :: 		}
L_end_TestRingPointers:
JR	RA
NOP	
; end of _TestRingPointers
_WaitForResponse:
;Sim800.c,276 :: 		void WaitForResponse(short dly){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,278 :: 		lastMillis = TMR0.millis;
; lastMillis start address is: 20 (R5)
LW	R5, Offset(_TMR0+0)(GP)
;Sim800.c,279 :: 		RB.rcv_txt_fin   = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,280 :: 		RB.last_head     = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,281 :: 		do{
J	L_WaitForResponse30
NOP	
L__WaitForResponse182:
;Sim800.c,300 :: 		}while(!RB.rcv_txt_fin);
;Sim800.c,281 :: 		do{
L_WaitForResponse30:
;Sim800.c,282 :: 		LATE3_bit = !LATE3_bit;
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,283 :: 		if(dly == 0)
SEB	R2, R25
BEQ	R2, R0, L__WaitForResponse217
NOP	
J	L_WaitForResponse33
NOP	
L__WaitForResponse217:
; lastMillis end address is: 20 (R5)
;Sim800.c,284 :: 		Delay_ms(100);
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
;Sim800.c,285 :: 		else if(dly == 1)
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForResponse218
NOP	
J	L_WaitForResponse37
NOP	
L__WaitForResponse218:
;Sim800.c,286 :: 		Delay_ms(500);
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
;Sim800.c,287 :: 		else if(dly == 3){
SEB	R3, R25
ORI	R2, R0, 3
BEQ	R3, R2, L__WaitForResponse219
NOP	
J	L_WaitForResponse41
NOP	
L__WaitForResponse219:
;Sim800.c,288 :: 		UART2_Write_Text("ATE0");
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
;Sim800.c,289 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,290 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LB	R25, 4(SP)
;Sim800.c,291 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_WaitForResponse42:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse42
NOP	
NOP	
NOP	
;Sim800.c,292 :: 		}
J	L_WaitForResponse44
NOP	
L_WaitForResponse41:
;Sim800.c,294 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse45:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse45
NOP	
L_WaitForResponse44:
L_WaitForResponse40:
L_WaitForResponse36:
;Sim800.c,297 :: 		newMillis = TMR0.millis - lastMillis;
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,298 :: 		if(newMillis > 25000)
SLTIU	R2, R2, 25001
BEQ	R2, R0, L__WaitForResponse220
NOP	
J	L_WaitForResponse47
NOP	
L__WaitForResponse220:
; lastMillis end address is: 20 (R5)
;Sim800.c,299 :: 		break;
J	L_WaitForResponse31
NOP	
L_WaitForResponse47:
;Sim800.c,300 :: 		}while(!RB.rcv_txt_fin);
; lastMillis start address is: 20 (R5)
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForResponse222
NOP	
J	L__WaitForResponse182
NOP	
L__WaitForResponse222:
; lastMillis end address is: 20 (R5)
L_WaitForResponse31:
;Sim800.c,301 :: 		}
L_end_WaitForResponse:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WaitForResponse
_RingToTempBuf:
;Sim800.c,306 :: 		void RingToTempBuf(){
;Sim800.c,308 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,309 :: 		RB.tail = RB.last_tail;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
; i end address is: 20 (R5)
;Sim800.c,311 :: 		while(RB.tail != RB.head){
L_RingToTempBuf48:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
BNE	R2, R3, L__RingToTempBuf225
NOP	
J	L_RingToTempBuf49
NOP	
L__RingToTempBuf225:
;Sim800.c,312 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,317 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,318 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,319 :: 		if(RB.tail > 999)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RingToTempBuf226
NOP	
J	L_RingToTempBuf50
NOP	
L__RingToTempBuf226:
;Sim800.c,320 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
L_RingToTempBuf50:
;Sim800.c,321 :: 		};
J	L_RingToTempBuf48
NOP	
L_RingToTempBuf49:
;Sim800.c,322 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,324 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,325 :: 		}
L_end_RingToTempBuf:
JR	RA
NOP	
; end of _RingToTempBuf
_SetupIOT:
;Sim800.c,331 :: 		char SetupIOT(){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Sim800.c,341 :: 		" * ATE0\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(?lstr_14_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_14_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,340 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,341 :: 		" * ATE0\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,344 :: 		WaitForResponse(3);
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
;Sim800.c,345 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT51:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT51
NOP	
;Sim800.c,346 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,352 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,351 :: 		" * Check if Sim is Registered\r\n"
LUI	R2, hi_addr(?lstr_15_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_15_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,349 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,352 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,354 :: 		wait:
___SetupIOT_wait:
;Sim800.c,356 :: 		UART2_Write_Text("AT+CREG?");
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
;Sim800.c,357 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,358 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,359 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,360 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT53:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT53
NOP	
NOP	
NOP	
;Sim800.c,361 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,366 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,365 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_17_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_17_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,364 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,366 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,370 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT228
NOP	
J	L_SetupIOT55
NOP	
L__SetupIOT228:
;Sim800.c,372 :: 		num_strs = strsplit(SimTestTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
;Sim800.c,375 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,385 :: 		,string[3],string[4]);
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
;Sim800.c,384 :: 		,string[1],string[2]
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
;Sim800.c,383 :: 		,txtA,string[0]
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,382 :: 		" *string[4]  %s\r\n"
LUI	R2, hi_addr(?lstr_19_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_19_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,376 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,385 :: 		,string[3],string[4]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,387 :: 		str_rcv = findnumber(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
SW	R2, Offset(_str_rcv+0)(GP)
;Sim800.c,388 :: 		res = atoi(str_rcv);  //get the sms rec number
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,389 :: 		if(res == 1){
SEH	R3, R2
ORI	R2, R0, 1
BEQ	R3, R2, L__SetupIOT229
NOP	
J	L_SetupIOT56
NOP	
L__SetupIOT229:
;Sim800.c,391 :: 		sprintf(txtA,"%d",res);
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
;Sim800.c,394 :: 		,txtA);
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,393 :: 		" *Registered with:= %s\r\n"
LUI	R2, hi_addr(?lstr_21_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_21_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,392 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,394 :: 		,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,397 :: 		}else{
J	L_SetupIOT57
NOP	
L_SetupIOT56:
;Sim800.c,400 :: 		" *Sim Not Registered\r\n");
LUI	R2, hi_addr(?lstr_22_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_22_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,399 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,400 :: 		" *Sim Not Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,402 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT58:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT58
NOP	
NOP	
NOP	
;Sim800.c,403 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,404 :: 		}
L_SetupIOT57:
;Sim800.c,405 :: 		}
L_SetupIOT55:
;Sim800.c,408 :: 		" *Sim Registered\r\n");
LUI	R2, hi_addr(?lstr_23_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_23_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,407 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,408 :: 		" *Sim Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,412 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,413 :: 		}
;Sim800.c,412 :: 		return 1;
;Sim800.c,413 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,420 :: 		char WaitForSetupSMS(unsigned int Indx){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Sim800.c,425 :: 		UART2_Write_Text("AT+CMGF=1");
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
;Sim800.c,426 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,427 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,430 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,431 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,433 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS60:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS60
NOP	
;Sim800.c,435 :: 		WaitForResponse(0);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,436 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS62:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS62
NOP	
;Sim800.c,437 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,439 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 84 (R21)
SEH	R21, R2
;Sim800.c,442 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,443 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,454 :: 		string[4],string[5]);
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,453 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,452 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,451 :: 		" *string[5]  %s\r\n"
LUI	R2, hi_addr(?lstr_27_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_27_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,444 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,454 :: 		string[4],string[5]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
;Sim800.c,457 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 14(SP)
;Sim800.c,458 :: 		sprintf(sms,"%d",res);
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
;Sim800.c,462 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,461 :: 		" *sms no:= %s\r\n"
LUI	R2, hi_addr(?lstr_29_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_29_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,460 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,462 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,466 :: 		UART2_Write_Text("AT+CMGR=");
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
;Sim800.c,467 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,468 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,469 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,471 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,472 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS64:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS64
NOP	
;Sim800.c,473 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,475 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
;Sim800.c,477 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,493 :: 		,string[8]);
LUI	R2, hi_addr(_string+512)
ORI	R2, R2, lo_addr(_string+512)
ADDIU	SP, SP, -48
SW	R2, 44(SP)
;Sim800.c,492 :: 		,string[6],string[7]
LUI	R2, hi_addr(_string+448)
ORI	R2, R2, lo_addr(_string+448)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 36(SP)
;Sim800.c,491 :: 		,string[4],string[5]
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,490 :: 		,string[2],string[3]
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,489 :: 		,txtA,string[0],string[1]
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,488 :: 		" *string[8]  %s\r\n"
LUI	R2, hi_addr(?lstr_32_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_32_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,478 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,493 :: 		,string[8]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 48
LHU	R25, 12(SP)
;Sim800.c,496 :: 		if(Indx == 0){
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS231
NOP	
J	L_WaitForSetupSMS66
NOP	
L__WaitForSetupSMS231:
;Sim800.c,498 :: 		strncpy(SF.SimCelNum,string[1],strlen(string[1])+11);
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
;Sim800.c,499 :: 		strncpy(SF.SimDate,string[3],strlen(string[3])+1);
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
;Sim800.c,500 :: 		strncpy(SF.SimTime,string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+9)
ORI	R25, R25, lo_addr(_SF+9)
JAL	_strncpy+0
NOP	
;Sim800.c,507 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
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
;Sim800.c,506 :: 		" * SF.SimTime: %s\r\n"
LUI	R2, hi_addr(?lstr_33_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_33_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,503 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,507 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,509 :: 		}else if(Indx == 1){
J	L_WaitForSetupSMS67
NOP	
L_WaitForSetupSMS66:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS232
NOP	
J	L_WaitForSetupSMS68
NOP	
L__WaitForSetupSMS232:
;Sim800.c,511 :: 		strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);
SH	R25, 12(SP)
LUI	R25, hi_addr(_string+320)
ORI	R25, R25, lo_addr(_string+320)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_strncpy+0
NOP	
;Sim800.c,514 :: 		strncpy(SF.ReadAPIKey,string[6],strlen(string[6])+1);
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+384)
ORI	R26, R26, lo_addr(_string+384)
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_strncpy+0
NOP	
;Sim800.c,517 :: 		strncpy(SF.APN,string[7],strlen(string[7])+1);
LUI	R25, hi_addr(_string+448)
ORI	R25, R25, lo_addr(_string+448)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+448)
ORI	R26, R26, lo_addr(_string+448)
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_strncpy+0
NOP	
;Sim800.c,520 :: 		strncpy(SF.PWD,string[8],strlen(string[8])+1);
LUI	R25, hi_addr(_string+512)
ORI	R25, R25, lo_addr(_string+512)
JAL	_strlen+0
NOP	
ADDIU	R2, R2, 1
SEH	R27, R2
LUI	R26, hi_addr(_string+512)
ORI	R26, R26, lo_addr(_string+512)
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_strncpy+0
NOP	
;Sim800.c,529 :: 		,SF.APN,SF.PWD);
LUI	R2, hi_addr(_SF+98)
ORI	R2, R2, lo_addr(_SF+98)
ADDIU	SP, SP, -24
SW	R2, 20(SP)
LUI	R2, hi_addr(_SF+78)
ORI	R2, R2, lo_addr(_SF+78)
SW	R2, 16(SP)
;Sim800.c,528 :: 		,SF.WriteAPIKey,SF.ReadAPIKey
LUI	R2, hi_addr(_SF+58)
ORI	R2, R2, lo_addr(_SF+58)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+38)
ORI	R2, R2, lo_addr(_SF+38)
SW	R2, 8(SP)
;Sim800.c,527 :: 		" * SF.PWD:         %s\r\n"
LUI	R2, hi_addr(?lstr_34_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_34_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,523 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,529 :: 		,SF.APN,SF.PWD);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 24
LHU	R25, 12(SP)
;Sim800.c,532 :: 		}
L_WaitForSetupSMS68:
L_WaitForSetupSMS67:
;Sim800.c,535 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS69:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS69
NOP	
NOP	
NOP	
;Sim800.c,536 :: 		RemoveSMSText(res);
SH	R25, 12(SP)
LH	R25, 14(SP)
JAL	_RemoveSMSText+0
NOP	
;Sim800.c,537 :: 		res = strcmp(SimTestTxt,"OK,");
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
;Sim800.c,538 :: 		sprintf(txtA,"%d",res);
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
;Sim800.c,544 :: 		,SimTestTxt,str_rcv,txtA);
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
ADDIU	SP, SP, -20
SW	R2, 16(SP)
LW	R2, Offset(_str_rcv+0)(GP)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SW	R2, 8(SP)
;Sim800.c,543 :: 		" * OK-0: %s\r\n"
LUI	R2, hi_addr(?lstr_37_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_37_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,540 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,544 :: 		,SimTestTxt,str_rcv,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,547 :: 		if((res == 0)&&(Indx == 1)){
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS233
NOP	
J	L__WaitForSetupSMS186
NOP	
L__WaitForSetupSMS233:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS234
NOP	
J	L__WaitForSetupSMS185
NOP	
L__WaitForSetupSMS234:
L__WaitForSetupSMS184:
;Sim800.c,548 :: 		WriteToFlashTemp();
JAL	_WriteToFlashTemp+0
NOP	
;Sim800.c,549 :: 		return 3;
ORI	R2, R0, 3
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,547 :: 		if((res == 0)&&(Indx == 1)){
L__WaitForSetupSMS186:
L__WaitForSetupSMS185:
;Sim800.c,551 :: 		else if ((res == 0)&&(Indx == 0))
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS235
NOP	
J	L__WaitForSetupSMS188
NOP	
L__WaitForSetupSMS235:
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS236
NOP	
J	L__WaitForSetupSMS187
NOP	
L__WaitForSetupSMS236:
L__WaitForSetupSMS183:
;Sim800.c,552 :: 		return 2;
ORI	R2, R0, 2
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,551 :: 		else if ((res == 0)&&(Indx == 0))
L__WaitForSetupSMS188:
L__WaitForSetupSMS187:
;Sim800.c,554 :: 		return res;
LH	R2, 14(SP)
;Sim800.c,555 :: 		}
;Sim800.c,554 :: 		return res;
;Sim800.c,555 :: 		}
L_end_WaitForSetupSMS:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _WaitForSetupSMS
_AT_Initial:
;Sim800.c,561 :: 		void AT_Initial(){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Sim800.c,564 :: 		UART2_Write_Text("AT&W+CNMI=2,1,0,0,0");
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
;Sim800.c,565 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,566 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,569 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,570 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_AT_Initial79:
ADDIU	R24, R24, -1
BNE	R24, R0, L_AT_Initial79
NOP	
;Sim800.c,571 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,572 :: 		}
L_end_AT_Initial:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _AT_Initial
_GetAPI_Key_SMS:
;Sim800.c,577 :: 		char GetAPI_Key_SMS(){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Sim800.c,582 :: 		UART2_Write_Text("AT+CMGS=");
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
;Sim800.c,583 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,584 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,585 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,588 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,589 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,590 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_GetAPI_Key_SMS81:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetAPI_Key_SMS81
NOP	
NOP	
NOP	
;Sim800.c,594 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,593 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_40_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_40_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,592 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,594 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,597 :: 		UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
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
;Sim800.c,598 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,599 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,600 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,602 :: 		response = WaitForSetupSMS(1);
ORI	R25, R0, 1
JAL	_WaitForSetupSMS+0
NOP	
;Sim800.c,604 :: 		return response;
;Sim800.c,605 :: 		}
;Sim800.c,604 :: 		return response;
;Sim800.c,605 :: 		}
L_end_GetAPI_Key_SMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _GetAPI_Key_SMS
_SendSMS:
;Sim800.c,610 :: 		char SendSMS(char sms_type,char cellNum){
ADDIU	SP, SP, -368
SW	RA, 0(SP)
;Sim800.c,615 :: 		if(!cellNum)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
BEQ	R26, R0, L__SendSMS240
NOP	
J	L_SendSMS83
NOP	
L__SendSMS240:
;Sim800.c,616 :: 		strcpy(tempCellNum,string[1]);
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
;Sim800.c,618 :: 		strcpy(tempCellNum,SF.SimCelNum);
ADDIU	R2, SP, 81
SB	R25, 16(SP)
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LBU	R25, 16(SP)
L_SendSMS84:
;Sim800.c,620 :: 		if(!onecA){
LB	R2, Offset(SendSMS_onecA_L0+0)(GP)
BEQ	R2, R0, L__SendSMS241
NOP	
J	L_SendSMS85
NOP	
L__SendSMS241:
;Sim800.c,621 :: 		onecA = 1;
ORI	R2, R0, 1
SB	R2, Offset(SendSMS_onecA_L0+0)(GP)
;Sim800.c,622 :: 		AT_Initial();
JAL	_AT_Initial+0
NOP	
;Sim800.c,623 :: 		}
L_SendSMS85:
;Sim800.c,625 :: 		UART2_Write_Text("AT+CMGF=1");
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
;Sim800.c,626 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,627 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,628 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS86:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS86
NOP	
;Sim800.c,629 :: 		UART2_Write_Text("AT+CMGS=");
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
;Sim800.c,630 :: 		UART2_Write_Text(tempCellNum);//SF.SimCelNum);
ADDIU	R2, SP, 81
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,631 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,632 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 16(SP)
;Sim800.c,633 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS88:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS88
NOP	
NOP	
NOP	
;Sim800.c,634 :: 		switch(sms_type){
J	L_SendSMS90
NOP	
;Sim800.c,635 :: 		case 0:
L_SendSMS92:
;Sim800.c,636 :: 		UART2_Write_Text("ERROR in setup Power down and start again!");
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
;Sim800.c,637 :: 		break;
J	L_SendSMS91
NOP	
;Sim800.c,638 :: 		case 1:
L_SendSMS93:
;Sim800.c,639 :: 		UART2_Write_Text("Reply WebSite");
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
;Sim800.c,640 :: 		break;
J	L_SendSMS91
NOP	
;Sim800.c,641 :: 		case 2:
L_SendSMS94:
;Sim800.c,642 :: 		UART2_Write_Text("Reply API Key");
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
;Sim800.c,643 :: 		break;
J	L_SendSMS91
NOP	
;Sim800.c,644 :: 		case 3:
L_SendSMS95:
;Sim800.c,645 :: 		UART2_Write_Text("Setup Complete!");
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
;Sim800.c,646 :: 		break;
J	L_SendSMS91
NOP	
;Sim800.c,647 :: 		case 4:
L_SendSMS96:
;Sim800.c,648 :: 		UART2_Write_Text("Device Powered up!");
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
;Sim800.c,649 :: 		break;
J	L_SendSMS91
NOP	
;Sim800.c,650 :: 		case 5:
L_SendSMS97:
;Sim800.c,651 :: 		UART2_Write_Text("SMS Not recieved!");
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
;Sim800.c,652 :: 		break;
J	L_SendSMS91
NOP	
;Sim800.c,653 :: 		case 6: //read the set points
L_SendSMS98:
;Sim800.c,654 :: 		str = Read_Thresholds();
JAL	_Read_Thresholds+0
NOP	
SW	R2, Offset(_str+0)(GP)
;Sim800.c,655 :: 		strncpy(b,str,strlen(str)-4);
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, R2, -4
ADDIU	R2, SP, 17
SEH	R27, R3
LW	R26, Offset(_str+0)(GP)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Sim800.c,656 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,657 :: 		break;
J	L_SendSMS91
NOP	
;Sim800.c,658 :: 		case 7: //read raw values
L_SendSMS99:
;Sim800.c,659 :: 		str = Read_Send_AllColour(0);
MOVZ	R25, R0, R0
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, Offset(_str+0)(GP)
;Sim800.c,660 :: 		strncpy(b,str,strlen(str));
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 17
SEH	R27, R2
LW	R26, Offset(_str+0)(GP)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Sim800.c,661 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,662 :: 		break;
J	L_SendSMS91
NOP	
;Sim800.c,663 :: 		case 8: //read scaled values
L_SendSMS100:
;Sim800.c,664 :: 		str = Read_Send_AllColour(1);
ORI	R25, R0, 1
JAL	_Read_Send_AllColour+0
NOP	
SW	R2, Offset(_str+0)(GP)
;Sim800.c,665 :: 		strncpy(b,str,strlen(str));
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 17
SEH	R27, R2
LW	R26, Offset(_str+0)(GP)
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Sim800.c,666 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,667 :: 		break;
J	L_SendSMS91
NOP	
;Sim800.c,668 :: 		case 9:
L_SendSMS101:
;Sim800.c,669 :: 		UART2_Write_Text("Test Started!");
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
;Sim800.c,670 :: 		break;
J	L_SendSMS91
NOP	
;Sim800.c,671 :: 		case 10:
L_SendSMS102:
;Sim800.c,672 :: 		UART2_Write_Text("Test Stopped!");
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
;Sim800.c,673 :: 		break;
J	L_SendSMS91
NOP	
;Sim800.c,674 :: 		case 11:
L_SendSMS103:
;Sim800.c,675 :: 		UART2_Write_Text("You are not permitted To set the Threshold contact the supplier!");
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
;Sim800.c,676 :: 		break;
J	L_SendSMS91
NOP	
;Sim800.c,677 :: 		default:
L_SendSMS104:
;Sim800.c,678 :: 		UART2_Write_Text("Error Power cycle the device!");
ADDIU	R23, SP, 337
ADDIU	R22, R23, 30
LUI	R24, hi_addr(?ICS?lstr53_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr53_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 337
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,679 :: 		break;
J	L_SendSMS91
NOP	
;Sim800.c,680 :: 		}
L_SendSMS90:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS243
NOP	
J	L_SendSMS92
NOP	
L__SendSMS243:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS245
NOP	
J	L_SendSMS93
NOP	
L__SendSMS245:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS247
NOP	
J	L_SendSMS94
NOP	
L__SendSMS247:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__SendSMS249
NOP	
J	L_SendSMS95
NOP	
L__SendSMS249:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__SendSMS251
NOP	
J	L_SendSMS96
NOP	
L__SendSMS251:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__SendSMS253
NOP	
J	L_SendSMS97
NOP	
L__SendSMS253:
ANDI	R3, R25, 255
ORI	R2, R0, 6
BNE	R3, R2, L__SendSMS255
NOP	
J	L_SendSMS98
NOP	
L__SendSMS255:
ANDI	R3, R25, 255
ORI	R2, R0, 7
BNE	R3, R2, L__SendSMS257
NOP	
J	L_SendSMS99
NOP	
L__SendSMS257:
ANDI	R3, R25, 255
ORI	R2, R0, 8
BNE	R3, R2, L__SendSMS259
NOP	
J	L_SendSMS100
NOP	
L__SendSMS259:
ANDI	R3, R25, 255
ORI	R2, R0, 9
BNE	R3, R2, L__SendSMS261
NOP	
J	L_SendSMS101
NOP	
L__SendSMS261:
ANDI	R3, R25, 255
ORI	R2, R0, 10
BNE	R3, R2, L__SendSMS263
NOP	
J	L_SendSMS102
NOP	
L__SendSMS263:
ANDI	R3, R25, 255
ORI	R2, R0, 11
BNE	R3, R2, L__SendSMS265
NOP	
J	L_SendSMS103
NOP	
L__SendSMS265:
J	L_SendSMS104
NOP	
L_SendSMS91:
;Sim800.c,681 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,682 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,683 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,684 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendSMS105:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS105
NOP	
NOP	
NOP	
;Sim800.c,686 :: 		}
L_end_SendSMS:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 368
JR	RA
NOP	
; end of _SendSMS
_GetSMSText:
;Sim800.c,691 :: 		char* GetSMSText(){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Sim800.c,694 :: 		UART1_Write_Text("=================\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R23, SP, 20
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr54_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr54_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,695 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,699 :: 		num_strs = strsplit(SimTestTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 20 (R5)
SEH	R5, R2
;Sim800.c,701 :: 		err = strncmp(sms_test,string[0],4);
ORI	R27, R0, 4
LUI	R26, hi_addr(_string+0)
ORI	R26, R26, lo_addr(_string+0)
LUI	R25, hi_addr(_sms_test+0)
ORI	R25, R25, lo_addr(_sms_test+0)
JAL	_strncmp+0
NOP	
SH	R2, 18(SP)
;Sim800.c,703 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	SP, SP, -12
SH	R5, 8(SP)
; num_strs end address is: 20 (R5)
LUI	R2, hi_addr(?lstr_55_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_55_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,704 :: 		sprintf(txtB,"%d",err);
LH	R2, 18(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_56_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_56_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtB+0)
ORI	R2, R2, lo_addr(_txtB+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,721 :: 		,string[7],string[8]);
LUI	R2, hi_addr(_string+512)
ORI	R2, R2, lo_addr(_string+512)
ADDIU	SP, SP, -52
SW	R2, 48(SP)
LUI	R2, hi_addr(_string+448)
ORI	R2, R2, lo_addr(_string+448)
SW	R2, 44(SP)
;Sim800.c,720 :: 		,string[5],string[6]
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 36(SP)
;Sim800.c,719 :: 		,string[3],string[4]
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 28(SP)
;Sim800.c,718 :: 		,string[1],string[2]
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 20(SP)
;Sim800.c,717 :: 		,txtA,txtB,string[0]
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 16(SP)
LUI	R2, hi_addr(_txtB+0)
ORI	R2, R2, lo_addr(_txtB+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,716 :: 		" *string[8]  %s\r\n"
LUI	R2, hi_addr(?lstr_57_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_57_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,705 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,721 :: 		,string[7],string[8]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 52
;Sim800.c,724 :: 		if(!err){
LH	R2, 18(SP)
BEQ	R2, R0, L__GetSMSText267
NOP	
J	L_GetSMSText107
NOP	
L__GetSMSText267:
;Sim800.c,726 :: 		is_digit = isdigit(*string[1]);
LBU	R25, Offset(_string+64)(GP)
JAL	_isdigit+0
NOP	
;Sim800.c,727 :: 		if(is_digit == 1){
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__GetSMSText268
NOP	
J	L_GetSMSText108
NOP	
L__GetSMSText268:
;Sim800.c,728 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 16(SP)
;Sim800.c,730 :: 		sprintf(sms,"%d",res);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_58_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_58_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,733 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,732 :: 		" *no of sms's:= %s\r\n"
LUI	R2, hi_addr(?lstr_59_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_59_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,731 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,733 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,735 :: 		ReadMSG(res);
LH	R25, 16(SP)
JAL	_ReadMSG+0
NOP	
;Sim800.c,736 :: 		}else{
J	L_GetSMSText109
NOP	
L_GetSMSText108:
;Sim800.c,737 :: 		SendSMS(5,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 5
JAL	_SendSMS+0
NOP	
;Sim800.c,738 :: 		res = 1;
ORI	R2, R0, 1
SH	R2, 16(SP)
;Sim800.c,739 :: 		}
L_GetSMSText109:
;Sim800.c,740 :: 		RemoveSMSText(res);
LH	R25, 16(SP)
JAL	_RemoveSMSText+0
NOP	
;Sim800.c,741 :: 		}
L_GetSMSText107:
;Sim800.c,744 :: 		}
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
;Sim800.c,750 :: 		char* ReadMSG(int msg_num){
ADDIU	SP, SP, -68
SW	RA, 0(SP)
;Sim800.c,753 :: 		sprintf(sms,"%d",msg_num);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_60_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_60_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,754 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG110:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG110
NOP	
;Sim800.c,758 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,757 :: 		" *num_sms's:= %s\r\n"
LUI	R2, hi_addr(?lstr_61_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_61_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,756 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,758 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,761 :: 		UART2_Write_Text("AT+CMGF=1");
ADDIU	R23, SP, 20
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr62_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr62_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,762 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,763 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,764 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,765 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,766 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG112:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG112
NOP	
;Sim800.c,769 :: 		UART2_Write_Text("AT+CMGR=");
ADDIU	R23, SP, 30
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr63_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr63_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 30
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,770 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,771 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,772 :: 		UART2_Write(0x0A);
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
L_ReadMSG114:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG114
NOP	
;Sim800.c,780 :: 		"************** \r\n");
LUI	R2, hi_addr(?lstr_64_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_64_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,779 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,780 :: 		"************** \r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,783 :: 		for(i = 0;i<strlen(SimTestTxt);i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_ReadMSG116:
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
BNE	R2, R0, L__ReadMSG270
NOP	
J	L_ReadMSG117
NOP	
L__ReadMSG270:
;Sim800.c,784 :: 		SimTestTxt[i] =  toupper(SimTestTxt[i]);
SEH	R3, R5
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SW	R2, 64(SP)
SH	R25, 16(SP)
LBU	R25, 0(R2)
JAL	_toupper+0
NOP	
LH	R25, 16(SP)
LW	R3, 64(SP)
SB	R2, 0(R3)
;Sim800.c,783 :: 		for(i = 0;i<strlen(SimTestTxt);i++){
ADDIU	R2, R5, 1
; i end address is: 20 (R5)
; i start address is: 8 (R2)
;Sim800.c,785 :: 		}
SEH	R5, R2
; i end address is: 8 (R2)
J	L_ReadMSG116
NOP	
L_ReadMSG117:
;Sim800.c,787 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 16(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
SH	R2, 18(SP)
;Sim800.c,788 :: 		text = strchr(string[4], '"');
ORI	R26, R0, 34
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strchr+0
NOP	
SW	R2, Offset(_text+0)(GP)
;Sim800.c,789 :: 		strcpy(string[6], RemoveChars(text,'"','O'));
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
;Sim800.c,790 :: 		strcpy(string[3], RemoveChars(string[3],'"',0x0A));
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
;Sim800.c,791 :: 		memset(string[4]+8,0,1);
ORI	R27, R0, 1
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_string+264)
ORI	R25, R25, lo_addr(_string+264)
JAL	_memset+0
NOP	
;Sim800.c,792 :: 		strncpy(string[4],string[4],8);//RemoveChars(string[4],0x02,'+'));
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strncpy+0
NOP	
;Sim800.c,796 :: 		sprintf(sms,"%d",num_strs);
LH	R2, 18(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_65_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_65_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,809 :: 		,string[6]);
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
ADDIU	SP, SP, -40
SW	R2, 36(SP)
;Sim800.c,808 :: 		,string[4],string[5]
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,807 :: 		,string[2],string[3]
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,806 :: 		,sms,string[0],string[1]
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 8(SP)
;Sim800.c,805 :: 		" *string[6]  %s\r\n"
LUI	R2, hi_addr(?lstr_66_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_66_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,797 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,809 :: 		,string[6]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 40
LH	R25, 16(SP)
;Sim800.c,811 :: 		if(string[6] != NULL){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
BNE	R3, R2, L__ReadMSG272
NOP	
J	L_ReadMSG119
NOP	
L__ReadMSG272:
;Sim800.c,812 :: 		strcpy(string[6],RemoveWhiteSpace(string[6]));
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
;Sim800.c,813 :: 		res = StrChecker(string[6]);
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_StrChecker+0
NOP	
LH	R25, 16(SP)
; res start address is: 20 (R5)
SEH	R5, R2
;Sim800.c,815 :: 		if((res == 16) && (strcmp(string[1],SF.SimCelNum))){
SEH	R3, R2
ORI	R2, R0, 16
BEQ	R3, R2, L__ReadMSG273
NOP	
J	L__ReadMSG191
NOP	
L__ReadMSG273:
SH	R25, 16(SP)
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_strcmp+0
NOP	
LH	R25, 16(SP)
BNE	R2, R0, L__ReadMSG275
NOP	
J	L__ReadMSG190
NOP	
L__ReadMSG275:
; res end address is: 20 (R5)
L__ReadMSG189:
;Sim800.c,817 :: 		UART1_Write_Text("not Primary number\r\n");
ADDIU	R23, SP, 39
ADDIU	R22, R23, 21
LUI	R24, hi_addr(?ICS?lstr67_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr67_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 39
SH	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;Sim800.c,819 :: 		SendSMS(11,1);
ORI	R26, R0, 1
ORI	R25, R0, 11
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,820 :: 		return 255;
ORI	R2, R0, 255
J	L_end_ReadMSG
NOP	
;Sim800.c,815 :: 		if((res == 16) && (strcmp(string[1],SF.SimCelNum))){
L__ReadMSG191:
; res start address is: 20 (R5)
L__ReadMSG190:
;Sim800.c,823 :: 		TestRecievedSMS(res);
SH	R25, 16(SP)
; res end address is: 20 (R5)
SEH	R25, R5
JAL	_TestRecievedSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,824 :: 		}
L_ReadMSG119:
;Sim800.c,825 :: 		return 0;
MOVZ	R2, R0, R0
;Sim800.c,826 :: 		}
;Sim800.c,825 :: 		return 0;
;Sim800.c,826 :: 		}
L_end_ReadMSG:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 68
JR	RA
NOP	
; end of _ReadMSG
_TestRecievedSMS:
;Sim800.c,831 :: 		void TestRecievedSMS(int res){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Sim800.c,836 :: 		sprintf(B,"%d",res);
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R3, SP, 14
SH	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_68_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_68_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,839 :: 		,B);
ADDIU	R2, SP, 14
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,838 :: 		" *CRGB:= %s\r\n"
LUI	R2, hi_addr(?lstr_69_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_69_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,837 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,839 :: 		,B);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 12(SP)
;Sim800.c,842 :: 		switch(res){
J	L_TestRecievedSMS123
NOP	
;Sim800.c,843 :: 		case 6:
L_TestRecievedSMS125:
;Sim800.c,844 :: 		SendSMS(7,1);
ORI	R26, R0, 1
ORI	R25, R0, 7
JAL	_SendSMS+0
NOP	
;Sim800.c,845 :: 		break;
J	L_TestRecievedSMS124
NOP	
;Sim800.c,846 :: 		case 13:
L_TestRecievedSMS126:
;Sim800.c,847 :: 		SendSMS(8,1);
ORI	R26, R0, 1
ORI	R25, R0, 8
JAL	_SendSMS+0
NOP	
;Sim800.c,848 :: 		break;
J	L_TestRecievedSMS124
NOP	
;Sim800.c,849 :: 		case 14:
L_TestRecievedSMS127:
;Sim800.c,850 :: 		SendSMS(6,1);
ORI	R26, R0, 1
ORI	R25, R0, 6
JAL	_SendSMS+0
NOP	
;Sim800.c,851 :: 		break;
J	L_TestRecievedSMS124
NOP	
;Sim800.c,852 :: 		case 16:
L_TestRecievedSMS128:
;Sim800.c,853 :: 		GetValuesFromFlash();
JAL	_GetValuesFromFlash+0
NOP	
;Sim800.c,854 :: 		NVMErasePage(FLASH_Settings_PAddr);
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
;Sim800.c,855 :: 		if(string[5] != NULL){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__TestRecievedSMS278
NOP	
J	L_TestRecievedSMS129
NOP	
L__TestRecievedSMS278:
;Sim800.c,856 :: 		strcpy(B,string[5]);
ADDIU	R2, SP, 14
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;Sim800.c,857 :: 		Threshold.time_to_log = atoi(B);
ADDIU	R2, SP, 14
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, Offset(_Threshold+8)(GP)
;Sim800.c,858 :: 		}
L_TestRecievedSMS129:
;Sim800.c,859 :: 		WriteToFlashTemp();
JAL	_WriteToFlashTemp+0
NOP	
;Sim800.c,860 :: 		t =  Write_Thresholds(0);
MOVZ	R25, R0, R0
JAL	_Write_Thresholds+0
NOP	
;Sim800.c,865 :: 		,t);
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,864 :: 		" *CRGB:= %s\r\n"
LUI	R2, hi_addr(?lstr_70_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_70_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,863 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,865 :: 		,t);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,867 :: 		SendSMS(6,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 6
JAL	_SendSMS+0
NOP	
;Sim800.c,868 :: 		break;
J	L_TestRecievedSMS124
NOP	
;Sim800.c,869 :: 		case 17:
L_TestRecievedSMS130:
;Sim800.c,870 :: 		SimVars.init_inc = 5;  //Test started
ORI	R2, R0, 5
SB	R2, Offset(_SimVars+1)(GP)
;Sim800.c,871 :: 		SendSMS(9,1);
ORI	R26, R0, 1
ORI	R25, R0, 9
JAL	_SendSMS+0
NOP	
;Sim800.c,872 :: 		break;
J	L_TestRecievedSMS124
NOP	
;Sim800.c,873 :: 		case 18:
L_TestRecievedSMS131:
;Sim800.c,874 :: 		SimVars.init_inc = 3;  //Test Stopped
ORI	R2, R0, 3
SB	R2, Offset(_SimVars+1)(GP)
;Sim800.c,875 :: 		SendSMS(10,1);
ORI	R26, R0, 1
ORI	R25, R0, 10
JAL	_SendSMS+0
NOP	
;Sim800.c,876 :: 		break;
J	L_TestRecievedSMS124
NOP	
;Sim800.c,877 :: 		default:
L_TestRecievedSMS132:
;Sim800.c,878 :: 		break;
J	L_TestRecievedSMS124
NOP	
;Sim800.c,879 :: 		}
L_TestRecievedSMS123:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__TestRecievedSMS280
NOP	
J	L_TestRecievedSMS125
NOP	
L__TestRecievedSMS280:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__TestRecievedSMS282
NOP	
J	L_TestRecievedSMS126
NOP	
L__TestRecievedSMS282:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__TestRecievedSMS284
NOP	
J	L_TestRecievedSMS127
NOP	
L__TestRecievedSMS284:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__TestRecievedSMS286
NOP	
J	L_TestRecievedSMS128
NOP	
L__TestRecievedSMS286:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__TestRecievedSMS288
NOP	
J	L_TestRecievedSMS130
NOP	
L__TestRecievedSMS288:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__TestRecievedSMS290
NOP	
J	L_TestRecievedSMS131
NOP	
L__TestRecievedSMS290:
J	L_TestRecievedSMS132
NOP	
L_TestRecievedSMS124:
;Sim800.c,881 :: 		}
L_end_TestRecievedSMS:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _TestRecievedSMS
_RemoveSMSText:
;Sim800.c,887 :: 		int RemoveSMSText(int sms_cnt){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,890 :: 		sprintf(sms,"%d",sms_cnt);
SH	R25, 4(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_71_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_71_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,893 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,892 :: 		" *num_strs:= %s\r\n"
LUI	R2, hi_addr(?lstr_72_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_72_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,891 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,893 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 4(SP)
;Sim800.c,895 :: 		do{
L_RemoveSMSText133:
;Sim800.c,896 :: 		sprintf(sms,"%d",sms_cnt);
SH	R25, 4(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_73_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_73_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,897 :: 		UART2_Write_Text("AT+CMGD=");
ADDIU	R23, SP, 6
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr74_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr74_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,898 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,899 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,900 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,903 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LH	R25, 4(SP)
;Sim800.c,904 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_RemoveSMSText136:
ADDIU	R24, R24, -1
BNE	R24, R0, L_RemoveSMSText136
NOP	
;Sim800.c,905 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,906 :: 		sms_cnt--;
ADDIU	R2, R25, -1
SEH	R25, R2
;Sim800.c,907 :: 		}while(sms_cnt > 0);
SEH	R2, R2
SLTI	R2, R2, 1
BNE	R2, R0, L__RemoveSMSText292
NOP	
J	L_RemoveSMSText133
NOP	
L__RemoveSMSText292:
;Sim800.c,909 :: 		return sms_cnt;
SEH	R2, R25
;Sim800.c,910 :: 		}
L_end_RemoveSMSText:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _RemoveSMSText
_Test_Update_ThingSpeak:
;Sim800.c,916 :: 		int Test_Update_ThingSpeak(unsigned int s,unsigned int m, unsigned int h){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Sim800.c,921 :: 		if(s != sLast){
SW	R25, 4(SP)
ANDI	R3, R25, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak295
NOP	
J	L_Test_Update_ThingSpeak138
NOP	
L__Test_Update_ThingSpeak295:
;Sim800.c,922 :: 		sLast = s;
SB	R25, Offset(Test_Update_ThingSpeak_sLast_L0+0)(GP)
;Sim800.c,928 :: 		}
L_Test_Update_ThingSpeak138:
;Sim800.c,929 :: 		if(m != mLast){
ANDI	R3, R26, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak297
NOP	
J	L_Test_Update_ThingSpeak139
NOP	
L__Test_Update_ThingSpeak297:
;Sim800.c,930 :: 		mLast = m;
SB	R26, Offset(Test_Update_ThingSpeak_mLast_L0+0)(GP)
;Sim800.c,936 :: 		}
L_Test_Update_ThingSpeak139:
;Sim800.c,937 :: 		if(h != hLast){
ANDI	R3, R27, 65535
LBU	R2, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
BNE	R3, R2, L__Test_Update_ThingSpeak299
NOP	
J	L_Test_Update_ThingSpeak140
NOP	
L__Test_Update_ThingSpeak299:
;Sim800.c,938 :: 		hLast = h;
SB	R27, Offset(Test_Update_ThingSpeak_hLast_L0+0)(GP)
;Sim800.c,944 :: 		}
L_Test_Update_ThingSpeak140:
;Sim800.c,946 :: 		if(m > Threshold.time_to_log){
ANDI	R3, R26, 65535
LHU	R2, Offset(_Threshold+8)(GP)
SLTU	R2, R2, R3
BNE	R2, R0, L__Test_Update_ThingSpeak300
NOP	
J	L_Test_Update_ThingSpeak141
NOP	
L__Test_Update_ThingSpeak300:
;Sim800.c,947 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,948 :: 		SendData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,949 :: 		return 2;
ORI	R2, R0, 2
J	L_end_Test_Update_ThingSpeak
NOP	
;Sim800.c,950 :: 		}
L_Test_Update_ThingSpeak141:
;Sim800.c,951 :: 		return -1;
ORI	R2, R0, 65535
;Sim800.c,952 :: 		}
;Sim800.c,951 :: 		return -1;
;Sim800.c,952 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,957 :: 		void SendData(unsigned int* rgbc){
ADDIU	SP, SP, -196
SW	RA, 0(SP)
;Sim800.c,961 :: 		sprintf(txtC,"%u",rgbc[0]);
SW	R25, 4(SP)
SW	R26, 8(SP)
LHU	R2, 0(R25)
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_75_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_75_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtC+0)
ORI	R2, R2, lo_addr(_txtC+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,962 :: 		sprintf(txtR,"%u",rgbc[1]);
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_76_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_76_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtR+0)
ORI	R2, R2, lo_addr(_txtR+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,963 :: 		sprintf(txtG,"%u",rgbc[2]);
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
SW	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_77_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_77_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtG+0)
ORI	R2, R2, lo_addr(_txtG+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R25, 12(SP)
;Sim800.c,964 :: 		sprintf(txtB,"%u",rgbc[3]);
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_78_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_78_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtB+0)
ORI	R2, R2, lo_addr(_txtB+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,967 :: 		str = (char*)Malloc(200*sizeof(char));
ORI	R25, R0, 200
JAL	_Malloc+0
NOP	
SW	R2, Offset(_str+0)(GP)
;Sim800.c,969 :: 		*str  = 0;
SB	R0, 0(R2)
;Sim800.c,971 :: 		strcat(str,str_api);
LUI	R26, hi_addr(_str_api+0)
ORI	R26, R26, lo_addr(_str_api+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,972 :: 		strcat(str,SF.WriteAPIKey);
LUI	R26, hi_addr(_SF+38)
ORI	R26, R26, lo_addr(_SF+38)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,973 :: 		strcat(str,field1);
LUI	R26, hi_addr(_field1+0)
ORI	R26, R26, lo_addr(_field1+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,974 :: 		strcat(str,txtC);
LUI	R26, hi_addr(_txtC+0)
ORI	R26, R26, lo_addr(_txtC+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,975 :: 		strcat(str,field2);
LUI	R26, hi_addr(_field2+0)
ORI	R26, R26, lo_addr(_field2+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,976 :: 		strcat(str,txtR);
LUI	R26, hi_addr(_txtR+0)
ORI	R26, R26, lo_addr(_txtR+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,977 :: 		strcat(str,field3);
LUI	R26, hi_addr(_field3+0)
ORI	R26, R26, lo_addr(_field3+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,978 :: 		strcat(str,txtG);
LUI	R26, hi_addr(_txtG+0)
ORI	R26, R26, lo_addr(_txtG+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,979 :: 		strcat(str,field4);
LUI	R26, hi_addr(_field4+0)
ORI	R26, R26, lo_addr(_field4+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,980 :: 		strcat(str,txtB);
LUI	R26, hi_addr(_txtB+0)
ORI	R26, R26, lo_addr(_txtB+0)
LW	R25, Offset(_str+0)(GP)
JAL	_strcat+0
NOP	
;Sim800.c,983 :: 		UART2_Write_Text("AT+CPIN?");
ADDIU	R23, SP, 16
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr79_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr79_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 16
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,984 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,985 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,986 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,987 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData142:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData142
NOP	
NOP	
NOP	
;Sim800.c,988 :: 		UART2_Write_Text("AT+CREG?");
ADDIU	R23, SP, 25
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr80_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr80_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 25
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,989 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,990 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,991 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,992 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData144:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData144
NOP	
NOP	
NOP	
;Sim800.c,993 :: 		UART2_Write_Text("AT+CGATT?");
ADDIU	R23, SP, 34
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr81_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr81_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 34
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,994 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,995 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,996 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,997 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData146:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData146
NOP	
NOP	
NOP	
;Sim800.c,998 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 44
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr82_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr82_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 44
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,999 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1000 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1001 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1002 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData148:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData148
NOP	
NOP	
NOP	
;Sim800.c,1003 :: 		UART2_Write_Text("AT+CIPSTATUS");
ADDIU	R23, SP, 55
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr83_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr83_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 55
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1004 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1005 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1006 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1007 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData150:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData150
NOP	
NOP	
NOP	
;Sim800.c,1008 :: 		UART2_Write_Text("AT+CIPMUX=0");
ADDIU	R23, SP, 68
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr84_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr84_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 68
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1009 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1010 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1011 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1012 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData152:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData152
NOP	
NOP	
NOP	
;Sim800.c,1013 :: 		UART2_Write_Text("AT+CSTT=");//\"data.uk\",\"user\",\"one2one\"");
ADDIU	R23, SP, 80
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr85_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr85_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 80
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1014 :: 		UART2_Write_Text(SF.APN);
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1015 :: 		UART2_Write_Text(",\"user\",");
ADDIU	R23, SP, 89
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr86_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr86_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 89
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1016 :: 		UART2_Write_Text(SF.PWD);
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1017 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1018 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1019 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1020 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData154:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData154
NOP	
NOP	
NOP	
;Sim800.c,1021 :: 		UART2_Write_Text("AT+CIICR");
ADDIU	R23, SP, 98
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr87_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr87_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 98
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
;Sim800.c,1025 :: 		UART2_Write_Text("AT+CIFSR");
ADDIU	R23, SP, 107
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr88_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr88_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 107
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1026 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1027 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1028 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData156:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData156
NOP	
;Sim800.c,1029 :: 		UART2_Write_Text("AT+CIPSPRT=1");
ADDIU	R23, SP, 116
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr89_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr89_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 116
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1030 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1031 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1032 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1033 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData158:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData158
NOP	
NOP	
NOP	
;Sim800.c,1034 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
ADDIU	R23, SP, 129
ADDIU	R22, R23, 42
LUI	R24, hi_addr(?ICS?lstr90_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr90_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 129
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1035 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1036 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1037 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1038 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData160:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData160
NOP	
;Sim800.c,1039 :: 		UART2_Write_Text("AT+CIPSEND");
ADDIU	R23, SP, 171
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr91_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr91_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 171
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1040 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1041 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1042 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData162:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData162
NOP	
;Sim800.c,1043 :: 		UART2_Write_Text(str);
LW	R25, Offset(_str+0)(GP)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1044 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1045 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1046 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1047 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1048 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,1049 :: 		TestForOK(1);
ORI	R25, R0, 1
JAL	_TestForOK+0
NOP	
;Sim800.c,1050 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData164:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData164
NOP	
NOP	
NOP	
;Sim800.c,1051 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 182
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr92_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr92_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 182
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1052 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1053 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1054 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1055 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData166:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData166
NOP	
NOP	
NOP	
;Sim800.c,1057 :: 		Free(str,150*sizeof(char*));
ORI	R26, R0, 600
LW	R25, Offset(_str+0)(GP)
JAL	_Free+0
NOP	
;Sim800.c,1058 :: 		}
L_end_SendData:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 196
JR	RA
NOP	
; end of _SendData
_TestForOK:
;Sim800.c,1064 :: 		void TestForOK(char c){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,1066 :: 		WaitForResponse(1);
SW	R26, 4(SP)
SB	R25, 8(SP)
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,1067 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_TestForOK168:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TestForOK168
NOP	
;Sim800.c,1068 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,1072 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SB	R25, 8(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,1071 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_93_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_93_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,1070 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1072 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LBU	R25, 8(SP)
;Sim800.c,1074 :: 		lastMillis = TMR0.millis;
; lastMillis start address is: 16 (R4)
LW	R4, Offset(_TMR0+0)(GP)
;Sim800.c,1075 :: 		if(c == 0)
ANDI	R2, R25, 255
BEQ	R2, R0, L__TestForOK303
NOP	
J	L_TestForOK170
NOP	
L__TestForOK303:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
;Sim800.c,1076 :: 		while(!strstr(SimTestTxt, "OK")){
L_TestForOK171:
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
BEQ	R2, R0, L__TestForOK304
NOP	
J	L_TestForOK172
NOP	
L__TestForOK304:
; lastMillis end address is: 20 (R5)
;Sim800.c,1077 :: 		newMillis = TMR0.millis - lastMillis;
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,1078 :: 		if(newMillis > 5000)
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK305
NOP	
J	L_TestForOK173
NOP	
L__TestForOK305:
; lastMillis end address is: 20 (R5)
;Sim800.c,1079 :: 		break;
J	L_TestForOK172
NOP	
L_TestForOK173:
;Sim800.c,1080 :: 		}
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK171
NOP	
L_TestForOK172:
J	L_TestForOK174
NOP	
L_TestForOK170:
;Sim800.c,1081 :: 		else if(c == 1)
; lastMillis start address is: 16 (R4)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__TestForOK306
NOP	
J	L_TestForOK175
NOP	
L__TestForOK306:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
;Sim800.c,1082 :: 		while(!strstr(SimTestTxt, "CONNECT")){
L_TestForOK176:
; lastMillis start address is: 20 (R5)
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
ADDIU	R23, SP, 12
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr95_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr95_Sim800+0)
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
BEQ	R2, R0, L__TestForOK307
NOP	
J	L_TestForOK177
NOP	
L__TestForOK307:
; lastMillis end address is: 20 (R5)
;Sim800.c,1083 :: 		newMillis = TMR0.millis - lastMillis;
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,1084 :: 		if(newMillis > 5000)
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK308
NOP	
J	L_TestForOK178
NOP	
L__TestForOK308:
; lastMillis end address is: 20 (R5)
;Sim800.c,1085 :: 		break;
J	L_TestForOK177
NOP	
L_TestForOK178:
;Sim800.c,1086 :: 		}
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK176
NOP	
L_TestForOK177:
L_TestForOK175:
L_TestForOK174:
;Sim800.c,1087 :: 		}
L_end_TestForOK:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _TestForOK
