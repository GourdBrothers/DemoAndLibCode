/**
* @file     ScaleDisp_Cal.ASM
* @brief 
* @author
* @date     2019-01-07
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
	CALL	Fun_LCD_USER_Num
ScaleDisp_Cal_ADC_END:
	GOTO	ScaleDisp_Cal_Exit

ScaleDisp_Cal_ZERO:
	MOVLW	LcdchC
	MOVWF	Display2
	MOVLW	LcdchA
	MOVWF	Display3
	MOVLW	LcdchL
	MOVWF	Display4
ScaleDisp_Cal_ZERO_END:
	GOTO	ScaleDisp_Cal_Exit

ScaleDisp_Cal_DOT1:
	MOVLW	Lcdch5
	MOVWF	Display2
	MOVLW	Lcdch0
	MOVWF	Display3
	MOVWF	Display4
ScaleDisp_Cal_DOT1_END:
	GOTO	ScaleDisp_Cal_DOT_Comm

ScaleDisp_Cal_DOT2:
	MOVLW	Lcdch1
	MOVWF	Display1
	MOVLW	Lcdch0
	MOVWF	Display2
	MOVWF	Display3
	MOVWF	Display4
ScaleDisp_Cal_DOT2_END:
	GOTO	ScaleDisp_Cal_DOT_Comm

ScaleDisp_Cal_DOT3:
	MOVLW	Lcdch1
	MOVWF	Display1
	MOVLW	Lcdch5
	MOVWF	Display2
	MOVLW	Lcdch0
	MOVWF	Display3
	MOVWF	Display4
ScaleDisp_Cal_DOT3_END:
ScaleDisp_Cal_DOT_Comm:
	BSF		Display3,B_Display3_P3 
	GOTO	ScaleDisp_Cal_Exit

ScaleDisp_Cal_PASS:
	MOVLW	LcdchP
	MOVWF	Display1
	MOVLW	LcdchA
	MOVWF	Display2
	MOVLW	Lcdch5
	MOVWF	Display3
	MOVWF	Display4
ScaleDisp_Cal_PASS_END:
	GOTO	ScaleDisp_Cal_Exit

ScaleDisp_Cal_ERR:
	MOVLW	Lcdch0
	MOVWF	Display4
	MOVLW	LcdchE
	MOVWF	Display1
	MOVLW	Lcdchr
	MOVWF	Display2
	MOVWF	Display3
	
ScaleDisp_Cal_ERR_END:

ScaleDisp_Cal_Exit:
