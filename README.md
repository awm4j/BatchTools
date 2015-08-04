# BatchTools
Windows batch files that may be of use to you or someone you know.

### hiber.bat
Hibernates your computer after a designated number of seconds. hiber.bat [seconds]

Example:
> hiber.bat 30

### appwait.bat
Waits for a process to close before executing a command. appwait.bat [process] [command]

Example:
> appwait.bat iexplore.exe "time /t"

### cntappkill.bat
Exits when the process closes or when the runtime countdown ends. cntappkill.bat [process] [runtime] [waittime]

Example:
> cntappkill.bat iexplore.exe 10 5
