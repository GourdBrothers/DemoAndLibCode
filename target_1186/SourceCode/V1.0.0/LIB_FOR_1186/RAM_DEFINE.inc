;===================================================
;=== RAM_DEFINE.INC
;===================================================
RAM_DEFINE_BANK0 .section BANK0,addr = 0x80

SysFlow		DS  1
	B_SysFlow_PWR   EQU 0
	B_SysFlow_SCALE EQU 1
	
ScaleFlow	DS  1
	B_ScaleFlow_Init	EQU 0
	B_ScaleFlow_ZERO	EQU 1
	B_ScaleFlow_WEIGHT	EQU 2
	B_ScaleFlow_CAL		EQU 3

ScaleUnit   DS  1
	B_ScaleUnit_KG	EQU	0
	B_ScaleUnit_LB	EQU	1
	B_ScaleUnit_ST	EQU	2

ScaleFlag1	DS	1
  B_ScaleFlag1_AdcStable EQU 0
  B_ScaleFlag1_AdcStart	 EQU 1
  B_ScaleFlag1_AdcInt	 EQU 2
  B_ScaleFlag1_AdcOk	 EQU 3
  
.ENDS



;===================================================
RAM_DEFINE_BANK1 .section BANK1

.ENDS