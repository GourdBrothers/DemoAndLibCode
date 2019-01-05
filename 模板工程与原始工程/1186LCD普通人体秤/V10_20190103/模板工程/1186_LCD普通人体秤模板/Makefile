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
OUTPUT_DIR            = G:\Git\DemoAndLibCode\模板工程与原始工程\1186LCD普通人体秤\V10_20190103\模板工程\1186_LCD普通人体秤模板\.\Release
INTERTMP_DIR          = G:\Git\DemoAndLibCode\模板工程与原始工程\1186LCD普通人体秤\V10_20190103\模板工程\1186_LCD普通人体秤模板\.\Release
PROJ_PATH			  = G:\Git\DemoAndLibCode\模板工程与原始工程\1186LCD普通人体秤\V10_20190103\模板工程\1186_LCD普通人体秤模板
PROJ_NAME			  = LIB_FOR_1186
BODY_NAME			  = CSU8RP1186
ASMFLAGS              = -no-warn -filetype=obj -arch=cscc -fill=0xffff -chip=CSU8RP1186 -mattr=c16 -BankCount=2
LINKFLAGS             = -t asm -bt 16
LIBMAKERFLAGS         = -chiptype 16 -debuginfo RemoveDebugInfo -encodeinfo Encryption
CODE_OPTION			  = %%CodeOption%%
ASM_FILES			  = "G:\Git\DemoAndLibCode\模板工程与原始工程\1186LCD普通人体秤\V10_20190103\模板工程\1186_LCD普通人体秤模板\Sys_Main.asm" \
"G:\Git\DemoAndLibCode\模板工程与原始工程\1186LCD普通人体秤\V10_20190103\模板工程\1186_LCD普通人体秤模板\user_Funs.asm" \
"G:\Git\DemoAndLibCode\模板工程与原始工程\1186LCD普通人体秤\V10_20190103\模板工程\1186_LCD普通人体秤模板\user_LCD.asm"

OBJ_FILES			  = "$(INTERTMP_DIR)\Sys_Main.obj" \
"$(INTERTMP_DIR)\user_Funs.obj" \
"$(INTERTMP_DIR)\user_LCD.obj"

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
"$(INTERTMP_DIR)\Sys_Main.obj" : "G:\Git\DemoAndLibCode\模板工程与原始工程\1186LCD普通人体秤\V10_20190103\模板工程\1186_LCD普通人体秤模板\Sys_Main.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\模板工程与原始工程\1186LCD普通人体秤\V10_20190103\模板工程\1186_LCD普通人体秤模板\Sys_Main.asm" -o "$(INTERTMP_DIR)\Sys_Main.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\user_Funs.obj" : "G:\Git\DemoAndLibCode\模板工程与原始工程\1186LCD普通人体秤\V10_20190103\模板工程\1186_LCD普通人体秤模板\user_Funs.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\模板工程与原始工程\1186LCD普通人体秤\V10_20190103\模板工程\1186_LCD普通人体秤模板\user_Funs.asm" -o "$(INTERTMP_DIR)\user_Funs.obj" 
	$(ECHO)
"$(INTERTMP_DIR)\user_LCD.obj" : "G:\Git\DemoAndLibCode\模板工程与原始工程\1186LCD普通人体秤\V10_20190103\模板工程\1186_LCD普通人体秤模板\user_LCD.asm"
	$(ASM) $(ASMFLAGS) -gstab "G:\Git\DemoAndLibCode\模板工程与原始工程\1186LCD普通人体秤\V10_20190103\模板工程\1186_LCD普通人体秤模板\user_LCD.asm" -o "$(INTERTMP_DIR)\user_LCD.obj" 
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
	

