/**
* @file     ScaleWeight.ASM
* @brief 
* @author
* @date     2019-01-07
* @version  V1.0.0
* @copyright
*/

Scale_Weight_ENTRY:
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcOk
	GOTO	Scale_Weight_EXIT
	
Scale_W_GetCount:
	CALL	Fun_GetCount

Scale_W_StartCount:
	MOVLW	START_COUNT
	SUBWF	CountL,W
	MOVLW	00H
	SUBWFC	CountM,W
	MOVLW	00H
	SUBWFC	CountH,W
	BTFSC	STATUS,C
	GOTO	Scale_W_UpStartCount
Scale_W_DowNStartCount:
	BTFSS   ScaleFlag1,B_ScaleFlag1_AdcStable
	GOTO	Scale_W_ClrTrackCnt
	INCF	ZeroTrackCnt,F
	MOVLW	TRACK_ZERO_CNT
	SUBWF	ZeroTrackCnt,W
	BTFSS	STATUS,C
	GOTO	Scale_W_StartCount_END
	CALL	Fun_SetCountZero
	GOTO	Scale_W_ClrTrackCnt
Scale_W_UpStartCount:
	BCF		ScaleFlag1,B_ScaleFlag1_Zero
Scale_W_ClrTrackCnt:
	CLRF	ZeroTrackCnt
Scale_W_StartCount_END:

Scale_W_Mem:
Scale_W_Mem_Update:
Scale_W_Mem_END:

Scale_W_Tare:
Scale_W_Tare_ON:
Scale_W_Tare_END:

Scale_W_MinDisp:
Scale_W_MinDisp_END:

Scale_W_MaxCount:
Scale_W_MaxCount_END:

Scale_W_RefreshOffTimer:
Scale_W_RefreshOffTimer_END:




Scale_Weight_EXIT:
