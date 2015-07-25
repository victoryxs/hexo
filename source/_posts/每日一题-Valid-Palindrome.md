title: '每日一题:Valid-Palindrome'
date: 2015-07-25 10:56:27
tags: [code, leetcode]
categories: code
description: 每天一道Leetcode
---

## 题目

>Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

>For example,
`"A man, a plan, a canal: Panama"` is a palindrome.
`"race a car"` is not a palindrome.

>For the purpose of this problem, we define empty string as valid palindrome.

## 解答

```
public class Solution {
    public boolean isPalindrome(String s) {
       s = s.toLowerCase();
        int low = 0;
        int high = s.length() - 1;
        while (low <= high){
            char ch1 = s.charAt(low);
            char ch2 = s.charAt(high);

            if(ch1 > 'z' || (ch1<'a' &&  ch1 > '9') || ch1 < '0'){
                low++;
            }
            if(ch2 > 'z' || (ch2<'a' &&  ch2 > '9') || ch2 < '0'){
                high--;
            }
            if ((ch1 >= 'a' && ch1 <= 'z' || ch1 >= '0' && ch1 <='9' )&&(ch2 >= 'a' && ch2 <= 'z' || ch2 >= '0' && ch2 <='9')){
                if (ch1 != ch2){
                    return false;
                }else{
                low++;
                high--;
                }
            }
        }
        return true;
    }
}

```

## 注解

将字符串转换为小写，设置头尾指针，遇到不是`0~9` `a~z`就跳过，否则比较头尾指针的值，不匹配就跳出循环，返回`false`.


