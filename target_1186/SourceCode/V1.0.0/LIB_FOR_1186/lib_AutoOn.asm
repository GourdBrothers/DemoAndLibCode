/**
* @file     lib_Auto.ASM
* @brief 
* @author
* @date     2018-12-27
* @version  V1.0.0
* @copyright
*/

lib_Auto_RAM .section bank0

DownADH		DS	1  ; FOR AUTO ON
DownADM		DS	1
DownADL		DS	1

AutoOnADH	DS	1
AutoOnADM	DS	1
AutoOnADL	DS	1

AutoOnWH	DS	1
AutoOnWM	DS	1
AutoOnWL	DS	1

.ends


lib_Auto_ROM .section rom



.ends