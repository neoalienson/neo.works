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
/usr/local/bin/gsource
{% endcodeblock %}
