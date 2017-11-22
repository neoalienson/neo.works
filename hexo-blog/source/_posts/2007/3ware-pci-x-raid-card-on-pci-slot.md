---
title: 3ware PCI-X RAID card on PCI slot
tags:
  - hardware
id: 1746
categories:
  - Misc
date: 2007-07-25 10:19:09
---

<span id="_ctl0_ArticleRepeater__ctl1_ArticleText">

3ware 7000, 8000, and 9500S series controllers are 64-bit controllers (except the 7210/7006-2) and work in:

-32-bit slots (the 64-bit part of the connector on the controller just hangs over the back edge of the slot)
-64-bit slots
-PCI slots (both 5 volt and 3.3 volt, 33 MHz and 66 MHz)
-PCI-X slots (all speeds)

The **9550SX series controller is a 64-bit PCI-X controller**.  It will work in:

-32-bit slots (**only if the 32-bit is 3.3 volt** only, which is not common;  dual 5 &amp; 3.3 volt 32-bit slots are not supported)
-64-bit slots
-PCI-X slots (all speeds)
</span>