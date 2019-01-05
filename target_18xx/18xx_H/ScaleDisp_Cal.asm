/**
* @file     ScaleDisp_Cal.ASM
* @brief 
* @author
* @date     2018-12-29
* @version  V1.0.0
* @copyright
*/

ScaleDisp_Cal_Entry:

	BTFSC	ScaleCalFlow,B_ScaleCalFlow_ADC
	GOTO	ScaleDisp_Cal_ADC
	BTFSC	ScaleCalFlow,B_ScaleCalFlow_ZERO
	GOTO	ScaleDisp_Cal_ZERO
	BTFSC	ScaleCalFlow,B_ScaleCalFlow_DOT1
	GOTO	ScaleDisp_Cal_DOT1
	BTFSC	ScaleCalFlow,B_ScaleCalFlow_DOT2
	GOTO	ScaleDisp_Cal_DOT2
	BTFSC	ScaleCalFlow,B_ScaleCalFlow_DOT3
	GOTO	ScaleDisp_Cal_DOT3
	BTFSC	ScaleCalFlow,B_ScaleCalFlow_PASS
	GOTO	ScaleDisp_Cal_PASS
	BTFSC	ScaleCalFlow,B_ScaleCalFlow_ERR
	GOTO	ScaleDisp_Cal_ERR
	
ScaleDisp_Cal_ADC:
	MOVFW	H_DR
	MOVWF	TempRam11
	MOVFW	M_DR
	MOVWF	TempRam12
	MOVFW	L_DR
	MOVWF	TempRam13
	CALL	Fun_Math_Hex3_Bcd
	CALL	Fun_LED_USER_Num
ScaleDisp_Cal_ADC_END:
	GOTO	ScaleDisp_Cal_Exit

ScaleDisp_Cal_ZERO:
	MOVLW	LedchC
	MOVWF	Display2
	MOVLW	LedchA
	MOVWF	Display3
	MOVLW	LedchL
	MOVWF	Display4
ScaleDisp_Cal_ZERO_END:
	GOTO	ScaleDisp_Cal_Exit

ScaleDisp_Cal_DOT1:
	MOVLW	Ledch5
	MOVWF	Display2
	MOVLW	Ledch0
	MOVWF	Display3
	MOVWF	Display4
ScaleDisp_Cal_DOT1_END:
	GOTO	ScaleDisp_Cal_DOT_Comm

ScaleDisp_Cal_DOT2:
	MOVLW	Ledch1
	MOVWF	Display1
	MOVLW	Ledch0
	MOVWF	Display2
	MOVWF	Display3
	MOVWF	Display4
ScaleDisp_Cal_DOT2_END:
	GOTO	ScaleDisp_Cal_DOT_Comm

ScaleDisp_Cal_DOT3:
	MOVLW	Ledch1
	MOVWF	Display1
	MOVLW	Ledch5
	MOVWF	Display2
	MOVLW	Ledch0
	MOVWF	Display3
	MOVWF	Display4
ScaleDisp_Cal_DOT3_END:
ScaleDisp_Cal_DOT_Comm:
	BSF		Display3,B_Display3_P 
	BSF		Display5,B_Display5_KG
	GOTO	ScaleDisp_Cal_Exit

ScaleDisp_Cal_PASS:
	MOVLW	LedchP
	MOVWF	Display1
	MOVLW	LedchA
	MOVWF	Display2
	MOVLW	Ledch5
	MOVWF	Display3
	MOVWF	Display4
ScaleDisp_Cal_PASS_END:
	GOTO	ScaleDisp_Cal_Exit

ScaleDisp_Cal_ERR:
	MOVLW	Ledch0
	MOVWF	Display4
	MOVLW	LedchE
	MOVWF	Display1
	MOVLW	Ledchr
	MOVWF	Display2
	MOVWF	Display3
	
ScaleDisp_Cal_ERR_END:

ScaleDisp_Cal_Exit:
