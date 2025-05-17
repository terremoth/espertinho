set _filename=%~n1

ffmpeg.exe -i %1 -vf "scale=%2" %_filename%_redimensionada.jpg -hide_banner -loglevel error
