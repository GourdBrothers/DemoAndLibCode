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
;============================================  
SYS_RESET:

SYS_RESET_WDT:

SYS_RESET_PWR:

SYS_RESET_Start:
	CLRF	SysFlow
;    BSF		SysFlow,B_SysFlow_PWR
    
;============================================  
SYS_MAIN_LOOP:
    CLRWDT    

SYS_MAIN_FLOW_CHK:
	BTFSC	SysFlow,B_SysFlow_PWR
	GOTO    SYS_MAIN_PowerOn
	BTFSC	SysFlow,B_SysFlow_SCALE
	GOTO	SYS_MAIN_Scale
	CLRF    SysFlow
	BSF     SysFlow,B_SysFlow_PWR

SYS_MAIN_PowerOn:
	INCLUDE	"Sys_PowerOn.ASM"
;--- NEXT FLOW
	CLRF	SysFlow
	BSF		SysFlow,B_SysFlow_SCALE
	CLRF	ScaleFlow
	BSF		ScaleFlow,B_ScaleFlow_Init
SYS_MAIN_PowerOn_END:
	GOTO	SYS_MAIN_FLOW_END

SYS_MAIN_Scale:
    INCLUDE	"ScaleMain.ASM"
SYS_MAIN_Scale_END:

SYS_MAIN_FLOW_END:


    GOTO	SYS_MAIN_LOOP
;============================================

    END
 ;============================================ 
 