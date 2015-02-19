while :
  do
    livestreamer -a "-I 'dummy' {filename} --sout '#transcode{{vcodec=dummy,acodec=vorb,ab=96,channels=1}}:std{{access=shout,mux=ogg,dst=source:PASSWORD@dotaaudio.com:8000/DotaHqOgg}}' 'vlc://quit'" twitch.tv/dota2ti high
    sleep 30
done
