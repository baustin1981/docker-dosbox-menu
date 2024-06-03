@echo off
cls
echo ############ GAMES COLLECTION ############
echo # A. Gateway            B. SimCity       #
echo ##########################################
echo #                                        #
echo ##########################################
echo #######  PLEASE MAKE A SELECTION  ########
echo ##########################################
CHOICE /C:AB /N

if ERRORLEVEL == 2 goto SimCity
if ERRORLEVEL == 1 goto Gateway

:Gateway
cd GATEWAY
GATE.exe
goto end

:SimCity
cd SIMCITY
SIMCITY.exe
goto end

:end
cd..
MENU.bat

:quit
cls