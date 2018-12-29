/**
* @file     ScaleCal.ASM
* @brief 
* @author
* @date     2018-12-29
* @version  V1.0.0
* @copyright
*/

ScaleCal_Entry:

ScaleCal_Timer:
	BTFSC	ScaleFlag2,B_ScaleFlag2_0s5_B
	INCF	TimerUnst,F
	
ScaleCal_Timer_END:

ScaleCal_FlowChk:
	BTFSC	ScaleCalFlow,B_ScaleCalFlow_ADC
	GOTO	ScaleCal_ADC
	BTFSC	ScaleCalFlow,B_ScaleCalFlow_ZERO
	GOTO	ScaleCal_ZERO
	BTFSC	ScaleCalFlow,B_ScaleCalFlow_DOT1
	GOTO	ScaleCal_DOT1
	BTFSC	ScaleCalFlow,B_ScaleCalFlow_DOT2
	GOTO	ScaleCal_DOT2
	BTFSC	ScaleCalFlow,B_ScaleCalFlow_DOT3
	GOTO	ScaleCal_DOT3
	BTFSC	ScaleCalFlow,B_ScaleCalFlow_PASS
	GOTO	ScaleCal_PASS
	BTFSC	ScaleCalFlow,B_ScaleCalFlow_ERR
	GOTO	ScaleCal_ERR
	CLRF	ScaleCalFlow
	BSF		ScaleCalFlow,B_ScaleCalFlow_ADC
	
ScaleCal_ADC:
	BTFSS	ScaleFlag3,B_ScaleFlag3_CalTrg
	GOTO	ScaleCal_ADC_END
	BCF		ScaleFlag3,B_ScaleFlag3_CalTrg
	CLRF	ScaleCalFlow
	BSF		ScaleCalFlow,B_ScaleCalFlow_ZERO
	CLRF	TimerUnst
ScaleCal_ADC_END:
	GOTO	ScaleCal_Exit
	
ScaleCal_ZERO:
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcStable
	GOTO	ScaleCal_ZERO_END
	MOVLW	02H
	SUBWF	TimerUnst,W
	BTFSS	STATUS,C
	GOTO	ScaleCal_ZERO_END
	CALL	Fun_SetZeroPoint
	CLRF	TimerUnst
;
	CLRF	ScaleCalFlow
	BSF		ScaleCalFlow,B_ScaleCalFlow_DOT1
ScaleCal_ZERO_END:
	GOTO	ScaleCal_Exit

ScaleCal_DOT1:
	CALL	Fun_User_CalDotZero
	BTFSS	STATUS,C
	GOTO	ScaleCal_DOT1_END
	MOVLW	LOW		CALDOT1_ADC_THRESHOLD
	SUBWF	Display2,W
	MOVLW	HIGH	CALDOT1_ADC_THRESHOLD
	SUBWFC	Display1,W
	BTFSS	STATUS,C
	GOTO	ScaleCal_DOT1_END
;
	MOVFW	Display1
	MOVWF	CalDot1H
	MOVWF	W_CAL1_ADC_H
	MOVFW	Display2
	MOVWF	CalDot1L
	MOVWF	W_CAL1_ADC_L
;
;	CLRF	TimerUnst
	CLRF	ScaleCalFlow
	BSF		ScaleCalFlow,B_ScaleCalFlow_DOT2
ScaleCal_DOT1_END:
	GOTO	ScaleCal_Exit

ScaleCal_DOT2:
	CALL	Fun_User_CalDotZero
	BTFSS	STATUS,C
	GOTO	ScaleCal_DOT2_END
; 线性判断
	CLRF    REG0
	MOVLW	200
	MOVWF   REG1
	CALL    Fun_3wCal_CheckLinear
	BTFSC   STATUS,C
	GOTO	ScaleCal_DOT2_END
;
	MOVFW	Display1
	MOVWF	CalDot2H
	MOVFW	Display2
	MOVWF	CalDot2L
;
	CLRF	ScaleCalFlow
	BSF		ScaleCalFlow,B_ScaleCalFlow_DOT3
ScaleCal_DOT2_END:
	GOTO	ScaleCal_Exit
	
ScaleCal_DOT3:
	CALL	Fun_User_CalDotZero
	BTFSS	STATUS,C
	GOTO	ScaleCal_DOT3_END
; 线性判断
	MOVLW	HIGH	300
	MOVWF   REG0
	MOVLW	LOW		300
	MOVWF   REG1
	CALL    Fun_3wCal_CheckLinear
	BTFSC   STATUS,C
	GOTO	ScaleCal_DOT3_END	; 线性超出范围
;
	MOVFW	Display1
	MOVWF	CalDot3H
	MOVFW	Display2
	MOVWF	CalDot3L
	GOTO	ScaleCal_OTP_write
ScaleCal_DOT3_END:
	GOTO	ScaleCal_Exit
	
ScaleCal_OTP_write:
	CALL	Fun_LCD_ResetAllBuf
	CALL	Fun_LCD_Load
	CALL    Fun_OTP_WRITE_CAL
	BTFSC	OTP_ISP_FLAG,B_OTP_ISP_VPP_ERR
	GOTO	ScaleCal_Err
	BTFSC	OTP_ISP_FLAG,B_OTP_ISP_TIME_ERR
	GOTO	ScaleCal_Err
	CALL	Fun_OTP_READ_CAL
ScaleCal_OK:
	CLRF	ScaleCalFlow
	BSF		ScaleCalFlow,B_ScaleCalFlow_PASS
	CLRF	TimerUnst
	GOTO	ScaleCal_Exit

ScaleCal_Err:
	CLRF	TimerUnst
	CLRF	ScaleCalFlow
	BSF		ScaleCalFlow,ScaleCal_ERR
	GOTO	ScaleCal_Exit
	
ScaleCal_PASS:
	MOVLW	04H
	SUBWF	TimerUnst,W
	BTFSS	STATUS,C
	GOTO	ScaleCal_PASS_END
;
	CLRF	TimerUnst
	CALL	Fun_GetAutoOnADC
	CALL	Fun_ADC_ProStart
	CALL	Fun_User_RefreshOffTimer
	CLRF	ScaleFlag2
	CLRF	ScaleFlag3
;
	MOVLW	HIGH	1500
	MOVWF	LockCountH
	MOVLW	LOW		1500
	MOVWF	LockCountL
	CLRF	CountH
	CLRF	CountL
;
	CLRF	ScaleUnit
	BSF		ScaleUnit,B_ScaleUnit_KG
;
	CLRF	ScaleFlow
	BSF		ScaleFlow,B_ScaleFlow_WEIGHT
ScaleCal_PASS_END:
	GOTO	ScaleCal_Exit

ScaleCal_ERR:
;	GOTO	ScaleCal_Exit
	
ScaleCal_Exit:
