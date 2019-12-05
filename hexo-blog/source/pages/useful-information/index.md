---
title: Useful Information
id: 2148
comments: false
date: 2008-07-04 14:03:05
---

@[toc]

## About
This page contains useful information to me. It also serve as a testing page for this blog.

## Design
* [We love icon fonts](http://weloveiconfonts.com/)
* [Icon size for Apple](http://developer.apple.com/library/ios/qa/qa2010/qa1686.html)

## Software Development

### Architecture
* [Microsoft Azure Architecture Center](https://docs.microsoft.com/en-us/azure/architecture/)

### Software Design
* [SOLID Principles in Action: From Slack to Twilio](https://www.twilio.com/blog/2017/11/solid-principles-slack-twilio.html)

### Mobile
* [Mobile app icon generator](https://www.npmjs.com/package/mobicon-cli)

### Security
* [Instrumentation tookit](https://www.frida.re/)

### iOS
Icons information for iPhone and iPad, including App Store, Home screen, iTunes, spotlight, etc., http://developer.apple.com/library/ios/qa/qa2010/qa1686.html

### Android
* [Interactive Diagrams of Rx Observables](http://rxmarbles.com/)
* [Retrofit](http://square.github.io/retrofit/)
* [Moshi - a modern JSON library for Android and Java](https://github.com/square/moshi)

### Language

#### ASP.Net
* [ASP.NET string.Format (Chinese)](aspnet-string-format.html)

### Miscellaneous
* [High Performance Browser Networking](https://hpbn.co/)
* [asciinema](https://asciinema.org)
* [Creating an Alpine Linux package](https://wiki.alpinelinux.org/wiki/Creating_an_Alpine_package)

### Docker images
* [Web-based management](https://github.com/portainer/portainer)

### Internet, Mobile and Computer Security

* [Nessus](https://www.nessus.org/)
* [OWASP](https://www.owasp.org/)
* [SANS](https://www.sans.org)
* [Snort (IDS)](https://www.snort.org)

## Frequently Used Commands
* Shutdown Windows immediately ```shutdown -r -t 0```, useful when you remote to a Windows PC
* Switch java version
{% codeblock %}export JAVA_HOME=`/usr/libexec/java_home -v 1.8`{% endcodeblock %}

### Git
* Deleting a remote branch ```git push [remote] --delete [branch]``` e.g., ```git push origin --delete feature/branch```
* Sync remote branch and delete remote non-existing local copy ```git fetch --prune```
* List the commit different between branches ```git rev-list [branch]...[another branch]```
* List the commit different between branches with arrow indicates which branch owns the commit ```git rev-list --left-right [branch]...[another branch]```
* List the commit of a branch is ahead/behind to a remote branch ```git rev-list [branch]...[remote]/[another branch]```
* Show the number of ahead of behind between branches ```git rev-list --left-right count [branch]...[another branch]```

## Learning

* [CodeSchool](https://www.codeschool.com)
* [CodeFight](https://codefights.com/)
* [HackerRank](https://www.hackerrank.com)
* [CodeCombat](https://codecombat.com)
* [CodinGame](https://www.codingame.com)
* [Learn Git Branching](https://learngitbranching.js.org/)
* [Learn Kubernetes using Interactive Browser-Based Scenarios](https://www.katacoda.com/courses/kubernetes)

## Tech

### Mac
* [Change Java version on MacOS] http://www.guigarage.com/2013/02/change-java-version-on-mac-os/
