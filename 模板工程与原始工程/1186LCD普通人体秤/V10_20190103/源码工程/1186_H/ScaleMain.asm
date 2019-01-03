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
	BCF		ScaleFlag2,B_ScaleFlag2_0s5_B
	BTFSS	ScaleFlag2,B_ScaleFlag2_0s5_A
	GOTO	ScaleMain_Timer_END
	BCF		ScaleFlag2,B_ScaleFlag2_0s5_A
	BSF		ScaleFlag2,B_ScaleFlag2_0s5_B
ScaleMain_Timer_END:

ScaleMain_BatChk:
	BTFSS	ScaleFlow,B_ScaleFlow_WEIGHT
	GOTO	ScaleMain_BatChk_END
	CALL	Fun_LoCheck
	BTFSC	ScaleFlag3,B_ScaleFlag3_Lo
	BSF		ScaleFlag2,B_ScaleFlag2_WaitSleep
ScaleMain_BatChk_END:

ScaleMain_Key:
	INCLUDE	"ScaleKey.ASM"
ScaleMain_Key_END:

ScaleMain_AutoOff:
	BTFSS	ScaleFlow,B_ScaleFlow_WEIGHT
	GOTO	ScaleMain_AutoOff_END
	BTFSS	ScaleFlag2,B_ScaleFlag2_0s5_B
	GOTO	ScaleMain_AutoOff_END
	INCF	TimerAutoOff,F
	MOVLW	20
	SUBWF	TimerAutoOff,W
	BTFSS	STATUS,Z
	GOTO	ScaleMain_AutoOff_END
	BSF		ScaleFlag2,B_ScaleFlag2_FastSleep
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
	CALL	Fun_user_KeyGetGPIO
	CALL	Fun_key_Scan
;--- NEXT FLOW
	CLRF	ScaleFlow
	BSF		ScaleFlow,B_ScaleFlow_ZERO
	BTFSS	SysFlag1,B_SysFlag1_WakeUp
	GOTO	ScaleMain_Init_END
	CLRF	ScaleFlow
	BSF		ScaleFlow,B_ScaleFlow_WEIGHT
	BSF		SysFlag1,B_SysFlag1_OnWeight
ScaleMain_Init_END:
	GOTO	ScaleMain_Flow_END

ScaleMain_Zero:
	INCLUDE	"ScaleGetZero.ASM"
ScaleMain_Zero_END:
	GOTO	ScaleMain_Flow_END

ScaleMain_Weight:
	INCLUDE "ScaleWeight.ASM"
ScaleMain_Weight_END:
	GOTO	ScaleMain_Flow_END

ScaleMain_Cal:
	INCLUDE "ScaleCal.ASM"
ScaleMain_Cal_END:
;	GOTO	ScaleMain_Flow_END

ScaleMain_Flow_END:


ScaleMain_Display:
	INCLUDE	"ScaleDisp.ASM"
ScaleMain_Display_END:

ScaleMain_powerSave:
	INCLUDE	"ScaleSleep.ASM"
ScaleMain_powerSave_END:
