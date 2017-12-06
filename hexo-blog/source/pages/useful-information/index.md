---
title: Useful Information
id: 2148
comments: false
date: 2008-07-04 14:03:05
---

@[toc]

## About
This page contains useful information to me. It also serve as a testing page for this blog.

## Blogging
* [Hexo Docs](https://hexo.io/docs)
* [List of XML and HTML character entity references on Wikipedia](https://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references)

### Frequently used Emoji
|                         |                                |        |
| ----------------------- | ------------------------------ | ------ |
| :smile: ````:smile:```` | :blush: ````:blush:```` | :heart_eyes: ````:heart_eyes:```` |
| :sweat: ````:sweat:```` | :thumbsup: ````:thumbsup:```` | :yum: ````:yum:```` |
| :cold_sweat: ````:cold_sweat:```` | :scream: ````:scream:```` | :sob: ````:sob:```` |
| :stuck_out_tongue_winking_eye: ````:stuck_out_tongue_winking_eye:```` | :kissing: ````:kissing:```` | :sleepy: ````:sleepy:```` |
| :poop: ````:poop:````   | :v: ````:v:```` | :100: ````:100:```` |
| :see_no_evil: ````:see_no_evil:```` | :hear_no_evil: ````:hear_no_evil:```` | :speak_no_evil: ````:speak_no_evil:```` |
| :kiss: ````:kiss:````   | :skull: ````:skull:```` | :droplet: ````:droplet:```` |
| :fireworks: ````:fireworks:```` | :loudspeaker: ````:loudspeaker:```` |
| :no_entry_sign: ````:no_entry_sign:```` | :white_check_mark: ````:white_check_mark:```` | :x: ````:x:```` |
| :secret: ````:secret:```` | :interrobang: ````:interrobang:```` | :bangbang: ````:bangbang:```` |

and more from [Emoji Cheatsheet](https://www.webpagefx.com/tools/emoji-cheat-sheet/)

### Markdown (with Markdown plus)
* sub `H~2~0` H~2~0
* sup `x^2^` x^2^
* `++Inserted++` ++Inserted++ (disabled)
* `~~Del~~` ~~Del~~
* Footnote ```[^1]``` for the mark, ```[^1]:``` for the note
* em `*em*` *em*
* strong `**strong**` **strong**
* Use {% raw %}{% raw %}{% endraw %}{% endraw %} if the markdown cause you trouble on {% raw %}{{}} or {%%}{% endraw %}
* {% raw %}{% kbd Control %}{% endraw %} (remove space) {% kbd Control %}
* {% raw %}{% kbd Command %}{% endraw %}  {% kbd Command %}
* {% raw %}{% kbd Shift %}{% endraw %} {% kbd Shift %}

### Github Card
e.g., {% githubCard user:neoalienson repo:pachinko %}
{% raw %}
{% githubCard user:neoalienson repo:pachinko %}
{% endraw %}

### Flowchart

Plugin: [hexo-filter-flowchart](https://github.com/bubkoo/hexo-filter-flowchart)
Syntax: [flowchart.js](http://flowchart.js.org/)

Below is the sample flowchart definition and output diagram,

{% codeblock %}
flowchart
st=>start: Start|past:>http://www.google.com[blank]
e=>end: End:>http://www.google.com
op1=>operation: My Operation|past
op2=>operation: Stuff|current
sub1=>subroutine: My Subroutine|invalid
cond=>condition: Yes
or No?|approved:>http://www.google.com
c2=>condition: Good idea|rejected
io=>inputoutput: catch something...|request

st->op1(right)->cond
cond(yes, right)->c2
cond(no)->sub1(left)->op1
c2(yes)->io->e
c2(no)->op2->e
{% endcodeblock %}

```flow
st=>start: Start|past:>http://www.google.com[blank]
e=>end: End:>http://www.google.com
op1=>operation: My Operation|past
op2=>operation: Stuff|current
sub1=>subroutine: My Subroutine|invalid
cond=>condition: Yes
or No?|approved:>http://www.google.com
c2=>condition: Good idea|rejected
io=>inputoutput: catch something...|request

st->op1(right)->cond
cond(yes, right)->c2
cond(no)->sub1(left)->op1
c2(yes)->io->e
c2(no)->op2->e
```

### Sequence diagram
Plugin used: [hexo-filter-sequence](https://github.com/bubkoo/hexo-filter-sequence)

{% codeblock %}
sequence
Alice->Bob: Hello Bob, how are you?
Note right of Bob: Bob thinks
Bob-->Alice: I am good thanks!
{% endcodeblock %}

```sequence
Alice->Bob: Hello Bob, how are you?
Note right of Bob: Bob thinks
Bob-->Alice: I am good thanks!
```

## Design
* [Font Awesome](http://fontawesome.io/icons/#brand)
* [Icon size for Apple](http://developer.apple.com/library/ios/qa/qa2010/qa1686.html)

## Develop

### Architecture
* [Microsoft Azure Architecture Center](https://docs.microsoft.com/en-us/azure/architecture/)

### Software Design
* [SOLID Principles in Action: From Slack to Twilio](https://www.twilio.com/blog/2017/11/solid-principles-slack-twilio.html)

### iOS
Icons information for iPhone and iPad, including App Store, Home screen, iTunes, spotlight, etc., http://developer.apple.com/library/ios/qa/qa2010/qa1686.html

### Android
* [Interactive Diagrams of Rx Observables](http://rxmarbles.com/)
* [Retrofit](http://square.github.io/retrofit/)
* [Moshi - a modern JSON library for Android and Java](https://github.com/square/moshi)

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

## Learning

* [] (https://www.codeschool.com)

## Tech

### Mac
* [Change Java version on MacOS] http://www.guigarage.com/2013/02/change-java-version-on-mac-os/
