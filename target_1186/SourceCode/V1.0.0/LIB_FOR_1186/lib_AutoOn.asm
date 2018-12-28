/**
* @file     lib_Auto.ASM
* @brief 
* @author
* @date     2018-12-27
* @version  V1.0.0
* @copyright
*/

lib_Auto_RAM .section bank0,ADDR=0x80

DownADH		DS	1  ; FOR AUTO ON
DownADM		DS	1
DownADL		DS	1

AutoOnADH	DS	1
AutoOnADM	DS	1
AutoOnADL	DS	1

AutoOnWH	DS	1
AutoOnWM	DS	1
AutoOnWL	DS	1

.ends


B_REG2_WdtTrackB	EQU		0
B_REG2_WdtTrackS	EQU		1


lib_Auto_ROM .section rom

Fun_ScanWeihgt:




Fun_ScanWeihgtCfg:
	BCF		NETC,ADEN
	
	MOVLW	NETE_CFG_VALUE
	MOVWF	NETE
	
	MOVLW	NETF_CFG_VALUE
    MOVWF	NETF
    
	MOVLW	00000001B   ; 64X,250K,/128=1.953KHZ
	MOVWF	ADCON
	
	BCF		NETE,ENLB
	

	MOVLW	50
	MOVWF	REG0
Fun_ScanWeihgtCfg_NOPS1:
	DECFSZ	REG0 ,F
	GOTO	Fun_ScanWeihgtCfg_NOPS1
	
	MOVLW	00000110B
	MOVWF	NETC
	
	MOVLW	10
	MOVWF	REG0
Fun_ScanWeihgtCfg_NOPS2:
	DECFSZ	REG0 ,F
	GOTO	Fun_ScanWeihgtCfg_NOPS2
	
	CLRF	INTE
	BSF		INTE, ADIE
	BSF		INTE, GIE
	
	CLRF	ScaleFlag1
	BSF		ScaleFlag1,B_ScaleFlag1_AdcStart
	CLRF	AdcSampleTimes
	BSF		ScaleFlag3,B_ScaleFlag3_WdtAdc
Fun_ScanWeihgtCfg_END:


	MOVLW	05H
	MOVWF	REG0
	MOVLW	03H
	MOVWF	REG1
	CLRF	REG2

Fun_ScanWeihgt_LOOP:
	CLRWDT
	BCF		ScaleFlag1,B_ScaleFlag1_AdcInt
	HALT
	NOP
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcInt
	GOTO	Fun_ScanWeihgt_LOOP
	
; CHECK FIRST ADC
	MOVFW	AutoOnADL
	SUBWF	ADRamL, W
	MOVFW	AutoOnADM
	SUBWFC	ADRamM, W
	MOVFW	AutoOnADH
	SUBWFC	ADRamH, W
	BTFSC	STATUS,	C
	GOTO	Fun_ScanWeihgt_up
	
Fun_ScanWeihgt_down:
	BTFSC	REG2,B_REG2_WdtTrackB
	GOTO	Fun_ScanWeihgt_SLEEP
	MOVFW	DownADL
    SUBWF	ADRamL, W
    MOVFW	DownADM
    SUBWFC	ADRamM, W
    MOVFW	DownADH
    SUBWFC	ADRamH, W
    BTFSC	STATUS, C
	GOTO	Fun_ScanWeihgt_SLEEP
	BSF		REG2,B_REG2_WdtTrackS
Fun_ScanWeihgt_downCnt:
	BTFSS	SysFlag1,B_SysFlag1_OnWeight
	GOTO	Fun_ScanWeihgt_SLEEP
	DECFSZ	REG1,F
	GOTO	Fun_ScanWeihgt_LOOP
	BCF		SysFlag1,B_SysFlag1_OnWeight
	GOTO	Fun_ScanWeihgt_SLEEP
	
Fun_ScanWeihgt_up:
	BTFSC	REG2,B_REG2_WdtTrackS
	GOTO	Fun_ScanWeihgt_SLEEP
	BSF		REG2,B_REG2_WdtTrackB
	BTFSC	SysFlag1,B_SysFlag1_OnWeight
	GOTO	Fun_ScanWeihgt_SLEEP
	DECFSZ	REG0,F
	GOTO	Fun_ScanWeihgt_LOOP
	
; check second adc
Fun_ScanWeihgt_Second:
	MOVLW   00000011B
    MOVWF   ADCON
    
    CLRF	ScaleFlag1
	BSF		ScaleFlag1,B_ScaleFlag1_AdcStart
	CLRF	AdcSampleTimes
	
	MOVLW	05H
	MOVWF	REG0
Fun_ScanWeihgt_Second_LOOP:
	CLRWDT
	BCF		ScaleFlag1,B_ScaleFlag1_AdcInt
	HALT
	NOP
	BTFSS	ScaleFlag1,B_ScaleFlag1_AdcInt
	GOTO	Fun_ScanWeihgt_Second_LOOP
;
	MOVFW	AutoOnWL
	SUBWF	ADRamL, W
    MOVFW	AutoOnWM
	SUBWFC	ADRamM, W
    MOVFW	AutoOnWH
	SUBWFC	ADRamH, W
    BTFSS	STATUS,C
    GOTO	Fun_ScanWeihgt_SLEEP
    
	DECFSZ	REG0,F
	GOTO	Fun_ScanWeihgt_Second_LOOP

	BCF		INTE,ADIE
	BCF		INTE,GIE
	;BCF		NETC,ADEN
Fun_ScanWeihgt_ON:
	BSF		SysFlag1,B_SysFlag1_WakeUp
	GOTO	Fun_ScanWeihgt_END
	
Fun_ScanWeihgt_SLEEP:
	BCF		SysFlag1,B_SysFlag1_WakeUp
	GOTO	Fun_ScanWeihgt_END

Fun_ScanWeihgt_END:
RETURN

; 第二点开机重量对应内码计算
Fun_GetAutoOnADC_Second:
    BCF         BSR  , IRP0
    MOVLW		AutoOnWH
    MOVWF       FSR0
    MOVLW       47
    GOTO        Fun_GetWeight_ADC
    
; 下秤重量对应内码计算
Fun_GetAutoDownADC:
    BCF         BSR , IRP0
    MOVLW		DownADH
    MOVWF       FSR0 
    MOVLW       21
    GOTO        Fun_GetWeight_ADC

; 第一点开机重量对应内码计算
Fun_GetAutoOnADC_First:
    BCF         BSR,IRP0
    MOVLW		AutoOnADH
    MOVWF       FSR0
    MOVLW       43
	
Fun_GetWeight_ADC:
    MOVWF       TempRam13
	CLRF		TempRam12
	CLRF        TempRam11
	CLRF		TempRam4
	MOVFW		CalDot1H
	MOVWF		TempRam5
	MOVFW		CalDot1L
	MOVWF		TempRam6
	CALL		Fun_Math_Mul3_3
	CLRF		TempRam11
	MOVLW		HIGH	COUNT_DOT
	MOVWF		TempRam12
	MOVLW		LOW		COUNT_DOT
	MOVWF		TempRam13
	CALL		Fun_Math_Div6_3

	MOVFW       ZeroL
	ADDWF       TempRam6,F
	MOVFW       ZeroM
	ADDWFC      TempRam5,F
	MOVFW       ZeroH
	ADDWFC      TempRam4,F

	MOVFW		TempRam4
	MOVWF       INDF0
	INCF        FSR0,F
	MOVFW		TempRam5
	MOVWF       INDF0
	MOVFW		TempRam6
	INCF        FSR0,F
	MOVWF       INDF0
	
RETURN


Fun_GetAutoOnADC:	
	CALL		Fun_GetAutoOnADC_First
	CALL		Fun_GetAutoOnADC_Second
	CALL		Fun_GetAutoDownADC
RETURN

.ends
