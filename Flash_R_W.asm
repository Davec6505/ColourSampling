_NVMRead:
;Flash_R_W.c,9 :: 		void NVMRead(void* addr,struct Thresh *vals){
ADDIU	SP, SP, -512
;Flash_R_W.c,15 :: 		ptr = (unsigned char*)addr;
; ptr start address is: 16 (R4)
MOVZ	R4, R25, R0
;Flash_R_W.c,18 :: 		for(j = 0;j < 512;j++){
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
L_NVMRead0:
; j start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
ANDI	R2, R5, 65535
SLTIU	R2, R2, 512
BNE	R2, R0, L__NVMRead11
NOP	
J	L_NVMRead1
NOP	
L__NVMRead11:
; ptr end address is: 16 (R4)
;Flash_R_W.c,19 :: 		buff[j] = ptr[j];
; ptr start address is: 16 (R4)
ADDIU	R3, SP, 0
ANDI	R2, R5, 65535
ADDU	R3, R3, R2
ANDI	R2, R5, 65535
ADDU	R2, R4, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Flash_R_W.c,18 :: 		for(j = 0;j < 512;j++){
ADDIU	R2, R5, 1
ANDI	R5, R2, 65535
;Flash_R_W.c,20 :: 		}
; ptr end address is: 16 (R4)
; j end address is: 20 (R5)
J	L_NVMRead0
NOP	
L_NVMRead1:
;Flash_R_W.c,21 :: 		Val = buff[3];
ADDIU	R4, SP, 0
ADDIU	R2, R4, 3
LBU	R2, 0(R2)
; Val start address is: 8 (R2)
ANDI	R2, R2, 255
;Flash_R_W.c,22 :: 		Val =(Val<<8)| buff[2];
SLL	R3, R2, 8
; Val end address is: 8 (R2)
ADDIU	R2, R4, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,23 :: 		Val =(Val<<8)| buff[1];
SLL	R3, R2, 8
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,24 :: 		Val =(Val<<8)| buff[0];
SLL	R3, R2, 8
LBU	R2, 0(R4)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,25 :: 		vals->C_thresh = Val;
SH	R2, 0(R26)
;Flash_R_W.c,27 :: 		Val = buff[7];
ADDIU	R2, R4, 7
LBU	R2, 0(R2)
; Val start address is: 8 (R2)
ANDI	R2, R2, 255
;Flash_R_W.c,28 :: 		Val =(Val<<8)| buff[6];
SLL	R3, R2, 8
; Val end address is: 8 (R2)
ADDIU	R2, R4, 6
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,29 :: 		Val =(Val<<8)| buff[5];
SLL	R3, R2, 8
ADDIU	R2, R4, 5
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,30 :: 		Val =(Val<<8)| buff[4];
SLL	R3, R2, 8
ADDIU	R2, R4, 4
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R3, R3, R2
;Flash_R_W.c,31 :: 		vals->R_thresh = Val;
ADDIU	R2, R26, 2
SH	R3, 0(R2)
;Flash_R_W.c,33 :: 		Val = buff[11];
ADDIU	R2, R4, 11
LBU	R2, 0(R2)
; Val start address is: 8 (R2)
ANDI	R2, R2, 255
;Flash_R_W.c,34 :: 		Val =(Val<<8)| buff[10];
SLL	R3, R2, 8
; Val end address is: 8 (R2)
ADDIU	R2, R4, 10
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,35 :: 		Val =(Val<<8)| buff[9];
SLL	R3, R2, 8
ADDIU	R2, R4, 9
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,36 :: 		Val =(Val<<8)| buff[8];
SLL	R3, R2, 8
ADDIU	R2, R4, 8
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R3, R3, R2
;Flash_R_W.c,37 :: 		vals->G_thresh = Val;
ADDIU	R2, R26, 4
SH	R3, 0(R2)
;Flash_R_W.c,39 :: 		Val = buff[15];
ADDIU	R2, R4, 15
LBU	R2, 0(R2)
; Val start address is: 8 (R2)
ANDI	R2, R2, 255
;Flash_R_W.c,40 :: 		Val =(Val<<8)| buff[14];
SLL	R3, R2, 8
; Val end address is: 8 (R2)
ADDIU	R2, R4, 14
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,41 :: 		Val =(Val<<8)| buff[13];
SLL	R3, R2, 8
ADDIU	R2, R4, 13
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,42 :: 		Val =(Val<<8)| buff[12];
SLL	R3, R2, 8
ADDIU	R2, R4, 12
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R3, R3, R2
;Flash_R_W.c,43 :: 		vals->B_thresh = Val;
ADDIU	R2, R26, 6
SH	R3, 0(R2)
;Flash_R_W.c,45 :: 		Val = buff[19];
ADDIU	R2, R4, 19
LBU	R2, 0(R2)
; Val start address is: 8 (R2)
ANDI	R2, R2, 255
;Flash_R_W.c,46 :: 		Val =(Val<<8)| buff[18];
SLL	R3, R2, 8
; Val end address is: 8 (R2)
ADDIU	R2, R4, 18
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,47 :: 		Val =(Val<<8)| buff[17];
SLL	R3, R2, 8
ADDIU	R2, R4, 17
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,48 :: 		Val =(Val<<8)| buff[16];
SLL	R3, R2, 8
ADDIU	R2, R4, 16
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R3, R3, R2
;Flash_R_W.c,49 :: 		vals->time_to_log = Val;
ADDIU	R2, R26, 8
SH	R3, 0(R2)
;Flash_R_W.c,52 :: 		}
L_end_NVMRead:
ADDIU	SP, SP, 512
JR	RA
NOP	
; end of _NVMRead
_NVMWriteWord:
;Flash_R_W.c,54 :: 		unsigned int NVMWriteWord (void* address, unsigned long _data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,58 :: 		NVMADDR = (unsigned long) address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,61 :: 		NVMDATA = _data;
SW	R26, Offset(NVMDATA+0)(GP)
;Flash_R_W.c,64 :: 		res = NVMUnlock (0x4001);
ORI	R25, R0, 16385
JAL	_NVMUnlock+0
NOP	
;Flash_R_W.c,66 :: 		return res;
;Flash_R_W.c,67 :: 		}
;Flash_R_W.c,66 :: 		return res;
;Flash_R_W.c,67 :: 		}
L_end_NVMWriteWord:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteWord
_NVMWriteRow:
;Flash_R_W.c,70 :: 		unsigned int NVMWriteRow (void* address, void* _data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,73 :: 		NVMADDR = (unsigned long) address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,76 :: 		NVMSRCADDR = (unsigned long) _data;
SW	R26, Offset(NVMSRCADDR+0)(GP)
;Flash_R_W.c,79 :: 		res = NVMUnlock(0x4003);
ORI	R25, R0, 16387
JAL	_NVMUnlock+0
NOP	
;Flash_R_W.c,81 :: 		return res;
;Flash_R_W.c,82 :: 		}
;Flash_R_W.c,81 :: 		return res;
;Flash_R_W.c,82 :: 		}
L_end_NVMWriteRow:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteRow
_NVMErasePage:
;Flash_R_W.c,84 :: 		unsigned int NVMErasePage(void* address){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,87 :: 		NVMADDR = (unsigned long) address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,89 :: 		res = NVMUnlock(0x4004);
ORI	R25, R0, 16388
JAL	_NVMUnlock+0
NOP	
;Flash_R_W.c,91 :: 		return res;
;Flash_R_W.c,92 :: 		}
;Flash_R_W.c,91 :: 		return res;
;Flash_R_W.c,92 :: 		}
L_end_NVMErasePage:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMErasePage
_NVMUnlock:
;Flash_R_W.c,94 :: 		unsigned int NVMUnlock (unsigned int nvmop){
;Flash_R_W.c,97 :: 		status = (unsigned int)DI();
DI	R30
; status start address is: 12 (R3)
ANDI	R3, R30, 65535
;Flash_R_W.c,100 :: 		NVMCON = nvmop & 0x00004007;
ANDI	R2, R25, 16391
ANDI	R2, R2, 65535
SW	R2, Offset(NVMCON+0)(GP)
;Flash_R_W.c,103 :: 		NVMKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,104 :: 		NVMKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,107 :: 		NVMCONSET = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(NVMCONSET+0)(GP)
; status end address is: 12 (R3)
;Flash_R_W.c,110 :: 		while (NVMCON & 0x8000);
L_NVMUnlock3:
; status start address is: 12 (R3)
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 32768
BNE	R2, R0, L__NVMUnlock17
NOP	
J	L_NVMUnlock4
NOP	
L__NVMUnlock17:
J	L_NVMUnlock3
NOP	
L_NVMUnlock4:
;Flash_R_W.c,113 :: 		if (status & 0x0001)
ANDI	R2, R3, 1
; status end address is: 12 (R3)
BNE	R2, R0, L__NVMUnlock19
NOP	
J	L_NVMUnlock5
NOP	
L__NVMUnlock19:
;Flash_R_W.c,114 :: 		EI();
EI	R30
J	L_NVMUnlock6
NOP	
L_NVMUnlock5:
;Flash_R_W.c,116 :: 		DI();
DI	R30
L_NVMUnlock6:
;Flash_R_W.c,119 :: 		NVMCONCLR = 0x0004000;
ORI	R2, R0, 16384
SW	R2, Offset(NVMCONCLR+0)(GP)
;Flash_R_W.c,122 :: 		return (NVMCON & 0x3000);
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 12288
;Flash_R_W.c,123 :: 		}
L_end_NVMUnlock:
JR	RA
NOP	
; end of _NVMUnlock
_ReadFlashWord:
;Flash_R_W.c,125 :: 		unsigned long ReadFlashWord(){
ADDIU	SP, SP, -512
;Flash_R_W.c,134 :: 		ptr = (unsigned char*)(FLASH_Settings_VAddr);
; ptr start address is: 20 (R5)
LWR	R5, Offset(_FLASH_Settings_VAddr+0)(GP)
LWL	R5, Offset(_FLASH_Settings_VAddr+3)(GP)
;Flash_R_W.c,135 :: 		for(i=0;i<512;i++){
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; ptr end address is: 20 (R5)
; i end address is: 16 (R4)
L_ReadFlashWord7:
; i start address is: 16 (R4)
; ptr start address is: 20 (R5)
SLTIU	R2, R4, 512
BNE	R2, R0, L__ReadFlashWord21
NOP	
J	L_ReadFlashWord8
NOP	
L__ReadFlashWord21:
;Flash_R_W.c,136 :: 		buff[i] = *ptr;
ADDIU	R2, SP, 0
ADDU	R3, R2, R4
LBU	R2, 0(R5)
SB	R2, 0(R3)
;Flash_R_W.c,137 :: 		ptr++;
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Flash_R_W.c,135 :: 		for(i=0;i<512;i++){
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
;Flash_R_W.c,138 :: 		}
; ptr end address is: 20 (R5)
; i end address is: 16 (R4)
J	L_ReadFlashWord7
NOP	
L_ReadFlashWord8:
;Flash_R_W.c,140 :: 		Val = buff[3];
ADDIU	R4, SP, 0
ADDIU	R2, R4, 3
LBU	R2, 0(R2)
; Val start address is: 8 (R2)
ANDI	R2, R2, 255
;Flash_R_W.c,141 :: 		Val =(Val<<8)| buff[2];
SLL	R3, R2, 8
; Val end address is: 8 (R2)
ADDIU	R2, R4, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,142 :: 		Val =(Val<<8)| buff[1];
SLL	R3, R2, 8
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,143 :: 		Val =(Val<<8)| buff[0];
SLL	R3, R2, 8
LBU	R2, 0(R4)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,145 :: 		return Val;//0xafffafff;
;Flash_R_W.c,146 :: 		}
L_end_ReadFlashWord:
ADDIU	SP, SP, 512
JR	RA
NOP	
; end of _ReadFlashWord
