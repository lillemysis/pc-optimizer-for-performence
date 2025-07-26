@echo off
title Modular PC Optimization Suite
setlocal enabledelayedexpansion

:MENU
cls
echo ==========================================
echo         Modular PC Optimization Suite       
echo ==========================================
echo Choose what you want to optimize:
echo.
echo [1]  Kill Background Apps
echo [2]  Switch to High Performance Mode
echo [3]  Flush DNS Cache
echo [4]  Clear Temp + Prefetch Files
echo [5]  Empty Recycle Bin
echo [6]  Clean Browser & App Cache
echo [7]  Refresh RAM
echo [8]  Optimize Visual Effects
echo [9]  Log Current Performance
echo [10] Run All
echo [0]  Exit
echo ==========================================
set /p opt=Select options separated by commas (e.g. 1,3,5): 

:: Remove spaces
set "opt=%opt: =%"

:: Check each selection
for %%O in (%opt%) do (
    if "%%O"=="1" call :KILL_APPS
    if "%%O"=="2" call :POWER_MODE
    if "%%O"=="3" call :FLUSH_DNS
    if "%%O"=="4" call :CLEAN_TEMP
    if "%%O"=="5" call :RECYCLE
    if "%%O"=="6" call :CACHE_CLEAN
    if "%%O"=="7" call :RAM_REFRESH
    if "%%O"=="8" call :VISUAL_OPTIMIZE
    if "%%O"=="9" call :LOGGER
    if "%%O"=="10" call :RUN_ALL
    if "%%O"=="0" goto EXIT
)
echo.
echo ✅ Optimization Complete!
pause
goto MENU

:: ===== Subroutines =====

:KILL_APPS
echo 🧯 Killing background processes...
taskkill /F /IM OneDrive.exe >nul 2>&1
taskkill /F /IM XboxAppServices.exe >nul 2>&1
taskkill /F /IM MicrosoftEdge.exe >nul 2>&1
goto :eof

:POWER_MODE
echo 🔋 Switching to High Performance...
powercfg /S SCHEME_MIN
goto :eof

:FLUSH_DNS
echo 🌐 Flushing DNS resolver cache...
ipconfig /flushdns
goto :eof

:CLEAN_TEMP
echo 🧼 Cleaning Temp & Prefetch...
del /s /q %temp%\* >nul 2>&1
del /q C:\Windows\Prefetch\* >nul 2>&1
goto :eof

:RECYCLE
echo 🗑️ Emptying Recycle Bin...
PowerShell -Command "Clear-RecycleBin -Force" >nul 2>&1
goto :eof

:CACHE_CLEAN
echo 🧹 Cleaning Chrome & Discord cache...
rd /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache"
rd /s /q "%AppData%\discord\Cache"
goto :eof

:RAM_REFRESH
echo 🔄 Refreshing RAM...
start /b "" cmd /c "echo RAM refresh >nul"
goto :eof

:VISUAL_OPTIMIZE
echo 🎨 Optimizing visual performance...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
goto :eof

:LOGGER
echo 🧾 Logging system performance...
powershell -command "$date=Get-Date -Format 'yyyy-MM-dd HH:mm'; $cpu=(Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples[0].CookedValue; $ram=(Get-Counter '\Memory\Available MBytes').CounterSamples[0].CookedValue; Add-Content -Path PerfLog.txt -Value ($date + ' | CPU: ' + [math]::Round($cpu,2) + '%% | RAM Free: ' + $ram + 'MB')"
goto :eof

:RUN_ALL
call :KILL_APPS
call :POWER_MODE
call :FLUSH_DNS
call :CLEAN_TEMP
call :RECYCLE
call :CACHE_CLEAN
call :RAM_REFRESH
call :VISUAL_OPTIMIZE
call :LOGGER
goto :eof

:EXIT
cls
echo 👋 See you next optimization session!
timeout /t 2 >nul
exit
