@rem BatChat
@echo off
cls
pushd "%~dp0"
echo Current DIR: "%CD%"
if "%~1" == "talk_widget" goto talker

rem ================================================

rem ////////////////////
:auth
echo Enter chat filename to connect ("abc" for example):
set /p chat=^>
echo Enter your nick:
set /p nick=^>
start call %0 talk_widget %chat% %nick%

rem ////////////////////
:listener
cls
call title "| Chat: %chat% | User: %nick% |"
if exist %chat%_history type %chat%_history
if not exist %chat% echo. 2>%chat%

:listener_loop
ping 127.0.0.1 -n 1 -w 20 > nul
set oldtext=%text%
set /p text=<%chat%
if not "%text%" == "%oldtext%" echo %text%
goto listener_loop
rem ////////////////////

rem ================================================

rem ////////////////////
rem // %2 - chat name //
rem // %3 - user nick //
rem ////////////////////
:talker
set chat=%~2
set nick=%~3
cls
call title "| Chat: %chat% | User: %nick% |"
call ::cs_in
echo (%TIME% %nick% connected)>%chat%
call ::cs_out
echo (%TIME% %nick% connected)>>%chat%_history

:talker_loop
cls
echo Dear %nick%, type message to send:
set /p msg=^>
call ::cs_in
echo [%TIME% %nick%]: %msg%>%chat%
call ::cs_out
echo [%TIME% %nick%]: %msg%>>%chat%_history
goto talker_loop
rem ////////////////////

rem ================================================

rem ////////////////////
:cs_in
if exist "%chat%_cs" ping 127.0.0.1 -n 1 -w 50 > nul
set cs_value=%RANDOM%

:cs_in_loop
echo %cs_value%>%chat%_cs
set /p ret=<%chat%_cs
if "%ret%" == "%cs_value%" exit /b
ping 127.0.0.1 -n 1 -w 10 > nul
goto :cs_in_loop
rem ////////////////////

rem ////////////////////
:cs_out
del %chat%_cs
exit /b
rem ////////////////////

rem ================================================