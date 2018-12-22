;============================================
; filename: LIB_FOR_1186.asm
; chip    : CSU8RP1186
; author  :
; date    : 2018-12-08
;============================================
    INCLUDE    "CSU8RP1186.INC"
    INCLUDE    "RAM_DEFINE.INC"
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
    INCLUDE	"Sys_PowerOn.ASM"

SYS_WAKEUP:

SYS_START:
    

;============================================  
SYS_MAIN_LOOP:


SYS_MAIN_FLOW_CHK:

SYS_MAIN_FLOW_END:


    GOTO    SYS_MAIN_LOOP
;============================================

    END
 ;============================================ 
 