---
title: 用p2p 軟件成功睇到免費網上直播南非世界杯
date: 2010-06-12 12:58:46
tags:
---
今年 world cup 因為 PPStream、PPTV、PPLive (都唔知邊個打邊個) 可能因為要搞網上合法直播結果封鎖晒中國以外既用家。就算用以上軟件轉播 CCTV 5 既頻道亦都會被嚴厲封鎖，攪到好多港燦預算係屋企睇波既企晒係度乜都睇唔到。除左裝左有線既用戶之外就只有部分西北區既住戶可以經大陸既 CCTV 高清台訊號黎睇世界杯(依個方法可能要自己搭條天線出屋外，因為大廈天線可能冇 CCTV 高清訊號，另外亦要睇彩數)。

不過天無絕人之路，尋晚一路睇亞視高清台播首場南非對墨西哥，一路試唔同既網上睇波方法。結果試到 TVAnts 最大頻寬大約 1200kbps，直播台灣既ELTA TV頻道，畫質質素介乎高清與標清之間。

![Close-up 夠清](wc2-1.png)

![遠景都清，但係唔知係 capture 得唔好定係唔係 key frame感覺同播緊差好遠]((wc2-1.png))

旁述方面冇大陸既「打門」、「點球」 咁興舊，不過勝在佢地現場聲唔大聲，雖然冇咁好氣氛，但至少冇左好似成場烏蠅飛既號角聲。

用 TVAnts 要注意既係可能開波前或者開緊波d server 都幾繁忙，大家最好開波前幾個鐘開定，如果唔係 channel click more 幾多次都冇用，甚至乎 出 service unavaliable。

## 方法
1. tvants download link: http://tvants.en.softonic.com/
2. 安裝完之後 channel list 可能要改一改，選擇 channel 之後按 Modify， 將 `list.tvants.com` 改成 `list.ccants.com`
 或者就咁將`list.ccants.com` add channel:
 ![](wc-3.png)
3. 然後 channels 度用 audience 數目黎 sort，咁就知邊d 節目多人睇。其中一個就係台灣台:
![](Capture3.png)
如果冇既話可以試下 More。但如果開波前後 server 太忙冇既話就要試多幾次。

用 TVAnts 成功搵到 700kbps 以上既 broadcast 唔難，只要跟佢指示去 channel list 度將類似 tvants 改做 ccants 就可以成功 list 到更多 channels。我估 tvants.com 既擁有權出現問題所以想夾硬轉做 ccants.com。如果nslookup list.tvants.com 既話就會發覺指左去 127.0.0.1，攪到所有用 tvants.com 既人用唔到。如果你係舊官網度 download 版本1.0.0.59就會發現佢成日 lookup list.tvants.com。我估新官網 ccants.com download 唔知點解舊d 既版本 1.0.0.58 可能冇咁既問題。結果我用 host file 將 list.tvants.com lookup 做 list.ccants.com既 IP，唔知對播放有冇幫助，但已經手痕做左無謂再試。

如果對網絡有些少認識，建議 firewall / router nat set 好 port 16800 (或自定義) 既 inbound 同埋 tvants 既 outbond，等其他人都可以分享下，話晒都係 P2P。

見有好多網友都提及 [ATDHE.net](http://www.atdhe.net/index.html) 不過實在太慢，技術上好似佢咁既 flash player 唔係用 p2p 技術冇可能播得順不試也擺。亦有好多網友推介[直播吧](http://www.zhibo8.com/)，不過佢主要係介紹有乜p2p 頻道有得睇 Live World Cup，基本上佢d link 都係去晒 ppstream 等軟件，結果係乜都冇。去到 pptv 有時仲會唔停咁播話段片唔係你嗰區，唔駛指意有得睇。

[MyP2P](http://www.myp2p.eu/favourite.php) 同直播吧一樣，不過勝在世界各地既 p2p broadcast 都有，奈何 sopcast 好多都 offline，不過總好似帶給人無限既希望去試... 亦因為咁我試到 TVAnts 出黎。用 MyP2P 都有d 技巧，用佢個 filter 我可能蠢既關係，足球個 category 入面搵唔到世界杯，結果我去左用佢網站個 search 嚟 search \'World Cup 2010 South Africa\' 先至搵得到。

我仲試過 stream torrent、sopcast、tvuplayer、vpn、proxy，不過有各種問題，遲下有機會再詳述。
