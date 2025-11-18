@echo off
REM OCR all JPG images into a single text file
REM Make sure Tesseract and ImageMagick are installed and in PATH

set output=all_cactus.txt
REM Clear previous output file
if exist %output% del %output%

for %%i in (???.jpg) do (
    echo Processing %%i...

    REM Preprocess image for better OCR
    magick "%%i" -resize 300% -colorspace Gray -threshold 60% "preprocessed_%%i"

    echo --- %%i --- >> %output%
    
    REM Run Tesseract with improved OCR settings and filter unwanted lines
    tesseract "preprocessed_%%i" stdout -l eng --oem 1 --psm 6 | findstr /v /i "Facebook Instagram @askaktus ASkaktus" >> %output%
    
    echo. >> %output%
)

echo All images processed! Output saved in %output%
pause
