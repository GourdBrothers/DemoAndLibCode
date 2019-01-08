/**
* @file  lib_ISR.ASM
* @brief 
* @author
* @date     2018-12-22
* @version  V1.0.0
* @copyright
*/

lib_ISR_MOVFF .macro  F1,F2
	MOVFW	F2
	MOVWF	F1
.endm

/*
 * RAM define 
 */
lib_ISR_RAM .section BANK0
	WorkRegBank  ds   1
	StatusBank   ds   1
	Fsr0Bank     ds   1
	Fsr1Bank     ds   1
	BSRBank      ds   1
.ends

/*
 *  ROM CODE 
 */
lib_ISR_ROM .section rom

SYS_ISR_ENTRY:
    MOVWF			WorkRegBank
    lib_ISR_MOVFF	StatusBank,STATUS
	lib_ISR_MOVFF	Fsr0Bank  ,FSR0
	lib_ISR_MOVFF	Fsr1Bank  ,FSR1
	lib_ISR_MOVFF	BSRBank   ,BSR
SYS_ISR_SourceCHK:
    BTFSC			INTF,E0IF
    GOTO			SYS_ISR_INT0
    BTFSC			INTF,E1IF
    GOTO			SYS_ISR_INT1
    BTFSC			INTF,TMIF
    GOTO			SYS_ISR_TM
    BTFSC			INTF,ADIF
    GOTO			SYS_ISR_ADC
    BTFSC			INTF2,URRIF
    GOTO			SYS_ISR_URR
    BTFSC			INTF2,URTIF
    GOTO			SYS_ISR_URT
    CLRF			INTF
    CLRF			INTF2
SYS_ISR_ENTRY_EXIT:
	lib_ISR_MOVFF	BSR   ,BSRBank
    lib_ISR_MOVFF	FSR1  ,Fsr1Bank
	lib_ISR_MOVFF	FSR0  ,Fsr0Bank
    lib_ISR_MOVFF	STATUS,StatusBank
    MOVFW			WorkRegBank
RETFIE

SYS_ISR_INT0:
	BCF				INTF,E0IF
	GOTO            User_ISR_INT0
SYS_ISR_INT0_EXIT:
	GOTO			SYS_ISR_ENTRY_EXIT
	
SYS_ISR_INT1:
	BCF				INTF,E1IF
	GOTO            User_ISR_INT1
SYS_ISR_INT1_EXIT:
	GOTO			SYS_ISR_ENTRY_EXIT
	
SYS_ISR_TM:
    BCF				INTF,TMIF
    GOTO            User_ISR_TM
SYS_ISR_TM_EXIT:
	GOTO			SYS_ISR_ENTRY_EXIT

SYS_ISR_ADC:
    BCF				INTF,ADIF

;--- 
ISR_ADC:
    BCF         INTF,ADIF
;   
	BTFSC       ScaleFlag1,B_ScaleFlag1_AdcInt
	GOTO        ISR_ADC_END
    INCF        AdcSampleTimes,F
ISR_ADC_DIS3:
    BTFSS       ScaleFlag1,B_ScaleFlag1_AdcStart
	GOTO        ISR_ADC_1
	MOVLW       003H
	SUBWF       AdcSampleTimes,W
	BTFSS       STATUS,C
	GOTO        ISR_ADC_END
	BCF		    ScaleFlag1,B_ScaleFlag1_AdcStart
	CLRF		AdcSampleTimes
	CLRF		AD_Temp0
	CLRF		AD_Temp1
	CLRF		AD_Temp2
	CLRF		AD_Temp3
	GOTO        ISR_ADC_END
ISR_ADC_1:
	MOVFW		ADOH
    MOVWF		ADRamH
    MOVFW		ADOL
    MOVWF		ADRamM
    MOVFW		ADOLL
    MOVWF		ADRamL
    
	MOVLW       080H
	XORWF       ADRamH,F
;--- 称重ADC处理
ISR_ADC_2:
    MOVFW		ADRamL
    ADDWF		AD_Temp3, F
    MOVFW		ADRamM
    ADDWFC		AD_Temp2, F
    MOVFW		ADRamH
    ADDWFC		AD_Temp1, F
    MOVLW		00H
    ADDWFC		AD_Temp0, F
    MOVLW       008H
	SUBWF       AdcSampleTimes,W
	BTFSS       STATUS,C
	GOTO        ISR_ADC_END
    CLRF		AdcSampleTimes
ISR_ADC_Shfit:
    MOVLW       09H        ; 6+3
    MOVWF       AdcCount
ISR_ADC_Shfit_LOOP:
    BCF		    STATUS, C
    RRF		    AD_Temp0, F
    RRF		    AD_Temp1, F
    RRF		    AD_Temp2, F
    RRF		    AD_Temp3, F
    DECFSZ      AdcCount,F
	GOTO        ISR_ADC_Shfit_LOOP
	MOVFW		AD_Temp1
    MOVWF		H_DATA
    MOVFW		AD_Temp2
    MOVWF		M_DATA
    MOVFW		AD_Temp3
    MOVWF		L_DATA
    CLRF		AD_Temp0
    CLRF		AD_Temp1
    CLRF		AD_Temp2
    CLRF		AD_Temp3
ISR_ADC_3:
    BSF		    ScaleFlag1,B_ScaleFlag1_AdcInt
ISR_ADC_END:
    
SYS_ISR_ADC_EXIT:
	GOTO			SYS_ISR_ENTRY_EXIT
	
SYS_ISR_URR:
	BCF				INTF2,URRIF
SYS_ISR_URR_EXIT:
	GOTO			SYS_ISR_ENTRY_EXIT
	
SYS_ISR_URT:
	BCF				INTF2,URTIF
SYS_ISR_URT_EXIT:
	GOTO			SYS_ISR_ENTRY_EXIT
	
.ENDS
