/**
* @file  ScaleGetZero.ASM
* @brief 
* @author
* @date     2019-01-07
* @version  V1.0.0
* @copyright
*/

ScaleGetZero_ENTRY:
	BTFSC	ScaleFlag2,B_ScaleFlag2_0s5_B
	INCF	TimerAutoOff,F
	MOVLW   02H
	SUBWF	TimerAutoOff,W
	BTFSS	STATUS,C
	GOTO	ScaleGetZero_EXIT
	
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcOk
	GOTO	ScaleGetZero_EXIT
	
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcStable
	GOTO	ScaleGetZero_EXIT
	
	CALL    Fun_SetZeroPoint

	CALL	Fun_User_RefreshOffTimer
	
;--- NEXT FLOW
	CLRF	ScaleFlow
	BSF		ScaleFlow,B_ScaleFlow_WEIGHT

ScaleGetZero_EXIT:
