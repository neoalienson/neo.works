---
title: Optimizating Macbook 2010 with SSD
id: 4457
categories:
  - Misc
date: 2011-09-14 11:25:45
tags:
---

![MacBook_white](MacBook_white.png)

After replacing DVD-ROOM with SSD with rack from Taobao, below are the optimization applied,

The first part reduce the unnecessary write,

*   disable atime
*   disable journaling
/Library/LaunchDaemons/com.noatime.root.plist
{% codeblock lang:xml %}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>com.noatime.root</string>
        <key>ProgramArguments</key>
        <array>
            <string>mount</string>
            <string>-uwo</string>
        <string>noatime</string>
            <string>/</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
    </dict>
</plist>
{% endcodeblock %}

*   less sleep
sudo pmset -a hibernatemode 2

Move seldom used files to the original hard disk.

*   /var/log
*   /var/spool
*   ~/Music
*   ~/Movies
*   ~/Library/Application Support/MobileSync (? iDevice ????)
*   /Library/Application Support/GarageBand (1.4GB)

The cost is around HKD 200\. The result is the boot time is shorter compared with my Macbook Air, subjectively.
