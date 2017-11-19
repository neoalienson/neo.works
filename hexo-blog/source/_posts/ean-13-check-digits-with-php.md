---
title: EAN 13 check digits with PHP
tags:
  - barcode
  - PHP
id: 2185
categories:
  - Development
date: 2008-07-16 11:55:02
---

Calculate check digits for EAN13,

{% codeblock lang:php %}
function ean13_check_digit($digits) {
  //first change digits to a string so that we can access individual numbers
  $digits =(string)$digits;
  // 1\. Add the values of the digits in the even-numbered positions: 2, 4, 6, etc.
  $even_sum = $digits{1} + $digits{3} + $digits{5}
    + $digits{7} + $digits{9} + $digits{11};
  // 2\. Multiply this result by 3.
  $even_sum_three = $even_sum * 3;
  // 3\. Add the values of the digits in the odd-numbered positions: 1, 3, 5, etc.
  $odd_sum = $digits{0} + $digits{2} + $digits{4}
    + $digits{6} + $digits{8} + $digits{10};
  // 4\. Sum the results of steps 2 and 3.
  $total_sum = $even_sum_three + $odd_sum;
  // 5\. The check character is the smallest number which, when added to the
  // result in step 4,  produces a multiple of 10.
  $next_ten = (ceil($total_sum/10))*10;
  $check_digit = $next_ten - $total_sum;
  return $digits . $check_digit;
}
{% endcodeblock %}

# Reference
[http://www.edmondscommerce.co.uk/blog/php/ean13-barcode-check-digit-with-php/](http://www.edmondscommerce.co.uk/blog/php/ean13-barcode-check-digit-with-php/)
