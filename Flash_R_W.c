#include "Flash_R_W.h"


//unsigned long  FLASH_Settings_VAddr = 0x9D078007;
//unsigned long  FLASH_Settings_PAddr = 0x1D078007;
unsigned long  FLASH_Settings_VAddr = 0xBD079ff6;
unsigned long  FLASH_Settings_PAddr = 0x1D079ff6;

void NVMRead(void* addr,struct Thresh *vals){
unsigned char *ptrC;
unsigned char Val[4];

  ptrC = FLASH_Settings_VAddr;
  /*vals->C_thresh*/Val[0] =  *ptrC;
  vals->C_thresh = (unsigned int)Val;
/*ptrC++;
  vals->R_thresh =  *(unsigned long*)ptrC;
  ptrC++;
  vals->G_thresh =  *(unsigned long*)ptrC;
  ptrC++;
  vals->B_thresh =  *(unsigned long*)ptrC;*/
}

unsigned int NVMWriteWord (void* address, unsigned long _data){
unsigned int res;

// Load address to program into NVMADDR register
NVMADDR = (unsigned long) address;

// Load data into NVMDATA register
NVMDATA = _data;

// Unlock and Write Word
res = NVMUnlock (0x4001);
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

unsigned int NVMErasePage(void* address){
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
// Flash operation to perfor
NVMCON = nvmop & 0x00004007;

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

unsigned long ReadFlash(){
unsigned char buff[512];
unsigned long i;
unsigned char *ptr;
unsigned long Val;
//ptrC = FLASH_Settings_VAddr;
////////////////////////////////////////////////////////
//reset the address and copy the flash to the strH array

    ptr = (char*)(FLASH_Settings_VAddr);
    for(i=0;i<sizeof(buff);i++){
       buff[i] = ptr[i];
    }
  //  memcpy(buff,ptr,6);
    Val = buff[1];
    Val =(Val<<8)| buff[0];
    Val =(Val<<8)| buff[3];
    Val =(Val<<8)| buff[2];
   return Val;//0xafffafff;
}