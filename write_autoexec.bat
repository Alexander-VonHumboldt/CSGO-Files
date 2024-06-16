@ECHO OFF
setlocal

:: Path to steam Counter Strike base directory 
set "steam-base=X:\SteamLibrary\steamapps\common\Counter-Strike Global Offensive"

:: Define file paths
set "repo-base=%~dp0"
set "repo-ver-path=%repo-base%\autoexec.cfg"
set "repo-ver-path-practice=%repo-base%\practice.cfg"
set "repo-ver-path-cs2=%repo-base%\autoexec_cs2.cfg"
set "steam-folder-path=%steam-base%\csgo\cfg\autoexec.cfg"
set "steam-folder-path-practice=%steam-base%\csgo\cfg\practice.cfg"
set "steam-folder-path-cs2=%steam-base%\game\csgo\cfg\autoexec_cs2.cfg"

:main
call :overwrite "CS2 config" "%repo-ver-path-cs2%" "%steam-folder-path-cs2%"
call :overwrite "CSGO config" "%repo-ver-path%" "%steam-folder-path%"
call :overwrite "CSGO practice config" "%repo-ver-path-practice%" "%steam-folder-path-practice%"
exit /b

:overwrite
set "name=%~1"
set "src=%~2"
set "dst=%~3"
set choice=
SET /p choice=Overwrite %name%? [Y or N]: 
IF /I "%choice%"=="" SET choice=N
IF /I "%choice%"=="Y" (
    ECHO Writing %name% to steam folder...
    xcopy /s /y "%src%" "%dst%"
    IF ERRORLEVEL 1 (
        ECHO Failed to write %name% to steam folder.
    ) ELSE (
        ECHO %name% in steam folder overwritten.
    )
) ELSE (
    ECHO %name% is unchanged!
)
PAUSE
goto :eof
