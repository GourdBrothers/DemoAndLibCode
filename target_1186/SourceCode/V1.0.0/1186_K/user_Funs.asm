/**
* @file  user_Funs.asm
* @brief 
* @author
* @date
* @version  V1.0.0
* @copyright
*/

MOVFF	.MACRO	F1,F2  ; F2->F1
	MOVFW	F2
	MOVWF	F1
.ENDM

MOVFL	.MACRO	F1,D1  ; D1->F1
	MOVLW	D1
	MOVWF	F1
.ENDM

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
	
	BTFSS	KEY_ON_PORT,KEY_ON_PIN
	BCF		Key_IO_PRESS ,B_KEY_ON
RETURN

Fun_user_UnitChange:
	CLRF	Unit_Point
	BTFSC	ScaleUnit,B_ScaleUnit_G
	GOTO	Fun_user_UnitToG
	BTFSC	ScaleUnit,B_ScaleUnit_OZ
	GOTO	Fun_user_UnitToOZ
	BTFSC	ScaleUnit,B_ScaleUnit_LBOZ
	GOTO	Fun_user_UnitToLBOZ
	BTFSC	ScaleUnit,B_ScaleUnit_ML
	GOTO	Fun_user_UnitToML
	BTFSC	ScaleUnit,B_ScaleUnit_FLOZ
	GOTO	Fun_user_UnitToFLOZ
	CLRF	ScaleUnit
	BCF		ScaleUnit,B_ScaleUnit_G
Fun_user_UnitToML:
Fun_user_UnitToG:
	MOVFL	Unit_CH    ,010H
	CLRF	Unit_CM
	CLRF	Unit_CL
	MOVFL	Unit_MIN   ,001H
	GOTO	Fun_user_UnitChangeEnd
Fun_user_UnitToLBOZ:
Fun_user_UnitToOZ:	; 0B49A5H
	MOVFL	Unit_CH    ,00BH
	MOVFL	Unit_CM    ,049H
	MOVFL	Unit_CL    ,0A5H
	MOVFL	Unit_MIN   ,005H
	BSF		Unit_Point ,1
	GOTO	Fun_user_UnitChangeEnd
;Fun_user_UnitToLBOZ:
;	MOVFL	Unit_CH    ,10H
;	MOVFL	Unit_CM    ,00H
;	MOVFL	Unit_CL    ,00H
;	MOVFL	Unit_MIN   ,01H
;	GOTO	Fun_user_UnitChangeEnd
;Fun_user_UnitToML:
;	MOVFL	Unit_CH    ,10H
;	MOVFL	Unit_CM    ,00H
;	MOVFL	Unit_CL    ,00H
;	MOVFL	Unit_MIN   ,01H
;	GOTO	Fun_user_UnitChangeEnd
Fun_user_UnitToFLOZ:
	MOVFL	Unit_CH    ,00BH
	MOVFL	Unit_CM    ,043H
	MOVFL	Unit_CL    ,095H
	MOVFL	Unit_MIN   ,005H
	BSF		Unit_Point ,1
;	GOTO	Fun_user_UnitChangeEnd
Fun_user_UnitChangeEnd:
RETURN

Fun_user_DispLbOz:
	CLRF	TempRam1
	CLRF	TempRam2
	CLRF	TempRam3
	CLRF	TempRam4
	MOVFF	TempRam5,CountH
	MOVFF	TempRam6,CountL
	CLRF	TempRam11
	MOVFL	TempRam12,HIGH	1600
	MOVFL	TempRam13,LOW	1600
	CALL	Fun_Math_Div6_3
	MOVFF	REG0,TempRam2	; 保存OZ对1600取余的值
	MOVFF	REG1,TempRam3
Fun_user_DispLbOz_lb:
	MOVFF	TempRam11,TempRam4
	MOVFF	TempRam12,TempRam5
	MOVFF	TempRam13,TempRam6
	CALL	Fun_Math_Hex3_Bcd
;--	
	MOVLW	00H
	XORWF	TempRam5,W
	BTFSS	STATUS,Z
	GOTO	Fun_user_DispLbOz_lb0
	MOVFL	TempRam5,Disp_No
	
Fun_user_DispLbOz_lb0:	
	MOVFW	TempRam5
    CALL	Table_Lcd_Num
    IORWF	Display1,F
    MOVFW	TempRam6
    CALL	Table_Lcd_Num
    IORWF	Display2,F
	
Fun_user_DispLbOz_oz:
	CLRF	TempRam11
	MOVFF	TempRam12,REG0
	MOVFF	TempRam13,REG1
	CALL	Fun_Math_Hex3_Bcd
;---
	MOVLW	00H
	XORWF	TempRam3,W
	BTFSS	STATUS,Z
	GOTO	Fun_user_DispLbOz_oz0
	MOVFL	TempRam3,Disp_No
	
Fun_user_DispLbOz_oz0:
	MOVFW	TempRam3
    CALL	Table_Lcd_Num
    IORWF	Display3,F
    
    MOVFW	TempRam4
    CALL	Table_Lcd_Num
    IORWF	Display4,F
    
    MOVFW	TempRam5
    CALL	Table_Lcd_Num
    IORWF	Display5,F

Fun_user_DispLbOz_Char:
	BSF		Display6,B_Display6_col1
	CLRF	DisplayPoint
	BSF		DisplayPoint,0
Fun_user_DispLbOz_END:
	
RETURN

.ends
