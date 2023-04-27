@echo off
cls
SET FILENAME=script.dpscript
SET SPACER=------------------------------------------------------------------
echo LIST DISK > %FILENAME%
echo Listing Storage Devices...
echo %SPACER%
diskpart /s %FILENAME% | more +6 | more
echo %SPACER%
set /p Disk=Please enter the disk number:
if "%Disk%"=="" goto :CANCELTG

echo %SPACER%
echo Running diskpart script now.

echo SELECT DISK %Disk% > %FILENAME%
echo CLEAN >> %FILENAME%
echo CREATE PARTITION PRIMARY >> %FILENAME%
echo FORMAT FS=NTFS QUICK >> %FILENAME%
echo ASSIGN >> %FILENAME%

diskpart /s %FILENAME%

echo %SPACER%
echo Script finished

:CANCELTG
echo Removing temp. script file...
del %FILENAME%
echo File Removed. Exiting.