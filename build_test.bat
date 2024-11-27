@echo off
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64


set "PATH=%PATH%;%~dp0\llvm\bin\"


.\river.exe < fib.ks 2> fib.ll
clang.exe .\river.lib -x ir - < fib.ll
