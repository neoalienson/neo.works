---
title: 發現 hinet hichannel + TVAnts 睇台灣 ELTA TV Live既世界杯既漏洞
date: 2010-06-15 12:57:59
tags:
category:
  - Misc
---
** 以下資料純粹為個人興趣及學術參考之用，以指出hinet hichannel 封鎖海外 IP 之漏洞，以下不會教授破解辦法，敬希見諒**

之前用開既 TVAnts 上面既台灣台原來係 hinet 既 hichannel，早幾日開始就開始加左 DRM 攪到睇唔到。就算 stream 到一開個 player 就問license 或者花畫面:
![License](wc-9.png)

用 Internet Explorer 去 hinet 既hichannel 就可以經 Media Player 個 active X 得到個 license key。有左個 license key 之後就可以用 Media Player 播 TVAnts 上面台灣台既 stream。不過佢地個主網站部份內容只限台灣以內既 IP 睇。但係互聯網上有台灣既隱身 proxy，所以其他地區既人可以扮來自台灣開到段片黎睇，非常簡單。

用 wireshark capture 左佢地既 link，發覺佢地只係主網站 block 台灣以外既 ip，但其他用黎派 license key 既網站就冇 block 到，所以可以唔經 proxy 直接拎 key。我就整左個 html file 嚟成功試 load 做 DRM  license 依 part 我將會寫得再詳細d，俾住個畫面大家睇下頂住癮:

![](wc-6.png)

仲有佢地個 mms server 都係冇 ip 限制，不過建議香港同星加坡既人唔好用，癈事扯爆左 bandwidth 俾人發覺，故此請大家繼續經 tvants 睇。

不過依排睇開广東体育台多，佢地嗰三個講波佬陣容夠大兼廣東話太個親切，加上好多戰術分析，所以好鐘意睇。如果唔嫌畫面質素差d，依個係一個唔錯既選擇。

![广東体育台](wc-71.png)
