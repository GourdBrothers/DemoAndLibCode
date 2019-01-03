/**
* @file     lib_key.asm
* @brief 
* @author
* @date     2018-12-27
* @version  V1.0.0
* @copyright
*/

;-------------------------------------
;--- RAM Definition

lib_key_RAM		.section	BANK0

	Key_IO_PRESS	DS  1
	Key_TRG			DS	1
	Key_HOLD		DS	1
	Key_Timer		DS	1

.ends

;-------------------------------------
;--- ROM 
lib_key_ROM		.section	ROM

Fun_key_Scan:
	MOVLW    KEY_USED_BITS
	ANDWF    Key_IO_PRESS,W
	MOVWF    REG1
	
	MOVLW    KEY_USED_BITS
    XORWF    REG1,F
    
    MOVFW    Key_HOLD
    XORWF    REG1,W
    ANDWF    REG1,W
    MOVWF    Key_TRG
    
    MOVFW	 REG1
    MOVWF    Key_HOLD
    
RETURN


.ends
