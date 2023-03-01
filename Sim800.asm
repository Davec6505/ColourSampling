_InitGSM3:
;Sim800.c,110 :: 		void InitGSM3(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,112 :: 		SimVars.initial_str = 0;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SB	R0, Offset(_SimVars+0)(GP)
;Sim800.c,113 :: 		SimVars.init_inc    = 0;
SH	R0, Offset(_SimVars+2)(GP)
;Sim800.c,114 :: 		*SimTestTxt = "Hello World this is a test";
ORI	R2, R0, lo_addr(?lstr_1_Sim800+0)
ANDI	R2, R2, 255
SB	R2, Offset(_SimTestTxt+0)(GP)
;Sim800.c,115 :: 		RB.head = 0;
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,116 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
;Sim800.c,117 :: 		RB.rcv_txt_fin = -1;
ORI	R2, R0, 255
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,118 :: 		memset(SF.SimCelNum,0,sizeof(SF.SimCelNum));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_memset+0
NOP	
;Sim800.c,119 :: 		memset(SF.StartCell,0,sizeof(SF.StartCell));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_memset+0
NOP	
;Sim800.c,120 :: 		memset(SF.WriteAPIKey,0,sizeof(SF.WriteAPIKey));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_memset+0
NOP	
;Sim800.c,121 :: 		memset(SF.ReadAPIKey,0,sizeof(SF.ReadAPIKey));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+78)
ORI	R25, R25, lo_addr(_SF+78)
JAL	_memset+0
NOP	
;Sim800.c,122 :: 		memset(SF.APN,0,sizeof(SF.APN));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_memset+0
NOP	
;Sim800.c,123 :: 		memset(SF.PWD,0,sizeof(SF.PWD));
ORI	R27, R0, 20
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_SF+118)
ORI	R25, R25, lo_addr(_SF+118)
JAL	_memset+0
NOP	
;Sim800.c,124 :: 		}
L_end_InitGSM3:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _InitGSM3
_PwrDownGSM3:
;Sim800.c,130 :: 		void PwrDownGSM3(){
;Sim800.c,131 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,132 :: 		PWR = 1;
LUI	R2, BitMask(LATD0_bit+0)
ORI	R2, R2, BitMask(LATD0_bit+0)
_SX	
;Sim800.c,133 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_PwrDownGSM30:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrDownGSM30
NOP	
NOP	
NOP	
;Sim800.c,134 :: 		PWR = 0;
LUI	R2, BitMask(LATD0_bit+0)
ORI	R2, R2, BitMask(LATD0_bit+0)
_SX	
;Sim800.c,136 :: 		while(STAT){
L_PwrDownGSM32:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BNE	R2, R0, L__PwrDownGSM3320
NOP	
J	L_PwrDownGSM33
NOP	
L__PwrDownGSM3320:
;Sim800.c,137 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,138 :: 		LATD5_bit = !LATD5_bit;
_LX	
EXT	R2, R2, BitPos(LATD5_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATD5_bit+0), 1
_SX	
;Sim800.c,139 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrDownGSM34:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrDownGSM34
NOP	
;Sim800.c,140 :: 		}
J	L_PwrDownGSM32
NOP	
L_PwrDownGSM33:
;Sim800.c,141 :: 		LATD5_bit = STAT;
_LX	
EXT	R3, R2, BitPos(RB4_bit+0), 1
_LX	
INS	R2, R3, BitPos(LATD5_bit+0), 1
_SX	
;Sim800.c,142 :: 		LATE3_bit = 0;
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
;Sim800.c,143 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrDownGSM36:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrDownGSM36
NOP	
NOP	
NOP	
;Sim800.c,145 :: 		}
L_end_PwrDownGSM3:
JR	RA
NOP	
; end of _PwrDownGSM3
_PwrUpGSM3:
;Sim800.c,150 :: 		void PwrUpGSM3(){
;Sim800.c,151 :: 		RST = 0;
LUI	R2, BitMask(LATB2_bit+0)
ORI	R2, R2, BitMask(LATB2_bit+0)
_SX	
;Sim800.c,152 :: 		PWR = 1;
LUI	R2, BitMask(LATD0_bit+0)
ORI	R2, R2, BitMask(LATD0_bit+0)
_SX	
;Sim800.c,153 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_PwrUpGSM38:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM38
NOP	
;Sim800.c,154 :: 		PWR = 0;
LUI	R2, BitMask(LATD0_bit+0)
ORI	R2, R2, BitMask(LATD0_bit+0)
_SX	
;Sim800.c,156 :: 		while(!STAT){
L_PwrUpGSM310:
_LX	
EXT	R2, R2, BitPos(RB4_bit+0), 1
BEQ	R2, R0, L__PwrUpGSM3322
NOP	
J	L_PwrUpGSM311
NOP	
L__PwrUpGSM3322:
;Sim800.c,157 :: 		LATE3_bit = !LATE3_bit;
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,158 :: 		LATD5_bit = !LATD5_bit;
_LX	
EXT	R2, R2, BitPos(LATD5_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATD5_bit+0), 1
_SX	
;Sim800.c,159 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_PwrUpGSM312:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM312
NOP	
;Sim800.c,160 :: 		}
J	L_PwrUpGSM310
NOP	
L_PwrUpGSM311:
;Sim800.c,161 :: 		LATA10_bit = STAT;
_LX	
EXT	R3, R2, BitPos(RB4_bit+0), 1
_LX	
INS	R2, R3, BitPos(LATA10_bit+0), 1
_SX	
;Sim800.c,162 :: 		LATE3_bit = 0;
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
;Sim800.c,163 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_PwrUpGSM314:
ADDIU	R24, R24, -1
BNE	R24, R0, L_PwrUpGSM314
NOP	
NOP	
NOP	
;Sim800.c,165 :: 		}
L_end_PwrUpGSM3:
JR	RA
NOP	
; end of _PwrUpGSM3
_WriteToFlashTemp:
;Sim800.c,170 :: 		void WriteToFlashTemp(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,174 :: 		GetStrLengths();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_GetStrLengths+0
NOP	
;Sim800.c,176 :: 		memset(buff,0,512);                            //make every byte NULL
ORI	R27, R0, 512
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_buff+0)
ORI	R25, R25, lo_addr(_buff+0)
JAL	_memset+0
NOP	
;Sim800.c,177 :: 		memcpy(buff,SF.SimCelNum,SL.l1);               //Save Cell num
LH	R27, Offset(_SL+0)(GP)
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
LUI	R25, hi_addr(_buff+0)
ORI	R25, R25, lo_addr(_buff+0)
JAL	_memcpy+0
NOP	
;Sim800.c,178 :: 		memcpy(buff+SL.l1,SF.WriteAPIKey,SL.l2);       //Save API Wr Key
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
;Sim800.c,179 :: 		memcpy(buff+SL.l1l2,SF.ReadAPIKey,SL.l3);      //Save API Rd Key
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
;Sim800.c,180 :: 		memcpy(buff+SL.l1l2l3,SF.APN,SL.l4);           //Save APN
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
;Sim800.c,181 :: 		memcpy(buff+SL.l1l2l3l4,SF.PWD,SL.l5);         //Save PWD
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
;Sim800.c,183 :: 		for(i=1;i<128;i++)
ORI	R2, R0, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
L_WriteToFlashTemp16:
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLTI	R2, R2, 128
BNE	R2, R0, L__WriteToFlashTemp324
NOP	
J	L_WriteToFlashTemp17
NOP	
L__WriteToFlashTemp324:
;Sim800.c,184 :: 		temp[i] = 0x00000000;
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_temp+0)
ORI	R2, R2, lo_addr(_temp+0)
ADDU	R2, R2, R3
SW	R0, 0(R2)
;Sim800.c,183 :: 		for(i=1;i<128;i++)
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
;Sim800.c,184 :: 		temp[i] = 0x00000000;
J	L_WriteToFlashTemp16
NOP	
L_WriteToFlashTemp17:
;Sim800.c,186 :: 		memcpy(temp,buff,SL.lTotA+4);
LH	R2, Offset(_SL+14)(GP)
ADDIU	R2, R2, 4
SEH	R27, R2
LUI	R26, hi_addr(_buff+0)
ORI	R26, R26, lo_addr(_buff+0)
LUI	R25, hi_addr(_temp+0)
ORI	R25, R25, lo_addr(_temp+0)
JAL	_memcpy+0
NOP	
;Sim800.c,188 :: 		pos = FLASH_Settings_PAddr;  //P?
; pos start address is: 12 (R3)
LW	R3, Offset(_FLASH_Settings_PAddr+0)(GP)
;Sim800.c,192 :: 		j = NVMErasePage(pos);
SW	R3, 16(SP)
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
LW	R3, 16(SP)
SH	R2, Offset(WriteToFlashTemp_j_L0+0)(GP)
;Sim800.c,193 :: 		if(j==0){
SEH	R2, R2
BEQ	R2, R0, L__WriteToFlashTemp325
NOP	
J	L_WriteToFlashTemp19
NOP	
L__WriteToFlashTemp325:
;Sim800.c,194 :: 		pos += 20;
ADDIU	R2, R3, 20
; pos end address is: 12 (R3)
; pos start address is: 16 (R4)
MOVZ	R4, R2, R0
;Sim800.c,195 :: 		for(i=0;i<128;i++){
SH	R0, Offset(WriteToFlashTemp_i_L0+0)(GP)
; pos end address is: 16 (R4)
L_WriteToFlashTemp20:
; pos start address is: 16 (R4)
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
SLTI	R2, R2, 128
BNE	R2, R0, L__WriteToFlashTemp326
NOP	
J	L_WriteToFlashTemp21
NOP	
L__WriteToFlashTemp326:
;Sim800.c,197 :: 		j = NVMWriteWord(pos,temp[i]);
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
;Sim800.c,198 :: 		pos += 4;
ADDIU	R2, R4, 4
MOVZ	R4, R2, R0
;Sim800.c,195 :: 		for(i=0;i<128;i++){
LH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(WriteToFlashTemp_i_L0+0)(GP)
;Sim800.c,200 :: 		}
; pos end address is: 16 (R4)
J	L_WriteToFlashTemp20
NOP	
L_WriteToFlashTemp21:
;Sim800.c,202 :: 		}
L_WriteToFlashTemp19:
;Sim800.c,206 :: 		sprintf(a,"%d",i);
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
;Sim800.c,207 :: 		sprintf(b,"%d",j);
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
;Sim800.c,211 :: 		,a,b);
LUI	R2, hi_addr(_b+0)
ORI	R2, R2, lo_addr(_b+0)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_a+0)
ORI	R2, R2, lo_addr(_a+0)
SW	R2, 8(SP)
;Sim800.c,210 :: 		" * flash err:   %s\r\n"
LUI	R2, hi_addr(?lstr_4_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_4_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,208 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,211 :: 		,a,b);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
;Sim800.c,213 :: 		}
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
;Sim800.c,218 :: 		char* GetValuesFromFlash(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,221 :: 		GetStrLengths();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_GetStrLengths+0
NOP	
;Sim800.c,223 :: 		ptr += 20;
LW	R2, Offset(_FLASH_Settings_VAddr+0)(GP)
ADDIU	R2, R2, 20
; ptr start address is: 16 (R4)
MOVZ	R4, R2, R0
;Sim800.c,225 :: 		for(i=0;i<SL.lTotA;i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_GetValuesFromFlash23:
; i start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
LH	R2, Offset(_SL+14)(GP)
SLTU	R2, R5, R2
BNE	R2, R0, L__GetValuesFromFlash328
NOP	
J	L_GetValuesFromFlash24
NOP	
L__GetValuesFromFlash328:
; ptr end address is: 16 (R4)
;Sim800.c,226 :: 		buff[i] = ptr[i];
; ptr start address is: 16 (R4)
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R3, R2, R5
ADDU	R2, R4, R5
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Sim800.c,228 :: 		UART1_Write(buff[i]);
LUI	R2, hi_addr(_buff+0)
ORI	R2, R2, lo_addr(_buff+0)
ADDU	R2, R2, R5
LBU	R25, 0(R2)
JAL	_UART1_Write+0
NOP	
;Sim800.c,229 :: 		UART1_Write(0x3A);
ORI	R25, R0, 58
JAL	_UART1_Write+0
NOP	
;Sim800.c,225 :: 		for(i=0;i<SL.lTotA;i++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Sim800.c,231 :: 		}
; ptr end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_GetValuesFromFlash23
NOP	
L_GetValuesFromFlash24:
;Sim800.c,232 :: 		strncpy(SF.SimCelNum,buff,SL.l1);
LH	R27, Offset(_SL+0)(GP)
LUI	R26, hi_addr(_buff+0)
ORI	R26, R26, lo_addr(_buff+0)
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_strncpy+0
NOP	
;Sim800.c,233 :: 		strncpy(SF.WriteAPIKey,buff+SL.l1,SL.l2);
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
;Sim800.c,234 :: 		strncpy(SF.ReadAPIKey,buff+SL.l1l2,SL.l3);
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
;Sim800.c,235 :: 		strncpy(SF.APN,buff+SL.l1l2l3,SL.l4);
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
;Sim800.c,236 :: 		strncpy(SF.PWD,buff+SL.l1l2l3l4,SL.l5);
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
;Sim800.c,245 :: 		,SF.ReadAPIKey,SF.APN,SF.PWD);
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
;Sim800.c,244 :: 		,SF.SimCelNum,SF.WriteAPIKey
LUI	R2, hi_addr(_SF+58)
ORI	R2, R2, lo_addr(_SF+58)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
SW	R2, 8(SP)
;Sim800.c,243 :: 		" * SF.PWD:         %s\r\n"
LUI	R2, hi_addr(?lstr_5_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_5_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,238 :: 		PrintOut(PrintHandler, " * Flash Read        \r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,245 :: 		,SF.ReadAPIKey,SF.APN,SF.PWD);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 28
;Sim800.c,247 :: 		return SF.SimCelNum;
LUI	R2, hi_addr(_SF+18)
ORI	R2, R2, lo_addr(_SF+18)
;Sim800.c,248 :: 		}
;Sim800.c,247 :: 		return SF.SimCelNum;
;Sim800.c,248 :: 		}
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
;Sim800.c,253 :: 		void GetStrLengths(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,255 :: 		SL.l1 = sizeof(SF.SimCelNum)-1;   //len of cell num
ORI	R2, R0, 19
SH	R2, Offset(_SL+0)(GP)
;Sim800.c,256 :: 		SL.l2 = sizeof(SF.WriteAPIKey)-1; //len of API Write key
ORI	R2, R0, 19
SH	R2, Offset(_SL+2)(GP)
;Sim800.c,257 :: 		SL.l3 = sizeof(SF.ReadAPIKey)-1;  //len of API Read Key
ORI	R2, R0, 19
SH	R2, Offset(_SL+4)(GP)
;Sim800.c,258 :: 		SL.l4 = sizeof(SF.APN)-1;         //len of APN
ORI	R2, R0, 19
SH	R2, Offset(_SL+6)(GP)
;Sim800.c,259 :: 		SL.l5 = sizeof(SF.PWD)-1;         //len of PWD
ORI	R2, R0, 19
SH	R2, Offset(_SL+8)(GP)
;Sim800.c,262 :: 		SL.lTotA     = SL.l1 + SL.l2 + SL.l3 + SL.l4 + SL.l5;
ORI	R2, R0, 95
SH	R2, Offset(_SL+14)(GP)
;Sim800.c,263 :: 		SL.l1l2      = SL.l1 + SL.l2;
ORI	R2, R0, 38
SH	R2, Offset(_SL+18)(GP)
;Sim800.c,264 :: 		SL.l1l2l3    = SL.l1l2 + SL.l3;
ORI	R2, R0, 57
SH	R2, Offset(_SL+20)(GP)
;Sim800.c,265 :: 		SL.l1l2l3l4  = SL.l1l2l3 + SL.l4;
ORI	R2, R0, 76
SH	R2, Offset(_SL+22)(GP)
;Sim800.c,267 :: 		SL.mod = SL.lTotA % 4;  //total divisable by 4 = flash Wrd size
ORI	R2, R0, 3
SH	R2, Offset(_SL+16)(GP)
;Sim800.c,268 :: 		SL.mod = 4 - SL.mod;
ORI	R2, R0, 1
SH	R2, Offset(_SL+16)(GP)
;Sim800.c,269 :: 		SL.lTotA += SL.mod;
ORI	R2, R0, 96
SH	R2, Offset(_SL+14)(GP)
;Sim800.c,272 :: 		sprintf(a,"%d",SL.l1);
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
;Sim800.c,273 :: 		sprintf(b,"%d",SL.l2);
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
;Sim800.c,274 :: 		sprintf(c,"%d",SL.l3);
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
;Sim800.c,275 :: 		sprintf(d,"%d",SL.l4);
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
;Sim800.c,276 :: 		sprintf(e,"%d",SL.l5);
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
;Sim800.c,277 :: 		sprintf(f,"%d",SL.lTotA);
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
;Sim800.c,285 :: 		,a,b,c,d,e,f);
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
;Sim800.c,284 :: 		" * lTotA: %s\r\n"
LUI	R2, hi_addr(?lstr_12_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_12_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,278 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,285 :: 		,a,b,c,d,e,f);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,287 :: 		}
L_end_GetStrLengths:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _GetStrLengths
_RcvSimTxt:
;Sim800.c,292 :: 		void RcvSimTxt(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Sim800.c,294 :: 		while(UART2_Data_Ready()) {     // If data is received
L_RcvSimTxt26:
JAL	_UART2_Data_Ready+0
NOP	
BNE	R2, R0, L__RcvSimTxt332
NOP	
J	L_RcvSimTxt27
NOP	
L__RcvSimTxt332:
;Sim800.c,295 :: 		if (U2STAbits.FERR || U2STAbits.OERR){
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BEQ	R2, R0, L__RcvSimTxt333
NOP	
J	L__RcvSimTxt274
NOP	
L__RcvSimTxt333:
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__RcvSimTxt334
NOP	
J	L__RcvSimTxt273
NOP	
L__RcvSimTxt334:
J	L_RcvSimTxt30
NOP	
L__RcvSimTxt274:
L__RcvSimTxt273:
;Sim800.c,296 :: 		if (U2STAbits.FERR ){
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 2, 1
BNE	R2, R0, L__RcvSimTxt336
NOP	
J	L_RcvSimTxt31
NOP	
L__RcvSimTxt336:
;Sim800.c,297 :: 		U2STAbits.FERR = 0;
ORI	R2, R0, 4
SW	R2, Offset(U2STAbits+4)(GP)
;Sim800.c,298 :: 		goto m0;
J	___RcvSimTxt_m0
NOP	
;Sim800.c,299 :: 		}
L_RcvSimTxt31:
;Sim800.c,300 :: 		if(U2STAbits.OERR)
LBU	R2, Offset(U2STAbits+0)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__RcvSimTxt338
NOP	
J	L_RcvSimTxt32
NOP	
L__RcvSimTxt338:
;Sim800.c,301 :: 		U2STAbits.OERR = 0;
ORI	R2, R0, 2
SW	R2, Offset(U2STAbits+4)(GP)
L_RcvSimTxt32:
;Sim800.c,302 :: 		}
L_RcvSimTxt30:
;Sim800.c,303 :: 		m0:
___RcvSimTxt_m0:
;Sim800.c,304 :: 		txt = U2RXREG;
; txt start address is: 16 (R4)
LW	R4, Offset(U2RXREG+0)(GP)
;Sim800.c,305 :: 		U1TXREG = txt;
ANDI	R2, R4, 255
SW	R2, Offset(U1TXREG+0)(GP)
;Sim800.c,306 :: 		if(txt >= 0x20){
ANDI	R2, R4, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__RcvSimTxt339
NOP	
J	L_RcvSimTxt33
NOP	
L__RcvSimTxt339:
;Sim800.c,307 :: 		RB.buff[RB.head] = txt;
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R2, R2, R3
SB	R4, 0(R2)
; txt end address is: 16 (R4)
;Sim800.c,308 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,309 :: 		}else if(U2RXREG == 0x0A){
J	L_RcvSimTxt34
NOP	
L_RcvSimTxt33:
LW	R3, Offset(U2RXREG+0)(GP)
ORI	R2, R0, 10
BEQ	R3, R2, L__RcvSimTxt340
NOP	
J	L_RcvSimTxt35
NOP	
L__RcvSimTxt340:
;Sim800.c,310 :: 		RB.buff[RB.head] = ',';
LHU	R3, Offset(_RB+1002)(GP)
LUI	R2, hi_addr(_RB+1)
ORI	R2, R2, lo_addr(_RB+1)
ADDU	R3, R2, R3
ORI	R2, R0, 44
SB	R2, 0(R3)
;Sim800.c,311 :: 		RB.head++;
LHU	R2, Offset(_RB+1002)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1002)(GP)
;Sim800.c,312 :: 		}
L_RcvSimTxt35:
L_RcvSimTxt34:
;Sim800.c,313 :: 		if(RB.head > 999){
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RcvSimTxt341
NOP	
J	L_RcvSimTxt36
NOP	
L__RcvSimTxt341:
;Sim800.c,314 :: 		RB.head = 0;             //reset head when buffer is full
SH	R0, Offset(_RB+1002)(GP)
;Sim800.c,315 :: 		}
L_RcvSimTxt36:
;Sim800.c,316 :: 		}
J	L_RcvSimTxt26
NOP	
L_RcvSimTxt27:
;Sim800.c,317 :: 		RB.rcv_txt_fin = 1;
ORI	R2, R0, 1
SB	R2, Offset(_RB+0)(GP)
;Sim800.c,318 :: 		}
L_end_RcvSimTxt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RcvSimTxt
_TestRingPointers:
;Sim800.c,323 :: 		int TestRingPointers(){
;Sim800.c,325 :: 		if(RB.tail > RB.head){
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__TestRingPointers343
NOP	
J	L_TestRingPointers37
NOP	
L__TestRingPointers343:
;Sim800.c,326 :: 		diff = 1000 - RB.tail;
LHU	R3, Offset(_RB+1004)(GP)
ORI	R2, R0, 1000
SUBU	R3, R2, R3
;Sim800.c,327 :: 		diff += RB.head;
LHU	R2, Offset(_RB+1002)(GP)
ADDU	R2, R3, R2
; diff start address is: 8 (R2)
;Sim800.c,328 :: 		}else{
; diff end address is: 8 (R2)
J	L_TestRingPointers38
NOP	
L_TestRingPointers37:
;Sim800.c,329 :: 		diff = RB.head - RB.tail;
LHU	R3, Offset(_RB+1004)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SUBU	R2, R2, R3
; diff start address is: 12 (R3)
ANDI	R3, R2, 65535
; diff end address is: 12 (R3)
SEH	R2, R3
;Sim800.c,330 :: 		}
L_TestRingPointers38:
;Sim800.c,331 :: 		return diff;
; diff start address is: 8 (R2)
; diff end address is: 8 (R2)
;Sim800.c,332 :: 		}
L_end_TestRingPointers:
JR	RA
NOP	
; end of _TestRingPointers
_WaitForResponse:
;Sim800.c,337 :: 		void WaitForResponse(short dly){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Sim800.c,339 :: 		lastMillis = TMR0.millis;
; lastMillis start address is: 20 (R5)
LW	R5, Offset(_TMR0+0)(GP)
;Sim800.c,340 :: 		RB.rcv_txt_fin   = 0;
SB	R0, Offset(_RB+0)(GP)
;Sim800.c,341 :: 		RB.last_head     = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1006)(GP)
;Sim800.c,342 :: 		do{
J	L_WaitForResponse39
NOP	
L__WaitForResponse275:
;Sim800.c,362 :: 		}while(!RB.rcv_txt_fin);
;Sim800.c,342 :: 		do{
L_WaitForResponse39:
;Sim800.c,343 :: 		LATE3_bit = !LATE3_bit;
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
_LX	
EXT	R2, R2, BitPos(LATE3_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATE3_bit+0), 1
_SX	
;Sim800.c,344 :: 		LATD5_bit = !LATD5_bit;
_LX	
EXT	R2, R2, BitPos(LATD5_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATD5_bit+0), 1
_SX	
;Sim800.c,345 :: 		if(dly == 0)
SEB	R2, R25
BEQ	R2, R0, L__WaitForResponse345
NOP	
J	L_WaitForResponse42
NOP	
L__WaitForResponse345:
; lastMillis end address is: 20 (R5)
;Sim800.c,346 :: 		Delay_ms(50);
; lastMillis start address is: 20 (R5)
LUI	R24, 20
ORI	R24, R24, 22612
L_WaitForResponse43:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse43
NOP	
NOP	
NOP	
J	L_WaitForResponse45
NOP	
L_WaitForResponse42:
;Sim800.c,347 :: 		else if(dly == 1)
SEB	R3, R25
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForResponse346
NOP	
J	L_WaitForResponse46
NOP	
L__WaitForResponse346:
;Sim800.c,348 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForResponse47:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse47
NOP	
NOP	
NOP	
J	L_WaitForResponse49
NOP	
L_WaitForResponse46:
;Sim800.c,349 :: 		else if(dly == 3){
SEB	R3, R25
ORI	R2, R0, 3
BEQ	R3, R2, L__WaitForResponse347
NOP	
J	L_WaitForResponse50
NOP	
L__WaitForResponse347:
;Sim800.c,350 :: 		UART2_Write_Text("ATE0");
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
;Sim800.c,351 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,352 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LB	R25, 4(SP)
;Sim800.c,353 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_WaitForResponse51:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse51
NOP	
NOP	
NOP	
;Sim800.c,354 :: 		}
J	L_WaitForResponse53
NOP	
L_WaitForResponse50:
;Sim800.c,356 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForResponse54:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForResponse54
NOP	
L_WaitForResponse53:
L_WaitForResponse49:
L_WaitForResponse45:
;Sim800.c,359 :: 		newMillis = TMR0.millis - lastMillis;
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R3, R2, R5
;Sim800.c,360 :: 		if(newMillis > 99000)
LUI	R2, 1
ORI	R2, R2, 33464
SLTU	R2, R2, R3
BNE	R2, R0, L__WaitForResponse348
NOP	
J	L_WaitForResponse56
NOP	
L__WaitForResponse348:
; lastMillis end address is: 20 (R5)
;Sim800.c,361 :: 		break;
J	L_WaitForResponse40
NOP	
L_WaitForResponse56:
;Sim800.c,362 :: 		}while(!RB.rcv_txt_fin);
; lastMillis start address is: 20 (R5)
LBU	R2, Offset(_RB+0)(GP)
BNE	R2, R0, L__WaitForResponse350
NOP	
J	L__WaitForResponse275
NOP	
L__WaitForResponse350:
; lastMillis end address is: 20 (R5)
L_WaitForResponse40:
;Sim800.c,363 :: 		LATE3_bit = 0;
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
;Sim800.c,364 :: 		}
L_end_WaitForResponse:
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _WaitForResponse
_RingToTempBuf:
;Sim800.c,369 :: 		void RingToTempBuf(){
;Sim800.c,371 :: 		i=0;
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
;Sim800.c,372 :: 		RB.tail = RB.last_tail;
LHU	R2, Offset(_RB+1008)(GP)
SH	R2, Offset(_RB+1004)(GP)
; i end address is: 20 (R5)
;Sim800.c,374 :: 		while(RB.tail != RB.head){
L_RingToTempBuf57:
; i start address is: 20 (R5)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
BNE	R2, R3, L__RingToTempBuf353
NOP	
J	L_RingToTempBuf58
NOP	
L__RingToTempBuf353:
;Sim800.c,376 :: 		if(RB.tail > RB.head && RB.head > 150)
LHU	R3, Offset(_RB+1002)(GP)
LHU	R2, Offset(_RB+1004)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__RingToTempBuf354
NOP	
J	L__RingToTempBuf278
NOP	
L__RingToTempBuf354:
LHU	R2, Offset(_RB+1002)(GP)
SLTIU	R2, R2, 151
BEQ	R2, R0, L__RingToTempBuf355
NOP	
J	L__RingToTempBuf277
NOP	
L__RingToTempBuf355:
L__RingToTempBuf276:
;Sim800.c,377 :: 		RB.tail = RB.head;
LHU	R2, Offset(_RB+1002)(GP)
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,376 :: 		if(RB.tail > RB.head && RB.head > 150)
L__RingToTempBuf278:
L__RingToTempBuf277:
;Sim800.c,379 :: 		SimTestTxt[i] = RB.buff[RB.tail];
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
;Sim800.c,384 :: 		i++;
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,385 :: 		RB.tail++;
LHU	R2, Offset(_RB+1004)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_RB+1004)(GP)
;Sim800.c,386 :: 		if(RB.tail > 999)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__RingToTempBuf356
NOP	
J	L_RingToTempBuf62
NOP	
L__RingToTempBuf356:
;Sim800.c,387 :: 		RB.tail = 0;
SH	R0, Offset(_RB+1004)(GP)
L_RingToTempBuf62:
;Sim800.c,388 :: 		};
J	L_RingToTempBuf57
NOP	
L_RingToTempBuf58:
;Sim800.c,389 :: 		SimTestTxt[i++] = 0;
SEH	R3, R5
; i end address is: 20 (R5)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,391 :: 		RB.last_tail = RB.tail;
LHU	R2, Offset(_RB+1004)(GP)
SH	R2, Offset(_RB+1008)(GP)
;Sim800.c,392 :: 		}
L_end_RingToTempBuf:
JR	RA
NOP	
; end of _RingToTempBuf
_SetupIOT:
;Sim800.c,398 :: 		char SetupIOT(){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Sim800.c,408 :: 		" * ATE0\r\n");
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(?lstr_14_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_14_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,407 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,408 :: 		" * ATE0\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,411 :: 		WaitForResponse(3);
ORI	R25, R0, 3
JAL	_WaitForResponse+0
NOP	
;Sim800.c,412 :: 		Delay_ms(4000);
LUI	R24, 1627
ORI	R24, R24, 39594
L_SetupIOT63:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT63
NOP	
;Sim800.c,413 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,419 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,418 :: 		" * Check if Sim is Registered\r\n"
LUI	R2, hi_addr(?lstr_15_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_15_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,416 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,419 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,421 :: 		wait:
___SetupIOT_wait:
;Sim800.c,423 :: 		UART2_Write_Text("AT+CREG?");
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
;Sim800.c,424 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,425 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,426 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,427 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SetupIOT65:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT65
NOP	
NOP	
NOP	
;Sim800.c,428 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,433 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,432 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_17_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_17_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,431 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,433 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,437 :: 		if(RB.head > RB.last_head){
LHU	R3, Offset(_RB+1006)(GP)
LHU	R2, Offset(_RB+1002)(GP)
SLTU	R2, R3, R2
BNE	R2, R0, L__SetupIOT358
NOP	
J	L_SetupIOT67
NOP	
L__SetupIOT358:
;Sim800.c,438 :: 		num_strs = strsplit(SimTestTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
;Sim800.c,441 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,451 :: 		,string[3],string[4]);
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
ADDIU	SP, SP, -32
SW	R2, 28(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
;Sim800.c,450 :: 		,string[1],string[2]
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
;Sim800.c,449 :: 		,txtA,string[0]
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,448 :: 		" *string[4]  %s\r\n"
LUI	R2, hi_addr(?lstr_19_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_19_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,442 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,451 :: 		,string[3],string[4]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 32
;Sim800.c,453 :: 		str_rcv = findnumber(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_findnumber+0
NOP	
;Sim800.c,454 :: 		res = atoi(str_rcv);  //get the sms rec number
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,455 :: 		if(res == 1 || res == 5){
SEH	R3, R2
ORI	R2, R0, 1
BNE	R3, R2, L__SetupIOT360
NOP	
J	L__SetupIOT281
NOP	
L__SetupIOT360:
SEH	R3, R4
ORI	R2, R0, 5
BNE	R3, R2, L__SetupIOT362
NOP	
J	L__SetupIOT280
NOP	
L__SetupIOT362:
; res end address is: 16 (R4)
J	L_SetupIOT70
NOP	
L__SetupIOT281:
; res start address is: 16 (R4)
L__SetupIOT280:
;Sim800.c,457 :: 		sprintf(txtA,"%d",res);
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
;Sim800.c,460 :: 		,txtA);
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,459 :: 		" *Registered with:= %s\r\n"
LUI	R2, hi_addr(?lstr_21_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_21_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,458 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,460 :: 		,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,462 :: 		}else{
J	L_SetupIOT71
NOP	
L_SetupIOT70:
;Sim800.c,465 :: 		" *Sim Not Registered\r\n");
LUI	R2, hi_addr(?lstr_22_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_22_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,464 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,465 :: 		" *Sim Not Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,467 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SetupIOT72:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetupIOT72
NOP	
NOP	
NOP	
;Sim800.c,468 :: 		goto wait;
J	___SetupIOT_wait
NOP	
;Sim800.c,469 :: 		}
L_SetupIOT71:
;Sim800.c,470 :: 		}
L_SetupIOT67:
;Sim800.c,473 :: 		" *Sim Registered\r\n");
LUI	R2, hi_addr(?lstr_23_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_23_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,472 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,473 :: 		" *Sim Registered\r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,479 :: 		return 1;
ORI	R2, R0, 1
;Sim800.c,480 :: 		}
;Sim800.c,479 :: 		return 1;
;Sim800.c,480 :: 		}
L_end_SetupIOT:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _SetupIOT
_WaitForSetupSMS:
;Sim800.c,487 :: 		char WaitForSetupSMS(unsigned int Indx){
ADDIU	SP, SP, -40
SW	RA, 0(SP)
;Sim800.c,491 :: 		UART2_Write_Text("AT+CMGF=1");
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
;Sim800.c,492 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,493 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,496 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,497 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,499 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS74:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS74
NOP	
;Sim800.c,501 :: 		WaitForResponse(0);
SH	R25, 12(SP)
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,502 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS76:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS76
NOP	
;Sim800.c,503 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,505 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
;Sim800.c,508 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,519 :: 		string[4],string[5]);
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
ADDIU	SP, SP, -36
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,518 :: 		string[2],string[3],
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,517 :: 		,txtA,string[0],string[1],
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,516 :: 		" *string[5]  %s\r\n"
LUI	R2, hi_addr(?lstr_26_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_26_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,509 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,519 :: 		string[4],string[5]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 36
;Sim800.c,524 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 14(SP)
;Sim800.c,525 :: 		sprintf(sms,"%d",res);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_27_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_27_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,529 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,528 :: 		" *sms no:= %s\r\n"
LUI	R2, hi_addr(?lstr_28_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_28_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,527 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,529 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,535 :: 		UART2_Write_Text("AT+CMGR=");
ADDIU	R23, SP, 26
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr29_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr29_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 26
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,536 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,537 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,538 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,540 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LHU	R25, 12(SP)
;Sim800.c,541 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_WaitForSetupSMS78:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS78
NOP	
;Sim800.c,542 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,543 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 12(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
;Sim800.c,545 :: 		sprintf(txtA,"%d",num_strs);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_30_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_30_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,561 :: 		,string[8]);
LUI	R2, hi_addr(_string+512)
ORI	R2, R2, lo_addr(_string+512)
ADDIU	SP, SP, -48
SW	R2, 44(SP)
;Sim800.c,560 :: 		,string[6],string[7]
LUI	R2, hi_addr(_string+448)
ORI	R2, R2, lo_addr(_string+448)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 36(SP)
;Sim800.c,559 :: 		,string[4],string[5]
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,558 :: 		,string[2],string[3]
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,557 :: 		,txtA,string[0],string[1]
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,556 :: 		" *string[8]  %s\r\n"
LUI	R2, hi_addr(?lstr_31_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_31_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,546 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,561 :: 		,string[8]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 48
LHU	R25, 12(SP)
;Sim800.c,566 :: 		if(Indx == 0){
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS364
NOP	
J	L_WaitForSetupSMS80
NOP	
L__WaitForSetupSMS364:
;Sim800.c,568 :: 		strncpy(SF.SimCelNum,string[1],strlen(string[1])+11);
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
;Sim800.c,569 :: 		strncpy(SF.SimDate,string[3],strlen(string[3])+1);
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
;Sim800.c,570 :: 		strncpy(SF.SimTime,string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_SF+9)
ORI	R25, R25, lo_addr(_SF+9)
JAL	_strncpy+0
NOP	
;Sim800.c,577 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
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
;Sim800.c,576 :: 		" * SF.SimTime: %s\r\n"
LUI	R2, hi_addr(?lstr_32_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_32_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,573 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,577 :: 		,SF.SimCelNum,SF.SimDate,SF.SimTime);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 20
LHU	R25, 12(SP)
;Sim800.c,581 :: 		}else if(Indx == 1){
J	L_WaitForSetupSMS81
NOP	
L_WaitForSetupSMS80:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS365
NOP	
J	L_WaitForSetupSMS82
NOP	
L__WaitForSetupSMS365:
;Sim800.c,583 :: 		strncpy(SF.WriteAPIKey,string[5],strlen(string[5])+1);
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
;Sim800.c,586 :: 		strncpy(SF.ReadAPIKey,string[6],strlen(string[6])+1);
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
;Sim800.c,589 :: 		strncpy(SF.APN,string[7],strlen(string[7])+1);
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
;Sim800.c,592 :: 		strncpy(SF.PWD,string[8],strlen(string[8])+1);
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
;Sim800.c,601 :: 		,SF.APN,SF.PWD);
LUI	R2, hi_addr(_SF+118)
ORI	R2, R2, lo_addr(_SF+118)
ADDIU	SP, SP, -24
SW	R2, 20(SP)
LUI	R2, hi_addr(_SF+98)
ORI	R2, R2, lo_addr(_SF+98)
SW	R2, 16(SP)
;Sim800.c,600 :: 		,SF.WriteAPIKey,SF.ReadAPIKey
LUI	R2, hi_addr(_SF+78)
ORI	R2, R2, lo_addr(_SF+78)
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+58)
ORI	R2, R2, lo_addr(_SF+58)
SW	R2, 8(SP)
;Sim800.c,599 :: 		" * SF.PWD:         %s\r\n"
LUI	R2, hi_addr(?lstr_33_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_33_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,595 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,601 :: 		,SF.APN,SF.PWD);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 24
LHU	R25, 12(SP)
;Sim800.c,605 :: 		}
L_WaitForSetupSMS82:
L_WaitForSetupSMS81:
;Sim800.c,608 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_WaitForSetupSMS83:
ADDIU	R24, R24, -1
BNE	R24, R0, L_WaitForSetupSMS83
NOP	
NOP	
NOP	
;Sim800.c,609 :: 		RemoveSMSText(res);
SH	R25, 12(SP)
LH	R25, 14(SP)
JAL	_RemoveSMSText+0
NOP	
;Sim800.c,610 :: 		res = strcmp(SimTestTxt,"OK,");
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
;Sim800.c,612 :: 		sprintf(txtA,"%d",res);
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_35_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_35_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,616 :: 		,SimTestTxt,txtA);
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SW	R2, 8(SP)
;Sim800.c,615 :: 		" * OK-0: %s\r\n"
LUI	R2, hi_addr(?lstr_36_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_36_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,613 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,616 :: 		,SimTestTxt,txtA);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LHU	R25, 12(SP)
;Sim800.c,621 :: 		if((res == 0)&&(Indx == 1)){
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS366
NOP	
J	L__WaitForSetupSMS285
NOP	
L__WaitForSetupSMS366:
ANDI	R3, R25, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__WaitForSetupSMS367
NOP	
J	L__WaitForSetupSMS284
NOP	
L__WaitForSetupSMS367:
L__WaitForSetupSMS283:
;Sim800.c,622 :: 		WriteToFlashTemp();
JAL	_WriteToFlashTemp+0
NOP	
;Sim800.c,623 :: 		return 3;
ORI	R2, R0, 3
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,621 :: 		if((res == 0)&&(Indx == 1)){
L__WaitForSetupSMS285:
L__WaitForSetupSMS284:
;Sim800.c,625 :: 		else if ((res == 0)&&(Indx == 0))
LH	R2, 14(SP)
BEQ	R2, R0, L__WaitForSetupSMS368
NOP	
J	L__WaitForSetupSMS287
NOP	
L__WaitForSetupSMS368:
ANDI	R2, R25, 65535
BEQ	R2, R0, L__WaitForSetupSMS369
NOP	
J	L__WaitForSetupSMS286
NOP	
L__WaitForSetupSMS369:
L__WaitForSetupSMS282:
;Sim800.c,626 :: 		return 2;
ORI	R2, R0, 2
J	L_end_WaitForSetupSMS
NOP	
;Sim800.c,625 :: 		else if ((res == 0)&&(Indx == 0))
L__WaitForSetupSMS287:
L__WaitForSetupSMS286:
;Sim800.c,628 :: 		return -1;//res;
ORI	R2, R0, 255
;Sim800.c,629 :: 		}
;Sim800.c,628 :: 		return -1;//res;
;Sim800.c,629 :: 		}
L_end_WaitForSetupSMS:
LW	R27, 8(SP)
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 40
JR	RA
NOP	
; end of _WaitForSetupSMS
_AT_Initial:
;Sim800.c,635 :: 		void AT_Initial(){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Sim800.c,638 :: 		UART2_Write_Text("AT&W+CNMI=2,1,0,0,0");
SW	R25, 4(SP)
ADDIU	R23, SP, 8
ADDIU	R22, R23, 20
LUI	R24, hi_addr(?ICS?lstr37_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr37_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,639 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,640 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,643 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,644 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_AT_Initial93:
ADDIU	R24, R24, -1
BNE	R24, R0, L_AT_Initial93
NOP	
;Sim800.c,645 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,646 :: 		}
L_end_AT_Initial:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _AT_Initial
_GetAPI_Key_SMS:
;Sim800.c,651 :: 		char GetAPI_Key_SMS(){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Sim800.c,656 :: 		UART2_Write_Text("AT+CMGS=");
SW	R25, 4(SP)
ADDIU	R23, SP, 8
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr38_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr38_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,657 :: 		UART2_Write_Text(SF.SimCelNum);
LUI	R25, hi_addr(_SF+18)
ORI	R25, R25, lo_addr(_SF+18)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,658 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,659 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,662 :: 		WaitForResponse(0);
MOVZ	R25, R0, R0
JAL	_WaitForResponse+0
NOP	
;Sim800.c,663 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,664 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_GetAPI_Key_SMS95:
ADDIU	R24, R24, -1
BNE	R24, R0, L_GetAPI_Key_SMS95
NOP	
NOP	
NOP	
;Sim800.c,668 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,667 :: 		" * %s\r\n"
LUI	R2, hi_addr(?lstr_39_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_39_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,666 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,668 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,673 :: 		UART2_Write_Text("Reply with the API Write Key from ThingSpeak starting with a ,");
ADDIU	R23, SP, 17
ADDIU	R22, R23, 63
LUI	R24, hi_addr(?ICS?lstr40_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr40_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 17
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,674 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,675 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,676 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,678 :: 		response = WaitForSetupSMS(1);
ORI	R25, R0, 1
JAL	_WaitForSetupSMS+0
NOP	
;Sim800.c,680 :: 		return response;
;Sim800.c,681 :: 		}
;Sim800.c,680 :: 		return response;
;Sim800.c,681 :: 		}
L_end_GetAPI_Key_SMS:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _GetAPI_Key_SMS
_SendSMS:
;Sim800.c,687 :: 		char SendSMS(char sms_type,char cellNum){
ADDIU	SP, SP, -536
SW	RA, 0(SP)
;Sim800.c,696 :: 		str_ = (char*)Malloc(100*sizeof(char*));
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
;Sim800.c,698 :: 		if(!cellNum)
BEQ	R26, R0, L__SendSMS373
NOP	
J	L_SendSMS97
NOP	
L__SendSMS373:
;Sim800.c,699 :: 		strcpy(tempCellNum,string[1]);
ADDIU	R2, SP, 115
SB	R25, 16(SP)
LUI	R26, hi_addr(_string+64)
ORI	R26, R26, lo_addr(_string+64)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LBU	R25, 16(SP)
J	L_SendSMS98
NOP	
L_SendSMS97:
;Sim800.c,701 :: 		strcpy(tempCellNum,SF.SimCelNum);
ADDIU	R2, SP, 115
SB	R25, 16(SP)
LUI	R26, hi_addr(_SF+18)
ORI	R26, R26, lo_addr(_SF+18)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
LBU	R25, 16(SP)
L_SendSMS98:
;Sim800.c,703 :: 		if(!onecA){
LB	R2, Offset(SendSMS_onecA_L0+0)(GP)
BEQ	R2, R0, L__SendSMS374
NOP	
J	L_SendSMS99
NOP	
L__SendSMS374:
;Sim800.c,704 :: 		onecA = 1;
ORI	R2, R0, 1
SB	R2, Offset(SendSMS_onecA_L0+0)(GP)
;Sim800.c,705 :: 		AT_Initial();
JAL	_AT_Initial+0
NOP	
;Sim800.c,706 :: 		}
L_SendSMS99:
;Sim800.c,708 :: 		UART2_Write_Text("AT+CMGF=1");
ADDIU	R23, SP, 135
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr41_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr41_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 135
SB	R25, 16(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,709 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,710 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,711 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendSMS100:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS100
NOP	
;Sim800.c,712 :: 		UART2_Write_Text("AT+CMGS=");
ADDIU	R23, SP, 145
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr42_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr42_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 145
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,713 :: 		UART2_Write_Text(tempCellNum);//SF.SimCelNum);
ADDIU	R2, SP, 115
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,714 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,715 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
LBU	R25, 16(SP)
;Sim800.c,716 :: 		Delay_ms(2000);
LUI	R24, 813
ORI	R24, R24, 52564
L_SendSMS102:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS102
NOP	
NOP	
NOP	
;Sim800.c,717 :: 		switch(sms_type){
J	L_SendSMS104
NOP	
;Sim800.c,718 :: 		case 0:
L_SendSMS106:
;Sim800.c,719 :: 		UART2_Write_Text("ERROR in setup Power down and start again!");
ADDIU	R23, SP, 154
ADDIU	R22, R23, 43
LUI	R24, hi_addr(?ICS?lstr43_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr43_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 154
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,720 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS105
NOP	
;Sim800.c,721 :: 		case 1:
L_SendSMS107:
;Sim800.c,722 :: 		UART2_Write_Text("Reply WebSite");
ADDIU	R23, SP, 197
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr44_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr44_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 197
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,723 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS105
NOP	
;Sim800.c,724 :: 		case 2:
L_SendSMS108:
;Sim800.c,725 :: 		UART2_Write_Text("Reply API Key");
ADDIU	R23, SP, 211
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr45_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr45_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 211
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,726 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS105
NOP	
;Sim800.c,727 :: 		case 3:
L_SendSMS109:
;Sim800.c,728 :: 		UART2_Write_Text("Setup Complete!");
ADDIU	R23, SP, 225
ADDIU	R22, R23, 16
LUI	R24, hi_addr(?ICS?lstr46_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr46_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 225
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,729 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS105
NOP	
;Sim800.c,730 :: 		case 4:
L_SendSMS110:
;Sim800.c,731 :: 		UART2_Write_Text("Device Powered up!");
ADDIU	R23, SP, 241
ADDIU	R22, R23, 19
LUI	R24, hi_addr(?ICS?lstr47_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr47_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 241
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,732 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS105
NOP	
;Sim800.c,733 :: 		case 5:
L_SendSMS111:
;Sim800.c,734 :: 		UART2_Write_Text("SMS Not recieved!");
ADDIU	R23, SP, 260
ADDIU	R22, R23, 18
LUI	R24, hi_addr(?ICS?lstr48_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr48_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 260
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,735 :: 		break;
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS105
NOP	
;Sim800.c,736 :: 		case 6: //read the set points
L_SendSMS112:
;Sim800.c,737 :: 		str_ = Read_Thresholds();
JAL	_Read_Thresholds+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
;Sim800.c,738 :: 		strncpy(b,str_,strlen(str_)-4);
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, R2, -4
ADDIU	R2, SP, 36
SEH	R27, R3
MOVZ	R26, R6, R0
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Sim800.c,739 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 36
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,740 :: 		break;
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS105
NOP	
;Sim800.c,741 :: 		case 7: //read raw values
L_SendSMS113:
;Sim800.c,742 :: 		str_ = Read_Send_AllColour(0);
MOVZ	R25, R0, R0
JAL	_Read_Send_AllColour+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
;Sim800.c,743 :: 		strncpy(b,str_,strlen(str_));
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 36
SEH	R27, R2
MOVZ	R26, R6, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Sim800.c,744 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 36
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,745 :: 		break;
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS105
NOP	
;Sim800.c,746 :: 		case 8: //read scaled values
L_SendSMS114:
;Sim800.c,747 :: 		str_ = Read_Send_AllColour(1);
ORI	R25, R0, 1
JAL	_Read_Send_AllColour+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
;Sim800.c,748 :: 		strncpy(b,str_,strlen(str_));
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 36
SEH	R27, R2
MOVZ	R26, R6, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Sim800.c,749 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 36
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,750 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS105
NOP	
;Sim800.c,751 :: 		case 9:
L_SendSMS115:
;Sim800.c,752 :: 		UART2_Write_Text("Test Started!");
ADDIU	R23, SP, 278
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr49_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr49_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 278
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,753 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS105
NOP	
;Sim800.c,754 :: 		case 10:
L_SendSMS116:
;Sim800.c,755 :: 		UART2_Write_Text("Test Stopped!");
ADDIU	R23, SP, 292
ADDIU	R22, R23, 14
LUI	R24, hi_addr(?ICS?lstr50_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr50_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 292
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,756 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS105
NOP	
;Sim800.c,757 :: 		case 11:
L_SendSMS117:
;Sim800.c,758 :: 		UART2_Write_Text("You are not permitted to set the threshold contact the supplier!");
ADDIU	R23, SP, 306
ADDIU	R22, R23, 65
LUI	R24, hi_addr(?ICS?lstr51_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr51_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 306
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,759 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS105
NOP	
;Sim800.c,760 :: 		case 12:
L_SendSMS118:
;Sim800.c,761 :: 		UART2_Write_Text("Not a recognised command!");
ADDIU	R23, SP, 371
ADDIU	R22, R23, 26
LUI	R24, hi_addr(?ICS?lstr52_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr52_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 371
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,762 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS105
NOP	
;Sim800.c,763 :: 		case 13:
L_SendSMS119:
;Sim800.c,764 :: 		UART2_Write_Text("You are not permitted to stop this test contact ");
ADDIU	R23, SP, 397
ADDIU	R22, R23, 49
LUI	R24, hi_addr(?ICS?lstr53_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr53_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 397
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,765 :: 		UART2_Write_Text(SF.StartCell);
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,766 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS105
NOP	
;Sim800.c,767 :: 		case 14:
L_SendSMS120:
;Sim800.c,768 :: 		UART2_Write_Text("Test already started contact ");
ADDIU	R23, SP, 446
ADDIU	R22, R23, 30
LUI	R24, hi_addr(?ICS?lstr54_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr54_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 446
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,769 :: 		UART2_Write_Text(SF.StartCell);
LUI	R25, hi_addr(_SF+38)
ORI	R25, R25, lo_addr(_SF+38)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,770 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS105
NOP	
;Sim800.c,771 :: 		case 15:
L_SendSMS121:
;Sim800.c,772 :: 		UART2_Write_Text("Test has not been started!");
ADDIU	R23, SP, 476
ADDIU	R22, R23, 27
LUI	R24, hi_addr(?ICS?lstr55_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr55_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 476
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,773 :: 		break;
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS105
NOP	
;Sim800.c,774 :: 		case 16: //read scaled values
L_SendSMS122:
;Sim800.c,775 :: 		str_ = ReadHUE();
JAL	_ReadHUE+0
NOP	
; str_ start address is: 24 (R6)
MOVZ	R6, R2, R0
;Sim800.c,776 :: 		strncpy(b,str_,strlen(str_));
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 36
SEH	R27, R2
MOVZ	R26, R6, R0
MOVZ	R25, R3, R0
JAL	_strncpy+0
NOP	
;Sim800.c,777 :: 		UART2_Write_Text(b);
ADDIU	R2, SP, 36
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,778 :: 		break;
MOVZ	R3, R6, R0
; str_ end address is: 24 (R6)
J	L_SendSMS105
NOP	
;Sim800.c,779 :: 		case 17: //read scaled values
L_SendSMS123:
;Sim800.c,780 :: 		LM35_Adc_Average(&aveadc_,LM35Pin);
ORI	R26, R0, 15
LUI	R25, hi_addr(_aveadc_+0)
ORI	R25, R25, lo_addr(_aveadc_+0)
JAL	_LM35_Adc_Average+0
NOP	
;Sim800.c,781 :: 		getLM35Temp(temp_,aveadc_);
ADDIU	R2, SP, 20
LH	R26, Offset(_aveadc_+0)(GP)
MOVZ	R25, R2, R0
JAL	_getLM35Temp+0
NOP	
;Sim800.c,782 :: 		aveadc_ = 0;
SH	R0, Offset(_aveadc_+0)(GP)
;Sim800.c,783 :: 		sprintf(txt_,"%3.2f",temp_[1]);
ADDIU	R2, SP, 20
ADDIU	R2, R2, 4
LW	R2, 0(R2)
ADDIU	R3, SP, 100
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_56_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_56_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,784 :: 		str_ = txt_;
ADDIU	R3, SP, 100
; str_ start address is: 24 (R6)
MOVZ	R6, R3, R0
;Sim800.c,785 :: 		strcat(txt_,"*C");
ORI	R30, R0, 42
SB	R30, 503(SP)
ORI	R30, R0, 67
SB	R30, 504(SP)
MOVZ	R30, R0, R0
SB	R30, 505(SP)
ADDIU	R2, SP, 503
MOVZ	R26, R2, R0
MOVZ	R25, R3, R0
JAL	_strcat+0
NOP	
;Sim800.c,786 :: 		UART2_Write_Text(txt_);
ADDIU	R2, SP, 100
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,787 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS105
NOP	
;Sim800.c,788 :: 		default:
L_SendSMS124:
;Sim800.c,789 :: 		UART2_Write_Text("Error Power cycle the device!");
ADDIU	R23, SP, 506
ADDIU	R22, R23, 30
LUI	R24, hi_addr(?ICS?lstr58_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr58_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 506
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,790 :: 		break;
MOVZ	R3, R6, R0
J	L_SendSMS105
NOP	
;Sim800.c,791 :: 		}
L_SendSMS104:
ANDI	R2, R25, 255
BNE	R2, R0, L__SendSMS376
NOP	
J	L_SendSMS106
NOP	
L__SendSMS376:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__SendSMS378
NOP	
J	L_SendSMS107
NOP	
L__SendSMS378:
ANDI	R3, R25, 255
ORI	R2, R0, 2
BNE	R3, R2, L__SendSMS380
NOP	
J	L_SendSMS108
NOP	
L__SendSMS380:
ANDI	R3, R25, 255
ORI	R2, R0, 3
BNE	R3, R2, L__SendSMS382
NOP	
J	L_SendSMS109
NOP	
L__SendSMS382:
ANDI	R3, R25, 255
ORI	R2, R0, 4
BNE	R3, R2, L__SendSMS384
NOP	
J	L_SendSMS110
NOP	
L__SendSMS384:
ANDI	R3, R25, 255
ORI	R2, R0, 5
BNE	R3, R2, L__SendSMS386
NOP	
J	L_SendSMS111
NOP	
L__SendSMS386:
ANDI	R3, R25, 255
ORI	R2, R0, 6
BNE	R3, R2, L__SendSMS388
NOP	
J	L_SendSMS112
NOP	
L__SendSMS388:
ANDI	R3, R25, 255
ORI	R2, R0, 7
BNE	R3, R2, L__SendSMS390
NOP	
J	L_SendSMS113
NOP	
L__SendSMS390:
ANDI	R3, R25, 255
ORI	R2, R0, 8
BNE	R3, R2, L__SendSMS392
NOP	
J	L_SendSMS114
NOP	
L__SendSMS392:
ANDI	R3, R25, 255
ORI	R2, R0, 9
BNE	R3, R2, L__SendSMS394
NOP	
J	L_SendSMS115
NOP	
L__SendSMS394:
ANDI	R3, R25, 255
ORI	R2, R0, 10
BNE	R3, R2, L__SendSMS396
NOP	
J	L_SendSMS116
NOP	
L__SendSMS396:
ANDI	R3, R25, 255
ORI	R2, R0, 11
BNE	R3, R2, L__SendSMS398
NOP	
J	L_SendSMS117
NOP	
L__SendSMS398:
ANDI	R3, R25, 255
ORI	R2, R0, 12
BNE	R3, R2, L__SendSMS400
NOP	
J	L_SendSMS118
NOP	
L__SendSMS400:
ANDI	R3, R25, 255
ORI	R2, R0, 13
BNE	R3, R2, L__SendSMS402
NOP	
J	L_SendSMS119
NOP	
L__SendSMS402:
ANDI	R3, R25, 255
ORI	R2, R0, 14
BNE	R3, R2, L__SendSMS404
NOP	
J	L_SendSMS120
NOP	
L__SendSMS404:
ANDI	R3, R25, 255
ORI	R2, R0, 15
BNE	R3, R2, L__SendSMS406
NOP	
J	L_SendSMS121
NOP	
L__SendSMS406:
ANDI	R3, R25, 255
ORI	R2, R0, 16
BNE	R3, R2, L__SendSMS408
NOP	
J	L_SendSMS122
NOP	
L__SendSMS408:
ANDI	R3, R25, 255
ORI	R2, R0, 17
BNE	R3, R2, L__SendSMS410
NOP	
J	L_SendSMS123
NOP	
L__SendSMS410:
J	L_SendSMS124
NOP	
; str_ end address is: 24 (R6)
L_SendSMS105:
;Sim800.c,792 :: 		UART2_Write(0x0D);
; str_ start address is: 12 (R3)
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,793 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,794 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,795 :: 		Delay_ms(5000);
LUI	R24, 2034
ORI	R24, R24, 33108
L_SendSMS125:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendSMS125
NOP	
NOP	
NOP	
;Sim800.c,797 :: 		Free(str_,100*sizeof(char*));
ORI	R26, R0, 400
MOVZ	R25, R3, R0
; str_ end address is: 12 (R3)
JAL	_Free+0
NOP	
;Sim800.c,799 :: 		}
L_end_SendSMS:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 536
JR	RA
NOP	
; end of _SendSMS
_GetSMSText:
;Sim800.c,804 :: 		char GetSMSText(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,807 :: 		RingToTempBuf();
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,810 :: 		num_strs = strsplit(SimTestTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 20 (R5)
SEH	R5, R2
;Sim800.c,812 :: 		err = strncmp(sms_test,string[0],4);
ORI	R27, R0, 4
LUI	R26, hi_addr(_string+0)
ORI	R26, R26, lo_addr(_string+0)
LUI	R25, hi_addr(_sms_test+0)
ORI	R25, R25, lo_addr(_sms_test+0)
JAL	_strncmp+0
NOP	
SH	R2, 18(SP)
;Sim800.c,814 :: 		sprintf(txtA,"%d",num_strs);
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
;Sim800.c,815 :: 		sprintf(txtB,"%d",err);
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
;Sim800.c,832 :: 		,string[7],string[8]);
LUI	R2, hi_addr(_string+512)
ORI	R2, R2, lo_addr(_string+512)
ADDIU	SP, SP, -52
SW	R2, 48(SP)
LUI	R2, hi_addr(_string+448)
ORI	R2, R2, lo_addr(_string+448)
SW	R2, 44(SP)
;Sim800.c,831 :: 		,string[5],string[6]
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 36(SP)
;Sim800.c,830 :: 		,string[3],string[4]
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 28(SP)
;Sim800.c,829 :: 		,string[1],string[2]
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 20(SP)
;Sim800.c,828 :: 		,txtA,txtB,string[0]
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 16(SP)
LUI	R2, hi_addr(_txtB+0)
ORI	R2, R2, lo_addr(_txtB+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 8(SP)
;Sim800.c,827 :: 		" *string[8]  %s\r\n"
LUI	R2, hi_addr(?lstr_61_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_61_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,816 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,832 :: 		,string[7],string[8]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 52
;Sim800.c,837 :: 		if(!err){
LH	R2, 18(SP)
BEQ	R2, R0, L__GetSMSText412
NOP	
J	L_GetSMSText127
NOP	
L__GetSMSText412:
;Sim800.c,839 :: 		is_digit = isdigit(*string[1]);
LBU	R25, Offset(_string+64)(GP)
JAL	_isdigit+0
NOP	
;Sim800.c,841 :: 		if(is_digit == 1){
ANDI	R3, R2, 65535
ORI	R2, R0, 1
BEQ	R3, R2, L__GetSMSText413
NOP	
J	L_GetSMSText128
NOP	
L__GetSMSText413:
;Sim800.c,842 :: 		res = atoi(string[1]);
LUI	R25, hi_addr(_string+64)
ORI	R25, R25, lo_addr(_string+64)
JAL	_atoi+0
NOP	
SH	R2, 16(SP)
;Sim800.c,844 :: 		sprintf(sms,"%d",res);
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
;Sim800.c,847 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,846 :: 		" *no of sms's:= %s\r\n"
LUI	R2, hi_addr(?lstr_63_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_63_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,845 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,847 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,851 :: 		ReadMSG(res);
LH	R25, 16(SP)
JAL	_ReadMSG+0
NOP	
;Sim800.c,852 :: 		}else{
J	L_GetSMSText129
NOP	
L_GetSMSText128:
;Sim800.c,853 :: 		SendSMS(5,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 5
JAL	_SendSMS+0
NOP	
;Sim800.c,854 :: 		res = 1;
ORI	R2, R0, 1
SH	R2, 16(SP)
;Sim800.c,855 :: 		}
L_GetSMSText129:
;Sim800.c,856 :: 		return RemoveSMSText(res);
LH	R25, 16(SP)
JAL	_RemoveSMSText+0
NOP	
J	L_end_GetSMSText
NOP	
;Sim800.c,857 :: 		}
L_GetSMSText127:
;Sim800.c,859 :: 		return -1;
ORI	R2, R0, 255
;Sim800.c,860 :: 		}
;Sim800.c,859 :: 		return -1;
;Sim800.c,860 :: 		}
L_end_GetSMSText:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _GetSMSText
_ReadMSG:
;Sim800.c,866 :: 		char ReadMSG(int msg_num){
ADDIU	SP, SP, -44
SW	RA, 0(SP)
;Sim800.c,869 :: 		sprintf(sms,"%d",msg_num);
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
;Sim800.c,870 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG130:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG130
NOP	
;Sim800.c,874 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,873 :: 		" *num_sms's:= %s\r\n"
LUI	R2, hi_addr(?lstr_65_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_65_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,872 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,874 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,879 :: 		UART2_Write_Text("AT+CMGF=1");
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
;Sim800.c,880 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,881 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,882 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,883 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,884 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_ReadMSG132:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG132
NOP	
;Sim800.c,887 :: 		UART2_Write_Text("AT+CMGR=");
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
;Sim800.c,888 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,889 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,890 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,892 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,893 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,894 :: 		Delay_ms(1500);
LUI	R24, 610
ORI	R24, R24, 23039
L_ReadMSG134:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ReadMSG134
NOP	
NOP	
;Sim800.c,898 :: 		"************** \r\n");
LUI	R2, hi_addr(?lstr_68_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_68_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,897 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,898 :: 		"************** \r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,903 :: 		for(i = 0;i<strlen(SimTestTxt);i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_ReadMSG136:
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
BNE	R2, R0, L__ReadMSG415
NOP	
J	L_ReadMSG137
NOP	
L__ReadMSG415:
;Sim800.c,904 :: 		SimTestTxt[i] =  toupper(SimTestTxt[i]);
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
;Sim800.c,903 :: 		for(i = 0;i<strlen(SimTestTxt);i++){
ADDIU	R2, R5, 1
SEH	R5, R2
;Sim800.c,905 :: 		}
; i end address is: 20 (R5)
J	L_ReadMSG136
NOP	
L_ReadMSG137:
;Sim800.c,907 :: 		num_strs = strsplit(SimTestTxt,',');
SH	R25, 16(SP)
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
LH	R25, 16(SP)
; num_strs start address is: 12 (R3)
SEH	R3, R2
;Sim800.c,908 :: 		text = strchr(string[4], '"');
SH	R3, 16(SP)
SH	R25, 18(SP)
ORI	R26, R0, 34
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strchr+0
NOP	
;Sim800.c,909 :: 		strcpy(string[6], RemoveChars(text,'"','O'));
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
;Sim800.c,910 :: 		strcpy(string[3], RemoveChars(string[3],'"',0x0A));
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
;Sim800.c,911 :: 		memset(string[4]+8,0,1);
ORI	R27, R0, 1
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_string+264)
ORI	R25, R25, lo_addr(_string+264)
JAL	_memset+0
NOP	
;Sim800.c,912 :: 		strncpy(string[4],string[4],8);
ORI	R27, R0, 8
LUI	R26, hi_addr(_string+256)
ORI	R26, R26, lo_addr(_string+256)
LUI	R25, hi_addr(_string+256)
ORI	R25, R25, lo_addr(_string+256)
JAL	_strncpy+0
NOP	
LH	R25, 18(SP)
LH	R3, 16(SP)
;Sim800.c,916 :: 		sprintf(sms,"%d",num_strs);
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
;Sim800.c,932 :: 		,string[8]);
LUI	R2, hi_addr(_string+512)
ORI	R2, R2, lo_addr(_string+512)
ADDIU	SP, SP, -48
SW	R2, 44(SP)
;Sim800.c,931 :: 		,string[6],string[7]
LUI	R2, hi_addr(_string+448)
ORI	R2, R2, lo_addr(_string+448)
SW	R2, 40(SP)
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
SW	R2, 36(SP)
;Sim800.c,930 :: 		,string[4],string[5]
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,929 :: 		,string[2],string[3]
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,928 :: 		,sms,string[0],string[1]
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 8(SP)
;Sim800.c,927 :: 		" *string[8]  %s\r\n"
LUI	R2, hi_addr(?lstr_70_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_70_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,917 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,932 :: 		,string[8]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 48
;Sim800.c,939 :: 		,string[6]);
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,938 :: 		"string[6]    %s\r\n"
LUI	R2, hi_addr(?lstr_71_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_71_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,937 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,939 :: 		,string[6]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 16(SP)
;Sim800.c,941 :: 		if(string[6] != NULL){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+384)
ORI	R2, R2, lo_addr(_string+384)
BNE	R3, R2, L__ReadMSG417
NOP	
J	L_ReadMSG139
NOP	
L__ReadMSG417:
;Sim800.c,942 :: 		strcpy(string[6],RemoveWhiteSpace(string[6]));
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
;Sim800.c,943 :: 		res = StrChecker(string[6]);
LUI	R25, hi_addr(_string+384)
ORI	R25, R25, lo_addr(_string+384)
JAL	_StrChecker+0
NOP	
LH	R25, 16(SP)
; res start address is: 16 (R4)
SEH	R4, R2
;Sim800.c,946 :: 		if(res == 6){         //Reada_Scl
SEH	R3, R2
ORI	R2, R0, 6
BEQ	R3, R2, L__ReadMSG418
NOP	
J	L_ReadMSG140
NOP	
L__ReadMSG418:
;Sim800.c,947 :: 		goto next;
J	___ReadMSG_next
NOP	
;Sim800.c,948 :: 		}
L_ReadMSG140:
;Sim800.c,949 :: 		else if(res == 10){         //Readc
SEH	R3, R4
ORI	R2, R0, 10
BEQ	R3, R2, L__ReadMSG419
NOP	
J	L_ReadMSG142
NOP	
L__ReadMSG419:
;Sim800.c,950 :: 		goto next;
J	___ReadMSG_next
NOP	
;Sim800.c,951 :: 		}
L_ReadMSG142:
;Sim800.c,952 :: 		else if(res == 11){         //Readt
SEH	R3, R4
ORI	R2, R0, 11
BEQ	R3, R2, L__ReadMSG420
NOP	
J	L_ReadMSG144
NOP	
L__ReadMSG420:
;Sim800.c,953 :: 		goto next;
J	___ReadMSG_next
NOP	
;Sim800.c,954 :: 		}
L_ReadMSG144:
;Sim800.c,955 :: 		else if(res == 13){         //Reada_Scl
SEH	R3, R4
ORI	R2, R0, 13
BEQ	R3, R2, L__ReadMSG421
NOP	
J	L_ReadMSG146
NOP	
L__ReadMSG421:
;Sim800.c,956 :: 		goto next;
J	___ReadMSG_next
NOP	
;Sim800.c,957 :: 		}
L_ReadMSG146:
;Sim800.c,958 :: 		else if(res == 14){         //Reada_thv
SEH	R3, R4
ORI	R2, R0, 14
BEQ	R3, R2, L__ReadMSG422
NOP	
J	L_ReadMSG148
NOP	
L__ReadMSG422:
;Sim800.c,959 :: 		goto next;
J	___ReadMSG_next
NOP	
;Sim800.c,960 :: 		}
L_ReadMSG148:
;Sim800.c,961 :: 		else if(res == 16){   //write_raw
SEH	R3, R4
ORI	R2, R0, 16
BEQ	R3, R2, L__ReadMSG423
NOP	
J	L_ReadMSG150
NOP	
L__ReadMSG423:
;Sim800.c,962 :: 		if((res == 16) && (strncmp(string[1],SF.SimCelNum,15))){
SEH	R3, R4
ORI	R2, R0, 16
BEQ	R3, R2, L__ReadMSG424
NOP	
J	L__ReadMSG294
NOP	
L__ReadMSG424:
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
BNE	R2, R0, L__ReadMSG426
NOP	
J	L__ReadMSG293
NOP	
L__ReadMSG426:
; res end address is: 16 (R4)
L__ReadMSG292:
;Sim800.c,963 :: 		SendSMS(11,0);
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 11
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,964 :: 		return 11;
ORI	R2, R0, 11
J	L_end_ReadMSG
NOP	
;Sim800.c,962 :: 		if((res == 16) && (strncmp(string[1],SF.SimCelNum,15))){
L__ReadMSG294:
; res start address is: 16 (R4)
L__ReadMSG293:
;Sim800.c,966 :: 		}else if(res == 17){  //start
J	L_ReadMSG154
NOP	
L_ReadMSG150:
SEH	R3, R4
ORI	R2, R0, 17
BEQ	R3, R2, L__ReadMSG427
NOP	
J	L_ReadMSG155
NOP	
L__ReadMSG427:
;Sim800.c,967 :: 		if(res == 17 && !SimVars.start){
SEH	R3, R4
ORI	R2, R0, 17
BEQ	R3, R2, L__ReadMSG428
NOP	
J	L__ReadMSG296
NOP	
L__ReadMSG428:
LBU	R2, Offset(_SimVars+4)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__ReadMSG429
NOP	
J	L__ReadMSG295
NOP	
L__ReadMSG429:
L__ReadMSG291:
;Sim800.c,968 :: 		strncpy(SF.StartCell,string[1],15);
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
;Sim800.c,969 :: 		SimVars.start = 1;
LBU	R2, Offset(_SimVars+4)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_SimVars+4)(GP)
;Sim800.c,970 :: 		}else if(res == 17 && SimVars.start){
J	L_ReadMSG159
NOP	
;Sim800.c,967 :: 		if(res == 17 && !SimVars.start){
L__ReadMSG296:
L__ReadMSG295:
;Sim800.c,970 :: 		}else if(res == 17 && SimVars.start){
SEH	R3, R4
ORI	R2, R0, 17
BEQ	R3, R2, L__ReadMSG430
NOP	
J	L__ReadMSG298
NOP	
L__ReadMSG430:
LBU	R2, Offset(_SimVars+4)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__ReadMSG432
NOP	
J	L__ReadMSG297
NOP	
L__ReadMSG432:
; res end address is: 16 (R4)
L__ReadMSG290:
;Sim800.c,971 :: 		SendSMS(14,0);
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 14
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,972 :: 		return 14;
ORI	R2, R0, 14
J	L_end_ReadMSG
NOP	
;Sim800.c,970 :: 		}else if(res == 17 && SimVars.start){
L__ReadMSG298:
; res start address is: 16 (R4)
L__ReadMSG297:
;Sim800.c,974 :: 		goto next;
J	___ReadMSG_next
NOP	
L_ReadMSG159:
;Sim800.c,975 :: 		}else if(res == 18){   //cancel
J	L_ReadMSG164
NOP	
L_ReadMSG155:
SEH	R3, R4
ORI	R2, R0, 18
BEQ	R3, R2, L__ReadMSG433
NOP	
J	L_ReadMSG165
NOP	
L__ReadMSG433:
;Sim800.c,978 :: 		!strncmp(string[1],SF.SimCelNum,15))){
LBU	R2, Offset(_SimVars+4)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L__ReadMSG435
NOP	
J	L__ReadMSG301
NOP	
L__ReadMSG435:
;Sim800.c,977 :: 		(!strncmp(string[1],SF.StartCell,15)||
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
;Sim800.c,978 :: 		!strncmp(string[1],SF.SimCelNum,15))){
BNE	R2, R0, L__ReadMSG437
NOP	
J	L__ReadMSG300
NOP	
L__ReadMSG437:
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
BNE	R2, R0, L__ReadMSG439
NOP	
J	L__ReadMSG299
NOP	
L__ReadMSG439:
; res end address is: 16 (R4)
J	L_ReadMSG170
NOP	
L__ReadMSG300:
; res start address is: 16 (R4)
L__ReadMSG299:
L__ReadMSG288:
;Sim800.c,979 :: 		SimVars.start = 0;
LBU	R2, Offset(_SimVars+4)(GP)
INS	R2, R0, 0, 1
SB	R2, Offset(_SimVars+4)(GP)
;Sim800.c,985 :: 		,SF.StartCell,string[1]);
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SH	R4, 16(SP)
SH	R25, 18(SP)
ADDIU	SP, SP, -16
SW	R2, 12(SP)
LUI	R2, hi_addr(_SF+38)
ORI	R2, R2, lo_addr(_SF+38)
SW	R2, 8(SP)
;Sim800.c,984 :: 		" *string[1]:=      %s\r\n"
LUI	R2, hi_addr(?lstr_72_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_72_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,981 :: 		PrintOut(PrintHandler,       "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,985 :: 		,SF.StartCell,string[1]);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 16
LH	R25, 18(SP)
LH	R4, 16(SP)
;Sim800.c,989 :: 		goto next;   //if cell matches allow to CANCEL
J	___ReadMSG_next
NOP	
; res end address is: 16 (R4)
;Sim800.c,990 :: 		}else{
L_ReadMSG170:
;Sim800.c,978 :: 		!strncmp(string[1],SF.SimCelNum,15))){
L__ReadMSG301:
;Sim800.c,991 :: 		if(!SimVars.start){
LBU	R2, Offset(_SimVars+4)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__ReadMSG440
NOP	
J	L_ReadMSG172
NOP	
L__ReadMSG440:
;Sim800.c,992 :: 		SendSMS(15,0);  //test has not been started
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 15
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,993 :: 		return 15;
ORI	R2, R0, 15
J	L_end_ReadMSG
NOP	
;Sim800.c,994 :: 		}else{
L_ReadMSG172:
;Sim800.c,995 :: 		SendSMS(13,0);  //not a recognized command
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 13
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,996 :: 		return 13;
ORI	R2, R0, 13
J	L_end_ReadMSG
NOP	
;Sim800.c,999 :: 		}else if(res == 19){   //HUE
L_ReadMSG165:
; res start address is: 16 (R4)
SEH	R3, R4
ORI	R2, R0, 19
BEQ	R3, R2, L__ReadMSG441
NOP	
J	L_ReadMSG175
NOP	
L__ReadMSG441:
;Sim800.c,1000 :: 		goto next;
J	___ReadMSG_next
NOP	
;Sim800.c,1001 :: 		}else if(res == 20){   //DEG
L_ReadMSG175:
SEH	R3, R4
ORI	R2, R0, 20
BEQ	R3, R2, L__ReadMSG442
NOP	
J	L_ReadMSG177
NOP	
L__ReadMSG442:
;Sim800.c,1003 :: 		goto next;
J	___ReadMSG_next
NOP	
; res end address is: 16 (R4)
;Sim800.c,1004 :: 		}else{
L_ReadMSG177:
;Sim800.c,1005 :: 		SendSMS(12,0);
SH	R25, 16(SP)
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,1006 :: 		return 12;
ORI	R2, R0, 12
J	L_end_ReadMSG
NOP	
;Sim800.c,1007 :: 		}
L_ReadMSG164:
; res start address is: 16 (R4)
L_ReadMSG154:
;Sim800.c,1008 :: 		next:
___ReadMSG_next:
;Sim800.c,1009 :: 		TestRecievedSMS(res);
SH	R25, 16(SP)
; res end address is: 16 (R4)
SEH	R25, R4
JAL	_TestRecievedSMS+0
NOP	
LH	R25, 16(SP)
;Sim800.c,1010 :: 		}
L_ReadMSG139:
;Sim800.c,1011 :: 		return 0;
MOVZ	R2, R0, R0
;Sim800.c,1012 :: 		}
;Sim800.c,1011 :: 		return 0;
;Sim800.c,1012 :: 		}
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
;Sim800.c,1017 :: 		void TestRecievedSMS(int res){
ADDIU	SP, SP, -80
SW	RA, 0(SP)
;Sim800.c,1020 :: 		sprintf(B,"%d",res);
SW	R25, 4(SP)
SW	R26, 8(SP)
ADDIU	R3, SP, 14
SH	R25, 12(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_73_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_73_Sim800+0)
SW	R2, 4(SP)
SW	R3, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,1025 :: 		,B);
ADDIU	R2, SP, 14
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,1024 :: 		" *Str check result:= %s\r\n"
LUI	R2, hi_addr(?lstr_74_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_74_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,1023 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1025 :: 		,B);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 12(SP)
;Sim800.c,1030 :: 		switch(res){
J	L_TestRecievedSMS179
NOP	
;Sim800.c,1031 :: 		case 6:
L_TestRecievedSMS181:
;Sim800.c,1032 :: 		SendSMS(7,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 7
JAL	_SendSMS+0
NOP	
;Sim800.c,1033 :: 		break;
J	L_TestRecievedSMS180
NOP	
;Sim800.c,1034 :: 		case 7: //R
L_TestRecievedSMS182:
;Sim800.c,1035 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,1036 :: 		break;
J	L_TestRecievedSMS180
NOP	
;Sim800.c,1037 :: 		case 8: //G
L_TestRecievedSMS183:
;Sim800.c,1038 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,1039 :: 		break;
J	L_TestRecievedSMS180
NOP	
;Sim800.c,1040 :: 		case 9: //B
L_TestRecievedSMS184:
;Sim800.c,1041 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,1042 :: 		break;
J	L_TestRecievedSMS180
NOP	
;Sim800.c,1043 :: 		case 10: //C
L_TestRecievedSMS185:
;Sim800.c,1044 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,1045 :: 		break;
J	L_TestRecievedSMS180
NOP	
;Sim800.c,1046 :: 		case 13:
L_TestRecievedSMS186:
;Sim800.c,1047 :: 		SendSMS(8,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 8
JAL	_SendSMS+0
NOP	
;Sim800.c,1048 :: 		break;
J	L_TestRecievedSMS180
NOP	
;Sim800.c,1049 :: 		case 14:
L_TestRecievedSMS187:
;Sim800.c,1050 :: 		SendSMS(6,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 6
JAL	_SendSMS+0
NOP	
;Sim800.c,1051 :: 		break;
J	L_TestRecievedSMS180
NOP	
;Sim800.c,1052 :: 		case 15: //write,
L_TestRecievedSMS188:
;Sim800.c,1053 :: 		SendSMS(12,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 12
JAL	_SendSMS+0
NOP	
;Sim800.c,1054 :: 		break;
J	L_TestRecievedSMS180
NOP	
;Sim800.c,1055 :: 		case 16:
L_TestRecievedSMS189:
;Sim800.c,1056 :: 		GetValuesFromFlash();
JAL	_GetValuesFromFlash+0
NOP	
;Sim800.c,1057 :: 		NVMErasePage(FLASH_Settings_PAddr);
LW	R25, Offset(_FLASH_Settings_PAddr+0)(GP)
JAL	_NVMErasePage+0
NOP	
;Sim800.c,1058 :: 		if(string[5] != NULL){
MOVZ	R3, R0, R0
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
BNE	R3, R2, L__TestRecievedSMS445
NOP	
J	L_TestRecievedSMS190
NOP	
L__TestRecievedSMS445:
;Sim800.c,1059 :: 		strcpy(B,string[5]);
ADDIU	R2, SP, 14
LUI	R26, hi_addr(_string+320)
ORI	R26, R26, lo_addr(_string+320)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
;Sim800.c,1060 :: 		Threshold.time_to_log = atoi(B);
ADDIU	R2, SP, 14
MOVZ	R25, R2, R0
JAL	_atoi+0
NOP	
SH	R2, Offset(_Threshold+8)(GP)
;Sim800.c,1061 :: 		Threshold.time_to_log -= 1;
ADDIU	R2, R2, -1
SH	R2, Offset(_Threshold+8)(GP)
;Sim800.c,1062 :: 		}
L_TestRecievedSMS190:
;Sim800.c,1063 :: 		WriteToFlashTemp();
JAL	_WriteToFlashTemp+0
NOP	
;Sim800.c,1064 :: 		t =  Write_Thresholds(0);
MOVZ	R25, R0, R0
JAL	_Write_Thresholds+0
NOP	
;Sim800.c,1069 :: 		,t);
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,1068 :: 		" *CRGB:= %s\r\n"
LUI	R2, hi_addr(?lstr_75_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_75_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,1067 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1069 :: 		,t);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,1073 :: 		SendSMS(6,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 6
JAL	_SendSMS+0
NOP	
;Sim800.c,1074 :: 		break;
J	L_TestRecievedSMS180
NOP	
;Sim800.c,1075 :: 		case 17:
L_TestRecievedSMS191:
;Sim800.c,1076 :: 		SimVars.init_inc = 5;  //Test started
ORI	R2, R0, 5
SH	R2, Offset(_SimVars+2)(GP)
;Sim800.c,1077 :: 		T0_SP.sec = T0_SP.min = T0_SP.hr = 0;
SH	R0, Offset(_T0_SP+6)(GP)
SH	R0, Offset(_T0_SP+4)(GP)
SH	R0, Offset(_T0_SP+2)(GP)
;Sim800.c,1078 :: 		SendSMS(9,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 9
JAL	_SendSMS+0
NOP	
;Sim800.c,1079 :: 		break;
J	L_TestRecievedSMS180
NOP	
;Sim800.c,1080 :: 		case 18:
L_TestRecievedSMS192:
;Sim800.c,1081 :: 		SimVars.init_inc = 3;  //Test Stopped
ORI	R2, R0, 3
SH	R2, Offset(_SimVars+2)(GP)
;Sim800.c,1082 :: 		SendSMS(10,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 10
JAL	_SendSMS+0
NOP	
;Sim800.c,1083 :: 		break;
J	L_TestRecievedSMS180
NOP	
;Sim800.c,1084 :: 		case 19:
L_TestRecievedSMS193:
;Sim800.c,1085 :: 		SendSMS(16,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 16
JAL	_SendSMS+0
NOP	
;Sim800.c,1086 :: 		break;
J	L_TestRecievedSMS180
NOP	
;Sim800.c,1087 :: 		case 20:
L_TestRecievedSMS194:
;Sim800.c,1088 :: 		SendSMS(17,0);
MOVZ	R26, R0, R0
ORI	R25, R0, 17
JAL	_SendSMS+0
NOP	
;Sim800.c,1089 :: 		break;
J	L_TestRecievedSMS180
NOP	
;Sim800.c,1090 :: 		default:
L_TestRecievedSMS195:
;Sim800.c,1091 :: 		break;
J	L_TestRecievedSMS180
NOP	
;Sim800.c,1092 :: 		}
L_TestRecievedSMS179:
SEH	R3, R25
ORI	R2, R0, 6
BNE	R3, R2, L__TestRecievedSMS447
NOP	
J	L_TestRecievedSMS181
NOP	
L__TestRecievedSMS447:
SEH	R3, R25
ORI	R2, R0, 7
BNE	R3, R2, L__TestRecievedSMS449
NOP	
J	L_TestRecievedSMS182
NOP	
L__TestRecievedSMS449:
SEH	R3, R25
ORI	R2, R0, 8
BNE	R3, R2, L__TestRecievedSMS451
NOP	
J	L_TestRecievedSMS183
NOP	
L__TestRecievedSMS451:
SEH	R3, R25
ORI	R2, R0, 9
BNE	R3, R2, L__TestRecievedSMS453
NOP	
J	L_TestRecievedSMS184
NOP	
L__TestRecievedSMS453:
SEH	R3, R25
ORI	R2, R0, 10
BNE	R3, R2, L__TestRecievedSMS455
NOP	
J	L_TestRecievedSMS185
NOP	
L__TestRecievedSMS455:
SEH	R3, R25
ORI	R2, R0, 13
BNE	R3, R2, L__TestRecievedSMS457
NOP	
J	L_TestRecievedSMS186
NOP	
L__TestRecievedSMS457:
SEH	R3, R25
ORI	R2, R0, 14
BNE	R3, R2, L__TestRecievedSMS459
NOP	
J	L_TestRecievedSMS187
NOP	
L__TestRecievedSMS459:
SEH	R3, R25
ORI	R2, R0, 15
BNE	R3, R2, L__TestRecievedSMS461
NOP	
J	L_TestRecievedSMS188
NOP	
L__TestRecievedSMS461:
SEH	R3, R25
ORI	R2, R0, 16
BNE	R3, R2, L__TestRecievedSMS463
NOP	
J	L_TestRecievedSMS189
NOP	
L__TestRecievedSMS463:
SEH	R3, R25
ORI	R2, R0, 17
BNE	R3, R2, L__TestRecievedSMS465
NOP	
J	L_TestRecievedSMS191
NOP	
L__TestRecievedSMS465:
SEH	R3, R25
ORI	R2, R0, 18
BNE	R3, R2, L__TestRecievedSMS467
NOP	
J	L_TestRecievedSMS192
NOP	
L__TestRecievedSMS467:
SEH	R3, R25
ORI	R2, R0, 19
BNE	R3, R2, L__TestRecievedSMS469
NOP	
J	L_TestRecievedSMS193
NOP	
L__TestRecievedSMS469:
SEH	R3, R25
ORI	R2, R0, 20
BNE	R3, R2, L__TestRecievedSMS471
NOP	
J	L_TestRecievedSMS194
NOP	
L__TestRecievedSMS471:
J	L_TestRecievedSMS195
NOP	
L_TestRecievedSMS180:
;Sim800.c,1094 :: 		}
L_end_TestRecievedSMS:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 80
JR	RA
NOP	
; end of _TestRecievedSMS
_RemoveSMSText:
;Sim800.c,1100 :: 		int RemoveSMSText(int sms_cnt){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Sim800.c,1101 :: 		sprintf(sms,"%d",sms_cnt);
SH	R25, 4(SP)
ADDIU	SP, SP, -12
SH	R25, 8(SP)
LUI	R2, hi_addr(?lstr_76_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_76_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,1105 :: 		,sms);
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,1104 :: 		" *delete num_strs:= %s\r\n"
LUI	R2, hi_addr(?lstr_77_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_77_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,1103 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1105 :: 		,sms);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LH	R25, 4(SP)
;Sim800.c,1109 :: 		do{
L_RemoveSMSText196:
;Sim800.c,1110 :: 		UART2_Write_Text("AT+CMGD=");
ADDIU	R23, SP, 6
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr78_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr78_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 6
SH	R25, 4(SP)
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1111 :: 		UART2_Write_Text(sms);
LUI	R25, hi_addr(_sms+0)
ORI	R25, R25, lo_addr(_sms+0)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1112 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1113 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1116 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LH	R25, 4(SP)
;Sim800.c,1117 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_RemoveSMSText199:
ADDIU	R24, R24, -1
BNE	R24, R0, L_RemoveSMSText199
NOP	
;Sim800.c,1118 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,1119 :: 		sms_cnt--;
ADDIU	R2, R25, -1
SEH	R25, R2
;Sim800.c,1120 :: 		}while(sms_cnt > 0);
SEH	R2, R2
SLTI	R2, R2, 1
BNE	R2, R0, L__RemoveSMSText473
NOP	
J	L_RemoveSMSText196
NOP	
L__RemoveSMSText473:
;Sim800.c,1122 :: 		return sms_cnt;
SEH	R2, R25
;Sim800.c,1123 :: 		}
L_end_RemoveSMSText:
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _RemoveSMSText
_Test_Update_ThingSpeak:
;Sim800.c,1129 :: 		int Test_Update_ThingSpeak(float degC){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,1131 :: 		TCS3472_getRawData(RawData);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R25, 16(SP)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Sim800.c,1132 :: 		GetScaledValues(RawData,FltData);
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_GetScaledValues+0
NOP	
;Sim800.c,1133 :: 		TCS3472_CalcHSL(FltData);
LUI	R25, hi_addr(_FltData+0)
ORI	R25, R25, lo_addr(_FltData+0)
JAL	_TCS3472_CalcHSL+0
NOP	
LW	R25, 16(SP)
;Sim800.c,1134 :: 		SendData(RawData,FltData,degC);
MOVZ	R27, R25, R0
LUI	R26, hi_addr(_FltData+0)
ORI	R26, R26, lo_addr(_FltData+0)
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_SendData+0
NOP	
;Sim800.c,1135 :: 		return 2;
ORI	R2, R0, 2
;Sim800.c,1136 :: 		}
;Sim800.c,1135 :: 		return 2;
;Sim800.c,1136 :: 		}
L_end_Test_Update_ThingSpeak:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Test_Update_ThingSpeak
_SendData:
;Sim800.c,1141 :: 		void SendData(unsigned int* rgbc,float* rgbh,float degC){
ADDIU	SP, SP, -416
SW	RA, 0(SP)
;Sim800.c,1145 :: 		memset(_str_,0,sizeof(_str_));
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	R2, SP, 28
SW	R27, 16(SP)
SW	R26, 20(SP)
SW	R25, 24(SP)
ORI	R27, R0, 200
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_memset+0
NOP	
LW	R25, 24(SP)
LW	R26, 20(SP)
LW	R27, 16(SP)
;Sim800.c,1147 :: 		sprintf(txtC,"%u",rgbc[0]);
LHU	R2, 0(R25)
SW	R26, 16(SP)
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
;Sim800.c,1148 :: 		sprintf(txtR,"%u",rgbc[1]);
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
;Sim800.c,1149 :: 		sprintf(txtG,"%u",rgbc[2]);
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
;Sim800.c,1150 :: 		sprintf(txtB,"%u",rgbc[3]);
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
;Sim800.c,1151 :: 		sprintf(txtR_Scl,"%3.2f",rgbh[0]);
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
;Sim800.c,1152 :: 		sprintf(txtG_Scl,"%3.2f",rgbh[1]);
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
;Sim800.c,1153 :: 		sprintf(txtB_Scl,"%3.2f",rgbh[2]);
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
;Sim800.c,1154 :: 		sprintf(txtHUE  ,"%3.2f",rgbh[4]);
ADDIU	R2, R26, 16
LW	R2, 0(R2)
SW	R26, 16(SP)
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
LW	R26, 16(SP)
;Sim800.c,1155 :: 		sprintf(txtSAT  ,"%3.2f",rgbh[5]);
ADDIU	R2, R26, 20
LW	R2, 0(R2)
SW	R26, 16(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_87_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_87_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtSAT+0)
ORI	R2, R2, lo_addr(_txtSAT+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
LW	R26, 16(SP)
;Sim800.c,1156 :: 		sprintf(txtLUM  ,"%3.2f",rgbh[6]);
ADDIU	R2, R26, 24
LW	R2, 0(R2)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_88_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_88_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtLUM+0)
ORI	R2, R2, lo_addr(_txtLUM+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,1157 :: 		sprintf(txtDegC,"%3.2f",degC);
ADDIU	SP, SP, -12
SW	R27, 8(SP)
LUI	R2, hi_addr(?lstr_89_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_89_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtDegC+0)
ORI	R2, R2, lo_addr(_txtDegC+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,1159 :: 		strncpy(_str_,str_api,46);//strlen(str_api));
ADDIU	R2, SP, 28
ORI	R27, R0, 46
LUI	R26, hi_addr(_str_api+0)
ORI	R26, R26, lo_addr(_str_api+0)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
;Sim800.c,1160 :: 		strncat(_str_,SF.WriteAPIKey,strlen(SF.WriteAPIKey));
LUI	R25, hi_addr(_SF+58)
ORI	R25, R25, lo_addr(_SF+58)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_SF+58)
ORI	R26, R26, lo_addr(_SF+58)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1162 :: 		strncat(_str_,field1,strlen(field1));
LUI	R25, hi_addr(_field1+0)
ORI	R25, R25, lo_addr(_field1+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field1+0)
ORI	R26, R26, lo_addr(_field1+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1163 :: 		strncat(_str_,txtR_Scl,strlen(txtR_Scl));
LUI	R25, hi_addr(_txtR_Scl+0)
ORI	R25, R25, lo_addr(_txtR_Scl+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtR_Scl+0)
ORI	R26, R26, lo_addr(_txtR_Scl+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1164 :: 		strncat(_str_,field2,strlen(field2));
LUI	R25, hi_addr(_field2+0)
ORI	R25, R25, lo_addr(_field2+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field2+0)
ORI	R26, R26, lo_addr(_field2+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1165 :: 		strncat(_str_,txtG_Scl,strlen(txtG_Scl));
LUI	R25, hi_addr(_txtG_Scl+0)
ORI	R25, R25, lo_addr(_txtG_Scl+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtG_Scl+0)
ORI	R26, R26, lo_addr(_txtG_Scl+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1166 :: 		strncat(_str_,field3,strlen(field3));
LUI	R25, hi_addr(_field3+0)
ORI	R25, R25, lo_addr(_field3+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field3+0)
ORI	R26, R26, lo_addr(_field3+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1167 :: 		strncat(_str_,txtB_Scl,strlen(txtB_Scl));
LUI	R25, hi_addr(_txtB_Scl+0)
ORI	R25, R25, lo_addr(_txtB_Scl+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtB_Scl+0)
ORI	R26, R26, lo_addr(_txtB_Scl+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1168 :: 		strncat(_str_,field4,strlen(field4));
LUI	R25, hi_addr(_field4+0)
ORI	R25, R25, lo_addr(_field4+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field4+0)
ORI	R26, R26, lo_addr(_field4+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1169 :: 		strncat(_str_,txtHUE,strlen(txtHUE));
LUI	R25, hi_addr(_txtHUE+0)
ORI	R25, R25, lo_addr(_txtHUE+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtHUE+0)
ORI	R26, R26, lo_addr(_txtHUE+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1170 :: 		strncat(_str_,field5,strlen(field5));
LUI	R25, hi_addr(_field5+0)
ORI	R25, R25, lo_addr(_field5+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field5+0)
ORI	R26, R26, lo_addr(_field5+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1171 :: 		strncat(_str_,txtSAT,strlen(txtSAT)); //strncat(_str_,txtR_Scl,strlen(txtR_Scl));
LUI	R25, hi_addr(_txtSAT+0)
ORI	R25, R25, lo_addr(_txtSAT+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtSAT+0)
ORI	R26, R26, lo_addr(_txtSAT+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1172 :: 		strncat(_str_,field6,strlen(field6));
LUI	R25, hi_addr(_field6+0)
ORI	R25, R25, lo_addr(_field6+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field6+0)
ORI	R26, R26, lo_addr(_field6+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1173 :: 		strncat(_str_,txtLUM,strlen(txtLUM)); //strncat(_str_,txtG_Scl,strlen(txtG_Scl));
LUI	R25, hi_addr(_txtLUM+0)
ORI	R25, R25, lo_addr(_txtLUM+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtLUM+0)
ORI	R26, R26, lo_addr(_txtLUM+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1174 :: 		strncat(_str_,field7,strlen(field7));
LUI	R25, hi_addr(_field7+0)
ORI	R25, R25, lo_addr(_field7+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field7+0)
ORI	R26, R26, lo_addr(_field7+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1175 :: 		strncat(_str_,txtC,strlen(txtC)); //strncat(_str_,txtB_Scl,strlen(txtB_Scl));
LUI	R25, hi_addr(_txtC+0)
ORI	R25, R25, lo_addr(_txtC+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtC+0)
ORI	R26, R26, lo_addr(_txtC+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1176 :: 		strncat(_str_,field8,strlen(field8));
LUI	R25, hi_addr(_field8+0)
ORI	R25, R25, lo_addr(_field8+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_field8+0)
ORI	R26, R26, lo_addr(_field8+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1177 :: 		strncat(_str_,txtDegC,strlen(txtDegC));
LUI	R25, hi_addr(_txtDegC+0)
ORI	R25, R25, lo_addr(_txtDegC+0)
JAL	_strlen+0
NOP	
ADDIU	R3, SP, 28
SEH	R27, R2
LUI	R26, hi_addr(_txtDegC+0)
ORI	R26, R26, lo_addr(_txtDegC+0)
MOVZ	R25, R3, R0
JAL	_strncat+0
NOP	
;Sim800.c,1182 :: 		,_str_);
ADDIU	R2, SP, 28
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,1181 :: 		" *    %s\r\n"
LUI	R2, hi_addr(?lstr_90_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_90_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,1180 :: 		PrintOut(PrintHandler, "String for ThingSpeak: \r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1182 :: 		,_str_);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,1186 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 228
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr91_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr91_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 228
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1187 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1188 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1189 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1190 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_SendData201:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData201
NOP	
NOP	
NOP	
;Sim800.c,1192 :: 		UART2_Write_Text("AT+CPIN?");
ADDIU	R23, SP, 239
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr92_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr92_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 239
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1193 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1194 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1195 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1196 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData203:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData203
NOP	
NOP	
;Sim800.c,1197 :: 		UART2_Write_Text("AT+CREG?");
ADDIU	R23, SP, 248
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr93_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr93_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 248
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1198 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1199 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1200 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1201 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData205:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData205
NOP	
NOP	
;Sim800.c,1202 :: 		UART2_Write_Text("AT+CGATT?");
ADDIU	R23, SP, 257
ADDIU	R22, R23, 10
LUI	R24, hi_addr(?ICS?lstr94_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr94_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 257
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1203 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1204 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1205 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1206 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData207:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData207
NOP	
NOP	
;Sim800.c,1207 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 267
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr95_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr95_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 267
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1208 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1209 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1210 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1211 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData209:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData209
NOP	
NOP	
;Sim800.c,1212 :: 		UART2_Write_Text("AT+CIPSTATUS");
ADDIU	R23, SP, 278
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr96_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr96_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 278
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1213 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1214 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1215 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1216 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData211:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData211
NOP	
NOP	
;Sim800.c,1217 :: 		UART2_Write_Text("AT+CIPMUX=0");
ADDIU	R23, SP, 291
ADDIU	R22, R23, 12
LUI	R24, hi_addr(?ICS?lstr97_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr97_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 291
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1218 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1219 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1220 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1221 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData213:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData213
NOP	
NOP	
;Sim800.c,1222 :: 		UART2_Write_Text("AT+CSTT=");//\"data.uk\",\"user\",\"one2one\"");
ADDIU	R23, SP, 303
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr98_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr98_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 303
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1223 :: 		UART2_Write_Text(SF.APN);
LUI	R25, hi_addr(_SF+98)
ORI	R25, R25, lo_addr(_SF+98)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1224 :: 		UART2_Write_Text(",\"user\",");
ADDIU	R23, SP, 312
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr99_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr99_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 312
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1225 :: 		UART2_Write_Text(SF.PWD);
LUI	R25, hi_addr(_SF+118)
ORI	R25, R25, lo_addr(_SF+118)
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1226 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1227 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1228 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1229 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData215:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData215
NOP	
NOP	
;Sim800.c,1230 :: 		UART2_Write_Text("AT+CIICR");
ADDIU	R23, SP, 321
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr100_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr100_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 321
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1231 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1232 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1233 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1234 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData217:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData217
NOP	
NOP	
;Sim800.c,1235 :: 		UART2_Write_Text("AT+CIFSR");
ADDIU	R23, SP, 330
ADDIU	R22, R23, 9
LUI	R24, hi_addr(?ICS?lstr101_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr101_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 330
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1236 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1237 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1238 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData219:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData219
NOP	
;Sim800.c,1239 :: 		UART2_Write_Text("AT+CIPSPRT=1");
ADDIU	R23, SP, 339
ADDIU	R22, R23, 13
LUI	R24, hi_addr(?ICS?lstr102_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr102_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 339
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1240 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1241 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1242 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1243 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData221:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData221
NOP	
NOP	
;Sim800.c,1244 :: 		UART2_Write_Text("AT+CIPSTART=\"TCP\",\"api.thingspeak.com\",80");
ADDIU	R23, SP, 352
ADDIU	R22, R23, 42
LUI	R24, hi_addr(?ICS?lstr103_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr103_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 352
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1245 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1246 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1247 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1248 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData223:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData223
NOP	
;Sim800.c,1249 :: 		UART2_Write_Text("AT+CIPSEND");
ADDIU	R23, SP, 394
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr104_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr104_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 394
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1250 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1251 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1252 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SendData225:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData225
NOP	
;Sim800.c,1253 :: 		UART2_Write_Text(_str_);
ADDIU	R2, SP, 28
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1254 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1255 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1256 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1257 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1258 :: 		UART2_Write(0x1A);
ORI	R25, R0, 26
JAL	_UART2_Write+0
NOP	
;Sim800.c,1259 :: 		TestForOK(1);
ORI	R25, R0, 1
JAL	_TestForOK+0
NOP	
;Sim800.c,1260 :: 		Delay_ms(150);
LUI	R24, 61
ORI	R24, R24, 2303
L_SendData227:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData227
NOP	
NOP	
;Sim800.c,1261 :: 		UART2_Write_Text("AT+CIPSHUT");
ADDIU	R23, SP, 405
ADDIU	R22, R23, 11
LUI	R24, hi_addr(?ICS?lstr105_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr105_Sim800+0)
JAL	___CC2DW+0
NOP	
ADDIU	R2, SP, 405
MOVZ	R25, R2, R0
JAL	_UART2_Write_Text+0
NOP	
;Sim800.c,1262 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1263 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1264 :: 		TestForOK(0);
MOVZ	R25, R0, R0
JAL	_TestForOK+0
NOP	
;Sim800.c,1265 :: 		Delay_ms(50);
LUI	R24, 20
ORI	R24, R24, 22612
L_SendData229:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SendData229
NOP	
NOP	
NOP	
;Sim800.c,1268 :: 		}
L_end_SendData:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 416
JR	RA
NOP	
; end of _SendData
_SignalStrength:
;Sim800.c,1273 :: 		int  SignalStrength(){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;Sim800.c,1278 :: 		clr_str_arrays(string);
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_clr_str_arrays+0
NOP	
;Sim800.c,1280 :: 		UART2_Write_Text("AT+CSQ");
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
;Sim800.c,1281 :: 		UART2_Write(0x0D);
ORI	R25, R0, 13
JAL	_UART2_Write+0
NOP	
;Sim800.c,1282 :: 		UART2_Write(0x0A);
ORI	R25, R0, 10
JAL	_UART2_Write+0
NOP	
;Sim800.c,1283 :: 		WaitForResponse(1);
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
;Sim800.c,1284 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,1285 :: 		Delay_ms(250);
LUI	R24, 101
ORI	R24, R24, 47530
L_SignalStrength231:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SignalStrength231
NOP	
;Sim800.c,1289 :: 		"**Signal Strength** \r\n");
LUI	R2, hi_addr(?lstr_107_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_107_Sim800+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
;Sim800.c,1288 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1289 :: 		"**Signal Strength** \r\n");
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 8
;Sim800.c,1296 :: 		num_strs = strsplit(SimTestTxt,',');
ORI	R26, R0, 44
LUI	R25, hi_addr(_SimTestTxt+0)
ORI	R25, R25, lo_addr(_SimTestTxt+0)
JAL	_strsplit+0
NOP	
; num_strs start address is: 12 (R3)
SEH	R3, R2
;Sim800.c,1298 :: 		strncpy(string[0],RemoveChars(string[0],':','\0'),2);
SH	R3, 16(SP)
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
LH	R3, 16(SP)
;Sim800.c,1300 :: 		for(i=0;i<10;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; num_strs end address is: 12 (R3)
; i end address is: 16 (R4)
SEH	R7, R3
L_SignalStrength233:
; i start address is: 16 (R4)
; num_strs start address is: 28 (R7)
SEH	R2, R4
SLTI	R2, R2, 10
BNE	R2, R0, L__SignalStrength477
NOP	
J	L_SignalStrength234
NOP	
L__SignalStrength477:
;Sim800.c,1301 :: 		if(!isdigit(*(string[1]+i))){
SEH	R3, R4
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
ADDU	R2, R2, R3
LBU	R25, 0(R2)
JAL	_isdigit+0
NOP	
BEQ	R2, R0, L__SignalStrength478
NOP	
J	L_SignalStrength236
NOP	
L__SignalStrength478:
;Sim800.c,1302 :: 		string[1][i] = '\0';
SEH	R3, R4
; i end address is: 16 (R4)
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
ADDU	R2, R2, R3
SB	R0, 0(R2)
;Sim800.c,1303 :: 		break;
J	L_SignalStrength234
NOP	
;Sim800.c,1304 :: 		}
L_SignalStrength236:
;Sim800.c,1300 :: 		for(i=0;i<10;i++){
; i start address is: 16 (R4)
ADDIU	R2, R4, 1
SEH	R4, R2
;Sim800.c,1305 :: 		}
; i end address is: 16 (R4)
J	L_SignalStrength233
NOP	
L_SignalStrength234:
;Sim800.c,1307 :: 		is_digit = isdigit(string[0][1]);
LBU	R25, Offset(_string+1)(GP)
JAL	_isdigit+0
NOP	
; is_digit start address is: 84 (R21)
ANDI	R21, R2, 65535
;Sim800.c,1308 :: 		if(is_digit)
BNE	R2, R0, L__SignalStrength480
NOP	
J	L_SignalStrength237
NOP	
L__SignalStrength480:
;Sim800.c,1309 :: 		SimVars.rssi = atoi(string[0]);
LUI	R25, hi_addr(_string+0)
ORI	R25, R25, lo_addr(_string+0)
JAL	_atoi+0
NOP	
SH	R2, Offset(_SimVars+6)(GP)
J	L_SignalStrength238
NOP	
L_SignalStrength237:
;Sim800.c,1311 :: 		SimVars.rssi = 0;
SH	R0, Offset(_SimVars+6)(GP)
L_SignalStrength238:
;Sim800.c,1313 :: 		sprintf(sms,"%d",num_strs);
ADDIU	SP, SP, -12
SH	R7, 8(SP)
; num_strs end address is: 28 (R7)
LUI	R2, hi_addr(?lstr_108_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_108_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,1314 :: 		sprintf(txtA,"%d",is_digit);
ADDIU	SP, SP, -12
SH	R21, 8(SP)
; is_digit end address is: 84 (R21)
LUI	R2, hi_addr(?lstr_109_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_109_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,1315 :: 		sprintf(txtS,"%d",SimVars.rssi);
LH	R2, Offset(_SimVars+6)(GP)
ADDIU	SP, SP, -12
SH	R2, 8(SP)
LUI	R2, hi_addr(?lstr_110_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_110_Sim800+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtS+0)
ORI	R2, R2, lo_addr(_txtS+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 12
;Sim800.c,1330 :: 		,string[6],txtA,txtS);
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
;Sim800.c,1329 :: 		,string[4],string[5]
LUI	R2, hi_addr(_string+320)
ORI	R2, R2, lo_addr(_string+320)
SW	R2, 32(SP)
LUI	R2, hi_addr(_string+256)
ORI	R2, R2, lo_addr(_string+256)
SW	R2, 28(SP)
;Sim800.c,1328 :: 		,string[2],string[3]
LUI	R2, hi_addr(_string+192)
ORI	R2, R2, lo_addr(_string+192)
SW	R2, 24(SP)
LUI	R2, hi_addr(_string+128)
ORI	R2, R2, lo_addr(_string+128)
SW	R2, 20(SP)
;Sim800.c,1327 :: 		,sms,string[0],string[1]
LUI	R2, hi_addr(_string+64)
ORI	R2, R2, lo_addr(_string+64)
SW	R2, 16(SP)
LUI	R2, hi_addr(_string+0)
ORI	R2, R2, lo_addr(_string+0)
SW	R2, 12(SP)
LUI	R2, hi_addr(_sms+0)
ORI	R2, R2, lo_addr(_sms+0)
SW	R2, 8(SP)
;Sim800.c,1326 :: 		" *rssi:=     %s\r\n"
LUI	R2, hi_addr(?lstr_111_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_111_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,1316 :: 		PrintOut(PrintHandler, "\r\n"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1330 :: 		,string[6],txtA,txtS);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 48
;Sim800.c,1334 :: 		PWM_SigStrength(SimVars.rssi);
LH	R25, Offset(_SimVars+6)(GP)
JAL	_PWM_SigStrength+0
NOP	
;Sim800.c,1335 :: 		return SimVars.rssi;
LH	R2, Offset(_SimVars+6)(GP)
;Sim800.c,1336 :: 		}
;Sim800.c,1335 :: 		return SimVars.rssi;
;Sim800.c,1336 :: 		}
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
;Sim800.c,1341 :: 		void PWM_SigStrength(int sigstrength){
;Sim800.c,1342 :: 		T2CONCLR = 0x8008;
ORI	R2, R0, 32776
SW	R2, Offset(T2CONCLR+0)(GP)
;Sim800.c,1343 :: 		if(sigstrength < 6){
SEH	R2, R25
SLTI	R2, R2, 6
BNE	R2, R0, L__PWM_SigStrength482
NOP	
J	L_PWM_SigStrength239
NOP	
L__PWM_SigStrength482:
;Sim800.c,1344 :: 		PR4 = 46080; PR5 = 1220;  //1000ms    1  - 5 weak
ORI	R2, R0, 46080
SW	R2, Offset(PR4+0)(GP)
ORI	R2, R0, 1220
SW	R2, Offset(PR5+0)(GP)
;Sim800.c,1345 :: 		}else if(sigstrength >= 6 && sigstrength < 11){
J	L_PWM_SigStrength240
NOP	
L_PWM_SigStrength239:
SEH	R2, R25
SLTI	R2, R2, 6
BEQ	R2, R0, L__PWM_SigStrength483
NOP	
J	L__PWM_SigStrength308
NOP	
L__PWM_SigStrength483:
SEH	R2, R25
SLTI	R2, R2, 11
BNE	R2, R0, L__PWM_SigStrength484
NOP	
J	L__PWM_SigStrength307
NOP	
L__PWM_SigStrength484:
L__PWM_SigStrength306:
;Sim800.c,1346 :: 		PR4 = 32256; PR5 = 854;  //700ms     6  - 10
ORI	R2, R0, 32256
SW	R2, Offset(PR4+0)(GP)
ORI	R2, R0, 854
SW	R2, Offset(PR5+0)(GP)
;Sim800.c,1347 :: 		}else if(sigstrength >= 11 && sigstrength < 16){
J	L_PWM_SigStrength244
NOP	
;Sim800.c,1345 :: 		}else if(sigstrength >= 6 && sigstrength < 11){
L__PWM_SigStrength308:
L__PWM_SigStrength307:
;Sim800.c,1347 :: 		}else if(sigstrength >= 11 && sigstrength < 16){
SEH	R2, R25
SLTI	R2, R2, 11
BEQ	R2, R0, L__PWM_SigStrength485
NOP	
J	L__PWM_SigStrength310
NOP	
L__PWM_SigStrength485:
SEH	R2, R25
SLTI	R2, R2, 16
BNE	R2, R0, L__PWM_SigStrength486
NOP	
J	L__PWM_SigStrength309
NOP	
L__PWM_SigStrength486:
L__PWM_SigStrength305:
;Sim800.c,1348 :: 		PR4 = 23040; PR5 = 610;  //500ms     11 - 15
ORI	R2, R0, 23040
SW	R2, Offset(PR4+0)(GP)
ORI	R2, R0, 610
SW	R2, Offset(PR5+0)(GP)
;Sim800.c,1349 :: 		}else if(sigstrength >= 16 && sigstrength < 22){
J	L_PWM_SigStrength248
NOP	
;Sim800.c,1347 :: 		}else if(sigstrength >= 11 && sigstrength < 16){
L__PWM_SigStrength310:
L__PWM_SigStrength309:
;Sim800.c,1349 :: 		}else if(sigstrength >= 16 && sigstrength < 22){
SEH	R2, R25
SLTI	R2, R2, 16
BEQ	R2, R0, L__PWM_SigStrength487
NOP	
J	L__PWM_SigStrength312
NOP	
L__PWM_SigStrength487:
SEH	R2, R25
SLTI	R2, R2, 22
BNE	R2, R0, L__PWM_SigStrength488
NOP	
J	L__PWM_SigStrength311
NOP	
L__PWM_SigStrength488:
L__PWM_SigStrength304:
;Sim800.c,1350 :: 		PR4 = 11520; PR5 = 305;  //250ms     16 - 21 medium
ORI	R2, R0, 11520
SW	R2, Offset(PR4+0)(GP)
ORI	R2, R0, 305
SW	R2, Offset(PR5+0)(GP)
;Sim800.c,1351 :: 		}else if(sigstrength >= 22 && sigstrength < 26){
J	L_PWM_SigStrength252
NOP	
;Sim800.c,1349 :: 		}else if(sigstrength >= 16 && sigstrength < 22){
L__PWM_SigStrength312:
L__PWM_SigStrength311:
;Sim800.c,1351 :: 		}else if(sigstrength >= 22 && sigstrength < 26){
SEH	R2, R25
SLTI	R2, R2, 22
BEQ	R2, R0, L__PWM_SigStrength489
NOP	
J	L__PWM_SigStrength314
NOP	
L__PWM_SigStrength489:
SEH	R2, R25
SLTI	R2, R2, 26
BNE	R2, R0, L__PWM_SigStrength490
NOP	
J	L__PWM_SigStrength313
NOP	
L__PWM_SigStrength490:
L__PWM_SigStrength303:
;Sim800.c,1352 :: 		PR4 = 4608;  PR5 = 122;  //100ms     22 - 25
ORI	R2, R0, 4608
SW	R2, Offset(PR4+0)(GP)
ORI	R2, R0, 122
SW	R2, Offset(PR5+0)(GP)
;Sim800.c,1353 :: 		}else if(sigstrength >= 26 && sigstrength < 30){
J	L_PWM_SigStrength256
NOP	
;Sim800.c,1351 :: 		}else if(sigstrength >= 22 && sigstrength < 26){
L__PWM_SigStrength314:
L__PWM_SigStrength313:
;Sim800.c,1353 :: 		}else if(sigstrength >= 26 && sigstrength < 30){
SEH	R2, R25
SLTI	R2, R2, 26
BEQ	R2, R0, L__PWM_SigStrength491
NOP	
J	L__PWM_SigStrength316
NOP	
L__PWM_SigStrength491:
SEH	R2, R25
SLTI	R2, R2, 30
BNE	R2, R0, L__PWM_SigStrength492
NOP	
J	L__PWM_SigStrength315
NOP	
L__PWM_SigStrength492:
L__PWM_SigStrength302:
;Sim800.c,1354 :: 		PR4 = 2304;  PR5 = 61;  //50ms       26 - 31
ORI	R2, R0, 2304
SW	R2, Offset(PR4+0)(GP)
ORI	R2, R0, 61
SW	R2, Offset(PR5+0)(GP)
;Sim800.c,1355 :: 		}else{
J	L_PWM_SigStrength260
NOP	
;Sim800.c,1353 :: 		}else if(sigstrength >= 26 && sigstrength < 30){
L__PWM_SigStrength316:
L__PWM_SigStrength315:
;Sim800.c,1356 :: 		PR4 = 14464;  PR5 = 1;  //1ms        >30   strong
ORI	R2, R0, 14464
SW	R2, Offset(PR4+0)(GP)
ORI	R2, R0, 1
SW	R2, Offset(PR5+0)(GP)
;Sim800.c,1357 :: 		}
L_PWM_SigStrength260:
L_PWM_SigStrength256:
L_PWM_SigStrength252:
L_PWM_SigStrength248:
L_PWM_SigStrength244:
L_PWM_SigStrength240:
;Sim800.c,1358 :: 		TMR4 = 0;
SW	R0, Offset(TMR4+0)(GP)
;Sim800.c,1359 :: 		TMR5 = 0;
SW	R0, Offset(TMR5+0)(GP)
;Sim800.c,1360 :: 		T4CONSET = 0x8008;
ORI	R2, R0, 32776
SW	R2, Offset(T4CONSET+0)(GP)
;Sim800.c,1361 :: 		T5IF_bit      = 0;
LUI	R2, BitMask(T5IF_bit+0)
ORI	R2, R2, BitMask(T5IF_bit+0)
_SX	
;Sim800.c,1362 :: 		T5IE_bit      = 1;
LUI	R2, BitMask(T5IE_bit+0)
ORI	R2, R2, BitMask(T5IE_bit+0)
_SX	
;Sim800.c,1363 :: 		}
L_end_PWM_SigStrength:
JR	RA
NOP	
; end of _PWM_SigStrength
_TestForOK:
;Sim800.c,1370 :: 		void TestForOK(char c){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Sim800.c,1372 :: 		WaitForResponse(1);
SW	R26, 4(SP)
SB	R25, 8(SP)
ORI	R25, R0, 1
JAL	_WaitForResponse+0
NOP	
LBU	R25, 8(SP)
;Sim800.c,1373 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_TestForOK261:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TestForOK261
NOP	
;Sim800.c,1374 :: 		RingToTempBuf();
JAL	_RingToTempBuf+0
NOP	
;Sim800.c,1378 :: 		,SimTestTxt);
LUI	R2, hi_addr(_SimTestTxt+0)
ORI	R2, R2, lo_addr(_SimTestTxt+0)
SB	R25, 8(SP)
ADDIU	SP, SP, -12
SW	R2, 8(SP)
;Sim800.c,1377 :: 		" *    %s\r\n"
LUI	R2, hi_addr(?lstr_112_Sim800+0)
ORI	R2, R2, lo_addr(?lstr_112_Sim800+0)
SW	R2, 4(SP)
;Sim800.c,1376 :: 		PrintOut(PrintHandler, "Test for OK:"
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
;Sim800.c,1378 :: 		,SimTestTxt);
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
LBU	R25, 8(SP)
;Sim800.c,1382 :: 		lastMillis = TMR0.millis;
; lastMillis start address is: 16 (R4)
LW	R4, Offset(_TMR0+0)(GP)
;Sim800.c,1383 :: 		if(c == 0)
ANDI	R2, R25, 255
BEQ	R2, R0, L__TestForOK494
NOP	
J	L_TestForOK263
NOP	
L__TestForOK494:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
;Sim800.c,1384 :: 		while(!strstr(SimTestTxt, "OK")){
L_TestForOK264:
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
BEQ	R2, R0, L__TestForOK495
NOP	
J	L_TestForOK265
NOP	
L__TestForOK495:
; lastMillis end address is: 20 (R5)
;Sim800.c,1385 :: 		newMillis = TMR0.millis - lastMillis;
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,1386 :: 		if(newMillis > 5000)
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK496
NOP	
J	L_TestForOK266
NOP	
L__TestForOK496:
; lastMillis end address is: 20 (R5)
;Sim800.c,1387 :: 		break;
J	L_TestForOK265
NOP	
L_TestForOK266:
;Sim800.c,1388 :: 		}
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK264
NOP	
L_TestForOK265:
J	L_TestForOK267
NOP	
L_TestForOK263:
;Sim800.c,1389 :: 		else if(c == 1)
; lastMillis start address is: 16 (R4)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__TestForOK497
NOP	
J	L_TestForOK268
NOP	
L__TestForOK497:
; lastMillis end address is: 16 (R4)
MOVZ	R5, R4, R0
;Sim800.c,1390 :: 		while(!strstr(SimTestTxt, "CONNECT")){
L_TestForOK269:
; lastMillis start address is: 20 (R5)
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
ADDIU	R23, SP, 12
ADDIU	R22, R23, 8
LUI	R24, hi_addr(?ICS?lstr114_Sim800+0)
ORI	R24, R24, lo_addr(?ICS?lstr114_Sim800+0)
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
BEQ	R2, R0, L__TestForOK498
NOP	
J	L_TestForOK270
NOP	
L__TestForOK498:
; lastMillis end address is: 20 (R5)
;Sim800.c,1391 :: 		newMillis = TMR0.millis - lastMillis;
; lastMillis start address is: 20 (R5)
LW	R2, Offset(_TMR0+0)(GP)
SUBU	R2, R2, R5
;Sim800.c,1392 :: 		if(newMillis > 5000)
SLTIU	R2, R2, 5001
BEQ	R2, R0, L__TestForOK499
NOP	
J	L_TestForOK271
NOP	
L__TestForOK499:
; lastMillis end address is: 20 (R5)
;Sim800.c,1393 :: 		break;
J	L_TestForOK270
NOP	
L_TestForOK271:
;Sim800.c,1394 :: 		}
; lastMillis start address is: 20 (R5)
; lastMillis end address is: 20 (R5)
J	L_TestForOK269
NOP	
L_TestForOK270:
L_TestForOK268:
L_TestForOK267:
;Sim800.c,1395 :: 		}
L_end_TestForOK:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _TestForOK
