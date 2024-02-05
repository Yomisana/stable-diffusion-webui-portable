@echo off

echo.
echo =========================================================================
echo Yomisana GTX 1660 Ti Stable Diffusion For Windows portable python version
echo 優米撒那 GTX 1660 Ti Stable Diffusion For Windows 免安裝 python 版本
echo =========================================================================
echo.

echo Current working directory: %cd%
set ROOT=%cd%
cd stable_diffusion_webui

echo In Stable Diffusion WebUI working directory: %cd%

@REM first set portable python path
set PYTHON=%ROOT%\portable_python\python.exe

@REM check stable diffusion webui venv folder
set venv_folder=%ROOT%\stable_diffusion_webui\venv
if exist %venv_folder% (
    echo exist venv
) else (
    echo create venv
    call %PYTHON% -m virtualenv venv
)




@REM none install portable git
@REM set GIT= 
@REM default virtual environment directory
@REM set VENV_DIR=
@REM use GPU 6G Video RAM
set COMMANDLINE_ARGS= --xformers --disable-safe-unpickle --medvram
@REM @REM use less than 6G Video RAM
@REM set COMMANDLINE_ARGS= --xformers --disable-safe-unpickle --lowvram
@REM @REM use CPU only
@REM set COMMANDLINE_ARGS= --use-cpu all --no-half --skip-torch-cuda-test --enable-insecure-extension-access

@REM Start Stable Diffusion WebUI
call webui.bat

@REM if call webui.bat not work will pause
pause