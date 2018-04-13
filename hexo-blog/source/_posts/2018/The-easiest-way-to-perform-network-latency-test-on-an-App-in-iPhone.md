---
title: The easiest way to perform network latency test on an App in iPhone
date: 2018-01-04 17:43:41
tags:
  - iOS
categories:
  - Development
---

Simulating network latency or even poor network is very easy in iOS. You don't need to setup a proxy, router nor a poor network provider. All you have to do is enabling Developer mode using XCode. Then, you can see the **Developer** icon,

![](step1.png)

***

Under Developer, you can see the **Network Link Conditioner**. By default it is *Off*. Tap on the **Network Link Conditioner**,
![](step2.png)

***

There are a number of profile for you to use. You can use **ping** time (round-trip) from you mobile phone to your target backend, subtracting **ping** time from your lab's backend. Tap on **Add a profile...*** to create one
![](step3.png)

***

Let's say the ping time is 900ms, you can set either **Out Delay**, **In Delay** or both.
![](step4.png)

***

Done!

{% raw %}
<style type="text/css">
img {
  width: 50%
}
</style>
{% endraw %}
