while :
  do
    livestreamer -a "-I 'dummy' {filename} --sout '#transcode{{vcodec=dummy,acodec=vorb,ab=48,channels=1}}:duplicate{{dst=std{{access=shout,mux=ogg,dst=source:PASSWORD@dotaaudio.com:8000/DotaStream4.ogg}}}}' 'vlc://quit'" twitch.tv/dota2ti_4 worst
done
