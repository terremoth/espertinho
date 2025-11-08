set _filename=%~n1
set _extension=%~x1
set timef=%time:~0,2%%time:~3,2%%time:~6,2%

ffmpeg -i %1 -filter:a "volume=%2.0" -vcodec copy %_filename%_audio_fix_%timef%%_extension% -hide_banner -loglevel error
