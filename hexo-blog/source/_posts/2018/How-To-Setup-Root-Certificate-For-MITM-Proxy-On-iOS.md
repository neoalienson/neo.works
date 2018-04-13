---
title: How To Setup Root Certificate For MITM Proxy On iOS
date: 2018-03-28 09:35:46
tags:
  - iPhone
  - iOS
  - Test Automation
categories:
  - Hack
  - Development
---

{% raw %}
<style type="text/css">
img {
  width: 50%
}
</style>
{% endraw %}

Trusting root certificate for debugging proxy such as browsermob-proxy for iOS is pretty strict forward. You can download the certificate from
![ca-certificate-rsa.cer](https://github.com/lightbody/browsermob-proxy/blob/master/browsermob-core/src/main/resources/sslSupport/ca-certificate-rsa.cer) on Device's Safari. You can also drag the file into the Simulator.

1. Tap on Allow to install the cert
![](setup_cert_ios_01.png)

2. Tap `Install` on the upper right
![](setup_cert_ios_02.png)

3. Again, tap `Install` on the upper right
![](setup_cert_ios_03.png)

4. `Install`
![](setup_cert_ios_04.png)

5. Once verified, tap on `Done`. The certificate is installed
![](setup_cert_ios_05.png)

6. To trust the certificate as Root Certificate, goto `About` in `General`
![](setup_cert_ios_06.png)

7. Scoll down untill you see `Certificate Trust Settings`
![](setup_cert_ios_07.png)

8. Toggle on the `LittleProxy MITM` to trust it
![](setup_cert_ios_08.png)

9. Tap `Continue` to trust it as Root Certificate
![](setup_cert_ios_09.png)

10. Done. Now all traffic can be intercepted by the proxy without any complain
![](setup_cert_ios_10.png)
