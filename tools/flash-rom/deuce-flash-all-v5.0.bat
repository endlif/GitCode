@ECHO OFF
cls
cd /d %~dp0
powershell.exe -ExecutionPolicy Bypass -WindowStyle Maximized -File deuce-flash-all-v5.0.ps1

