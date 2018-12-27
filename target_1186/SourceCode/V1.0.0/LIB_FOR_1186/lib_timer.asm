/**
* @file     lib_timer.ASM
* @brief 
* @author
* @date     2018-12-27
* @version  V1.0.0
* @copyright
*/

INCLUDE  "SysConfig.inc"

lib_timer .section rom

.IF  TMCON_USE

Fun_TIMER_init:
	MOVLW	TMCON_CFG_VALUE
	MOVWF	TMCON
	BSF		INTE,TMIE
RETURN

Fun_TIMER_close:
	BCF		INTE,TMIE
	BCF		TMCON,TMEN
RETURN

.ENDIF

.ends
