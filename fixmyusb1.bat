��
cls
@echo off
echo This tool can fix your USB. Please run as admin and ensure the user you are using has admin rights.
echo.

:: Get user input for disk number, size, and drive letter
set /p num=Please enter your flash drive disk number: 
set /p size=Please enter your flash drive size in MB: 
set /p letter=Please enter your new partition letter (e.g., G): 

:: Create a temporary script for DiskPart commands
(
    echo select disk %num%
    echo clean
    echo create partition primary size=%size%
    echo format fs=ntfs quick
    echo assign letter=%letter%
) > diskpart_commands.txt

:: Execute DiskPart with the temporary script
diskpart /s diskpart_commands.txt

:: Clean up the temporary file
del diskpart_commands.txt

echo Completed
pause
