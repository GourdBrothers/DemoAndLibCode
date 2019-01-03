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
OUTPUT_DIR            = G:\Git\DemoAndLibCode\target_18xx\18xx_H\.\Release
INTERTMP_DIR          = G:\Git\DemoAndLibCode\target_18xx\18xx_H\.\Release
PROJ_PATH			  = G:\Git\DemoAndLibCode\target_18xx\18xx_H
PROJ_NAME			  = 18xx_H
BODY_NAME			  = CSU18MB86
ASMFLAGS              = -filetype=obj -arch=cscc -fill=0xffff -chip=CSU18MB86 -mattr=c16 -BankCount=3
LINKFLAGS             = -t asm -bt 16
LIBMAKERFLAGS         = -chiptype 16 -debuginfo RemoveDebugInfo -encodeinfo Encryption
CODE_OPTION			  = %%CodeOption%%
ASM_FILES			  = "G:\Git\DemoAndLibCode\target_18xx\18xx_H\Sys_Main.asm" \
"G:\Git\DemoAndLibCode\target_18xx\18xx_H\user_Funs.asm" \
"G:\Git\DemoAndLibCode\target_18xx\18xx_H\user_LCD.asm" \
"G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_18xx_ISR.asm" \
"G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_18xx_LCD.asm" \
"G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_18xx_utiliy.asm" \
"G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_3weightCal.asm" \
"G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_adc.asm" \
"G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_AutoOn.asm" \
"G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_bat.asm" \
"G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_GetCount.asm" \
"G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_key.asm" \
"G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_Math.asm"

OBJ_FILES			  = "$(INTERTMP_DIR)\Sys_Main.obj" \
"$(INTERTMP_DIR)\user_Funs.obj" \
"$(INTERTMP_DIR)\user_LCD.obj" \
"$(INTERTMP_DIR)\lib_18xx_ISR.obj" \
"$(INTERTMP_DIR)\lib_18xx_LCD.obj" \
"$(INTERTMP_DIR)\lib_18xx_utiliy.obj" \
"$(INTERTMP_DIR)\lib_3weightCal.obj" \
"$(INTERTMP_DIR)\lib_adc.obj" \
"$(INTERTMP_DIR)\lib_AutoOn.obj" \
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
"$(INTERTMP_DIR)\Sys_Main.obj" : "G:\Git\DemoAndLibCode\target_18xx\18xx_H\Sys_Main.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_18xx\18xx_H\Sys_Main.asm" -o "$(INTERTMP_DIR)\Sys_Main.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\user_Funs.obj" : "G:\Git\DemoAndLibCode\target_18xx\18xx_H\user_Funs.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_18xx\18xx_H\user_Funs.asm" -o "$(INTERTMP_DIR)\user_Funs.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\user_LCD.obj" : "G:\Git\DemoAndLibCode\target_18xx\18xx_H\user_LCD.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_18xx\18xx_H\user_LCD.asm" -o "$(INTERTMP_DIR)\user_LCD.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_18xx_ISR.obj" : "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_18xx_ISR.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_18xx_ISR.asm" -o "$(INTERTMP_DIR)\lib_18xx_ISR.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_18xx_LCD.obj" : "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_18xx_LCD.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_18xx_LCD.asm" -o "$(INTERTMP_DIR)\lib_18xx_LCD.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_18xx_utiliy.obj" : "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_18xx_utiliy.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_18xx_utiliy.asm" -o "$(INTERTMP_DIR)\lib_18xx_utiliy.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_3weightCal.obj" : "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_3weightCal.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_3weightCal.asm" -o "$(INTERTMP_DIR)\lib_3weightCal.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_adc.obj" : "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_adc.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_adc.asm" -o "$(INTERTMP_DIR)\lib_adc.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_AutoOn.obj" : "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_AutoOn.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_AutoOn.asm" -o "$(INTERTMP_DIR)\lib_AutoOn.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_bat.obj" : "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_bat.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_bat.asm" -o "$(INTERTMP_DIR)\lib_bat.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_GetCount.obj" : "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_GetCount.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_GetCount.asm" -o "$(INTERTMP_DIR)\lib_GetCount.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_key.obj" : "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_key.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_key.asm" -o "$(INTERTMP_DIR)\lib_key.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\lib_Math.obj" : "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_Math.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\target_18xx\18xx_H\lib_Math.asm" -o "$(INTERTMP_DIR)\lib_Math.obj" 
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
	

