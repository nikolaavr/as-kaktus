@echo off
REM ================================================
REM OCR batch for cactus images - plain output
REM ================================================

set output=all_cactus.txt
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
    REM Replace 'noise test' with words to exclude
    tesseract "%%i" stdout -l eng | findstr /v /i "Facebook Instagram @askaktus ASkaktus jul 2025" >> %output%
    echo. >> %output%
)

echo OCR completed!
echo All results saved in %output%
pause
