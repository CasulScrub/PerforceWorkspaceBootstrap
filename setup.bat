
@echo off
SET script=Setup-PerforceWorkspace-FULL.ps1

:: Check if PowerShell script exists
IF NOT EXIST %script% (
    echo ❌ ERROR: %script% not found in this folder.
    pause
    exit /b 1
)

:: Run the PowerShell script with unrestricted execution policy
powershell -NoProfile -ExecutionPolicy Bypass -File "%script%"

pause
