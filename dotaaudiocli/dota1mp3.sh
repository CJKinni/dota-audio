while :
  do
    /Applications/VLC.app/Contents/MacOS/VLC -I 'dummy' http://dotaaudio.com:8000/DotaStream1.ogg --sout-shout-mp3 --sout '#transcode{acodec=mp3,channels=1,ab=32}:duplicate{dst=std{access=shout,mux=raw,dst=source:PASSWORD@dotaaudio.com:8000/DotaStream1.mp3}}' vlc://quit
done
