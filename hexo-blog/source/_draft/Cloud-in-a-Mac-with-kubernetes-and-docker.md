---
title: Cloud in a Mac with kubernetes and docker
date: 2017-12-08 09:49:42
tags:
  - Docker
  - Cloud
category:
  - Development
---

https://github.com/portainer/portainer
https://github.com/Mirantis/kubeadm-dind-cluster

{% codeblock lang=shell %}
brew install wget
brew install md5sha1sum
chmod u+x dind-cluster-v1.8.sh
./dind-cluster-v1.8.sh up
{% endcodeblock %}
