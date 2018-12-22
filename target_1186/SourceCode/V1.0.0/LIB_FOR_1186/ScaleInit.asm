/**
* @file  ScaleInit.ASM
* @brief 
* @author
* @date     2018-12-22
* @version  V1.0.0
* @copyright
*/
ScaleInit_Entry:
	BCF		INTE,GIE
	
ScaleInit_Power:
	CALL	Fun_power_Init
	CALL    Fun_Delay_20MS

ScaleInit_IO:

ScaleInit_TIMER:

ScaleInit_LCD:
	CALL	Fun_LCD_Init
	CALL    Fun_LCD_ResetAllBuf
	CALL    Fun_LCD_Load

ScaleInit_ADC:
	CALL	Fun_ADC_Init
	
ScaleInit_INT:	
	BCF		INTE,GIE



