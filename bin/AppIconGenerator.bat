@echo off
title App Icon Generator-by Yida
color 84
::echo Current dir£º%~dp0
::echo Current file: %1%
set filename=%1
set filepath=%~dp1
cd %~dp0

:begin
if "%filename%"=="" (
	setlocal enabledelayedexpansion 
	set /p filename=Please drag the png file into this window for generating:
	for /f %%a in ("!filename!") do (
		set filepath=%%~dpa
	)
)
choice /c:123 /m:"Please choose the icon type you want to generate£¨1:Android 2:IOS 3:exit£©"
if %errorlevel%==3 goto end
if %errorlevel%==2 goto ios                               
if %errorlevel%==1 goto android

:android
echo Generating "icon_android.zip" please wait..
curl --upload-file %filename% http://makeappicon.com/make/android >%filepath%icon_android.zip
goto success

:ios
echo Generating "icon_ios.zip" please wait..
curl --upload-file %filename% http://makeappicon.com/make/ios >%filepath%icon_ios.zip
goto success	

:success
echo Generate success!press any key to quit.
pause
goto end

:end
echo Bye bye~