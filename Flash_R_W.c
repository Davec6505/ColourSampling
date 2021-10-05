#include "Flash_R_W.h"

extern unsigned long  FLASH_Settings_Addr;// = 0x9D03EFFF;

void NVMRead(unsigned long* ptr,struct Thresh *vals){
unsigned long *ptrC;

  ptrC = &ptr ;
  vals->C_thresh =  (unsigned int)*ptr ;
  *ptr += 4;
  vals->R_thresh =  (unsigned int)*ptr;
  *ptr += 4;
  vals->G_thresh =  (unsigned int)*ptr;
  *ptr += 4;
  vals->B_thresh =  (unsigned int)*ptr;
}

unsigned int NVMWriteWord (void* address, unsigned int _data){
unsigned int res;
// Load data into NVMDATA register
NVMDATA = _data;// & 0xFFFF;
//NVMDATA = (NVMDATA << 8) | Lo(_data);
// Load address to program into NVMADDR register
NVMADDR = (unsigned long) address;
// Unlock and Write Word
res = NVMUnlock (0x4001);
// Return Result
return res;
}

unsigned int NVMWriteDblWord (void* address, unsigned long data_){
unsigned int res;
// Load data into NVMDATA register
NVMDATA = data_;
// Load address to program into NVMADDR register
NVMADDR = (unsigned long) address;
// Unlock and Write Word
res = NVMUnlock (0x4002);
// Return Result
return res;
}

unsigned int NVMWriteRow (void* address, void* _data){
unsigned int res;
// Set NVMADDR to Start Address of row to program
NVMADDR = (unsigned long) address;
// Set NVMSRCADDR to the SRAM data buffer Address
NVMSRCADDR = (unsigned int) _data;
// Unlock and Write Row
res = NVMUnlock(0x4003);
// Return Result
return res;
}

unsigned int NVMErasePage(void* address)
{
unsigned int res;
// Set NVMADDR to the Start Address of page to erase
NVMADDR = (unsigned long) address;
// Unlock and Erase Page
res = NVMUnlock(0x4004);
// Return Result
return res;
}

unsigned int NVMUnlock (unsigned int nvmop){
unsigned int status;
// Suspend or Disable all Interrupts
 status = (unsigned int)DI();
// Enable Flash Write/Erase Operations and Select
// Flash operation to perform
NVMCON = nvmop & 0x00004003;
// Write Keys
NVMKEY = 0xAA996655;
NVMKEY = 0x556699AA;
// Start the operation using the Set Register
NVMCONSET = 0x8000;
// Wait for operation to complete
while (NVMCON & 0x8000);
// Restore Interrupts
if (status & 0x0001)
  EI();
else
  DI();
// Disable NVM write enable
NVMCONCLR = 0x0004000;
// Return WRERR and LVDERR Error Status Bits

return (NVMCON & 0x3000);
}

