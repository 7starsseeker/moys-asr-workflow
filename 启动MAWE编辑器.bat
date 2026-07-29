@echo off
chcp 65001 >nul
title MAWE Server
cd /d "%~dp0"
if "%~1"=="" goto :help

set JSON=
set MEDIA=

:: find .json and possible media by extension
if /i "%~x1"==".json" (set JSON=%~1& set MEDIA_ARG=2) else (set MEDIA_ARG=1)
if /i "%~x2"==".json" (set JSON=%~2& set MEDIA_ARG=1)

if "%JSON%"=="" (echo Error: no .json file & pause & exit /b)
if not exist "%JSON%" (echo Error: cannot find "%JSON%" & pause & exit /b)

:: check if the other arg is a known media format
if "%MEDIA_ARG%"=="1" (call :media "%~x1" "%~1")
if "%MEDIA_ARG%"=="2" (call :media "%~x2" "%~2")

echo JSON: %JSON%
if not "%MEDIA%"=="" (echo Media: %MEDIA%) else (echo Media: auto-detect)
echo.
echo Open http://127.0.0.1:8250 in your browser
echo.
if "%MEDIA%"=="" (
  uv run python server-editor\serve.py "%JSON%"
) else (
  uv run python server-editor\serve.py "%JSON%" --media "%MEDIA%"
)
pause
exit /b

:media
if /i "%~1"==".mp4" set MEDIA=%~2
if /i "%~1"==".mkv" set MEDIA=%~2
if /i "%~1"==".avi" set MEDIA=%~2
if /i "%~1"==".mov" set MEDIA=%~2
if /i "%~1"==".wmv" set MEDIA=%~2
if /i "%~1"==".flv" set MEDIA=%~2
if /i "%~1"==".webm" set MEDIA=%~2
if /i "%~1"==".m4v" set MEDIA=%~2
if /i "%~1"==".ts"  set MEDIA=%~2
if /i "%~1"==".wav" set MEDIA=%~2
if /i "%~1"==".mp3" set MEDIA=%~2
if /i "%~1"==".m4a" set MEDIA=%~2
if /i "%~1"==".aac" set MEDIA=%~2
if /i "%~1"==".ogg" set MEDIA=%~2
if /i "%~1"==".flac" set MEDIA=%~2
if /i "%~1"==".opus" set MEDIA=%~2
goto :eof

:help
echo Drag .json file onto this script
pause
