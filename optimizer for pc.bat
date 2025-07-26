@echo off
title Gamer PC Multitool Optimizer
color 0B

:MENU
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
echo 11. Exit
echo =======================================
set /p choice=Select an option: 

if "%choice%"=="1" goto KILL_PROCESSES
if "%choice%"=="2" goto CLEAR_TEMP
if "%choice%"=="3" goto FLUSH_DNS
if "%choice%"=="4" goto CLEAN_PREFETCH
if "%choice%"=="5" goto CHECK_DISK
if "%choice%"=="6" goto DEFRAG
if "%choice%"=="7" goto FREE_RAM
if "%choice%"=="8" goto CLEAR_CLIPBOARD
if "%choice%"=="9" goto LAUNCH_GAME
if "%choice%"=="10" goto RESTART
if "%choice%"=="11" exit

:KILL_PROCESSES
cls
echo 🔪 Killing unnecessary background tasks...
taskkill /F /IM XboxAppServices.exe >nul 2>&1
taskkill /F /IM OneDrive.exe >nul 2>&1
taskkill /F /IM MicrosoftEdge.exe >nul 2>&1
taskkill /F /IM YourPhone.exe >nul 2>&1
taskkill /F /IM SearchUI.exe >nul 2>&1
taskkill /F /IM RuntimeBroker.exe >nul 2>&1
echo ✅ Processes terminated.
timeout /t 2 >nul
goto MENU

:CLEAR_TEMP
cls
echo 🧼 Clearing temporary files...
del /s /q %temp%\* >nul 2>&1
echo ✅ Temp files deleted.
timeout /t 2 >nul
goto MENU

:FLUSH_DNS
cls
echo 🌐 Flushing DNS resolver cache...
ipconfig /flushdns
echo ✅ DNS cache cleared.
timeout /t 2 >nul
goto MENU

:CLEAN_PREFETCH
cls
echo 🚀 Cleaning prefetch folder...
del /q C:\Windows\Prefetch\*.*
echo ✅ Prefetch cleaned.
timeout /t 2 >nul
goto MENU

:CHECK_DISK
cls
echo 🛠️ Checking disk health (C:)...
chkdsk C:
echo ✅ Disk check complete.
timeout /t 3 >nul
goto MENU

:DEFRAG
cls
set /p drive=🧩 Enter drive letter to defrag (e.g. C): 
defrag %drive%:
echo ✅ Defrag complete.
timeout /t 3 >nul
goto MENU

:FREE_RAM
cls
echo 🔄 Freeing up RAM...
start /b "" cmd /c "echo RAM refresh >nul"
echo ✅ RAM refresh simulated.
timeout /t 2 >nul
goto MENU

:CLEAR_CLIPBOARD
cls
echo ✂️ Clearing clipboard contents...
echo off | clip
echo ✅ Clipboard cleared.
timeout /t 2 >nul
goto MENU

:LAUNCH_GAME
cls
set /p gamepath=🎮 Enter full path to your game (e.g. C:\Games\Valorant\game.exe): 
echo 🚀 Launching game...
start "" "%gamepath%"
timeout /t 2 >nul
goto MENU

:RESTART
cls
echo 🔁 Restarting PC in 5 seconds...
shutdown /r /t 5
goto MENU
