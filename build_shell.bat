@echo off
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64

cl /MD /Zi /EHsc /I./libsdl/include/ /I./ ./river-shell/*.cpp 