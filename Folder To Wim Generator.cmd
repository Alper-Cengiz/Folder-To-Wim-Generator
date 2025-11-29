@echo off
setlocal enabledelayedexpansion
title Folder To Wim Generator
if not "%1"=="a" powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs -ArgumentList a" & exit
:a
:begining
cls
cd ..
cd ..
echo Welcome to Folder To Wim Generator
set /p foldir=Folder directory (Ex: %systemdrive%\MyFolder): 
set /p folname=Folder name (Ex: Folder): 
set /p wimdir=Wim directory (Ex: %systemdrive%): 
set /p wimname=Wim name (Ex: wimfile): 
timeout /t 1 /nobreak >nul
if "%foldir%"=="" goto blank
if "%folname%"=="" goto blank
if "%wimdir%"=="" goto blank
if "%wimname%"=="" goto blank
timeout /t 1 /nobreak >nul
echo Press any key to start
pause >nul
timeout /t 1 /nobreak >nul
set folinfo="!foldir!\!folname!"
timeout /t 1 /nobreak >nul
set wiminfo="!wimdir!\!wimname!.wim"
timeout /t 1 /nobreak >nul
dism /Capture-Image /ImageFile:!wiminfo! /CaptureDir:!folinfo! /Name:"!wimname!"
timeout /t 1 /nobreak >nul
echo Press any key to exit.
pause >nul
exit
timeout /t 5 /nobreak >nul
:blank
echo You can't leave this blank.
echo Press any key to restart.
pause >nul
goto begining
timeout /t 5 /nobreak >nul