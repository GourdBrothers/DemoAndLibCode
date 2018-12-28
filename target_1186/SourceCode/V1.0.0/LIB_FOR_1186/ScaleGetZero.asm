/**
* @file  ScaleGetZero.ASM
* @brief 
* @author
* @date     2018-12-24
* @version  V1.0.0
* @copyright
*/

ScaleGetZero_ENTRY:
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcOk
	GOTO	ScaleGetZero_EXIT
	
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcStable
	GOTO	ScaleGetZero_EXIT
	
	CALL    Fun_SetZeroPoint
	CALL	Fun_GetAutoOnADC
	CALL	Fun_User_RefreshOffTimer
	
	CALL	Fun_3W_CAL_Init
	
;--- NEXT FLOW
	CLRF	ScaleFlow
	BSF		ScaleFlow,B_ScaleFlow_WEIGHT

ScaleGetZero_EXIT:
