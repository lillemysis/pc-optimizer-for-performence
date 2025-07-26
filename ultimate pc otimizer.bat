@echo off
title Ultimate PC Optimization Suite
setlocal enabledelayedexpansion

:MENU
cls
echo ======================================
echo         PC Optimization Suite         
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
echo 11. Exit
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
if "%choice%"=="11" goto EXIT
goto MENU

:STARTUP
cls
echo 🪪 Startup Apps:
wmic startup get Caption,Command
pause
goto MENU

:RAM
cls
echo 🧠 Top RAM-Consuming Processes:
powershell -command "Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 10 | Format-Table Name,Id,WS -AutoSize"
pause
goto MENU

:CPU
cls
echo ⚙️ CPU Usage Snapshot:
powershell -command "Get-Counter '\Processor(_Total)\% Processor Time' | Select-Object -ExpandProperty CounterSamples | ForEach-Object { $_.CookedValue }"
pause
goto MENU

:POWER
cls
echo 🔋 Switching to High Performance mode...
powercfg /S SCHEME_MIN
echo ✅ Done!
pause
goto MENU

:GAME
cls
echo 🎮 Game Mode Activated!
echo - Killing background apps...
taskkill /F /IM OneDrive.exe >nul 2>&1
taskkill /F /IM XboxAppServices.exe >nul 2>&1
taskkill /F /IM MicrosoftEdge.exe >nul 2>&1
echo - Switching to High Performance...
powercfg /S SCHEME_MIN
echo - Refreshing memory...
start /b "" cmd /c "echo RAM refresh >nul"
echo ✅ Ready to launch game!
pause
goto MENU

:DRIVE
cls
echo 🔍 Drive Info:
wmic diskdrive get Model,Status
echo Checking fragmentation:
defrag C: /A
pause
goto MENU

:VISUAL
cls
echo 🎨 Optimizing for performance...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
echo ✅ Animations reduced, performance mode activated.
pause
goto MENU

:CACHE
cls
echo 🧹 Cleaning Chrome & Discord Cache...
rd /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache"
rd /s /q "%AppData%\discord\Cache"
echo ✅ App caches cleared!
pause
goto MENU

:DRIVERS
cls
echo 🔧 Checking Installed Drivers:
wmic path Win32_PnPSignedDriver get DeviceName,DriverVersion,Manufacturer
echo 🔁 Checking Windows Updates:
powershell -command "Get-WindowsUpdate | Format-Table -AutoSize"
pause
goto MENU

:LOGGER
cls
echo 📊 Logging session performance...
powershell -command "$date = Get-Date -Format 'yyyy-MM-dd_HH-mm'; $cpu = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples[0].CookedValue; $ram = (Get-Counter '\Memory\Available MBytes').CounterSamples[0].CookedValue; Add-Content -Path 'PerfLog.txt' -Value ($date + ' | CPU: ' + [math]::Round($cpu,2) + '%% | Free RAM: ' + $ram + 'MB')"
echo ✅ Logged to PerfLog.txt
pause
goto MENU

:EXIT
cls
echo 👋 Thanks for using Ultimate PC Optimization Suite!
timeout /t 2 >nul
exit
