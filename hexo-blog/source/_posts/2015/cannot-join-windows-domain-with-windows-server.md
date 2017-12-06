---
title: 'How to solve: Cannot join Windows Domain with Windows Server'
tags:
  - Windows Server
id: 6934
categories:
  - Development
date: 2015-10-19 08:58:06
thumbnail: /thumbnails/windows_server_2012.jpg
---

It happens to me many times. I have the solution and always forget. I have the DNS setup correctly and point it to my domain controller(s). The error message is "Unable to join the domain".

The solution is to disable simply disable IPv6 from the network connection, or update DNS on the IPv6\. It seems DNS for IPv6 has a higher priority than IPv4 on Windows Server 2012.
