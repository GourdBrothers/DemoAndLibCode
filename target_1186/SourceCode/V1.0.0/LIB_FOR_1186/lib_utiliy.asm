/**
* @file     lib_utiliy.ASM
* @brief 
* @author
* @date     2018-12-22
* @version  V1.0.0
* @copyright
*/

lib_Delay_rom .section rom

Fun_Delay_100MS:
    MOVLW	100
	GOTO	Fun_Delay_MS_comm
Fun_Delay_40MS:
    MOVLW	40
	GOTO	Fun_Delay_MS_comm
Fun_Delay_20MS:
    MOVLW	20
	GOTO	Fun_Delay_MS_comm
Fun_Delay_10MS:
    MOVLW	10
    GOTO	Fun_Delay_MS_comm
Fun_Delay_1MS:
    MOVLW	1
Fun_Delay_MS_comm:
	MOVWF	REG1
Fun_Delay_2:
    MOVLW	200
    MOVWF	REG2
Fun_Delay_2_LOOP:
    CLRWDT
    NOP                       ; 1
    NOP                       ; 1
	NOP                       ; 1
    DECFSZ	REG2,F          ; 1
	GOTO	Fun_Delay_2_LOOP  ; 1
Fun_Delay_1:
    DECFSZ	REG1,F
	GOTO	Fun_Delay_2
RETURN

Fun_power_Init:
	MOVLW	NETF_CFG_VALUE
	DW		0FFFFH
	NOP
	MOVWF	NETF
	
	MOVLW	NETE_CFG_VALUE
	DW		0FFFFH
	NOP
	MOVWF	NETE
RETURN

Fun_power_Close:
   	CLRF	NETF
RETURN

Fun_GPIO_Init:
	MOVLW	AIENB_CFG_VALUE
	MOVWF	AIENB
	MOVLW	PT1EN_CFG_VALUE
	MOVWF	PT1EN
	MOVLW	PT1PU_CFG_VALUE
	MOVWF	PT1PU
	MOVLW	PT1_CFG_VALUE
	MOVWF	PT1

	MOVLW	PT2EN_CFG_VALUE
	MOVWF	PT2EN
	MOVLW	PT2PU_CFG_VALUE
	MOVWF	PT2PU
	MOVLW	PT2_CFG_VALUE
	MOVWF	PT2
	
	MOVLW	PT2MR_CFG_VALUE
	MOVWF	PT2MR
	MOVLW	PT2CON_CFG_VALUE
	MOVWF	PT2CON
	
	MOVLW	PTINT_CFG_VALUE
	MOVWF	PTINT
	MOVLW	AIENB2_CFG_VALUE
	MOVWF	AIENB2
RETURN

Fun_RAM_Zero:
	MOVWF	FSR0
Fun_RAM_Zero_Loop:
	CLRF	INDF0
	INCF    FSR0,F
	MOVLW   0FFH
	BTFSC   BSR,IRP0
	MOVLW   07FH
	SUBWF   FSR0,W
	BTFSS   STATUS,C
	GOTO    Fun_RAM_Zero_Loop
	CLRF	INDF0
RETURN

Fun_SetZeroPoint:
	MOVFW		H_DR
    MOVWF		ZeroH
    MOVFW		M_DR
    MOVWF		ZeroM
    MOVFW		L_DR
    MOVWF		ZeroL
Fun_SetCountZero:
	CLRF		CountH
	CLRF		CountL
	BCF			ScaleFlag1,B_ScaleFlag1_Neg
	BSF			ScaleFlag1,B_ScaleFlag1_Zero
	BCF			SysFlag1,B_SysFlag1_OnWeight
	BSF			ScaleFlag3,B_ScaleFlag3_UnlockEn
	
RETURN

Fun_CurAD_Sub_ZeroAD:
	MOVFW		H_DR
	MOVWF	    TempRam1
	MOVFW		M_DR
    MOVWF	    TempRam2
    MOVFW		L_DR
    MOVWF	    TempRam3
    
    MOVFW		ZeroH
    MOVWF	    TempRam4
    MOVFW		ZeroM
    MOVWF	    TempRam5
   	MOVFW		ZeroL
    MOVWF	    TempRam6
    GOTO	    Fun_Math_Sub3_3

.ends
