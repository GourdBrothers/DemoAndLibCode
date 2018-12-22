/**
* @file     user_ISR.ASM
* @brief 
* @author
* @date     2018-12-22
* @version  V1.0.0
* @copyright
*/

User_ISR_INT0:
User_ISR_INT0_END:
	GOTO	SYS_ISR_INT0_EXIT
	
User_ISR_INT1:
User_ISR_INT1_END:
	GOTO	SYS_ISR_INT1_EXIT
	
User_ISR_TM:
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
	