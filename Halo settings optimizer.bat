@echo off

Reg.exe add HKLM /F >nul 2>&1
if %errorlevel% neq 0 start "" /wait /I /min powershell -NoProfile -Command start -verb runas "'%~s0'" && exit /b



Ping www.google.com -n 1 -w 1200 > null

if errorlevel 1 goto error else goto interface



setlocal EnableDelayedExpansion
python --version 3>NUL
if not errorlevel 0 goto python


:interface
TITLE Optimize Halo
color 06
echo.
echo.
echo Optimize game settings for fps and balanced visuals (Recommended) [1]          Optimize game settings for best fps (For maximum fps) [2]
echo.
echo.
echo.
set /p chocie="Select the corresponding number: "
if not '%choice%'=='' set choice=%choice:~0,1%
if %chocie% == 1 goto Halo
if %chocie% == 2 goto Halo2
ECHO "%choice%" is not valid, try again

:Halo
echo.
echo Only enter numbers (example: if you have a 60hz display enter 60)
echo.
powershell Invoke-WebRequest "https://raw.githubusercontent.com/aAshvinth/Halo-settings-optmizer/main/hs.py" -OutFile "%temp%\hs.py"
if errorlevel 1 goto error1
xcopy "%userprofile%\AppData\Local\HaloInfinite\Settings\SpecControlSettings.json" "%temp%\SpecControlSettings.json*" /Q > nul
cd %temp%
python hs.py
xcopy "%temp%\SpecControlSettings.json" "%userprofile%\AppData\Local\HaloInfinite\Settings\SpecControlSettings.json*" /y /Q > nul

goto end


:Halo2

powershell Invoke-WebRequest "https://raw.githubusercontent.com/aAshvinth/Halo-settings-optmizer/main/hs2.py" -OutFile "%temp%\hs2.py"
if errorlevel 1 goto error1
xcopy "%userprofile%\AppData\Local\HaloInfinite\Settings\SpecControlSettings.json" "%temp%\SpecControlSettings.json*" /Q > nul
cd %temp%
python hs2.py
xcopy "%temp%\SpecControlSettings.json" "%userprofile%\AppData\Local\HaloInfinite\Settings\SpecControlSettings.json*" /y /Q > nul 
del "%temp%\hs2.py"
del "%temp%\SpecControlSettings.json" 

goto end2

:end
TITLE Success!
cd %temp%
del "%temp%\hs.py" 
del "%temp%\SpecControlSettings.json" 
msg "%username%" HaloInfinite has been optimized!
exit

:end2
TITLE Success!
msg "%username%" HaloInfinite has been optimized! [*If you face consistent screen tearing in the game turn Vsync On]
exit



:python
TITLE Download python 3
color 06
echo.
echo python 3 not installed
echo.
echo.
echo Want to install python now?
set /p chocie="[y]yes [N]no: "
if %chocie% == y goto pyinstall
if %chocie% == yes goto pyinstall
if %chocie% == n exit
if %chocie% == no exit

:pyinstall
TITLE Downloading Python 3
color 06
powershell Invoke-WebRequest "https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe" -OutFile "%temp%\python-3.10.6-amd64.exe"
cd %temp%
start python-3.10.6-amd64.exe
msg "%username%" Continue with the installation prompt and reopen
exit

:error
TITLE ERROR!
color 06
echo.
echo ERROR! Make sure you are connected to the internet.
echo.
echo.
echo.
echo.
pause
exit

:error1
cls
TITLE ERROR!
color 06
echo.
echo ERROR! Could not download the required files.
echo.
echo.
echo.
echo.
pause
exit


