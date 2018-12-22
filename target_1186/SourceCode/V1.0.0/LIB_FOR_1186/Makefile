###################################################
#工具链定义处
###################################################
TOOLCHAIN_DIR = C:/Program Files (x86)/Chipsea/CSU-IDE V5.3.0/chipsea/tools/Compiler/ASM
ASM	   				= "$(TOOLCHAIN_DIR)\csasm.exe"
LINKER 				= "$(TOOLCHAIN_DIR)\cslinker.exe"
LIBMAKER 			= "$(TOOLCHAIN_DIR)\CSLibMaker.exe"
RM	   				= del /F 1>NUL 2>NUL
ECHO					= @echo //-----------------------------------------------------------------------



###################################################
#编译选项定义处
###################################################
OUTPUT_DIR            = G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\.\Release
INTERTMP_DIR          = G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\.\Release
PROJ_PATH			  = G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186
PROJ_NAME			  = LIB_FOR_1186
BODY_NAME			  = CSU8RP1186
ASMFLAGS              = -no-warn -filetype=obj -arch=cscc -fill=0xffff -chip=CSU8RP1186 -mattr=c16 -BankCount=2
LINKFLAGS             = -t asm -bt 16
LIBMAKERFLAGS         = -chiptype 16 -debuginfo RemoveDebugInfo -encodeinfo Encryption
CODE_OPTION			  = %%CodeOption%%
ASM_FILES			  = "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\Sys_Main.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\Sys_PowerOn.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\user_ISR.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\user_LCD.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleDisp.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleDisp_Cal.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleDisp_Weight.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleHanlde_Cal.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleHanlde_Weight.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleInit.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleMain.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_3weightCal.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_adc.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_utiliy.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_ISR.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_LCD.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_Math.asm" \
"G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_OTP_WR.asm"

OBJ_FILES			  = "$(INTERTMP_DIR)\Sys_Main.obj" \
"$(INTERTMP_DIR)\Sys_PowerOn.obj" \
"$(INTERTMP_DIR)\user_ISR.obj" \
"$(INTERTMP_DIR)\user_LCD.obj" \
"$(INTERTMP_DIR)\ScaleDisp.obj" \
"$(INTERTMP_DIR)\ScaleDisp_Cal.obj" \
"$(INTERTMP_DIR)\ScaleDisp_Weight.obj" \
"$(INTERTMP_DIR)\ScaleHanlde_Cal.obj" \
"$(INTERTMP_DIR)\ScaleHanlde_Weight.obj" \
"$(INTERTMP_DIR)\ScaleInit.obj" \
"$(INTERTMP_DIR)\ScaleMain.obj" \
"$(INTERTMP_DIR)\lib_3weightCal.obj" \
"$(INTERTMP_DIR)\lib_adc.obj" \
"$(INTERTMP_DIR)\lib_utiliy.obj" \
"$(INTERTMP_DIR)\lib_ISR.obj" \
"$(INTERTMP_DIR)\lib_LCD.obj" \
"$(INTERTMP_DIR)\lib_Math.obj" \
"$(INTERTMP_DIR)\lib_OTP_WR.obj"

OUTPUT_FILE_TYPE	  = binfile
OUTPUT_FILE_EXTENSION = hex
OUTPUT_OTHER_FILES	  = "$(INTERTMP_DIR)\*.asm" \
						    "$(INTERTMP_DIR)\*.obj" \
                            "$(INTERTMP_DIR)\*.map"	\
							"$(INTERTMP_DIR)\*.txt"	\
						    "$(INTERTMP_DIR)\*.xml" \
							"$(INTERTMP_DIR)\*.sbms" \
							"$(INTERTMP_DIR)\*.cscc_bk"



###################################################
#.ASM文件到.OBJ文件
###################################################
"$(INTERTMP_DIR)\Sys_Main.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\Sys_Main.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\Sys_Main.asm" -o "$(INTERTMP_DIR)\Sys_Main.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\Sys_PowerOn.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\Sys_PowerOn.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\Sys_PowerOn.asm" -o "$(INTERTMP_DIR)\Sys_PowerOn.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\user_ISR.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\user_ISR.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\user_ISR.asm" -o "$(INTERTMP_DIR)\user_ISR.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\user_LCD.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\user_LCD.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\user_LCD.asm" -o "$(INTERTMP_DIR)\user_LCD.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\ScaleDisp.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleDisp.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleDisp.asm" -o "$(INTERTMP_DIR)\ScaleDisp.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\ScaleDisp_Cal.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleDisp_Cal.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleDisp_Cal.asm" -o "$(INTERTMP_DIR)\ScaleDisp_Cal.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\ScaleDisp_Weight.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleDisp_Weight.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleDisp_Weight.asm" -o "$(INTERTMP_DIR)\ScaleDisp_Weight.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\ScaleHanlde_Cal.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleHanlde_Cal.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleHanlde_Cal.asm" -o "$(INTERTMP_DIR)\ScaleHanlde_Cal.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\ScaleHanlde_Weight.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleHanlde_Weight.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleHanlde_Weight.asm" -o "$(INTERTMP_DIR)\ScaleHanlde_Weight.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\ScaleInit.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleInit.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleInit.asm" -o "$(INTERTMP_DIR)\ScaleInit.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\ScaleMain.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleMain.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\ScaleMain.asm" -o "$(INTERTMP_DIR)\ScaleMain.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_3weightCal.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_3weightCal.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_3weightCal.asm" -o "$(INTERTMP_DIR)\lib_3weightCal.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_adc.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_adc.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_adc.asm" -o "$(INTERTMP_DIR)\lib_adc.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_utiliy.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_utiliy.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_utiliy.asm" -o "$(INTERTMP_DIR)\lib_utiliy.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_ISR.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_ISR.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_ISR.asm" -o "$(INTERTMP_DIR)\lib_ISR.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_LCD.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_LCD.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_LCD.asm" -o "$(INTERTMP_DIR)\lib_LCD.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_Math.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_Math.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_Math.asm" -o "$(INTERTMP_DIR)\lib_Math.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_OTP_WR.obj" : "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_OTP_WR.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\traget_1186\SourceCode\V1.0.0\LIB_FOR_1186\lib_OTP_WR.asm" -o "$(INTERTMP_DIR)\lib_OTP_WR.obj" 
	$(ECHO)

#main.obj :
#	$(ASM) $(ASMFLAGS) "$(PROJ_PATH)\main.asm" -o "$(PROJ_PATH)\main.obj"
#	$(ECHO)


###################################################
#命令定义处
###################################################
.PHONY : build
build  : prebuild outputdir compiler_all_asm_files $(OUTPUT_FILE_TYPE) postbuild

.PHONY : rebuild
rebuild: prebuild outputdir clean_buildfile build postbuild

.PHONY : clean
clean :
	$(RM)  "$(INTERTMP_DIR)\dee"
	$(RM)  "$(INTERTMP_DIR)\*.lik"
	$(RM)  "$(INTERTMP_DIR)\*.lst"
	$(RM)  $(OUTPUT_OTHER_FILES)
	$(RM)  "$(OUTPUT_DIR)\$(PROJ_NAME).$(OUTPUT_FILE_EXTENSION)"
	$(RM)  "$(INTERTMP_DIR)\$(PROJ_NAME).dat"
	$(ECHO)

clean_buildfile :
	$(RM)  $(OUTPUT_OTHER_FILES)
	$(RM)  "$(OUTPUT_DIR)\$(PROJ_NAME).$(OUTPUT_FILE_EXTENSION)"
	$(ECHO)
    
outputdir:
	if not exist "$(OUTPUT_DIR)/$(NULL)" mkdir "$(OUTPUT_DIR)"
	if not exist "$(INTERTMP_DIR)/$(NULL)" mkdir "$(INTERTMP_DIR)"
	$(ECHO)
	
binfile: 
	$(LINKER) $(LINKFLAGS) -s "$(INTERTMP_DIR)\Script.lik"
	$(ECHO)
	
libfile: 
	$(LIBMAKER) $(LIBMAKERFLAGS) -o $(OBJ_FILES) -lib "$(OUTPUT_DIR)\$(PROJ_NAME).lib"
	$(ECHO)

compiler_all_asm_files: $(OBJ_FILES)

prebuild :
	

postbuild :
	

