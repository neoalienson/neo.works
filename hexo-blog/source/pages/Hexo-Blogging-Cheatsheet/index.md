---
title: Hexo Blogging Cheatsheet
date: 2017-12-08 09:56:37
comments: true
---

@[toc]

## Useful links
* [Hexo Docs](https://hexo.io/docs)
* [List of XML and HTML character entity references on Wikipedia](https://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references)

## My blog's information
* [IP Country lookup for my domain, only 1 ip is lookuped from the domain](http://www.ip-tracker.org/lookup/domain-country.php?ip=neo.works)
* [Check if my domain is blocked in mainland](http://www.viewdns.info/chinesefirewall/?domain=neo.works)

## Design
* [Font Awesome](http://fontawesome.io/icons/#brand)

## Frequently used Emoji
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

## Markdown (with Markdown plus)
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

## Github Card
e.g., {% githubCard user:neoalienson repo:pachinko %}
{% raw %}
{% githubCard user:neoalienson repo:pachinko %}
{% endraw %}

## Flowchart

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

## Sequence diagram
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
