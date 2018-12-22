;---------------------------------------------
;---- SysConfig.inc
;---------------------------------------------

;--- sfr REG DEFINE

;--- WDT
	WDTCON_CFG_VALUE	EQU  10001011B   ; TIMEOUT 1S
	
;--- CLK
	MCK_CFG_VALUE		EQU	 00000100B
	MCK2_CFG_VALUE		EQU	 00000010B
	PCK_CFG_VALUE		EQU	 0
	
;--- TIMER
	TMCON_CFG_VALUE		EQU  00000000B
	
;--- power 	
	NETE_CFG_VALUE		EQU  10000010B   ; LDO 2.45  ,VDD 2.4V
	NETF_CFG_VALUE		EQU  00100011B   ; ENVDDA = 1,ENVB = 1

;--- ADC
	ADCON_CFG_VALUE		EQU  00000111B   ;250K,/8192
	NETA_CFG_VALUE		EQU  00000000B   ;AI0,AI1->ADC
	NETC_CFG_VALUE		EQU  00000110B   ;64X,AD_EN=1
	TEMPC_CFG_VALUE		EQU  11100000B
	
;--- LCD	
    NETD_CFG_VALUE      EQU  00000111B   ; 2.8V , 10K REF
    LCDENR_CFG_VALUE    EQU  10100111B   ; ,1/3 BIAS, 1/4 DUTY

;--- UART
	SCON1_CFG_VALUE		EQU  0
	SCON2_CFG_VALUE		EQU  0
	
;--- default unit
    DEFAULT_ScaleUnit   EQU  B_ScaleUnit_KG


