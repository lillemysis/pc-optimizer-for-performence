@echo off
title Storage Cleaner Tool
setlocal enableextensions
cls

:MENU
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
echo 8. Exit
echo ====================================
set /p choice="Choose an option (1-8): "

if "%choice%"=="1" goto TEMP
if "%choice%"=="2" goto PREFETCH
if "%choice%"=="3" goto RECYCLEBIN
if "%choice%"=="4" goto UPDATECACHE
if "%choice%"=="5" goto EVENTLOGS
if "%choice%"=="6" goto LOGFILES
if "%choice%"=="7" goto ALL
if "%choice%"=="8" exit
goto MENU

:TEMP
cls
echo 🧼 Clearing Temp folders...
del /s /f /q %temp%\* >nul 2>&1
del /s /f /q C:\Windows\Temp\* >nul 2>&1
echo ✅ Temp files cleaned!
pause
goto MENU

:PREFETCH
cls
echo 🚀 Cleaning Prefetch folder...
del /q C:\Windows\Prefetch\* >nul 2>&1
echo ✅ Prefetch cache cleaned!
pause
goto MENU

:RECYCLEBIN
cls
echo 🗑️ Emptying Recycle Bin...
PowerShell -Command "Clear-RecycleBin -Force" >nul 2>&1
echo ✅ Recycle Bin emptied!
pause
goto MENU

:UPDATECACHE
cls
echo 🔧 Cleaning Windows Update cache...
net stop wuauserv >nul 2>&1
del /f /s /q C:\Windows\SoftwareDistribution\Download\* >nul 2>&1
net start wuauserv >nul 2>&1
echo ✅ Update cache cleaned!
pause
goto MENU

:EVENTLOGS
cls
echo 📄 Clearing Event Logs...
for /f %%x in ('wevtutil el') do wevtutil cl "%%x"
echo ✅ Event logs cleared!
pause
goto MENU

:LOGFILES
cls
echo 🗂️ Removing old log files...
del /s /q C:\Windows\Logs\* >nul 2>&1
echo ✅ Log files removed!
pause
goto MENU

:ALL
cls
echo 🔄 Running full cleanup...
call :TEMP
call :PREFETCH
call :RECYCLEBIN
call :UPDATECACHE
call :EVENTLOGS
call :LOGFILES
echo ✅ All cleanup tasks completed!
pause
goto MENU
