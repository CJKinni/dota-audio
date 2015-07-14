
### An Introduction

I love little projects that push me to try something unfamiliar.  It's taken me years to understand the right scope for a small project -- I frequently try to do too little or too much, but that's a post of its own.  These projects can be anything from building an App, to a Game, to concocting some Sour Dough Starter.  Today I'd like to reflect on a project I worked on during July, 2014 -- [DotaAudio][DA].

This Summer, I began my descent into [DotA][DOTA] -- a five on five competitive strategy game for the PC and Mac.  In July, DotA had a tournament with the single largest prize pool in competitive gaming -- over ten million dollars.  The tournament was called 'The International 4,' and was watched by millions of viewers, mainly through Twitch.tv, YouTube Live, and ESPN3.

In the days before the tournament, I saw a number of posters complaining about the lack of an audio only stream for individuals on mobile devices, or people with low bandwidth.  I investigated, and learned that Twitch.tv's iOS app included an audio-only option, but no such option existed for the Android app.  With two days to make something happen, I decided to try and set up a way for people to listen to all the action.

### The Preparation

In 2001 or 2002, I'd experimented with the idea of creating an online radio station.  I had spare linux computers, and had installed a Shoutcast Server on it.  I didn't have the sticktoitiveness to actually produce content, and left the project in shambles -- many of my projects are left in my always-growing 'development' folder, a graveyard for failed experiments.

Ten years later, that experience pointed me in a reasonable direction.  I remembered there was Shoutcast, Icecast, and a variety of other solutions.  I also knew of some active online radio stations like [Alpha Geek Radio][AGR].  I looked around at all of those options, and it seemed like Icecast 2 would be my best bet for a reliable server.

I also considered subscribing to [mixlr][MIXLR], a paid service that provided an easy way to broadcast voice and music tracks to its users and the public.  This option seemed like a good last resort, but I knew I'd learn far less.  I kept mixlr in my back pocket.

With Icecast2 as a place to host audio, and mixlr as a backup, all I needed was a way for someone to find the server.   I chose to host with a free [heroku][HEROKU] dyno.  Heroku offers a single web server, and with a bit of difficulty, I set up a static site which linked to the IceCast server.

### The Problems

I had a single audio track up in no time.  The problem:  There were actually four different events going on at once, and I didn't want to have four different computers listening to them all.  At this point, I was actually having a computer open the stream in a browser, and pipe that audio back out to my IceCast Server.  This was far from ideal.

I also soon found out that some Android devices are unable to play mp3 from the browser and require an alternative codec.  I quickly set up a second stream from the computer, which sent an ogg vorbis stream to the server.

At one point, I had two streams going with two of the computers in my apartment, and I realized I needed a better solution.  I needed to capture Twitch.TV's audio and redirect it to IceCast.

Twitch recently changed the way they output audio, using HLS, making the process slightly more challenging -- a few months earlier, a handful of command line tools could have captured the audio for me.  Over four iterations on the first night of the competition, I came up with the following code for mp3 output:

     while :
      do
        livestreamer -a "-I 'dummy' {filename} --sout-shout-mp3 --sout '#transcode{{vcodec=dummy,acodec=mp3,ab=32,channels=1}}:std{{access=shout,mux=raw,dst=source:PASSWORD@dotaaudio.com:8000/DotaPod1Mp3}}' 'vlc://quit'" twitch.tv/dota2ti_pod_1 worst
      sleep 30
    done

And for ogg:

    while :
      do
        livestreamer -a "-I 'dummy' {filename} --sout '#transcode{{vcodec=dummy,acodec=vorb,ab=48,channels=1}}:std{{access=shout,mux=ogg,dst=source:PASSWORD@dotaaudio.com:8000/DotaPod1Ogg}}' 'vlc://quit'" twitch.tv/dota2ti_pod_1 worst
        sleep 30
    done

I had a series of these scripts, each in their own file, all called by a master script:

      pkill -f stream
      pkill -f vlc
      sleep 5
      sh streammultiogg-0.4.sh &
      sh streammultimp3-0.4.sh &
      sh streamhqmp3-0.4.sh &
      sh streamhqogg-0.4.sh &
      sh streamnoobmp3-0.4.sh &
      sh streamnoobogg-0.4.sh &


This allowed me to send every stream out to the server, without too much effort.  Still, it was far from optimal.  I was essentially doubling the incoming bandwidth unnecessarily.  But I was far below any bandwidth caps, and I ran out of time optimizing.

### Success

The site went over better than I could have expected.  At least 13,500 people visited the site, with demand topping out at 1,000 concurrent listeners during the grand finals.  The Heroku instance had no problem managing the load, and the $20 [DigitalOcean](https://www.digitalocean.com/) VPS handled the stress of 1,000 listners without hitting 50% cpu usage as well. (This was by far my biggest concern.)

I learnt a lot this July.  I learned a lot about the terminal, and VLC's transcoding options.  I found out that IceCast can handle streaming quite a bit -- especially for a program which seems to have seen no significant improvements in years.  Finally,  I remembered that when you do something nice for people, they do appreciate it.  I didn't make any money, but most of the costs -- the domain name, and hosting -- were paid for by a few generous donors.  I also received a great deal of thanks, which was awesome.

[DA]: http://www.dotaaudio.com
[DOTA]: http://www.dota.com
[AGR]: http://www.alphageekradio.com/
[MIXLR]: http://mixlr.com/
[HEROKU]: http://www.heroku.com/
