/**
* @file     user_ISR.ASM
* @brief 
* @author
* @date     2018-12-22
* @version  V1.0.0
* @copyright
*/

User_ISR_INT0:
	BTFSS	KEY_UNIT_PORT,KEY_UNIT_PIN
	BSF		SysFlag1,B_SysFlag1_WakeUp
User_ISR_INT0_END:
	GOTO	SYS_ISR_INT0_EXIT
	
User_ISR_INT1:
User_ISR_INT1_END:
	GOTO	SYS_ISR_INT1_EXIT
	
User_ISR_TM:
	BSF		ScaleFlag2,B_ScaleFlag2_Key_T
	BSF		ScaleFlag2,B_ScaleFlag2_BatChk_T
	
User_ISR_TM_0s5:	
	INCF	Timer05sCnt,F
	MOVLW	15
	SUBWF	Timer05sCnt,W
	BTFSS	STATUS,C
	GOTO	User_ISR_TM_0s5_END
	CLRF	Timer05sCnt
	BSF		ScaleFlag2,B_ScaleFlag2_0s5_A
User_ISR_TM_0s5_END:

User_ISR_TM_Lock:
	BTFSS	ScaleFlag1,B_ScaleFlag1_Lock
	GOTO	User_ISR_TM_Lock_END
	BTFSS	ScaleFlag2,B_ScaleFlag2_LockFlashEN
	GOTO	User_ISR_TM_Lock_END
	INCF	LockFlashTime,F
	MOVLW	13
	SUBWF	LockFlashTime,W
	BTFSS	STATUS,C
	GOTO	User_ISR_TM_Lock_END
	MOVLW	00001000B
	XORWF	ScaleFlag2,F
	CLRF	LockFlashTime
	INCF	LockFlashCnt,F
	MOVLW	05H
	SUBWF	LockFlashCnt,W
	BTFSS	STATUS,C
	GOTO	User_ISR_TM_Lock_END
	BCF		ScaleFlag2,B_ScaleFlag2_LockFlashEN
	CLRF	TimerAutoOff
User_ISR_TM_Lock_END:

User_ISR_TM_END:
	GOTO	SYS_ISR_TM_EXIT
	
User_ISR_ADC:
User_ISR_ADC0_END:
	GOTO	SYS_ISR_ADC_EXIT
	
User_ISR_URR:
User_ISR_URR_END:
	GOTO	SYS_ISR_URR_EXIT
	
User_ISR_URT:
User_ISR_URT_END:
	GOTO	SYS_ISR_URT_EXIT
