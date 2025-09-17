@echo off
setlocal enabledelayedexpansion


set "example_path=images"
set "directory=%cd%\%example_path%"


if not exist "%directory%" (
    echo Directory "%directory%" does not exist!
    pause
    exit /b 1
)


echo Files in directory: "%directory%"
dir /b "%directory%"
set images_name = dir /b "%directory%"
rem Loop through each file in the directory
for %%f in ("%directory%\*.*") do (
    echo Opening: %%~nxf
    start "" "%%f"
    
    rem Wait for 4 seconds
    timeout /t 4 /nobreak >nul
    

    echo Attempting to close application...
    
    rem This is a generic approach - you may need to customize per file type
    for /f "tokens=4" %%p in ('tasklist /fi /im images_name ) do (
        taskkill /im images_name
    )
)

echo All files processed.
pause
endlocal

rem PREVOUS FINAL COPY (ON MAIN) DONE WITH SUPPORT OF DEEPKSEEK https://www.deepseek.com/en