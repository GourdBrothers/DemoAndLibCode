
#INCLUDE "SysConfig.inc"

Scale_Weight_ENTRY:
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcOk
	GOTO	Scale_Weight_EXIT
	
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
Scale_Weight_LessStart:
	GOTO	Scale_Weight_CltCnt
Scale_Weight_UpStart:
	BCF		ScaleFlag1,B_ScaleFlag1_Zero
	BSF		ScaleFlag3,B_ScaleFlag3_OnWeight
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

Scale_Weight_UNST:
Scale_Weight_UNST_END:

Scale_Weight_CAL:
	BTFSC	ScaleFlag1,B_ScaleFlag1_Zero
	GOTO	Scale_Weight_CAL_END
	BTFSC	ScaleFlag1,B_ScaleFlag1_Neg
	GOTO	Scale_Weight_CAL_END
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcStable
	GOTO	Scale_Weight_CAL_END
	CALL	Fun_3W_CAL
Scale_Weight_CAL_END:

Scale_Weight_EXIT:
