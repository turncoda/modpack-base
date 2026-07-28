@echo off

REM Point this to your Unreal Engine installation. (You probably don't have to modify this.)
set run_uat=C:\Program Files\Epic Games\UE_5.1\Engine\Build\BatchFiles\RunUAT.bat

if not exist "%run_uat%" (
  echo Error: script variable 'run_uat' is set to "%run_uat%" which does not exist. Please install Unreal Engine 5.1 and ensure this script is using a valid path to RunUAT.bat.
  pause
  exit /b 1
)

REM Cook and pak.
call "%run_uat%" BuildCookRun -project="%~dp0\pseudoregalia.uproject" -platform=Win64 -cook

REM Set this to where the cooked map should go.
set dst=%~dp0

copy "%~dp0\Saved\Cooked\Windows\pseudoregalia\Content\Mods\Maps\mise.uexp" "%dst%\mise.uexp"
copy "%~dp0\Saved\Cooked\Windows\pseudoregalia\Content\Mods\Maps\mise.umap" "%dst%\mise.umap"

echo Cooked!
pause
