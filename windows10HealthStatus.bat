:: ctrL+C to cancel batch sequence

pause
DISM.exe /Online /Cleanup-image /Scanhealth
pause
DISM.exe /Online /Cleanup-image /Restorehealth
pause
Sfc /scannow
pause
