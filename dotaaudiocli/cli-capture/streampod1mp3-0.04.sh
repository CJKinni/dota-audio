while :
  do
    livestreamer -a "-I 'dummy' {filename} --sout-shout-mp3 --sout '#transcode{{vcodec=dummy,acodec=mp3,ab=32,channels=1}}:std{{access=shout,mux=raw,dst=source:PASSWORD@dotaaudio.com:8000/DotaPod1Mp3}}' 'vlc://quit'" twitch.tv/dota2ti_pod_1 worst
    sleep 30
done
