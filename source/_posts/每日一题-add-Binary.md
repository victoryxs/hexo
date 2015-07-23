title: '每日一题:add Binary'
date: 2015-07-23 16:38:40
tags: [code,leetcode]
categories: code
description: 每天一道LeetCode
---

## 题目

>Given two binary strings, return their sum (also a binary string).

>For example, a = "11", b = "1", Return "100".

## 解答

```
public class Solution {
    public String addBinary(String a, String b) {
        
        int acur = a.length() - 1;
        int bcur = b.length() - 1;

        StringBuffer sb = new StringBuffer();

        boolean flag = false;

        while(acur >=0 || bcur >= 0){
            int anum = (acur >= 0 ? a.charAt(acur) - '0' : 0);
            int bnum = (bcur >= 0 ? b.charAt(bcur) - '0' : 0);
            int res = anum + bnum;
            if (flag == true) {
                res++;
                flag = false;
            }
            if (res > 1) {
                res = res - 2;
                flag = true;
            }
            sb.append(res);
            acur--;
            bcur--;
        }

        if(flag == true){
            sb.append('1');
        }
        
        return sb.reverse().toString();
    }
}
```

## 注解

没啥好说的，flag标志位标识是否进位，字符串从后往前依次取字符相加，并通过StringBuider追加，最后翻转字符串，返回结果。

## 反思

CharAt()函数的底层实现

```
public char charAt(int index) {
    if ((index < 0) || (index >= count)) {
            throw new StringIndexOutOfBoundsException(index);
    }
    return value[index + offset];
}
```

StringBuilder与StringBuffer

> StringBuilder vs StringBuffer: StringBuffer is synchronized, which means it is thread-safe but slower than StringBuilder.   
