﻿/**
* @file     ScaleKey.ASM
* @brief 
* @author
* @date     2018-12-22
* @version  V1.0.0
* @copyright
*/


Scale_KEY_ENTRY:

	BTFSS	ScaleFlag2,B_ScaleFlag2_Key_T
	GOTO	Scale_KEY_EXIT
	
	BCF		ScaleFlag2,B_ScaleFlag2_Key_T
	INCF	Key_Timer,F
	
	CALL	Fun_user_KeyGetGPIO
	CALL	Fun_key_Scan

;--- 短按检测
Scale_KEY_Short:
	BTFSC	Key_TRG,B_KEY_UNIT
	GOTO	Scale_KEY_Short_UNIT
	GOTO	Scale_KEY_Long
	
;- 单位键单击
Scale_KEY_Short_UNIT:
	BTFSC	ScaleFlow,B_ScaleFlow_CAL
	BSF		ScaleFlag3,B_ScaleFlag3_CalTrg
	
	BTFSC	ScaleFlow,B_ScaleFlow_ZERO
	INCF	KeyShortCnt,F
	
	BTFSS	ScaleFlow,B_ScaleFlow_WEIGHT
	GOTO	Scale_KEY_Short_UNIT_END
	BCF		STATUS,C
	RLF		ScaleUnit,F
	MOVLW	UNIT_MAX
	SUBWF	ScaleUnit,W
	BTFSS	STATUS,C
	GOTO	Scale_KEY_Short_UNIT_END
	CLRF	ScaleUnit
	BSF		ScaleUnit,B_ScaleUnit_KG
Scale_KEY_Short_UNIT_END:

	CLRF	Key_Timer
	CALL	Fun_User_RefreshOffTimer
Scale_KEY_Short_END:
	GOTO	Scale_KEY_EXIT


;--- 长按检测
Scale_KEY_Long:
	MOVLW	00H
	XORWF	Key_HOLD,W
	BTFSC	STATUS,Z
	GOTO	Scale_KEY_Release
	
	MOVLW	KEY_LONG_TIME
	SUBWF	Key_Timer,W
	BTFSS	STATUS,C
	GOTO	Scale_KEY_Long_END
	CLRF	Key_Timer
	
	BTFSC	Key_HOLD,B_KEY_UNIT
	GOTO	Scale_KEY_Long_Unit
	GOTO	Scale_KEY_Long_END
	
;-- 单位键长按
Scale_KEY_Long_Unit:
	MOVLW	4
	XORWF	KeyShortCnt,W
	BTFSS	STATUS,Z
	GOTO	Scale_KEY_CNT_ZERO
;--- FLOW TO CAL
	CLRF	ScaleFlow
	BSF		ScaleFlow,B_ScaleFlow_CAL
	CLRF	ScaleCalFlow
	BSF		ScaleCalFlow,B_ScaleCalFlow_ADC
	BCF		ScaleFlag3,B_ScaleFlag3_CalTrg
	CLRF	TimerUnst
	CLRF	KeyShortCnt
Scale_KEY_Long_Unit_END:

Scale_KEY_Long_END:
	GOTO	Scale_KEY_EXIT

;--- 按键释放
Scale_KEY_Release:
	MOVLW	10
	SUBWF	Key_Timer,W
	BTFSS	STATUS,Z
	GOTO	Scale_KEY_Release_END
	
Scale_KEY_CNT_ZERO:
	CLRF	KeyShortCnt
	
Scale_KEY_Release_END:

Scale_KEY_EXIT:
