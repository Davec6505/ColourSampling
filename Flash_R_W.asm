_NVMRead:
;Flash_R_W.c,9 :: 		void NVMRead(void* addr,struct Thresh *vals){
ADDIU	SP, SP, -4
;Flash_R_W.c,14 :: 		/*vals->C_thresh*/Val[0] =  *ptrC;
ADDIU	R3, SP, 0
LW	R2, Offset(_FLASH_Settings_VAddr+0)(GP)
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Flash_R_W.c,15 :: 		vals->C_thresh = (unsigned int)Val;
SH	R3, 0(R26)
;Flash_R_W.c,22 :: 		}
L_end_NVMRead:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _NVMRead
_NVMWriteWord:
;Flash_R_W.c,24 :: 		unsigned int NVMWriteWord (void* address, unsigned long _data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,28 :: 		NVMADDR = (unsigned long) address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,31 :: 		NVMDATA = _data;
SW	R26, Offset(NVMDATA+0)(GP)
;Flash_R_W.c,34 :: 		res = NVMUnlock (0x4001);
ORI	R25, R0, 16385
JAL	_NVMUnlock+0
NOP	
;Flash_R_W.c,36 :: 		return res;
;Flash_R_W.c,37 :: 		}
;Flash_R_W.c,36 :: 		return res;
;Flash_R_W.c,37 :: 		}
L_end_NVMWriteWord:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteWord
_NVMWriteRow:
;Flash_R_W.c,40 :: 		unsigned int NVMWriteRow (void* address, void* _data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,43 :: 		NVMADDR = (unsigned long) address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,46 :: 		NVMSRCADDR = (unsigned int) _data;
ANDI	R2, R26, 65535
SW	R2, Offset(NVMSRCADDR+0)(GP)
;Flash_R_W.c,49 :: 		res = NVMUnlock(0x4003);
ORI	R25, R0, 16387
JAL	_NVMUnlock+0
NOP	
;Flash_R_W.c,51 :: 		return res;
;Flash_R_W.c,52 :: 		}
;Flash_R_W.c,51 :: 		return res;
;Flash_R_W.c,52 :: 		}
L_end_NVMWriteRow:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteRow
_NVMErasePage:
;Flash_R_W.c,54 :: 		unsigned int NVMErasePage(void* address){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,57 :: 		NVMADDR = (unsigned long) address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,59 :: 		res = NVMUnlock(0x4004);
ORI	R25, R0, 16388
JAL	_NVMUnlock+0
NOP	
;Flash_R_W.c,61 :: 		return res;
;Flash_R_W.c,62 :: 		}
;Flash_R_W.c,61 :: 		return res;
;Flash_R_W.c,62 :: 		}
L_end_NVMErasePage:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMErasePage
_NVMUnlock:
;Flash_R_W.c,64 :: 		unsigned int NVMUnlock (unsigned int nvmop){
;Flash_R_W.c,67 :: 		status = (unsigned int)DI();
DI	R30
; status start address is: 12 (R3)
ANDI	R3, R30, 65535
;Flash_R_W.c,70 :: 		NVMCON = nvmop & 0x00004007;
ANDI	R2, R25, 16391
ANDI	R2, R2, 65535
SW	R2, Offset(NVMCON+0)(GP)
;Flash_R_W.c,73 :: 		NVMKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,74 :: 		NVMKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,77 :: 		NVMCONSET = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(NVMCONSET+0)(GP)
; status end address is: 12 (R3)
;Flash_R_W.c,80 :: 		while (NVMCON & 0x8000);
L_NVMUnlock0:
; status start address is: 12 (R3)
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 32768
BNE	R2, R0, L__NVMUnlock13
NOP	
J	L_NVMUnlock1
NOP	
L__NVMUnlock13:
J	L_NVMUnlock0
NOP	
L_NVMUnlock1:
;Flash_R_W.c,83 :: 		if (status & 0x0001)
ANDI	R2, R3, 1
; status end address is: 12 (R3)
BNE	R2, R0, L__NVMUnlock15
NOP	
J	L_NVMUnlock2
NOP	
L__NVMUnlock15:
;Flash_R_W.c,84 :: 		EI();
EI	R30
J	L_NVMUnlock3
NOP	
L_NVMUnlock2:
;Flash_R_W.c,86 :: 		DI();
DI	R30
L_NVMUnlock3:
;Flash_R_W.c,89 :: 		NVMCONCLR = 0x0004000;
ORI	R2, R0, 16384
SW	R2, Offset(NVMCONCLR+0)(GP)
;Flash_R_W.c,92 :: 		return (NVMCON & 0x3000);
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 12288
;Flash_R_W.c,93 :: 		}
L_end_NVMUnlock:
JR	RA
NOP	
; end of _NVMUnlock
_ReadFlash:
;Flash_R_W.c,95 :: 		unsigned long ReadFlash(){
ADDIU	SP, SP, -512
;Flash_R_W.c,104 :: 		ptr = (char*)(FLASH_Settings_VAddr);
; ptr start address is: 16 (R4)
LWR	R4, Offset(_FLASH_Settings_VAddr+0)(GP)
LWL	R4, Offset(_FLASH_Settings_VAddr+3)(GP)
;Flash_R_W.c,105 :: 		for(i=0;i<sizeof(buff);i++){
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; i end address is: 20 (R5)
L_ReadFlash4:
; i start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
SLTIU	R2, R5, 512
BNE	R2, R0, L__ReadFlash17
NOP	
J	L_ReadFlash5
NOP	
L__ReadFlash17:
; ptr end address is: 16 (R4)
;Flash_R_W.c,106 :: 		buff[i] = ptr[i];
; ptr start address is: 16 (R4)
ADDIU	R2, SP, 0
ADDU	R3, R2, R5
ADDU	R2, R4, R5
LBU	R2, 0(R2)
SB	R2, 0(R3)
;Flash_R_W.c,105 :: 		for(i=0;i<sizeof(buff);i++){
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
;Flash_R_W.c,107 :: 		}
; ptr end address is: 16 (R4)
; i end address is: 20 (R5)
J	L_ReadFlash4
NOP	
L_ReadFlash5:
;Flash_R_W.c,109 :: 		Val = buff[1];
ADDIU	R4, SP, 0
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
; Val start address is: 8 (R2)
ANDI	R2, R2, 255
;Flash_R_W.c,110 :: 		Val =(Val<<8)| buff[0];
SLL	R3, R2, 8
; Val end address is: 8 (R2)
LBU	R2, 0(R4)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,111 :: 		Val =(Val<<8)| buff[3];
SLL	R3, R2, 8
ADDIU	R2, R4, 3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,112 :: 		Val =(Val<<8)| buff[2];
SLL	R3, R2, 8
ADDIU	R2, R4, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
;Flash_R_W.c,113 :: 		return Val;//0xafffafff;
;Flash_R_W.c,114 :: 		}
L_end_ReadFlash:
ADDIU	SP, SP, 512
JR	RA
NOP	
; end of _ReadFlash
