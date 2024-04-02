@echo off
setlocal enabledelayedexpansion

set timef=%time:~0,2%%time:~3,2%%time:~6,2%

set "tempfile=%tmp%\ffmpeg_%RANDOM%.tmp"

for %%f in (%*) do (
    echo file '%%f' >> %tempfile%
)

rem echo %tempfile%
rem echo video_joined_%timef%.mp4

ffmpeg -f concat -i %tempfile% -c copy video_joined_%timef%.mp4 -hide_banner -loglevel error

del %tempfile%