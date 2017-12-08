---
title: Gsource on Mac
date: 2017-12-08 15:01:24
tags:
  - Visualization
  - Mac
category:
  - Development
---

It is often difficult to tell how hard developers are working to non-IT folks. Usually I try to let them watch [gsource](http://gource.io/).

![gsource sample](gsource.png)

Setting up gsource on Mac is not difficult but it has several steps. First, you have to have brew installed. Then, run below commands from Terminal,

{% codeblock lang:shell %}
# install wget if you don't have
brew install wget

# gsource dependency
brew install glew
brew install pkg-config
brew install sdl2
brew install sdl2_image
brew install boost
brew install glm
brew install pcre

# download and build gsource
wget https://github.com/acaudwell/Gource/releases/download/gource-0.47/gource-0.47.tar.gz
tar vfxz gource-0.47.tar.gz
cd gource-0.47
./configure

# assume no error from configure
make install
{% endcodeblock %}

The binary will install into /usr/local/bin/gsource . Run below to generate the video from directory with git repository
{% codeblock lang:shell %}
cd [your git repository]
/usr/local/bin/gource
{% endcodeblock %}

You can replace the default icon with yours by renaming your avatar to the git author name such as "Your Name.png" as in the git log, place it local director and run below gource command
{% codeblock lang:shell %}
/usr/local/bin/gource --user-image-dir .
{% endcodeblock %}

If you feel the video is too long, you can adjust speed by changing simulation time scale (default: 1.0) `-c or --time- or scale SCALE`.

You can make your video less messy by reducing the maxnium number of file from unlimited to value such as 100 with `--max-files NUMBER`

Adding elasticity is fun with `-e 0.5` when there is a large number of files are adding or deleting.

More information can be found in [Control](https://github.com/acaudwell/Gource/wiki/Controls)

The video can output to a file with option `-o FILENAME`. The file size can be over 10GB for 1 minute video so beware.

After the video generates, you can use libav to convert to mp4,
{% codeblock lang:shell %}
brew install libav
avconv -vcodec ppm -f image2pipe -i gource.ppm -c:v libx265 -c:a copy gource.mkv
{% endcodeblock %}
Gource of my blog,
{% youtube iZiZ4CaDkcM %}
