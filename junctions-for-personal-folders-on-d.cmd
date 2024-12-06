@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
@echo on

mklink /j "%USERPROFILE%\Nedlastinger" "D:\Users\%USERNAME%\Downloads"
mklink /j "%USERPROFILE%\Downloads" "D:\Users\%USERNAME%\Downloads"
mklink /j "%USERPROFILE%\Documents" "D:\Users\%USERNAME%\Documents"
mklink /j "%USERPROFILE%\Dokumenter" "D:\Users\%USERNAME%\Documents"
mklink /j "%USERPROFILE%\Bilder" "D:\Users\%USERNAME%\Pictures"
mklink /j "%USERPROFILE%\Pictures" "D:\Users\%USERNAME%\Pictures"
mklink /j "%USERPROFILE%\Music" "D:\Users\%USERNAME%\Music"
mklink /j "%USERPROFILE%\Musikk" "D:\Users\%USERNAME%\Music"
mklink /j "%USERPROFILE%\Videoer" "D:\Users\%USERNAME%\Videos"
mklink /j "%USERPROFILE%\Videos" "D:\Users\%USERNAME%\Videos"
mklink /j "%USERPROFILE%\OneDrive" "D:\Users\%USERNAME%\OneDrive"

pause
