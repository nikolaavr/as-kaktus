@echo off
REM OCR all JPG images into a single text file
REM Make sure Tesseract is installed and in PATH

set output=all_cactus.txt
REM Clear previous output file
if exist %output% del %output%

for %%i in (???.jpg) do (
    echo Processing %%i...
    echo --- %%i --- >> %output%
    tesseract "%%i" stdout -l eng | findstr /v /i "saksija 5cm 6cm 7cm 8cm 9cm 10cm Facebook Instagram @askaktus ASkaktus" >> %output%
    echo. >> %output%
)

echo All images processed! Output saved in %output%
pause