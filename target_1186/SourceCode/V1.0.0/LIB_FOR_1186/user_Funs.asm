/**
* @file  user_Funs.asm
* @brief 
* @author
* @date
* @version  V1.0.0
* @copyright
*/

user_Funs_rom .section	rom


Fun_User_CountKgToLb:
	MOVLW	002H		; 144480
    MOVWF	TempRam11
    MOVLW	034H
    MOVWF	TempRam12
    MOVLW	060H
    MOVWF	TempRam13
    CALL	Fun_Math_Mul3_3
    MOVLW	001H
    MOVWF	TempRam11
    CLRF	TempRam12    ; 65536
    CLRF	TempRam13
    CALL	Fun_Math_Div6_3
RETURN

Fun_User_RefreshOffTimer:
	CLRF	Timer05sCnt
	BCF		ScaleFlag2,B_ScaleFlag2_0s5_A
	BCF		ScaleFlag2,B_ScaleFlag2_0s5_B
	CLRF	TimerAutoOff
RETURN


.ends
