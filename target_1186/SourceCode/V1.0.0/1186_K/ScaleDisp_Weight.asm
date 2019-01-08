/**
* @file     ScaleDisp_Weight.ASM
* @brief 
* @author
* @date     2019-01-07
* @version  V1.0.0
* @copyright
*/

ScaleDisp_Weight_ENTRY:

	CLRF	TempRam11
	MOVFW	CountH
	MOVWF	TempRam12
	MOVFW	CountL
	MOVWF	TempRam13
	CALL	Fun_Math_Hex3_Bcd
	CALL	Fun_LCD_USER_Num

ScaleDisp_Weight_EXIT:
