@echo off
title Network Monitor
color 0A

:loop
cls
echo ================================
echo       NETWORK STATISTICS
echo ================================
echo.

:: NETWORK INFO
echo [Network]
netsh wlan show interfaces | findstr /C:"SSID" /C:"Radio type" /C:"State" /C:"Signal" /C:"BSSID"
echo.

:: SPEED INFO
echo [Speed]
ping google.com -n 1 | findstr /C:"time=" | findstr /R "[0-9]*ms"
echo.

:: PACKET LOSS
echo [Packet Loss]
ping google.com -n 5 | findstr /C:"Lost"
echo.

:: BYTE STATS
echo [Data Usage]
netstat -e | findstr /C:"Bytes"
echo.

echo Refreshing in 10 seconds...
timeout /t 10 >nul
goto loop
