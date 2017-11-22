---
title: Customizr x Squircle theme
id: 5052
categories:
  - Development
date: 2013-06-24 12:39:23
tags:
---


The icons on iOS 7 Home screen are neither square nor rounded square, It is  [Squircle](http://en.wikipedia.org/wiki/Squircle "Squircle").
Below is the formulae for the squircle from [cocoanetics](http://www.cocoanetics.com/2013/06/ios-7-icon-squircle/ "cocoanetics"),

{% math %}
\left|\frac{x}{60}\right|^5 + \left|\frac{y}{60}\right|^5 = 1
{% endmath %}

I am using [customizr](http://wordpress.org/themes/customizr "customizr") and would like to customize it to render thunbnails in squircle instead of circle or squares. Below css disable to the thumbnail and then add a mask image,
{% codeblock lang:css %}
.round-div {
    left:0px;
    top:0px;
    border: none;
    border-radius: 0px;
    -webkit-border-radius: 0px;
    -webkit-mask-box-image: url(2013/06/ios72.png);
    -webkit-mask-size:100% 100%;
    background: #fafafa;
    width:100%;
    height:100%;
}
{% endcodeblock %}

Below is the mask image,
![ios72](ios72.png)

Apply below css to fix the width and height,
{% codeblock lang:css %}
.thumb-wrapper {
  height: 250px;
  width: 269px;
}
.thumb-wrapper img {
  height: 250px;
  max-width: 269px;
}
{% endcodeblock %}

Apply below css to remove spaces,

{% codeblock lang:css %}
@media (max-width: 480px) {
  .carousel-control {
    top:20%;
  }
  .carousel .item {
    line-height:normal;
    min-height:110px;
  }
}
@media (max-width: 767px) and (min-width: 480px) {
  .carousel .item {
    line-height:normal;
    min-height:180px;
  }
}
@media (max-width: 979px) and (min-width:767px) {
  .span4 {
    width:269px;
  }
  .carousel .item {
    line-height:normal;
    min-height:240px;
  }
}
@media (max-width: 1200px) and (min-width:979px) {
  .carousel .item {
    line-height:normal;
    min-height:256px;
  }
}
@media (min-width: 1200px) {
  .carousel .item {
    line-height:normal;
    min-height:400px;
  }
}
{% endcodeblock %}

Additional css that is not related to squircle but for my blog,

{% codeblock lang:css %}
li.recentcomments {
  text-align:left;
}
{% endcodeblock %}

**Attention: The above doesn't support  Internet Explorer and Firefox**
