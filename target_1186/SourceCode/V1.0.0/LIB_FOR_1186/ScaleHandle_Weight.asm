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
	INCF	TrackCnt,F
	MOVLW   TRACK_ZERO_CNT
	SUBWF	TrackCnt,W
	BTFSS	STATUS,C
	GOTO	Scale_Weight_Start_END
	CALL	Fun_SetZeroPoint
Scale_Weight_LessStart:
	GOTO	Scale_Weight_CltCnt
Scale_Weight_UpStart:
	BCF		ScaleFlag1,B_ScaleFlag1_Zero
Scale_Weight_CltCnt:
	CLRF	TrackCnt
Scale_Weight_Start_END:
;****
ENDIF

Scale_Weight_NEG:
	BTFSS	ScaleFlag1,B_ScaleFlag1_Neg
	GOTO	Scale_Weight_NEG_END
Scale_Weight_NEG_END:

Scale_Weight_MEM:
Scale_Weight_MEM_END:

Scale_Weight_MAX:
Scale_Weight_MAX_END:

Scale_Weight_LOCK:
Scale_Weight_LOCK_END:

Scale_Weight_UNST:
Scale_Weight_UNST_END:
	
Scale_Weight_EXIT:
