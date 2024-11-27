@echo off
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64


call :build_spirv
call :build_fxc
call :build_dxc

goto :eof

:build_spirv
setlocal enabledelayedexpansion

for /R .\river-shell\data\ %%f in (*.glsl) do (
  set B=%%f
  set V=!B:%CD%\=!
  call %VULKAN_SDK%\bin\glslangValidator.exe !V! -V -o !V:.glsl=.spv! --quiet
)

setlocal disabledelayedexpansion

goto :eof

:build_fxc

setlocal enabledelayedexpansion

for /R .\river-shell\data\ %%f in (*.hlsl) do (
  set B=%%f
  set V=!B:%CD%\=!
  fxc !V! /E VSMain /T vs_5_0 /Fo !V:.hlsl=.vert.dxbc!
  fxc !V! /E PSMain /T ps_5_0 /Fo !V:.hlsl=.frag.dxbc!
)

setlocal disabledelayedexpansion

goto :eof

:build_dxc

setlocal enabledelayedexpansion

for /R .\river-shell\data\ %%f in (*.hlsl) do (
  set B=%%f
  set V=!B:%CD%\=!
  dxc !V! /E VSMain /T vs_6_0 /Fo !V:.hlsl=.vert.dxil! /D D3D12=1
  dxc !V! /E PSMain /T ps_6_0 /Fo !V:.hlsl=.frag.dxil! /D D3D12=1
)

setlocal disabledelayedexpansion

goto :eof