@echo off
title Master PC Optimization Toolkit
setlocal enabledelayedexpansion

:MAIN_MENU
cls
echo ==========================================
echo        Master PC Optimization Toolkit       
echo ==========================================
echo Choose your optimization module:
echo.
echo [1] Modular PC Optimization Suite
echo [2] Ultimate PC Optimization Suite
echo [3] Storage Cleaner Tool
echo [4] Gamer PC Multitool Optimizer
echo [5] Wi-Fi Optimizer
echo [0] Exit
echo ==========================================
set /p mainopt=Enter your choice: 

if "%mainopt%"=="1" goto MODULAR_MENU
if "%mainopt%"=="2" goto ULTIMATE_MENU
if "%mainopt%"=="3" goto STORAGE_MENU
if "%mainopt%"=="4" goto GAMER_MENU
if "%mainopt%"=="5" goto WIFI_MENU
if "%mainopt%"=="0" goto EXIT
goto MAIN_MENU

:: ================= MODULAR SUITE =================

:MODULAR_MENU
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
echo [0]  Back to Main Menu
echo ==========================================
set /p opt=Select options separated by commas (e.g. 1,3,5): 
set "opt=%opt: =%"

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
    if "%%O"=="0" goto MAIN_MENU
)
echo.
echo ✅ Optimization Complete!
pause
goto MODULAR_MENU

:: ================= ULTIMATE SUITE =================

:ULTIMATE_MENU
cls
echo ======================================
echo         Ultimate PC Optimization Suite         
echo ======================================
echo 1. Manage Startup Programs
echo 2. Analyze RAM Usage
echo 3. Display CPU Usage
echo 4. Switch Power Profile
echo 5. Game Mode Booster
echo 6. Drive Health Check
echo 7. Optimize Visual Effects
echo 8. Clean Browser & App Cache
echo 9. Check Drivers & Windows Updates
echo 10. Log Current Session Performance
echo 11. Back to Main Menu
echo ======================================
set /p choice="Choose an option (1-11): "

if "%choice%"=="1" goto STARTUP
if "%choice%"=="2" goto RAM
if "%choice%"=="3" goto CPU
if "%choice%"=="4" goto POWER
if "%choice%"=="5" goto GAME
if "%choice%"=="6" goto DRIVE
if "%choice%"=="7" goto VISUAL
if "%choice%"=="8" goto CACHE
if "%choice%"=="9" goto DRIVERS
if "%choice%"=="10" goto LOGGER
if "%choice%"=="11" goto MAIN_MENU
goto ULTIMATE_MENU

:: ================= STORAGE CLEANER =================

:STORAGE_MENU
cls
echo ====================================
echo         STORAGE CLEANER TOOL        
echo ====================================
echo 1. Clear Temp Files
echo 2. Clean Prefetch Cache
echo 3. Empty Recycle Bin
echo 4. Clean Windows Update Cache
echo 5. Clear Event Logs
echo 6. Remove Log Files
echo 7. Run All
echo 8. Back to Main Menu
echo ====================================
set /p choice="Choose an option (1-8): "

if "%choice%"=="1" call :TEMP
if "%choice%"=="2" call :PREFETCH
if "%choice%"=="3" call :RECYCLEBIN
if "%choice%"=="4" call :UPDATECACHE
if "%choice%"=="5" call :EVENTLOGS
if "%choice%"=="6" call :LOGFILES
if "%choice%"=="7" (
    call :TEMP
    call :PREFETCH
    call :RECYCLEBIN
    call :UPDATECACHE
    call :EVENTLOGS
    call :LOGFILES
    echo ✅ All cleanup tasks completed!
    pause
)
if "%choice%"=="8" goto MAIN_MENU
goto STORAGE_MENU

:: ================= GAMER MULTITOOL =================

:GAMER_MENU
cls
echo =======================================
echo       Gamer PC Multitool Optimizer
echo =======================================
echo 1. Kill Background Processes
echo 2. Clear Temp Files
echo 3. Flush DNS
echo 4. Clean Prefetch
echo 5. Check Disk Health
echo 6. Defrag Drive
echo 7. Free RAM
echo 8. Clear Clipboard
echo 9. Launch Game
echo 10. Restart PC
echo 11. Back to Main Menu
echo =======================================
set /p choice=Select an option: 

if "%choice%"=="1" call :KILL_PROCESSES
if "%choice%"=="2" call :CLEAR_TEMP
if "%choice%"=="3" call :FLUSH_DNS
if "%choice%"=="4" call :CLEAN_PREFETCH
if "%choice%"=="5" call :CHECK_DISK
if "%choice%"=="6" call :DEFRAG
if "%choice%"=="7" call :FREE_RAM
if "%choice%"=="8" call :CLEAR_CLIPBOARD
if "%choice%"=="9" call :LAUNCH_GAME
if "%choice%"=="10" call :RESTART
if "%choice%"=="11" goto MAIN_MENU
goto GAMER_MENU

:: ================= WIFI OPTIMIZER =================

:WIFI_MENU
cls
echo ======================================
echo           Wi-Fi Optimizer            
echo ======================================
echo 1. Flush DNS Cache
echo 2. Reset Network Stack
echo 3. Release & Renew IP
echo 4. Show Wi-Fi Signal Strength
echo 5. Run All
echo 6. Back to Main Menu
echo ======================================
set /p wifiopt=Choose an option (1-6): 

if "%wifiopt%"=="1" call :FLUSH_DNS
if "%wifiopt%"=="2" call :NET_RESET
if "%wifiopt%"=="3" call :IP_RENEW
if "%wifiopt%"=="4" call :WIFI_SIGNAL
if "%wifiopt%"=="5" (
    call :FLUSH_DNS
    call :NET_RESET
    call :IP_RENEW
    call :WIFI_SIGNAL
    echo ✅ All Wi-Fi optimizations complete!
    pause
)
if "%wifiopt%"=="6" goto MAIN_MENU
goto WIFI_MENU

:: ===== Shared Subroutines =====

:KILL_APPS
taskkill /F /IM OneDrive.exe >nul 2>&1
taskkill /F /IM XboxAppServices.exe >nul 2>&1
taskkill /F /IM MicrosoftEdge.exe >nul 2>&1
goto :eof

:POWER_MODE
powercfg /S SCHEME_MIN
goto :eof

:FLUSH_DNS
ipconfig /flushdns
goto :eof

:CLEAN_TEMP
del /s /q %temp%\* >nul 2>&1
del /s /q C:\Windows\Temp\* >nul 2>&1
goto :eof

:RECYCLE
PowerShell -Command "Clear-RecycleBin -Force" >nul 2>&1
goto :eof

:CACHE_CLEAN
rd /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache"
rd /s /q "%AppData%\discord\Cache"
goto :eof

:RAM_REFRESH
start /b "" cmd /c "echo RAM refresh >nul"
goto :eof

:VISUAL_OPTIMIZE
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
goto :eof

:LOGGER
powershell -command "$date=Get-Date -Format 'yyyy-MM-dd HH:mm'; $cpu=(Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples[0].CookedValue; $ram=(Get-Counter '\Memory\Available MBytes').CounterSamples[0].CookedValue; Add-Content -Path PerfLog.txt -Value ($date + ' | CPU: ' + [math]::Round($cpu,2) + '%% | RAM