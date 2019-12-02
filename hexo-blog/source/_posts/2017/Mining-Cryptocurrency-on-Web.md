---
title: Mining Cryptocurrency on Web
date: 2017-12-22 11:49:28
tags:
  - Blockchain
  - Cryptocurrency
category:
  - Misc
---

<link rel="stylesheet" href="/libs/mdl/material.min.css" />
<link rel="stylesheet" href="/libs/mdl/material.font.css" />
<script src="/libs/mdl/material.min.js"></script>

![](cryptocurrency.png)

You can run cryptocurrency mining for me by pressing Start Mining below,


{% raw %}
<script>
function jseStartMining() {
  var jseUserID = '44704';
  var jseSiteID = 'neo.works';
  var jseSubID = '0';
  var e=document,t=e.createElement("script"),s=e.getElementsByTagName("script")[0];
  t.type="text/javascript",t.async=t.defer=!0,t.src="https://load.jsecoin.com/load/"+jseUserID+"/"+jseSiteID+"/"+jseSubID+"/0/",s.parentNode.insertBefore(t,s);
  document.getElementById('jseButtonText').innerHTML = 'Mining Started';
}
</script>
<button onclick="jseStartMining();" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"><span id="jseButtonText">Start Mining</span></button>
{% endraw %}

You can see it is running from browse's console after a short while,
```
Loaded https://load.jsecoin.com:443/socket.io/socket.io.js
0:1:3586
JSE Socket Connected!
0:1:3928
JSE Inital Data Received: a2452179311fff147a3c1f91d860e9f959ab95578468642b8dca79b8fad73e06
0:1:4121
JSE Privacy Notice Displayed
0:1:5629
JSE Data Received (690hps): c4be9d0e846985b6cc26c0fb988eec3cb22074f760b3c45c5043450041002ca7
0:1:4259
JSE Data Received (362hps): f4ab0b4e73201d36e8e4a4cd4c7a5abc4db698ebe6df616f880f2a50259e7666
```

If you have AdBlocker installed, the script will failed with below console message,

```
net::ERR_BLOCKED_BY_CLIENT
```

You can also join [JSECoin](https://platform.jsecoin.com/?lander=1&utm_source=referral&utm_campaign=aff44704&utm_content=). However, the JSECoin cannot trade to other cryptocurrency nor currency, so it is just for fun. Imagine whoever visit this page will run the mining for me!

Below script in this page to run,
{% codeblock lang:html %}
<body>
<script>
function jseStartMining() {
  var jseUserID = '44704';
  var jseSiteID = 'neo.works';
  var jseSubID = '0';
  var e=document,t=e.createElement("script"),s=e.getElementsByTagName("script")[0];
  t.type="text/javascript",t.async=t.defer=!0,t.src="https://load.jsecoin.com/load/"+jseUserID+"/"+jseSiteID+"/"+jseSubID+"/0/",s.parentNode.insertBefore(t,s);
  document.getElementById('jseButtonText').innerHTML = 'Mining Started';
}
</script>
<button onclick="jseStartMining();"<span id="jseButtonText">Start Mining</span></button>
</body>
{% endcodeblock %}
