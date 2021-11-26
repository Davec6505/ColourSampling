_USB_Init_Desc:
LUI	R2, hi_addr(_configDescriptor1+0)
ORI	R2, R2, lo_addr(_configDescriptor1+0)
SW	R2, Offset(_USB_config_dsc_ptr+0)(GP)
LUI	R2, hi_addr(_strd1+0)
ORI	R2, R2, lo_addr(_strd1+0)
SW	R2, Offset(_USB_string_dsc_ptr+0)(GP)
LUI	R2, hi_addr(_strd2+0)
ORI	R2, R2, lo_addr(_strd2+0)
SW	R2, Offset(_USB_string_dsc_ptr+4)(GP)
LUI	R2, hi_addr(_strd3+0)
ORI	R2, R2, lo_addr(_strd3+0)
SW	R2, Offset(_USB_string_dsc_ptr+8)(GP)
L_end_USB_Init_Desc:
JR	RA
NOP	
; end of _USB_Init_Desc
