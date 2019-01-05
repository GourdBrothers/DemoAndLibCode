;=======================================================
;==== user_LCD.ASM
;=======================================================

;=======================================================
LCD_BIT_F   EQU   0
LCD_BIT_G   EQU   1
LCD_BIT_E   EQU   2
LCD_BIT_D   EQU   3
LCD_BIT_A   EQU   4
LCD_BIT_B   EQU   5
LCD_BIT_C   EQU   6

LCD_BIT_P   EQU   7
LCD_BIT_COL EQU	  7

LCD_BIT_KG  EQU   0
LCD_BIT_LB  EQU   1
LCD_BIT_ST  EQU   2
LCD_BIT_SJ  EQU   3

;*******************************************
;**** 用户需要动手修改LCD对应显示内容的位置(物理显示位)
;*******************************************

#DEFINE  Set_Num1_F     BSF    R_LED_1,LCD_BIT_F
#DEFINE  Set_Num1_G     BSF    R_LED_1,LCD_BIT_G
#DEFINE  Set_Num1_E     BSF    R_LED_1,LCD_BIT_E
#DEFINE  Set_Num1_D     BSF    R_LED_1,LCD_BIT_D
#DEFINE  Set_Num1_A     BSF    R_LED_1,LCD_BIT_A
#DEFINE  Set_Num1_B     BSF    R_LED_1,LCD_BIT_B
#DEFINE  Set_Num1_C     BSF    R_LED_1,LCD_BIT_C

#DEFINE  Set_Num2_F     BSF    R_LED_2,LCD_BIT_F
#DEFINE  Set_Num2_G     BSF    R_LED_2,LCD_BIT_G
#DEFINE  Set_Num2_E     BSF    R_LED_2,LCD_BIT_E
#DEFINE  Set_Num2_D     BSF    R_LED_2,LCD_BIT_D
#DEFINE  Set_Num2_A     BSF    R_LED_2,LCD_BIT_A
#DEFINE  Set_Num2_B     BSF    R_LED_2,LCD_BIT_B
#DEFINE  Set_Num2_C     BSF    R_LED_2,LCD_BIT_C
#DEFINE  Set_Num2_COL   BSF    R_LED_2,LCD_BIT_COL

#DEFINE  Set_Num3_F     BSF    R_LED_3,LCD_BIT_F
#DEFINE  Set_Num3_G     BSF    R_LED_3,LCD_BIT_G
#DEFINE  Set_Num3_E     BSF    R_LED_3,LCD_BIT_E
#DEFINE  Set_Num3_D     BSF    R_LED_3,LCD_BIT_D
#DEFINE  Set_Num3_A     BSF    R_LED_3,LCD_BIT_A
#DEFINE  Set_Num3_B     BSF    R_LED_3,LCD_BIT_B
#DEFINE  Set_Num3_C     BSF    R_LED_3,LCD_BIT_C
#DEFINE	 Set_Num3_P     BSF    R_LED_3,LCD_BIT_P

#DEFINE  Set_Num4_F     BSF    R_LED_4,LCD_BIT_F
#DEFINE  Set_Num4_G     BSF    R_LED_4,LCD_BIT_G
#DEFINE  Set_Num4_E     BSF    R_LED_4,LCD_BIT_E
#DEFINE  Set_Num4_D     BSF    R_LED_4,LCD_BIT_D
#DEFINE  Set_Num4_A     BSF    R_LED_4,LCD_BIT_A
#DEFINE  Set_Num4_B     BSF    R_LED_4,LCD_BIT_B
#DEFINE  Set_Num4_C     BSF    R_LED_4,LCD_BIT_C

#DEFINE  Set_DOT_KG     BSF    R_LED_5,LCD_BIT_KG
#DEFINE  Set_DOT_LB     BSF    R_LED_5,LCD_BIT_LB
#DEFINE  Set_DOT_ST     BSF    R_LED_5,LCD_BIT_ST
#DEFINE  Set_DOT_SJ     BSF    R_LED_5,LCD_BIT_SJ

;=======================================================
;==== 用户显示区
;=======================================================
USER_LCD_RAM	.section	BANK0 

	Display1	   DS  1
	 B_Display1_F  EQU 7
	 B_Display1_G  EQU 6
	 B_Display1_E  EQU 5
	 B_Display1_D  EQU 4
	 B_Display1_A  EQU 3
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
	 B_Display2_COL  EQU 0
	 
	Display3	   DS  1
	 B_Display3_F  EQU 7
	 B_Display3_G  EQU 6
	 B_Display3_E  EQU 5
	 B_Display3_D  EQU 4
	 B_Display3_A  EQU 3
	 B_Display3_B  EQU 2
	 B_Display3_C  EQU 1
	 B_Display3_P  EQU 0

	Display4	   DS  1
	 B_Display4_F  EQU 7
	 B_Display4_G  EQU 6
	 B_Display4_E  EQU 5
	 B_Display4_D  EQU 4
	 B_Display4_A  EQU 3
	 B_Display4_B  EQU 2
	 B_Display4_C  EQU 1
	 
	Display5	   DS  1
	 B_Display5_KG EQU 7
	 B_Display5_LB EQU 6
	 B_Display5_ST EQU 5
	 
	; Display6	   DS  1
	; Display7	   DS  1
	
.ENDS

XCWK_Math_ROM .section rom

Fun_LED_SetAllBuf:
    MOVLW    0FFH
    GOTO     Fun_LED_CommBuff
Fun_LED_ResetAllBuf:
    MOVLW    000H
Fun_LED_CommBuff:
	MOVWF    Display1
	MOVWF    Display2
	MOVWF    Display3
	MOVWF    Display4
	MOVWF    Display5
RETURN


Fun_LED_USER_SetBits:	; 用户不可调用
; Display1
    BTFSC	Display1,B_Display1_F
            Set_Num1_F
    BTFSC	Display1,B_Display1_G
            Set_Num1_G
    BTFSC	Display1,B_Display1_E
            Set_Num1_E
    BTFSC	Display1,B_Display1_D
            Set_Num1_D
    BTFSC	Display1,B_Display1_A
            Set_Num1_A
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
    BTFSC	Display2,B_Display2_COL     
            Set_Num2_COL

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
    BTFSC	Display3,B_Display3_P        
            Set_Num3_P

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

; Display5  
    BTFSC   Display5,B_Display5_KG
	        Set_DOT_KG
    BTFSC   Display5,B_Display5_LB
		    Set_DOT_LB
    BTFSC   Display5,B_Display5_ST
		    Set_DOT_ST
; Display6 
; Display7
Fun_LED_USER_SetBits_END:
	GOTO	Fun_LED_Load_REG
	
Fun_LED_USER_Num:
	
	MOVLW		00H
    XORWF		TempRam2, W
    BTFSS		STATUS, Z
    GOTO		Fun_LED_USER_Num_1
    MOVLW		Disp_No
    MOVWF		TempRam2

    MOVLW		00H
    XORWF		TempRam3, W
    BTFSS		STATUS, Z
    GOTO		Fun_LED_USER_Num_1
    MOVLW		Disp_No
    MOVWF		TempRam3
    
    MOVLW		00H
    XORWF		TempRam4, W
    BTFSS		STATUS, Z
    GOTO		Fun_LED_USER_Num_1
    MOVLW		Disp_No
    MOVWF		TempRam4
    
    BTFSS		ScaleFlow,B_ScaleFlow_CAL
    GOTO		Fun_LED_USER_Num_1
    
    MOVLW		00H
    XORWF		TempRam5, W
    BTFSS		STATUS, Z
    GOTO		Fun_LED_USER_Num_1
    MOVLW		Disp_No
    MOVWF		TempRam5
    
Fun_LED_USER_Num_1:
    MOVFW		TempRam3
    CALL		Table_LED_Num
    IORWF		Display1,F

    MOVFW		TempRam4
    CALL		Table_LED_Num
    IORWF		Display2,F

    MOVFW		TempRam5
    CALL		Table_LED_Num
    IORWF		Display3,F

    MOVFW		TempRam6
    CALL		Table_LED_Num
    IORWF		Display4,F
    
 RETURN
 
.ends
