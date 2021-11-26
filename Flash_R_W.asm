_NVMRead:
ADDIU	SP, SP, -512
; ptr start address is: 16 (R4)
MOVZ	R4, R25, R0
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
L_NVMRead0:
; j start address is: 20 (R5)
; ptr start address is: 16 (R4)
; ptr end address is: 16 (R4)
ANDI	R2, R5, 65535
SLTIU	R2, R2, 512
BNE	R2, R0, L__NVMRead13
NOP	
J	L_NVMRead1
NOP	
L__NVMRead13:
; ptr end address is: 16 (R4)
; ptr start address is: 16 (R4)
ADDIU	R3, SP, 0
ANDI	R2, R5, 65535
ADDU	R3, R3, R2
ANDI	R2, R5, 65535
ADDU	R2, R4, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
ADDIU	R2, R5, 1
ANDI	R5, R2, 65535
; ptr end address is: 16 (R4)
; j end address is: 20 (R5)
J	L_NVMRead0
NOP	
L_NVMRead1:
ADDIU	R4, SP, 0
ADDIU	R2, R4, 3
LBU	R2, 0(R2)
; Val start address is: 8 (R2)
ANDI	R2, R2, 255
SLL	R3, R2, 8
; Val end address is: 8 (R2)
ADDIU	R2, R4, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
SLL	R3, R2, 8
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
SLL	R3, R2, 8
LBU	R2, 0(R4)
ANDI	R2, R2, 255
OR	R2, R3, R2
SH	R2, 0(R26)
ADDIU	R2, R4, 7
LBU	R2, 0(R2)
; Val start address is: 8 (R2)
ANDI	R2, R2, 255
SLL	R3, R2, 8
; Val end address is: 8 (R2)
ADDIU	R2, R4, 6
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
SLL	R3, R2, 8
ADDIU	R2, R4, 5
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
SLL	R3, R2, 8
ADDIU	R2, R4, 4
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R3, R3, R2
ADDIU	R2, R26, 2
SH	R3, 0(R2)
ADDIU	R2, R4, 11
LBU	R2, 0(R2)
; Val start address is: 8 (R2)
ANDI	R2, R2, 255
SLL	R3, R2, 8
; Val end address is: 8 (R2)
ADDIU	R2, R4, 10
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
SLL	R3, R2, 8
ADDIU	R2, R4, 9
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
SLL	R3, R2, 8
ADDIU	R2, R4, 8
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R3, R3, R2
ADDIU	R2, R26, 4
SH	R3, 0(R2)
ADDIU	R2, R4, 15
LBU	R2, 0(R2)
; Val start address is: 8 (R2)
ANDI	R2, R2, 255
SLL	R3, R2, 8
; Val end address is: 8 (R2)
ADDIU	R2, R4, 14
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
SLL	R3, R2, 8
ADDIU	R2, R4, 13
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
SLL	R3, R2, 8
ADDIU	R2, R4, 12
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R3, R3, R2
ADDIU	R2, R26, 6
SH	R3, 0(R2)
ADDIU	R2, R4, 19
LBU	R2, 0(R2)
; Val start address is: 8 (R2)
ANDI	R2, R2, 255
SLL	R3, R2, 8
; Val end address is: 8 (R2)
ADDIU	R2, R4, 18
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
SLL	R3, R2, 8
ADDIU	R2, R4, 17
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
SLL	R3, R2, 8
ADDIU	R2, R4, 16
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R3, R3, R2
ADDIU	R2, R26, 8
SH	R3, 0(R2)
L_end_NVMRead:
ADDIU	SP, SP, 512
JR	RA
NOP	
; end of _NVMRead
_NVMWriteWord:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
SW	R26, Offset(NVMDATA+0)(GP)
ORI	R25, R0, 16385
JAL	_NVMUnlock+0
NOP	
L_end_NVMWriteWord:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteWord
_NVMWriteRow:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
SW	R26, Offset(NVMSRCADDR+0)(GP)
ORI	R25, R0, 16387
JAL	_NVMUnlock+0
NOP	
L_end_NVMWriteRow:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMWriteRow
_NVMErasePage:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R25, Offset(NVMADDR+0)(GP)
ORI	R25, R0, 16388
JAL	_NVMUnlock+0
NOP	
L_end_NVMErasePage:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _NVMErasePage
_NVMUnlock:
DI	R30
; status start address is: 12 (R3)
ANDI	R3, R30, 65535
ANDI	R2, R25, 16391
ANDI	R2, R2, 65535
SW	R2, Offset(NVMCON+0)(GP)
LUI	R24, 20
ORI	R24, R24, 22612
L_NVMUnlock3:
ADDIU	R24, R24, -1
BNE	R24, R0, L_NVMUnlock3
NOP	
NOP	
NOP	
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(NVMKEY+0)(GP)
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(NVMKEY+0)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(NVMCONSET+0)(GP)
; status end address is: 12 (R3)
L_NVMUnlock5:
; status start address is: 12 (R3)
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 32768
BNE	R2, R0, L__NVMUnlock19
NOP	
J	L_NVMUnlock6
NOP	
L__NVMUnlock19:
J	L_NVMUnlock5
NOP	
L_NVMUnlock6:
ANDI	R2, R3, 1
; status end address is: 12 (R3)
BNE	R2, R0, L__NVMUnlock21
NOP	
J	L_NVMUnlock7
NOP	
L__NVMUnlock21:
EI	R30
J	L_NVMUnlock8
NOP	
L_NVMUnlock7:
DI	R30
L_NVMUnlock8:
ORI	R2, R0, 16384
SW	R2, Offset(NVMCONCLR+0)(GP)
LW	R2, Offset(NVMCON+0)(GP)
ANDI	R2, R2, 12288
L_end_NVMUnlock:
JR	RA
NOP	
; end of _NVMUnlock
_ReadFlashWord:
ADDIU	SP, SP, -512
; ptr start address is: 20 (R5)
LWR	R5, Offset(_FLASH_Settings_VAddr+0)(GP)
LWL	R5, Offset(_FLASH_Settings_VAddr+3)(GP)
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; ptr end address is: 20 (R5)
; i end address is: 16 (R4)
L_ReadFlashWord9:
; i start address is: 16 (R4)
; ptr start address is: 20 (R5)
SLTIU	R2, R4, 512
BNE	R2, R0, L__ReadFlashWord23
NOP	
J	L_ReadFlashWord10
NOP	
L__ReadFlashWord23:
ADDIU	R2, SP, 0
ADDU	R3, R2, R4
LBU	R2, 0(R5)
SB	R2, 0(R3)
ADDIU	R2, R5, 1
MOVZ	R5, R2, R0
ADDIU	R2, R4, 1
MOVZ	R4, R2, R0
; ptr end address is: 20 (R5)
; i end address is: 16 (R4)
J	L_ReadFlashWord9
NOP	
L_ReadFlashWord10:
ADDIU	R4, SP, 0
ADDIU	R2, R4, 3
LBU	R2, 0(R2)
; Val start address is: 8 (R2)
ANDI	R2, R2, 255
SLL	R3, R2, 8
; Val end address is: 8 (R2)
ADDIU	R2, R4, 2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
SLL	R3, R2, 8
ADDIU	R2, R4, 1
LBU	R2, 0(R2)
ANDI	R2, R2, 255
OR	R2, R3, R2
SLL	R3, R2, 8
LBU	R2, 0(R4)
ANDI	R2, R2, 255
OR	R2, R3, R2
L_end_ReadFlashWord:
ADDIU	SP, SP, 512
JR	RA
NOP	
; end of _ReadFlashWord
