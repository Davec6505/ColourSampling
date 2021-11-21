_ConfigPic:
;Config.c,10 :: 		void ConfigPic(){
ADDIU	SP, SP, -20
SW	RA, 0(SP)
;Config.c,12 :: 		CHECON = 30;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ORI	R2, R0, 30
SW	R2, Offset(CHECON+0)(GP)
;Config.c,13 :: 		AD1PCFG = 0xFFFFFFFF;
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
;Config.c,14 :: 		JTAGEN_bit = 0;
_LX	
INS	R2, R0, BitPos(JTAGEN_bit+0), 1
_SX	
;Config.c,16 :: 		TRISA = 0X0200;
ORI	R2, R0, 512
SW	R2, Offset(TRISA+0)(GP)
;Config.c,17 :: 		TRISB = 0X0010;
ORI	R2, R0, 16
SW	R2, Offset(TRISB+0)(GP)
;Config.c,18 :: 		TRISC = 0X0000;
SW	R0, Offset(TRISC+0)(GP)
;Config.c,19 :: 		TRISD = 0X0000;
SW	R0, Offset(TRISD+0)(GP)
;Config.c,20 :: 		TRISE = 0X0210;
ORI	R2, R0, 528
SW	R2, Offset(TRISE+0)(GP)
;Config.c,21 :: 		TRISF = 0X0000;
SW	R0, Offset(TRISF+0)(GP)
;Config.c,22 :: 		TRISG = 0X0200;
ORI	R2, R0, 512
SW	R2, Offset(TRISG+0)(GP)
;Config.c,27 :: 		USBIE_bit = 0;
LUI	R2, BitMask(USBIE_bit+0)
ORI	R2, R2, BitMask(USBIE_bit+0)
_SX	
;Config.c,28 :: 		IPC11bits.USBIP = 7;
ORI	R2, R0, 7168
SH	R2, Offset(IPC11bits+8)(GP)
;Config.c,29 :: 		HID_Enable(&readbuff,&writebuff);
LUI	R26, hi_addr(_writebuff+0)
ORI	R26, R26, lo_addr(_writebuff+0)
LUI	R25, hi_addr(_readbuff+0)
ORI	R25, R25, lo_addr(_readbuff+0)
JAL	_HID_Enable+0
NOP	
;Config.c,31 :: 		I2C2_Init_Advanced(80000,100000);//INIT I2C AT 100KHZ
LUI	R26, 1
ORI	R26, R26, 34464
LUI	R25, 1
ORI	R25, R25, 14464
JAL	_I2C2_Init_Advanced+0
NOP	
;Config.c,32 :: 		I2C_Set_Active(&I2C2_Start, &I2C2_Restart, &I2C2_Read, &I2C2_Write,
LUI	R28, hi_addr(_I2C2_Write+0)
ORI	R28, R28, lo_addr(_I2C2_Write+0)
LUI	R27, hi_addr(_I2C2_Read+0)
ORI	R27, R27, lo_addr(_I2C2_Read+0)
LUI	R26, hi_addr(_I2C2_Restart+0)
ORI	R26, R26, lo_addr(_I2C2_Restart+0)
LUI	R25, hi_addr(_I2C2_Start+0)
ORI	R25, R25, lo_addr(_I2C2_Start+0)
;Config.c,33 :: 		&I2C2_Stop,&I2C2_Is_Idle); // Sets the I2C2 module active
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
;Config.c,34 :: 		I2C2_SetTimeoutCallback(1000, I2C2_TimeoutCallback);
LUI	R26, hi_addr(_I2C2_TimeoutCallback+0)
ORI	R26, R26, lo_addr(_I2C2_TimeoutCallback+0)
ORI	R25, R0, 1000
JAL	_I2C2_SetTimeoutCallback+0
NOP	
;Config.c,35 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_ConfigPic0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ConfigPic0
NOP	
;Config.c,36 :: 		InitUart1();
JAL	_InitUart1+0
NOP	
;Config.c,37 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_ConfigPic2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ConfigPic2
NOP	
;Config.c,38 :: 		InitUart2();
JAL	_InitUart2+0
NOP	
;Config.c,42 :: 		current_duty  = 10000;                        // initial value for current_duty
ORI	R2, R0, 10000
SH	R2, Offset(_current_duty+0)(GP)
;Config.c,43 :: 		current_duty1 = 15000;                        // initial value for current_duty1
ORI	R2, R0, 15000
SH	R2, Offset(_current_duty1+0)(GP)
;Config.c,44 :: 		pwm_period1 = PWM_Init(5000 , 1, 0, 3);//pwm frk,pwm pin 1-latd0,pre-scal,tmr2
ORI	R28, R0, 3
MOVZ	R27, R0, R0
ORI	R26, R0, 1
ORI	R25, R0, 5000
JAL	_PWM_Init+0
NOP	
SH	R2, Offset(_pwm_period1+0)(GP)
;Config.c,45 :: 		pwm_period2 = PWM_Init(5000 , 2, 0, 3); //pwm frk,pwm pin 1-latd1,pre-scal,tmr5
ORI	R28, R0, 3
MOVZ	R27, R0, R0
ORI	R26, R0, 2
ORI	R25, R0, 5000
JAL	_PWM_Init+0
NOP	
SH	R2, Offset(_pwm_period2+0)(GP)
;Config.c,46 :: 		PWM_Set_Duty(current_duty,  1);            // Set current duty for PWM1
ORI	R26, R0, 1
LHU	R25, Offset(_current_duty+0)(GP)
JAL	_PWM_Set_Duty+0
NOP	
;Config.c,47 :: 		PWM_Set_Duty(current_duty1, 2);            // Set current duty for PWM2
ORI	R26, R0, 2
LHU	R25, Offset(_current_duty1+0)(GP)
JAL	_PWM_Set_Duty+0
NOP	
;Config.c,49 :: 		MM_Init();
JAL	_MM_Init+0
NOP	
;Config.c,52 :: 		LATA10_bit = 0;
LUI	R2, BitMask(LATA10_bit+0)
ORI	R2, R2, BitMask(LATA10_bit+0)
_SX	
;Config.c,53 :: 		LATE3_bit = 0;
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
;Config.c,54 :: 		InitTimers();
JAL	_InitTimers+0
NOP	
;Config.c,55 :: 		InitISR();
JAL	_InitISR+0
NOP	
;Config.c,56 :: 		InitGSM3();
JAL	_InitGSM3+0
NOP	
;Config.c,57 :: 		PwrUpGSM3();
JAL	_PwrUpGSM3+0
NOP	
;Config.c,58 :: 		}
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
;Config.c,60 :: 		void InitUart1(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Config.c,61 :: 		UART1_Init(9600);              // Initialize UART module at 9600 bps
SW	R25, 4(SP)
ORI	R25, R0, 9600
JAL	_UART1_Init+0
NOP	
;Config.c,62 :: 		URXISEL0_bit  = 0;
LUI	R2, BitMask(URXISEL0_bit+0)
ORI	R2, R2, BitMask(URXISEL0_bit+0)
_SX	
;Config.c,63 :: 		URXISEL1_bit  = 0;
LUI	R2, BitMask(URXISEL1_bit+0)
ORI	R2, R2, BitMask(URXISEL1_bit+0)
_SX	
;Config.c,64 :: 		IPC6CLR = 0X1F;
ORI	R2, R0, 31
SW	R2, Offset(IPC6CLR+0)(GP)
;Config.c,65 :: 		IPC6SET = 0X1B;                //PRIORITY LEVEL 6  recieve
ORI	R2, R0, 27
SW	R2, Offset(IPC6SET+0)(GP)
;Config.c,66 :: 		U1RXIE_bit = 1;
LUI	R2, BitMask(U1RXIE_bit+0)
ORI	R2, R2, BitMask(U1RXIE_bit+0)
_SX	
;Config.c,67 :: 		U1RXIF_bit = 0;
LUI	R2, BitMask(U1RXIF_bit+0)
ORI	R2, R2, BitMask(U1RXIF_bit+0)
_SX	
;Config.c,68 :: 		}
L_end_InitUart1:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _InitUart1
_InitUart2:
;Config.c,70 :: 		void InitUart2(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Config.c,71 :: 		UART2_Init(9600);              // Initialize UART module at 9600 bps
SW	R25, 4(SP)
ORI	R25, R0, 9600
JAL	_UART2_Init+0
NOP	
;Config.c,72 :: 		IPC8CLR = 0X1F;
ORI	R2, R0, 31
SW	R2, Offset(IPC8CLR+0)(GP)
;Config.c,73 :: 		IPC8SET = 0X1A;                //PRIORITY LEVEL 6 recieve
ORI	R2, R0, 26
SW	R2, Offset(IPC8SET+0)(GP)
;Config.c,74 :: 		U2RXIE_bit = 1;
LUI	R2, BitMask(U2RXIE_bit+0)
ORI	R2, R2, BitMask(U2RXIE_bit+0)
_SX	
;Config.c,75 :: 		U2RXIF_bit = 0;
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
;Config.c,76 :: 		}
L_end_InitUart2:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _InitUart2
_Led_Pwm_Control:
;Config.c,80 :: 		void Led_Pwm_Control(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Config.c,81 :: 		PWM_Start(1);
SW	R25, 4(SP)
ORI	R25, R0, 1
JAL	_PWM_Start+0
NOP	
;Config.c,82 :: 		PWM_Start(2);
ORI	R25, R0, 2
JAL	_PWM_Start+0
NOP	
;Config.c,84 :: 		}
L_end_Led_Pwm_Control:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Led_Pwm_Control
