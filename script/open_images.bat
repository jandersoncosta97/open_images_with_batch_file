@echo off
setlocal enabledelayedexpansion

rem Set the directory where your files are located
set "example_path=images"
set "directory=%cd%\%example_path%"

rem Check if directory exists
if not exist "%directory%" (
    echo Directory "%directory%" does not exist!
    pause
    exit /b 1
)

rem List all files in the directory
echo Files in directory: "%directory%"
dir /b "%directory%"

rem Loop through each file in the directory
for %%f in ("%directory%\*.*") do (
    echo Opening: %%~nxf
    start "" "%%f"
    
    rem Wait for 4 seconds
    timeout /t 4 /nobreak >nul
    
    rem Try to close the application (this part may need adjustment)
    rem Note: taskkill with file extension won't work properly
    rem You'll need to specify the actual process name
    echo Attempting to close application...
    
    rem This is a generic approach - you may need to customize per file type
    for /f "tokens=2" %%p in ('tasklist /fi "imagename eq %%f" 2^>nul') do (
        taskkill /pid %%p /f >nul 2>&1
    )
)

echo All files processed.
pause
endlocal