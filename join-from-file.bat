set timef=%time:~0,2%%time:~3,2%%time:~6,2%

ffmpeg -f concat -i %1 -c copy joined_video_%timef%.mp4