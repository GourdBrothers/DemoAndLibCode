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

;=======================================================
LCD_BIT_F   EQU   0
LCD_BIT_G   EQU   1
LCD_BIT_E   EQU   2
LCD_BIT_D   EQU   3
LCD_BIT_A   EQU   4
LCD_BIT_B   EQU   5
LCD_BIT_C   EQU   6

LCD_BIT_KG  EQU   0
LCD_BIT_LB  EQU   1
LCD_BIT_ST  EQU   2
LCD_BIT_SJ  EQU   3

;*******************************************
;**** 用户需要动手修改LCD对应显示内容的位置
;*******************************************

#DEFINE  Set_Num1_F     BSF    LCD1_map,LCD_BIT_F
#DEFINE  Set_Num1_G     BSF    LCD1_map,LCD_BIT_G
#DEFINE  Set_Num1_E     BSF    LCD1_map,LCD_BIT_E
#DEFINE  Set_Num1_D     BSF    LCD1_map,LCD_BIT_D
#DEFINE  Set_Num1_A     BSF    LCD1_map,LCD_BIT_A
#DEFINE  Set_Num1_B     BSF    LCD1_map,LCD_BIT_B
#DEFINE  Set_Num1_C     BSF    LCD1_map,LCD_BIT_C

#DEFINE  Set_Num2_F     BSF    LCD2_map,LCD_BIT_F
#DEFINE  Set_Num2_G     BSF    LCD2_map,LCD_BIT_G
#DEFINE  Set_Num2_E     BSF    LCD2_map,LCD_BIT_E
#DEFINE  Set_Num2_D     BSF    LCD2_map,LCD_BIT_D
#DEFINE  Set_Num2_A     BSF    LCD2_map,LCD_BIT_A
#DEFINE  Set_Num2_B     BSF    LCD2_map,LCD_BIT_B
#DEFINE  Set_Num2_C     BSF    LCD2_map,LCD_BIT_C

#DEFINE  Set_Num3_F     BSF    LCD3_map,LCD_BIT_F
#DEFINE  Set_Num3_G     BSF    LCD3_map,LCD_BIT_G
#DEFINE  Set_Num3_E     BSF    LCD3_map,LCD_BIT_E
#DEFINE  Set_Num3_D     BSF    LCD3_map,LCD_BIT_D
#DEFINE  Set_Num3_A     BSF    LCD3_map,LCD_BIT_A
#DEFINE  Set_Num3_B     BSF    LCD3_map,LCD_BIT_B
#DEFINE  Set_Num3_C     BSF    LCD3_map,LCD_BIT_C

#DEFINE  Set_Num4_F     BSF    LCD4_map,LCD_BIT_F
#DEFINE  Set_Num4_G     BSF    LCD4_map,LCD_BIT_G
#DEFINE  Set_Num4_E     BSF    LCD4_map,LCD_BIT_E
#DEFINE  Set_Num4_D     BSF    LCD4_map,LCD_BIT_D
#DEFINE  Set_Num4_A     BSF    LCD4_map,LCD_BIT_A
#DEFINE  Set_Num4_B     BSF    LCD4_map,LCD_BIT_B
#DEFINE  Set_Num4_C     BSF    LCD4_map,LCD_BIT_C

#DEFINE  Set_DOT_KG     BSF    LCD5_map,LCD_BIT_KG
#DEFINE  Set_DOT_LB     BSF    LCD5_map,LCD_BIT_LB
#DEFINE  Set_DOT_ST     BSF    LCD5_map,LCD_BIT_ST
#DEFINE  Set_DOT_SJ     BSF    LCD5_map,LCD_BIT_SJ

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

	 
	Display3	   DS  1
	 B_Display3_F  EQU 7
	 B_Display3_G  EQU 6
	 B_Display3_E  EQU 5
	 B_Display3_D  EQU 4
	 B_Display3_A  EQU 3
	 B_Display3_B  EQU 2
	 B_Display3_C  EQU 1

	 
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
RETURN


Fun_LCD_USER_SetBits:
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
Fun_LCD_USER_SetBits_END:
	GOTO	Fun_LCD_Load_REG
	
.ends
