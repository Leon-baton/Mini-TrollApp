@echo off
del /f /s /q build
set "path=%LocalAppData%\bin\NASM;%path%"
mkdir build
nasm -f win ./main.asm -Ox -o ./build/main.obj
golink /entry start ./build/main.obj user32.dll kernel32.dll /fo ./build/App.exe
pause
