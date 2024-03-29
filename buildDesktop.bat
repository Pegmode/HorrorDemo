@echo off
set project_name=HoDemmo
set bgb="E:\Gb Dev\emu\BGB64.exe"

Rem Desktop: bgb="E:\Gb Dev\emu\BGB64.exe"
Rem LenLap: bgb="C:\gbDev\bgb\BGB64.exe"

TASKKILL /IM "BGB64.exe" /F 2>NUL

rgbasm -o%project_name%.obj main.asm
if %errorlevel% neq 0 call :exit 1
rgblink -m%project_name%.map -n%project_name%.sym -o%project_name%.gb %project_name%.obj
if %errorlevel% neq 0 call :exit 1
rgbfix -p0 -v %project_name%.gb
if %errorlevel% neq 0 call :exit 1

echo Assembly success!
START "s" %bgb% %project_name%.gb

del %project_name%.map
echo %project_name%.sym
del %project_name%.obj
pause
timeout 5

:exit
timeout 10
exit