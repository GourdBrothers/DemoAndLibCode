/**
* @file     lib_utiliy.ASM
* @brief 
* @author
* @date     2018-12-22
* @version  V1.0.0
* @copyright
*/

lib_Delay_rom .section rom

Fun_Delay_100MS:
    MOVLW	100
	GOTO	Fun_Delay_MS_comm
Fun_Delay_40MS:
    MOVLW	40
	GOTO	Fun_Delay_MS_comm
Fun_Delay_20MS:
    MOVLW	20
	GOTO	Fun_Delay_MS_comm
Fun_Delay_10MS:
    MOVLW	10
    GOTO	Fun_Delay_MS_comm
Fun_Delay_1MS:
    MOVLW	1
Fun_Delay_MS_comm:
	MOVWF	REG1
Fun_Delay_2:
    MOVLW	200
    MOVWF	REG2
Fun_Delay_2_LOOP:
    CLRWDT
    NOP                       ; 1
    NOP                       ; 1
	NOP                       ; 1
    DECFSZ	REG2,F          ; 1
	GOTO	Fun_Delay_2_LOOP  ; 1
Fun_Delay_1:
    DECFSZ	REG1,F
	GOTO	Fun_Delay_2
RETURN

Fun_power_Init:
	MOVLW	NETF_CFG_VALUE
	DW		0FFFFH
	NOP
	MOVWF	NETF
	
	MOVLW	NETE_CFG_VALUE
	DW		0FFFFH
	NOP
	MOVWF	NETE
RETURN

Fun_power_Close:
   	CLRF	NETF
RETURN

Fun_GPIO_Init:
;	MOVLW	AIENB_CFG_VALUE
;	MOVWF	AIENB
;	MOVLW	PT1EN_CFG_VALUE
;	MOVWF	PT1EN
;	MOVLW	PT1PU_CFG_VALUE
;	MOVWF	PT1PU
;	MOVLW	PT1_CFG_VALUE
;	MOVWF	PT1
;
;	MOVLW	PT2EN_CFG_VALUE
;	MOVWF	PT2EN
;	MOVLW	PT2PU_CFG_VALUE
;	MOVWF	PT2PU
;	MOVLW	PT2_CFG_VALUE
;	MOVWF	PT2
;	
;	MOVLW	PT2MR_CFG_VALUE
;	MOVWF	PT2MR
;	MOVLW	PT2CON_CFG_VALUE
;	MOVWF	PT2CON
;	
;	MOVLW	PTINT_CFG_VALUE
;	MOVWF	PTINT
;	MOVLW	AIENB2_CFG_VALUE
;	MOVWF	AIENB2
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
	GOTO		Fun_ProcAdcStart
    	
Fun_ADC_Close:
;	BCF			INTE,ADIE
;	BCF			NETC,ADEN
;	BCF			NETF,ENVDDA
;	BCF			NETF,ENVB
RETURN

Fun_TIMER_init:
;	MOVLW		TMCON_CFG_VALUE
;	MOVWF		TMCON
;	BSF			INTE,TMIE
RETURN

Fun_TIMER_close:
;	BCF			INTE,TMIE
;	BCF			TMCON,TMEN
RETURN


Fun_RAM_Zero:
	MOVWF	FSR0
Fun_RAM_Zero_Loop:
	CLRF	INDF0
	INCF    FSR0,F
	MOVLW   0FFH
	BTFSC   BSR,IRP0
	MOVLW   07FH
	SUBWF   FSR0,W
	BTFSS   STATUS,C
	GOTO    Fun_RAM_Zero_Loop
	CLRF	INDF0
RETURN


; 重量开机快速扫描ADC配置
Fun_ScanWeihgtCfg_First:
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
RETURN

; 重量开机慢速扫描ADC配置
Fun_ScanWeihgtCfg_Second:
	MOVLW   00000011B
    MOVWF   ADCON
RETURN

.ends
