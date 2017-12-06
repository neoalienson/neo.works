---
title: Mark Six master on Linux/Mac
tags:
  - python
  - ShellScript
id: 7307
categories:
  - Development
date: 2017-07-18 12:34:58
---

![](https://neo.works/wp-content/uploads/2017/07/Mark_six_ticket_front-300x248.jpg)Mark Six is a lottery in Hong Kong. You can pick 6 numbers from 49 numbers in the lottery ticket. There are many single line command to generate 6 numbers from 1 to 49,

jot on Mac
{% codeblock lang:bash %}
jot -r -s ' ' 6 1 49 | tr ' ' '\n'
{% endcodeblock %}
</pre>

python 2
{% codeblock lang:bash %}
python -c 'import random; print [ random.randint(1,49) for _ in xrange(6)]'
{% endcodeblock %}

awk
<pre>
{% codeblock lang:bash %}
awk -v min=1 -v max=49 'BEGIN{ srand(); for (i = 0; i < 6; i++)  print int(min+rand()*(max-min+1))}'
{% endcodeblock %}

bash
{% codeblock lang:bash %}
for i in {1..6}; do echo $(( ( RANDOM % 49 ) + 1)); done
{% endcodeblock %}

However, you will soon find repeated numbers are generated from the above solutions. The trick to have non-repeated generated is using random sort from an array with 49 numbers,

jot on Mac
{% codeblock lang:bash %}
jot 49 1 49 | gsort --random-sort | head -n 6
{% endcodeblock %}

python 2
{% codeblock lang:bash %}
python -c 'import random; a = range(1, 49); random.shuffle(a); print a[:6:]'
{% endcodeblock %}
