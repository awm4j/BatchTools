echo off

if "%~1"=="help" goto :help

SETLOCAL ENABLEEXTENSIONS
SET process=%~1
SET /a runtime=%~2
SET /a waittime=%~3

echo [Process: %process%] [Runtime: %runtime%] [Waittime: %waittime%]

:loop
tasklist /FI "IMAGENAME eq %process%" /NH | find /I /N "%process%" > nul
if "%ERRORLEVEL%"=="1" goto :exit
set /a runtime=%runtime%-1
if /I %runtime% EQU 0 goto :kill
if /I %runtime% LEQ 10 echo %runtime%
timeout /t 1 /nobreak > nul
goto :loop

:kill
echo Killing %process%
taskkill /f /im %process% > nul
goto :exit

:help
echo.
echo.
echo  cntappkill.bat [process] [runtime] [waittime]
echo.
echo  Example:
echo     cntappkill.bat iexplore.exe 10 5
echo.
goto :eof

:exit
timeout /t %waittime% /nobreak
