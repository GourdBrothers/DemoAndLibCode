;===================================================
;=== RAM_DEFINE.INC
;===================================================
RAM_DEFINE_BANK0 .section BANK0,addr = 0x89

;--- Global variable definition

SysFlow			DS  1
	B_SysFlow_PWR   EQU 0
	B_SysFlow_SCALE EQU 1
	
ScaleFlow		DS  1
	B_ScaleFlow_Init	EQU 0
	B_ScaleFlow_ZERO	EQU 1
	B_ScaleFlow_WEIGHT	EQU 2
	B_ScaleFlow_CAL		EQU 3
	
ScaleCalFlow	DS	1
	B_ScaleCalFlow_ADC	EQU	0
	B_ScaleCalFlow_ZERO	EQU	1
	B_ScaleCalFlow_DOT1	EQU	2
	B_ScaleCalFlow_DOT2	EQU	3
	B_ScaleCalFlow_DOT3	EQU	4
	B_ScaleCalFlow_PASS	EQU	5
	B_ScaleCalFlow_ERR	EQU	6
	

ScaleUnit		DS  1
	B_ScaleUnit_KG	EQU	0
	B_ScaleUnit_LB	EQU	1
	B_ScaleUnit_ST	EQU	2
	
SysFlag1		DS	1
	B_SysFlag1_Reset		EQU	0
	B_SysFlag1_WakeUp		EQU	1
	B_SysFlag1_OnWeight		EQU	2
	
ZeroH			DS	1
ZeroM			DS	1
ZeroL			DS	1

LockCountH		DS	1
LockCountL		DS	1

;--- local variables definition

ScaleFlag1	DS	1
  B_ScaleFlag1_AdcStable EQU 0
  B_ScaleFlag1_AdcStart	 EQU 1
  B_ScaleFlag1_AdcInt	 EQU 2
  B_ScaleFlag1_AdcOk	 EQU 3
  B_ScaleFlag1_Neg		 EQU 4
  B_ScaleFlag1_Zero		 EQU 5
  B_ScaleFlag1_oL		 EQU 6
  B_ScaleFlag1_Lock		 EQU 7
  
ScaleFlag2	DS	1
  B_ScaleFlag2_Key_T		EQU 0
  B_ScaleFlag2_BatChk_T		EQU 1
  B_ScaleFlag2_LockFlashEN	EQU 2
  B_ScaleFlag2_LockFlash	EQU 3	; 不可修改该位位号
  B_ScaleFlag2_0s5_A		EQU 4
  B_ScaleFlag2_0s5_B		EQU 5
  B_ScaleFlag2_FastSleep	EQU 6
  B_ScaleFlag2_WaitSleep	EQU 7
  
ScaleFlag3	DS	1
  B_ScaleFlag3_CalTrg	EQU	0
  B_ScaleFlag3_UnlockEn	EQU	1
  B_ScaleFlag3_WdtAdc	EQU	2
;  B_ScaleFlag3_TempAdc	EQU	3
  B_ScaleFlag3_3wCalOk	EQU	4
  B_ScaleFlag3_Lo		EQU	5
  
LockFlashTime	DS  1
LockFlashCnt	DS  1
KeyShortCnt		DS  1
ZeroTrackCnt	DS  1
BatLowCnt		DS  1
Timer05sCnt		DS	1
TimerAutoOff	DS	1
TimerUnst		DS	1

REG0			DS	1
REG1			DS	1
REG2			DS	1
REG3			DS	1

CountH			DS	1
CountL			DS  1
  
.ENDS



;===================================================
RAM_DEFINE_BANK1 .section BANK1

.ENDS
