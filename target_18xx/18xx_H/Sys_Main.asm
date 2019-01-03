;============================================
; filename: 18xx_H.asm
; chip    : CSU18MB86
; author  :
; date    : 2019-01-03
;============================================
	INCLUDE    "CSU18MB86.inc"
	INCLUDE    "RAM_DEFINE.inc"
;============================================
    ORG        0000H
    NOP
    GOTO       SYS_RESET
;============================================
    ORG        0004H
    GOTO       SYS_ISR_ENTRY
    INCLUDE    "user_ISR.ASM"
SYS_RESET:

	BTFSS		STATUS,TO
	GOTO		SYS_RESET_PWR
SYS_RESET_WDT:
	BCF			STATUS,TO
	CLRWDT
	GOTO		ScaleWakeUp_ScanWeight
	
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
