REM usage: > audio.bat "https://www.youtube.com/watch?v=WM8bTdBs-cw" (precisa usar aspas duplas por causa de como o windows interpreta)
youtube-dl.exe --extract-audio --audio-format mp3 --audio-quality 0 %1
