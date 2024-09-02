@echo off
setlocal

:::  ________  _______   ________   _______   ___      ___ ________  ___       _______   ________   ________  _______      
::: |\   __  \|\  ___ \ |\   ___  \|\  ___ \ |\  \    /  /|\   __  \|\  \     |\  ___ \ |\   ___  \|\   ____\|\  ___ \     
::: \ \  \|\ /\ \   __/|\ \  \\ \  \ \   __/|\ \  \  /  / | \  \|\  \ \  \    \ \   __/|\ \  \\ \  \ \  \___|\ \   __/|    
:::  \ \   __  \ \  \_|/_\ \  \\ \  \ \  \_|/_\ \  \/  / / \ \  \\\  \ \  \    \ \  \_|/_\ \  \\ \  \ \  \    \ \  \_|/__  
:::   \ \  \|\  \ \  \_|\ \ \  \\ \  \ \  \_|\ \ \    / /   \ \  \\\  \ \  \____\ \  \_|\ \ \  \\ \  \ \  \____\ \  \_|\ \ 
:::    \ \_______\ \_______\ \__\\ \__\ \_______\ \__/ /     \ \_______\ \_______\ \_______\ \__\\ \__\ \_______\ \_______\
:::     \|_______|\|_______|\|__| \|__|\|_______|\|__|/       \|_______|\|_______|\|_______|\|__| \|__|\|_______|\|_______|
::: 
:::  _____ ______   _______   ________   ________  ___  ________  ___  ___     
::: |\   _ \  _   \|\  ___ \ |\   ____\ |\   ____\|\  \|\   __  \|\  \|\  \    
::: \ \  \\\__\ \  \ \   __/|\ \  \___|_\ \  \___|\ \  \ \  \|\  \ \  \\\  \   
:::  \ \  \\|__| \  \ \  \_|/_\ \_____  \\ \_____  \ \  \ \   __  \ \   __  \  
:::   \ \  \    \ \  \ \  \_|\ \|____|\  \\|____|\  \ \  \ \  \ \  \ \  \ \  \ 
:::    \ \__\    \ \__\ \_______\____\_\  \ ____\_\  \ \__\ \__\ \__\ \__\ \__\
:::     \|__|     \|__|\|_______|\_________\\_________\|__|\|__|\|__|\|__|\|__|
:::                             \|_________\|_________|
::: ___  ________   ________  _________  ________  ___       ___       _______   ________     
::: |\  \|\   ___  \|\   ____\|\___   ___\\   __  \|\  \     |\  \     |\  ___ \ |\   __  \    
::: \ \  \ \  \\ \  \ \  \___|\|___ \  \_\ \  \|\  \ \  \    \ \  \    \ \   __/|\ \  \|\  \   
:::  \ \  \ \  \\ \  \ \_____  \   \ \  \ \ \   __  \ \  \    \ \  \    \ \  \_|/_\ \   _  _\  
:::   \ \  \ \  \\ \  \|____|\  \   \ \  \ \ \  \ \  \ \  \____\ \  \____\ \  \_|\ \ \  \\  \| 
:::    \ \__\ \__\\ \__\____\_\  \   \ \__\ \ \__\ \__\ \_______\ \_______\ \_______\ \__\\ _\ 
:::     \|__|\|__| \|__|\_________\   \|__|  \|__|\|__|\|_______|\|_______|\|_______|\|__|\|__|
:::                    \|_________|

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
:: Play soundbyte from audio
if not exist audio\ mkdir audio
cd audio
set "file=Benevolence_Messiah_DJ_Kwe.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..

timeout /t 3

:: Download the repo code if its not downloaded.
echo As-salamu alaykum!!
echo detecting presence of repo, git cloning if not detected...
echo ---------------------------------------------------------------
if exist README.md goto Menu1
git clone https://github.com/BenevolenceMessiah/MusicGen-Tools.git
cd MusicGen-Tools
git pull
cd audio
set "file=Benevolence_Messiah_DJ_Kwe.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs
cd ..
echo ---------------------------------------------------------------

:Menu1
echo ---------------------------------------------------------------
echo Please choose from the following options:
echo - These options are all case sensitive.
echo - If you have no idea what you're doing I suggest launching option '4'.
echo - Press Ctrl+c to exit at any time!
echo ---------------------------------------------------------------
echo 1) Install MusicGen models.
echo 2) Install dependencies for Local deployment via CLI and Gradio.
echo    Note the Gradio Installation requires Python 3.9 Apparently,
echo    (according to a random forum), the AudioCraft dependency has 
echo    been tested with Python 10. This is the default python version.
echo    Edit py 3.10 to py 3.9 in the environment script under the 
echo    installer section of this file if you have any problems. 
echo 3) Run remotely via Google Colab Notebook.
echo 4) Run remotely via HuggingFace.
echo 5) Finetuning Options...
echo 6) Launch Gradio.
echo 7) Launch CLI.
echo C) Exit
echo U) Update repos and models.
echo Z) Play music via standalone cmd console while you wait for things to install/download/merge!
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == 1 goto Install
if %option% == 2 goto Run
if %option% == 3 goto LaunchGoogleColab
if %option% == 4 goto LaunchHuggingFace
if %option% == 5 goto Finetuning
if %option% == 6 goto LaunchGradio
if %option% == 7 goto LaunchCLI
if %option% == C goto End
if %option% == U goto Updater
if %option% == Z goto Music

:Install
echo ---------------------------------------------------------------
echo Whhich model would you like to install?
echo ---------------------------------------------------------------
echo A) MusicGen-Stereo-Large-3.3B
echo B) MusicGen-Stereo-Melody-Large-3.3B
echo M) Main Menu
echo C) Exit
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == A goto MusicGenLarge
if %option% == B goto MusicGenMelodyLarge
if %option% == M goto Menu1
if %option% == C goto End


:MusicGenLarge
echo ---------------------------------------------------------------
echo Downloading Model...
echo ---------------------------------------------------------------
cd models
git lfs install
git clone https://huggingface.co/facebook/musicgen-stereo-large
cd ..
goto Install

:MusicGenMelodyLarge
echo ---------------------------------------------------------------
echo Downloading Model...
echo ---------------------------------------------------------------
cd models
git lfs install
git clone https://huggingface.co/facebook/musicgen-stereo-melody-large
cd ..
goto Install

:Run
echo ---------------------------------------------------------------
echo Detecting/Installing/Activating Virtual Environment
echo ---------------------------------------------------------------
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
echo ---------------------------------------------------------------
pip install git+https://github.com/facebookresearch/audiocraft.git
:: apt get install ffmpeg
echo ---------------------------------------------------------------
echo Downloading additional big files from Google Drive because I'm not paying for Git LFS storage space...
echo ---------------------------------------------------------------
cd /d %~dp0
call curl "https://drive.usercontent.google.com/download?id=1LRPCe5qTgg9JW87cVl95P3K1pJhNyeYk&export=download&authuser=1&confirm=t&uuid=3f4a7874-f4b8-4e0e-993c-ae33d1764e9f&at=AO7h07e8Qury-L-MAMGNbaqf_nad:1724985319368" -o ffmpeg.zip
:: Unzip assets.
powershell -command "Expand-Archive -Force '%~dp0*.zip' '%~dp0'"
:: Delete .zip archive if it exists.
if exist ffmpeg.zip del ffmpeg.zip
echo ---------------------------------------------------------------
echo Installation complete. 
echo Edit MusicGen-CLI.py for the desired prompt, then run the CLI (option '2')
echo to launch model via CLI. Exit the script now via Ctrl+c if you don't want to install for Gradio.
echo ---------------------------------------------------------------
timeout /t -1
echo ---------------------------------------------------------------
echo Installing MusicGen-Web-UI...
echo This requires Python 3.9; apparently it works with 3.10...
echo ---------------------------------------------------------------
git lfs install
git clone https://huggingface.co/spaces/BenevolenceMessiah/MusicGen MusicGen-Web-UI
cd MusicGen-Web-UI
if not exist venv (
    py -3.10 -m venv .venv
) else (
    echo Existing venv detected. Activating.
)
echo Activating virtual environment
call .venv\Scripts\activate
python.exe -m pip install --upgrade pip
pip install --upgrade --force-reinstall torch==2.0 --index-url https://download.pytorch.org/whl/cu121
:: Stable Release
:: pip install -U audiocraft
:: Experimental Release
:: pip install -U git+https://git@github.com/facebookresearch/audiocraft#egg=audiocraft
pip install -e
cd ..
echo ---------------------------------------------------------------
echo Installation complete.
echo ---------------------------------------------------------------
goto Menu1

:LaunchGoogleColab
echo ---------------------------------------------------------------
echo Launching Google Colab. You may close the excess CMD window.
echo ---------------------------------------------------------------
start start https://colab.research.google.com/drive/1fxGqfg96RBUvGxZ1XXN07s3DthrKUl4-?usp=sharing#scrollTo=32g-tH7IZz5N
goto Menu1

:LaunchHuggingFace
echo ---------------------------------------------------------------
echo Launching Huggingface Spaces. You may close the excess CMD window.
echo ---------------------------------------------------------------
start start https://huggingface.co/spaces/facebook/MusicGen
goto Menu1

:Finetuning
echo ---------------------------------------------------------------
echo Launching Finetuning Options...
echo This feature is incomplete at this time...
echo ---------------------------------------------------------------
echo D) Finetune MusicGen (Vanilla) via Google Colab
echo E) Finetune MusicGen (Braindead (Includes Scraper)) via Google Colab
echo M) Main Menu
echo C) Exit
echo ---------------------------------------------------------------

set /P option=Enter your choice:
if %option% == D goto Finetune1
if %option% == E goto Finetune2
if %option% == M goto Menu1
if %option% == C goto End

:Finetune1
echo ---------------------------------------------------------------
echo Launching vanilla Finetuning. You may close the excess CMD window.
echo ---------------------------------------------------------------
start start https://colab.research.google.com/drive/13tbcC3A42KlaUZ21qvUXd25SFLu8WIvb?usp=sharing
goto Menu1

:Finetune2
echo ---------------------------------------------------------------
echo Launching Braindead Finetuning. You may close the excess CMD window.
echo ---------------------------------------------------------------
start start https://colab.research.google.com/drive/1VX8tMAfyWVEHZiyviuovUgKXq1GpKcdR
goto Menu1

:LaunchGradio
echo ---------------------------------------------------------------
echo Launching via Gradio Web UI.
echo ---------------------------------------------------------------
cd MusicGen-Web-UI
cd demos
start call musicgen_app.py
cd ..
cd ..
goto Menu1

:LaunchCLI
echo ---------------------------------------------------------------
echo Launching via CLI.
echo ---------------------------------------------------------------
start call MusicGen-CLI.py
goto Menu1

:Music
echo Installing music dependencies if not installed...
echo ---------------------------------------------------------------
if not exist Audio_Assets git clone https://github.com/BenevolenceMessiah/Audio_Assets.git
cd Audio_Assets
echo Launching Standalone Music CMD Window!
start call launch_in_standalone_console.bat
cd ..
goto Menu1

:Updater
echo ---------------------------------------------------------------
echo Updating repo...
echo ---------------------------------------------------------------
ls | xargs -I{} git -C {} pull
echo Complete!
echo ---------------------------------------------------------------
goto Menu1

:End 
echo ---------------------------------------------------------------
echo As-salamu alaykum!!
echo ---------------------------------------------------------------
pause