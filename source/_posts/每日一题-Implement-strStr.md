title: '每日一题:Implement-strStr() '
date: 2015-07-29 22:52:30
tags: [code,leetcode]
categories: code
description: 每天一道Leetcode，等待明天的字符串匹配算法集合。
---

## 题目
>Implement strStr().

>Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.


## 解答

```
public class Solution {
    public int strStr(String haystack, String needle) {
             int haystackindex = 0;
        int needleindex = 0;
        
        while(haystackindex < haystack.length() && needleindex < needle.length()){
            if(haystack.charAt(haystackindex) == needle.charAt(needleindex)){
                haystackindex++;
                needleindex++;
            }else{
                haystackindex = haystackindex - needleindex + 1;
                needleindex = 0;
            }
        }
        if(needleindex > needle.length() - 1) {
            return haystackindex - needle.length();
        }
        else{
            return -1;
        }
    }
}
```

## 注解

暴力匹配，没啥好说的，时间复杂度为 O(n*n)。明天会对KMP、BM等算法进行总结。

