title: '每日一题:Roman-to-Integer '
date: 2015-07-26 09:36:31
tags: [code,leetcode]
categories: code
description: 每天一道Leetcode
---

## 题目
>Given a roman numeral, convert it to an integer.

>Input is guaranteed to be within the range from 1 to 3999.

## 解答

```
public class Solution {
    public int romanToInt(String s) {
        int res = 0;

        int pre = 1001;
        int next = 0;
        int length = s.length();

        for(int i = 0; i < length; i++){
            switch(s.charAt(i)){
                case 'I': next = 1; break;
                case 'V': next = 5; break;
                case 'X': next = 10; break;
                case 'L': next = 50; break;
                case 'C': next = 100; break;
                case 'D': next = 500; break;
                case 'M': next = 1000;break;
                default: return 0;
            }
            if(next <= pre){
                res += next;
                pre = next;
            }
            if(next > pre){
                res = res - 2 * pre + next;
                pre = next;
            }
        }
        return res;
    }
}
```

## 注解

罗马数字主要包括`I` `V` `X` `L` `C` `D` `M`

对应表如下：

|		I	|		V	|		X	|		L	|		C	|		D	|		M	|
|:------|:------|:------|:------|:------|:------|:------|
|		1	|		5	|		10	|		50	|	100		|		500	|		1000	|

规则：

+ 相同的数字连写，所表示的数等于这些数字相加得到的数。
+ 小的数字在大的数字的右边，所表示的数等于这些数字相加得到的数。
+ 小的数字，（限于Ⅰ、X 和C）在大的数字的左边，所表示的数等于大数减小数得到的数。
+ 正常使用时连写的数字重复不得超过三次。
+ 在一个数的上面画一条横线，表示这个数增值1000倍。

思路：用一个指针指向当前指针的前驱，然后和前驱比较，当前指针代表的罗马数字小于等于前驱，就直接相加；如果大于前驱就加上`next - pre - pre`。





