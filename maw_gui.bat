@echo off
chcp 65001 >nul
title MAW GUI
cd /d "%~dp0"
echo [MAW] Starting GUI...
uv run python maw_gui.py
pause
