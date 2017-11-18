---
title: Setting up HTTP/2 with Apache and PHP on Debian 8
id: 7036
categories:
  - Development
date: 2016-03-15 20:07:24
tags:
thumbnail: 2016/03/http2-apache-php-debian-8/http2.png
---

My blog has been migrated to a new Debian Virtual Private Server (VPS) . I was trying to enable SPDY on my new server but support from Google for Apache is kind of broken. Latest Chrome browser support SPDY 3.1 only but Google only provides SPDY 3.0 to Apache module. I decide to skip SPDY and setup HTTP/2, as more major browsers are adopting HTTP/2.

&nbsp;

* * *

&nbsp;

&nbsp;

## HTTP/1.1 makes multiple new connections

Before HTTP/2, let's have a brief idea how slow HTTP/1.1 is,

[![http1.1-1](https://neo.works/wp-content/uploads/2016/03/http1.1-1-300x175.png)](https://neo.works/wp-content/uploads/2016/03/http1.1-1.png)

As you can see from above chart, 21 new connections are trying to connect to the HTTP server simultaneously after the first request. Grey line in timelines represents time wasted on connecting to the server. My poor server can only serve 5 (first 3, 7th and 8th) immediately. Overall, the client has to wait for 0.5-1s to start downloading content and reach the red goal line, which means the page is ready for rendering.

&nbsp;

* * *

##

## HTTP/2 multiplex from original connection

Below is HTTP/2\. No more grey! This is because the HTTP/2 keeps one single connection (multiplexing) and no time is waste on handshaking connections.
[![http2-1](https://neo.works/wp-content/uploads/2016/03/http2-1-300x179.png)](https://neo.works/wp-content/uploads/2016/03/http2-1.png)

There are many more benefits from HTTP/2\. Feel free to explore!

&nbsp;

* * *

##

## Setup

To setup HTTP/2 on Apache with PHP5 on Debian 8, I have to use Apache 2.4.18 from testing channel as the version include mod_http2\. Meanwhile, mod_fcgid is used but no NPN is required. Lastly, SSL is required for HTTP/2.

&nbsp;

**Create /etc/apt/sources.list.d/testing.list**
<pre lang="bash">deb     http://mirror.steadfast.net/debian/ testing main contrib non-free
deb-src http://mirror.steadfast.net/debian/ testing main contrib non-free
deb     http://ftp.us.debian.org/debian/    testing main contrib non-free
deb-src http://ftp.us.debian.org/debian/    testing main contrib non-free
</pre>
&nbsp;

**Create /etc/apt/preferences.d/testing.pref**
<pre lang="bash">Package: *
Pin: release a=testing
Pin-Priority: 750
</pre>
&nbsp;

**Add below to site config file**
<pre lang="bash"><Location />
AddHandler fcgid-script .php
Options +ExecCGI
FcgidWrapper /usr/bin/php-cgi .php
</Location>
</pre>
&nbsp;

**Run below commands**
<pre lang="bash"># install Apache 2.4.18 from testing channel instead of 2.4.10 from stable
sudo apt-get install apache2/testing apache2-data/testing apache2-bin/testing libnghttp2-14 libssl1.0.2  apache2-mpm-worker/testing
# fcgid
sudo apt-get libapache2-mod-fcgid
# PHP from testing channel
sudo apt-get install php-getid3/testing php-common/testing libphp-phpmailer/testing

sudo a2enmod mpm_prefork
sudo a2enmod fcgid
sudo a2dismod php5

# finally it setup
sudo apache2ctl restart
</pre>

* * *

&nbsp;

## Showing active HTTP/2 session

Open chrome://net-internals/#events&amp;q=type:HTTP2_SESSION%20is:active from Chrome. You should see your site listed as below screen if you have set it up successfully,

![http2-result](https://neo.works/wp-content/uploads/2016/03/http2-result-300x176.png)

There are many tutorials about setting up SPDY would suggest to choose SPDY from the drop down. SPDY has been removed from the recent version of Chrome.

* * *

&nbsp;

## About the VPS

I have been using Openshift.com for free for years. However, I have to switch to another service from Openshift because the free account doesn't support CA signed SSL. Paid user can add CA signed SSL to their website, I do not mind to pay but they do not accept payment from Hong Kong. SSL is getting more important in search engine ranking, and it is required for an advanced protocol such as SPDY that can improve page loading performance. I choose VPS from hostmada.com for USD 24 a year at the end.

_Enjoy!_
