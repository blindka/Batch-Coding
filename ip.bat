@echo off
setlocal
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| find "IPv4 Address"') do set "IP=%%i"
echo ----------------------------------
echo Local IP Address: %IP:~1%
for /f "tokens=2" %%i in ('net use ^| find "\\"') do (
    echo Mapped Network Drive: %%i
)
if "%errorlevel%"=="0" (
    echo Network Drivers: Network drives are mapped.
) else (
    echo Network Drivers: No network drives are mapped.
)
echo Compter Name is: %ComputerName%
echo ----------------------------------
echo Currently Installed Printers:
echo ----------------------------------
wmic printer get name
echo ----------------------------------
pause