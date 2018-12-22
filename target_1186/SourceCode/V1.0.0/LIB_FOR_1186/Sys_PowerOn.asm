/**
* @file  SysPowerOn.asm
* @brief 
* @author
* @date     2018-12-22
* @version  V1.0.0
* @copyright
*/

Sys_PowerOn_Entry:
    CLRF    INTE
    CLRF    INTE2

Sys_PowerOn_INIT_CLK:
    MOVLW	MCK_CFG_VALUE
    DW		0FFFFH
    NOP
    MOVWF	MCK
    
    MOVLW	MCK2_CFG_VALUE
    DW		0FFFFH
    NOP
    MOVWF	MCK2
    NOP
    
Sys_PowerOn_IO:

Sys_PowerOn_ClrBank0:
Sys_PowerOn_ClrBank0_Loop:

Sys_PowerOn_ClrBank1:
Sys_PowerOn_ClrBank1_Loop:

Sys_PowerOn_WDT:
	MOVLW	WDTCON_CFG_VALUE
	MOVWF	WDTCON
	CLRWDT

Sys_PowerOn_Exit:
     
     