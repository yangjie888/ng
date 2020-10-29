@echo off 
rem 当前bat的作用 

echo ==================begin======================== 

cls 
SET NGINX_PATH=C: 
SET NGINX_DIR=C:\Users\86182\Desktop\nginx-1.14.2\
color 0a 
TITLE Nginx Manager Power By Ants 

CLS 

ECHO. 
ECHO. * * Nginx Manager Power By Ants 
ECHO. * update by 2013-03-13 *  
ECHO. 

:MENU 

ECHO. * nginx list *  
tasklist|findstr /i "nginx.exe" 

ECHO. 
    ECHO.  [1] start Nginx  
    ECHO.  [2] stop Nginx  
    ECHO.  [3] restart Nginx  
    ECHO.  [4] Cancel 
ECHO. 

ECHO.Choose Please: 
set /p ID= 
    IF "%id%"=="1" GOTO start 
    IF "%id%"=="2" GOTO stop 
    IF "%id%"=="3" GOTO restart 
    IF "%id%"=="4" EXIT 
PAUSE 

:start 
    call :startNginx 
    GOTO MENU 

:stop 
    call :shutdownNginx 
    GOTO MENU 

:restart 
    call :shutdownNginx 
    call :startNginx 
    GOTO MENU 

:shutdownNginx 
    ECHO. 
    ECHO.shut down Nginx...... 
    taskkill /F /IM nginx.exe > nul 
    ECHO.OK,shut down all nginx grep 
    goto :eof 

:startNginx 
    ECHO. 
    ECHO.start Nginx...... 
    IF NOT EXIST "%NGINX_DIR%nginx.exe" ECHO "%NGINX_DIR%nginx.exe"not exit 

    %NGINX_PATH% 

    cd "%NGINX_DIR%" 

    IF EXIST "%NGINX_DIR%nginx.exe" ( 
        echo "start '' nginx.exe" 
        start "" nginx.exe 
    ) 
    ECHO.OK 
    goto :eof