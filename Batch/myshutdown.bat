::定时关机脚本
@echo off
mode con lines=25
setlocal enabledelayedexpansion

cls
:myMenu
title 定时关机(作者:yu-junjun@qq.com)
color b0
set "timeGoal=20:01"

echo.
echo 时间使用24小时制(如02:15)，默认关机时间为%timeGoal%
echo 取消已有关机计划，按N
echo 当前时间%time:~0,5%
echo --------------------------------------------------------------

set /p timeGoal=请输入关机时间(格式为：HH:mm):

if %timeGoal%==N goto myCancel
if %timeGoal%==n goto myCancel

set  /a hourNow = %time:~0,2%      
set  /a minuteNow = %time:~3,2%
set  /a secNow = %time:~6,2%

set  /a hourGoal = %timeGoal:~0,2%
set  /a minuteGoal = %timeGoal:~3,2%
set  /a diffT = hourGoal - hourNow

::diffT<0;
if %diffT% lss 0 (
set  /a diffT = diffT + 24
)

set  /a diffT = diffT*3600+(minuteGoal-minuteNow)*60 - secNow

::echo %hourGoal%
::echo %minuteGoal%
::echo %diffT%
::pause

shutdown -s -t %diffT%
echo 已设置%timeGoal%的关机计划
goto myMenu

:myCancel
shutdown -a
echo 已取消当前设定
goto myMenu

:myExit
echo --------------------------------------------------------------
pause
Exit