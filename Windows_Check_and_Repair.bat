:: ctrl+C to cancel batch sequence

echo off
:begin
cls
echo If Windows 10 has missing or corrupted files, the following commands will show you how to repair the setup using the DISM and SFC command tools.
echo =============
echo -
echo 1) ScanHealth (Advanced scan to find out whether the image has any problems)
echo -
echo 2) RestoreHealth (To fix problems with the system image, this option will automatically scan and repair common issues)
echo -
echo 3) System File Checker (SFC will resolve problems with the system image, not the issues with the Windows 10 installation, use this after restoring the image to a healthy state)
echo -
echo 4) Retrieve Windows License ID
echo -
echo =============
echo -
set /p op=Select an option:
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
if "%op%"=="3" goto op3
if "%op%"=="4" goto op4

echo Pick an option:
goto begin


:op1
cls
echo ScanHealth in progress...
DISM.exe /Online /Cleanup-image /Scanhealth
pause
goto begin

:op2
cls
echo RestoreHealth in progress...
DISM.exe /Online /Cleanup-image /Restorehealth
pause
goto begin

:op3
cls
echo System file checker in progress...
sfc /scannow
pause
goto begin

:op4
cls
echo Retrieving Windows License ID:
wmic path SoftwareLicensingService get OA3xOriginalProductKey
pause
cls
goto begin

:exit
@exit
