#ifndef FLASH_R_W_H
#define FLASH_R_W_H

///////////////////////////////////////////////////
//INCLUDES
#include "String.h"
#include "built_in.h"

//////////////////////////////////////////////////
//defines


//////////////////////////////////////////////////
//FUNCTION PROTOTYPE
unsigned int NVMWriteWord (void* address, unsigned int _data);
unsigned int NVMWriteDblWord (void* address, unsigned long data_);
unsigned int NVMWriteRow (void* address, void* _data);
unsigned int NVMErasePage(void* address);
unsigned int NVMUnlock(unsigned int nvmop);
void NVMRead(unsigned long* ptr,struct Thresh *vals);
#endif