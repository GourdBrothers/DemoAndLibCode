﻿
/**
* @file  lib_GetCount.ASM
* @brief 
* @author
* @date     2018-12-26
* @version  V1.0.0
* @copyright
*/

INCLUDE "SysConfig.inc"


MOVFF	.MACRO	F1,F2  ; F2->F1
	MOVFW	F2
	MOVWF	F1
.ENDM

MOVFL	.MACRO	F1,D1  ; D1->F1
	MOVLW	D1
	MOVWF	F1
.ENDM

lib_GetCount_RAM .section BANK0
	
	CalDot1H	DS	1	; FOR Cal
	CalDot1M	DS	1
	CalDot1L	DS	1
	CalDot2H	DS	1
	CalDot2M	DS	1
	CalDot2L	DS	1
	CalDot3H	DS	1
	CalDot3M	DS	1
	CalDot3L	DS 	1
	
	W_CAL3_ADC_H	DS	1
	W_CAL3_ADC_M	DS	1
	W_CAL3_ADC_L	DS	1
	
	TareTimer			DS	1
	TareFlag			DS	1
		B_TareFlag_Trg  EQU	0
  		B_TareFlag_ON   EQU	1
  	TareCountH			DS	1
  	TareCountL			DS	1

.ends


lib_GetCount_ROM .section ROM

Fun_GetCount:
		CALL		Fun_CurAD_Sub_ZeroAD

    ;--- 当前ADC与零点内码差
		MOVFF		W_CAL3_ADC_H,TempRam1
		MOVWF		REG0
		MOVFF		W_CAL3_ADC_M,TempRam2
		MOVWF		REG1
		MOVFF		W_CAL3_ADC_L,TempRam3
		MOVWF		REG2
		
		MOVLW		01H
		ADDWF		REG2,F
		MOVLW		00H
		ADDWFC		REG1,F
		MOVLW		00H
		ADDWFC		REG0,F
	;--- 判断内码所处的区间位置
.IF		COUNT_DIVIDE==0
		.ERROR "COUNT_DIVIDE < 1,Please check COUNT_DIVIDE in SysConfig.inc!"
.ENDIF

.IF		COUNT_DIVIDE>3
		.ERROR "COUNT_DIVIDE > 3,please check COUNT_DIVIDE in SysConfig.inc!"
.ENDIF
	
IF		COUNT_DIVIDE==1
		GOTO		GetCount1
ENDIF

		MOVFW		CalDot1L
		SUBWF		REG2,W
		MOVFW		CalDot1M
		SUBWFC		REG1,W
		MOVFW		CalDot1H
		SUBWFC		REG0,W
		BTFSS		STATUS,C
		GOTO		GetCount1
		
IF		COUNT_DIVIDE==2
		GOTO		GetCount2
ENDIF

		MOVFW		CalDot2L
		SUBWF		REG2,W
		MOVFW		CalDot2M
		SUBWFC		REG1,W
		MOVFW		CalDot2H
		SUBWFC		REG0,W
		BTFSS		STATUS,C
		GOTO		GetCount2
;---
GetCount3:
		MOVFL		REG0,HIGH	CAL_COUNT_2	; 基点
		MOVFL		REG1,LOW	CAL_COUNT_2
		
		MOVFL		REG2,HIGH	CAL_COUNT_3	;
		MOVFL		REG3,LOW	CAL_COUNT_3
		
		MOVFW		CalDot2L				; 斜率(标定点内码差)
		SUBWF		CalDot3L, W
		MOVWF		Display3
		MOVFW		CalDot2M
		SUBWFC		CalDot3M, W
		MOVWF		Display2
		MOVFW		CalDot2H
		SUBWFC		CalDot3H, W
		MOVWF		Display1
		
		MOVFW		CalDot2L				; 当前ADC相对校正点2内码差
		SUBWF		W_CAL3_ADC_L, W
		MOVWF		TempRam6
		MOVFW		CalDot2M
		SUBWFC		W_CAL3_ADC_M, W
		MOVWF		TempRam5
		MOVFW		CalDot2H
		SUBWFC		W_CAL3_ADC_H, W
		MOVWF		TempRam4

		GOTO		GetCount_COM

GetCount1:

		CLRF		REG0					; 基点
		CLRF		REG1
		
		MOVFL		REG2,HIGH	CAL_COUNT_1	; 
		MOVFL		REG3,LOW	CAL_COUNT_1
		
		MOVFF		Display1,CalDot1H		; 斜率
		MOVFF		Display2,CalDot1M
		MOVFF		Display3,CalDot1L
		
		MOVFF		TempRam4,W_CAL3_ADC_H	; 相对校正点 内码差
		MOVFF		TempRam5,W_CAL3_ADC_M
		MOVFF		TempRam6,W_CAL3_ADC_L

		GOTO		GetCount_COM

GetCount2:
		MOVFL		REG0,HIGH	CAL_COUNT_1		; 基点
		MOVFL		REG1,LOW	CAL_COUNT_1
		
		MOVFL		REG2,HIGH	CAL_COUNT_2	; 
		MOVFL		REG3,LOW	CAL_COUNT_2

		MOVFW		CalDot1L				; 斜率
		SUBWF		CalDot2L, W
		MOVWF		Display3
		MOVFW		CalDot1M
		SUBWFC		CalDot2M, W
		MOVWF		Display2
		MOVFW		CalDot1H
		SUBWFC		CalDot2H, W
		MOVWF		Display1

		MOVFW		CalDot1L				; 相对校正点 内码差
		SUBWF		W_CAL3_ADC_L, W	
		MOVWF		TempRam6
		MOVFW		CalDot1M
		SUBWFC		W_CAL3_ADC_M, W
		MOVWF		TempRam5
		MOVFW		CalDot1H
		SUBWFC		W_CAL3_ADC_H, W
		MOVWF		TempRam4

GetCount_COM:

		CLRF		TempRam11
		CLRF		TempRam12
		MOVFL		TempRam13,10
		CALL		Fun_Math_Mul3_3		; 

		MOVFW		REG1				; 点数斜率
		SUBWF		REG3,F
		MOVFW		REG0
		SUBWFC		REG2,F
										
		CLRF		TempRam11			; 当前内码差 * 点数斜率
		MOVFW		REG2
		MOVWF		TempRam12
		MOVFW		REG3
		MOVWF		TempRam13
		CALL		Fun_Math_Mul3_3
		
		MOVFF		TempRam11,Display1	; 内码斜率
		MOVFF		TempRam12,Display2
		MOVFF		TempRam13,Display3
		CALL		Fun_Math_Div6_3
		CALL		Fun_Math_Div6_3_Rounded
		
		MOVFF		Display1,TempRam4
		MOVFF		Display2,TempRam5
		MOVFF		Display3,TempRam6
		
		CLRF		TempRam4			; 加上基准点数
		MOVFF		TempRam5,REG0
		MOVFF		TempRam6,REG1
		CLRF		TempRam11
		CLRF		TempRam12
		MOVFL		TempRam13,10
		CALL		Fun_Math_Mul3_3
		
;---
		MOVFW		Display3
		ADDWF		TempRam6,W
		MOVWF		CountL
		
		MOVFW		Display2
		ADDWFC		TempRam5,W
		MOVWF		CountM
		
		MOVFW		Display1
		ADDWFC		TempRam4,W
		MOVWF		CountH

GetCount_End:

RETURN

Fun_TareTrg:
		BTFSC		TareFlag,B_TareFlag_Trg
		GOTO		Fun_TareTrg_End
		CLRF		TareTimer
		BSF			TareFlag,B_TareFlag_Trg
Fun_TareTrg_End:
RETURN

Fun_TareCount:
		BTFSS		TareFlag,B_TareFlag_Trg
		GOTO		Fun_Tare_ON
;---
		MOVLW		TARE_MODE
		MOVWF       REG0
		MOVLW		03H
		XORWF		REG0,W
		BTFSC		STATUS,Z
		GOTO		Fun_Tare_Do
		MOVLW		02H
		XORWF		REG0,W
		BTFSC		STATUS,Z
		GOTO		Fun_Tare_TIMER
		MOVLW		01H
		XORWF		REG0,W
		BTFSC		STATUS,Z
		GOTO		Fun_Tare_AdcStable
;---
Fun_Tare_AdcStable:
		BTFSC		ScaleFlag1,B_ScaleFlag1_AdcStable
		GOTO		Fun_Tare_Do
		GOTO		Fun_Tare_ON
Fun_Tare_TIMER:
		INCF		TareTimer,F
		MOVLW		TARE_DELAY_CNT
		SUBWF		TareTimer,W
		BTFSS		STATUS,C
		GOTO		Fun_Tare_ON
		CLRF		TareTimer
Fun_Tare_Do:
		BCF			TareFlag,B_TareFlag_Trg	
		BTFSC		ScaleFlag1,B_ScaleFlag1_Neg
		GOTO		Fun_Tare_DoDownRange
		MOVLW		LOW		TARE_COUNT
		SUBWF		CountL,W
		MOVLW		HIGH	TARE_COUNT
		SUBWFC		CountH,W
		BTFSC		STATUS,C
		GOTO		Fun_Tare_DoUpRange
Fun_Tare_DoDownRange:
		CLRF		TareFlag
		CLRF		TareCountH
		CLRF		TareCountL
		CALL		Fun_SetZeroPoint
		GOTO		Fun_Tare_Do_END
Fun_Tare_DoUpRange:
		BSF			TareFlag,B_TareFlag_ON
		MOVFW		CountH
		MOVWF		TareCountH
		MOVFW		CountL
		MOVWF		TareCountL
Fun_Tare_Do_END:

Fun_Tare_ON:
		BTFSS		TareFlag,B_TareFlag_ON
		GOTO		Fun_Tare_END
		
		MOVFF		TempRam3,CountH
		MOVFF		TempRam4,CountL
		MOVFF		TempRam5,TareCountH
		MOVFF		TempRam6,TareCountL
		
		BTFSS		ScaleFlag1,B_ScaleFlag1_Neg
		GOTO		Fun_Tare_ON_Pos
Fun_Tare_ON_Neg:
		MOVFW		TempRam6
		ADDWF		TempRam4,F
		MOVFW		TempRam5
		ADDWFC		TempRam3,F
		GOTO		Fun_Tare_ON_0
Fun_Tare_ON_Pos:
		CALL		Fun_Math_Sub2_2
		BTFSS		STATUS,C
		BSF			ScaleFlag1,B_ScaleFlag1_Neg
		CALL		Fun_Math_Sub2_2_Neg
Fun_Tare_ON_0:
		MOVFF		CountH,TempRam3
		MOVFF		CountL,TempRam4
Fun_Tare_END:
RETURN

Fun_ChkMinDispCount:
	BCF		ScaleFlag1,B_ScaleFlag1_Zero
	MOVLW	MIN_DISP_COUNT
    SUBWF	CountL,W
    MOVLW	00H
    SUBWFC	CountH,W
    BTFSS	STATUS,C
	GOTO	Fun_SetCountZero
Fun_ChkMinDispCountEnd:
RETURN

.ends
