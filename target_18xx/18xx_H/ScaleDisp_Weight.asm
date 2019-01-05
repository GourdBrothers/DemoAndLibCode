/**
* @file     ScaleDisp_Weight.ASM
* @brief 
* @author
* @date     2018-12-27
* @version  V1.0.0
* @copyright
*/

;ScaleDisp_Weight_ROM	.section	rom

ScaleDisp_Weight_ENTRY:
	CLRF	TempRam4
	MOVFW	CountH
	MOVWF   TempRam5
	MOVFW	CountL
    MOVWF   TempRam6
	
	BTFSS	ScaleFlag1,B_ScaleFlag1_Lock
	GOTO	ScaleDisp_W
	
	BTFSS	ScaleFlag2,B_ScaleFlag2_LockFlashEN
	GOTO	ScaleDisp_W_LOCK
	
	BTFSS	ScaleFlag2,B_ScaleFlag2_LockFlash
	GOTO	ScaleDisp_Weight_EXIT
	
ScaleDisp_W_LOCK:
	MOVFW	LockCountH
	MOVWF   TempRam5
	MOVFW	LockCountL
    MOVWF   TempRam6

ScaleDisp_W:

	BTFSC	ScaleUnit,B_ScaleUnit_KG
	GOTO	ScaleDisp_W_Kg
	BTFSC	ScaleUnit,B_ScaleUnit_LB
	GOTO	ScaleDisp_W_Lb
	BTFSC	ScaleUnit,B_ScaleUnit_ST
	GOTO	ScaleDisp_W_St

ScaleDisp_W_Kg:
	CLRF	TempRam11
	MOVFW	TempRam5
	MOVWF	TempRam12
	MOVFW	TempRam6
	MOVWF	TempRam13
	CALL	Fun_Math_Hex3_Bcd
	CALL	Fun_LED_USER_Num
ScaleDisp_W_Kg_Char:
	BSF		Display3,B_Display3_P 
	BSF		Display5,B_Display5_KG
ScaleDisp_W_Kg_END:
	GOTO	ScaleDisp_Weight_EXIT

ScaleDisp_W_Lb:
	CALL	Fun_User_CountKgToLb
	CLRF	TempRam11
	MOVFW	TempRam5
	MOVWF	TempRam12
	MOVFW	TempRam6
	MOVWF	TempRam13
	CALL	Fun_Math_Hex3_Bcd
	CALL	Fun_LED_USER_Num
ScaleDisp_W_Lb_Char:
	BSF		Display3,B_Display3_P 
	BSF		Display5,B_Display5_LB
ScaleDisp_W_Lb_END:
	GOTO	ScaleDisp_Weight_EXIT

ScaleDisp_W_St:
	CALL	Fun_User_CountKgToLb
	CLRF	TempRam1
	CLRF	TempRam2
	CLRF	TempRam3
	CLRF	TempRam11
	CLRF	TempRam12
	MOVLW	140
	MOVWF	TempRam13
	CALL	Fun_Math_Div6_3
	MOVFW	TempRam2
	MOVWF	REG0
	MOVFW	TempRam3
	MOVWF	REG1

	CLRF	TempRam11
	MOVFW	TempRam5
	MOVWF	TempRam12
	MOVFW	TempRam6
	MOVWF	TempRam13
	CALL	Fun_Math_Hex3_Bcd
	
    MOVLW	00H
    XORWF	TempRam5,W
    BTFSS	STATUS,Z
    GOTO	ScaleDisp_W_St0
    MOVLW	Disp_No
    MOVWF	TempRam5
    
ScaleDisp_W_St0:
	MOVFW	TempRam5
    CALL	Table_LED_Num
    IORWF	Display1,F

    MOVFW	TempRam6
    CALL	Table_LED_Num
    IORWF	Display2,F
    
ScaleDisp_W_St_lb:
	CLRF	TempRam11
	MOVFW	REG0
	MOVWF	TempRam12
	MOVFW	REG1
	MOVWF	TempRam13
	CALL	Fun_Math_Hex3_Bcd
	
	MOVLW	00H
    XORWF	TempRam4,W
    BTFSS	STATUS,Z
    GOTO	ScaleDisp_W_St_lb0
    MOVLW	Disp_No
    MOVWF	TempRam4
    
ScaleDisp_W_St_lb0:	
	
	MOVFW	TempRam4
    CALL	Table_LED_Num
    IORWF	Display3,F

    MOVFW	TempRam5
    CALL	Table_LED_Num
    IORWF	Display4,F
	
ScaleDisp_W_St_Char:
	BSF		Display2,B_Display2_COL  
	BSF		Display5,B_Display5_ST
ScaleDisp_W_St_END:

ScaleDisp_Weight_EXIT:

;.ends
