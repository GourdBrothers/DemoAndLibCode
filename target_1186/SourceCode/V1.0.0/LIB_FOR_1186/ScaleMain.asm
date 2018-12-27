/**
* @file     ScaleMain.ASM
* @brief 
* @author
* @date     2018-12-22
* @version  V1.0.0
* @copyright
*/

ScaleMain_Entry:
	BTFSC	ScaleFlow,B_ScaleFlow_Init
	GOTO	ScaleMain_Flow_Chk
	HALT
	NOP

ScaleMain_Timer:
ScaleMain_Timer_END:

ScaleMain_BatChk:
ScaleMain_BatChk_END:

ScaleMain_Key:
	INCLUDE	"ScaleKey.ASM"
ScaleMain_Key_END:

ScaleMain_AutoOff:
ScaleMain_AutoOff_END:

ScaleMain_ADC:
	BCF		ScaleFlag1,B_ScaleFlag1_AdcOk
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcInt
	GOTO	ScaleMain_ADC_END
	CALL    Fun_ProcAdc
	BCF		ScaleFlag1,B_ScaleFlag1_AdcInt
	BSF		ScaleFlag1,B_ScaleFlag1_AdcOk
ScaleMain_ADC_END:


ScaleMain_Flow_Chk:
	BTFSC	ScaleFlow,B_ScaleFlow_Init
	GOTO	ScaleMain_Init
	BTFSC	ScaleFlow,B_ScaleFlow_ZERO
	GOTO	ScaleMain_Zero
	BTFSC	ScaleFlow,B_ScaleFlow_WEIGHT
	GOTO	ScaleMain_Weight
	BTFSC	ScaleFlow,B_ScaleFlow_CAL
	GOTO	ScaleMain_Cal
	
ScaleMain_Init:
	INCLUDE "ScaleInit.ASM"
;--- NEXT FLOW
	CLRF	ScaleFlow
	BSF		ScaleFlow,B_ScaleFlow_ZERO
ScaleMain_Init_END:
	GOTO	ScaleMain_Flow_END

ScaleMain_Zero:
	INCLUDE	"ScaleGetZero.ASM"
ScaleMain_Zero_END:
	GOTO	ScaleMain_Flow_END

ScaleMain_Weight:
	INCLUDE "ScaleHandle_Weight.ASM"
ScaleMain_Weight_END:
	GOTO	ScaleMain_Flow_END

ScaleMain_Cal:
	INCLUDE "ScaleHandle_Cal.ASM"
ScaleMain_Cal_END:
	GOTO	ScaleMain_Flow_END

ScaleMain_Flow_END:


ScaleMain_Display:
	INCLUDE	"ScaleDisp.ASM"
ScaleMain_Display_END:

ScaleMain_powerSave:
ScaleMain_powerSave_END:

