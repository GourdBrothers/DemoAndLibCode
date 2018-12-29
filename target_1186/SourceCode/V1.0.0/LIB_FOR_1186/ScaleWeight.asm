
#INCLUDE "SysConfig.inc"

Scale_Weight_ENTRY:
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcOk
	GOTO	Scale_Weight_UNST
	
Scale_Weight_GetCount:
	CALL	Fun_GetCount

;****
IF WEIGHT_C_EN
Scale_Weight_C:

Scale_Weight_C_END:
;****
ELSE
Scale_Weight_Start:
	MOVLW	LOW		START_COUNT
	SUBWF	CountL,W
	MOVLW	HIGH	START_COUNT
	SUBWFC	CountH,W
	BTFSC	STATUS,C
	GOTO	Scale_Weight_UpStart
	CALL	Fun_SetCountZero
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcStable
	GOTO	Scale_Weight_CltCnt
	INCF	ZeroTrackCnt,F
	MOVLW   TRACK_ZERO_CNT
	SUBWF	ZeroTrackCnt,W
	BTFSS	STATUS,C
	GOTO	Scale_Weight_Start_END
	CALL	Fun_SetZeroPoint
	CALL	Fun_GetAutoOnADC
Scale_Weight_LessStart:
	GOTO	Scale_Weight_CltCnt
Scale_Weight_UpStart:
	BCF		ScaleFlag1,B_ScaleFlag1_Zero
	BSF		SysFlag1,B_SysFlag1_OnWeight
	BTFSC	ScaleFlag1,B_ScaleFlag1_Neg
	GOTO	Scale_Weight_CltCnt
	BTFSS	ScaleFlag3,B_ScaleFlag3_UnlockEn
	GOTO	Scale_Weight_CltCnt
	BCF		ScaleFlag3,B_ScaleFlag3_UnlockEn
	BCF		ScaleFlag1,B_ScaleFlag1_Lock
Scale_Weight_CltCnt:
	CLRF	ZeroTrackCnt
Scale_Weight_Start_END:
;****
ENDIF

Scale_Weight_NEG:
	BTFSS	ScaleFlag1,B_ScaleFlag1_Neg
	GOTO	Scale_Weight_NEG_END
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcStable
	GOTO	Scale_Weight_NEG_END
	CALL	Fun_SetZeroPoint
	CALL	Fun_GetAutoOnADC
Scale_Weight_NEG_END:

Scale_Weight_MEM:
	BTFSC	ScaleFlag1,B_ScaleFlag1_Neg
	GOTO	Scale_Weight_MEM_END
	BTFSC	ScaleFlag1,B_ScaleFlag1_Zero
	GOTO	Scale_Weight_MEM_END
	BTFSC	ScaleFlag1,B_ScaleFlag1_Lock
	GOTO	Scale_Weight_MEM_END
	MOVFW	LockCountH
	MOVWF	TempRam3
	MOVFW	LockCountL
	MOVWF	TempRam4
	MOVFW	CountH
	MOVWF	TempRam5
	MOVFW	CountL
	MOVWF	TempRam6
	CALL	Fun_Math_Sub2_2
	CALL	Fun_Math_Sub2_2_Neg
	MOVLW	MEM_COUNT
	SUBWF	TempRam4,W
	MOVLW	00H
	SUBWFC	TempRam3,W
	BTFSC	STATUS,C
	GOTO	Scale_Weight_MEM_END 
	MOVFW	LockCountH
	MOVWF	CountH
	MOVFW	LockCountL
	MOVWF	CountL
Scale_Weight_MEM_END:

Scale_Weight_MAX:
	BCF		ScaleFlag1,B_ScaleFlag1_oL
	BTFSC	ScaleFlag1,B_ScaleFlag1_Zero
	GOTO	Scale_Weight_MAX_END
	MOVLW	LOW		MAX_COUNT
	SUBWF	CountL,W
	MOVLW	HIGH	MAX_COUNT
	SUBWFC	CountH,W
	BTFSS	STATUS,C
	GOTO	Scale_Weight_MAX_END
	BSF		ScaleFlag1,B_ScaleFlag1_oL
	BCF		ScaleFlag1,B_ScaleFlag1_Lock
	CALL	Fun_3W_CAL_ResetLock
Scale_Weight_MAX_END:

Scale_Weight_LOCK:
	BTFSC	ScaleFlag1,B_ScaleFlag1_Lock
	GOTO	Scale_Weight_LOCK_END
	BTFSC	ScaleFlag1,B_ScaleFlag1_Zero
	GOTO	Scale_Weight_LOCK_END
	BTFSC	ScaleFlag1,B_ScaleFlag1_Neg
	GOTO	Scale_Weight_LOCK_END
	BTFSC	ScaleFlag1,B_ScaleFlag1_oL
	GOTO	Scale_Weight_LOCK_END
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcStable
	GOTO	Scale_Weight_LOCK_END
	MOVFW	CountH
	MOVWF	LockCountH
	MOVFW	CountL
	MOVWF	LockCountL
	BSF		ScaleFlag1,B_ScaleFlag1_Lock
	BSF		ScaleFlag2,B_ScaleFlag2_LockFlashEN
	BCF		ScaleFlag2,B_ScaleFlag2_LockFlash
	CLRF	LockFlashTime
	CLRF	LockFlashCnt
Scale_Weight_LOCK_END:

Scale_Weight_Unlock:
	BTFSS	ScaleFlag1,B_ScaleFlag1_Lock
	GOTO	Scale_Weight_Unlock_END
	MOVFW	LockCountH
	MOVWF	REG0
	MOVFW	LockCountL
	MOVWF	REG1
	MOVLW	LOW		UNLOCK_COUNT
	ADDWF	REG1,F
	MOVLW	HIGH	UNLOCK_COUNT
	ADDWFC	REG0,F
	MOVFW	REG1
	SUBWF	CountL,W
	MOVFW	REG0
	SUBWFC	CountH,W
	BTFSS	STATUS,C
	GOTO	Scale_Weight_Unlock_END
	BCF		ScaleFlag1,B_ScaleFlag1_Lock
	CALL	Fun_3W_CAL_ResetLock
Scale_Weight_Unlock_END:

Scale_Weight_CAL:
	BTFSC	ScaleFlag1,B_ScaleFlag1_Zero
	GOTO	Scale_Weight_CAL_END
	BTFSC	ScaleFlag1,B_ScaleFlag1_Neg
	GOTO	Scale_Weight_CAL_END
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcStable
	GOTO	Scale_Weight_CAL_END
	CALL	Fun_3W_CAL
	BTFSS	ScaleFlag3,B_ScaleFlag3_3wCalOk	; 重量校正完成，用户需调用OTP读写函数,将校正系数存入至OTP中
	GOTO	Scale_Weight_CAL_END
	BCF		ScaleFlag3,B_ScaleFlag3_3wCalOk
;	CALL    Fun_OTP_WRITE_CAL
;	CALL	Fun_OTP_READ_CAL
;	CLRF	TimerUnst
	CLRF	ScaleFlow		; 流程切入至标定成功
	BSF		ScaleFlow,B_ScaleFlow_CAL
;	CLRF	ScaleCalFlow
;	BSF		ScaleCalFlow,B_ScaleCalFlow_PASS
	GOTO	ScaleCal_OTP_write
Scale_Weight_CAL_END:

Scale_Weight_UNST:
	BTFSC	ScaleFlag1,B_ScaleFlag1_Lock
	GOTO	Scale_Weight_UNST_CLR
	BTFSC	ScaleFlag1,B_ScaleFlag1_Zero
	GOTO	Scale_Weight_UNST_CLR
	BTFSC	ScaleFlag1,B_ScaleFlag1_Neg
	GOTO	Scale_Weight_UNST_CLR
	BTFSC	ScaleFlag1,B_ScaleFlag1_oL
	GOTO	Scale_Weight_UNST_CLR
	BTFSC	ScaleFlag1,B_ScaleFlag1_AdcStable
	GOTO	Scale_Weight_UNST_CLR
	CLRF	TimerAutoOff
	BTFSC	ScaleFlag2,B_ScaleFlag2_0s5_B
	INCF	TimerUnst,F
	MOVLW	60
	SUBWF	TimerUnst,W
	BTFSS	STATUS,C
	GOTO	Scale_Weight_UNST_END
	BSF		ScaleFlag2,B_ScaleFlag2_FastSleep
Scale_Weight_UNST_CLR:
	CLRF	TimerUnst
Scale_Weight_UNST_END:

Scale_Weight_EXIT:
