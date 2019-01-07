/**
* @file  ScaleInit.ASM
* @brief 
* @author
* @date     2019-01-07
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

ScaleInit_LCD:
	CALL	Fun_LCD_Init
	CALL    Fun_LCD_ResetAllBuf
	CALL    Fun_LCD_Load

ScaleInit_ADC:
	CALL	Fun_ADC_Init
	
ScaleInit_UART:


ScaleInit_LoadParam:

	CALL	Fun_OTP_READ_CAL
	BTFSS	OTP_ISP_FLAG,B_OTP_ISP_IS_NULL
	GOTO	ScaleInit_LoadParam_END
ScaleInit_LoadDefautCal:

	CLRF	CalDot1H
	MOVLW   HIGH	3204
	MOVWF	CalDot1M
	MOVLW   LOW		3204
	MOVWF	CalDot1L
	
IF	COUNT_DIVIDE > 1
	CLRF	CalDot2H
	MOVLW   HIGH	8010
	MOVWF	CalDot2M
	MOVLW   LOW		8010
	MOVWF	CalDot2L
ENDIF

IF	COUNT_DIVIDE > 2
	CLRF	CalDot3H
	MOVLW   HIGH	12816
	MOVWF	CalDot3M
	MOVLW   LOW		12816
	MOVWF	CalDot3L
ENDIF

ScaleInit_LoadParam_END:
	
ScaleInit_INT:
	BSF		INTE,GIE

