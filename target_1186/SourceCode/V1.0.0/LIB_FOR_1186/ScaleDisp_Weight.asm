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
	CALL	Fun_LCD_USER_Num
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
	CALL	Fun_LCD_USER_Num
ScaleDisp_W_Lb_Char:
	BSF		Display3,B_Display3_P 
	BSF		Display5,B_Display5_LB
ScaleDisp_W_Lb_END:
	GOTO	ScaleDisp_Weight_EXIT

ScaleDisp_W_St:
	CLRF	TempRam11
	MOVFW	TempRam5
	MOVWF	TempRam12
	MOVFW	TempRam6
	MOVWF	TempRam13
	CALL	Fun_Math_Hex3_Bcd
	CALL	Fun_LCD_USER_Num
ScaleDisp_W_St_Char:
	BSF		Display3,B_Display3_P 
	BSF		Display5,B_Display5_ST
ScaleDisp_W_St_END:

ScaleDisp_Weight_EXIT:

;.ends
