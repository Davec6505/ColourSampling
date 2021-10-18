_ConfigPic:
;Config.c,9 :: 		void ConfigPic(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Config.c,11 :: 		CHECON = 30;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ORI	R2, R0, 30
SW	R2, Offset(CHECON+0)(GP)
;Config.c,12 :: 		AD1PCFG = 0xFFFFFFFF;
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
;Config.c,13 :: 		JTAGEN_bit = 0;
_LX	
INS	R2, R0, BitPos(JTAGEN_bit+0), 1
_SX	
;Config.c,15 :: 		TRISA = 0X0200;
ORI	R2, R0, 512
SW	R2, Offset(TRISA+0)(GP)
;Config.c,16 :: 		TRISB = 0X0010;
ORI	R2, R0, 16
SW	R2, Offset(TRISB+0)(GP)
;Config.c,17 :: 		TRISC = 0X0000;
SW	R0, Offset(TRISC+0)(GP)
;Config.c,18 :: 		TRISD = 0X0000;
SW	R0, Offset(TRISD+0)(GP)
;Config.c,19 :: 		TRISE = 0X0210;
ORI	R2, R0, 528
SW	R2, Offset(TRISE+0)(GP)
;Config.c,20 :: 		TRISF = 0X0000;
SW	R0, Offset(TRISF+0)(GP)
;Config.c,21 :: 		TRISG = 0X0000;
SW	R0, Offset(TRISG+0)(GP)
;Config.c,26 :: 		USBIE_bit = 0;
LUI	R2, BitMask(USBIE_bit+0)
ORI	R2, R2, BitMask(USBIE_bit+0)
_SX	
;Config.c,27 :: 		IPC11bits.USBIP = 7;
ORI	R2, R0, 7168
SH	R2, Offset(IPC11bits+8)(GP)
;Config.c,28 :: 		HID_Enable(&readbuff,&writebuff);
LUI	R26, hi_addr(_writebuff+0)
ORI	R26, R26, lo_addr(_writebuff+0)
LUI	R25, hi_addr(_readbuff+0)
ORI	R25, R25, lo_addr(_readbuff+0)
JAL	_HID_Enable+0
NOP	
;Config.c,30 :: 		I2C2_Init_Advanced(80000,100000);//INIT I2C AT 100KHZ
LUI	R26, 1
ORI	R26, R26, 34464
LUI	R25, 1
ORI	R25, R25, 14464
JAL	_I2C2_Init_Advanced+0
NOP	
;Config.c,31 :: 		I2C_Set_Active(&I2C2_Start, &I2C2_Restart, &I2C2_Read, &I2C2_Write,
LUI	R28, hi_addr(_I2C2_Write+0)
ORI	R28, R28, lo_addr(_I2C2_Write+0)
LUI	R27, hi_addr(_I2C2_Read+0)
ORI	R27, R27, lo_addr(_I2C2_Read+0)
LUI	R26, hi_addr(_I2C2_Restart+0)
ORI	R26, R26, lo_addr(_I2C2_Restart+0)
LUI	R25, hi_addr(_I2C2_Start+0)
ORI	R25, R25, lo_addr(_I2C2_Start+0)
;Config.c,32 :: 		&I2C2_Stop,&I2C2_Is_Idle); // Sets the I2C2 module active
LUI	R2, hi_addr(_I2C2_Is_Idle+0)
ORI	R2, R2, lo_addr(_I2C2_Is_Idle+0)
ADDIU	SP, SP, -8
SW	R2, 4(SP)
LUI	R2, hi_addr(_I2C2_Stop+0)
ORI	R2, R2, lo_addr(_I2C2_Stop+0)
SW	R2, 0(SP)
JAL	_I2C_Set_Active+0
NOP	
ADDIU	SP, SP, 8
;Config.c,33 :: 		I2C2_SetTimeoutCallback(1000, I2C2_TimeoutCallback);
LUI	R26, hi_addr(_I2C2_TimeoutCallback+0)
ORI	R26, R26, lo_addr(_I2C2_TimeoutCallback+0)
ORI	R25, R0, 1000
JAL	_I2C2_SetTimeoutCallback+0
NOP	
;Config.c,34 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_ConfigPic0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ConfigPic0
NOP	
;Config.c,35 :: 		InitUart1();
JAL	_InitUart1+0
NOP	
;Config.c,36 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_ConfigPic2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ConfigPic2
NOP	
;Config.c,37 :: 		InitUart2();
JAL	_InitUart2+0
NOP	
;Config.c,40 :: 		MM_Init();
JAL	_MM_Init+0
NOP	
;Config.c,43 :: 		LATA10_bit = 0;
LUI	R2, BitMask(LATA10_bit+0)
ORI	R2, R2, BitMask(LATA10_bit+0)
_SX	
;Config.c,44 :: 		LATE3_bit = 0;
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
;Config.c,45 :: 		InitTimer1();
JAL	_InitTimer1+0
NOP	
;Config.c,46 :: 		InitISR();
JAL	_InitISR+0
NOP	
;Config.c,47 :: 		InitGSM3();
JAL	_InitGSM3+0
NOP	
;Config.c,48 :: 		PwrUpGSM3();
JAL	_PwrUpGSM3+0
NOP	
;Config.c,49 :: 		}
L_end_ConfigPic:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _ConfigPic
_InitUart1:
;Config.c,51 :: 		void InitUart1(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Config.c,52 :: 		UART1_Init(9600);              // Initialize UART module at 9600 bps
SW	R25, 4(SP)
ORI	R25, R0, 9600
JAL	_UART1_Init+0
NOP	
;Config.c,53 :: 		URXISEL0_bit  = 0;
LUI	R2, BitMask(URXISEL0_bit+0)
ORI	R2, R2, BitMask(URXISEL0_bit+0)
_SX	
;Config.c,54 :: 		URXISEL1_bit  = 0;
LUI	R2, BitMask(URXISEL1_bit+0)
ORI	R2, R2, BitMask(URXISEL1_bit+0)
_SX	
;Config.c,55 :: 		IPC6CLR = 0X1F;
ORI	R2, R0, 31
SW	R2, Offset(IPC6CLR+0)(GP)
;Config.c,56 :: 		IPC6SET = 0X1B;                //PRIORITY LEVEL 6  recieve
ORI	R2, R0, 27
SW	R2, Offset(IPC6SET+0)(GP)
;Config.c,57 :: 		U1RXIE_bit = 1;
LUI	R2, BitMask(U1RXIE_bit+0)
ORI	R2, R2, BitMask(U1RXIE_bit+0)
_SX	
;Config.c,58 :: 		U1RXIF_bit = 0;
LUI	R2, BitMask(U1RXIF_bit+0)
ORI	R2, R2, BitMask(U1RXIF_bit+0)
_SX	
;Config.c,59 :: 		}
L_end_InitUart1:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _InitUart1
_InitUart2:
;Config.c,61 :: 		void InitUart2(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Config.c,62 :: 		UART2_Init(9600);              // Initialize UART module at 9600 bps
SW	R25, 4(SP)
ORI	R25, R0, 9600
JAL	_UART2_Init+0
NOP	
;Config.c,63 :: 		IPC8CLR = 0X1F;
ORI	R2, R0, 31
SW	R2, Offset(IPC8CLR+0)(GP)
;Config.c,64 :: 		IPC8SET = 0X1A;                //PRIORITY LEVEL 6 recieve
ORI	R2, R0, 26
SW	R2, Offset(IPC8SET+0)(GP)
;Config.c,65 :: 		U2RXIE_bit = 1;
LUI	R2, BitMask(U2RXIE_bit+0)
ORI	R2, R2, BitMask(U2RXIE_bit+0)
_SX	
;Config.c,66 :: 		U2RXIF_bit = 0;
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
;Config.c,67 :: 		}
L_end_InitUart2:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _InitUart2
_InitVars:
;Config.c,69 :: 		void InitVars(){
;Config.c,71 :: 		}
L_end_InitVars:
JR	RA
NOP	
; end of _InitVars
