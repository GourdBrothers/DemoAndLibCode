;---------------------------------------------
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
    DEFAULT_UNIT		EQU  B_ScaleUnit_G
    UNIT_MAX			EQU	 020H
    
;--- 重量处理相关系数
	COUNT_DIVIDE		EQU	  2		; 只能在1，2，3中选择,1 为1点称重(标定)
									;					  2 为2点称重(标定)
									;					  3 为3点称重(标定)
	CAL_COUNT_1			EQU		2000
	CAL_COUNT_2			EQU		5000
	CAL_COUNT_3			EQU		8000
	START_COUNT			EQU		18
	MEM_COUNT			EQU		7
	MIN_DISP_COUNT		EQU		2
	MAX_COUNT			EQU		5101
	TARE_COUNT			EQU		100
	OUTZ_COUNT			EQU		1000
	TRACK_ZERO_CNT		EQU		3
	
	TARE_MODE			EQU		1	; 1, ADC稳定时去皮; 2, 立即去皮; 3, 延时去皮
	TARE_DELAY_CNT		EQU		3   ; N * [ADC Filter OUTPUT TIME]

;--- ADC 滤波系数
	PRO_ADC_WINDOWN		EQU		10
	PRO_ADC_STABLE_RANG	EQU		3
	PRO_ADC_STABLE_TIME	EQU		4

;--- KEY,有效按键位定义,最多支持8个独立按键
	KEY_USED_BITS		EQU		00000001B
		B_KEY_UNIT		EQU		0
	KEY_UNIT_PORT		EQU		PT2
	KEY_UNIT_PIN		EQU     0
	KEY_LONG_TIME       EQU		34	;	33*30MS
	
;--- OTP标定数据存入	
	OTP_ADDR_BASE		EQU		05H
    OTP_ADDR_BASE_H		EQU		HIGH OTP_ADDR_BASE
    OTP_ADDR_BASE_L		EQU		LOW  OTP_ADDR_BASE
    BIE_DATA_NUM		EQU		9
	MaxCalTimes			EQU		20
