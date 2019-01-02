;============================================
; filename: 1186_K.asm
; chip    : CSU8RP1186
; author  :
; date    : 2019-01-02
;============================================
include "CSU8RP1186.inc"

;============================================
; program start
;============================================ 
CSCC_RES_VECT   .section rom,addr=0x00   
	goto     Prog_Start      	; go to main program
.ends

;============================================
; interrupt vector table
;============================================
CSCC_INT_VECT	.section rom,addr=0x04 
    goto     INT_FUNCTION		; go to interrupt function
.ends

;============================================
; interrupt function
;============================================
INT_FUNCTION_sec .section rom	;
INT_FUNCTION:

.ends
 
;============================================
; main program 
;============================================ 
Prog_Start:  
	
	goto $						; loop forever
.end