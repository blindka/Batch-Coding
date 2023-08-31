@echo off
setlocal
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| find "IPv4 Address"') do set "IP=%%i"
echo ----------------------------------
echo Local IP Address: %IP:~1%
echo Compter Name is: %ComputerName%
echo ----------------------------------
@echo off

rem Get the list of mapped drives
for /f "delims=" %%i in ('net use') do (
  rem Get the drive letter and remote path
  set "drive_letter=%%i"

  rem Print the drive letter
  echo Drive: %%i
)
echo ----------------------------------
echo Currently Installed Printers:
echo ----------------------------------
wmic printer get name
echo ----------------------------------
pause