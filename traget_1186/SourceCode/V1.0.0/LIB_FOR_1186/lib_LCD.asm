;---------------------------------------------
;---- LCD_Funs.ASM
;---- 4*14( or 4*12)
;---------------------------------------------
	INCLUDE		"LCD_Define.INC"
	
; DEFINE 	
	SEG_F       EQU       10000000B
    SEG_G       EQU       01000000B
    SEG_E       EQU       00100000B
    SEG_D       EQU       00010000B
    SEG_A       EQU       00001000B
    SEG_B       EQU       00000100B
    SEG_C       EQU       00000010B
	
	Lcdch0      EQU       SEG_A+SEG_B+SEG_C+SEG_D+SEG_E+SEG_F
	Lcdch1	    EQU       SEG_B+SEG_C
	Lcdch2	    EQU       SEG_A+SEG_B+SEG_D+SEG_E+SEG_G
	Lcdch3	    EQU       SEG_A+SEG_B+SEG_C+SEG_D+SEG_G
	Lcdch4	    EQU       SEG_B+SEG_C+SEG_F+SEG_G
	Lcdch5	    EQU       SEG_A+SEG_C+SEG_D+SEG_F+SEG_G
	Lcdch6	    EQU       SEG_A+SEG_C+SEG_D+SEG_E+SEG_F+SEG_G
	Lcdch7	    EQU       SEG_A+SEG_B+SEG_C
	Lcdch8	    EQU       SEG_A+SEG_B+SEG_C+SEG_D+SEG_E+SEG_F+SEG_G
	Lcdch9	    EQU       SEG_A+SEG_B+SEG_C+SEG_D+SEG_F+SEG_G
	LcdchNo	    EQU       00H
	LcdchA	    EQU       SEG_A+SEG_B+SEG_C+SEG_E+SEG_F+SEG_G
	Lcdchb	    EQU       SEG_C+SEG_D+SEG_E+SEG_F+SEG_G
	LcdchC	    EQU       SEG_A+SEG_D+SEG_E+SEG_F
	Lcdchd	    EQU       SEG_B+SEG_C+SEG_D+SEG_E+SEG_G
	LcdchE	    EQU       SEG_A+SEG_D+SEG_E+SEG_F+SEG_G
	LcdchF	    EQU       SEG_A+SEG_E+SEG_F+SEG_G
	LcdchH      EQU       SEG_B+SEG_C+SEG_E+SEG_F+SEG_G
	LcdchL	    EQU       SEG_D+SEG_E+SEG_F
	LcdchN	    EQU       SEG_A+SEG_B+SEG_C+SEG_E+SEG_F
	Lcdcho	    EQU       SEG_C+SEG_D+SEG_E+SEG_G
	LcdchP	    EQU       SEG_A+SEG_B+SEG_E+SEG_F+SEG_G
	Lcdchr	    EQU       SEG_E+SEG_G
	LcdchT	    EQU       SEG_D+SEG_E+SEG_F+SEG_G
	LcdchU	    EQU       SEG_B+SEG_C+SEG_D+SEG_E+SEG_F
	LcdchBar    EQU       SEG_G

	Disp_No     EQU       10	

; RAM DEFINE 
;XCWK_LCD_RAM	.section	BANK0
;
;	LCD1_map    DS  1
;	LCD2_map    DS  1
;	LCD3_map    DS  1
;	LCD4_map    DS  1
;	LCD5_map    DS  1
;	LCD6_map    DS  1
;	LCD7_map    DS  1
;	
;.ends

	LCD1_map    EQU  Buffer0
	LCD2_map    EQU  Buffer1
	LCD3_map    EQU  Buffer2
	LCD4_map    EQU  Buffer3
	LCD5_map    EQU  Buffer4
	LCD6_map    EQU  Buffer5
	LCD7_map    EQU  Buffer6
;

XCWK_LCD_ROM	.section	rom

;**************************************************
; Fun    : TempRam3/4 += TempRam5/6
; input	 : TempRam3/4/5/6
; output : TempRam3/4
;**************************************************
Table_Lcd_Num:
	ADDPCW
	RETLW         Lcdch0
	RETLW         Lcdch1
	RETLW         Lcdch2
    RETLW         Lcdch3
    RETLW         Lcdch4
    RETLW         Lcdch5
    RETLW         Lcdch6
    RETLW         Lcdch7
    RETLW         Lcdch8
    RETLW         Lcdch9
    RETLW         LcdchNo
	
;**************************************************
; 
;**************************************************
Fun_LCD_Init:
	MOVLW          LCD_NETD_INIT   ; 2.8V , 10K REF
	DW             0FFFFH
	DW             0FFFFH
	NOP
	MOVWF          NETD
;	
	MOVLW          LCD_LCDEN_INIT   ; 1/3 BIAS, 1/4 DUTY
	DW             0FFFFH
	DW             0FFFFH
	NOP
	MOVWF          LCDENR
RETURN

;**************************************************
; 
;**************************************************
Fun_LCD_Close:
    CLRF	LCDEN
RETURN

Fun_LCD_Load:
	CLRF	LCD1_map
	CLRF	LCD2_map
	CLRF	LCD3_map
	CLRF	LCD4_map
	CLRF	LCD5_map
	CLRF	LCD6_map
	CLRF	LCD7_map
Fun_LCD_Load_SetBits:
    GOTO    Fun_LCD_USER_SetBits

Fun_LCD_Load_REG:
	MOVFW   LCD1_map
	MOVWF   LCD1
	MOVFW   LCD2_map
	MOVWF   LCD2
	MOVFW   LCD3_map
	MOVWF   LCD3
	MOVFW   LCD4_map
	MOVWF   LCD4
	MOVFW   LCD5_map
	MOVWF   LCD5
	MOVFW   LCD6_map
	MOVWF   LCD6
	MOVFW   LCD7_map
	MOVWF   LCD7
RETURN

.ends
