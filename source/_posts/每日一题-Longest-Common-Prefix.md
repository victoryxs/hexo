title: '每日一题:Longest-Common-Prefix '
date: 2015-07-26 17:42:14
tags: [code,leetcode]
categories: code
description: 每日一题，LeetCode.一时兴起，再来一题.
---

## 题目

>Write a function to find the longest common prefix string amongst an array of strings.

## 解答

```
public class Solution {
    public String longestCommonPrefix(String[] strs) {
        if(strs.length == 0){
            return "";
        }
        
        int index = 0;
        StringBuilder sb = new StringBuilder();
        boolean flag = true;
       
        while (true) {
            char pre;
            if(index < strs[0].length()){
                pre = strs[0].charAt(index);
            }else{
                flag = false;
                break;
            }
            for(int i = 0; i < strs.length; i++){
                if(index < strs[i].length() && strs[i].charAt(index) == pre){
                    pre = strs[i].charAt(index);
                }else{
                    flag = false;
                    break;
                }
            }
            if(flag == true){
                sb.append(pre);
                index++;
            }else{
                break;
            }
        }
        return sb.toString();
    }
}
```

## 注解

遍历每个数组的每一位的字符值，比较是否相等。相等就继续匹配下一位的字符比较。通过对边界值的判断来跳出循环。


