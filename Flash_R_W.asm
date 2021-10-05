_NVMRead:
;Flash_R_W.c,5 :: 		void NVMRead(unsigned long* ptr,struct Thresh *vals){
;Flash_R_W.c,9 :: 		vals->C_thresh =  (unsigned int)*ptr ;
LW	R2, 0(R25)
SH	R2, 0(R26)
;Flash_R_W.c,10 :: 		*ptr += 4;
LW	R2, 0(R25)
ADDIU	R2, R2, 4
SW	R2, 0(R25)
;Flash_R_W.c,11 :: 		vals->R_thresh =  (unsigned int)*ptr;
ADDIU	R3, R26, 2
LW	R2, 0(R25)
SH	R2, 0(R3)
;Flash_R_W.c,12 :: 		*ptr += 4;
LW	R2, 0(R25)
ADDIU	R2, R2, 4
SW	R2, 0(R25)
;Flash_R_W.c,13 :: 		vals->G_thresh =  (unsigned int)*ptr;
ADDIU	R3, R26, 4
LW	R2, 0(R25)
SH	R2, 0(R3)
;Flash_R_W.c,14 :: 		*ptr += 4;
LW	R2, 0(R25)
ADDIU	R2, R2, 4
SW	R2, 0(R25)
;Flash_R_W.c,15 :: 		vals->B_thresh =  (unsigned int)*ptr;
ADDIU	R3, R26, 6
LW	R2, 0(R25)
SH	R2, 0(R3)
;Flash_R_W.c,16 :: 		}
L_end_NVMRead:
JR	RA
NOP	
; end of _NVMRead
_NVMWriteWord:
;Flash_R_W.c,18 :: 		unsigned int NVMWriteWord (void* address, unsigned int _data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,21 :: 		NVMDATA = _data;// & 0xFFFF;
SW	R25, 4(SP)
ANDI	R2, R26, 65535
SW	R2, Offset(NVMDATA+0)(GP)
;Flash_R_W.c,24 :: 		NVMADDR = (unsigned long) address;
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,26 :: 		res = NVMUnlock (0x4001);
ORI	R25, R0, 16385
JAL	_NVMUnlock+0
NOP	
;Flash_R_W.c,28 :: 		return res;
;Flash_R_W.c,29 :: 		}
;Flash_R_W.c,28 :: 		return res;
;Flash_R_W.c,29 :: 		}
L_end_NVMWriteWord:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteWord
_NVMWriteDblWord:
;Flash_R_W.c,31 :: 		unsigned int NVMWriteDblWord (void* address, unsigned long data_){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,34 :: 		NVMDATA = data_;
SW	R25, 4(SP)
SW	R26, Offset(NVMDATA+0)(GP)
;Flash_R_W.c,36 :: 		NVMADDR = (unsigned long) address;
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,38 :: 		res = NVMUnlock (0x4002);
ORI	R25, R0, 16386
JAL	_NVMUnlock+0
NOP	
;Flash_R_W.c,40 :: 		return res;
;Flash_R_W.c,41 :: 		}
;Flash_R_W.c,40 :: 		return res;
;Flash_R_W.c,41 :: 		}
L_end_NVMWriteDblWord:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteDblWord
_NVMWriteRow:
;Flash_R_W.c,43 :: 		unsigned int NVMWriteRow (void* address, void* _data){
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,46 :: 		NVMADDR = (unsigned long) address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,48 :: 		NVMSRCADDR = (unsigned int) _data;
ANDI	R2, R26, 65535
SW	R2, Offset(NVMSRCADDR+0)(GP)
;Flash_R_W.c,50 :: 		res = NVMUnlock(0x4003);
ORI	R25, R0, 16387
JAL	_NVMUnlock+0
NOP	
;Flash_R_W.c,52 :: 		return res;
;Flash_R_W.c,53 :: 		}
;Flash_R_W.c,52 :: 		return res;
;Flash_R_W.c,53 :: 		}
L_end_NVMWriteRow:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteRow
_NVMErasePage:
;Flash_R_W.c,55 :: 		unsigned int NVMErasePage(void* address)
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Flash_R_W.c,59 :: 		NVMADDR = (unsigned long) address;
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
;Flash_R_W.c,61 :: 		res = NVMUnlock(0x4004);
ORI	R25, R0, 16388
JAL	_NVMUnlock+0
NOP	
;Flash_R_W.c,63 :: 		return res;
;Flash_R_W.c,64 :: 		}
;Flash_R_W.c,63 :: 		return res;
;Flash_R_W.c,64 :: 		}
L_end_NVMErasePage:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMErasePage
_NVMUnlock:
;Flash_R_W.c,66 :: 		unsigned int NVMUnlock (unsigned int nvmop){
;Flash_R_W.c,69 :: 		status = (unsigned int)DI();
DI	R30
; status start address is: 12 (R3)
ANDI	R3, R30, 65535
;Flash_R_W.c,72 :: 		NVMCON = nvmop & 0x00004003;
ANDI	R2, R25, 16387
ANDI	R2, R2, 65535
SW	R2, Offset(NVMCON+0)(GP)
;Flash_R_W.c,74 :: 		NVMKEY = 0xAA996655;
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,75 :: 		NVMKEY = 0x556699AA;
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(NVMKEY+0)(GP)
;Flash_R_W.c,77 :: 		NVMCONSET = 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(NVMCONSET+0)(GP)
; status end address is: 12 (R3)
;Flash_R_W.c,79 :: 		while (NVMCON & 0x8000);
L_NVMUnlock0:
; status start address is: 12 (R3)
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 32768
BNE	R2, R0, L__NVMUnlock11
NOP	
J	L_NVMUnlock1
NOP	
L__NVMUnlock11:
J	L_NVMUnlock0
NOP	
L_NVMUnlock1:
;Flash_R_W.c,81 :: 		if (status & 0x0001)
ANDI	R2, R3, 1
; status end address is: 12 (R3)
BNE	R2, R0, L__NVMUnlock13
NOP	
J	L_NVMUnlock2
NOP	
L__NVMUnlock13:
;Flash_R_W.c,82 :: 		EI();
EI	R30
J	L_NVMUnlock3
NOP	
L_NVMUnlock2:
;Flash_R_W.c,84 :: 		DI();
DI	R30
L_NVMUnlock3:
;Flash_R_W.c,86 :: 		NVMCONCLR = 0x0004000;
ORI	R2, R0, 16384
SW	R2, Offset(NVMCONCLR+0)(GP)
;Flash_R_W.c,89 :: 		return (NVMCON & 0x3000);
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 12288
;Flash_R_W.c,90 :: 		}
L_end_NVMUnlock:
JR	RA
NOP	
; end of _NVMUnlock
