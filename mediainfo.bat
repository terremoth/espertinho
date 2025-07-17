@echo off
setlocal enabledelayedexpansion

set "filepath=%~1"
set "tmp_stream=%TEMP%\ffprobe_stream.tmp"
set "tmp_format=%TEMP%\ffprobe_format.tmp"

rem --- get video stream info (codec, width, height, fps) ---
ffprobe -v error -select_streams v:0 -show_entries stream=codec_name,width,height,r_frame_rate -of default=noprint_wrappers=1:nokey=0 "%filepath%" > "%tmp_stream%"

rem --- get container info (duration, bitrate) ---
ffprobe -v error -show_entries format=duration,bit_rate -of default=noprint_wrappers=1:nokey=0 "%filepath%" > "%tmp_format%"

rem --- start vars ---
set "width="
set "height="
set "duration="
set "bitrate="
set "codec="
set "fps="

rem --- stream parse ---
for /f "tokens=1,* delims==" %%A in (%tmp_stream%) do (
    if "%%A"=="codec_name" set "codec=%%B"
    if "%%A"=="width" set "width=%%B"
    if "%%A"=="height" set "height=%%B"
    if "%%A"=="r_frame_rate" (
        set "fps_raw=%%B"
        rem --- Converte FPS do formato "30000/1001" para decimal aproximado ---
        for /f "tokens=1,2 delims=/" %%F in ("%%B") do (
            set /a "fps_calc=1000 * %%F / %%G"
            set /a "fps=!fps_calc! / 1000"
        )
    )
)

rem --- format parse ---
for /f "tokens=1,* delims==" %%A in (%tmp_format%) do (
    if "%%A"=="duration" set "duration=%%B"
    if "%%A"=="bit_rate" set "bitrate=%%B"
)

rem --- get file size (in bytes and MB) ---
for %%I in ("%filepath%") do (
    set "size_bytes=%%~zI"
    set "created=%%~tI"
)

set /a size_mb=!size_bytes! / 1024 / 1024

rem --- convert duration to human readable format (HHhMMmSSs) ---
set "duration_formatted="
if defined duration (
    set /a "total_secs=duration"
    set /a "hours=total_secs/3600"
    set /a "mins=(total_secs-hours*3600)/60"
    set /a "secs=total_secs%%60"
    
    set "duration_formatted="
    if !hours! gtr 0 set "duration_formatted=!hours!h"
    if !mins! gtr 0 set "duration_formatted=!duration_formatted!!mins!m"
    set "duration_formatted=!duration_formatted!!secs!s"
)

rem --- remove temp files ---
del "%tmp_stream%" >nul 2>&1
del "%tmp_format%" >nul 2>&1

rem --- Exibe resultado ---
echo File: %filepath%
echo Codec: !codec!
echo Width: !width!
echo Height: !height!
echo FPS: !fps! fps
echo Duration: !duration! seconds (!duration_formatted!)
echo Bitrate: !bitrate! bps
echo Size: !size_bytes! bytes (^~!size_mb! MB)
echo Created: !created!
echo Modified: %~t1
