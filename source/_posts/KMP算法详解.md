title: KMP算法详解
date: 2015-08-01 21:28:04
tags: [algorithms, KMP]
categories: algorithms
description: 根据Jake Boxer的文章对KMP进行解析，并通过Java代码实现
---

# KMP思想

> 参考

> [The Knuth-Morris-Pratt Algorithm in my own words](http://jakeboxer.com/blog/2009/12/13/the-knuth-morris-pratt-algorithm-in-my-own-words/)

## 部分匹配表

对于KMP算法而言，最重要的就是部分匹配表。例如`abababca`，其部分匹配表如下

```
char: |a|b|a|b|a|b|c|a|
index:|0|1|2|3|4|5|6|7|
value:|0|0|1|2|3|4|0|1|
```

1. 对于匹配的某一位来说，我只是关心它前面的字符，不必去关心后面的字符。例如：匹配到`index = 5`时，我只是关心前面从0到4位字符串。

2. 两个重要的概念：

    + 适宜前缀（Proper prefix）：去除一位或多位结尾的所有字符。例如，对于`Snape`来说，它的适宜前缀就是`S` `Sn` `Sna` `Snap`.
    > Proper prefix: All the characters in a string, with one or more cut off the end. 
    + 适宜后缀（Proper suffix）：去除一位或多位开始的所有字符。例如，对于`Snape`来说，它的适宜后缀就是`e` `pe` `ape` `nape`.
    > Proper suffix: All the characters in a string, with one or more cut off the beginning.
    
3. 对于部分匹配表中的值我们是这样定义的：在子串中最长的适宜前缀匹配适宜后缀的长度.举个例子：对于字符串`abababca`其中的第4位来说，其子串为`ababa`，其中适宜前缀包括：`a` `ab` `aba` `abab`，适宜后缀包括：`a` `ba` `aba` `baba`，那么最长的匹配串就是`aba`，其长度为3.
> The length of the longest proper prefix in the (sub)pattern that matches a proper suffix in the same (sub)pattern.

## 匹配过程

匹配需要两个条件：匹配上且该匹配位上的值大于1。

滑动距离：匹配位置长度减去该位的值。

举个例子：被匹配串为`bacbababaabcbab`，匹配串为`abababca`，当匹配到如下情景时：

```
bacbababaabcbab
    |||||
    abababca

```

这时候匹配子串长度为5，该位置上的值为3，那么就应该滑动 `5-3=2`，滑动结果如下：

```
bacbababaabcbab
    **|||
      abababca
```

> If a partial match of length partial_match_length is found and table[partial_match_length] > 1, we may skip ahead partial_match_length - table[partial_match_length - 1] characters.


    