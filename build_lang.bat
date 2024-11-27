@echo off
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64


set "PATH=%PATH%;%~dp0\llvm\bin\"

setlocal enabledelayedexpansion


::set "PARAMS="
::FOR /F "tokens=* USEBACKQ" %%F IN (`llvm-config --cxxflags --ldflags --system-libs --libs core`) DO (
::SET "PARAMS=!PARAMS! %%F"
::)
::ECHO %PARAMS%

SET PARAMS= -I.\llvm\include^
 -std:c++17^
 /EHs-c-^
 /GR-^
 -D_CRT_SECURE_NO_DEPRECATE^
 -D_CRT_SECURE_NO_WARNINGS^
 -D_CRT_NONSTDC_NO_DEPRECATE^
 -D_CRT_NONSTDC_NO_WARNINGS^
 -D_SCL_SECURE_NO_DEPRECATE^
 -D_SCL_SECURE_NO_WARNINGS^
 -DUNICODE^
 -D_UNICODE^
 -D__STDC_CONSTANT_MACROS^
 -D__STDC_FORMAT_MACROS^
 -D__STDC_LIMIT_MACROS^
 .\llvm\lib\LLVMX86TargetMCA.lib^
 .\llvm\lib\LLVMMCA.lib^
 .\llvm\lib\LLVMX86Disassembler.lib^
 .\llvm\lib\LLVMX86AsmParser.lib^
 .\llvm\lib\LLVMX86CodeGen.lib^
 .\llvm\lib\LLVMX86Desc.lib^
 .\llvm\lib\LLVMX86Info.lib^
 .\llvm\lib\LLVMMCDisassembler.lib^
 .\llvm\lib\LLVMGlobalISel.lib^
 .\llvm\lib\LLVMSelectionDAG.lib^
 .\llvm\lib\LLVMAsmPrinter.lib^
 .\llvm\lib\LLVMOrcJIT.lib^
 .\llvm\lib\LLVMPasses.lib^
 .\llvm\lib\LLVMIRPrinter.lib^
 .\llvm\lib\LLVMHipStdPar.lib^
 .\llvm\lib\LLVMCoroutines.lib^
 .\llvm\lib\LLVMipo.lib^
 .\llvm\lib\LLVMInstrumentation.lib^
 .\llvm\lib\LLVMVectorize.lib^
 .\llvm\lib\LLVMLinker.lib^
 .\llvm\lib\LLVMFrontendOpenMP.lib^
 .\llvm\lib\LLVMFrontendOffloading.lib^
 .\llvm\lib\LLVMCodeGen.lib^
 .\llvm\lib\LLVMScalarOpts.lib^
 .\llvm\lib\LLVMInstCombine.lib^
 .\llvm\lib\LLVMObjCARCOpts.lib^
 .\llvm\lib\LLVMCodeGenTypes.lib^
 .\llvm\lib\LLVMBitWriter.lib^
 .\llvm\lib\LLVMCFGuard.lib^
 .\llvm\lib\LLVMAggressiveInstCombine.lib^
 .\llvm\lib\LLVMTransformUtils.lib^
 .\llvm\lib\LLVMWindowsDriver.lib^
 .\llvm\lib\LLVMJITLink.lib^
 .\llvm\lib\LLVMOption.lib^
 .\llvm\lib\LLVMExecutionEngine.lib^
 .\llvm\lib\LLVMTarget.lib^
 .\llvm\lib\LLVMAnalysis.lib^
 .\llvm\lib\LLVMProfileData.lib^
 .\llvm\lib\LLVMSymbolize.lib^
 .\llvm\lib\LLVMDebugInfoBTF.lib^
 .\llvm\lib\LLVMDebugInfoPDB.lib^
 .\llvm\lib\LLVMDebugInfoMSF.lib^
 .\llvm\lib\LLVMDebugInfoDWARF.lib^
 .\llvm\lib\LLVMRuntimeDyld.lib^
 .\llvm\lib\LLVMOrcTargetProcess.lib^
 .\llvm\lib\LLVMOrcShared.lib^
 .\llvm\lib\LLVMObject.lib^
 .\llvm\lib\LLVMTextAPI.lib^
 .\llvm\lib\LLVMMCParser.lib^
 .\llvm\lib\LLVMIRReader.lib^
 .\llvm\lib\LLVMAsmParser.lib^
 .\llvm\lib\LLVMBitReader.lib^
 .\llvm\lib\LLVMMC.lib^
 .\llvm\lib\LLVMDebugInfoCodeView.lib^
 .\llvm\lib\LLVMCore.lib^
 .\llvm\lib\LLVMRemarks.lib^
 .\llvm\lib\LLVMBitstreamReader.lib^
 .\llvm\lib\LLVMBinaryFormat.lib^
 .\llvm\lib\LLVMTargetParser.lib^
 .\llvm\lib\LLVMSupport.lib^
 .\llvm\lib\LLVMDemangle.lib^
 psapi.lib^
 shell32.lib^
 ole32.lib^
 uuid.lib^
 advapi32.lib^
 ws2_32.lib^
 ntdll.lib^
 .\llvm\lib\libxml2s.lib^
 .\SDL3.lib^
 -I./libsdl/include/^
 -I./imgui/^
 -I./imgui/backends/^
 -I./implot/^
 ./imgui/imgui*.cpp^
 ./implot/*.cpp^
 ./imgui/backends/imgui_impl_sdlrenderer3.cpp^
 ./imgui/backends/imgui_impl_sdl3.cpp
 
 

clang-cl.exe -g -I./ river-lang/*.cpp %PARAMS% -o river.exe