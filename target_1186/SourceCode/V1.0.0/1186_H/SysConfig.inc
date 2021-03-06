﻿;---------------------------------------------
;---- SysConfig.inc
;---------------------------------------------

;*********************************************
;**** 芯片特殊功能寄存器设定
;*********************************************
;--- io 
	AIENB_CFG_VALUE		EQU  00001000B
	PT1EN_CFG_VALUE		EQU  00000000B
	PT1PU_CFG_VALUE		EQU  11111111B
	PT1_CFG_VALUE		EQU  11111111B

	PT2EN_CFG_VALUE		EQU  00000000B
	PT2PU_CFG_VALUE		EQU  11111111B
	PT2_CFG_VALUE		EQU	 11111111B
	
	PT2MR_CFG_VALUE		EQU  00000000B
	PT2CON_CFG_VALUE	EQU  00000000B
	
	PTINT_CFG_VALUE		EQU  00000010B
	AIENB2_CFG_VALUE	EQU  00000000B
	

;--- WDT
	WDTCON_CFG_VALUE	EQU  10001011B   ; TIMEOUT 1S
	
;--- CLK
	MCK_CFG_VALUE		EQU	 00000100B   ; M3_CK=1,M2_CK=1,M1_CLK=0  [CPU 1000khz]
	MCK2_CFG_VALUE		EQU	 00000010B
	PCK_CFG_VALUE		EQU	 0
	
;--- TIMER
    TMCON_USE			EQU  1
	TMCON_CFG_VALUE		EQU  00001100B	; TMCLK/4 = 3906HZ/4 = 976.5HZ ,1/32S 
	
;--- power 	
	NETE_CFG_VALUE		EQU  10000010B   ; LDO 2.45  ,VDD 2.4V
	NETF_CFG_VALUE		EQU  00100011B   ; ENVDDA = 1,ENVB = 1

;--- ADC
	ADCON_CFG_VALUE		EQU  00000111B   ; 250K,/8192
	NETA_CFG_VALUE		EQU  00000000B   ; AI0,AI1->ADC
	NETC_CFG_VALUE		EQU  00000110B   ; 64X,AD_EN=1
	TEMPC_CFG_VALUE		EQU  11100000B
	
;--- LCD
    NETD_CFG_VALUE      EQU  00000111B   ; 2.8V , 10K REF
    LCDENR_CFG_VALUE    EQU  10100111B   ; ,1/3 BIAS, 1/4 DUTY

;--- UART(No use)
    UART_EN             EQU  0
	SCON1_CFG_VALUE		EQU  0
	SCON2_CFG_VALUE		EQU  0

	
;*********************************************
;**** 程序功能模块对应的参数定义
;*********************************************
;--- 上电默认单位
    DEFAULT_UNIT		EQU  B_ScaleUnit_KG
    UNIT_MAX			EQU	 08H
    
;--- WEIGHT C IS ENABLE
    WEIGHT_C_EN			EQU	 0
    
    
;--- 50KG 对应的点数,50.0KG/0.1KG   = 500 
	COUNT_DOT			EQU	 500
	START_COUNT			EQU  50
	MEM_COUNT			EQU  3
	MAX_COUNT			EQU  1531
	UNLOCK_COUNT		EQU  100
	TRACK_ZERO_CNT		EQU	 3
	
;--- 50KG 对应的点数,50.00KG/0.05KG = 1000
;	COUNT_DOT			EQU	 1000
;	START_COUNT			EQU  100
;	MEM_COUNT			EQU  6-1
;	MAX_COUNT			EQU  3062
;	UNLOCK_COUNT		EQU  200

;--- ADC 滤波系数
	PRO_ADC_WINDOWN		EQU  20
	PRO_ADC_STABLE_RANG	EQU  5
	PRO_ADC_STABLE_TIME	EQU  5
	
;--- 重量开机参数设定(按点计算)
	WEIGHT_ON_MODE			EQU	0
	WEIGHT_ON_CONT_FAST		EQU	43  ;4.3kg/0.1kg=43
	WEIGHT_ON_CONT_SLOW		EQU	47	;4.7kg/0.1kg=47
	WEIGHT_DOWN_CONT		EQU	21	;2.1kg/0.1kg=21
	WEIGHT_ON_FAST_UP_CNT	EQU	5
	WEIGHT_ON_SLOW_UP_CNT	EQU	5
	WEIGHT_DOWN_CNT			EQU	3
	

;--- 标定时，第一标定点通过的ADC变化量阀值
	CALDOT1_ADC_THRESHOLD	EQU		500

;--- KEY,有效按键位定义,最多支持8个独立按键
	KEY_USED_BITS		EQU		00000001B
		B_KEY_UNIT		EQU		0
		
	KEY_UNIT_PORT		EQU		PT2
	KEY_UNIT_PIN		EQU     0
	
	KEY_LONG_TIME       EQU		34	;	33*30MS


