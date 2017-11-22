---
title: CLLocationManager tutorial and troubleshooting
tags:
  - iOS
  - Swift
id: 7010
categories:
  - Development
date: 2016-02-28 10:24:53
---

Many developers complain Mobile application development is more difficult than web application development. They try to follow tutorials online precisely but the mobile application still doesn't work. This is because mobile platforms evolve rapidly and tutorials just can't keep up-to-date.

My friend had the above situation and failed to get any location update from the location manager. He added CoreLocation.framework library to Link Binary,

![CLLocationSample1](CLLocationSample1.png)

![CLLocationSample2](CLLocationSample2.png)

Then, he put below code and sounds right.

{% gist 18ab0cc09e57cc2a4e6b AppDelegate.swift %}



However, nothing comes out to the console. This is because starting from add NSLocationAlwaysUsageDescription orNSLocationWhenInUseUsageDescription starting from iOS 8, depending on requestAlwaysAuthorization (for background location) or requestWhenInUseAuthorization (location only when foreground).

![CLLocationSample3](CLLocationSample3.png)

![CLLocationSample4](CLLocationSample4.png)

Let's start to build and run the App. You should see below alert if you start it the first time.

![CLLocaationManager5](CLLocaationManager5.png)

You should get an update after tapped Allow. You many need to adjust location if you are running Simulator by choosing a location from Debug -&gt; Location.

I have upload the project to [https://github.com/neoalienson/CLLoacationManagerSample](https://github.com/neoalienson/CLLoacationManagerSample)

Good luck and hope this tutorial is not outdated very soon!

&nbsp;
