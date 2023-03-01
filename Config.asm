_ConfigPic:
;Config.c,15 :: 		void ConfigPic(){
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;Config.c,17 :: 		CHECON = 30;
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ORI	R2, R0, 30
SW	R2, Offset(CHECON+0)(GP)
;Config.c,18 :: 		AD1PCFG = 0xFFFFFFFF;
LUI	R2, 65535
ORI	R2, R2, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
;Config.c,19 :: 		JTAGEN_bit = 0;
_LX	
INS	R2, R0, BitPos(JTAGEN_bit+0), 1
_SX	
;Config.c,21 :: 		TRISA = 0X0200;
ORI	R2, R0, 512
SW	R2, Offset(TRISA+0)(GP)
;Config.c,22 :: 		TRISB = 0X0010;
ORI	R2, R0, 16
SW	R2, Offset(TRISB+0)(GP)
;Config.c,23 :: 		TRISC = 0X0000;
SW	R0, Offset(TRISC+0)(GP)
;Config.c,24 :: 		TRISD = 0X0000;
SW	R0, Offset(TRISD+0)(GP)
;Config.c,25 :: 		TRISE = 0X0210;
ORI	R2, R0, 528
SW	R2, Offset(TRISE+0)(GP)
;Config.c,26 :: 		TRISF = 0X0000;
SW	R0, Offset(TRISF+0)(GP)
;Config.c,27 :: 		TRISG = 0X0200;
ORI	R2, R0, 512
SW	R2, Offset(TRISG+0)(GP)
;Config.c,29 :: 		LATD = 0;
SW	R0, Offset(LATD+0)(GP)
;Config.c,31 :: 		FSCM_SetUP();
JAL	_FSCM_SetUP+0
NOP	
;Config.c,32 :: 		USBIE_bit = 0;
LUI	R2, BitMask(USBIE_bit+0)
ORI	R2, R2, BitMask(USBIE_bit+0)
_SX	
;Config.c,33 :: 		IPC11bits.USBIP = 7;
ORI	R2, R0, 7168
SH	R2, Offset(IPC11bits+8)(GP)
;Config.c,34 :: 		HID_Enable(&readbuff,&writebuff);
LUI	R26, hi_addr(_writebuff+0)
ORI	R26, R26, lo_addr(_writebuff+0)
LUI	R25, hi_addr(_readbuff+0)
ORI	R25, R25, lo_addr(_readbuff+0)
JAL	_HID_Enable+0
NOP	
;Config.c,36 :: 		I2C2_Init_Advanced(80000,100000);//INIT I2C AT 100KHZ
LUI	R26, 1
ORI	R26, R26, 34464
LUI	R25, 1
ORI	R25, R25, 14464
JAL	_I2C2_Init_Advanced+0
NOP	
;Config.c,37 :: 		I2C_Set_Active(&I2C2_Start, &I2C2_Restart, &I2C2_Read, &I2C2_Write,
LUI	R28, hi_addr(_I2C2_Write+0)
ORI	R28, R28, lo_addr(_I2C2_Write+0)
LUI	R27, hi_addr(_I2C2_Read+0)
ORI	R27, R27, lo_addr(_I2C2_Read+0)
LUI	R26, hi_addr(_I2C2_Restart+0)
ORI	R26, R26, lo_addr(_I2C2_Restart+0)
LUI	R25, hi_addr(_I2C2_Start+0)
ORI	R25, R25, lo_addr(_I2C2_Start+0)
;Config.c,38 :: 		&I2C2_Stop,&I2C2_Is_Idle); // Sets the I2C2 module active
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
;Config.c,39 :: 		I2C2_SetTimeoutCallback(1000, I2C2_TimeoutCallback);
LUI	R26, hi_addr(_I2C2_TimeoutCallback+0)
ORI	R26, R26, lo_addr(_I2C2_TimeoutCallback+0)
ORI	R25, R0, 1000
JAL	_I2C2_SetTimeoutCallback+0
NOP	
;Config.c,40 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_ConfigPic0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ConfigPic0
NOP	
;Config.c,41 :: 		InitUart1();
JAL	_InitUart1+0
NOP	
;Config.c,42 :: 		Delay_ms(100);
LUI	R24, 40
ORI	R24, R24, 45226
L_ConfigPic2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_ConfigPic2
NOP	
;Config.c,43 :: 		InitUart2();
JAL	_InitUart2+0
NOP	
;Config.c,46 :: 		current_duty2  = 2000;                     // initial value for current_duty
ORI	R2, R0, 2000
SH	R2, Offset(_current_duty2+0)(GP)
;Config.c,47 :: 		current_duty3  = 500;                     // initial value for current_duty1
ORI	R2, R0, 500
SH	R2, Offset(_current_duty3+0)(GP)
;Config.c,48 :: 		pwm_period2 = PWM_Init(5000 , 2, 0, 2);    //pwm frk,pwm pin 1-latd0,pre-scal,tmr2
ORI	R28, R0, 2
MOVZ	R27, R0, R0
ORI	R26, R0, 2
ORI	R25, R0, 5000
JAL	_PWM_Init+0
NOP	
SH	R2, Offset(_pwm_period2+0)(GP)
;Config.c,49 :: 		pwm_period3 = PWM_Init(5000 , 3, 4, 3);    //pwm frk,pwm pin 1-latd1,pre-scal,tmr5
ORI	R28, R0, 3
ORI	R27, R0, 4
ORI	R26, R0, 3
ORI	R25, R0, 5000
JAL	_PWM_Init+0
NOP	
SH	R2, Offset(_pwm_period3+0)(GP)
;Config.c,50 :: 		PWM_Set_Duty(current_duty2, 2);           // Set current duty for PWM1
ORI	R26, R0, 2
LHU	R25, Offset(_current_duty2+0)(GP)
JAL	_PWM_Set_Duty+0
NOP	
;Config.c,51 :: 		PWM_Set_Duty(current_duty3, 3);            // Set current duty for PWM2
ORI	R26, R0, 3
LHU	R25, Offset(_current_duty3+0)(GP)
JAL	_PWM_Set_Duty+0
NOP	
;Config.c,52 :: 		PWM_Stop(2);
ORI	R25, R0, 2
JAL	_PWM_Stop+0
NOP	
;Config.c,53 :: 		PWM_Stop(3);
ORI	R25, R0, 3
JAL	_PWM_Stop+0
NOP	
;Config.c,54 :: 		MM_Init();
JAL	_MM_Init+0
NOP	
;Config.c,56 :: 		LATA10_bit = 0;
LUI	R2, BitMask(LATA10_bit+0)
ORI	R2, R2, BitMask(LATA10_bit+0)
_SX	
;Config.c,57 :: 		LATE3_bit = 0;
LUI	R2, BitMask(LATE3_bit+0)
ORI	R2, R2, BitMask(LATE3_bit+0)
_SX	
;Config.c,58 :: 		InitTimers();
JAL	_InitTimers+0
NOP	
;Config.c,59 :: 		InitISR();
JAL	_InitISR+0
NOP	
;Config.c,60 :: 		InitGSM3();
JAL	_InitGSM3+0
NOP	
;Config.c,61 :: 		PwrDownGSM3();
JAL	_PwrDownGSM3+0
NOP	
;Config.c,62 :: 		PwrUpGSM3();
JAL	_PwrUpGSM3+0
NOP	
;Config.c,63 :: 		setup_LM35(5);
ORI	R25, R0, 5
JAL	_setup_LM35+0
NOP	
;Config.c,64 :: 		Init_PID(65.25, 24.00, 1.25, 0, 3780,0); //kp,ki,kd,min,max,offset
MOVZ	R28, R0, R0
LUI	R27, 16288
ORI	R27, R27, 0
LUI	R26, 16832
ORI	R26, R26, 0
LUI	R25, 17026
ORI	R25, R25, 32768
ADDIU	SP, SP, -4
SH	R0, 2(SP)
ORI	R2, R0, 3780
SH	R2, 0(SP)
JAL	_Init_PID+0
NOP	
ADDIU	SP, SP, 4
;Config.c,65 :: 		PID_Control("PID");
ORI	R30, R0, 80
SB	R30, 20(SP)
ORI	R30, R0, 73
SB	R30, 21(SP)
ORI	R30, R0, 68
SB	R30, 22(SP)
MOVZ	R30, R0, R0
SB	R30, 23(SP)
ADDIU	R2, SP, 20
MOVZ	R25, R2, R0
JAL	_PID_Control+0
NOP	
;Config.c,66 :: 		}
L_end_ConfigPic:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _ConfigPic
_FSCM_SetUP:
;Config.c,68 :: 		void FSCM_SetUP(){
;Config.c,69 :: 		if (OSCCON & 0x0008){ // check for a FSCM during start-up
LW	R2, Offset(OSCCON+0)(GP)
ANDI	R2, R2, 8
BNE	R2, R0, L__FSCM_SetUP37
NOP	
J	L_FSCM_SetUP4
NOP	
L__FSCM_SetUP37:
;Config.c,71 :: 		}
J	L_FSCM_SetUP5
NOP	
L_FSCM_SetUP4:
;Config.c,73 :: 		IPC8CLR = 0x1F << 8; // clear the FSCM priority bits
ORI	R2, R0, 7936
SW	R2, Offset(IPC8CLR+0)(GP)
;Config.c,74 :: 		IPC8SET = 1 << 10; // set the FSCM interrupt priority
ORI	R2, R0, 1024
SW	R2, Offset(IPC8SET+0)(GP)
;Config.c,75 :: 		IPC8SET = 1 << 8; // set the FSCM interrupt subpriority
ORI	R2, R0, 256
SW	R2, Offset(IPC8SET+0)(GP)
;Config.c,76 :: 		IFS1CLR = 1 << 14; // clear the FSCM interrupt bit
ORI	R2, R0, 16384
SW	R2, Offset(IFS1CLR+0)(GP)
;Config.c,77 :: 		IEC1SET = 1 << 14; // enable the FSCM interrupt
ORI	R2, R0, 16384
SW	R2, Offset(IEC1SET+0)(GP)
;Config.c,78 :: 		}
L_FSCM_SetUP5:
;Config.c,80 :: 		}
L_end_FSCM_SetUP:
JR	RA
NOP	
; end of _FSCM_SetUP
_InitUart1:
;Config.c,82 :: 		void InitUart1(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Config.c,83 :: 		UART1_Init(9600);              // Initialize UART module at 9600 bps
SW	R25, 4(SP)
ORI	R25, R0, 9600
JAL	_UART1_Init+0
NOP	
;Config.c,84 :: 		URXISEL0_bit  = 0;
LUI	R2, BitMask(URXISEL0_bit+0)
ORI	R2, R2, BitMask(URXISEL0_bit+0)
_SX	
;Config.c,85 :: 		URXISEL1_bit  = 0;
LUI	R2, BitMask(URXISEL1_bit+0)
ORI	R2, R2, BitMask(URXISEL1_bit+0)
_SX	
;Config.c,86 :: 		IPC6CLR = 0X1F;
ORI	R2, R0, 31
SW	R2, Offset(IPC6CLR+0)(GP)
;Config.c,87 :: 		IPC6SET = 0X1B;                //PRIORITY LEVEL 6  recieve
ORI	R2, R0, 27
SW	R2, Offset(IPC6SET+0)(GP)
;Config.c,88 :: 		U1RXIE_bit = 1;
LUI	R2, BitMask(U1RXIE_bit+0)
ORI	R2, R2, BitMask(U1RXIE_bit+0)
_SX	
;Config.c,89 :: 		U1RXIF_bit = 0;
LUI	R2, BitMask(U1RXIF_bit+0)
ORI	R2, R2, BitMask(U1RXIF_bit+0)
_SX	
;Config.c,90 :: 		}
L_end_InitUart1:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _InitUart1
_InitUart2:
;Config.c,92 :: 		void InitUart2(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Config.c,93 :: 		UART2_Init(9600);              // Initialize UART module at 9600 bps
SW	R25, 4(SP)
ORI	R25, R0, 9600
JAL	_UART2_Init+0
NOP	
;Config.c,94 :: 		IPC8CLR = 0X1F;
ORI	R2, R0, 31
SW	R2, Offset(IPC8CLR+0)(GP)
;Config.c,95 :: 		IPC8SET = 0X1A;                //PRIORITY LEVEL 6 recieve
ORI	R2, R0, 26
SW	R2, Offset(IPC8SET+0)(GP)
;Config.c,96 :: 		U2RXIE_bit = 1;
LUI	R2, BitMask(U2RXIE_bit+0)
ORI	R2, R2, BitMask(U2RXIE_bit+0)
_SX	
;Config.c,97 :: 		U2RXIF_bit = 0;
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
;Config.c,98 :: 		}
L_end_InitUart2:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _InitUart2
_Initialize_Led_On:
;Config.c,100 :: 		void Initialize_Led_On(){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Config.c,101 :: 		PWM_Start(2);
SW	R25, 4(SP)
ORI	R25, R0, 2
JAL	_PWM_Start+0
NOP	
;Config.c,102 :: 		Delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L_Initialize_Led_On6:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Initialize_Led_On6
NOP	
NOP	
NOP	
;Config.c,103 :: 		SetLedPWM();
JAL	_SetLedPWM+0
NOP	
;Config.c,104 :: 		PWM_Stop(2);
ORI	R25, R0, 2
JAL	_PWM_Stop+0
NOP	
;Config.c,105 :: 		}
L_end_Initialize_Led_On:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _Initialize_Led_On
_SetLedPWM:
;Config.c,107 :: 		void SetLedPWM(){
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Config.c,110 :: 		for(i=0;i<4;i++)
SW	R25, 4(SP)
SW	R26, 8(SP)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_SetLedPWM8:
; i start address is: 16 (R4)
SEH	R2, R4
SLTI	R2, R2, 4
BNE	R2, R0, L__SetLedPWM42
NOP	
J	L_SetLedPWM9
NOP	
L__SetLedPWM42:
;Config.c,111 :: 		RawData[i] = 0;
SEH	R2, R4
SLL	R3, R2, 1
LUI	R2, hi_addr(_RawData+0)
ORI	R2, R2, lo_addr(_RawData+0)
ADDU	R2, R2, R3
SH	R0, 0(R2)
;Config.c,110 :: 		for(i=0;i<4;i++)
ADDIU	R2, R4, 1
; i end address is: 16 (R4)
; i start address is: 8 (R2)
;Config.c,111 :: 		RawData[i] = 0;
SEH	R4, R2
; i end address is: 8 (R2)
J	L_SetLedPWM8
NOP	
L_SetLedPWM9:
;Config.c,113 :: 		error_counter = 0;
SH	R0, 12(SP)
;Config.c,114 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Config.c,115 :: 		err = TCS3472_C2RGB_Error(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_C2RGB_Error+0
NOP	
; err start address is: 12 (R3)
SEH	R3, R2
; err end address is: 12 (R3)
SEH	R2, R3
;Config.c,140 :: 		}while(err < -10 || err > 10);
J	L__SetLedPWM29
NOP	
L__SetLedPWM32:
SEH	R2, R3
L__SetLedPWM29:
; err start address is: 8 (R2)
SEH	R3, R2
; err end address is: 8 (R2)
J	L__SetLedPWM28
NOP	
L__SetLedPWM33:
L__SetLedPWM28:
;Config.c,118 :: 		current_duty2 += (err > 0)? 100:-100;
; err start address is: 12 (R3)
SEH	R2, R3
; err end address is: 12 (R3)
SLTI	R2, R2, 1
BEQ	R2, R0, L__SetLedPWM43
NOP	
J	L_SetLedPWM14
NOP	
L__SetLedPWM43:
; ?FLOC___SetLedPWM?T23 start address is: 8 (R2)
ORI	R2, R0, 100
; ?FLOC___SetLedPWM?T23 end address is: 8 (R2)
J	L_SetLedPWM15
NOP	
L_SetLedPWM14:
; ?FLOC___SetLedPWM?T23 start address is: 8 (R2)
ORI	R2, R0, 156
; ?FLOC___SetLedPWM?T23 end address is: 8 (R2)
L_SetLedPWM15:
; ?FLOC___SetLedPWM?T23 start address is: 8 (R2)
SEB	R3, R2
; ?FLOC___SetLedPWM?T23 end address is: 8 (R2)
LHU	R2, Offset(_current_duty2+0)(GP)
ADDU	R2, R2, R3
SH	R2, Offset(_current_duty2+0)(GP)
;Config.c,120 :: 		if((current_duty2 > 2000)||(current_duty2 < 500))
ANDI	R2, R2, 65535
SLTIU	R2, R2, 2001
BNE	R2, R0, L__SetLedPWM44
NOP	
J	L__SetLedPWM31
NOP	
L__SetLedPWM44:
LHU	R2, Offset(_current_duty2+0)(GP)
SLTIU	R2, R2, 500
BEQ	R2, R0, L__SetLedPWM45
NOP	
J	L__SetLedPWM30
NOP	
L__SetLedPWM45:
J	L_SetLedPWM18
NOP	
L__SetLedPWM31:
L__SetLedPWM30:
;Config.c,121 :: 		current_duty2 = 2000;
ORI	R2, R0, 2000
SH	R2, Offset(_current_duty2+0)(GP)
L_SetLedPWM18:
;Config.c,123 :: 		PWM_Set_Duty(current_duty2, 2);
ORI	R26, R0, 2
LHU	R25, Offset(_current_duty2+0)(GP)
JAL	_PWM_Set_Duty+0
NOP	
;Config.c,124 :: 		Delay_ms(1000);
LUI	R24, 406
ORI	R24, R24, 59050
L_SetLedPWM19:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetLedPWM19
NOP	
;Config.c,125 :: 		TCS3472_getRawData(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_getRawData+0
NOP	
;Config.c,126 :: 		err = TCS3472_C2RGB_Error(RawData);
LUI	R25, hi_addr(_RawData+0)
ORI	R25, R25, lo_addr(_RawData+0)
JAL	_TCS3472_C2RGB_Error+0
NOP	
; err start address is: 12 (R3)
SEH	R3, R2
;Config.c,135 :: 		Delay_ms(10);
LUI	R24, 4
ORI	R24, R24, 4522
L_SetLedPWM21:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetLedPWM21
NOP	
;Config.c,137 :: 		error_counter++;
LH	R2, 12(SP)
ADDIU	R2, R2, 1
SH	R2, 12(SP)
;Config.c,138 :: 		if(error_counter > 100)
SEH	R2, R2
SLTI	R2, R2, 101
BEQ	R2, R0, L__SetLedPWM46
NOP	
J	L_SetLedPWM23
NOP	
L__SetLedPWM46:
; err end address is: 12 (R3)
;Config.c,139 :: 		break;
J	L_SetLedPWM12
NOP	
L_SetLedPWM23:
;Config.c,140 :: 		}while(err < -10 || err > 10);
; err start address is: 12 (R3)
SEH	R2, R3
SLTI	R2, R2, -10
BEQ	R2, R0, L__SetLedPWM47
NOP	
J	L__SetLedPWM32
NOP	
L__SetLedPWM47:
SEH	R2, R3
SLTI	R2, R2, 11
BNE	R2, R0, L__SetLedPWM48
NOP	
J	L__SetLedPWM33
NOP	
L__SetLedPWM48:
; err end address is: 12 (R3)
L__SetLedPWM26:
L_SetLedPWM12:
;Config.c,142 :: 		}
L_end_SetLedPWM:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _SetLedPWM
_ApplicationDebug:
;Config.c,146 :: 		void ApplicationDebug(){
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Config.c,148 :: 		GetValuesFromFlash();
JAL	_GetValuesFromFlash+0
NOP	
;Config.c,157 :: 		SignalStrength();
JAL	_SignalStrength+0
NOP	
;Config.c,159 :: 		}
L_end_ApplicationDebug:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _ApplicationDebug
