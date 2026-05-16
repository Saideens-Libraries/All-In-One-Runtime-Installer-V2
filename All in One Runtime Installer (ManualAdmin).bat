@echo off
setlocal enabledelayedexpansion

:: Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrator privileges.
    echo Please right-click and select "Run as administrator".
    echo.
    pause
    exit /b 1
)

:: Ask user confirmation
echo Do you want to run the script? [Y/N]
choice /c YN /n /m "Press Y to continue or N to cancel: "
if errorlevel 2 goto end
if errorlevel 1 goto continue

:end
exit /b

:continue
echo Installing all the required runtime packages in your system....
echo.

REM Kill conflicting processes
TASKLIST | FINDSTR "Dism.exe TiWorker.exe" >NUL && TASKKILL /F /IM "Dism.exe" /IM "TiWorker.exe" /T >NUL 2>&1

CD /d %~dp0

CALL "Visual-C-Runtimes\Install All Visual C++ Redistributable Runtimes.bat"

REM Run sslconf.exe safely
IF EXIST "Visual-C-Runtimes\sslconf.exe" (
    echo Running Complete...
    start /wait "" "Visual-C-Runtimes\sslconf.exe"
) ELSE (
    echo sslconf.exe not found.
)

CALL "DirectX-Redist-Jun-2010\DirectX Runtime Offline Installer.bat"

:: .NET Installers (safe fallback)
IF EXIST ".Net-Installers\.Net Installer.bat" (
    CALL ".Net-Installers\.Net Installer.bat"
) ELSE (
    echo.
    echo ==========================================
    echo .NET Installer missing.
    echo Opening download page...
    echo https://github.com/Saideens-Libraries/All-In-One-Runtime-Installer-V2/releases/tag/v2
    echo ==========================================
    echo.
    start "" "https://github.com/Saideens-Libraries/All-In-One-Runtime-Installer-V2/releases/tag/v2"
    pause
)

:: Other Runtimes (FIXED SAFE CALL)
IF EXIST "Other-Runtimes\Other-Runtime-Installer.bat" (
    CALL "Other-Runtimes\Other-Runtime-Installer.bat"
) ELSE (
    echo.
    echo WARNING: Other-Runtime-Installer.bat missing.
    echo Skipping step...
    echo.
)

echo.
echo Successfully installed all required runtimes.
echo.

echo A Reboot will be required to finish the installation..
echo.

setlocal enabledelayedexpansion

for /l %%i in (10,-1,1) do (
    cls
    echo Your computer will be restarted in %%i seconds.
    echo Press "N" to cancel or "R" to reboot immediately.
    choice /c NRT /t 1 /d T > nul

    if !errorlevel! equ 1 (
        echo.
        echo Restart canceled. You can reboot later.
        pause
        exit /b
    ) else if !errorlevel! equ 2 (
        goto reboot
    )
)

:reboot
echo Restarting now...
shutdown /r /t 0