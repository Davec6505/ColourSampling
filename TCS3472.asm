_TCS3472_Init:
;TCS3472.c,13 :: 		unsigned short TCS3472_Init(TCS3472_IntegrationTime_t It,TCS3472_Gain_t gain, TCS3472x Id ){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,16 :: 		id = TCS3472_Read8(TCS3472_ID);
SW	R25, 4(SP)
SB	R26, 8(SP)
SB	R25, 9(SP)
ORI	R25, R0, 18
JAL	_TCS3472_Read8+0
NOP	
LBU	R25, 9(SP)
LBU	R26, 8(SP)
SB	R2, 10(SP)
;TCS3472.c,18 :: 		return 0x00;
L_TCS3472_Init0:
;TCS3472.c,19 :: 		if(!TCS3472_Initialised){
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_Init28
NOP	
J	L_TCS3472_Init1
NOP	
L__TCS3472_Init28:
;TCS3472.c,20 :: 		TCS3472_Initialised = 1;
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_TCS3472_Bits+0)(GP)
;TCS3472.c,21 :: 		TCS3472_SetIntergration_Time(It);
SB	R26, 8(SP)
JAL	_TCS3472_SetIntergration_Time+0
NOP	
LBU	R26, 8(SP)
;TCS3472.c,22 :: 		TCS3472_SetGain(gain);
ANDI	R25, R26, 255
JAL	_TCS3472_SetGain+0
NOP	
;TCS3472.c,23 :: 		TCS3472_Enable();
JAL	_TCS3472_Enable+0
NOP	
;TCS3472.c,24 :: 		}
L_TCS3472_Init1:
;TCS3472.c,25 :: 		return id;
LBU	R2, 10(SP)
;TCS3472.c,26 :: 		}
;TCS3472.c,25 :: 		return id;
;TCS3472.c,26 :: 		}
L_end_TCS3472_Init:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Init
_TCS3472_Write:
;TCS3472.c,28 :: 		void TCS3472_Write(unsigned short cmd){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;TCS3472.c,29 :: 		I2C2_Start();                      // issue I2C start signal
SB	R25, 4(SP)
JAL	_I2C2_Start+0
NOP	
;TCS3472.c,30 :: 		I2C2_Write(TCS3472_ADDW);          // send byte via I2C  (slave address)
ORI	R25, R0, 82
JAL	_I2C2_Write+0
NOP	
LBU	R25, 4(SP)
;TCS3472.c,31 :: 		I2C2_Write(cmd);                  // send byte (command reg MSB)
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,32 :: 		I2C2_Stop();
JAL	_I2C2_Stop+0
NOP	
;TCS3472.c,33 :: 		}
L_end_TCS3472_Write:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TCS3472_Write
_TCS3472_Write8:
;TCS3472.c,35 :: 		void TCS3472_Write8(unsigned short reg_add, unsigned short value){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,36 :: 		I2C2_Start();                      // issue I2C start signal
SW	R25, 4(SP)
SB	R26, 8(SP)
SB	R25, 9(SP)
JAL	_I2C2_Start+0
NOP	
;TCS3472.c,37 :: 		I2C2_Write(TCS3472_ADDW);          // send byte via I2C  (slave address)
ORI	R25, R0, 82
JAL	_I2C2_Write+0
NOP	
LBU	R25, 9(SP)
;TCS3472.c,38 :: 		I2C2_Write(TCS3472_CMD_BIT | reg_add);       // send byte (command reg MSB)
ORI	R2, R25, 128
ANDI	R25, R2, 255
JAL	_I2C2_Write+0
NOP	
LBU	R26, 8(SP)
;TCS3472.c,39 :: 		I2C2_Write(value);                 // send byte (data to be written)
ANDI	R25, R26, 255
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,40 :: 		I2C2_Stop();                       // issue I2C stop signal
JAL	_I2C2_Stop+0
NOP	
;TCS3472.c,42 :: 		}
L_end_TCS3472_Write8:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Write8
_TCS3472_Read8:
;TCS3472.c,44 :: 		unsigned short TCS3472_Read8(unsigned short reg_add){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,46 :: 		I2C2_Start();                   // issue I2C start signal
SW	R25, 4(SP)
SB	R25, 8(SP)
JAL	_I2C2_Start+0
NOP	
;TCS3472.c,47 :: 		I2C2_Write(TCS3472_ADDW);       // send byte via I2C  (device address + W)
ORI	R25, R0, 82
JAL	_I2C2_Write+0
NOP	
LBU	R25, 8(SP)
;TCS3472.c,48 :: 		I2C2_Write(TCS3472_CMD_BIT | reg_add);            // send byte (data address)
ORI	R2, R25, 128
ANDI	R25, R2, 255
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,49 :: 		I2C2_Stop();
JAL	_I2C2_Stop+0
NOP	
;TCS3472.c,50 :: 		I2C2_Start();
JAL	_I2C2_Start+0
NOP	
;TCS3472.c,51 :: 		I2C2_Write(TCS3472_ADDR);
ORI	R25, R0, 83
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,52 :: 		temp = I2C2_Read(1);   // Read the data (NO acknowledge)
ORI	R25, R0, 1
JAL	_I2C2_Read+0
NOP	
SB	R2, 9(SP)
;TCS3472.c,53 :: 		I2C2_Stop();
JAL	_I2C2_Stop+0
NOP	
;TCS3472.c,54 :: 		return temp;
LBU	R2, 9(SP)
;TCS3472.c,55 :: 		}
;TCS3472.c,54 :: 		return temp;
;TCS3472.c,55 :: 		}
L_end_TCS3472_Read8:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Read8
_TCS3472_Read16:
;TCS3472.c,57 :: 		unsigned int TCS3472_Read16(unsigned short reg_add){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;TCS3472.c,60 :: 		I2C2_Start();              // issue I2C start signal
SW	R25, 4(SP)
SB	R25, 8(SP)
JAL	_I2C2_Start+0
NOP	
;TCS3472.c,61 :: 		I2C2_Write(TCS3472_ADDW);          // send byte via I2C  (device address + W)
ORI	R25, R0, 82
JAL	_I2C2_Write+0
NOP	
LBU	R25, 8(SP)
;TCS3472.c,62 :: 		I2C2_Write(TCS3472_CMD_AUTO_INC | reg_add);       // send byte (command reg MSB)
ORI	R2, R25, 160
ANDI	R25, R2, 255
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,63 :: 		I2C_ReStart();           // issue I2C signal repeated start
JAL	_I2C_Restart+0
NOP	
;TCS3472.c,64 :: 		I2C2_Write(TCS3472_ADDR);          // send byte (device address + R)
ORI	R25, R0, 83
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,65 :: 		temp[0] = I2C2_Read(_I2C_ACK);      // Read the data (NO acknowledge)
ADDIU	R2, SP, 9
SW	R2, 12(SP)
MOVZ	R25, R0, R0
JAL	_I2C2_Read+0
NOP	
LW	R3, 12(SP)
SB	R2, 0(R3)
;TCS3472.c,66 :: 		temp[1] = I2C2_Read(_I2C_NACK);
ADDIU	R2, SP, 9
ADDIU	R2, R2, 1
SW	R2, 12(SP)
ORI	R25, R0, 1
JAL	_I2C2_Read+0
NOP	
LW	R3, 12(SP)
SB	R2, 0(R3)
;TCS3472.c,67 :: 		I2C2_Stop();
JAL	_I2C2_Stop+0
NOP	
;TCS3472.c,68 :: 		reslt = temp[0];
ADDIU	R4, SP, 9
LBU	R2, 0(R4)
; reslt start address is: 12 (R3)
ANDI	R3, R2, 255
;TCS3472.c,69 :: 		reslt = (reslt << 8) | temp[1];
ANDI	R2, R3, 65535
; reslt end address is: 12 (R3)
SLL	R3, R2, 8
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;TCS3472.c,70 :: 		return reslt;
;TCS3472.c,71 :: 		}
;TCS3472.c,70 :: 		return reslt;
;TCS3472.c,71 :: 		}
L_end_TCS3472_Read16:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _TCS3472_Read16
_TCS3472_Enable:
;TCS3472.c,73 :: 		void TCS3472_Enable(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,74 :: 		TCS3472_Write8(TCS3472_EN, TCS3472_EN_PON);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,75 :: 		Delay_ms(3);
LUI	R24, 1
ORI	R24, R24, 14463
L_TCS3472_Enable2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TCS3472_Enable2
NOP	
NOP	
;TCS3472.c,76 :: 		TCS3472_Write8(TCS3472_EN, TCS3472_EN_PON | TCS3472_EN_AEN);
ORI	R26, R0, 3
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,77 :: 		}
L_end_TCS3472_Enable:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Enable
_TCS3472_Disable:
;TCS3472.c,79 :: 		void TCS3472_Disable(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,81 :: 		read = TCS3472_Read8(TCS3472_EN);
SW	R25, 4(SP)
SW	R26, 8(SP)
MOVZ	R25, R0, R0
JAL	_TCS3472_Read8+0
NOP	
;TCS3472.c,82 :: 		TCS3472_Write8(TCS3472_EN, read & ~(TCS3472_EN_PON | TCS3472_EN_AEN));
ORI	R3, R0, 252
AND	R2, R2, R3
ANDI	R26, R2, 255
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,83 :: 		}
L_end_TCS3472_Disable:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Disable
_TCS3472_SetIntergration_Time:
;TCS3472.c,85 :: 		unsigned short TCS3472_SetIntergration_Time(TCS3472_IntegrationTime_t It){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,86 :: 		if(!TCS3472_Initialised)
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_SetIntergration_Time36
NOP	
J	L_TCS3472_SetIntergration_Time4
NOP	
L__TCS3472_SetIntergration_Time36:
;TCS3472.c,87 :: 		return 0x00;
MOVZ	R2, R0, R0
J	L_end_TCS3472_SetIntergration_Time
NOP	
L_TCS3472_SetIntergration_Time4:
;TCS3472.c,89 :: 		TCS3472_Write8(TCS3472_ATIME, It);
ANDI	R26, R25, 255
ORI	R25, R0, 1
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,90 :: 		return 0x01;
ORI	R2, R0, 1
;TCS3472.c,91 :: 		}
;TCS3472.c,90 :: 		return 0x01;
;TCS3472.c,91 :: 		}
L_end_TCS3472_SetIntergration_Time:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_SetIntergration_Time
_TCS3472_SetGain:
;TCS3472.c,93 :: 		unsigned short TCS3472_SetGain(TCS3472_Gain_t gain){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,94 :: 		if(!TCS3472_Initialised)
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_SetGain38
NOP	
J	L_TCS3472_SetGain5
NOP	
L__TCS3472_SetGain38:
;TCS3472.c,95 :: 		return 0x00;
MOVZ	R2, R0, R0
J	L_end_TCS3472_SetGain
NOP	
L_TCS3472_SetGain5:
;TCS3472.c,96 :: 		TCS3472_Write8(TCS3472_CONTROL, gain);
ANDI	R26, R25, 255
ORI	R25, R0, 15
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,97 :: 		return 0x01;
ORI	R2, R0, 1
;TCS3472.c,98 :: 		}
;TCS3472.c,97 :: 		return 0x01;
;TCS3472.c,98 :: 		}
L_end_TCS3472_SetGain:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_SetGain
_TCS3472_getRawData:
;TCS3472.c,100 :: 		void TCS3472_getRawData(unsigned int *RGBC){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;TCS3472.c,101 :: 		*(RGBC) = TCS3472_Read16(TCS3472_CDATAL);
SW	R25, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
LW	R25, 8(SP)
SH	R2, 0(R25)
;TCS3472.c,102 :: 		*(RGBC + 1) = TCS3472_Read16(TCS3472_RDATAL);
ADDIU	R2, R25, 2
SW	R2, 12(SP)
SW	R25, 8(SP)
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
LW	R25, 8(SP)
LW	R3, 12(SP)
SH	R2, 0(R3)
;TCS3472.c,103 :: 		*(RGBC + 2) = TCS3472_Read16(TCS3472_GDATAL);
ADDIU	R2, R25, 4
SW	R2, 12(SP)
SW	R25, 8(SP)
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
LW	R25, 8(SP)
LW	R3, 12(SP)
SH	R2, 0(R3)
;TCS3472.c,104 :: 		*(RGBC + 3) = TCS3472_Read16(TCS3472_BDATAL);
ADDIU	R2, R25, 6
SW	R2, 12(SP)
ORI	R25, R0, 26
JAL	_TCS3472_Read16+0
NOP	
LW	R3, 12(SP)
SH	R2, 0(R3)
;TCS3472.c,105 :: 		}
L_end_TCS3472_getRawData:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _TCS3472_getRawData
_TCS3472_getRawDataOnce:
;TCS3472.c,107 :: 		void TCS3472_getRawDataOnce(unsigned int *RGBC){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;TCS3472.c,108 :: 		TCS3472_Enable();
SW	R25, 4(SP)
JAL	_TCS3472_Enable+0
NOP	
LW	R25, 4(SP)
;TCS3472.c,109 :: 		TCS3472_getRawData(RGBC);
JAL	_TCS3472_getRawData+0
NOP	
;TCS3472.c,110 :: 		TCS3472_Disable();
JAL	_TCS3472_Disable+0
NOP	
;TCS3472.c,111 :: 		}
L_end_TCS3472_getRawDataOnce:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TCS3472_getRawDataOnce
_TCS3472_CalcColTemp:
;TCS3472.c,113 :: 		unsigned int TCS3472_CalcColTemp(unsigned int R,unsigned int G,unsigned int B){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;TCS3472.c,119 :: 		if (r == 0 && g == 0 && b == 0) {
SW	R25, 4(SP)
SW	R26, 8(SP)
ANDI	R2, R25, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp42
NOP	
J	L__TCS3472_CalcColTemp25
NOP	
L__TCS3472_CalcColTemp42:
ANDI	R2, R26, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp43
NOP	
J	L__TCS3472_CalcColTemp24
NOP	
L__TCS3472_CalcColTemp43:
ANDI	R2, R27, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp44
NOP	
J	L__TCS3472_CalcColTemp23
NOP	
L__TCS3472_CalcColTemp44:
L__TCS3472_CalcColTemp22:
;TCS3472.c,120 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_TCS3472_CalcColTemp
NOP	
;TCS3472.c,119 :: 		if (r == 0 && g == 0 && b == 0) {
L__TCS3472_CalcColTemp25:
L__TCS3472_CalcColTemp24:
L__TCS3472_CalcColTemp23:
;TCS3472.c,127 :: 		X = (-0.14282F * r) + (1.54924F * g) + (-0.95641F * b);
ANDI	R4, R25, 65535
JAL	__Unsigned16IntToFloat+0
NOP	
SW	R2, 24(SP)
LUI	R4, 48658
ORI	R4, R4, 16232
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
ANDI	R4, R26, 65535
JAL	__Unsigned16IntToFloat+0
NOP	
SW	R2, 20(SP)
LUI	R4, 16326
ORI	R4, R4, 19839
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
SW	R2, 12(SP)
ANDI	R4, R27, 65535
JAL	__Unsigned16IntToFloat+0
NOP	
SW	R2, 16(SP)
LUI	R4, 49012
ORI	R4, R4, 55113
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; X start address is: 64 (R16)
MOVZ	R16, R2, R0
;TCS3472.c,128 :: 		Y = (-0.32466F * r) + (1.57837F * g) + (-0.73191F * b);
LUI	R6, 48806
ORI	R6, R6, 14806
LW	R4, 24(SP)
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
LUI	R6, 16330
ORI	R6, R6, 2055
LW	R4, 20(SP)
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
SW	R2, 12(SP)
LUI	R6, 48955
ORI	R6, R6, 24180
LW	R4, 16(SP)
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; Y start address is: 12 (R3)
MOVZ	R3, R2, R0
;TCS3472.c,129 :: 		Z = (-0.68202F * r) + (0.77073F * g) + (0.56332F * b);
LUI	R6, 48942
ORI	R6, R6, 39133
LW	R4, 24(SP)
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
LUI	R6, 16197
ORI	R6, R6, 20112
LW	R4, 20(SP)
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
SW	R2, 12(SP)
LUI	R6, 16144
ORI	R6, R6, 13757
LW	R4, 16(SP)
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; Z start address is: 60 (R15)
MOVZ	R15, R2, R0
;TCS3472.c,132 :: 		xc = (X) / (X + Y + Z);
MOVZ	R4, R16, R0
MOVZ	R6, R3, R0
JAL	__Add_FP+0
NOP	
MOVZ	R4, R2, R0
MOVZ	R6, R15, R0
JAL	__Add_FP+0
NOP	
; Z end address is: 60 (R15)
SW	R2, 12(SP)
MOVZ	R6, R2, R0
MOVZ	R4, R16, R0
JAL	__Div_FP+0
NOP	
; X end address is: 64 (R16)
; xc start address is: 64 (R16)
MOVZ	R16, R2, R0
;TCS3472.c,133 :: 		yc = (Y) / (X + Y + Z);
LW	R6, 12(SP)
MOVZ	R4, R3, R0
JAL	__Div_FP+0
NOP	
; Y end address is: 12 (R3)
; yc start address is: 12 (R3)
MOVZ	R3, R2, R0
;TCS3472.c,136 :: 		n = (xc - 0.3320F) / (0.1858F - yc);
LUI	R6, 16041
ORI	R6, R6, 64487
MOVZ	R4, R16, R0
JAL	__Sub_FP+0
NOP	
; xc end address is: 64 (R16)
SW	R2, 12(SP)
LUI	R4, 15934
ORI	R4, R4, 16987
MOVZ	R6, R3, R0
JAL	__Sub_FP+0
NOP	
; yc end address is: 12 (R3)
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Div_FP+0
NOP	
; n start address is: 76 (R19)
MOVZ	R19, R2, R0
;TCS3472.c,140 :: 		(449.0F * pow(n, 3)) + (3525.0F * pow(n, 2)) + (6823.3F * n) + 5520.33F;
LUI	R26, 16448
ORI	R26, R26, 0
MOVZ	R25, R2, R0
JAL	_pow+0
NOP	
LUI	R4, 17376
ORI	R4, R4, 32768
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
LUI	R26, 16384
ORI	R26, R26, 0
MOVZ	R25, R19, R0
JAL	_pow+0
NOP	
LUI	R4, 17756
ORI	R4, R4, 20480
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
SW	R2, 12(SP)
LUI	R4, 17877
ORI	R4, R4, 14950
MOVZ	R6, R19, R0
JAL	__Mul_FP+0
NOP	
; n end address is: 76 (R19)
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
LUI	R4, 17836
ORI	R4, R4, 33444
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
;TCS3472.c,143 :: 		return (unsigned int)cct;
MOVZ	R4, R2, R0
JAL	__FloatToUnsignedIntegral+0
NOP	
;TCS3472.c,144 :: 		}
;TCS3472.c,143 :: 		return (unsigned int)cct;
;TCS3472.c,144 :: 		}
L_end_TCS3472_CalcColTemp:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _TCS3472_CalcColTemp
_TCS3472_CalcColTemp_dn40:
;TCS3472.c,146 :: 		unsigned int TCS3472_CalcColTemp_dn40(unsigned int *RGBC,TCS3472_IntegrationTime_t It){
;TCS3472.c,151 :: 		if (RGBC[0] == 0) {
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp_dn4046
NOP	
J	L_TCS3472_CalcColTemp_dn409
NOP	
L__TCS3472_CalcColTemp_dn4046:
;TCS3472.c,152 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_TCS3472_CalcColTemp_dn40
NOP	
;TCS3472.c,153 :: 		}
L_TCS3472_CalcColTemp_dn409:
;TCS3472.c,167 :: 		if ((256 - It) > 63) {
ANDI	R3, R26, 255
ORI	R2, R0, 256
SUBU	R2, R2, R3
SEH	R2, R2
SLTI	R2, R2, 64
BEQ	R2, R0, L__TCS3472_CalcColTemp_dn4047
NOP	
J	L_TCS3472_CalcColTemp_dn4010
NOP	
L__TCS3472_CalcColTemp_dn4047:
;TCS3472.c,169 :: 		sat = 65535;
; sat start address is: 16 (R4)
ORI	R4, R0, 65535
;TCS3472.c,170 :: 		} else {
; sat end address is: 16 (R4)
J	L_TCS3472_CalcColTemp_dn4011
NOP	
L_TCS3472_CalcColTemp_dn4010:
;TCS3472.c,172 :: 		sat = 1024 * (256 - It);
ANDI	R3, R26, 255
ORI	R2, R0, 256
SUBU	R2, R2, R3
SEH	R2, R2
SLL	R2, R2, 10
; sat start address is: 16 (R4)
SEH	R4, R2
; sat end address is: 16 (R4)
;TCS3472.c,173 :: 		}
L_TCS3472_CalcColTemp_dn4011:
;TCS3472.c,192 :: 		if ((256 - It) <= 63) {
; sat start address is: 16 (R4)
ANDI	R3, R26, 255
ORI	R2, R0, 256
SUBU	R2, R2, R3
SEH	R2, R2
SLTI	R2, R2, 64
BNE	R2, R0, L__TCS3472_CalcColTemp_dn4048
NOP	
J	L__TCS3472_CalcColTemp_dn4026
NOP	
L__TCS3472_CalcColTemp_dn4048:
;TCS3472.c,194 :: 		sat -= sat / 4;
ANDI	R2, R4, 65535
SRL	R2, R2, 2
SUBU	R2, R4, R2
ANDI	R4, R2, 65535
; sat end address is: 16 (R4)
;TCS3472.c,195 :: 		}
J	L_TCS3472_CalcColTemp_dn4012
NOP	
L__TCS3472_CalcColTemp_dn4026:
;TCS3472.c,192 :: 		if ((256 - It) <= 63) {
;TCS3472.c,195 :: 		}
L_TCS3472_CalcColTemp_dn4012:
;TCS3472.c,198 :: 		if (RGBC[0] >= sat) {
; sat start address is: 16 (R4)
LHU	R2, 0(R25)
ANDI	R3, R2, 65535
ANDI	R2, R4, 65535
; sat end address is: 16 (R4)
SLTU	R2, R3, R2
BEQ	R2, R0, L__TCS3472_CalcColTemp_dn4049
NOP	
J	L_TCS3472_CalcColTemp_dn4013
NOP	
L__TCS3472_CalcColTemp_dn4049:
;TCS3472.c,199 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_TCS3472_CalcColTemp_dn40
NOP	
;TCS3472.c,200 :: 		}
L_TCS3472_CalcColTemp_dn4013:
;TCS3472.c,204 :: 		ir = (RGBC[1] + RGBC[2] + RGBC[3] > RGBC[0]) ? (RGBC[1] + RGBC[2] + RGBC[3] - RGBC[0]) / 2 : 0;
ADDIU	R2, R25, 2
LHU	R3, 0(R2)
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDU	R3, R3, R2
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDU	R3, R3, R2
LHU	R2, 0(R25)
ANDI	R3, R3, 65535
ANDI	R2, R2, 65535
SLTU	R2, R2, R3
BNE	R2, R0, L__TCS3472_CalcColTemp_dn4050
NOP	
J	L_TCS3472_CalcColTemp_dn4014
NOP	
L__TCS3472_CalcColTemp_dn4050:
ADDIU	R2, R25, 2
LHU	R3, 0(R2)
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
ADDU	R3, R3, R2
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
ADDU	R3, R3, R2
LHU	R2, 0(R25)
SUBU	R2, R3, R2
ANDI	R2, R2, 65535
SRL	R2, R2, 1
; ?FLOC___TCS3472_CalcColTemp_dn40?T123 start address is: 20 (R5)
ANDI	R5, R2, 65535
; ?FLOC___TCS3472_CalcColTemp_dn40?T123 end address is: 20 (R5)
J	L_TCS3472_CalcColTemp_dn4015
NOP	
L_TCS3472_CalcColTemp_dn4014:
; ?FLOC___TCS3472_CalcColTemp_dn40?T123 start address is: 20 (R5)
MOVZ	R5, R0, R0
; ?FLOC___TCS3472_CalcColTemp_dn40?T123 end address is: 20 (R5)
L_TCS3472_CalcColTemp_dn4015:
;TCS3472.c,207 :: 		r2 = RGBC[1] - ir;
; ?FLOC___TCS3472_CalcColTemp_dn40?T123 start address is: 20 (R5)
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
SUBU	R3, R2, R5
; r2 start address is: 16 (R4)
ANDI	R4, R3, 65535
;TCS3472.c,209 :: 		b2 = RGBC[3] - ir;
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
SUBU	R2, R2, R5
; ?FLOC___TCS3472_CalcColTemp_dn40?T123 end address is: 20 (R5)
; b2 start address is: 20 (R5)
ANDI	R5, R2, 65535
;TCS3472.c,211 :: 		if (r2 == 0) {
ANDI	R2, R3, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp_dn4051
NOP	
J	L_TCS3472_CalcColTemp_dn4016
NOP	
L__TCS3472_CalcColTemp_dn4051:
; r2 end address is: 16 (R4)
; b2 end address is: 20 (R5)
;TCS3472.c,212 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_TCS3472_CalcColTemp_dn40
NOP	
;TCS3472.c,213 :: 		}
L_TCS3472_CalcColTemp_dn4016:
;TCS3472.c,217 :: 		cct = (3810 * b2 / r2 + 1391); /** Color temp offset. */  //** Color temp coefficient. */
; b2 start address is: 20 (R5)
; r2 start address is: 16 (R4)
ORI	R2, R0, 3810
MULTU	R2, R5
MFLO	R2
; b2 end address is: 20 (R5)
ANDI	R3, R2, 65535
ANDI	R2, R4, 65535
; r2 end address is: 16 (R4)
DIVU	R3, R2
MFLO	R2
ADDIU	R2, R2, 1391
;TCS3472.c,219 :: 		return cct;
;TCS3472.c,220 :: 		}
L_end_TCS3472_CalcColTemp_dn40:
JR	RA
NOP	
; end of _TCS3472_CalcColTemp_dn40
_TCS3472_Calc_Lux:
;TCS3472.c,222 :: 		unsigned int TCS3472_Calc_Lux(unsigned int R,unsigned int G,unsigned int B){
;TCS3472.c,224 :: 		}
L_end_TCS3472_Calc_Lux:
JR	RA
NOP	
; end of _TCS3472_Calc_Lux
_TCS3472_SetInterrupt:
;TCS3472.c,226 :: 		unsigned short TCS3472_SetInterrupt(char i){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,228 :: 		if(!TCS3472_Initialised)
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_SetInterrupt54
NOP	
J	L_TCS3472_SetInterrupt17
NOP	
L__TCS3472_SetInterrupt54:
;TCS3472.c,229 :: 		return 0x00;
MOVZ	R2, R0, R0
J	L_end_TCS3472_SetInterrupt
NOP	
L_TCS3472_SetInterrupt17:
;TCS3472.c,231 :: 		r = TCS3472_Read8(TCS3472_EN);
MOVZ	R25, R0, R0
JAL	_TCS3472_Read8+0
NOP	
;TCS3472.c,233 :: 		if(i = 1)
ORI	R25, R0, 1
;TCS3472.c,234 :: 		r |= TCS3472_EN_AIEN;
ORI	R2, R2, 16
; r start address is: 8 (R2)
;TCS3472.c,236 :: 		r &= ~TCS3472_EN_AIEN;
L_TCS3472_SetInterrupt19:
;TCS3472.c,238 :: 		TCS3472_Write8(TCS3472_EN, r);
ANDI	R26, R2, 255
; r end address is: 8 (R2)
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,239 :: 		return 0x01;
ORI	R2, R0, 1
;TCS3472.c,240 :: 		}
;TCS3472.c,239 :: 		return 0x01;
;TCS3472.c,240 :: 		}
L_end_TCS3472_SetInterrupt:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_SetInterrupt
_TCS3472_ClearInterrupt:
;TCS3472.c,242 :: 		unsigned short TCS3472_ClearInterrupt(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;TCS3472.c,243 :: 		if(!TCS3472_Initialised)
SW	R25, 4(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_ClearInterrupt56
NOP	
J	L_TCS3472_ClearInterrupt20
NOP	
L__TCS3472_ClearInterrupt56:
;TCS3472.c,244 :: 		return 0x00;
MOVZ	R2, R0, R0
J	L_end_TCS3472_ClearInterrupt
NOP	
L_TCS3472_ClearInterrupt20:
;TCS3472.c,245 :: 		TCS3472_Write(TCS3472_CMD_BIT | 0x66);
ORI	R25, R0, 230
JAL	_TCS3472_Write+0
NOP	
;TCS3472.c,246 :: 		return 0x01;
ORI	R2, R0, 1
;TCS3472.c,247 :: 		}
;TCS3472.c,246 :: 		return 0x01;
;TCS3472.c,247 :: 		}
L_end_TCS3472_ClearInterrupt:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TCS3472_ClearInterrupt
_TCS3472_SetInterrupt_Limits:
;TCS3472.c,249 :: 		unsigned short TCS3472_SetInterrupt_Limits(unsigned int Lo,unsigned int Hi){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;TCS3472.c,250 :: 		if(!TCS3472_Initialised)
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_SetInterrupt_Limits58
NOP	
J	L_TCS3472_SetInterrupt_Limits21
NOP	
L__TCS3472_SetInterrupt_Limits58:
;TCS3472.c,251 :: 		return 0x00;
MOVZ	R2, R0, R0
J	L_end_TCS3472_SetInterrupt_Limits
NOP	
L_TCS3472_SetInterrupt_Limits21:
;TCS3472.c,252 :: 		TCS3472_Write8(0x04, Lo & 0xFF);
ANDI	R2, R25, 255
SH	R26, 12(SP)
SH	R25, 14(SP)
ANDI	R26, R2, 255
ORI	R25, R0, 4
JAL	_TCS3472_Write8+0
NOP	
LHU	R25, 14(SP)
;TCS3472.c,253 :: 		TCS3472_Write8(0x05, Lo >> 8);
ANDI	R2, R25, 65535
SRL	R2, R2, 8
ANDI	R26, R2, 65535
ORI	R25, R0, 5
JAL	_TCS3472_Write8+0
NOP	
LHU	R26, 12(SP)
;TCS3472.c,254 :: 		TCS3472_Write8(0x06, Hi & 0xFF);
ANDI	R2, R26, 255
SH	R26, 12(SP)
ANDI	R26, R2, 255
ORI	R25, R0, 6
JAL	_TCS3472_Write8+0
NOP	
LHU	R26, 12(SP)
;TCS3472.c,255 :: 		TCS3472_Write8(0x07, Hi >> 8);
ANDI	R2, R26, 65535
SRL	R2, R2, 8
ANDI	R26, R2, 65535
ORI	R25, R0, 7
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,256 :: 		return 0x01;
ORI	R2, R0, 1
;TCS3472.c,257 :: 		}
;TCS3472.c,256 :: 		return 0x01;
;TCS3472.c,257 :: 		}
L_end_TCS3472_SetInterrupt_Limits:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _TCS3472_SetInterrupt_Limits
