;============================================
; filename: LIB_FOR_1186.asm
; chip    : CSU8RP1186
; author  :
; date    : 2018-12-08
;============================================
    INCLUDE    "CSU8RP1186.INC"
;============================================
    ORG        0000H
    NOP
    GOTO       SYS_RESET
;============================================  
    ORG        0004H
    GOTO       SYS_ISR_ENTRY
    
SYS_ISR_ENTRY:
SYS_ISR_ENTRY_EXIT:
    RETFIE
    
;============================================  
SYS_RESET:

SYS_RESET_WDT:

SYS_RESET_PWR:

SYS_WAKEUP:

SYS_START:
    MOVLW   05AH
    MOVWF   TempRam3
    SWAPF   TempRam3,F


    MOVLW   HIGH   1234
    MOVWF   TempRam3
    MOVLW   LOW    1234
    MOVWF   TempRam4
    MOVLW   HIGH   5678
    MOVWF   TempRam5
    MOVLW   LOW    5678
    MOVWF   TempRam6
    CALL    Fun_Math_Add2_2
    
    MOVLW   HIGH   5678
    MOVWF   TempRam3
    MOVLW   LOW    5678
    MOVWF   TempRam4
    MOVLW   HIGH   1234
    MOVWF   TempRam5
    MOVLW   LOW    1234
    MOVWF   TempRam6
    CALL    Fun_Math_Sub2_2
    
    MOVLW   HIGH   1234
    MOVWF   TempRam3
    MOVLW   LOW    1234
    MOVWF   TempRam4
    MOVLW   HIGH   5678
    MOVWF   TempRam5
    MOVLW   LOW    5678
    MOVWF   TempRam6
    CALL    Fun_Math_Sub2_2
    CALL    Fun_Math_Sub2_2_Neg
    
    MOVLW   056H       ;567890H
    MOVWF   TempRam1
    MOVLW   078H
    MOVWF   TempRam2
    MOVLW   090H
    MOVWF   TempRam3
    MOVLW   012H       ;123456H
    MOVWF   TempRam4
    MOVLW   034H
    MOVWF   TempRam5
    MOVLW   056H
    MOVWF   TempRam6 
    CALL    Fun_Math_Sub3_3
    
    MOVLW   012H       ;123456H
    MOVWF   TempRam1
    MOVLW   034H
    MOVWF   TempRam2
    MOVLW   056H
    MOVWF   TempRam3
    MOVLW   056H       ;567890H
    MOVWF   TempRam4
    MOVLW   078H
    MOVWF   TempRam5
    MOVLW   090H
    MOVWF   TempRam6 
    CALL    Fun_Math_Sub3_3
    CALL    Fun_Math_Sub3_3_Neg

    CLRF    TempRam1
    MOVLW   012H
    MOVWF   TempRam2
    MOVLW   034H
    MOVWF   TempRam3
    MOVLW   056H
    MOVWF   TempRam4
    MOVLW   078H
    MOVWF   TempRam5
    MOVLW   090H
    MOVWF   TempRam6
    MOVLW   012H
    MOVWF   TempRam11
    MOVLW   034H
    MOVWF   TempRam12
    MOVLW   056H
    MOVWF   TempRam13
    CALL    Fun_Math_Div6_3
    CALL    Fun_Math_Div6_3_Rounded
    
    MOVLW   056H
    MOVWF   TempRam4
    MOVLW   078H
    MOVWF   TempRam5
    MOVLW   090H
    MOVWF   TempRam6
    MOVLW   012H
    MOVWF   TempRam11
    MOVLW   034H
    MOVWF   TempRam12
    MOVLW   056H
    MOVWF   TempRam13
    CALL    Fun_Math_Mul3_3
    
    MOVLW   001H
    MOVWF   TempRam11
    MOVLW   0E2H
    MOVWF   TempRam12
    MOVLW   040H
    MOVWF   TempRam13
    CALL    Fun_Math_Hex3_Bcd
    

;============================================  
SYS_MAIN_LOOP:


SYS_MAIN_FLOW_CHK:

SYS_MAIN_FLOW_END:

    GOTO    SYS_MAIN_LOOP
;============================================

    END
 ;============================================ 
 