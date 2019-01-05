
/**
* @file  LCD_Funs.ASM
* @brief 
* @author
* @date     2018-12-22
* @version  V1.0.0
* @copyright
*/
	
; DEFINE 	
	SEG_F       EQU       10000000B
    SEG_G       EQU       01000000B
    SEG_E       EQU       00100000B
    SEG_D       EQU       00010000B
    SEG_A       EQU       00001000B
    SEG_B       EQU       00000100B
    SEG_C       EQU       00000010B
	
	Ledch0      EQU       SEG_A+SEG_B+SEG_C+SEG_D+SEG_E+SEG_F
	Ledch1	    EQU       SEG_B+SEG_C
	Ledch2	    EQU       SEG_A+SEG_B+SEG_D+SEG_E+SEG_G
	Ledch3	    EQU       SEG_A+SEG_B+SEG_C+SEG_D+SEG_G
	Ledch4	    EQU       SEG_B+SEG_C+SEG_F+SEG_G
	Ledch5	    EQU       SEG_A+SEG_C+SEG_D+SEG_F+SEG_G
	Ledch6	    EQU       SEG_A+SEG_C+SEG_D+SEG_E+SEG_F+SEG_G
	Ledch7	    EQU       SEG_A+SEG_B+SEG_C
	Ledch8	    EQU       SEG_A+SEG_B+SEG_C+SEG_D+SEG_E+SEG_F+SEG_G
	Ledch9	    EQU       SEG_A+SEG_B+SEG_C+SEG_D+SEG_F+SEG_G
	LedchNo	    EQU       00H
	LedchA	    EQU       SEG_A+SEG_B+SEG_C+SEG_E+SEG_F+SEG_G
	Ledchb	    EQU       SEG_C+SEG_D+SEG_E+SEG_F+SEG_G
	LedchC	    EQU       SEG_A+SEG_D+SEG_E+SEG_F
	Ledchd	    EQU       SEG_B+SEG_C+SEG_D+SEG_E+SEG_G
	LedchE	    EQU       SEG_A+SEG_D+SEG_E+SEG_F+SEG_G
	LedchF	    EQU       SEG_A+SEG_E+SEG_F+SEG_G
	LedchH      EQU       SEG_B+SEG_C+SEG_E+SEG_F+SEG_G
	LedchL	    EQU       SEG_D+SEG_E+SEG_F
	LedchN	    EQU       SEG_A+SEG_B+SEG_C+SEG_E+SEG_F
	Ledcho	    EQU       SEG_C+SEG_D+SEG_E+SEG_G
	LedchP	    EQU       SEG_A+SEG_B+SEG_E+SEG_F+SEG_G
	Ledchr	    EQU       SEG_E+SEG_G
	LedchT	    EQU       SEG_D+SEG_E+SEG_F+SEG_G
	LedchU	    EQU       SEG_B+SEG_C+SEG_D+SEG_E+SEG_F
	LedchBar    EQU       SEG_G

	Disp_No     EQU       10	


MOVFL	.macro F,D
	MOVLW	D
	MOVWF	F
.endm

MOVFF	.macro F1,F2
	MOVFW	F1
	MOVWF	F2
.endm

; RAM DEFINE 
XCWK_LED_RAM	.section	BANK0

	R_LED_1    DS  1
	R_LED_2    DS  1
	R_LED_3    DS  1
	R_LED_4    DS  1
	R_LED_5    DS  1
	R_LED_6    DS  1
	R_LED_7    DS  1
	
.ends


XCWK_LCD_ROM	.section	rom

;**************************************************
; Fun    : TempRam3/4 += TempRam5/6
; input	 : TempRam3/4/5/6
; output : TempRam3/4
;**************************************************
Table_LED_Num:
	ADDPCW
	RETLW         Ledch0
	RETLW         Ledch1
	RETLW         Ledch2
    RETLW         Ledch3
    RETLW         Ledch4
    RETLW         Ledch5
    RETLW         Ledch6
    RETLW         Ledch7
    RETLW         Ledch8
    RETLW         Ledch9
    RETLW         LedchNo
	
;**************************************************
; 
;**************************************************
Fun_LED_Init:
    BCF         INTE    ,TM1IE
    MOVFL       LEDCON1 ,LEDCON1_CFG_VALUE
	CLRF        LEDCON2
	CLRF        CHPCON
	MOVFL       LEDTEST1,LEDTEST1_CFG_VALUE
	MOVFL       PT2EN   ,11111111B
	CLRF        PT2PU
	CLRF        PT2
    MOVFL       TM1IN   ,TM1IN_CFG_VALUE
	MOVFL       TM1CON  ,TM1CON_CFG_VALUE
	BSF         INTE    ,TM1IE
RETURN

;**************************************************
; 
;**************************************************
Fun_LED_Close:
    BCF         INTE  ,TM1IE
	CLRF        TM1CON
    CLRF        LEDCON1
	CLRF        LEDCON2
	CLRF        CHPCON
	CLRF        LEDTEST1
	MOVFL       PT2EN,11111111B
	CLRF        PT2PU
	CLRF        PT2
RETURN

;**************************************************
; 
;**************************************************
Fun_LED_Load:
	CLRF	R_LED_1
	CLRF	R_LED_2
	CLRF	R_LED_3
	CLRF	R_LED_4
	CLRF	R_LED_5
	CLRF	R_LED_6
	CLRF	R_LED_7
Fun_LED_Load_SetBits:
    GOTO    Fun_LED_USER_SetBits
Fun_LED_Load_REG:
    MOVFF	LED1,R_LED_1
    MOVFF	LED2,R_LED_2
    MOVFF	LED3,R_LED_3
    MOVFF	LED4,R_LED_4
    MOVFF	LED5,R_LED_5
    MOVFF	LED6,R_LED_6
    MOVFF	LED7,R_LED_7
RETURN

.ends
