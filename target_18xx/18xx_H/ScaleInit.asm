/**
* @file  ScaleInit.ASM
* @brief 
* @author
* @date     2018-12-22
* @version  V1.0.0
* @copyright
*/

ScaleInit_Entry:
	BCF		INTE,GIE
	
ScaleInit_IO:
	CALL    Fun_GPIO_Init
	
ScaleInit_Power:
	CALL	Fun_power_Init
	CALL    Fun_Delay_1MS

ScaleInit_Ram_Zero:
    BCF     BSR,IRP0
	MOVLW	ScaleFlag1
	CALL	Fun_RAM_Zero
	
;	BCF     BSR,IRP0
;	MOVLW	ScaleFlag1
;	CALL	Fun_RAM_Zero

ScaleInit_LO:
	CALL	Fun_LoCheck_Init
	
ScaleInit_TIMER:
	CALL	Fun_TIMER_init

ScaleInit_LED:
	CALL	Fun_LED_Init
	CALL    Fun_LED_ResetAllBuf
	CALL    Fun_LED_Load

ScaleInit_ADC:
	CALL	Fun_ADC_Init
	
ScaleInit_UART:


ScaleInit_LoadParam:

;	CALL	Fun_OTP_READ_CAL
;	BTFSS	OTP_ISP_FLAG,B_OTP_ISP_IS_NULL
;	GOTO	ScaleInit_LoadParam_END
ScaleInit_LoadDefautCal:
	MOVLW   HIGH	2000;1603
	MOVWF	CalDot1H
	MOVLW   LOW		2000;1603
	MOVWF	CalDot1L
	
	MOVLW   HIGH	4000;3206
	MOVWF	CalDot2H
	MOVLW   LOW		4000;3206
	MOVWF	CalDot2L
	
	MOVLW   HIGH	6000;4810
	MOVWF	CalDot3H
	MOVLW   LOW		6000;4810
	MOVWF	CalDot3L
ScaleInit_LoadParam_END:
	
ScaleInit_INT:
	BSF		INTE,GIE

