---
title: 'Introducing try-catch from Apple Swift 2, with sandbox on web by IBM Bluemix'
tags:
  - Apple
  - iOS
  - Swift
id: 6963
categories:
  - Development
date: 2015-12-07 09:41:40
---

Apple Swift is a programming language for iOS application development at the beginning. It can be found on Mac's Xcode.

Now Apple Swift 2 is hosted on[ IBM Bluemix's website (http://swiftlang.ng.bluemix.net)](http://swiftlang.ng.bluemix.net). The Swift version &nbsp;is 2.2-dev as of today,

{% codeblock %}
Swift version 2.2-dev (LLVM 46be9ff861, Clang 4deb154edc, Swift 778f82939c)
Target: x86_64-unknown-linux-gnu
{% endcodeblock %}

There are many language features introduced in Swift 2\. Let's begin with the elegant try-catch feature from a sample code,

{% codeblock lang:swift %}
/* Basic fibonacci function in swift.
   Demostrates func calls and recursion.
*/

func fibonacci(i: Int) throws -> Int  {
    if i <= 2 {
        return 1
    } else {
        return **try** fibonacci(i - 1) + fibonacci(i - 2)
    }
}

do {
  try print(fibonacci(22))
  /* do something that doesn't throw in the middle
  */
  // the keyword reminds you below function will throw
  try print(fibonacci(11))
} catch {
  print("error")
}
{% endcodeblock %}

The function doesn't really throw any thing but you can see the function calls that throw are prefixed with ```try```.

The evolution speed of Swift language seems a little bit faster than Google's Go language on this feature.
