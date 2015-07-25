title: '每日一题:String-to-Integer'
date: 2015-07-25 15:55:29
tags: [code, leetcode]
categories: code
description: 每日一题，LeetCode.一时兴起，再来一题.
---

## 题目
>Implement atoi to convert a string to an integer.

>Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.

>Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.
    
>+ The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
    
>+ The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
    
>+ If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
    
>+ If no valid conversion could be performed, a zero value is returned. If the correct value is out of the range of representable values, INT_MAX (2147483647) or INT_MIN (-2147483648) is returned.

## 解答

```
public class Solution {
    public int myAtoi(String str) {
        str = str.trim();
        int res = 0;
        int index = 0;
        boolean flag = false;

        if(str.length() == 0) return res;
       
        if(str.charAt(0) == '+' || str.charAt(0) == '-'){
            index = 1;
            if(str.charAt(0) == '-') flag = true;
        }

        for(int i = index; i < str.length(); i++){
            char ch = str.charAt(i);

            if(ch < '0' || ch > '9'){
                break;
            }else{
                int num = ch - '0';
                if(flag && res>-((Integer.MIN_VALUE+num)/10)) return Integer.MIN_VALUE;
                else if(!flag && res>(Integer.MAX_VALUE-num)/10) return Integer.MAX_VALUE;
                res = res * 10 + num;
            }
        }

        if(flag == true) res = - res;
        
        return res;
    }
}

```

## 注解
经典的atoi问题，奈何没有参加过ACM，对于部分情况考虑不周。

+ String串首尾去空
+ 对于空串，单独判断
+ 首位出现符号位，需要考虑
+ 超出`Int`范围的溢出处理

## 反思

对于某些经典问题，需要通过实际编程，并且通过一定限制的测试用例，才能了解问题真正的含义。
