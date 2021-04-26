_TCS3472_Init:
;TCS3472.c,7 :: 		unsigned short TCS3472_Init(TCS3472_IntegrationTime_t It,TCS3472_Gain_t gain ){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,9 :: 		x = TCS3472_Read8(TCS3472_ID);
SW	R25, 4(SP)
SB	R26, 8(SP)
SB	R25, 9(SP)
ORI	R25, R0, 18
JAL	_TCS3472_Read8+0
NOP	
LBU	R25, 9(SP)
;TCS3472.c,13 :: 		TCS3472_Initialised = 1;
LBU	R2, Offset(_TCS3472_Bits+0)(GP)
ORI	R2, R2, 1
SB	R2, Offset(_TCS3472_Bits+0)(GP)
;TCS3472.c,15 :: 		TCS3472_SetIntergration_Time(It);
JAL	_TCS3472_SetIntergration_Time+0
NOP	
LBU	R26, 8(SP)
;TCS3472.c,16 :: 		TCS3472_SetGain(gain);
ANDI	R25, R26, 255
JAL	_TCS3472_SetGain+0
NOP	
;TCS3472.c,17 :: 		TCS3472_Enable();
JAL	_TCS3472_Enable+0
NOP	
;TCS3472.c,20 :: 		return 2;//TCS3472_Bits;
ORI	R2, R0, 2
;TCS3472.c,21 :: 		}
;TCS3472.c,20 :: 		return 2;//TCS3472_Bits;
;TCS3472.c,21 :: 		}
L_end_TCS3472_Init:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Init
_TCS3472_Write:
;TCS3472.c,23 :: 		void TCS3472_Write(unsigned short cmd){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;TCS3472.c,24 :: 		I2C2_Start();                      // issue I2C start signal
SB	R25, 4(SP)
JAL	_I2C2_Start+0
NOP	
;TCS3472.c,25 :: 		I2C2_Write(TCS3472_ADDR);          // send byte via I2C  (slave address)
ORI	R25, R0, 41
JAL	_I2C2_Write+0
NOP	
LBU	R25, 4(SP)
;TCS3472.c,26 :: 		I2C2_Write(cmd);                  // send byte (command reg MSB)
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,27 :: 		I2C2_Stop();
JAL	_I2C2_Stop+0
NOP	
;TCS3472.c,28 :: 		}
L_end_TCS3472_Write:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TCS3472_Write
_TCS3472_Write8:
;TCS3472.c,30 :: 		void TCS3472_Write8(unsigned short reg_add, unsigned short value){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,31 :: 		I2C2_Start();                      // issue I2C start signal
SW	R25, 4(SP)
SB	R26, 8(SP)
SB	R25, 9(SP)
JAL	_I2C2_Start+0
NOP	
;TCS3472.c,32 :: 		I2C2_Write(TCS3472_ADDR);          // send byte via I2C  (slave address)
ORI	R25, R0, 41
JAL	_I2C2_Write+0
NOP	
LBU	R25, 9(SP)
;TCS3472.c,33 :: 		I2C2_Write(TCS3472_CMD_BIT | reg_add);       // send byte (command reg MSB)
ORI	R2, R25, 128
ANDI	R25, R2, 255
JAL	_I2C2_Write+0
NOP	
LBU	R26, 8(SP)
;TCS3472.c,34 :: 		I2C2_Write(value);                 // send byte (data to be written)
ANDI	R25, R26, 255
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,35 :: 		I2C2_Stop();                       // issue I2C stop signal
JAL	_I2C2_Stop+0
NOP	
;TCS3472.c,37 :: 		}
L_end_TCS3472_Write8:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Write8
_TCS3472_Read8:
;TCS3472.c,39 :: 		unsigned short TCS3472_Read8(unsigned short reg_add){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,41 :: 		I2C2_Start();                   // issue I2C start signal
SW	R25, 4(SP)
SB	R25, 8(SP)
JAL	_I2C2_Start+0
NOP	
;TCS3472.c,42 :: 		I2C2_Write(TCS3472_ADDR);       // send byte via I2C  (device address + W)
ORI	R25, R0, 41
JAL	_I2C2_Write+0
NOP	
LBU	R25, 8(SP)
;TCS3472.c,43 :: 		I2C2_Write(reg_add);            // send byte (data address)
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,44 :: 		temp = I2C2_Read(_I2C_NACK);   // Read the data (NO acknowledge)
ORI	R25, R0, 1
JAL	_I2C2_Read+0
NOP	
SB	R2, 9(SP)
;TCS3472.c,45 :: 		I2C2_Stop();
JAL	_I2C2_Stop+0
NOP	
;TCS3472.c,46 :: 		return temp;
LBU	R2, 9(SP)
;TCS3472.c,47 :: 		}
;TCS3472.c,46 :: 		return temp;
;TCS3472.c,47 :: 		}
L_end_TCS3472_Read8:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Read8
_TCS3472_Read16:
;TCS3472.c,49 :: 		unsigned int TCS3472_Read16(unsigned short reg_add){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;TCS3472.c,52 :: 		I2C2_Start();              // issue I2C start signal
SW	R25, 4(SP)
SB	R25, 8(SP)
JAL	_I2C2_Start+0
NOP	
;TCS3472.c,53 :: 		I2C2_Write(TCS3472_ADDR);          // send byte via I2C  (device address + W)
ORI	R25, R0, 41
JAL	_I2C2_Write+0
NOP	
LBU	R25, 8(SP)
;TCS3472.c,54 :: 		I2C2_Write(TCS3472_CMD_BIT | reg_add);       // send byte (command reg MSB)
ORI	R2, R25, 128
ANDI	R25, R2, 255
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,55 :: 		I2C2_Restart();            // issue I2C signal repeated start
JAL	_I2C2_Restart+0
NOP	
;TCS3472.c,56 :: 		I2C2_Write(TCS3472_ADDR);          // send byte (device address + R)
ORI	R25, R0, 41
JAL	_I2C2_Write+0
NOP	
;TCS3472.c,57 :: 		temp[0] = I2C2_Read(_I2C_ACK);      // Read the data (NO acknowledge)
ADDIU	R2, SP, 9
SW	R2, 12(SP)
MOVZ	R25, R0, R0
JAL	_I2C2_Read+0
NOP	
LW	R3, 12(SP)
SB	R2, 0(R3)
;TCS3472.c,58 :: 		temp[1] = I2C2_Read(_I2C_ACK);
ADDIU	R2, SP, 9
ADDIU	R2, R2, 1
SW	R2, 12(SP)
MOVZ	R25, R0, R0
JAL	_I2C2_Read+0
NOP	
LW	R3, 12(SP)
SB	R2, 0(R3)
;TCS3472.c,59 :: 		I2C2_Stop();
JAL	_I2C2_Stop+0
NOP	
;TCS3472.c,60 :: 		reslt = temp[0];
ADDIU	R4, SP, 9
LBU	R2, 0(R4)
; reslt start address is: 12 (R3)
ANDI	R3, R2, 255
;TCS3472.c,61 :: 		reslt = (reslt << 8) | temp[1];
ANDI	R2, R3, 65535
; reslt end address is: 12 (R3)
SLL	R3, R2, 8
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;TCS3472.c,62 :: 		return reslt;
;TCS3472.c,63 :: 		}
;TCS3472.c,62 :: 		return reslt;
;TCS3472.c,63 :: 		}
L_end_TCS3472_Read16:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _TCS3472_Read16
_TCS3472_Enable:
;TCS3472.c,65 :: 		void TCS3472_Enable(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,66 :: 		TCS3472_Write8(TCS3472_EN, TCS3472_EN_PON);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R26, R0, 1
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,67 :: 		Delay_ms(3);
LUI	R24, 1
ORI	R24, R24, 14463
L_TCS3472_Enable0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_TCS3472_Enable0
NOP	
NOP	
;TCS3472.c,68 :: 		TCS3472_Write8(TCS3472_EN, TCS3472_EN_PON | TCS3472_EN_AEN);
ORI	R26, R0, 3
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,69 :: 		}
L_end_TCS3472_Enable:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Enable
_TCS3472_Disable:
;TCS3472.c,71 :: 		void TCS3472_Disable(){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,73 :: 		read = TCS3472_Read8(TCS3472_EN);
SW	R25, 4(SP)
SW	R26, 8(SP)
MOVZ	R25, R0, R0
JAL	_TCS3472_Read8+0
NOP	
;TCS3472.c,74 :: 		TCS3472_Write8(TCS3472_EN, read & ~(TCS3472_EN_PON | TCS3472_EN_AEN));
ORI	R3, R0, 252
AND	R2, R2, R3
ANDI	R26, R2, 255
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,75 :: 		}
L_end_TCS3472_Disable:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_Disable
_TCS3472_SetIntergration_Time:
;TCS3472.c,77 :: 		void TCS3472_SetIntergration_Time(TCS3472_IntegrationTime_t It){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,79 :: 		TCS3472_Write8(TCS3472_ATIME, It);
SW	R25, 4(SP)
SW	R26, 8(SP)
ANDI	R26, R25, 255
ORI	R25, R0, 1
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,80 :: 		}
L_end_TCS3472_SetIntergration_Time:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_SetIntergration_Time
_TCS3472_SetGain:
;TCS3472.c,82 :: 		void TCS3472_SetGain(TCS3472_Gain_t gain){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,83 :: 		TCS3472_Write8(TCS3472_CONTROL, gain);
SW	R25, 4(SP)
SW	R26, 8(SP)
ANDI	R26, R25, 255
ORI	R25, R0, 15
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,84 :: 		}
L_end_TCS3472_SetGain:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_SetGain
_TCS3472_getRawData:
;TCS3472.c,86 :: 		void TCS3472_getRawData(unsigned int *RGBC){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;TCS3472.c,87 :: 		*(RGBC) = TCS3472_Read16(TCS3472_CDATAL);
SW	R25, 4(SP)
SW	R25, 8(SP)
ORI	R25, R0, 20
JAL	_TCS3472_Read16+0
NOP	
LW	R25, 8(SP)
SH	R2, 0(R25)
;TCS3472.c,88 :: 		*(RGBC + 1) = TCS3472_Read16(TCS3472_RDATAL);
ADDIU	R2, R25, 2
SW	R2, 12(SP)
SW	R25, 8(SP)
ORI	R25, R0, 22
JAL	_TCS3472_Read16+0
NOP	
LW	R25, 8(SP)
LW	R3, 12(SP)
SH	R2, 0(R3)
;TCS3472.c,89 :: 		*(RGBC + 2) = TCS3472_Read16(TCS3472_GDATAL);
ADDIU	R2, R25, 4
SW	R2, 12(SP)
SW	R25, 8(SP)
ORI	R25, R0, 24
JAL	_TCS3472_Read16+0
NOP	
LW	R25, 8(SP)
LW	R3, 12(SP)
SH	R2, 0(R3)
;TCS3472.c,90 :: 		*(RGBC + 3) = TCS3472_Read16(TCS3472_BDATAL);
ADDIU	R2, R25, 6
SW	R2, 12(SP)
ORI	R25, R0, 26
JAL	_TCS3472_Read16+0
NOP	
LW	R3, 12(SP)
SH	R2, 0(R3)
;TCS3472.c,91 :: 		}
L_end_TCS3472_getRawData:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _TCS3472_getRawData
_TCS3472_getRawDataOnce:
;TCS3472.c,93 :: 		void TCS3472_getRawDataOnce(unsigned int *RGBC){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;TCS3472.c,94 :: 		TCS3472_Enable();
SW	R25, 4(SP)
JAL	_TCS3472_Enable+0
NOP	
LW	R25, 4(SP)
;TCS3472.c,95 :: 		TCS3472_getRawData(RGBC);
JAL	_TCS3472_getRawData+0
NOP	
;TCS3472.c,96 :: 		TCS3472_Disable();
JAL	_TCS3472_Disable+0
NOP	
;TCS3472.c,97 :: 		}
L_end_TCS3472_getRawDataOnce:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TCS3472_getRawDataOnce
_TCS3472_CalcColTemp:
;TCS3472.c,99 :: 		unsigned int TCS3472_CalcColTemp(unsigned int R,unsigned int G,unsigned int B){
;TCS3472.c,101 :: 		}
L_end_TCS3472_CalcColTemp:
JR	RA
NOP	
; end of _TCS3472_CalcColTemp
_TCS3472_CalcColTemp_dn40:
;TCS3472.c,103 :: 		unsigned int TCS3472_CalcColTemp_dn40(unsigned int *RGBC){
;TCS3472.c,105 :: 		}
L_end_TCS3472_CalcColTemp_dn40:
JR	RA
NOP	
; end of _TCS3472_CalcColTemp_dn40
_TCS3472_Calc_Lux:
;TCS3472.c,107 :: 		unsigned int TCS3472_Calc_Lux(unsigned int R,unsigned int G,unsigned int B){
;TCS3472.c,109 :: 		}
L_end_TCS3472_Calc_Lux:
JR	RA
NOP	
; end of _TCS3472_Calc_Lux
_TCS3472_SetInterrupt:
;TCS3472.c,111 :: 		void TCS3472_SetInterrupt(char i){
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;TCS3472.c,113 :: 		r = TCS3472_Read8(TCS3472_EN);
SW	R25, 4(SP)
SW	R26, 8(SP)
MOVZ	R25, R0, R0
JAL	_TCS3472_Read8+0
NOP	
;TCS3472.c,115 :: 		if(i = 1)
ORI	R25, R0, 1
;TCS3472.c,116 :: 		r |= TCS3472_EN_AIEN;
ORI	R2, R2, 16
; r start address is: 8 (R2)
;TCS3472.c,118 :: 		r &= ~TCS3472_EN_AIEN;
L_TCS3472_SetInterrupt3:
;TCS3472.c,120 :: 		TCS3472_Write8(TCS3472_EN, r);
ANDI	R26, R2, 255
; r end address is: 8 (R2)
MOVZ	R25, R0, R0
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,121 :: 		}
L_end_TCS3472_SetInterrupt:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _TCS3472_SetInterrupt
_TCS3472_ClearInterrupt:
;TCS3472.c,123 :: 		void TCS3472_ClearInterrupt(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;TCS3472.c,124 :: 		TCS3472_Write(TCS3472_CMD_BIT | 0x66);
SW	R25, 4(SP)
ORI	R25, R0, 230
JAL	_TCS3472_Write+0
NOP	
;TCS3472.c,125 :: 		}
L_end_TCS3472_ClearInterrupt:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TCS3472_ClearInterrupt
_TCS3472_SetInterrupt_Limits:
;TCS3472.c,127 :: 		void TCS3472_SetInterrupt_Limits(unsigned int Lo,unsigned int Hi){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;TCS3472.c,128 :: 		TCS3472_Write8(0x04, Lo & 0xFF);
SW	R25, 4(SP)
SW	R26, 8(SP)
ANDI	R2, R25, 255
SH	R26, 12(SP)
SH	R25, 14(SP)
ANDI	R26, R2, 255
ORI	R25, R0, 4
JAL	_TCS3472_Write8+0
NOP	
LHU	R25, 14(SP)
;TCS3472.c,129 :: 		TCS3472_Write8(0x05, Lo >> 8);
ANDI	R2, R25, 65535
SRL	R2, R2, 8
ANDI	R26, R2, 65535
ORI	R25, R0, 5
JAL	_TCS3472_Write8+0
NOP	
LHU	R26, 12(SP)
;TCS3472.c,130 :: 		TCS3472_Write8(0x06, Hi & 0xFF);
ANDI	R2, R26, 255
SH	R26, 12(SP)
ANDI	R26, R2, 255
ORI	R25, R0, 6
JAL	_TCS3472_Write8+0
NOP	
LHU	R26, 12(SP)
;TCS3472.c,131 :: 		TCS3472_Write8(0x07, Hi >> 8);
ANDI	R2, R26, 65535
SRL	R2, R2, 8
ANDI	R26, R2, 65535
ORI	R25, R0, 7
JAL	_TCS3472_Write8+0
NOP	
;TCS3472.c,132 :: 		}
L_end_TCS3472_SetInterrupt_Limits:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _TCS3472_SetInterrupt_Limits
