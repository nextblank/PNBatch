::��ʱ�ػ��ű�
@echo off
mode con lines=25
setlocal enabledelayedexpansion

cls
:myMenu
title ��ʱ�ػ�(����:yu-junjun@qq.com)
color b0
set "timeGoal=20:01"

echo.
echo ʱ��ʹ��24Сʱ��(��02:15)��Ĭ�Ϲػ�ʱ��Ϊ%timeGoal%
echo ȡ�����йػ��ƻ�����N
echo ��ǰʱ��%time:~0,5%
echo --------------------------------------------------------------

set /p timeGoal=������ػ�ʱ��(��ʽΪ��HH:mm):

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
echo ������%timeGoal%�Ĺػ��ƻ�
goto myMenu

:myCancel
shutdown -a
echo ��ȡ����ǰ�趨
goto myMenu

:myExit
echo --------------------------------------------------------------
pause
Exit