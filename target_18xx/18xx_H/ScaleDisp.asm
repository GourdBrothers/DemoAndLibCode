/**
* @file     ScaleDisp.ASM
* @brief 
* @author
* @date     2018-12-27
* @version  V1.0.0
* @copyright
*/

;ScaleDisp_ROM .section	rom

Scale_Disp_Entry:
	CALL	Fun_LED_ResetAllBuf
	
Scale_Disp_LowBat:	
	BTFSS	ScaleFlag3,B_ScaleFlag3_Lo
	GOTO	Scale_Disp_LowBat_END
	MOVLW	LedchL
	MOVWF	Display2
	MOVLW	Ledcho
	MOVWF	Display3
	GOTO	Scale_Disp_LOAD
Scale_Disp_LowBat_END:

Scale_Disp_FLOW:
	BTFSC	ScaleFlow,B_ScaleFlow_ZERO
	GOTO	Scale_Disp_Zero
	BTFSC	ScaleFlow,B_ScaleFlow_WEIGHT
	GOTO	Scale_Disp_Weight
	BTFSC	ScaleFlow,B_ScaleFlow_CAL
	GOTO	Scale_Disp_CAL
	GOTO	Scale_Disp_LOAD

Scale_Disp_Zero:
	CALL	Fun_LED_SetAllBuf
Scale_Disp_Zero_END:
	GOTO	Scale_Disp_LOAD

Scale_Disp_Weight:

Scale_Disp_W_Unst:
	;GOTO	Scale_Disp_Weight_END
Scale_Disp_W_Unst_END:

Scale_Disp_W_NEG:
	BTFSS	ScaleFlag1,B_ScaleFlag1_Neg
	GOTO	Scale_Disp_W_NEG_END
	CLRF	CountH
	CLRF	CountL
Scale_Disp_W_NEG_END:

Scale_Disp_W_oL:
	BTFSS	ScaleFlag1,B_ScaleFlag1_oL
	GOTO	Scale_Disp_W_oL_END
	MOVLW	Ledcho
	MOVWF	Display2
	MOVLW	LedchL
	MOVWF	Display3
	GOTO	Scale_Disp_Weight_END
Scale_Disp_W_oL_END:

Scale_Disp_W_Normal:
	INCLUDE "ScaleDisp_Weight.ASM"
Scale_Disp_Weight_END:
	GOTO	Scale_Disp_LOAD

Scale_Disp_CAL:
	INCLUDE "ScaleDisp_Cal.ASM"
Scale_Disp_CAL_END:
;	GOTO	Scale_Disp_LOAD

Scale_Disp_LOAD:
	CALL	Fun_LED_Load
	
Scale_Disp_Exit:

;.ends
