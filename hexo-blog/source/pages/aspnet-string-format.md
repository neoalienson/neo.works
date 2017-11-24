---
title: ASP.NET string.Format
id: 2636
date: 2008-08-29 18:38:31
---

{0:d} YY-MM-DD
{0:p} 百分比00.00%
{0:N2} 12.68
{0:N0} 13
{0:c2} $12.68
{0:d} 3/23/2003
{0:T} 12:00:00 AM
{0:男;;女}

DataGrid-數據格式設置表達式

數據格式設置表達式
.NET Framework 格式設置表達式，它在數據顯示在列中之前先應用于數據。此表達式由可選靜態文本和用以下格式表示的格式說明符組成：
{0:format specifier}

零是參數索引，它指示列中要格式化的數據元素；因此，通常用零來指示第一個（且唯一的）元素。format specifier 前面有一個冒號 (:)，它由一個或多個字母組成，指示如何格式化數據。可以使用的格式說明符取決于要格式化的數據類型：日期、數字或其他類型。下表顯示了不同數據類型的格式設置表達式的示例。有關格式設置表達式的更多信息，請參見格式化類型。

# Currency
{0:C}
numeric/decimal
顯示“Price:”，后跟以貨幣格式表示的數字。貨幣格式取決于通過 Page 指令或 Web.config 文件中的區域性屬性指定的區域性設置。

# Integer
{0:D4}
整數()不能和小數一起使用。)
在由零填充的四個字符寬的字段中顯示整數。

# Numeric
{0:N2}%
顯示精確到小數點后兩位的數字，后跟“%”。

# Numeric/Decimal
{0:000.0}
四舍五入到小數點后一位的數字。不到三位的數字用零填充。

# Date/Datetime Long
{0:D}
長日期格式（“Thursday, August 06, 1996”）。日期格式取決于頁或 Web.config 文件的區域性設置。

# Date/Datetime short
{0:d}
短日期格式（“12/31/99”）。

# Date/Datetime customize
{0:yy-MM-dd}
用數字的年－月－日表示的日期（96-08-06）。

2006-02-22 | asp.net數據格式的Format-- DataFormatString

我們在呈現數據的時候，不要將未經修飾過的數據呈現給使用者。例如金額一萬元，如果我們直接顯示「10000」，可能會導致使用者看成一千或十萬，造成使用者閱讀數據上的困擾。若我們將一萬元潤飾后輸出為「NT$10,000」，不但讓使比較好閱讀，也會讓使用者減少犯錯的機會。\n下列畫面為潤飾過的結果：
上述數據除了將DataGrid Web 控件以顏色來區隔記錄外，最主要將日期、單價以及小計這三個計字段的數據修飾的更容易閱讀。要修飾字段的輸出，只要設定字段的DataFormatString 屬性即可；其使用語法如下：

DataFormatString=\"{0:格式字符串}\"

我們知道在DataFormatString 中的 {0} 表示數據本身，而在冒號后面的格式字符串代表所們希望數據顯示的格式；另外在指定的格式符號后可以指定小數所要顯示的位數。例如原來的數據為「12.34」，若格式設定為 {0:N1}，則輸出為「12.3」。其常用的數值格式如下表所示：\n\n格式字符串 資料 結果
\"{0:C}\" 12345.6789 $12,345.68
\"{0:C}\" -12345.6789 ($12,345.68)
\"{0:D}\" 12345 12345
\"{0:D8}\" 12345 00012345
\"{0:E}\" 12345.6789 1234568E+004
\"{0:E10}\" 12345.6789 1.2345678900E+004
\"{0:F}\" 12345.6789 12345.68
\"{0:F0}\" 12345.6789 12346
\"{0:G}\" 12345.6789 12345.6789
\"{0:G7}\" 123456789 1.234568E8
\"{0:N}\" 12345.6789 12,345.68
\"{0:N4}\" 123456789 123,456,789.0000
\"Total: {0:C}\" 12345.6789 Total: $12345.68

其常用的日期格式如下表所示：

格式 說明 輸出格式
d 精簡日期格式 MM/dd/yyyy
D 詳細日期格式 dddd, MMMM dd, yyyy
f 完整格式 (long date + short time) dddd, MMMM dd, yyyy HH:mm
F 完整日期時間格式
(long date + long time)
dddd, MMMM dd, yyyy HH:mm:ss
g 一般格式 (short date + short time) MM/dd/yyyy HH:mm
G 一般格式 (short date + long time) MM/dd/yyyy HH:mm:ss
m,M 月日格式 MMMM dd\ns 適中日期時間格式 yyyy-MM-dd HH:mm:ss
t 精簡時間格式 HH:mm\nT 詳細時間格式 HH:mm:ss

string.format格式結果

String.Format

(C) Currency: . . . . . . . . ($123.00)

(D) Decimal:. . . . . . . . . -123

(E) Scientific: . . . . . . . -1.234500E+002

(F) Fixed point:. . . . . . . -123.45

(G) General:. . . . . . . . . -123

(N) Number: . . . . . . . . . -123.00

(P) Percent:. . . . . . . . . -12,345.00 %

(R) Round-trip: . . . . . . . -123.45

(X) Hexadecimal:. . . . . . . FFFFFF85

(d) Short date: . . . . . . . 6/26/2004

(D) Long date:. . . . . . . . Saturday, June 26, 2004

(t) Short time: . . . . . . . 8:11 PM

(T) Long time:. . . . . . . . 8:11:04 PM

(f) Full date/short time: . . Saturday, June 26, 2004 8:11 PM

(F) Full date/long time:. . . Saturday, June 26, 2004 8:11:04 PM

(g) General date/short time:. 6/26/2004 8:11 PM

(G) General date/long time: . 6/26/2004 8:11:04 PM

(M) Month:. . . . . . . . . . June 26

(R) RFC1123:. . . . . . . . . Sat, 26 Jun 2004 20:11:04 GMT

(s) Sortable: . . . . . . . . 2004-06-26T20:11:04

(u) Universal sortable: . . . 2004-06-26 20:11:04Z (invariant)

(U) Universal sortable: . . . Sunday, June 27, 2004 3:11:04 AM

(Y) Year: . . . . . . . . . . June, 2004

(G) General:. . . . . . . . . Green

(F) Flags:. . . . . . . . . . Green (flags or integer)

(D) Decimal number: . . . . . 3

(X) Hexadecimal:. . . . . . . 00000003

說明：
String.Format
將指定的 String 中的每個格式項替換為相應對象的值的文本等效項。

例子：
int iVisit = 100;
string szName = \"Jackfled\";
Response.Write(String.Format(\"您的帳號是：{0} 。訪問了 {1} 次.\", szName, iVisit));
