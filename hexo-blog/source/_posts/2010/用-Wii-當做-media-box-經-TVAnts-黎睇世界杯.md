---
title: 用 Wii 當做 media box 經 TVAnts 黎睇世界杯
date: 2010-06-18 22:18:00
tags:
category:
  - Misc
---
今日教大家做既係 用 Wii 喺電視度睇世界杯
* home brew channel 既 Wii 一部
* SD卡一張 (用 SD card adapter  既卡亦可)
* Wii 既 media player WiiMC http://www.wiimc.org (已測試版本為 1.04) 一個
* 裝有 TVAnts 既 PC 一部
* Wireless router 一個

1. 先喺 TVAnts 入面既 Tool -> Settings...->Broadcast->Enable access from other computers 度 tick 左佢
![](wc-13.png)

2.設定 WiiMC。首先下載 WiiMC 1.0.4 (New Install) 既 zip file，然後將zip file 爆開佢去 SD卡既根相錄度。將 SD卡入面既 `appwiimconlinemedial.xml` 用 text editor 打開修改，喺 <file app="WiiMC" version="1.0.0"> 下面加入依一行:
<link name="TVAnts" addr="http://192.168.1.123:16900/1.asf" />

上面段野有兩部分要修改
1. 192.168.1.123 係行緊 TVAnts 部機既 IP
 **注意:  每部機既設定唔一樣，所以未必係依個 IP address**
 可以用 ipconfig 搵返
2. 1.asf 有可能係其他數字，要搵返行緊乜數字，可以 right click tvants 個 player，然後選內容:
![](wc-11.png)
咁就知到個 asf 係乜號碼:
![](wc-12.png)

因為時間既關係，下面係修改完既結果:
{% codeblock lang:xml %}
<pre lang="xml">
  <?xml version="1.0" encoding="utf-8" ?>
  <file app="WiiMC" version="1.0.0">
    <link name="TVAnts" addr="http://192.168.1.123:16900/1.asf" />
    <link name="Navi-Xtreme Media Portal" addr="http://navix.turner3d.net/wiilist/" />
    <folder name="Radio">\n  <link name="Radio Plus" addr="http://radioplus.dnsalias.org:8000/listen.pls" />
      <link name="Otvoreni radio" addr="http://82.193.201.234:8001/listen.pls" />
      <link name="Woxy radio" addr="http://woxy.lala.com/stream/aac32.pls" />
    </folder>
    <folder name="SHOUTcast">\n  <link name="Internet Radio" addr="http://pentium.extremscorner.co.cc:8080/wii/rd/playlist.php" />
      <link name="Internet TV" addr="http://pentium.extremscorner.co.cc:8080/wii/tv/playlist.php" />
    </folder>
  </file>
</pre>
{% endcodeblock %}

3. 炒埋一碟之後就可以將 SD 卡插返去部 Wii 度然後行個 WiiMC。

如果成功既話就可以喺 Online Media 度見到 TVAnts 依個 item:
![成功畫面](IMG_0286.jpg)

click 左 buffer 好快完成之後就可以睇波，放喺部 42" LCDTV 度睇廣東體育台效果唔錯
 攪到我而家好少喺 PC 度睇:

 ![](IMG_0292.jpg)
