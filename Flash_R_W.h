#ifndef FLASH_R_W_H
#define FLASH_R_W_H

///////////////////////////////////////////////////
//INCLUDES
#include "String.h"
#include "built_in.h"
#define  Ul   unsigned long
//////////////////////////////////////////////////
//defines

/////////////////////////////////////////////////
//structs, enums and unions


/////////////////////////////////////////////////
//Variables
//extern unsigned long  FLASH_Settings_VAddr;// = 0x9D078007;
//extern unsigned long  FLASH_Settings_PAddr;// = 0x1D078007;
extern unsigned long  FLASH_Settings_VAddr;// = 0x9D079ff6;
extern unsigned long  FLASH_Settings_PAddr;// = 0x1D079ff6;
//////////////////////////////////////////////////
//FUNCTION PROTOTYPE
unsigned int NVMWriteWord (void* address, unsigned long _data);
unsigned int NVMWriteRow (void* address, void* _data);
unsigned int NVMErasePage(void* address);
unsigned int NVMUnlock(unsigned int nvmop);
void NVMRead(void* addr,struct Thresh *vals);
unsigned long ReadFlashWord();
#endif