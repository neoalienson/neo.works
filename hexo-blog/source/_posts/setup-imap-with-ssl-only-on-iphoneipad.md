---
title: Setup IMAP with SSL-only on iPhone/iPad
tags:
  - iOS
id: 7074
categories:
  - Misc
date: 2016-06-08 03:28:57
---

You cannot setup IMAP on iPhone/iPad (iOS devices) with a server that only provides IMAP SSL (port 993). iOS detects the existence of IMAP by using non-SSL IMAP port, which is port 143\. Here is the trick that helps you to set it up.

First, and most import, you have to disable any possible Internet connection. The easiest way is switch to airplane mode.&nbsp;

![imaps-ios01](imaps-ios01.png)
* * *

Go to **Settings**, tap on **Mail, Contacts, Calendars**
![imaps-ios02](imaps-ios02.png)
* * *

Tap on **Add Account**
![imaps-ios03](imaps-ios03.png)
* * *

Tap on **Other**
![imaps-ios04](imaps-ios04.png)
* * *

Enter basic information and tap **Next**
![imaps-ios06](imaps-ios06.png)
* * *

It would ask for you incoming and outgoing mail server. Fill in the server information. Tap **Next**.
![imaps-ios08](imaps-ios08.png)
* * *

It prompts for network connectivity. Tap **OK** to ignore it.
![imaps-ios09](imaps-ios09.png)
* * *

Tap **Next** again. This time you can **Save**.
![imaps-ios10](imaps-ios10.png)
* * *

**Save** again.
![imaps-ios11](imaps-ios11.png)
* * *

Tap on the newly create account.
![imaps-ios12](imaps-ios12.png)
* * *

Tap on **Advanced**.
![imaps-ios14](imaps-ios14.png)
* * *

Enable **Use SSL**.
![imaps-ios15](imaps-ios15.png)
* * *

Tap **Account** on top left to save changes and back to previous screen.
![imaps-ios16](imaps-ios16.png)
* * *

Remember to switch back to normal mode from airplane mode before testing your email settings.

![imaps-ios17](imaps-ios17.png)
