_TCS3472_Init:
;TCS3472.c,19 :: 		unsigned short TCS3472_Init(TCS3472_IntegrationTime_t It,TCS3472_Gain_t gain, TCS3472x Id ){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,22 :: 		id = TCS3472_Read8(TCS3472_ID);
SW	R25, 4(SP)
SB	R27, 8(SP)
SB	R26, 9(SP)
SB	R25, 10(SP)
ORI	R25, R0, 18
JAL	_TCS3472_Read8+0
NOP	
LBU	R25, 10(SP)
LBU	R26, 9(SP)
LBU	R27, 8(SP)
SB	R2, 11(SP)
;TCS3472.c,23 :: 		if(id != Id)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BNE	R3, R2, L__TCS3472_Init76
NOP	
J	L_TCS3472_Init0
NOP	
L__TCS3472_Init76:
;TCS3472.c,24 :: 		return 0x00;
MOVZ	R2, R0, R0
J	L_end_TCS3472_Init
NOP	
L_TCS3472_Init0:
;TCS3472.c,25 :: 		if(!TCS3472_Initialised){
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_Init77
NOP	
J	L_TCS3472_Init1
NOP	
L__TCS3472_Init77:
;TCS3472.c,26 :: 		TCS3472_Initialised = 1;
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_TCS3472_Bits+0)(GP)
;TCS3472.c,27 :: 		TCS3472_SetIntergration_Time(It);
SB	R26, 8(SP)
JAL	_TCS3472_SetIntergration_Time+0
NOP	
LBU	R26, 8(SP)
;TCS3472.c,28 :: 		TCS3472_SetGain(gain);
ANDI	R25, R26, 255
JAL	_TCS3472_SetGain+0
NOP	
;TCS3472.c,29 :: 		TCS3472_Enable();
JAL	_TCS3472_Enable+0
NOP	
;TCS3472.c,30 :: 		}
L_TCS3472_Init1:
;TCS3472.c,31 :: 		return id;
LBU	R2, 11(SP)
;TCS3472.c,32 :: 		}
;TCS3472.c,31 :: 		return id;
;TCS3472.c,32 :: 		}
L_end_TCS3472_Init:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Init
_SetColourThresholds:
;TCS3472.c,34 :: 		void SetColourThresholds(uint16_t C,uint16_t R,uint16_t G,uint16_t B){
;TCS3472.c,35 :: 		Col_Thresh.C_Thresh = C;
SH	R25, Offset(_Col_Thresh+6)(GP)
;TCS3472.c,36 :: 		Col_Thresh.R_Thresh = R;
SH	R26, Offset(_Col_Thresh+0)(GP)
;TCS3472.c,37 :: 		Col_Thresh.G_Thresh = G;
SH	R27, Offset(_Col_Thresh+2)(GP)
;TCS3472.c,38 :: 		Col_Thresh.B_Thresh = B;
SH	R28, Offset(_Col_Thresh+4)(GP)
;TCS3472.c,39 :: 		}
L_end_SetColourThresholds:
JR	RA
NOP	
; end of _SetColourThresholds
_TCS3472_Write:
;TCS3472.c,41 :: 		void TCS3472_Write(unsigned short cmd){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;TCS3472.c,42 :: 		I2C2_Start();                      // issue I2C start signal
SB	R25, 4(SP)
JAL	_I2C2_Start+0
NOP	
;TCS3472.c,43 :: 		I2C2_Write(TCS3472_ADDW);          // send byte via I2C  (slave address)
ORI	R25, R0, 82
JAL	_I2C2_Write+0
NOP	
LBU	R25, 4(SP)
;TCS3472.c,44 :: 		I2C2_Write(cmd);                  // send byte (command reg MSB)
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,45 :: 		I2C2_Stop();
JAL	_I2C2_Stop+0
NOP	
;TCS3472.c,46 :: 		}
L_end_TCS3472_Write:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TCS3472_Write
_TCS3472_Write8:
;TCS3472.c,48 :: 		void TCS3472_Write8(unsigned short reg_add, unsigned short value){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,49 :: 		I2C2_Start();                      // issue I2C start signal
SW	R25, 4(SP)
SB	R26, 8(SP)
SB	R25, 9(SP)
JAL	_I2C2_Start+0
NOP	
;TCS3472.c,50 :: 		I2C2_Write(TCS3472_ADDW);          // send byte via I2C  (slave address)
ORI	R25, R0, 82
JAL	_I2C2_Write+0
NOP	
LBU	R25, 9(SP)
;TCS3472.c,51 :: 		I2C2_Write(TCS3472_CMD_BIT | reg_add);       // send byte (command reg MSB)
ORI	R2, R25, 128
ANDI	R25, R2, 255
JAL	_I2C2_Write+0
NOP	
LBU	R26, 8(SP)
;TCS3472.c,52 :: 		I2C2_Write(value);                 // send byte (data to be written)
ANDI	R25, R26, 255
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,53 :: 		I2C2_Stop();                       // issue I2C stop signal
JAL	_I2C2_Stop+0
NOP	
;TCS3472.c,55 :: 		}
L_end_TCS3472_Write8:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Write8
_TCS3472_Read8:
;TCS3472.c,57 :: 		unsigned short TCS3472_Read8(unsigned short reg_add){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,59 :: 		I2C2_Start();                   // issue I2C start signal
SW	R25, 4(SP)
SB	R25, 8(SP)
JAL	_I2C2_Start+0
NOP	
;TCS3472.c,60 :: 		I2C2_Write(TCS3472_ADDW);       // send byte via I2C  (device address + W)
ORI	R25, R0, 82
JAL	_I2C2_Write+0
NOP	
LBU	R25, 8(SP)
;TCS3472.c,61 :: 		I2C2_Write(TCS3472_CMD_BIT | reg_add);            // send byte (data address)
ORI	R2, R25, 128
ANDI	R25, R2, 255
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,62 :: 		I2C2_Stop();
JAL	_I2C2_Stop+0
NOP	
;TCS3472.c,63 :: 		I2C2_Start();
JAL	_I2C2_Start+0
NOP	
;TCS3472.c,64 :: 		I2C2_Write(TCS3472_ADDR);
ORI	R25, R0, 83
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,65 :: 		temp = I2C2_Read(1);   // Read the data (NO acknowledge)
ORI	R25, R0, 1
JAL	_I2C2_Read+0
NOP	
SB	R2, 9(SP)
;TCS3472.c,66 :: 		I2C2_Stop();
JAL	_I2C2_Stop+0
NOP	
;TCS3472.c,67 :: 		return temp;
LBU	R2, 9(SP)
;TCS3472.c,68 :: 		}
;TCS3472.c,67 :: 		return temp;
;TCS3472.c,68 :: 		}
L_end_TCS3472_Read8:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Read8
_TCS3472_Read16:
;TCS3472.c,70 :: 		unsigned int TCS3472_Read16(unsigned short reg_add){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;TCS3472.c,73 :: 		I2C2_Start();              // issue I2C start signal
SW	R25, 4(SP)
SB	R25, 8(SP)
JAL	_I2C2_Start+0
NOP	
;TCS3472.c,74 :: 		I2C2_Write(TCS3472_ADDW);          // send byte via I2C  (device address + W)
ORI	R25, R0, 82
JAL	_I2C2_Write+0
NOP	
LBU	R25, 8(SP)
;TCS3472.c,75 :: 		I2C2_Write(TCS3472_CMD_AUTO_INC | reg_add);       // send byte (command reg MSB)
ORI	R2, R25, 160
ANDI	R25, R2, 255
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,76 :: 		I2C2_Restart();           // issue I2C signal repeated start
JAL	_I2C2_Restart+0
NOP	
;TCS3472.c,77 :: 		I2C2_Write(TCS3472_ADDR);          // send byte (device address + R)
ORI	R25, R0, 83
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,78 :: 		temp[0] = I2C2_Read(_I2C_ACK);      // Read the data (NO acknowledge)
ADDIU	R2, SP, 9
SW	R2, 12(SP)
MOVZ	R25, R0, R0
JAL	_I2C2_Read+0
NOP	
LW	R3, 12(SP)
SB	R2, 0(R3)
;TCS3472.c,79 :: 		temp[1] = I2C2_Read(_I2C_NACK);
ADDIU	R2, SP, 9
ADDIU	R2, R2, 1
SW	R2, 12(SP)
ORI	R25, R0, 1
JAL	_I2C2_Read+0
NOP	
LW	R3, 12(SP)
SB	R2, 0(R3)
;TCS3472.c,80 :: 		I2C2_Stop();
JAL	_I2C2_Stop+0
NOP	
;TCS3472.c,81 :: 		reslt = temp[0];
ADDIU	R4, SP, 9
LBU	R2, 0(R4)
; reslt start address is: 12 (R3)
ANDI	R3, R2, 255
;TCS3472.c,82 :: 		reslt = (reslt << 8) | temp[1];
ANDI	R2, R3, 65535
; reslt end address is: 12 (R3)
SLL	R3, R2, 8
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;TCS3472.c,83 :: 		return reslt;
;TCS3472.c,84 :: 		}
;TCS3472.c,83 :: 		return reslt;
;TCS3472.c,84 :: 		}
L_end_TCS3472_Read16:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _TCS3472_Read16
_TCS3472_Enable:
;TCS3472.c,86 :: 		void TCS3472_Enable(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,87 :: 		TCS3472_Write8(TCS3472_EN, TCS3472_EN_PON);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,88 :: 		Delay_ms(3);
LUI	R24, 1
ORI	R24, R24, 14463
L_TCS3472_Enable2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TCS3472_Enable2
NOP	
NOP	
;TCS3472.c,89 :: 		TCS3472_Write8(TCS3472_EN, TCS3472_EN_PON | TCS3472_EN_AEN);
ORI	R26, R0, 3
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,90 :: 		}
L_end_TCS3472_Enable:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Enable
_TCS3472_Disable:
;TCS3472.c,92 :: 		void TCS3472_Disable(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,94 :: 		read = TCS3472_Read8(TCS3472_EN);
SW	R25, 4(SP)
SW	R26, 8(SP)
MOVZ	R25, R0, R0
JAL	_TCS3472_Read8+0
NOP	
;TCS3472.c,95 :: 		TCS3472_Write8(TCS3472_EN, read & ~(TCS3472_EN_PON | TCS3472_EN_AEN));
ORI	R3, R0, 252
AND	R2, R2, R3
ANDI	R26, R2, 255
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,96 :: 		}
L_end_TCS3472_Disable:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Disable
_TCS3472_SetIntergration_Time:
;TCS3472.c,98 :: 		unsigned short TCS3472_SetIntergration_Time(TCS3472_IntegrationTime_t It){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,99 :: 		if(!TCS3472_Initialised)
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_SetIntergration_Time86
NOP	
J	L_TCS3472_SetIntergration_Time4
NOP	
L__TCS3472_SetIntergration_Time86:
;TCS3472.c,100 :: 		return 0x00;
MOVZ	R2, R0, R0
J	L_end_TCS3472_SetIntergration_Time
NOP	
L_TCS3472_SetIntergration_Time4:
;TCS3472.c,102 :: 		TCS3472_Write8(TCS3472_ATIME, It);
ANDI	R26, R25, 255
ORI	R25, R0, 1
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,103 :: 		return 0x01;
ORI	R2, R0, 1
;TCS3472.c,104 :: 		}
;TCS3472.c,103 :: 		return 0x01;
;TCS3472.c,104 :: 		}
L_end_TCS3472_SetIntergration_Time:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_SetIntergration_Time
_TCS3472_SetGain:
;TCS3472.c,106 :: 		unsigned short TCS3472_SetGain(TCS3472_Gain_t gain){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,107 :: 		if(!TCS3472_Initialised)
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_SetGain88
NOP	
J	L_TCS3472_SetGain5
NOP	
L__TCS3472_SetGain88:
;TCS3472.c,108 :: 		return 0x00;
MOVZ	R2, R0, R0
J	L_end_TCS3472_SetGain
NOP	
L_TCS3472_SetGain5:
;TCS3472.c,109 :: 		TCS3472_Write8(TCS3472_CONTROL, gain);
ANDI	R26, R25, 255
ORI	R25, R0, 15
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,110 :: 		return 0x01;
ORI	R2, R0, 1
;TCS3472.c,111 :: 		}
;TCS3472.c,110 :: 		return 0x01;
;TCS3472.c,111 :: 		}
L_end_TCS3472_SetGain:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_SetGain
_TCS3472_getRawData:
;TCS3472.c,113 :: 		void TCS3472_getRawData(unsigned int *RGBC){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;TCS3472.c,114 :: 		*(RGBC) = TCS3472_Read16(TCS3472_CDATAL);
SW	R25, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
LW	R25, 8(SP)
SH	R2, 0(R25)
;TCS3472.c,115 :: 		*(RGBC + 1) = TCS3472_Read16(TCS3472_RDATAL);
ADDIU	R2, R25, 2
SW	R2, 12(SP)
SW	R25, 8(SP)
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
LW	R25, 8(SP)
LW	R3, 12(SP)
SH	R2, 0(R3)
;TCS3472.c,116 :: 		*(RGBC + 2) = TCS3472_Read16(TCS3472_GDATAL);
ADDIU	R2, R25, 4
SW	R2, 12(SP)
SW	R25, 8(SP)
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
LW	R25, 8(SP)
LW	R3, 12(SP)
SH	R2, 0(R3)
;TCS3472.c,117 :: 		*(RGBC + 3) = TCS3472_Read16(TCS3472_BDATAL);
ADDIU	R2, R25, 6
SW	R2, 12(SP)
ORI	R25, R0, 26
JAL	_TCS3472_Read16+0
NOP	
LW	R3, 12(SP)
SH	R2, 0(R3)
;TCS3472.c,118 :: 		}
L_end_TCS3472_getRawData:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _TCS3472_getRawData
_TCS3472_getRawDataOnce:
;TCS3472.c,120 :: 		void TCS3472_getRawDataOnce(unsigned int *RGBC){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;TCS3472.c,121 :: 		TCS3472_Enable();
SW	R25, 4(SP)
JAL	_TCS3472_Enable+0
NOP	
LW	R25, 4(SP)
;TCS3472.c,122 :: 		TCS3472_getRawData(RGBC);
JAL	_TCS3472_getRawData+0
NOP	
;TCS3472.c,123 :: 		TCS3472_Disable();
JAL	_TCS3472_Disable+0
NOP	
;TCS3472.c,124 :: 		}
L_end_TCS3472_getRawDataOnce:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TCS3472_getRawDataOnce
_TCS3472_CalcColTemp:
;TCS3472.c,126 :: 		unsigned int TCS3472_CalcColTemp(unsigned int r,unsigned int g,unsigned int b){
ADDIU	SP, SP, -28
SW	RA, 0(SP)
;TCS3472.c,132 :: 		if (r == 0 && g == 0 && b == 0) {
SW	R25, 4(SP)
SW	R26, 8(SP)
ANDI	R2, R25, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp92
NOP	
J	L__TCS3472_CalcColTemp58
NOP	
L__TCS3472_CalcColTemp92:
ANDI	R2, R26, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp93
NOP	
J	L__TCS3472_CalcColTemp57
NOP	
L__TCS3472_CalcColTemp93:
ANDI	R2, R27, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp94
NOP	
J	L__TCS3472_CalcColTemp56
NOP	
L__TCS3472_CalcColTemp94:
L__TCS3472_CalcColTemp55:
;TCS3472.c,133 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_TCS3472_CalcColTemp
NOP	
;TCS3472.c,132 :: 		if (r == 0 && g == 0 && b == 0) {
L__TCS3472_CalcColTemp58:
L__TCS3472_CalcColTemp57:
L__TCS3472_CalcColTemp56:
;TCS3472.c,146 :: 		X = (-0.3895 * r) + (1.4933 * g) + (-0.0491 * b);
ANDI	R4, R25, 65535
JAL	__Unsigned16IntToFloat+0
NOP	
SW	R2, 24(SP)
LUI	R4, 48839
ORI	R4, R4, 27787
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
ANDI	R4, R26, 65535
JAL	__Unsigned16IntToFloat+0
NOP	
SW	R2, 20(SP)
LUI	R4, 16319
ORI	R4, R4, 9332
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
LUI	R4, 48457
ORI	R4, R4, 7445
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; X start address is: 64 (R16)
MOVZ	R16, R2, R0
;TCS3472.c,147 :: 		Y = (-0.1212 * r) + (0.8890 * g) + (-0.1231 * b);
LUI	R6, 48632
ORI	R6, R6, 14261
LW	R4, 24(SP)
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
LUI	R6, 16227
ORI	R6, R6, 38273
LW	R4, 20(SP)
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
SW	R2, 12(SP)
LUI	R6, 48636
ORI	R6, R6, 7130
LW	R4, 16(SP)
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; Y start address is: 12 (R3)
MOVZ	R3, R2, R0
;TCS3472.c,148 :: 		Z = ( 0.0343 * r) + (-0.2657 * g) + (0.9438 * b);
LUI	R6, 15628
ORI	R6, R6, 32296
LW	R4, 24(SP)
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
LUI	R6, 48776
ORI	R6, R6, 2517
LW	R4, 20(SP)
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
SW	R2, 12(SP)
LUI	R6, 16241
ORI	R6, R6, 40160
LW	R4, 16(SP)
JAL	__Mul_FP+0
NOP	
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; Z start address is: 60 (R15)
MOVZ	R15, R2, R0
;TCS3472.c,152 :: 		xc = (X) / (X + Y + Z);
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
;TCS3472.c,153 :: 		yc = (Y) / (X + Y + Z);
LW	R6, 12(SP)
MOVZ	R4, R3, R0
JAL	__Div_FP+0
NOP	
; Y end address is: 12 (R3)
; yc start address is: 12 (R3)
MOVZ	R3, R2, R0
;TCS3472.c,156 :: 		n = (xc - 0.3320) / (0.1858 - yc);
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
;TCS3472.c,160 :: 		(449.0F * pow(n, 3)) + (3525.0 * pow(n, 2)) + (6823.3 * n) + 5520.33;
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
;TCS3472.c,163 :: 		return (unsigned int)cct;
MOVZ	R4, R2, R0
JAL	__FloatToUnsignedIntegral+0
NOP	
;TCS3472.c,164 :: 		}
;TCS3472.c,163 :: 		return (unsigned int)cct;
;TCS3472.c,164 :: 		}
L_end_TCS3472_CalcColTemp:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _TCS3472_CalcColTemp
_TCS3472_CalcColTemp_dn40:
;TCS3472.c,166 :: 		unsigned int TCS3472_CalcColTemp_dn40(unsigned int *RGBC,TCS3472_IntegrationTime_t It){
;TCS3472.c,171 :: 		if (RGBC[0] == 0) {
LHU	R2, 0(R25)
ANDI	R2, R2, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp_dn4096
NOP	
J	L_TCS3472_CalcColTemp_dn409
NOP	
L__TCS3472_CalcColTemp_dn4096:
;TCS3472.c,172 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_TCS3472_CalcColTemp_dn40
NOP	
;TCS3472.c,173 :: 		}
L_TCS3472_CalcColTemp_dn409:
;TCS3472.c,187 :: 		if ((256 - It) > 63) {
ANDI	R3, R26, 255
ORI	R2, R0, 256
SUBU	R2, R2, R3
SEH	R2, R2
SLTI	R2, R2, 64
BEQ	R2, R0, L__TCS3472_CalcColTemp_dn4097
NOP	
J	L_TCS3472_CalcColTemp_dn4010
NOP	
L__TCS3472_CalcColTemp_dn4097:
;TCS3472.c,189 :: 		sat = 65535;
; sat start address is: 16 (R4)
ORI	R4, R0, 65535
;TCS3472.c,190 :: 		} else {
; sat end address is: 16 (R4)
J	L_TCS3472_CalcColTemp_dn4011
NOP	
L_TCS3472_CalcColTemp_dn4010:
;TCS3472.c,192 :: 		sat = 1024 * (256 - It);
ANDI	R3, R26, 255
ORI	R2, R0, 256
SUBU	R2, R2, R3
SEH	R2, R2
SLL	R2, R2, 10
; sat start address is: 16 (R4)
SEH	R4, R2
; sat end address is: 16 (R4)
;TCS3472.c,193 :: 		}
L_TCS3472_CalcColTemp_dn4011:
;TCS3472.c,212 :: 		if ((256 - It) <= 63) {
; sat start address is: 16 (R4)
ANDI	R3, R26, 255
ORI	R2, R0, 256
SUBU	R2, R2, R3
SEH	R2, R2
SLTI	R2, R2, 64
BNE	R2, R0, L__TCS3472_CalcColTemp_dn4098
NOP	
J	L__TCS3472_CalcColTemp_dn4059
NOP	
L__TCS3472_CalcColTemp_dn4098:
;TCS3472.c,214 :: 		sat -= sat / 4;
ANDI	R2, R4, 65535
SRL	R2, R2, 2
SUBU	R2, R4, R2
ANDI	R4, R2, 65535
; sat end address is: 16 (R4)
;TCS3472.c,215 :: 		}
J	L_TCS3472_CalcColTemp_dn4012
NOP	
L__TCS3472_CalcColTemp_dn4059:
;TCS3472.c,212 :: 		if ((256 - It) <= 63) {
;TCS3472.c,215 :: 		}
L_TCS3472_CalcColTemp_dn4012:
;TCS3472.c,218 :: 		if (RGBC[0] >= sat) {
; sat start address is: 16 (R4)
LHU	R2, 0(R25)
ANDI	R3, R2, 65535
ANDI	R2, R4, 65535
; sat end address is: 16 (R4)
SLTU	R2, R3, R2
BEQ	R2, R0, L__TCS3472_CalcColTemp_dn4099
NOP	
J	L_TCS3472_CalcColTemp_dn4013
NOP	
L__TCS3472_CalcColTemp_dn4099:
;TCS3472.c,219 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_TCS3472_CalcColTemp_dn40
NOP	
;TCS3472.c,220 :: 		}
L_TCS3472_CalcColTemp_dn4013:
;TCS3472.c,224 :: 		ir = (RGBC[1] + RGBC[2] + RGBC[3] > RGBC[0]) ? (RGBC[1] + RGBC[2] + RGBC[3] - RGBC[0]) / 2 : 0;
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
BNE	R2, R0, L__TCS3472_CalcColTemp_dn40100
NOP	
J	L_TCS3472_CalcColTemp_dn4014
NOP	
L__TCS3472_CalcColTemp_dn40100:
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
; ?FLOC___TCS3472_CalcColTemp_dn40?T124 start address is: 20 (R5)
ANDI	R5, R2, 65535
; ?FLOC___TCS3472_CalcColTemp_dn40?T124 end address is: 20 (R5)
J	L_TCS3472_CalcColTemp_dn4015
NOP	
L_TCS3472_CalcColTemp_dn4014:
; ?FLOC___TCS3472_CalcColTemp_dn40?T124 start address is: 20 (R5)
MOVZ	R5, R0, R0
; ?FLOC___TCS3472_CalcColTemp_dn40?T124 end address is: 20 (R5)
L_TCS3472_CalcColTemp_dn4015:
;TCS3472.c,227 :: 		r2 = RGBC[1] - ir;
; ?FLOC___TCS3472_CalcColTemp_dn40?T124 start address is: 20 (R5)
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
SUBU	R3, R2, R5
; r2 start address is: 16 (R4)
ANDI	R4, R3, 65535
;TCS3472.c,229 :: 		b2 = RGBC[3] - ir;
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
SUBU	R2, R2, R5
; ?FLOC___TCS3472_CalcColTemp_dn40?T124 end address is: 20 (R5)
; b2 start address is: 20 (R5)
ANDI	R5, R2, 65535
;TCS3472.c,231 :: 		if (r2 == 0) {
ANDI	R2, R3, 65535
BEQ	R2, R0, L__TCS3472_CalcColTemp_dn40101
NOP	
J	L_TCS3472_CalcColTemp_dn4016
NOP	
L__TCS3472_CalcColTemp_dn40101:
; r2 end address is: 16 (R4)
; b2 end address is: 20 (R5)
;TCS3472.c,232 :: 		return 0;
MOVZ	R2, R0, R0
J	L_end_TCS3472_CalcColTemp_dn40
NOP	
;TCS3472.c,233 :: 		}
L_TCS3472_CalcColTemp_dn4016:
;TCS3472.c,237 :: 		cct = (3810 * b2 / r2 + 1391); /** Color temp offset. */  //** Color temp coefficient. */
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
;TCS3472.c,239 :: 		return cct;
;TCS3472.c,240 :: 		}
L_end_TCS3472_CalcColTemp_dn40:
JR	RA
NOP	
; end of _TCS3472_CalcColTemp_dn40
_TCS3472_Calc_Lux:
;TCS3472.c,242 :: 		unsigned int TCS3472_Calc_Lux(unsigned int R,unsigned int G,unsigned int B){
;TCS3472.c,244 :: 		}
L_end_TCS3472_Calc_Lux:
JR	RA
NOP	
; end of _TCS3472_Calc_Lux
_TCS3472_SetInterrupt:
;TCS3472.c,246 :: 		unsigned short TCS3472_SetInterrupt(char i){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,248 :: 		if(!TCS3472_Initialised)
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_SetInterrupt104
NOP	
J	L_TCS3472_SetInterrupt17
NOP	
L__TCS3472_SetInterrupt104:
;TCS3472.c,249 :: 		return 0x00;
MOVZ	R2, R0, R0
J	L_end_TCS3472_SetInterrupt
NOP	
L_TCS3472_SetInterrupt17:
;TCS3472.c,251 :: 		r = TCS3472_Read8(TCS3472_EN);
MOVZ	R25, R0, R0
JAL	_TCS3472_Read8+0
NOP	
;TCS3472.c,253 :: 		if(i = 1)
ORI	R25, R0, 1
;TCS3472.c,254 :: 		r |= TCS3472_EN_AIEN;
ORI	R2, R2, 16
; r start address is: 8 (R2)
;TCS3472.c,256 :: 		r &= ~TCS3472_EN_AIEN;
L_TCS3472_SetInterrupt19:
;TCS3472.c,258 :: 		TCS3472_Write8(TCS3472_EN, r);
ANDI	R26, R2, 255
; r end address is: 8 (R2)
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,259 :: 		return 0x01;
ORI	R2, R0, 1
;TCS3472.c,260 :: 		}
;TCS3472.c,259 :: 		return 0x01;
;TCS3472.c,260 :: 		}
L_end_TCS3472_SetInterrupt:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_SetInterrupt
_TCS3472_ClearInterrupt:
;TCS3472.c,262 :: 		unsigned short TCS3472_ClearInterrupt(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;TCS3472.c,263 :: 		if(!TCS3472_Initialised)
SW	R25, 4(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_ClearInterrupt106
NOP	
J	L_TCS3472_ClearInterrupt20
NOP	
L__TCS3472_ClearInterrupt106:
;TCS3472.c,264 :: 		return 0x00;
MOVZ	R2, R0, R0
J	L_end_TCS3472_ClearInterrupt
NOP	
L_TCS3472_ClearInterrupt20:
;TCS3472.c,265 :: 		TCS3472_Write(TCS3472_CMD_BIT | 0x66);
ORI	R25, R0, 230
JAL	_TCS3472_Write+0
NOP	
;TCS3472.c,266 :: 		return 0x01;
ORI	R2, R0, 1
;TCS3472.c,267 :: 		}
;TCS3472.c,266 :: 		return 0x01;
;TCS3472.c,267 :: 		}
L_end_TCS3472_ClearInterrupt:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TCS3472_ClearInterrupt
_TCS3472_SetInterrupt_Limits:
;TCS3472.c,269 :: 		unsigned short TCS3472_SetInterrupt_Limits(unsigned int Lo,unsigned int Hi){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;TCS3472.c,270 :: 		if(!TCS3472_Initialised)
SW	R25, 4(SP)
SW	R26, 8(SP)
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L__TCS3472_SetInterrupt_Limits108
NOP	
J	L_TCS3472_SetInterrupt_Limits21
NOP	
L__TCS3472_SetInterrupt_Limits108:
;TCS3472.c,271 :: 		return 0x00;
MOVZ	R2, R0, R0
J	L_end_TCS3472_SetInterrupt_Limits
NOP	
L_TCS3472_SetInterrupt_Limits21:
;TCS3472.c,272 :: 		TCS3472_Write8(0x04, Lo & 0xFF);
ANDI	R2, R25, 255
SH	R26, 12(SP)
SH	R25, 14(SP)
ANDI	R26, R2, 255
ORI	R25, R0, 4
JAL	_TCS3472_Write8+0
NOP	
LHU	R25, 14(SP)
;TCS3472.c,273 :: 		TCS3472_Write8(0x05, Lo >> 8);
ANDI	R2, R25, 65535
SRL	R2, R2, 8
ANDI	R26, R2, 65535
ORI	R25, R0, 5
JAL	_TCS3472_Write8+0
NOP	
LHU	R26, 12(SP)
;TCS3472.c,274 :: 		TCS3472_Write8(0x06, Hi & 0xFF);
ANDI	R2, R26, 255
SH	R26, 12(SP)
ANDI	R26, R2, 255
ORI	R25, R0, 6
JAL	_TCS3472_Write8+0
NOP	
LHU	R26, 12(SP)
;TCS3472.c,275 :: 		TCS3472_Write8(0x07, Hi >> 8);
ANDI	R2, R26, 65535
SRL	R2, R2, 8
ANDI	R26, R2, 65535
ORI	R25, R0, 7
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,276 :: 		return 0x01;
ORI	R2, R0, 1
;TCS3472.c,277 :: 		}
;TCS3472.c,276 :: 		return 0x01;
;TCS3472.c,277 :: 		}
L_end_TCS3472_SetInterrupt_Limits:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _TCS3472_SetInterrupt_Limits
_TCS3472_C2RGB_Error:
;TCS3472.c,279 :: 		int TCS3472_C2RGB_Error(unsigned int* RGBC){
;TCS3472.c,282 :: 		err =   RGBC[0] - RGBC[1] - RGBC[2] -RGBC[3];
LHU	R3, 0(R25)
ADDIU	R2, R25, 2
LHU	R2, 0(R2)
SUBU	R3, R3, R2
ADDIU	R2, R25, 4
LHU	R2, 0(R2)
SUBU	R3, R3, R2
ADDIU	R2, R25, 6
LHU	R2, 0(R2)
SUBU	R2, R3, R2
; err start address is: 12 (R3)
ANDI	R3, R2, 65535
;TCS3472.c,283 :: 		if((err < -32600)||(err > 32600))
SEH	R2, R2
SLTI	R2, R2, -32600
BEQ	R2, R0, L__TCS3472_C2RGB_Error110
NOP	
J	L__TCS3472_C2RGB_Error62
NOP	
L__TCS3472_C2RGB_Error110:
SEH	R2, R3
SLTI	R2, R2, 32601
BNE	R2, R0, L__TCS3472_C2RGB_Error111
NOP	
J	L__TCS3472_C2RGB_Error61
NOP	
L__TCS3472_C2RGB_Error111:
J	L_TCS3472_C2RGB_Error24
NOP	
; err end address is: 12 (R3)
L__TCS3472_C2RGB_Error62:
L__TCS3472_C2RGB_Error61:
;TCS3472.c,284 :: 		return -32666;
ORI	R2, R0, 32870
J	L_end_TCS3472_C2RGB_Error
NOP	
L_TCS3472_C2RGB_Error24:
;TCS3472.c,286 :: 		return err;
; err start address is: 12 (R3)
SEH	R2, R3
; err end address is: 12 (R3)
;TCS3472.c,287 :: 		}
L_end_TCS3472_C2RGB_Error:
JR	RA
NOP	
; end of _TCS3472_C2RGB_Error
_GetScaledValues:
;TCS3472.c,289 :: 		void GetScaledValues(int* CRGB,float* rgb){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,291 :: 		c =  (float)CRGB[0];
SW	R25, 4(SP)
LH	R2, 0(R25)
SEH	R4, R2
JAL	__SignedIntegralToFloat+0
NOP	
; c start address is: 64 (R16)
MOVZ	R16, R2, R0
;TCS3472.c,292 :: 		r =  (float)CRGB[1];
ADDIU	R2, R25, 2
LH	R2, 0(R2)
SEH	R4, R2
JAL	__SignedIntegralToFloat+0
NOP	
; r start address is: 36 (R9)
MOVZ	R9, R2, R0
;TCS3472.c,293 :: 		g =  (float)CRGB[2];
ADDIU	R2, R25, 4
LH	R2, 0(R2)
SEH	R4, R2
JAL	__SignedIntegralToFloat+0
NOP	
; g start address is: 68 (R17)
MOVZ	R17, R2, R0
;TCS3472.c,294 :: 		b =  (float)CRGB[3];
ADDIU	R2, R25, 6
LH	R2, 0(R2)
SEH	R4, R2
JAL	__SignedIntegralToFloat+0
NOP	
; b start address is: 72 (R18)
MOVZ	R18, R2, R0
;TCS3472.c,296 :: 		r /= c;
MOVZ	R6, R16, R0
MOVZ	R4, R9, R0
JAL	__Div_FP+0
NOP	
; r end address is: 36 (R9)
;TCS3472.c,297 :: 		r *= 255.0;
LUI	R4, 17279
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
;TCS3472.c,298 :: 		rgb[0] = fabs(r);
MOVZ	R3, R26, R0
SW	R3, 8(SP)
MOVZ	R25, R2, R0
JAL	_fabs+0
NOP	
LW	R3, 8(SP)
SW	R2, 0(R3)
;TCS3472.c,299 :: 		g /= c;
MOVZ	R6, R16, R0
MOVZ	R4, R17, R0
JAL	__Div_FP+0
NOP	
; g end address is: 68 (R17)
;TCS3472.c,300 :: 		g *= 255.0;
LUI	R4, 17279
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
;TCS3472.c,301 :: 		rgb[1] = fabs(g);
ADDIU	R3, R26, 4
SW	R3, 8(SP)
MOVZ	R25, R2, R0
JAL	_fabs+0
NOP	
LW	R3, 8(SP)
SW	R2, 0(R3)
;TCS3472.c,302 :: 		b /= c;
MOVZ	R6, R16, R0
MOVZ	R4, R18, R0
JAL	__Div_FP+0
NOP	
; c end address is: 64 (R16)
; b end address is: 72 (R18)
;TCS3472.c,303 :: 		b *= 255.0;
LUI	R4, 17279
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
;TCS3472.c,304 :: 		rgb[2] = fabs(b);
ADDIU	R3, R26, 8
SW	R3, 8(SP)
MOVZ	R25, R2, R0
JAL	_fabs+0
NOP	
LW	R3, 8(SP)
SW	R2, 0(R3)
;TCS3472.c,306 :: 		}
L_end_GetScaledValues:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _GetScaledValues
_TCS3472_CalcHue:
;TCS3472.c,308 :: 		float TCS3472_CalcHue(float* rgb){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;TCS3472.c,318 :: 		rR = rgb[0];
LW	R2, 0(R25)
; rR start address is: 64 (R16)
MOVZ	R16, R2, R0
;TCS3472.c,319 :: 		gG = rgb[1];
ADDIU	R2, R25, 4
LW	R2, 0(R2)
; gG start address is: 68 (R17)
MOVZ	R17, R2, R0
;TCS3472.c,320 :: 		bB = rgb[2];
ADDIU	R2, R25, 8
LW	R2, 0(R2)
; bB start address is: 72 (R18)
MOVZ	R18, R2, R0
;TCS3472.c,322 :: 		maxF = max_(rgb);
JAL	_max_+0
NOP	
; maxF start address is: 44 (R11)
MOVZ	R11, R2, R0
;TCS3472.c,323 :: 		minF = min_(rgb);
JAL	_min_+0
NOP	
; minF start address is: 12 (R3)
MOVZ	R3, R2, R0
;TCS3472.c,326 :: 		maxF += (maxF == minF)? 1.0:0;
MOVZ	R4, R11, R0
MOVZ	R6, R2, R0
JAL	__Compare_FP+0
NOP	
SLTIU	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue116
NOP	
J	L_TCS3472_CalcHue26
NOP	
L__TCS3472_CalcHue116:
; ?FLOC___TCS3472_CalcHue?T211 start address is: 8 (R2)
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___TCS3472_CalcHue?T211 end address is: 8 (R2)
J	L_TCS3472_CalcHue27
NOP	
L_TCS3472_CalcHue26:
; ?FLOC___TCS3472_CalcHue?T211 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___TCS3472_CalcHue?T211 end address is: 8 (R2)
L_TCS3472_CalcHue27:
; ?FLOC___TCS3472_CalcHue?T211 start address is: 8 (R2)
MOVZ	R4, R11, R0
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; maxF end address is: 44 (R11)
; ?FLOC___TCS3472_CalcHue?T211 end address is: 8 (R2)
; maxF start address is: 76 (R19)
MOVZ	R19, R2, R0
;TCS3472.c,328 :: 		if(rR >= gG && rR >= bB){ //Red = max
MOVZ	R6, R17, R0
MOVZ	R4, R16, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
XORI	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue119
NOP	
J	L__TCS3472_CalcHue69
NOP	
L__TCS3472_CalcHue119:
MOVZ	R6, R18, R0
MOVZ	R4, R16, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
XORI	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue122
NOP	
J	L__TCS3472_CalcHue68
NOP	
L__TCS3472_CalcHue122:
; rR end address is: 64 (R16)
L__TCS3472_CalcHue67:
;TCS3472.c,330 :: 		gG += (gG == bB)? 1.0:0.0;
MOVZ	R4, R17, R0
MOVZ	R6, R18, R0
JAL	__Compare_FP+0
NOP	
SLTIU	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue125
NOP	
J	L_TCS3472_CalcHue31
NOP	
L__TCS3472_CalcHue125:
; ?FLOC___TCS3472_CalcHue?T217 start address is: 8 (R2)
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___TCS3472_CalcHue?T217 end address is: 8 (R2)
J	L_TCS3472_CalcHue32
NOP	
L_TCS3472_CalcHue31:
; ?FLOC___TCS3472_CalcHue?T217 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___TCS3472_CalcHue?T217 end address is: 8 (R2)
L_TCS3472_CalcHue32:
; ?FLOC___TCS3472_CalcHue?T217 start address is: 8 (R2)
MOVZ	R4, R17, R0
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; gG end address is: 68 (R17)
; ?FLOC___TCS3472_CalcHue?T217 end address is: 8 (R2)
;TCS3472.c,331 :: 		HUE = ((gG - bB)/(maxF - minF))*60.0;
MOVZ	R6, R18, R0
MOVZ	R4, R2, R0
JAL	__Sub_FP+0
NOP	
; bB end address is: 72 (R18)
SW	R2, 16(SP)
MOVZ	R6, R3, R0
MOVZ	R4, R19, R0
JAL	__Sub_FP+0
NOP	
; minF end address is: 12 (R3)
; maxF end address is: 76 (R19)
LW	R4, 16(SP)
MOVZ	R6, R2, R0
JAL	__Div_FP+0
NOP	
LUI	R4, 17008
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
;TCS3472.c,332 :: 		}else if(gG >= rR && gG >= bB){//Green = max
J	L_TCS3472_CalcHue33
NOP	
;TCS3472.c,328 :: 		if(rR >= gG && rR >= bB){ //Red = max
L__TCS3472_CalcHue69:
; maxF start address is: 76 (R19)
; minF start address is: 12 (R3)
; bB start address is: 72 (R18)
; gG start address is: 68 (R17)
; rR start address is: 64 (R16)
L__TCS3472_CalcHue68:
;TCS3472.c,332 :: 		}else if(gG >= rR && gG >= bB){//Green = max
MOVZ	R6, R16, R0
MOVZ	R4, R17, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
XORI	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue128
NOP	
J	L__TCS3472_CalcHue71
NOP	
L__TCS3472_CalcHue128:
MOVZ	R6, R18, R0
MOVZ	R4, R17, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
XORI	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue131
NOP	
J	L__TCS3472_CalcHue70
NOP	
L__TCS3472_CalcHue131:
; gG end address is: 68 (R17)
L__TCS3472_CalcHue66:
;TCS3472.c,334 :: 		bB += (rR == bB)? 1.0:0.0;
MOVZ	R4, R16, R0
MOVZ	R6, R18, R0
JAL	__Compare_FP+0
NOP	
SLTIU	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue134
NOP	
J	L_TCS3472_CalcHue37
NOP	
L__TCS3472_CalcHue134:
; ?FLOC___TCS3472_CalcHue?T227 start address is: 8 (R2)
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___TCS3472_CalcHue?T227 end address is: 8 (R2)
J	L_TCS3472_CalcHue38
NOP	
L_TCS3472_CalcHue37:
; ?FLOC___TCS3472_CalcHue?T227 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___TCS3472_CalcHue?T227 end address is: 8 (R2)
L_TCS3472_CalcHue38:
; ?FLOC___TCS3472_CalcHue?T227 start address is: 8 (R2)
MOVZ	R4, R18, R0
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; bB end address is: 72 (R18)
; ?FLOC___TCS3472_CalcHue?T227 end address is: 8 (R2)
;TCS3472.c,335 :: 		HUE = (2.0 + ((bB - rR)/(maxF - minF)))*60.0;
MOVZ	R6, R16, R0
MOVZ	R4, R2, R0
JAL	__Sub_FP+0
NOP	
; rR end address is: 64 (R16)
SW	R2, 16(SP)
MOVZ	R6, R3, R0
MOVZ	R4, R19, R0
JAL	__Sub_FP+0
NOP	
; minF end address is: 12 (R3)
; maxF end address is: 76 (R19)
LW	R4, 16(SP)
MOVZ	R6, R2, R0
JAL	__Div_FP+0
NOP	
LUI	R4, 16384
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
LUI	R4, 17008
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
;TCS3472.c,336 :: 		}else if(bB >= rR && bB >= gG){//Blue = max
J	L_TCS3472_CalcHue39
NOP	
;TCS3472.c,332 :: 		}else if(gG >= rR && gG >= bB){//Green = max
L__TCS3472_CalcHue71:
; maxF start address is: 76 (R19)
; minF start address is: 12 (R3)
; bB start address is: 72 (R18)
; gG start address is: 68 (R17)
; rR start address is: 64 (R16)
L__TCS3472_CalcHue70:
;TCS3472.c,336 :: 		}else if(bB >= rR && bB >= gG){//Blue = max
MOVZ	R6, R16, R0
MOVZ	R4, R18, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
XORI	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue137
NOP	
J	L__TCS3472_CalcHue73
NOP	
L__TCS3472_CalcHue137:
MOVZ	R6, R17, R0
MOVZ	R4, R18, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
XORI	R2, R2, 1
BNE	R2, R0, L__TCS3472_CalcHue140
NOP	
J	L__TCS3472_CalcHue72
NOP	
L__TCS3472_CalcHue140:
L__TCS3472_CalcHue65:
;TCS3472.c,338 :: 		rR += (rR == bB)? 1.0:0.0;
MOVZ	R4, R16, R0
MOVZ	R6, R18, R0
JAL	__Compare_FP+0
NOP	
SLTIU	R2, R2, 1
; bB end address is: 72 (R18)
BNE	R2, R0, L__TCS3472_CalcHue143
NOP	
J	L_TCS3472_CalcHue43
NOP	
L__TCS3472_CalcHue143:
; ?FLOC___TCS3472_CalcHue?T238 start address is: 8 (R2)
LUI	R2, 16256
ORI	R2, R2, 0
; ?FLOC___TCS3472_CalcHue?T238 end address is: 8 (R2)
J	L_TCS3472_CalcHue44
NOP	
L_TCS3472_CalcHue43:
; ?FLOC___TCS3472_CalcHue?T238 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___TCS3472_CalcHue?T238 end address is: 8 (R2)
L_TCS3472_CalcHue44:
; ?FLOC___TCS3472_CalcHue?T238 start address is: 8 (R2)
MOVZ	R4, R16, R0
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; rR end address is: 64 (R16)
; ?FLOC___TCS3472_CalcHue?T238 end address is: 8 (R2)
;TCS3472.c,339 :: 		HUE = (4.0 + ((rR - gG)/(maxF - minF)))*60.0;
MOVZ	R6, R17, R0
MOVZ	R4, R2, R0
JAL	__Sub_FP+0
NOP	
; gG end address is: 68 (R17)
SW	R2, 16(SP)
MOVZ	R6, R3, R0
MOVZ	R4, R19, R0
JAL	__Sub_FP+0
NOP	
; minF end address is: 12 (R3)
; maxF end address is: 76 (R19)
LW	R4, 16(SP)
MOVZ	R6, R2, R0
JAL	__Div_FP+0
NOP	
LUI	R4, 16512
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
LUI	R4, 17008
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, 12(SP)
;TCS3472.c,336 :: 		}else if(bB >= rR && bB >= gG){//Blue = max
L__TCS3472_CalcHue73:
L__TCS3472_CalcHue72:
;TCS3472.c,340 :: 		}
L_TCS3472_CalcHue39:
L_TCS3472_CalcHue33:
;TCS3472.c,342 :: 		return HUE += (HUE < 0.0)? 360.0 : 0.0;
LW	R6, 12(SP)
MOVZ	R4, R0, R0
JAL	__Compare_FP+0
NOP	
SLT	R2, R0, R2
BNE	R2, R0, L__TCS3472_CalcHue146
NOP	
J	L_TCS3472_CalcHue45
NOP	
L__TCS3472_CalcHue146:
; ?FLOC___TCS3472_CalcHue?T246 start address is: 8 (R2)
LUI	R2, 17332
ORI	R2, R2, 0
; ?FLOC___TCS3472_CalcHue?T246 end address is: 8 (R2)
J	L_TCS3472_CalcHue46
NOP	
L_TCS3472_CalcHue45:
; ?FLOC___TCS3472_CalcHue?T246 start address is: 8 (R2)
MOVZ	R2, R0, R0
; ?FLOC___TCS3472_CalcHue?T246 end address is: 8 (R2)
L_TCS3472_CalcHue46:
; ?FLOC___TCS3472_CalcHue?T246 start address is: 8 (R2)
LW	R4, 12(SP)
MOVZ	R6, R2, R0
JAL	__Add_FP+0
NOP	
; ?FLOC___TCS3472_CalcHue?T246 end address is: 8 (R2)
;TCS3472.c,343 :: 		}
L_end_TCS3472_CalcHue:
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _TCS3472_CalcHue
_max_:
;TCS3472.c,345 :: 		float max_(float* rgb){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;TCS3472.c,346 :: 		float temp1 = 0.0;
;TCS3472.c,347 :: 		int i = 0;
;TCS3472.c,348 :: 		temp1 = rgb[0];
LW	R2, 0(R25)
; temp1 start address is: 40 (R10)
MOVZ	R10, R2, R0
;TCS3472.c,349 :: 		for (i=1;i<3;i++){
; i start address is: 12 (R3)
ORI	R3, R0, 1
; temp1 end address is: 40 (R10)
; i end address is: 12 (R3)
L_max_47:
; i start address is: 12 (R3)
; temp1 start address is: 40 (R10)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L__max_148
NOP	
J	L_max_48
NOP	
L__max_148:
;TCS3472.c,350 :: 		if(rgb[i] > temp1)
SEH	R2, R3
SLL	R2, R2, 2
ADDU	R2, R25, R2
LW	R4, 0(R2)
MOVZ	R6, R10, R0
JAL	__Compare_FP+0
NOP	
SLT	R2, R0, R2
BNE	R2, R0, L__max_151
NOP	
J	L__max_63
NOP	
L__max_151:
; temp1 end address is: 40 (R10)
;TCS3472.c,351 :: 		temp1 = rgb[i];
SEH	R2, R3
SLL	R2, R2, 2
ADDU	R2, R25, R2
LW	R2, 0(R2)
; temp1 start address is: 16 (R4)
MOVZ	R4, R2, R0
; temp1 end address is: 16 (R4)
MOVZ	R10, R4, R0
J	L_max_50
NOP	
L__max_63:
;TCS3472.c,350 :: 		if(rgb[i] > temp1)
;TCS3472.c,351 :: 		temp1 = rgb[i];
L_max_50:
;TCS3472.c,349 :: 		for (i=1;i<3;i++){
; temp1 start address is: 40 (R10)
ADDIU	R2, R3, 1
SEH	R3, R2
;TCS3472.c,352 :: 		}
; i end address is: 12 (R3)
J	L_max_47
NOP	
L_max_48:
;TCS3472.c,353 :: 		return temp1;
MOVZ	R2, R10, R0
; temp1 end address is: 40 (R10)
;TCS3472.c,354 :: 		}
L_end_max_:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _max_
_min_:
;TCS3472.c,356 :: 		float min_(float* rgb){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;TCS3472.c,357 :: 		float temp1 = 0.0;
;TCS3472.c,358 :: 		int i = 0;
;TCS3472.c,359 :: 		temp1 = rgb[0];
LW	R2, 0(R25)
; temp1 start address is: 40 (R10)
MOVZ	R10, R2, R0
;TCS3472.c,360 :: 		for (i=1;i<3;i++){
; i start address is: 12 (R3)
ORI	R3, R0, 1
; temp1 end address is: 40 (R10)
; i end address is: 12 (R3)
L_min_51:
; i start address is: 12 (R3)
; temp1 start address is: 40 (R10)
SEH	R2, R3
SLTI	R2, R2, 3
BNE	R2, R0, L__min_153
NOP	
J	L_min_52
NOP	
L__min_153:
;TCS3472.c,361 :: 		if(rgb[i] < temp1)
SEH	R2, R3
SLL	R2, R2, 2
ADDU	R2, R25, R2
LW	R4, 0(R2)
MOVZ	R6, R10, R0
JAL	__Compare_FP+0
NOP	
SLTI	R2, R2, 0
BNE	R2, R0, L__min_156
NOP	
J	L__min_64
NOP	
L__min_156:
; temp1 end address is: 40 (R10)
;TCS3472.c,362 :: 		temp1 = rgb[i];
SEH	R2, R3
SLL	R2, R2, 2
ADDU	R2, R25, R2
LW	R2, 0(R2)
; temp1 start address is: 16 (R4)
MOVZ	R4, R2, R0
; temp1 end address is: 16 (R4)
MOVZ	R10, R4, R0
J	L_min_54
NOP	
L__min_64:
;TCS3472.c,361 :: 		if(rgb[i] < temp1)
;TCS3472.c,362 :: 		temp1 = rgb[i];
L_min_54:
;TCS3472.c,360 :: 		for (i=1;i<3;i++){
; temp1 start address is: 40 (R10)
ADDIU	R2, R3, 1
SEH	R3, R2
;TCS3472.c,363 :: 		}
; i end address is: 12 (R3)
J	L_min_51
NOP	
L_min_52:
;TCS3472.c,364 :: 		return temp1;
MOVZ	R2, R10, R0
; temp1 end address is: 40 (R10)
;TCS3472.c,365 :: 		}
L_end_min_:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _min_
