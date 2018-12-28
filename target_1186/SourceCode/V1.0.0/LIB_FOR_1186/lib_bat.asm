/**
* @file     lib_bat.ASM
* @brief 
* @author
* @date     2018-12-24
* @version  V1.0.0
* @copyright
*/

lib_bat_RAM	.section	bank0

.ends


lib_bat_ROM	.section	ROM


Fun_LoCheck_Init:
	MOVLW	NETE_CFG_VALUE
	MOVWF	NETE
RETURN

Fun_LoCheck_Close:
	BCF		NETE,ENLB
RETURN

Fun_LoCheck:
RETURN

.ends
