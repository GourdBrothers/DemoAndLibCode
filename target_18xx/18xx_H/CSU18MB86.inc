;==============================================
; CSU18MB86 Special Register Address Definition
; Date:2018-11-05
; Version: V1.0.0 
;==============================================

;Data Memory Organization 00h-08h
IND0              EQU              00H     ;{ IND0 }
INDF0	EQU		IND0			
IND1              EQU              01H     ;{ IND1 }
INDF1	EQU		IND1
FSR0              EQU              02H     ;{ FSR0 }
FSR1              EQU              03H     ;{ FSR1 }
STATUS            EQU              04H     ;{ 0, 0, 0, PD, TO, DC, C, Z }
WORK              EQU              05H     ;{ WORK }
INTF              EQU              06H     ;{ 0, 0, TM1IF, TM0IF, AD2IF, ADIF, E1IF, E0IF }
INTE              EQU              07H     ;{ GIE, 0, TM1IE, TM0IE, AD2IE, ADIE, E1IE, E0IE }
BSR               EQU              08H     ;{ IRP0, IRP1, 0, 0, 0, 0, PAGE1, PAGE0 }

;Peripheral special registers 0Ah-7Fh
EADRH             EQU              0AH     ;{ 0, 0, PARH[5:0] }
EADRL             EQU              0BH     ;{ PARL[7:0] }
EDAT              EQU              0CH     ;{ EDAT[7:0] }
EOPEN             EQU              0DH     ;{ EOPEN[7:0] }
WDTCON            EQU              0EH     ;{ WDTEN, 0, 0, 0, 0, WDTS[2:0] }
WDTIN             EQU              0FH     ;{ WDTIN[7:0] }
ADOH              EQU              10H     ;{ ADO[23:16] }
ADOL              EQU              11H     ;{ ADO[15:8] }
ADOLL             EQU              12H     ;{ ADO[7:0] }
ADCON             EQU              13H     ;{ ADM, 0, 0, 0, ADSC, ADM[2:0] }
MCK               EQU              14H     ;{ 0, 0, 0, 0, 0, M2_CK, M1_CK, 0 }
PCK               EQU              15H     ;{ 0, 0, 0, 0, 0, S_beep[1:0], 0 }
NETA              EQU              18H     ;{ SINL[1:0], 0, CM_SEL, 0, 0, 0, 0 }
NETC              EQU              1AH     ;{ CHOPM[1:0], 0, 0, ADG[1:0], ADEN, 0 }
NETE              EQU              1CH     ;{ LDOS[1:0], 0, SILB[2:0], ENLB, LB_RST_CON }
NETF              EQU              1DH     ;{ 0, 0, LDOEN, 0, 0, BGID[1:0], 0 }
SVD               EQU              1FH     ;{ 0, 0, 0, 0, 0, 0, 0, LBOUT }
PT1               EQU              20H     ;{ 0, 0, 0, 0, PT1[3:0] }
PT1EN             EQU              21H     ;{ 0, 0, 0, 0, PT1EN[3:0] }
PT1PU             EQU              22H     ;{ 0, 0, 0, 0, PT1PU[3:0] }
AIENB             EQU              23H     ;{ AIENB3, 0, 0, AIENB2, AIENB1, 0, 0, 0 }
PT2               EQU              24H     ;{ PT2[7:0] }
PT2EN             EQU              25H     ;{ PT2EN[7:0] }
PT2PU             EQU              26H     ;{ PT2PU[7:0] }
PT4               EQU              27H     ;{ PT4[7:0] }
PT4EN             EQU              28H     ;{ PT4EN[7:0] }
PT4PU             EQU              29H     ;{ PT4PU[7:0] }
PT1CON            EQU              2DH     ;{ BZEN, 0, 0, 0, E1M[1:0], E0M[1:0] }
PT2CON            EQU              2EH     ;{ PT2CON[7:0] }
PTINT             EQU              2FH     ;{ PTW1[3:0], PTW0[3:0] }
INTF2             EQU              32H     ;{ 0, 0, 0, 0, RTCIF, SPIIF, URTIF, URRIF }
INTE2             EQU              33H     ;{ 0, 0, 0, 0, RTCIE, SPIIE, URTIE, URRIE }
TM0CON            EQU              34H     ;{ T0EN, T0RATE[2:0], 0, T0RSTB, 0, T0SEL }
TM0IN             EQU              35H     ;{ TM0IN[7:0] }
TM0CNT            EQU              36H     ;{ TM0CNT[7:0] }
TM1CON            EQU              37H     ;{ T1EN, T1RATE[2:0], T1CKS, T1RSTB, T1OUT, PWM1OUT }
TM1IN             EQU              38H     ;{ TM1IN[7:0] }
TM1CNT            EQU              39H     ;{ TM1CNT[7:0] }
TM1R              EQU              3AH     ;{ TM1R[7:0] }
LED1              EQU              3BH     ;{ LED1[7:0] }
LED2              EQU              3CH     ;{ LED2[7:0] }
LED3              EQU              3DH     ;{ LED3[7:0] }
LED4              EQU              3EH     ;{ LED4[7:0] }
LED5              EQU              3FH     ;{ LED5[7:0] }
LED6              EQU              40H     ;{ LED6[7:0] }
LED7              EQU              41H     ;{ LED7[7:0] }
LEDCON1           EQU              42H     ;{ LED_CURRENT[2:0], LCD_DUTY[1:0], LEDCLKS[1:0], LED_PMODE }
LEDCON2           EQU              43H     ;{ 0, 0, 0, 0, 0, 0, 0, LEDEN }
CHPCON            EQU              44H     ;{ 0, 0, 0, CHPVS, 0, CHPCLKS[1:0], CHPEN }
AD2OH             EQU              48H     ;{ AD2EN, 0, 0, 0, 0, 0, AD2O[9:8] }
AD2OL             EQU              49H     ;{ AD2O[7:0] }
FILCON            EQU              4AH     ;{ 0, 0, 0, FIL2_EN, 0, 0, 0, FIL1_EN }
DTHREH            EQU              4BH     ;{ DATA_THRE[15:8] }
DTHREL            EQU              4CH     ;{ DATA_THRE[7:0] }
NTHRE             EQU              4DH     ;{ 0, 0, NTHRE[5:0] }
NCON              EQU              4EH     ;{ 0, 0, 0, 0, 0, NSEL[2:0] }
SPICFG            EQU              50H     ;{ SPIEN, MSTEN, CKPHA, CKPOL, MULMST, WIREMOD, SPIBSY, SPIRST }
SPICN             EQU              51H     ;{ SLVSEL, WCOL, MODCOL, 0, 0, 0, 0, 0 }
SPICKR            EQU              52H     ;{ SCR[7:0] }
SPIDAT            EQU              53H     ;{ SPIDAT[7:0] }
TEMPC             EQU              59H     ;{ TEMPC[7:0] }
RTCCON            EQU              60H     ;{ LIR, 0, RTCCON_24hr_12hr, 0, RTCEN, 0, 0, 0 }
RTCAER            EQU              61H     ;{ AER[7:0] }
RTCYEAR           EQU              62H     ;{ RTCYEAR_10YEAR[7:4], RTCYEAR_1YEAR[3:0] }
RTCMON            EQU              63H     ;{ 0, 0, 0, RTCMON_10MON, RTCMON_1MON[3:0] }
RTCDAY            EQU              64H     ;{ 0, 0, RTCDAY_10DAY[5:4], RTCDAY_1DAT[3:0] }
RTCHOUR           EQU              65H     ;{ 0, 0, RTCHOUR_10HOUR10[5:4], RTCHOUR_1HOUR[3:0] }
RTCMIN            EQU              66H     ;{ 0, RTCMIN_10MIN[6:4], RTCMIN_1MIN[3:0] }
RTCSEC            EQU              67H     ;{ 0, RTCSEC_10SEC[6:4], RTCSEC_1SEC[3:0] }
RTCDWR            EQU              68H     ;{ 0, 0, 0, 0, 0, DWR[2:0] }
INTEGER           EQU              69H     ;{ 0, 0, 0, 0, INTEGER[3:0] }
FRACTION          EQU              6AH     ;{ 0, 0, FRACTION[5:0] }
WDT_C             EQU              6DH     ;{ 0, 0, 0, 0, 0, WDT_C[2:0] }
IOSC_C            EQU              6EH     ;{ IOSC_C[7:0] }
VS_C              EQU              6FH     ;{ 0, 0, 0, 0, VS_C[3:0] }
TMODE             EQU              71H     ;{ sim_rst, 0, 0, 0, 0, 0, TMOD[1:0] }
SCON1             EQU              7AH     ;{ SM0, SM1, SM2, REN, TB8, RB8, UART_SEL, UARTEN }
SCON2             EQU              7BH     ;{ SMOD, UARTCLKS, 0, 0, 0, 0, 0, 0 }
SBUF              EQU              7CH     ;{ SBUF }
LEDTEST1          EQU              7DH     ;{ LEDTEST1[7:0] }
METCH             EQU              7EH     ;{ METCH[7:0] }
LEDTEST2          EQU              7FH     ;{ LEDTEST2[7:0] }

;-------------------------------------------------------
;  STATUS register bit map
;-------------------------------------------------------
Z                 EQU              0
C                 EQU              1
DC                EQU              2
TO                EQU              3
PD                EQU              4

;-------------------------------------------------------
;  INTF register bit map
;-------------------------------------------------------
E0IF              EQU              0
E1IF              EQU              1
ADIF              EQU              2
AD2IF             EQU              3
TM0IF             EQU              4
TM1IF             EQU              5

;-------------------------------------------------------
;  INTE register bit map
;-------------------------------------------------------
E0IE              EQU              0
E1IE              EQU              1
ADIE              EQU              2
AD2IE             EQU              3
TM0IE             EQU              4
TM1IE             EQU              5
GIE               EQU              7

;-------------------------------------------------------
;  BSR register bit map
;-------------------------------------------------------
PAGE0             EQU              0
PAGE1             EQU              1
IRP1              EQU              6
IRP0              EQU              7

;-------------------------------------------------------
;  EADRH register bit map
;-------------------------------------------------------
PARH_0            EQU              0
PARH_1            EQU              1
PARH_2            EQU              2
PARH_3            EQU              3
PARH_4            EQU              4
PARH_5            EQU              5

;-------------------------------------------------------
;  EADRL register bit map
;-------------------------------------------------------
PARL_0            EQU              0
PARL_1            EQU              1
PARL_2            EQU              2
PARL_3            EQU              3
PARL_4            EQU              4
PARL_5            EQU              5
PARL_6            EQU              6
PARL_7            EQU              7

;-------------------------------------------------------
;  EDAT register bit map
;-------------------------------------------------------
EDAT_0            EQU              0
EDAT_1            EQU              1
EDAT_2            EQU              2
EDAT_3            EQU              3
EDAT_4            EQU              4
EDAT_5            EQU              5
EDAT_6            EQU              6
EDAT_7            EQU              7

;-------------------------------------------------------
;  EOPEN register bit map
;-------------------------------------------------------
EOPEN_0           EQU              0
EOPEN_1           EQU              1
EOPEN_2           EQU              2
EOPEN_3           EQU              3
EOPEN_4           EQU              4
EOPEN_5           EQU              5
EOPEN_6           EQU              6
EOPEN_7           EQU              7

;-------------------------------------------------------
;  WDTCON register bit map
;-------------------------------------------------------
WDTS_0            EQU              0
WDTS_1            EQU              1
WDTS_2            EQU              2
WDTEN             EQU              7

;-------------------------------------------------------
;  WDTIN register bit map
;-------------------------------------------------------
WDTIN_0           EQU              0
WDTIN_1           EQU              1
WDTIN_2           EQU              2
WDTIN_3           EQU              3
WDTIN_4           EQU              4
WDTIN_5           EQU              5
WDTIN_6           EQU              6
WDTIN_7           EQU              7

;-------------------------------------------------------
;  ADOH register bit map
;-------------------------------------------------------
ADO_16            EQU              0
ADO_17            EQU              1
ADO_18            EQU              2
ADO_19            EQU              3
ADO_20            EQU              4
ADO_21            EQU              5
ADO_22            EQU              6
ADO_23            EQU              7

;-------------------------------------------------------
;  ADOL register bit map
;-------------------------------------------------------
ADO_8             EQU              0
ADO_9             EQU              1
ADO_10            EQU              2
ADO_11            EQU              3
ADO_12            EQU              4
ADO_13            EQU              5
ADO_14            EQU              6
ADO_15            EQU              7

;-------------------------------------------------------
;  ADOLL register bit map
;-------------------------------------------------------
ADO_0             EQU              0
ADO_1             EQU              1
ADO_2             EQU              2
ADO_3             EQU              3
ADO_4             EQU              4
ADO_5             EQU              5
ADO_6             EQU              6
ADO_7             EQU              7

;-------------------------------------------------------
;  ADCON register bit map
;-------------------------------------------------------
ADM_0             EQU              0
ADM_1             EQU              1
ADM_2             EQU              2
ADSC              EQU              3
ADM_3             EQU              7

;-------------------------------------------------------
;  MCK register bit map
;-------------------------------------------------------
M1_CK             EQU              1
M2_CK             EQU              2

;-------------------------------------------------------
;  PCK register bit map
;-------------------------------------------------------
S_beep_0          EQU              1
S_beep_1          EQU              2

;-------------------------------------------------------
;  NETA register bit map
;-------------------------------------------------------
CM_SEL            EQU              4
SINL_0            EQU              6
SINL_1            EQU              7

;-------------------------------------------------------
;  NETC register bit map
;-------------------------------------------------------
ADEN              EQU              1
ADG_0             EQU              2
ADG_1             EQU              3
CHOPM_0           EQU              6
CHOPM_1           EQU              7

;-------------------------------------------------------
;  NETE register bit map
;-------------------------------------------------------
LB_RST_CON        EQU              0
ENLB              EQU              1
SILB_0            EQU              2
SILB_1            EQU              3
SILB_2            EQU              4
LDOS_0            EQU              6
LDOS_1            EQU              7

;-------------------------------------------------------
;  NETF register bit map
;-------------------------------------------------------
BGID_0            EQU              1
BGID_1            EQU              2
LDOEN             EQU              5

;-------------------------------------------------------
;  SVD register bit map
;-------------------------------------------------------
LBOUT             EQU              0

;-------------------------------------------------------
;  PT1 register bit map
;-------------------------------------------------------
PT1_0             EQU              0
PT1_1             EQU              1
PT1_2             EQU              2
PT1_3             EQU              3

;-------------------------------------------------------
;  PT1EN register bit map
;-------------------------------------------------------
PT1EN_0           EQU              0
PT1EN_1           EQU              1
PT1EN_2           EQU              2
PT1EN_3           EQU              3

;-------------------------------------------------------
;  PT1PU register bit map
;-------------------------------------------------------
PT1PU_0           EQU              0
PT1PU_1           EQU              1
PT1PU_2           EQU              2
PT1PU_3           EQU              3

;-------------------------------------------------------
;  AIENB register bit map
;-------------------------------------------------------
AIENB1            EQU              3
AIENB2            EQU              4
AIENB3            EQU              7

;-------------------------------------------------------
;  PT2 register bit map
;-------------------------------------------------------
PT2_0             EQU              0
PT2_1             EQU              1
PT2_2             EQU              2
PT2_3             EQU              3
PT2_4             EQU              4
PT2_5             EQU              5
PT2_6             EQU              6
PT2_7             EQU              7

;-------------------------------------------------------
;  PT2EN register bit map
;-------------------------------------------------------
PT2EN_0           EQU              0
PT2EN_1           EQU              1
PT2EN_2           EQU              2
PT2EN_3           EQU              3
PT2EN_4           EQU              4
PT2EN_5           EQU              5
PT2EN_6           EQU              6
PT2EN_7           EQU              7

;-------------------------------------------------------
;  PT2PU register bit map
;-------------------------------------------------------
PT2PU_0           EQU              0
PT2PU_1           EQU              1
PT2PU_2           EQU              2
PT2PU_3           EQU              3
PT2PU_4           EQU              4
PT2PU_5           EQU              5
PT2PU_6           EQU              6
PT2PU_7           EQU              7

;-------------------------------------------------------
;  PT4 register bit map
;-------------------------------------------------------
PT4_0             EQU              0
PT4_1             EQU              1
PT4_2             EQU              2
PT4_3             EQU              3
PT4_4             EQU              4
PT4_5             EQU              5
PT4_6             EQU              6
PT4_7             EQU              7

;-------------------------------------------------------
;  PT4EN register bit map
;-------------------------------------------------------
PT4EN_0           EQU              0
PT4EN_1           EQU              1
PT4EN_2           EQU              2
PT4EN_3           EQU              3
PT4EN_4           EQU              4
PT4EN_5           EQU              5
PT4EN_6           EQU              6
PT4EN_7           EQU              7

;-------------------------------------------------------
;  PT4PU register bit map
;-------------------------------------------------------
PT4PU_0           EQU              0
PT4PU_1           EQU              1
PT4PU_2           EQU              2
PT4PU_3           EQU              3
PT4PU_4           EQU              4
PT4PU_5           EQU              5
PT4PU_6           EQU              6
PT4PU_7           EQU              7

;-------------------------------------------------------
;  PT1CON register bit map
;-------------------------------------------------------
E0M_0             EQU              0
E0M_1             EQU              1
E1M_0             EQU              2
E1M_1             EQU              3
BZEN              EQU              7

;-------------------------------------------------------
;  PT2CON register bit map
;-------------------------------------------------------
PT2CON_0          EQU              0
PT2CON_1          EQU              1
PT2CON_2          EQU              2
PT2CON_3          EQU              3
PT2CON_4          EQU              4
PT2CON_5          EQU              5
PT2CON_6          EQU              6
PT2CON_7          EQU              7

;-------------------------------------------------------
;  PTINT register bit map
;-------------------------------------------------------
PTW0_0            EQU              0
PTW0_1            EQU              1
PTW0_2            EQU              2
PTW0_3            EQU              3
PTW1_0            EQU              4
PTW1_1            EQU              5
PTW1_2            EQU              6
PTW1_3            EQU              7

;-------------------------------------------------------
;  INTF2 register bit map
;-------------------------------------------------------
URRIF             EQU              0
URTIF             EQU              1
SPIIF             EQU              2
RTCIF             EQU              3

;-------------------------------------------------------
;  INTE2 register bit map
;-------------------------------------------------------
URRIE             EQU              0
URTIE             EQU              1
SPIIE             EQU              2
RTCIE             EQU              3

;-------------------------------------------------------
;  TM0CON register bit map
;-------------------------------------------------------
T0SEL             EQU              0
T0RSTB            EQU              2
T0RATE_0          EQU              4
T0RATE_1          EQU              5
T0RATE_2          EQU              6
T0EN              EQU              7

;-------------------------------------------------------
;  TM0IN register bit map
;-------------------------------------------------------
TM0IN_0           EQU              0
TM0IN_1           EQU              1
TM0IN_2           EQU              2
TM0IN_3           EQU              3
TM0IN_4           EQU              4
TM0IN_5           EQU              5
TM0IN_6           EQU              6
TM0IN_7           EQU              7

;-------------------------------------------------------
;  TM0CNT register bit map
;-------------------------------------------------------
TM0CNT_0          EQU              0
TM0CNT_1          EQU              1
TM0CNT_2          EQU              2
TM0CNT_3          EQU              3
TM0CNT_4          EQU              4
TM0CNT_5          EQU              5
TM0CNT_6          EQU              6
TM0CNT_7          EQU              7

;-------------------------------------------------------
;  TM1CON register bit map
;-------------------------------------------------------
PWM1OUT           EQU              0
T1OUT             EQU              1
T1RSTB            EQU              2
T1CKS             EQU              3
T1RATE_0          EQU              4
T1RATE_1          EQU              5
T1RATE_2          EQU              6
T1EN              EQU              7

;-------------------------------------------------------
;  TM1IN register bit map
;-------------------------------------------------------
TM1IN_0           EQU              0
TM1IN_1           EQU              1
TM1IN_2           EQU              2
TM1IN_3           EQU              3
TM1IN_4           EQU              4
TM1IN_5           EQU              5
TM1IN_6           EQU              6
TM1IN_7           EQU              7

;-------------------------------------------------------
;  TM1CNT register bit map
;-------------------------------------------------------
TM1CNT_0          EQU              0
TM1CNT_1          EQU              1
TM1CNT_2          EQU              2
TM1CNT_3          EQU              3
TM1CNT_4          EQU              4
TM1CNT_5          EQU              5
TM1CNT_6          EQU              6
TM1CNT_7          EQU              7

;-------------------------------------------------------
;  TM1R register bit map
;-------------------------------------------------------
TM1R_0            EQU              0
TM1R_1            EQU              1
TM1R_2            EQU              2
TM1R_3            EQU              3
TM1R_4            EQU              4
TM1R_5            EQU              5
TM1R_6            EQU              6
TM1R_7            EQU              7

;-------------------------------------------------------
;  LED1 register bit map
;-------------------------------------------------------
LED1_0            EQU              0
LED1_1            EQU              1
LED1_2            EQU              2
LED1_3            EQU              3
LED1_4            EQU              4
LED1_5            EQU              5
LED1_6            EQU              6
LED1_7            EQU              7

;-------------------------------------------------------
;  LED2 register bit map
;-------------------------------------------------------
LED2_0            EQU              0
LED2_1            EQU              1
LED2_2            EQU              2
LED2_3            EQU              3
LED2_4            EQU              4
LED2_5            EQU              5
LED2_6            EQU              6
LED2_7            EQU              7

;-------------------------------------------------------
;  LED3 register bit map
;-------------------------------------------------------
LED3_0            EQU              0
LED3_1            EQU              1
LED3_2            EQU              2
LED3_3            EQU              3
LED3_4            EQU              4
LED3_5            EQU              5
LED3_6            EQU              6
LED3_7            EQU              7

;-------------------------------------------------------
;  LED4 register bit map
;-------------------------------------------------------
LED4_0            EQU              0
LED4_1            EQU              1
LED4_2            EQU              2
LED4_3            EQU              3
LED4_4            EQU              4
LED4_5            EQU              5
LED4_6            EQU              6
LED4_7            EQU              7

;-------------------------------------------------------
;  LED5 register bit map
;-------------------------------------------------------
LED5_0            EQU              0
LED5_1            EQU              1
LED5_2            EQU              2
LED5_3            EQU              3
LED5_4            EQU              4
LED5_5            EQU              5
LED5_6            EQU              6
LED5_7            EQU              7

;-------------------------------------------------------
;  LED6 register bit map
;-------------------------------------------------------
LED6_0            EQU              0
LED6_1            EQU              1
LED6_2            EQU              2
LED6_3            EQU              3
LED6_4            EQU              4
LED6_5            EQU              5
LED6_6            EQU              6
LED6_7            EQU              7

;-------------------------------------------------------
;  LED7 register bit map
;-------------------------------------------------------
LED7_0            EQU              0
LED7_1            EQU              1
LED7_2            EQU              2
LED7_3            EQU              3
LED7_4            EQU              4
LED7_5            EQU              5
LED7_6            EQU              6
LED7_7            EQU              7

;-------------------------------------------------------
;  LEDCON1 register bit map
;-------------------------------------------------------
LED_PMODE         EQU              0
LEDCLKS_0         EQU              1
LEDCLKS_1         EQU              2
LCD_DUTY_0        EQU              3
LCD_DUTY_1        EQU              4
LED_CURRENT_0        EQU              5
LED_CURRENT_1        EQU              6
LED_CURRENT_2        EQU              7

;-------------------------------------------------------
;  LEDCON2 register bit map
;-------------------------------------------------------
LEDEN             EQU              0

;-------------------------------------------------------
;  CHPCON register bit map
;-------------------------------------------------------
CHPEN             EQU              0
CHPCLKS_0         EQU              1
CHPCLKS_1         EQU              2
CHPVS             EQU              4

;-------------------------------------------------------
;  AD2OH register bit map
;-------------------------------------------------------
AD2O_8            EQU              0
AD2O_9            EQU              1
AD2EN             EQU              7

;-------------------------------------------------------
;  AD2OL register bit map
;-------------------------------------------------------
AD2O_0            EQU              0
AD2O_1            EQU              1
AD2O_2            EQU              2
AD2O_3            EQU              3
AD2O_4            EQU              4
AD2O_5            EQU              5
AD2O_6            EQU              6
AD2O_7            EQU              7

;-------------------------------------------------------
;  FILCON register bit map
;-------------------------------------------------------
FIL1_EN           EQU              0
FIL2_EN           EQU              4

;-------------------------------------------------------
;  DTHREH register bit map
;-------------------------------------------------------
DATA_THRE_8        EQU              0
DATA_THRE_9        EQU              1
DATA_THRE_10        EQU              2
DATA_THRE_11        EQU              3
DATA_THRE_12        EQU              4
DATA_THRE_13        EQU              5
DATA_THRE_14        EQU              6
DATA_THRE_15        EQU              7

;-------------------------------------------------------
;  DTHREL register bit map
;-------------------------------------------------------
DATA_THRE_0        EQU              0
DATA_THRE_1        EQU              1
DATA_THRE_2        EQU              2
DATA_THRE_3        EQU              3
DATA_THRE_4        EQU              4
DATA_THRE_5        EQU              5
DATA_THRE_6        EQU              6
DATA_THRE_7        EQU              7

;-------------------------------------------------------
;  NTHRE register bit map
;-------------------------------------------------------
NTHRE_0           EQU              0
NTHRE_1           EQU              1
NTHRE_2           EQU              2
NTHRE_3           EQU              3
NTHRE_4           EQU              4
NTHRE_5           EQU              5

;-------------------------------------------------------
;  NCON register bit map
;-------------------------------------------------------
NSEL_0            EQU              0
NSEL_1            EQU              1
NSEL_2            EQU              2

;-------------------------------------------------------
;  SPICFG register bit map
;-------------------------------------------------------
SPIRST            EQU              0
SPIBSY            EQU              1
WIREMOD           EQU              2
MULMST            EQU              3
CKPOL             EQU              4
CKPHA             EQU              5
MSTEN             EQU              6
SPIEN             EQU              7

;-------------------------------------------------------
;  SPICN register bit map
;-------------------------------------------------------
MODCOL            EQU              5
WCOL              EQU              6
SLVSEL            EQU              7

;-------------------------------------------------------
;  SPICKR register bit map
;-------------------------------------------------------
SCR_0             EQU              0
SCR_1             EQU              1
SCR_2             EQU              2
SCR_3             EQU              3
SCR_4             EQU              4
SCR_5             EQU              5
SCR_6             EQU              6
SCR_7             EQU              7

;-------------------------------------------------------
;  SPIDAT register bit map
;-------------------------------------------------------
SPIDAT_0          EQU              0
SPIDAT_1          EQU              1
SPIDAT_2          EQU              2
SPIDAT_3          EQU              3
SPIDAT_4          EQU              4
SPIDAT_5          EQU              5
SPIDAT_6          EQU              6
SPIDAT_7          EQU              7

;-------------------------------------------------------
;  TEMPC register bit map
;-------------------------------------------------------
TEMPC_0           EQU              0
TEMPC_1           EQU              1
TEMPC_2           EQU              2
TEMPC_3           EQU              3
TEMPC_4           EQU              4
TEMPC_5           EQU              5
TEMPC_6           EQU              6
TEMPC_7           EQU              7

;-------------------------------------------------------
;  RTCCON register bit map
;-------------------------------------------------------
RTCEN             EQU              3
RTCCON_24hr_12hr        EQU              5
LIR               EQU              7

;-------------------------------------------------------
;  RTCAER register bit map
;-------------------------------------------------------
AER_0             EQU              0
AER_1             EQU              1
AER_2             EQU              2
AER_3             EQU              3
AER_4             EQU              4
AER_5             EQU              5
AER_6             EQU              6
AER_7             EQU              7

;-------------------------------------------------------
;  RTCYEAR register bit map
;-------------------------------------------------------
RTCYEAR_1YEAR_0        EQU              0
RTCYEAR_1YEAR_1        EQU              1
RTCYEAR_1YEAR_2        EQU              2
RTCYEAR_1YEAR_3        EQU              3
RTCYEAR_10YEAR_0        EQU              4
RTCYEAR_10YEAR_1        EQU              5
RTCYEAR_10YEAR_2        EQU              6
RTCYEAR_10YEAR_3        EQU              7

;-------------------------------------------------------
;  RTCMON register bit map
;-------------------------------------------------------
RTCMON_1MON_0        EQU              0
RTCMON_1MON_1        EQU              1
RTCMON_1MON_2        EQU              2
RTCMON_1MON_3        EQU              3
RTCMON_10MON        EQU              4

;-------------------------------------------------------
;  RTCDAY register bit map
;-------------------------------------------------------
RTCDAY_1DAT_0        EQU              0
RTCDAY_1DAT_1        EQU              1
RTCDAY_1DAT_2        EQU              2
RTCDAY_1DAT_3        EQU              3
RTCDAY_10DAY_0        EQU              4
RTCDAY_10DAY_1        EQU              5

;-------------------------------------------------------
;  RTCHOUR register bit map
;-------------------------------------------------------
RTCHOUR_1HOUR_0        EQU              0
RTCHOUR_1HOUR_1        EQU              1
RTCHOUR_1HOUR_2        EQU              2
RTCHOUR_1HOUR_3        EQU              3
RTCHOUR_10HOUR10_0        EQU              4
RTCHOUR_10HOUR10_1        EQU              5

;-------------------------------------------------------
;  RTCMIN register bit map
;-------------------------------------------------------
RTCMIN_1MIN_0        EQU              0
RTCMIN_1MIN_1        EQU              1
RTCMIN_1MIN_2        EQU              2
RTCMIN_1MIN_3        EQU              3
RTCMIN_10MIN_0        EQU              4
RTCMIN_10MIN_1        EQU              5
RTCMIN_10MIN_2        EQU              6

;-------------------------------------------------------
;  RTCSEC register bit map
;-------------------------------------------------------
RTCSEC_1SEC_0        EQU              0
RTCSEC_1SEC_1        EQU              1
RTCSEC_1SEC_2        EQU              2
RTCSEC_1SEC_3        EQU              3
RTCSEC_10SEC_0        EQU              4
RTCSEC_10SEC_1        EQU              5
RTCSEC_10SEC_2        EQU              6

;-------------------------------------------------------
;  RTCDWR register bit map
;-------------------------------------------------------
DWR_0             EQU              0
DWR_1             EQU              1
DWR_2             EQU              2

;-------------------------------------------------------
;  INTEGER register bit map
;-------------------------------------------------------
INTEGER_0         EQU              0
INTEGER_1         EQU              1
INTEGER_2         EQU              2
INTEGER_3         EQU              3

;-------------------------------------------------------
;  FRACTION register bit map
;-------------------------------------------------------
FRACTION_0        EQU              0
FRACTION_1        EQU              1
FRACTION_2        EQU              2
FRACTION_3        EQU              3
FRACTION_4        EQU              4
FRACTION_5        EQU              5

;-------------------------------------------------------
;  WDT_C register bit map
;-------------------------------------------------------
WDT_C_0           EQU              0
WDT_C_1           EQU              1
WDT_C_2           EQU              2

;-------------------------------------------------------
;  IOSC_C register bit map
;-------------------------------------------------------
IOSC_C_0          EQU              0
IOSC_C_1          EQU              1
IOSC_C_2          EQU              2
IOSC_C_3          EQU              3
IOSC_C_4          EQU              4
IOSC_C_5          EQU              5
IOSC_C_6          EQU              6
IOSC_C_7          EQU              7

;-------------------------------------------------------
;  VS_C register bit map
;-------------------------------------------------------
VS_C_0            EQU              0
VS_C_1            EQU              1
VS_C_2            EQU              2
VS_C_3            EQU              3

;-------------------------------------------------------
;  TMODE register bit map
;-------------------------------------------------------
TMOD_0            EQU              0
TMOD_1            EQU              1
sim_rst           EQU              7

;-------------------------------------------------------
;  SCON1 register bit map
;-------------------------------------------------------
UARTEN            EQU              0
UART_SEL          EQU              1
RB8               EQU              2
TB8               EQU              3
REN               EQU              4
SM2               EQU              5
SM1               EQU              6
SM0               EQU              7

;-------------------------------------------------------
;  SCON2 register bit map
;-------------------------------------------------------
UARTCLKS          EQU              6
SMOD              EQU              7

;-------------------------------------------------------
;  LEDTEST1 register bit map
;-------------------------------------------------------
LEDTEST1_0        EQU              0
LEDTEST1_1        EQU              1
LEDTEST1_2        EQU              2
LEDTEST1_3        EQU              3
LEDTEST1_4        EQU              4
LEDTEST1_5        EQU              5
LEDTEST1_6        EQU              6
LEDTEST1_7        EQU              7

;-------------------------------------------------------
;  METCH register bit map
;-------------------------------------------------------
METCH_0           EQU              0
METCH_1           EQU              1
METCH_2           EQU              2
METCH_3           EQU              3
METCH_4           EQU              4
METCH_5           EQU              5
METCH_6           EQU              6
METCH_7           EQU              7

;-------------------------------------------------------
;  LEDTEST2 register bit map
;-------------------------------------------------------
LEDTEST2_0        EQU              0
LEDTEST2_1        EQU              1
LEDTEST2_2        EQU              2
LEDTEST2_3        EQU              3
LEDTEST2_4        EQU              4
LEDTEST2_5        EQU              5
LEDTEST2_6        EQU              6
LEDTEST2_7        EQU              7

F	EQU		1
W	EQU		1

