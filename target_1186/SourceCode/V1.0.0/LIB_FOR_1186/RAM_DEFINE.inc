;===================================================
;=== RAM_DEFINE.INC
;===================================================
RAM_DEFINE_BANK0 .section BANK0,addr = 0x80

;--- Global variable definition

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
	
ZeroH		DS	1
ZeroM		DS	1
ZeroL		DS	1

DownADH		DS	1  ; FOR AUTO ON
DownADM		DS	1  	
DownADL		DS	1  	

AutoOnADH	DS	1  
AutoOnADM	DS	1  
AutoOnADL	DS	1  

AutoOnWH	DS	1 
AutoOnWM	DS	1 
AutoOnWL	DS	1 

;--- local variables definition

CountH		DS	1
CountL		DS  1
TrackCnt	DS  1


ScaleFlag1	DS	1
  B_ScaleFlag1_AdcStable EQU 0
  B_ScaleFlag1_AdcStart	 EQU 1
  B_ScaleFlag1_AdcInt	 EQU 2
  B_ScaleFlag1_AdcOk	 EQU 3
  B_ScaleFlag1_Neg		 EQU 4
  B_ScaleFlag1_Zero		 EQU 5
 
REG0		DS	1
REG1		DS	1
REG2		DS	1
REG3		DS	1

  
.ENDS



;===================================================
RAM_DEFINE_BANK1 .section BANK1

.ENDS
