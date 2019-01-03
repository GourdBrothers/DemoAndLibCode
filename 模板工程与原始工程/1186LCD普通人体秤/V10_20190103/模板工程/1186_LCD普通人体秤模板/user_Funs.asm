/**
* @file  user_Funs.asm
* @brief 
* @author
* @date
* @version  V1.0.0
* @copyright
*/

user_Funs_rom .section	rom


Fun_User_CountKgToLb:
	MOVLW	002H		; 144480
    MOVWF	TempRam11
    MOVLW	034H
    MOVWF	TempRam12
    MOVLW	060H
    MOVWF	TempRam13
    CALL	Fun_Math_Mul3_3
    MOVLW	001H
    MOVWF	TempRam11
    CLRF	TempRam12    ; 65536
    CLRF	TempRam13
    CALL	Fun_Math_Div6_3
RETURN

Fun_User_RefreshOffTimer:
	CLRF	Timer05sCnt
	BCF		ScaleFlag2,B_ScaleFlag2_0s5_A
	BCF		ScaleFlag2,B_ScaleFlag2_0s5_B
	CLRF	TimerAutoOff
RETURN

Fun_User_CalDotZero:
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcStable
	GOTO	Fun_User_CalDotZero_END
	CALL	Fun_CurAD_Sub_ZeroAD
	CALL	Fun_Math_Sub3_3_Neg
;
	MOVFW	TempRam2
	MOVWF	Display1
	MOVWF	W_CAL3_ADC_H
	MOVFW	TempRam3
	MOVWF	Display2
	MOVWF	W_CAL3_ADC_L
;
	MOVLW	LOW		300
	SUBWF	TempRam3,W
	MOVLW	HIGH	300
	SUBWFC	TempRam2,W
	MOVLW	00H
	SUBWFC	TempRam1,W
	BTFSC	STATUS,C
	GOTO	Fun_User_CalDotZeroUp
	CALL	Fun_SetZeroPoint
	BCF		STATUS,C
	GOTO	Fun_User_CalDotZero_END
Fun_User_CalDotZeroUp:
	BSF		STATUS,C
Fun_User_CalDotZero_END:
RETURN

Fun_LoCheck_Init:
	MOVLW	NETE_CFG_VALUE
	MOVWF	NETE
RETURN

Fun_LoCheck_Close:
	BCF		NETE,ENLB
RETURN

Fun_LoCheck:
	BTFSS     ScaleFlag2,B_ScaleFlag2_BatChk_T
	GOTO      Fun_LoCheck_END
	BCF       ScaleFlag2,B_ScaleFlag2_BatChk_T
;---
	BTFSC     ScaleFlag3,B_ScaleFlag3_Lo
	GOTO      Fun_LoCheck_1
Fun_LoCheck_0:
	BTFSC     SVD,LBOUT
	GOTO      Fun_LoCheck_END
    INCF      BatLowCnt,F
	MOVLW     03H
	SUBWF     BatLowCnt,W
	BTFSS     STATUS,C
	GOTO      Fun_LoCheck_END
	DECF      BatLowCnt,F
Fun_LoCheck_Done:
	BSF       ScaleFlag3,B_ScaleFlag3_Lo
	GOTO      Fun_LoCheck_END
;--- NO LOW
Fun_LoCheck_1:
    BTFSS     SVD,LBOUT
	GOTO      Fun_LoCheck_END
	MOVLW     00H
	XORWF     BatLowCnt,W
	BTFSC     STATUS,Z
	GOTO      Fun_LoCheck_clr
	DECF      BatLowCnt,F
Fun_LoCheck_clr:
    BCF       ScaleFlag3,B_ScaleFlag3_Lo
Fun_LoCheck_END:
RETURN

Fun_user_KeyGetGPIO:
	MOVLW	KEY_USED_BITS
	MOVWF	Key_IO_PRESS
	
	BTFSS	KEY_UNIT_PORT,KEY_UNIT_PIN
	BCF		Key_IO_PRESS ,B_KEY_UNIT
RETURN

.ends
