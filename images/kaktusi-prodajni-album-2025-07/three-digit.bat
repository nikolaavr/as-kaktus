@echo off
REM ================================================
REM Complete OCR batch for cactus images
REM 1. Rename all JPG files to 3-digit format
REM 2. Run Tesseract OCR on all images
REM 3. Filter unwanted text (example: skip "noise" or "test")
REM 4. Save all results in a single output file
REM ================================================

set output=all_cactus.txt
REM Delete previous output if exists
if exist %output% del %output%

REM --- Step 1: Rename all JPG files to 3-digit format ---
for %%f in (*.jpg) do (
    set name=%%~nf
    setlocal enabledelayedexpansion
    set num=000!name!
    set num=!num:~-3!
    ren "%%f" "!num!.jpg"
    endlocal
)

REM --- Step 2 & 3: OCR + Filter ---
for %%i in (???.jpg) do (
    echo Processing %%i...
    echo --- %%i --- >> %output%
    REM Replace 'noise test' with any words you want to exclude
    tesseract "%%i" stdout -l eng | findstr /v /i "Facebook Instagram @askaktus ASkaktus jul 2025" >> %output%
    echo. >> %output%
)

echo =================================
echo All images processed!
echo Output saved in %output%
pause