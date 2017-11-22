---
title: 'Rewriting blocking AJAX (async: false in JQuery)'
tags:
  - jasmine
  - javascript
id: 6805
categories:
  - Development
date: 2014-12-15 22:31:25
---

When I apply jasmine ajax to test a piece of javascript, I was stuck, and found out the cause is no blocking AJAX call supports from jasmine ajax. I do not blame jasmine ajax because I do not think making blocking ajax call make sense at all.

Almost all developer considers AJAX to be an acronym to stand for Asynchronous. However, the world of AJAX could be complicated to some new learner and it is not uncommon to see AJAX call with blocking. Blocking AJAX call is considered to be a poor practice in most circumference on web, mobile and server platforms. The reason is slightly different on platform, but overall javascripts are single-threaded and any blocking call means cease-functioning. Below is an example of JQuery AJAX call with blocking by `async: false` (and another anti-pattern, using global variable),

<pre lang="javascript">
var someGlobal = false;

$.ajax({
    type: "GET",
    url: "//somewhere",
    contentType: "application/json; charset=utf-8", 
    async: false,
    success: (function() {
        someGlobal = true;
    })
});

if (someGlobal) {
   // follow-up
}
</pre>

The above example is easy to follow somehow because it runs step-by-step. Value of **someGlobal** is properly assigned before follow-up. Everything is fine except blocking and using of global variable. Let's rewrite and see,

<pre lang="javascript">

$.ajax({
    type: "GET",
    url: "//somewhere",
    contentType: "application/json; charset=utf-8", 
    async:true,
    success: (function() {
        followUp(true);
    }),
    error: (function() {
        followUp(false);
    })
});

// parameter result is renamed from someGlobal
function followUp(result) {
    // follow-up
}
</pre>

Now the AJAX is not blocked because of `async: true`. We put code for follow-up into a `followUp` function. No global variable is needed. In real world this could become callback in chain and this will be discuss later.