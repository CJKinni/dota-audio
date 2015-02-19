while :
  do
    livestreamer -a "-I 'dummy' {filename} --sout '#transcode{{vcodec=dummy,acodec=vorb,ab=48,channels=1}}:std{{access=shout,mux=ogg,dst=source:PASSWORD@dotaaudio.com:8000/DotaMultiOgg}}' 'vlc://quit'" twitch.tv/dota2ti worst
done
