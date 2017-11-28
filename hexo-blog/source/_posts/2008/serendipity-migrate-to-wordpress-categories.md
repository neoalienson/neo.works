---
title: Serendipity migrate to WordPress - Categories
tags:
  - database
  - Migration
  - MySQL
  - PHP
  - Serendipity
  - WordPress
id: 2152
categories:
  - Development
date: 2008-07-06 18:04:26
---

我將個blog 由 serendipity migrate 到 Wordpress, 期間我寫 script 黎 migrate Category，因為發覺 Seredipity 同 WordPress 既 database design mindset 有d 唔同而喺 database design 亦常遇到類似既問題所以順便拎出黎講講。

Serendipity 喺處埋 categories 方面與 Wordpress 截然不同，Serendipity 有專門處理 category 既 tables: entry 同埋 entry_cat; 而 WordPress 就有簡單d，將 category 歸納入去 wp_terms、wp_term_relationships 同埋 wp_term_taxonomy 入面與 tags 及 link categories 等共存。 結果就係 WordPress 只係用 10個 tables 就完成任務而 Serendipity 裝咗 tags plugin 之後就成 27個 tables足足多左差唔多 3倍。

Serendipity 既 database design只能滿足處理 category:

| entries    | entry_cat | category |
| ---------- | --------- | -------- |
| (k)id      | -&lt;     | identry  |
| idcategory | &gt;-     | (k)id    |

而 WordPress 既 database design 就將 category tag 同埋 link category 歸納入 term:

| post              | term_relationships | term_taxonomy       | terms         |
| ----------------- | ------------------ | ------------------- | ------------- |
| (k)post_id        | -&lt;              | object_id           | term_id       |
| term_taxonomy_id  | &gt;-              | (k)term_taxonomy_id |               |
taxanomy (即係將個 term 再分類，可以係 category tag link category 或其他)

結果就係 WordPress 喺 extensibility 方面優於 Serendipity。以 tag 為例
假如 WordPress 唔支援而又想新增依個 feature 佢只係要 taxonomy 方面定多個新名 frontend 作出適當修改 backend 甚至可以用原有系統就完成; 相反喺 Serendipity 要新增 tag 依個功能就要開設專門處理 tag 既 tables 同埋 backend 如果加一兩種新 feature 尤是可，但若果加十幾項就麻煩了。

以下係我 migrate 既 PHP script:
{% codeblock lang:php %}
$result = mysql_query('SELECT c.categoryid, title FROM serendipity_entries e INNER JOIN serendipity_entrycat c ON c.ent
while ($post = mysql_fetch_assoc($result)) {
// category mapping
        switch ($post['categoryid']) {
                case 3: $new_cat = 8; break;
                case 2: $new_cat = 11; break;
                case 12: $new_cat = 12; break;
                case 1: $new_cat = 9; break;
                case 16: $new_cat = 13; break;
        }
        $query = "SELECT  id FROM wp_posts WHERE post_title = '$post[title]'";
        $r2 = mysql_query($query, $wp);
        $row = mysql_fetch_row($r2);
        $wp_post_id = $row[0];

      mysql_query("UPDATE wp_term_relationships SET term_taxonomy_id=$new_cat WHERE object_id=$wp_post_id");

      mysql_query("UPDATE wp_term_taxonomy SET count = count - 1 WHERE term_taxonomy_id=1", $wp);
      mysql_query("UPDATE wp_term_taxonomy SET count = count + 1 WHERE term_taxonomy_id=$new_cat", $wp);
}
{% endcodeblock %}
