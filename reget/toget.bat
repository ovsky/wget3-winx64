@echo off
title WGET WINx64
color 3
echo.
chcp 65001
echo ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
echo   START - GNU WGET - WINx64
echo.

set arg1=%1
set arg2=%2
set succeed_get=1
shift
shift
set argC=0 

for %%x in (%*) do Set /A argC+=1

if %argC% == 0 goto end & goto break
if %argC% == 1 goto autoFormat
if %argC% == 2 goto pathFormat
if %argC% == 3 goto mainFormat

:autoFormat
rget %arg1% -P .%~dp0/wget/

if errorlevel 1 (
    set succeed_get=0
    echo.
    echo [WGET FETCHING ERROR!]
) ELSE (
    set succeed_get=1
    echo [WGET FETCHING SUCESS!]
)

@REM rget %arg1% -P .%~dp0/wget/
goto sucess

:pathFormat
rget %arg1% -P %arg2%

if errorlevel 1 (
    set succeed_get=0
    echo.
    echo [WGET FETCHING ERROR!]
) ELSE (
    set succeed_get=1
    echo [WGET FETCHING SUCESS!]
)

goto sucess

:mainFormat
rget %arg1% %*

if errorlevel 1 (
    set succeed_get=0
    echo.
    echo [WGET FETCHING ERROR!]
) ELSE (
    set succeed_get=1
    echo [WGET FETCHING SUCESS!]
)

goto sucess

:sucess
title WGET WINx64

echo. & echo ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ & echo. 
color 0
:end

call ./note.bat

if %succeed_get% == 0 (
    echo. & echo Failed to use /improved and simplified/ 'rget' /WGET for WINx64/! & echo. & echo Can't download data!
    title WGET WINx64 - [FAIL]
    color 4
) ELSE (
    echo. & echo Sucessfully used /improved and simplified/ 'rget' /WGET for WINx64/! & echo Downloaded data!
    title WGET WINx64 - [SUCESS]
    color 2
)
echo.

:break
pause
color 3