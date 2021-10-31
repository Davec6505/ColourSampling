#include "Flash_R_W.h"


unsigned long  FLASH_Settings_VAddr = 0x9D07A000;
unsigned long  FLASH_Settings_PAddr = 0x1D07A000;
//unsigned long  FLASH_Settings_VAddr = 0xBD079ff6;
//unsigned long  FLASH_Settings_PAddr = 0x1D079ff6;

void NVMRead(void* addr,struct Thresh *vals){
unsigned char buff[512];
unsigned int i,j;
unsigned char *ptr;
unsigned long Val;

  ptr = (unsigned char*)addr;
  i = 0;
   //for(i = 0;i < 144;i++){
       for(j = 0;j < 512;j++){
          buff[j] = ptr[j];
       }
       Val = buff[3];
       Val =(Val<<8)| buff[2];
       Val =(Val<<8)| buff[1];
       Val =(Val<<8)| buff[0];
      vals->C_thresh = Val;

       Val = buff[7];
       Val =(Val<<8)| buff[6];
       Val =(Val<<8)| buff[5];
       Val =(Val<<8)| buff[4];
      vals->R_thresh = Val;

       Val = buff[11];
       Val =(Val<<8)| buff[10];
       Val =(Val<<8)| buff[9];
       Val =(Val<<8)| buff[8];
      vals->G_thresh = Val;

       Val = buff[15];
       Val =(Val<<8)| buff[14];
       Val =(Val<<8)| buff[13];
       Val =(Val<<8)| buff[12];
       vals->B_thresh = Val;
          
   // i += 4;
  //}
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

unsigned long ReadFlashWord(){
unsigned char buff[512];
unsigned long i;
unsigned char *ptr;
unsigned long Val;
//ptrC = FLASH_Settings_VAddr;
////////////////////////////////////////////////////////
//reset the address and copy the flash to the strH array

    ptr = (unsigned char*)(FLASH_Settings_VAddr);
   for(i=0;i<512;i++){
       buff[i] = *ptr;
       ptr++;
    }

    Val = buff[3];
    Val =(Val<<8)| buff[2];
    Val =(Val<<8)| buff[1];
    Val =(Val<<8)| buff[0];

   return Val;//0xafffafff;
}