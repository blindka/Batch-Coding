@echo off
tzutil /s "Israel Standard Time"
echo -----------------------------------
REM Enable Network Discovery
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Shared" /v "Hidden" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN" /v "CheckedValue" /t REG_DWORD /d 2 /f

REM Enable File and Printer Sharing
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes

REM Restart the Network Location Awareness service
net stop "NlaSvc"
net start "NlaSvc"
echo Enabled Network Discovery
echo Enabled File and Pirnter Sharing
echo Timezone Changed to Israel Timezone.
echo -----------------------------------
pause