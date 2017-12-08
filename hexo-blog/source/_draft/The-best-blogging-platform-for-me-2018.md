---
title: The best blogging platform for me 2018
date: 2017-12-02 19:01:23
tags:
categories:
  - Development
---

My blog was host on Hostmada until it closes in mid-2017 suddenly.

* I have my custom domain name

| Platform   | Wordpress     | Wordpress on VPS | AWS S3                 | Firebase         |
| ---------- | ------------- | ---------------- | ---------------------- | ---------------- |
| Provider   | Wordpress.com | Hostus.com       | Amazon                 | Google           |
| Platform   | Dynamic       | Dynamic          | Static wiht Hexo       | Static wiht Hexo |
| Cost (USD) | 2 / month     | 2 / month        | 0.814 [^1] / Free [^2] | Free [^3]        |
| Editor     | Wordpress     | Wordpress        | GitHub                 | GitHub           |

[^1]: USD 0.023 per GB storage / month for most region. Free first 1GB, USD 0.090 for each GB afterward = (USD 0.23 + 9 x 0.09 + 0.004) / month = USD 0.814
[^2]: New AWS customers receive 5 GB of Amazon S3 storage in the Standard Storage class, 20,000 Get Requests, 2,000 Put Requests, and 15 GB of data transfer out each month for one year.
[^3]: 1GB Storage of all versions and 10GB downloads. When you deploy a new version, the old version keeps in Firebase and calculates as part of the storage.

## SaaS vs PaaS vs IaaS
| Feature         | SaaS Wordpress | PaaS Firebase   | Wordpress AWS/VPS |
| SSL Certificate |                | Fully automated |                   |


## Issues with Firebase

* Sometime deployment is very slow and stuck at `i  hosting: preparing public directory for upload...` for 5 minutes
