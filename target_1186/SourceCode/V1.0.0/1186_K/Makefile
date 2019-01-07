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
OUTPUT_DIR            = G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\.\Release
INTERTMP_DIR          = G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\.\Release
PROJ_PATH			  = G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K
PROJ_NAME			  = 1186_K
BODY_NAME			  = CSU8RP1186
ASMFLAGS              = -filetype=obj -arch=cscc -fill=0xffff -chip=CSU8RP1186 -mattr=c16 -BankCount=2
LINKFLAGS             = -t asm -bt 16
LIBMAKERFLAGS         = -chiptype 16 -debuginfo RemoveDebugInfo -encodeinfo Encryption
CODE_OPTION			  = %%CodeOption%%
ASM_FILES			  = "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\Sys_Main.asm" \
"G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\user_Funs.asm" \
"G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\user_ISR.asm" \
"G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\user_LCD.asm" \
"G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_ISR.asm" \
"G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_LCD.asm" \
"G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_OTP_WR.asm" \
"G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_timer.asm" \
"G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_utiliy.asm" \
"G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_adc.asm" \
"G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_bat.asm" \
"G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_GetCount.asm" \
"G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_key.asm" \
"G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_Math.asm"

OBJ_FILES			  = "$(INTERTMP_DIR)\Sys_Main.obj" \
"$(INTERTMP_DIR)\user_Funs.obj" \
"$(INTERTMP_DIR)\user_ISR.obj" \
"$(INTERTMP_DIR)\user_LCD.obj" \
"$(INTERTMP_DIR)\lib_1186_ISR.obj" \
"$(INTERTMP_DIR)\lib_1186_LCD.obj" \
"$(INTERTMP_DIR)\lib_1186_OTP_WR.obj" \
"$(INTERTMP_DIR)\lib_1186_timer.obj" \
"$(INTERTMP_DIR)\lib_1186_utiliy.obj" \
"$(INTERTMP_DIR)\lib_adc.obj" \
"$(INTERTMP_DIR)\lib_bat.obj" \
"$(INTERTMP_DIR)\lib_GetCount.obj" \
"$(INTERTMP_DIR)\lib_key.obj" \
"$(INTERTMP_DIR)\lib_Math.obj"

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
"$(INTERTMP_DIR)\Sys_Main.obj" : "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\Sys_Main.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\Sys_Main.asm" -o "$(INTERTMP_DIR)\Sys_Main.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\user_Funs.obj" : "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\user_Funs.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\user_Funs.asm" -o "$(INTERTMP_DIR)\user_Funs.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\user_ISR.obj" : "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\user_ISR.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\user_ISR.asm" -o "$(INTERTMP_DIR)\user_ISR.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\user_LCD.obj" : "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\user_LCD.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\user_LCD.asm" -o "$(INTERTMP_DIR)\user_LCD.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_1186_ISR.obj" : "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_ISR.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_ISR.asm" -o "$(INTERTMP_DIR)\lib_1186_ISR.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_1186_LCD.obj" : "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_LCD.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_LCD.asm" -o "$(INTERTMP_DIR)\lib_1186_LCD.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_1186_OTP_WR.obj" : "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_OTP_WR.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_OTP_WR.asm" -o "$(INTERTMP_DIR)\lib_1186_OTP_WR.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_1186_timer.obj" : "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_timer.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_timer.asm" -o "$(INTERTMP_DIR)\lib_1186_timer.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_1186_utiliy.obj" : "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_utiliy.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_1186_utiliy.asm" -o "$(INTERTMP_DIR)\lib_1186_utiliy.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_adc.obj" : "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_adc.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_adc.asm" -o "$(INTERTMP_DIR)\lib_adc.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_bat.obj" : "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_bat.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_bat.asm" -o "$(INTERTMP_DIR)\lib_bat.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_GetCount.obj" : "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_GetCount.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_GetCount.asm" -o "$(INTERTMP_DIR)\lib_GetCount.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_key.obj" : "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_key.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_key.asm" -o "$(INTERTMP_DIR)\lib_key.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_Math.obj" : "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_Math.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_1186\SourceCode\V1.0.0\1186_K\lib_Math.asm" -o "$(INTERTMP_DIR)\lib_Math.obj" 
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
	

