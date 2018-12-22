/**
* @file     lib_utiliy.ASM
* @brief 
* @author
* @date     2018-12-22
* @version  V1.0.0
* @copyright
*/

lib_Delay_RAM .section BANK0

REG1		DS	1
REG2		DS	1

.ends


lib_Delay_rom .section rom

Fun_Delay_100MS:
    MOVLW		100
	GOTO		Fun_Delay_MS_comm
Fun_Delay_40MS:
    MOVLW		40
	GOTO		Fun_Delay_MS_comm
Fun_Delay_20MS:
    MOVLW		20
	GOTO		Fun_Delay_MS_comm
Fun_Delay_10MS:
    MOVLW		10
    GOTO		Fun_Delay_MS_comm
Fun_Delay_MS:
    MOVLW		1
Fun_Delay_MS_comm:
	MOVWF		REG1
Fun_Delay_2:
    MOVLW		200
    MOVWF		REG2
Fun_Delay_2_LOOP:
    CLRWDT
    NOP                       ; 1
    NOP                       ; 1
	NOP                       ; 1
    DECFSZ		REG2,F          ; 1
	GOTO		Fun_Delay_2_LOOP  ; 1
Fun_Delay_1:
    DECFSZ		REG1,F
	GOTO		Fun_Delay_2
RETURN

Fun_power_Init:
	MOVLW		NETF_CFG_VALUE
	DW			0FFFFH
	NOP
	MOVWF		NETF
	
	MOVLW		NETE_CFG_VALUE
	DW			0FFFFH
	NOP
	MOVWF		NETE
RETURN

Fun_power_Close:
   	CLRF		NETF
RETURN

.ends
