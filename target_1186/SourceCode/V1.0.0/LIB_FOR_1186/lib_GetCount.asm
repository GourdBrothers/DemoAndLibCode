
;========================================================
;==== lib_GetCount.ASM
;========================================================

lib_GetCount_RAM .section BANK0

	W_CAL_ADC_H DS	1
	W_CAL_ADC_L DS	1
	
	CalDot1H	DS	1	; FOR Cal
	CalDot1L	DS	1
	CalDot2H	DS	1
	CalDot2L	DS	1
	CalDot3H	DS	1
	CalDot3L	DS	1

.ends


lib_GetCount_ROM .section ROM

Fun_GetCount:
		CALL		Fun_CurAD_Sub_ZeroAD

		BCF		    ScaleFlag1,B_ScaleFlag1_Neg
		BTFSS		STATUS, C
		BSF		    ScaleFlag1,B_ScaleFlag1_Neg
		CALL		Fun_Math_Sub3_3_Neg

    ;---
    	MOVFW		TempRam2		; 内码相对于零点的绝对值
	    MOVWF       W_CAL_ADC_H
	    MOVFW		TempRam3
	    MOVWF       W_CAL_ADC_L

	;---
		MOVFW		CalDot1L
		SUBWF		W_CAL_ADC_L,W
		MOVFW		CalDot1H
		SUBWFC		W_CAL_ADC_H,W
		BTFSS		STATUS,C
		GOTO		GetCount1

		MOVFW		CalDot2L
		SUBWF		W_CAL_ADC_L,W
		MOVFW		CalDot2H
		SUBWFC		W_CAL_ADC_H,W
		BTFSS		STATUS,C
		GOTO		GetCount2
;---
		MOVLW		HIGH	COUNT_DOT	; 基点
		MOVWF		REG0
		MOVLW		LOW		COUNT_DOT
		MOVWF		REG1
		BCF         STATUS,C
		RLF			REG1,F
		RLF			REG0,F
		
		MOVFW		CalDot2L				; 斜率
		SUBWF		CalDot3L, W
		MOVWF		REG3
		MOVFW		CalDot2H
		SUBWFC		CalDot3H, W
		MOVWF		REG2
		
		MOVFW		CalDot2L				; 相对校正点 内码差
		SUBWF		W_CAL_ADC_L, W
		MOVWF		TempRam6
		MOVFW		CalDot2H
		SUBWFC		W_CAL_ADC_H, W
		MOVWF		TempRam5

		GOTO		GetCount_COM

GetCount1:
		CLRF		REG0			; 基点
		CLRF		REG1
		
		MOVFW       CalDot1H
		MOVWF		REG2			; 斜率
		MOVFW		CalDot1L
		MOVWF		REG3
		
		MOVFW		W_CAL_ADC_H		; 相对校正点 内码差
		MOVWF		TempRam5
		MOVFW		W_CAL_ADC_L
		MOVWF		TempRam6

		GOTO		GetCount_COM

GetCount2:
		MOVLW		HIGH COUNT_DOT		; 基点
		MOVWF		REG0
		MOVLW		LOW  COUNT_DOT
		MOVWF		REG1

		MOVFW		CalDot1L				; 斜率
		SUBWF		CalDot2L, W
		MOVWF		REG3
		MOVFW		CalDot1H
		SUBWFC		CalDot2H, W
		MOVWF		REG2

		MOVFW		CalDot1L				; 相对校正点 内码差
		SUBWF		W_CAL_ADC_L, W	
		MOVWF		TempRam6
		MOVFW		CalDot1H
		SUBWFC		W_CAL_ADC_H, W
		MOVWF		TempRam5

GetCount_COM:

		CLRF		TempRam4		; 乘以校正重量点数
		CLRF		TempRam11
		MOVLW		HIGH COUNT_DOT
		MOVWF		TempRam12
		MOVLW		LOW	 COUNT_DOT
		MOVWF		TempRam13
		CALL		Fun_Math_Mul3_3
		
		CLRF		TempRam11		; 除以斜率
		MOVFW		REG2
		MOVWF		TempRam12
		MOVFW		REG3
		MOVWF		TempRam13
		CALL		Fun_Math_Div6_3
		CALL		Fun_Math_Div6_3_Rounded
	
		MOVFW		REG1			; 加上基准点数
		ADDWF		TempRam6,W
		MOVWF		CountL
		MOVFW		REG0
		ADDWFC		TempRam5,W
		MOVWF		CountH

GetCount_End:
RETURN
	
.ends
