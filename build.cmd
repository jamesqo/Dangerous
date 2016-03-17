@echo off
setlocal

set BINDIR=%~dp0bin
set DOTNETCLI=%BINDIR%\dotnetcli\dotnet.exe
set RESTORECLI_SCRIPT=%dp0restore-cli.ps1

if not exist "%DOTNETCLI%" (
    powershell -NoProfile -ExecutionPolicy Unrestricted -File "%RESTORECLI_SCRIPT%"
)
