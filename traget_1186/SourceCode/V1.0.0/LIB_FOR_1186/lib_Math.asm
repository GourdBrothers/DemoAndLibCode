;----------------------------------------------------------------------------------------------
; @http://www.sictech.com.cn
;
; @Mathematical functions Library
;
; @Multi-byte addition and subtraction, multiplication and division method, BCD code conversion
;
; @Created Date: 20181208
; @V1.0
;

XCWK_Math_RRF_4BIT .macro  tempByte
    BCF   STATUS,C
    RRF   tempByte,F
    BCF   STATUS,C
    RRF   tempByte,F
    BCF   STATUS,C
    RRF   tempByte,F
    BCF   STATUS,C
    RRF   tempByte,F
.endm


XCWK_Math_RAM .section BANK0

Buffer0    .ds  1
Buffer1    .ds  1
Buffer2    .ds  1
Buffer3    .ds  1
Buffer4    .ds  1
Buffer5    .ds  1
Buffer6    .ds  1

TempRam1   .ds  1
TempRam2   .ds  1
TempRam3   .ds  1
TempRam4   .ds  1
TempRam5   .ds  1
TempRam6   .ds  1

TempRam11  .ds  1
TempRam12  .ds  1
TempRam13  .ds  1

ends


XCWK_Math_ROM .section rom

;**************************************************
; Fun    : TempRam3/4 += TempRam5/6
; input	 : TempRam3/4/5/6
; output : TempRam3/4
;**************************************************
Fun_Math_Add2_2:
		MOVFW		TempRam6
		ADDWF		TempRam4, F
		MOVFW		TempRam5
		ADDWFC		TempRam3, F
RETURN
		
;**************************************************
; Fun    : TempRam3/4 -= TempRam5/6
; input	 : TempRam3/4/5/6
; output : TempRam3/4
;**************************************************
Fun_Math_Sub2_2:
		MOVFW		TempRam6
		SUBWF		TempRam4, F
		MOVFW		TempRam5
		SUBWFC		TempRam3, F
RETURN

;**************************************************
;  TempRam3,TempRam4
;**************************************************
Fun_Math_Sub2_2_Neg:
		BTFSC		STATUS, C
RETURN
		COMF        TempRam4,F
		COMF        TempRam3,F
		MOVLW       001H
		ADDWF       TempRam4,F
		MOVLW       000H
		ADDWFC      TempRam3,F
RETURN

;**************************************************
; Fun    : TempRam1/2/3 -= TempRam4/5/6
; input	 : TempRam1/2/3/4/5/6
; output : TempRam1/2/3
;**************************************************
Fun_Math_Sub3_3:
		MOVFW		TempRam6
		SUBWF		TempRam3, F
		MOVFW		TempRam5
		SUBWFC		TempRam2, F
		MOVFW		TempRam4
		SUBWFC		TempRam1, F
RETURN

;**************************************************
; TempRam1, TempRam2, TempRam3
;**************************************************		
Fun_Math_Sub3_3_Neg:
		  BTFSC		STATUS, C
RETURN
		  COMF		TempRam3,F
		  COMF		TempRam2,F
		  COMF		TempRam1,F
		  MOVLW     001H
		  ADDWF     TempRam3,F
		  MOVLW     000H
		  ADDWFC    TempRam2,F
		  MOVLW     000H
		  ADDWFC    TempRam1,F
RETURN	
			
;**************************************************
;Fun    : (TempRam2/3/4/5/6)/(TempRam11/12/13)
;          TempRam4/5/6 ...... TempRam1/2/3 
;input	:  TempRam2/3/4/5/6
;		   TempRam11/12/13
;output	: 
;yushu	:	TempRam1, TempRam2, TempRam3
;shang	:	TempRam4, TempRam5, TempRam6
;temp	:	buffer0,buffer1,buffer2,buffer3
;**************************************************
Fun_Math_Div6_3:
        MOVLW       24
		MOVWF		Buffer3
Fun_Math_Div6_3Loop:	
		BCF		    STATUS,C
		RLF		    TempRam6, F
		RLF		    TempRam5, F
		RLF		    TempRam4, F
		RLF		    TempRam3, F
		RLF		    TempRam2, F
		RLF		    TempRam1, F
		
		MOVFW		TempRam13
		SUBWF		TempRam3, 0
		MOVWF		Buffer2
		
		MOVFW		TempRam12
		SUBWFC		TempRam2, 0
		MOVWF		Buffer1
		
		MOVFW		TempRam11
		SUBWFC		TempRam1, 0
		MOVWF		Buffer0
		
		BTFSS		STATUS, C
		GOTO		Fun_Math_Div6_3Loop1
		
		MOVFW       Buffer0
		MOVWF       TempRam1
		MOVFW       Buffer1
		MOVWF       TempRam2
		MOVFW       Buffer2
		MOVWF       TempRam3
		
		INCF		TempRam6, F
Fun_Math_Div6_3Loop1:
		DECFSZ		Buffer3, F
		GOTO		Fun_Math_Div6_3Loop
RETURN

;**************************************************
;---- 除法四舍五入
Fun_Math_Div6_3_Rounded:
        MOVFW       TempRam3
        MOVWF       Buffer2
        MOVFW       TempRam2
        MOVWF       Buffer1
        MOVFW       TempRam1
        MOVWF       Buffer0
        
		BCF		    STATUS  , C
		RLF		    Buffer2, F
		RLF		    Buffer1, F
		RLF		    Buffer0, F
		
		MOVFW		TempRam13
		SUBWF		Buffer2, F
		MOVFW		TempRam12
		SUBWFC		Buffer1, F
		MOVFW		TempRam11
		SUBWFC		Buffer0, F
		BTFSS		STATUS, C
RETURN		
		MOVLW		1
		ADDWF		TempRam6, F
		MOVLW		0
		ADDWFC		TempRam5, F
		MOVLW		0
		ADDWFC		TempRam4, F
RETURN
		
;**************************************************
;Fun    :   TempRam4/5/6 * TempRam11/12/13
;input	:	TempRam4/5/6
;           TempRam11/12/13
;output	: 	TempRam1/2/3/4/5/6
;**************************************************
Fun_Math_Mul3_3:
		CLRF		TempRam1
		CLRF		TempRam2
		CLRF		TempRam3
		CLRF		Buffer0
		CLRF		Buffer1
		CLRF		Buffer2
		
        MOVFW       TempRam4
        MOVWF       Buffer3
        MOVFW       TempRam5
        MOVWF       Buffer4
        MOVFW       TempRam6
        MOVWF       Buffer5
		
		CLRF		TempRam4
		CLRF		TempRam5
		CLRF		TempRam6
		
		MOVLW       24
		MOVWF       Buffer6
Fun_Math_Mul3_3Loop:
        BCF         STATUS,C
        RRF		    TempRam11, F
		RRF		    TempRam12, F
		RRF		    TempRam13, F

		BTFSS		STATUS, C
		GOTO		Fun_Math_Mul3_3Loop1

		MOVFW		Buffer5
		ADDWF		TempRam6, F
		MOVFW		Buffer4
		ADDWFC		TempRam5, F
		MOVFW		Buffer3
		ADDWFC		TempRam4, F
		MOVFW		Buffer2
		ADDWFC		TempRam3, F
		MOVFW		Buffer1
		ADDWFC		TempRam2, F
		MOVFW		Buffer0
		ADDWFC		TempRam1, F
Fun_Math_Mul3_3Loop1:
		BCF		    STATUS , C
		RLF		    Buffer5, F      
		RLF		    Buffer4, F      
		RLF		    Buffer3, F      
		RLF		    Buffer2, F      
		RLF		    Buffer1, F     
		RLF		    Buffer0, F      
		DECFSZ		Buffer6, F
		GOTO		Fun_Math_Mul3_3Loop
RETURN

;-----------------------------------------------------
;------------  三字节数据转换为压缩BCD码
;------------  InPut: TempRam11/12/13
;------------  OutPut:TempRam1,2,3,4,5,6   （由高到低）         
;-----------------------------------------------------
Fun_Math_Hex3_Bcd:
		CLRF        TempRam1
		CLRF        TempRam2
		CLRF        TempRam3
		CLRF        TempRam4
		CLRF        TempRam5
		CLRF        TempRam6
		MOVLW       24
		MOVWF		Buffer5
Fun_Math_HexToBcd_Loop:
        BCF		    STATUS,C
		RLF		    TempRam13,F
		RLF		    TempRam12,F
		RLF		    TempRam11,F
		RLF		    TempRam6 ,F
		RLF		    TempRam5 ,F
		RLF		    TempRam4 ,F
		RLF		    TempRam3 ,F
		RLF		    TempRam2 ,F
		RLF		    TempRam1 ,F
		DECFSZ		Buffer5  ,F
		GOTO        Fun_Math_HexToBcdAdjustDec
;----------------------------------------------------------
Fun_Math_SpliteBcd:
        MOVFW       TempRam1
        MOVWF       Buffer0
        
        MOVFW       TempRam2
        MOVWF       Buffer1
        
        MOVFW       TempRam3
        MOVWF       Buffer2
        
        MOVFW       TempRam4
        MOVWF       Buffer3
        
        MOVFW       TempRam5
        MOVWF       Buffer4
        
        MOVFW       TempRam6
        MOVWF       Buffer5
;----------------------------------------------------------
		MOVFW       Buffer5 
		ANDLW		00FH	
		MOVWF		TempRam6
		XCWK_Math_RRF_4BIT  Buffer5
		MOVFW       Buffer5
		andlW		00FH	
		MOVWF		TempRam5
	;---
		MOVFW   	Buffer4
		ANDLW		00FH	
		MOVWF		TempRam4
		XCWK_Math_RRF_4BIT	Buffer4
		MOVFW       Buffer4
		andlW		00FH	
		MOVWF		TempRam3
	;---
		MOVFW   	Buffer3
		ANDLW		00FH	
		MOVWF		TempRam2
		XCWK_Math_RRF_4BIT	Buffer3
		MOVFW       Buffer3
		andlW		00FH	
		MOVWF		TempRam1
	;---
RETURN
Fun_Math_HexToBcdAdjustDec:
		MOVFW       TempRam1
		MOVWF       Buffer6
		CALL		Fun_Math_AdjustBcd
		MOVFW       Buffer6
		MOVWF       TempRam1
	;--
        MOVFW       TempRam2
		MOVWF       Buffer6
		CALL		Fun_Math_AdjustBcd
		MOVFW       Buffer6
		MOVWF       TempRam2
	;--
        MOVFW       TempRam3
		MOVWF       Buffer6
		CALL		Fun_Math_AdjustBcd
		MOVFW       Buffer6
		MOVWF       TempRam3
	;--
        MOVFW       TempRam4
		MOVWF       Buffer6
		CALL		Fun_Math_AdjustBcd
		MOVFW       Buffer6
		MOVWF       TempRam4
	;--
        MOVFW       TempRam5
		MOVWF       Buffer6
		CALL		Fun_Math_AdjustBcd
		MOVFW       Buffer6
		MOVWF       TempRam5
	;--
        MOVFW       TempRam6
		MOVWF       Buffer6
		CALL		Fun_Math_AdjustBcd
		MOVFW       Buffer6
		MOVWF       TempRam6
		GOTO        Fun_Math_HexToBcd_Loop
;------------------------------------
Fun_Math_AdjustBcd:
		MOVLW       003H
		ADDWF       Buffer6,W
		BTFSC       WORK,3
		MOVWF       Buffer6
		MOVLW       030H
		ADDWF       Buffer6,W
		BTFSC       WORK,7
		MOVWF       Buffer6
RETURN

ends
