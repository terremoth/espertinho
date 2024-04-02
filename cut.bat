set _filename=%~n1
set _extension=%~x1
set timef=%time:~0,2%%time:~3,2%%time:~6,2%

ffmpeg.exe -i %1 -ss %2 -to %3 -c:v copy -c:a copy "%_filename%_%timef%%_extension%"