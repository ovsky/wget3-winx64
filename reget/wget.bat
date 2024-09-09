@echo off
@REM HEADER
color 3
title WGET WINx64
chcp 65001
echo.
call note.bat
echo.
set argC=0 
for %%x in (%*) do Set /A argC+=1

@REM CUSTOM COMMANDS
if %argC% == 0 (
    rget --help
    goto final
)

if %1 == help (
    rget --help
    goto final
)

if %1 == --help (
    rget --help
    goto final
)

@REM STANDARD INTERPRETATION
rget %*
goto final

@REM FOOTER
:final
echo.
if %argC% GTR 1 (
    call note.bat
)
echo. & echo.
echo ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
echo   GNU WGET - WINx64 - ENHANCED
echo ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛