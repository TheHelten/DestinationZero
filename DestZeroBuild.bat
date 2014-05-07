@echo off
SET PATH=%PATH%;%~dp0\Tools
set WorkingCopyPath=%~dp0
cls

echo ------------------------------
echo Retrieving SVN Revision Number
echo ------------------------------
for /f "tokens=5" %%i in ('"SubWCRev "%WorkingCopyPath%.""') do set REVISIONNUMBER=%%i

:MENU
cd /d %~dp0
cls

chgcolor 0a
echo ษอออออออออออออออออออออออออออออออออออออป
echoj $ba
chgcolor 0f
echoj " Destination Zero SVN Build Compiler "
chgcolor 0a
chgcolor 0a
echoj $ba $0a
echo ศอออออออออออออออออออออออออออออออออออออผ

chgcolor 07
echo.
echoj "Current Path Is: "
chgcolor 0b
echo %~dp0
chgcolor 07
echoj "Current SVN Revision: "
chgcolor 0c
echo %REVISIONNUMBER%
echo.
chgcolor 0f
echoj "1. "
chgcolor 0e
echo Build Local Development Version
chgcolor 0f
echoj "2. "
chgcolor 0e
echoj "Build SVN Release "
echo.
chgcolor 0f
echoj "3. "
chgcolor 03
echo Quit
chgcolor 07

echo.
CHOICE /C 1234567 /N /M "Choose Option (Number Keys):"
IF ERRORLEVEL 3 GOTO LEAVE
IF ERRORLEVEL 2 GOTO SVNCOREFULL
IF ERRORLEVEL 1 GOTO DEVCORE

:DEVCORE
echo Compiling Destination Zero Local Development Build...
del .\builds\DestinationZero-CH-DEV.pk3 /q

cd pk3
7za a -y -tzip -mx=0 -mmt -x!.svn ..\builds\DestinationZero-CH-DEV.pk3 .\

pause
goto MENU

:SVNCOREFULL
echo Compiling Destination Zero SVN Release Rev#: %REVISIONNUMBER% (Full Compression)...
del .\builds\DestinationZero-CH-r%REVISIONNUMBER%.pk3 /q

cd pk3
7za a -y -tzip -mx=9 -mmt -x!.svn ..\builds\DestinationZero-CH-r%REVISIONNUMBER%.pk3 .\

pause
goto MENU

:LEAVE
echo.
echo Thanks for trying my SVN PK3 Compiler! - Jordon Moss (aka. Striker The Hedgefox)
echo Found any bugs? E-Mail me at mossj32@gmail.com