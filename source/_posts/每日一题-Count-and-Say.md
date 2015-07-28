title: '每日一题:Count-and-Say'
date: 2015-07-28 20:15:07
tags: [code,leetcode]
categories: code
description: 每日一题，LeetCode.一时兴起，再来一题.
---

## 题目
> The count-and-say sequence is the sequence of integers beginning as follows:
> 
1, 11, 21, 1211, 111221, ...

>1 is read off as "one 1" or 11.

>11 is read off as "two 1s" or 21.

>21 is read off as "one 2, then one 1" or 1211.

>Given an integer n, generate the nth sequence.

> Note: The sequence of integers will be represented as a string.

## 解答

```
public class Solution {
    public String countAndSay(int n) {
        if(n == 1){
            return "1";
        }
        String str = countAndSay(n - 1)+ "%";
        StringBuffer sb = new StringBuffer();
        int count = 1;
        for(int i = 0; i < str.length() - 1; i++){
            if(str.charAt(i) == str.charAt(i + 1)){
                count++;
            }else{
                sb.append(String.valueOf(count));
                sb.append(str.charAt(i));
                count = 1;
            }
        }
        return sb.toString();
    }
}

```

## 注解

采用递归的方式解决，然后处理过程就不多说啦。

