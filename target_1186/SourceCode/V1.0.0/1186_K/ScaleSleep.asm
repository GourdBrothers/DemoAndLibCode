﻿/**
* @file  ScaleSleep.asm
* @brief 
* @author
* @date     2019-01-07
* @version  V1.0.0
* @copyright
*/

ScaleSleep_Entry:

	BTFSC	ScaleFlag2,B_ScaleFlag2_FastSleep
	GOTO	ScaleSleep_cfg
	BTFSS	ScaleFlag2,B_ScaleFlag2_WaitSleep 
	GOTO	ScaleSleep_Exit

ScaleSleep_wait:
	CLRF	Timer05sCnt
	BCF		ScaleFlag2,B_ScaleFlag2_0s5_A
	CLRF	REG0
ScaleSleep_wait_loop:
	CLRWDT
	HALT
	NOP
	BTFSC	ScaleFlag2,B_ScaleFlag2_0s5_A
	INCF	REG0,F
	MOVLW   04H
	SUBWF	REG0,W
	BTFSS	STATUS,C
	GOTO	ScaleSleep_wait_loop
	CLRF	ScaleFlag2
ScaleSleep_wait_end:

ScaleSleep_cfg:
	CALL	Fun_LCD_ResetAllBuf
	CALL	Fun_LCD_Load
	CALL	Fun_LCD_Close
	
	CALL	Fun_LoCheck_Close
	
	CALL	Fun_TIMER_close
	
ScaleSleep_cfgADC:
	CALL	Fun_ADC_Close
	BCF		SysFlag1,B_SysFlag1_WakeUp
	
ScaleSleep_ReleaseKey:	
	CLRWDT
	CALL	Fun_Delay_20MS
	BTFSS	KEY_ON_PORT,KEY_ON_PIN
	GOTO	ScaleSleep_ReleaseKey
	CALL	Fun_Delay_20MS
	BTFSS	KEY_ON_PORT,KEY_ON_PIN
	GOTO	ScaleSleep_ReleaseKey
	CLRF	WDTCON
	
ScaleSleep_cfgInt:
	BSF		PTINT,PTW0_1
	BSF		INTE,E0IE
	BSF		INTE,GIE

ScaleSleep_done:
	SLEEP
	NOP
	
ScaleWakeUp_INT:
	BTFSS	SysFlag1,B_SysFlag1_WakeUp
	GOTO	ScaleSleep_cfgInt

ScaleWakeUp_Done:
	CLRF	INTE
	CLRF	ScaleFlow
	BSF		ScaleFlow,B_ScaleFlow_Init

ScaleSleep_Exit:
