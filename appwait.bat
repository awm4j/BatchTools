echo off

if "%~1"=="help" goto :help

SETLOCAL ENABLEEXTENSIONS
SET process=%~1
SET command=%~2

echo [Waiting for process: %process%]

:loop
tasklist /FI "IMAGENAME eq %process%" /NH | find /I /N "%process%" > nul
if "%ERRORLEVEL%"=="1" goto :exit
timeout /t 1 /nobreak > nul
goto :loop

:help
echo.
echo.
echo  appwait.bat [process] [command]
echo.
echo  Example:
echo     appwait.bat iexplore.exe "time /t"
echo.
goto :eof

:exit
timeout /t 2 /nobreak
%command%
