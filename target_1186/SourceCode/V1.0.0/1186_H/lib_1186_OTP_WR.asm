/**
* @file  lib_OTP_WR.asm
* @brief 
* @author
* @date     2018-12-28
* @version  V1.0.0
* @copyright
*/

lib_OTP_WR_RAM	.section	ram
	CalProgTimes             DS		1    ; FOR OTP
	OTP_ISP_FLAG             DS		1
	  B_OTP_ISP_VPP_ERR      EQU  0
	  B_OTP_ISP_CHK_ERR      EQU  1
	  B_OTP_ISP_TIME_ERR     EQU  2
	  B_OTP_ISP_IS_NULL      EQU  3
.ends

lib_OTP_WR_ROM	.SECTION	ROM

	OTP_Addr                 EQU  Buffer0
	OTP_CNT                  EQU  Buffer1
	OTP_Current_Addr         EQU  Buffer2
	R_BH                     EQU  Buffer3
	R_BL                     EQU  Buffer4
	R_AH                     EQU  Buffer5
	R_AL                     EQU  Buffer6
	
	OTP_ADDR_BASE   EQU  05H

    OTP_ADDR_BASE_H EQU  HIGH OTP_ADDR_BASE
    OTP_ADDR_BASE_L EQU  LOW  OTP_ADDR_BASE

    BIE_DATA_NUM    EQU   6
	MaxCalTimes     EQU   20
	MaxCalTimesA    EQU   MaxCalTimes+1
	BIE_RAM_ADDR    EQU   CalDot1H

;==================================================
;===  Fun_OTP_READ_CAL
;===  Fun_OTP_WRITE_CAL
;==================================================

	
Fun_OTP_WRITE_CAL:
OTP_WRITE_CAL:
    BCF             INTE,GIE
    CLRF            OTP_ISP_FLAG
OTP_WRITE_CAL_ChkTime:
    MOVLW           MaxCalTimes
	XORWF           CalProgTimes,W
	BTFSC           STATUS,Z
	GOTO            OTP_WRITE_CAL_TIMES_ERR
OTP_WRITE_CAL_ConfigDevice:
    MOVLW			10100001B
    MOVWF		    NETF
    MOVLW			00001100B
	MOVWF		    NETD
	MOVLW			00000001B
	MOVWF			LCDENR
	CALL            Fun_Delay_100MS
OTP_WRITE_CAL_LOAD_ADDR:
	INCF            CalProgTimes,F
	MOVFW			CalProgTimes
	MOVWF		    R_BH
	CALL            OTP_Get_Addr
	
	BCF             BSR,IRP0
	MOVLW			BIE_RAM_ADDR
	MOVWF			FSR0
	
	MOVLW			BIE_DATA_NUM
	MOVWF			OTP_CNT
	
	MOVFW			R_AH
    MOVWF			EADRH
    MOVFW			R_AL
	MOVWF			EADRL
	BSF             EADRH,4
OTP_WRITE_CAL_LOOP:
    CLRWDT
    CALL            Fun_Delay_100MS
	BTFSS           NETB,ERV
	GOTO            OTP_WRITE_CAL_VPP_ERR
	MOVFW           IND0
	TBLP            200
	INCF            FSR0 ,F
	MOVLW           001H
	ADDWF           EADRL,F
	MOVLW           00H
	ADDWFC          EADRH,F
	DECFSZ          OTP_CNT,F
	GOTO            OTP_WRITE_CAL_LOOP
OTP_WRITE_CALOK:

    GOTO            OTP_WRITE_CAL_END
OTP_WRITE_CAL_VPP_ERR:
    BSF             OTP_ISP_FLAG,B_OTP_ISP_VPP_ERR
    GOTO            OTP_WRITE_CAL_END
OTP_WRITE_CAL_TIMES_ERR:
    BSF             OTP_ISP_FLAG,B_OTP_ISP_TIME_ERR
OTP_WRITE_CAL_END:
    MOVLW           NETF_CFG_VALUE
    MOVWF           NETF
	MOVLW           NETD_CFG_VALUE
	MOVWF           NETD
	MOVLW           LCDENR_CFG_VALUE
	MOVWF           LCDENR
    BSF             INTE,GIE
RETURN

OTP_Get_Addr:
	CLRF           R_AH
	CLRF           R_AL
	MOVFW		   R_BH
    MOVWF	       R_BL
OTP_Get_Addr_LOOP:
	DECFSZ         R_BL,F
    GOTO           OTP_Get_Addr_ADD
	GOTO           OTP_Get_Addred
OTP_Get_Addr_ADD:
	MOVLW          BIE_DATA_NUM
	ADDWF          R_AL,F
	MOVLW          000H
	ADDWFC         R_AH,F
	GOTO           OTP_Get_Addr_LOOP
OTP_Get_Addred:	
	MOVLW          OTP_ADDR_BASE_L
	ADDWF          R_AL,F
	MOVLW          OTP_ADDR_BASE_H
	ADDWFC         R_AH,F
RETURN

OTP_READ_nBYTE_TO_RAM:
    BCF           BSR,IRP0
    MOVLW		  BIE_RAM_ADDR
	MOVWF		  FSR0
	
	MOVLW		  BIE_DATA_NUM
	MOVWF	  	  R_BL
	
	MOVFW		  R_AH
    MOVWF		  EADRH
    MOVFW		  R_AL
	MOVWF		  EADRL
	BSF           EADRH,4
OTP_READ_nBYTE_TO_RAM_LOOP:
	MOVP
	MOVWF         IND0
	INCF          FSR0,F
	MOVLW         001H
	ADDWF         EADRL,F
	MOVLW         00H
	ADDWFC        EADRH,F
    DECFSZ        R_BL,F
	GOTO          OTP_READ_nBYTE_TO_RAM_LOOP
RETURN

Fun_OTP_READ_CAL:
	MOVLW		  001H
    MOVWF		  R_BH
OTP_READ_HANDLE_LOOP:
    CALL          OTP_Get_Addr
	CALL          OTP_READ_nBYTE_TO_RAM
OTP_READ_CHK_FFH:
    BCF           BSR,IRP0
    MOVLW		  BIE_RAM_ADDR
	MOVWF		  FSR0
	MOVLW		  BIE_DATA_NUM
	MOVWF		  R_AH
    BSF           OTP_ISP_FLAG,B_OTP_ISP_IS_NULL
OTP_READ_CHK_FFH_LOOP:
    MOVLW         0FFH
	XORWF         IND0,W
	BTFSS         STATUS,Z
	BCF           OTP_ISP_FLAG,B_OTP_ISP_IS_NULL
	INCF          FSR0,F
	DECFSZ        R_AH,F
	GOTO          OTP_READ_CHK_FFH_LOOP
OTP_READ_CHK_IS_FFH:
    BTFSC         OTP_ISP_FLAG,B_OTP_ISP_IS_NULL
	GOTO          OTP_READ_IS_FFH
	INCF          R_BH,F
OTP_READ_IS_MAX:
    MOVLW         MaxCalTimesA
	XORWF         R_BH,W
	BTFSS         STATUS,Z
	GOTO          OTP_READ_HANDLE_LOOP
	DECF          R_BH,F
	MOVFW		  R_BH
    MOVWF		  CalProgTimes
	GOTO          OTP_READ_HANDLE_Exit
OTP_READ_IS_FFH:
    MOVLW         001H
	XORWF         R_BH,W
	BTFSC         STATUS,Z
	GOTO          OTP_READ_DEFAULT
	DECF          R_BH,F
	MOVFW		  R_BH
	MOVWF		  CalProgTimes
	CALL          OTP_Get_Addr
	CALL          OTP_READ_nBYTE_TO_RAM
	BCF           OTP_ISP_FLAG,B_OTP_ISP_IS_NULL
	GOTO          OTP_READ_HANDLE_Exit
OTP_READ_DEFAULT:
    CLRF          CalProgTimes
OTP_READ_HANDLE_Exit:

RETURN


.ENDS
