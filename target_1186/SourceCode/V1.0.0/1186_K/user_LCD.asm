;=======================================================
;==== user_LCD.ASM
;=======================================================

LCD1_map    EQU  Buffer0
LCD2_map    EQU  Buffer1
LCD3_map    EQU  Buffer2
LCD4_map    EQU  Buffer3
LCD5_map    EQU  Buffer4
LCD6_map    EQU  Buffer5
LCD7_map    EQU  Buffer6

BIT0		EQU	 0
BIT1		EQU	 1
BIT2		EQU	 2
BIT3		EQU	 3
BIT4		EQU	 4
BIT5		EQU	 5
BIT6		EQU	 6
BIT7		EQU	 7

;*******************************************
;**** 用户需要动手修改LCD对应显示内容的位置(物理显示位)
;*******************************************
#DEFINE  Set_DOT_LB		BSF    LCD1_map,BIT0
#DEFINE  Set_DOT_G		BSF    LCD1_map,BIT1
#DEFINE  Set_DOT_FL		BSF    LCD1_map,BIT2
#DEFINE  Set_DOT_OZ		BSF    LCD1_map,BIT3

#DEFINE  Set_DOT_S1		BSF    LCD1_map,BIT5
#DEFINE  Set_DOT_TARE	BSF    LCD1_map,BIT6
#DEFINE  Set_DOT_COL2	BSF    LCD1_map,BIT7

#DEFINE  Set_DOT_COL1	BSF    LCD2_map,BIT4
#DEFINE  Set_Num1_B     BSF    LCD2_map,BIT5
#DEFINE  Set_Num1_C     BSF    LCD2_map,BIT6


#DEFINE  Set_Num2_F     BSF    LCD3_map,BIT0
#DEFINE  Set_Num2_G     BSF    LCD3_map,BIT1
#DEFINE  Set_Num2_E     BSF    LCD3_map,BIT2
#DEFINE  Set_Num2_D     BSF    LCD3_map,BIT3
#DEFINE  Set_Num2_A     BSF    LCD3_map,BIT4
#DEFINE  Set_Num2_B     BSF    LCD3_map,BIT5
#DEFINE  Set_Num2_C     BSF    LCD3_map,BIT6
#DEFINE  Set_Num2_P2	BSF    LCD3_map,BIT7

#DEFINE  Set_Num3_F     BSF    LCD4_map,BIT0
#DEFINE  Set_Num3_G     BSF    LCD4_map,BIT1
#DEFINE  Set_Num3_E     BSF    LCD4_map,BIT2
#DEFINE  Set_Num3_D     BSF    LCD4_map,BIT3
#DEFINE  Set_Num3_A     BSF    LCD4_map,BIT4
#DEFINE  Set_Num3_B     BSF    LCD4_map,BIT5
#DEFINE  Set_Num3_C     BSF    LCD4_map,BIT6
#DEFINE  Set_Num3_P3    BSF    LCD4_map,BIT7
                                     
#DEFINE  Set_Num4_F     BSF    LCD5_map,BIT0
#DEFINE  Set_Num4_G     BSF    LCD5_map,BIT1
#DEFINE  Set_Num4_E     BSF    LCD5_map,BIT2
#DEFINE  Set_Num4_D     BSF    LCD5_map,BIT3
#DEFINE  Set_Num4_A     BSF    LCD5_map,BIT4
#DEFINE  Set_Num4_B     BSF    LCD5_map,BIT5
#DEFINE  Set_Num4_C     BSF    LCD5_map,BIT6
#DEFINE  Set_Num4_P4    BSF    LCD5_map,BIT7
                                     
#DEFINE  Set_Num5_F     BSF    LCD6_map,BIT0
#DEFINE  Set_Num5_G     BSF    LCD6_map,BIT1
#DEFINE  Set_Num5_E     BSF    LCD6_map,BIT2
#DEFINE  Set_Num5_D     BSF    LCD6_map,BIT3
#DEFINE  Set_Num5_A     BSF    LCD6_map,BIT4
#DEFINE  Set_Num5_B     BSF    LCD6_map,BIT5
#DEFINE  Set_Num5_C     BSF    LCD6_map,BIT6
#DEFINE  Set_Num5_ML    BSF    LCD6_map,BIT7
                                     

;=======================================================
;==== 用户显示区
;=======================================================
USER_LCD_RAM	.section	BANK0

	Display1	   DS  1
	 B_Display1_B  EQU 2
	 B_Display1_C  EQU 1
	 
	Display2	   DS  1
	 B_Display2_F  EQU 7
	 B_Display2_G  EQU 6
	 B_Display2_E  EQU 5
	 B_Display2_D  EQU 4
	 B_Display2_A  EQU 3
	 B_Display2_B  EQU 2
	 B_Display2_C  EQU 1
	 B_Display2_P2 EQU 0
	 
	Display3	   DS  1
	 B_Display3_F  EQU 7
	 B_Display3_G  EQU 6
	 B_Display3_E  EQU 5
	 B_Display3_D  EQU 4
	 B_Display3_A  EQU 3
	 B_Display3_B  EQU 2
	 B_Display3_C  EQU 1
	 B_Display3_P3 EQU 0

	Display4	   DS  1
	 B_Display4_F  EQU 7
	 B_Display4_G  EQU 6
	 B_Display4_E  EQU 5
	 B_Display4_D  EQU 4
	 B_Display4_A  EQU 3
	 B_Display4_B  EQU 2
	 B_Display4_C  EQU 1
	 B_Display4_P4 EQU 0
	 
	Display5	   DS  1
	 B_Display5_F  EQU 7
	 B_Display5_G  EQU 6
	 B_Display5_E  EQU 5
	 B_Display5_D  EQU 4
	 B_Display5_A  EQU 3
	 B_Display5_B  EQU 2
	 B_Display5_C  EQU 1
	 B_Display5_ml EQU 0

	Display6		DS  1
	 B_Display6_lb		EQU 0
	 B_Display6_g		EQU 1
	 B_Display6_fl		EQU 2
	 B_Display6_oz		EQU 3
	 B_Display6_col1	EQU 4
	 B_Display6_s1		EQU 5
	 B_Display6_tare	EQU 6
	 B_Display6_col2	EQU 7

	; Display7	   DS  1
	
.ENDS

XCWK_Math_ROM .section rom

Fun_LCD_SetAllBuf:
    MOVLW    0FFH
    GOTO     Fun_LCD_CommBuff
Fun_LCD_ResetAllBuf:
    MOVLW    000H
Fun_LCD_CommBuff:
	MOVWF    Display1
	MOVWF    Display2
	MOVWF    Display3
	MOVWF    Display4
	MOVWF    Display5
	MOVWF	 Display6
RETURN


Fun_LCD_USER_SetBits:	; 用户不可调用
; Display1
;    BTFSC	Display1,B_Display1_F
;            Set_Num1_F
;    BTFSC	Display1,B_Display1_G
;            Set_Num1_G
;    BTFSC	Display1,B_Display1_E
;            Set_Num1_E
;    BTFSC	Display1,B_Display1_D
;            Set_Num1_D
;    BTFSC	Display1,B_Display1_A
;            Set_Num1_A
    BTFSC	Display1,B_Display1_B
            Set_Num1_B
    BTFSC	Display1,B_Display1_C
            Set_Num1_C

; Display2    
    BTFSC	Display2,B_Display2_F
            Set_Num2_F
    BTFSC	Display2,B_Display2_G
            Set_Num2_G
    BTFSC	Display2,B_Display2_E
            Set_Num2_E
    BTFSC	Display2,B_Display2_D
            Set_Num2_D
    BTFSC	Display2,B_Display2_A
            Set_Num2_A
    BTFSC	Display2,B_Display2_B
            Set_Num2_B
    BTFSC	Display2,B_Display2_C
            Set_Num2_C
    BTFSC	Display2,B_Display2_P2    
            Set_Num2_P2

; Display3    
    BTFSC	Display3,B_Display3_F
            Set_Num3_F
    BTFSC	Display3,B_Display3_G
            Set_Num3_G
    BTFSC	Display3,B_Display3_E
            Set_Num3_E
    BTFSC	Display3,B_Display3_D
            Set_Num3_D
    BTFSC	Display3,B_Display3_A
            Set_Num3_A
    BTFSC	Display3,B_Display3_B
            Set_Num3_B
    BTFSC	Display3,B_Display3_C
            Set_Num3_C
    BTFSC	Display3,B_Display3_P3        
            Set_Num3_P3

; Display4 
    BTFSC	Display4,B_Display4_F
            Set_Num4_F
    BTFSC	Display4,B_Display4_G
            Set_Num4_G
    BTFSC	Display4,B_Display4_E
            Set_Num4_E
    BTFSC	Display4,B_Display4_D
            Set_Num4_D
    BTFSC	Display4,B_Display4_A
            Set_Num4_A
    BTFSC	Display4,B_Display4_B
            Set_Num4_B
    BTFSC	Display4,B_Display4_C
            Set_Num4_C
    BTFSC	Display4,B_Display4_P4
            Set_Num4_P4

; Display5  
    BTFSC	Display5,B_Display5_F
            Set_Num5_F
    BTFSC	Display5,B_Display5_G
            Set_Num5_G
    BTFSC	Display5,B_Display5_E
            Set_Num5_E
    BTFSC	Display5,B_Display5_D
            Set_Num5_D
    BTFSC	Display5,B_Display5_A
            Set_Num5_A
    BTFSC	Display5,B_Display5_B
            Set_Num5_B
    BTFSC	Display5,B_Display5_C
            Set_Num5_C
    BTFSC	Display5,B_Display5_ml
		    Set_Num5_ML
		
; Display6 
	BTFSC   Display6,B_Display6_lb	
			Set_DOT_LB
	BTFSC   Display6,B_Display6_g	
			Set_DOT_G
	BTFSC   Display6,B_Display6_fl	
			Set_DOT_FL
	BTFSC   Display6,B_Display6_oz	
			Set_DOT_OZ
	BTFSC   Display6,B_Display6_col1
			Set_DOT_COL1
	BTFSC   Display6,B_Display6_s1
			Set_DOT_S1
	BTFSC   Display6,B_Display6_tare
			Set_DOT_TARE
	BTFSC   Display6,B_Display6_col2
			Set_DOT_COL2

; Display7
Fun_LCD_USER_SetBits_END:
	GOTO	Fun_LCD_Load_REG
	
Fun_LCD_USER_Num:
	
	MOVLW		00H
    XORWF		TempRam2, W
    BTFSS		STATUS, Z
    GOTO		Fun_LCD_USER_Num_1
    MOVLW		Disp_No
    MOVWF		TempRam2

    MOVLW		00H
    XORWF		TempRam3, W
    BTFSS		STATUS, Z
    GOTO		Fun_LCD_USER_Num_1
    MOVLW		Disp_No
    MOVWF		TempRam3
    
    MOVLW		00H
    XORWF		TempRam4, W
    BTFSS		STATUS, Z
    GOTO		Fun_LCD_USER_Num_1
    MOVLW		Disp_No
    MOVWF		TempRam4
    
    MOVLW		00H
    XORWF		TempRam5, W
    BTFSS		STATUS, Z
    GOTO		Fun_LCD_USER_Num_1
    MOVLW		Disp_No
    MOVWF		TempRam5
    
Fun_LCD_USER_Num_1:
    MOVFW		TempRam2
    CALL		Table_Lcd_Num
    IORWF		Display1,F
    
    MOVFW		TempRam3
    CALL		Table_Lcd_Num
    IORWF		Display2,F

    MOVFW		TempRam4
    CALL		Table_Lcd_Num
    IORWF		Display3,F

    MOVFW		TempRam5
    CALL		Table_Lcd_Num
    IORWF		Display4,F

    MOVFW		TempRam6
    CALL		Table_Lcd_Num
    IORWF		Display5,F
    
 RETURN
 
.ends
