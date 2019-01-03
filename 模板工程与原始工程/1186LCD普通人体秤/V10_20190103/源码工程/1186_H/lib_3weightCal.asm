

lib_3W_CAL_RAM .section RAM

W_CAL1_ADC_H	DS	1
W_CAL1_ADC_L	DS	1
W_CAL2_ADC_H	DS	1
W_CAL2_ADC_L	DS	1
W_CAL3_ADC_H	DS	1
W_CAL3_ADC_L	DS	1
W_CAL_Flag		DS	1
    B_W_CAL_Flag_EN   EQU  0
    B_W_CAL_Flag_1    EQU  1
    B_W_CAL_Flag_2    EQU  2
    B_W_CAL_Flag_3    EQU  3
    B_W_CAL_Flag_LOCK EQU  4
    B_W_CAL_Flag_PASS EQU  5

.ENDS 

lib_3W_CAL_ROM .section rom

Fun_3wCal_CheckLinear:
	CLRF	TempRam4
	MOVFW	W_CAL3_ADC_H
	MOVWF	TempRam5
	MOVFW	W_CAL3_ADC_L
	MOVWF	TempRam6
	CLRF	TempRam11
	CLRF	TempRam12
	MOVLW	100
	MOVWF	TempRam13
	CALL	Fun_Math_Mul3_3
	CLRF	TempRam11
	MOVFW	W_CAL1_ADC_H
    MOVWF	TempRam12
    MOVFW	W_CAL1_ADC_L
    MOVWF	TempRam13
	CALL	Fun_Math_Div6_3
	CALL	Fun_Math_Div6_3_Rounded
	CLRF	TempRam1
	MOVFW	REG0
	MOVWF	TempRam2 
	MOVFW	REG1
	MOVWF	TempRam3
    CALL	Fun_Math_Sub3_3
    CALL	Fun_Math_Sub3_3_Neg
	MOVLW	8
	SUBWF	TempRam3,W
	MOVLW	00H
	SUBWFC	TempRam2,W
	MOVLW	00H
	SUBWFC	TempRam1,W
RETURN

Fun_3W_CAL_Init:
	BCF		ScaleFlag3,B_ScaleFlag3_3wCalOk
    CLRF	W_CAL_Flag
    BSF		W_CAL_Flag,B_W_CAL_Flag_EN
    BSF		W_CAL_Flag,B_W_CAL_Flag_1
RETURN

Fun_3W_CAL_Disable:
	BCF		ScaleFlag3,B_ScaleFlag3_3wCalOk
	CLRF	W_CAL_Flag
RETURN

Fun_3W_CAL_ResetLock:
	BTFSC	W_CAL_Flag,B_W_CAL_Flag_EN
	BCF		W_CAL_Flag,B_W_CAL_Flag_LOCK
RETURN

Fun_3W_CAL:

    BTFSS	W_CAL_Flag,B_W_CAL_Flag_EN
	GOTO	Fun_3W_CAL_Clr
	
	BTFSC	W_CAL_Flag,B_W_CAL_Flag_LOCK
	GOTO	Fun_3W_CAL_Exit
    BSF		W_CAL_Flag,B_W_CAL_Flag_LOCK
;---
	BTFSC   W_CAL_Flag,B_W_CAL_Flag_1
	GOTO	Fun_3W_CAL_First
	BTFSC	W_CAL_Flag,B_W_CAL_Flag_2
	GOTO	Fun_3W_CAL_Second
	BTFSC	W_CAL_Flag,B_W_CAL_Flag_3
	GOTO	Fun_3W_CAL_Third
    GOTO	Fun_3W_CAL_Clr
    
Fun_3W_CAL_First:
    MOVLW	LOW  CALDOT1_ADC_THRESHOLD
	SUBWF	W_CAL3_ADC_L,W
	MOVLW	HIGH CALDOT1_ADC_THRESHOLD
	SUBWFC	W_CAL3_ADC_H,W
	BTFSS	STATUS,C
	GOTO	Fun_3W_CAL_Clr
	MOVFW	W_CAL3_ADC_H
	MOVWF   W_CAL1_ADC_H
	MOVFW	W_CAL3_ADC_L
	MOVWF   W_CAL1_ADC_L
;---
    BCF     W_CAL_Flag,B_W_CAL_Flag_1
    BSF     W_CAL_Flag,B_W_CAL_Flag_2
    BCF     W_CAL_Flag,B_W_CAL_Flag_3
Fun_3W_CAL_First_END:
    GOTO    Fun_3W_CAL_Exit

Fun_3W_CAL_Second:
	CLRF    REG0
	MOVLW	200
	MOVWF   REG1
	CALL    Fun_3wCal_CheckLinear
	BTFSC   STATUS,C
    GOTO    Fun_3W_CAL_Clr
    MOVFW	W_CAL3_ADC_H
	MOVWF   W_CAL2_ADC_H
	MOVFW	W_CAL3_ADC_L
	MOVWF   W_CAL2_ADC_L
;---
	BCF     W_CAL_Flag,B_W_CAL_Flag_1
    BCF     W_CAL_Flag,B_W_CAL_Flag_2
    BSF     W_CAL_Flag,B_W_CAL_Flag_3
Fun_3W_CAL_Second_END:
    GOTO    Fun_3W_CAL_Exit
	
Fun_3W_CAL_Third:
	MOVLW	HIGH 300
	MOVWF	REG0
	MOVLW	LOW  300
	MOVWF   REG1
	CALL    Fun_3wCal_CheckLinear
	BTFSC   STATUS,C
	GOTO    Fun_3W_CAL_Clr
Fun_3W_CAL_Third_END:
;---
	MOVFW	W_CAL1_ADC_H
	MOVWF	CalDot1H
	MOVFW	W_CAL1_ADC_L
	MOVWF   CalDot1L
	MOVFW	W_CAL2_ADC_H
	MOVWF   CalDot2H
	MOVFW	W_CAL2_ADC_L
	MOVWF   CalDot2L
	MOVFW	W_CAL3_ADC_H
	MOVWF   CalDot3H
	MOVFW	W_CAL3_ADC_L
	MOVWF   CalDot3L
;---
	BSF		ScaleFlag3,B_ScaleFlag3_3wCalOk
;---
Fun_3W_CAL_Clr:
	BTFSS	ScaleFlag1,B_ScaleFlag1_oL
    CLRF	W_CAL_Flag

Fun_3W_CAL_Exit:

RETURN

.ends
