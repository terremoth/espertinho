set _filename=%~n1
set _extension=%~x1

ffmpeg -i %1 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p "%_filename%_fixed_for_whatsapp.mp4"