/**
* @file     lib_adc.ASM
* @brief 
* @author
* @date     2018-12-22
* @version  V1.0.0
* @copyright
*/

lib_adc_MOVFF .macro  F1,F2
	MOVFW	F2
	MOVWF	F1
.endm

lib_adc_MOVFL .macro  F1,F2
	MOVFW	F2
	MOVWF	F1
.endm

/* 
 *	ram define 
 */
lib_adc_pro_RAM .section BANK0

H_DR         ds		1
M_DR         ds		1
L_DR         ds		1

H_DRBuf      ds		1
M_DRBuf      ds		1
L_DRBuf      ds		1

H_DATA       ds		1
M_DATA       ds		1
L_DATA       ds		1

H_DATAA      ds		1
M_DATAA      ds		1
L_DATAA      ds		1

H_DATAB      ds		1
M_DATAB      ds		1
L_DATAB      ds		1

H_DATAC      ds		1
M_DATAC      ds		1
L_DATAC      ds		1

ADRamH       ds		1
ADRamM       ds		1
ADRamL       ds		1

AD_Temp0     ds		1
AD_Temp1     ds		1
AD_Temp2     ds		1
AD_Temp3     ds		1

AdcCount        ds		1
AdcSampleTimes  ds		1

AdcStableCount  ds		1

.ends

/* 
 *	code section 
 */
lib_adc_pro_ROM .section rom

Fun_ProcAdc:
		lib_adc_MOVFF		TempRam1,H_DR
		lib_adc_MOVFF		TempRam2,M_DR
		lib_adc_MOVFF		TempRam3,L_DR
		lib_adc_MOVFF		TempRam4,H_DATA
		lib_adc_MOVFF		TempRam5,M_DATA
		lib_adc_MOVFF		TempRam6,L_DATA
		CALL		Fun_Math_Sub3_3
		CALL		Fun_Math_Sub3_3_Neg

		CLRF		TempRam4
		CLRF		TempRam5
		MOVLW       20
		DW          0FFFFH
		DW          0FFFFH
		NOP
		MOVWF		TempRam6
		CALL		Fun_Math_Sub3_3
		BTFSC		STATUS, C
		GOTO		Proc_Adc1
_ProcAdc0:
		lib_adc_MOVFF		TempRam11,H_DATAC
		lib_adc_MOVFF		TempRam12,M_DATAC
		lib_adc_MOVFF		TempRam13,L_DATAC 

		MOVFW		L_DATAB
		MOVWF		L_DATAC
		ADDWF		TempRam13, F

		MOVFW		M_DATAB
		MOVWF		M_DATAC
		ADDWFC		TempRam12, F

		MOVFW		H_DATAB
		MOVWF		H_DATAC
		ADDWFC		TempRam11, F
;------------------------------------------------
		MOVFW		L_DATAA
		MOVWF		L_DATAB
		ADDWF		TempRam13, F

		MOVFW		M_DATAA
		MOVWF		M_DATAB
		ADDWFC		TempRam12, F

		MOVFW		H_DATAA
		MOVWF		H_DATAB
		ADDWFC		TempRam11, F
;------------------------------------------------		
		MOVFW		L_DATA
		MOVWF		L_DATAA
		ADDWF		TempRam13, F

		MOVFW		M_DATA
		MOVWF		M_DATAA
		ADDWFC		TempRam12, F

		MOVFW		H_DATA
		MOVWF		H_DATAA
		ADDWFC		TempRam11, F

		BCF		    STATUS,C
		RRF		    TempRam11, F
		RRF		    TempRam12, F
		RRF		    TempRam13, F

		BCF		    STATUS,C
		RRF		    TempRam11, F
		RRF		    TempRam12, F
		RRF		    TempRam13, F

		lib_adc_MOVFF		H_DR,TempRam11
		lib_adc_MOVFF		M_DR,TempRam12
		lib_adc_MOVFF		L_DR,TempRam13
		GOTO		Proc_Adc2

;------------------------------------------------
Proc_Adc1:
		MOVFW		H_DATA
		MOVWF		H_DR
		MOVWF		H_DATAA
		MOVWF		H_DATAB
		MOVWF		H_DATAC

		MOVFW		M_DATA
		MOVWF		M_DR
		MOVWF		M_DATAA
		MOVWF		M_DATAB
		MOVWF		M_DATAC

		MOVFW		L_DATA
		MOVWF		L_DR
		MOVWF		L_DATAA
		MOVWF		L_DATAB
		MOVWF		L_DATAC

;------------------------------------------------
Proc_Adc2:
		lib_adc_MOVFF		TempRam4,H_DRBuf		
		lib_adc_MOVFF		TempRam5,M_DRBuf
		lib_adc_MOVFF		TempRam6,L_DRBuf

		MOVFW		H_DR
		MOVWF		H_DRBuf
		MOVWF		TempRam1

		MOVFW		M_DR
		MOVWF		M_DRBuf
		MOVWF		TempRam2

		MOVFW		L_DR
		MOVWF		L_DRBuf
		MOVWF		TempRam3

		CALL		Fun_Math_Sub3_3
		CALL		Fun_Math_Sub3_3_Neg

		CLRF		TempRam4
		CLRF		TempRam5
		MOVLW       005H
		DW          0FFFFH
		NOP
		MOVWF       TempRam6
		CALL		Fun_Math_Sub3_3
		BTFSC		STATUS, C
		GOTO		Proc_Adc_UnStable
		
		INCF		AdcStableCount, F
		MOVLW       004H
		DW          0FFFFH
		NOP
		SUBWF		AdcStableCount, W
		BTFSS		STATUS, C
		GOTO		ProcAdc_End
		DECF		AdcStableCount, F
		BSF		    ScaleFlag1,B_ScaleFlag1_AdcStable
		GOTO		ProcAdc_End
		
Proc_Adc_UnStable:
		CLRF		AdcStableCount
		BCF		    ScaleFlag1,B_ScaleFlag1_AdcStable
ProcAdc_End:
RETURN

Fun_ADC_Init:
    	MOVLW		11100000B
    	MOVWF		TEMPC
    	MOVLW		00000000B   ;AI0,AI1->ADC
    	MOVWF		NETA
    	MOVLW		00000111B   ;250K,/8192
    	MOVWF		ADCON
    	MOVLW		00000110B   ;64X,AD_EN=1
    	MOVWF		NETC
    	BSF			INTE,ADIE
    	
Fun_ADC_ProStart:
		CLRF		AdcStableCount
		CLRF        ScaleFlag1
		BSF		    ScaleFlag1,B_ScaleFlag1_AdcStart
		CLRF		AdcSampleTimes
RETURN

Fun_ADC_Close:
		BCF			INTE,ADIE
		BCF			NETC,ADEN
		BCF			NETF,ENVDDA
		BCF			NETF,ENVB
RETURN

.ends
