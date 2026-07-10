@echo off
title Windows Temporary Files Cleanup
color 0A

echo =====================================
echo      Windows Cleanup Utility
echo =====================================
echo.
echo This will clean:
echo  - User Temp
echo  - Windows Temp
echo  - DirectX Shader Cache
echo  - Windows Error Reporting
echo  - Crash Dumps
echo  - Thumbnail Cache
echo  - Delivery Optimization Cache
echo  - Recycle Bin
echo.
pause

echo.
echo Cleaning User Temp...
del /f /s /q "%TEMP%\*" >nul 2>&1
for /d %%x in ("%TEMP%\*") do rd /s /q "%%x" >nul 2>&1
Del /S /F /Q C:\WINDOWS\Prefetch

echo Cleaning Windows Temp...
del /f /s /q "%windir%\Temp\*" >nul 2>&1
for /d %%x in ("%windir%\Temp\*") do rd /s /q "%%x" >nul 2>&1


echo Cleaning DirectX Shader Cache...
del /f /s /q "%LocalAppData%\D3DSCache\*" >nul 2>&1

echo Cleaning Thumbnail Cache...
taskkill /f /im explorer.exe >nul 2>&1
del /f /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache*" >nul 2>&1
start explorer.exe

echo Cleaning Windows Error Reporting...
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\*" >nul 2>&1

echo Cleaning Crash Dumps...
del /f /s /q "%LocalAppData%\CrashDumps\*" >nul 2>&1

echo Cleaning Delivery Optimization Cache...
del /f /s /q "%ProgramData%\Microsoft\Windows\DeliveryOptimization\Cache\*" >nul 2>&1

echo Emptying Recycle Bin...
PowerShell -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1

echo.
echo =====================================
echo        Cleanup Complete!
echo =====================================
echo.
pause