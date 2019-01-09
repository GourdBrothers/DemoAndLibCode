/**
* @file     ScaleDisp_Weight.ASM
* @brief 
* @author
* @date     2019-01-07
* @version  V1.0.0
* @copyright
*/

ScaleDisp_Weight_ENTRY:
	MOVFW	Unit_Point
	MOVWF	DisplayPoint
	
	BTFSS	ScaleUnit,B_ScaleUnit_LBOZ
	GOTO	ScaleDisp_WeightNum
ScaleDisp_WeightLbOz:
	CALL	Fun_user_DispLbOz
	GOTO	ScaleDisp_WeightChar
		
ScaleDisp_WeightNum:
	CLRF	TempRam11
	MOVFW	CountH
	MOVWF	TempRam12
	MOVFW	CountL
	MOVWF	TempRam13
	CALL	Fun_Math_Hex3_Bcd
	CALL	Fun_LCD_USER_Num
	
ScaleDisp_WeightChar:
	BTFSC	ScaleFlag1,B_ScaleFlag1_Neg
	BSF		Display6,B_Display6_s1
	
	BTFSC	ScaleFlag1,B_ScaleFlag1_TARE
	BSF		Display6,B_Display6_tare
	
	BTFSC	ScaleUnit,B_ScaleUnit_G	
	BSF		Display6,B_Display6_g
	
	BTFSC	ScaleUnit,B_ScaleUnit_OZ	
	BSF		Display6,B_Display6_oz
	
	BTFSC	ScaleUnit,B_ScaleUnit_LBOZ
	BSF		Display6,B_Display6_lb
	
	BTFSC	ScaleUnit,B_ScaleUnit_LBOZ
	BSF		Display6,B_Display6_oz
	
	BTFSC	ScaleUnit,B_ScaleUnit_ML
	BSF		Display5,B_Display5_ml
	
	BTFSC	ScaleUnit,B_ScaleUnit_FLOZ
	BSF		Display6,B_Display6_oz
	BTFSC	ScaleUnit,B_ScaleUnit_FLOZ
	BSF		Display6,B_Display6_fl
	
ScaleDisp_WeightPoint:
	BTFSC	DisplayPoint,0
	BSF		Display4,B_Display4_P4
	BTFSC	DisplayPoint,1
	BSF		Display3,B_Display3_P3
	BTFSC	DisplayPoint,2
	BSF		Display2,B_Display2_P2

ScaleDisp_Weight_EXIT:
