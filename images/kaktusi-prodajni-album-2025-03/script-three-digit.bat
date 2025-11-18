@echo off
setlocal enabledelayedexpansion
set i=1
for %%f in (*.jpg) do (
    set "num=00!i!"
    set "num=!num:~-3!"
    ren "%%f" "!num!.jpg"
    set /a i+=1
)
