title: 每日一题:ZigZag-Conversion
date: 2015-07-24 15:28:30
tags: [code,leetcode]
categories: code
description: 每天一道LeetCode
---

## 题目

> The string `"PAYPALISHIRING"` is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

>```
P   A   H   N
A P L S I I G
Y   I   R
```

>And then read line by line: `"PAHNAPLSIIGYIR"`

>Write the code that will take a string and make this conversion given a number of rows:

>```
string convert(string text, int nRows);
```
`convert("PAYPALISHIRING", 3)` should return `"PAHNAPLSIIGYIR"`.

## 解答

```
public String convert(String s, int nRows){
        if(nRows == 1){
            return s;
        }

        StringBuffer sb = new StringBuffer();
        int step = 2 * nRows - 2;
        int length = s.length();

        for(int i = 0; i < length; i += step){
            sb.append(s.charAt(i));
        }

        for(int i = 1; i  < nRows - 1; i++){
            for(int  j = i; j < length; j+= step){
                sb.append(s.charAt(j));
                if(j + step - 2 * i < length){
                    sb.append(s.charAt(j + step - 2 * i));
                }
            }
        }

        for(int i = nRows - 1; i < length; i += step){
            sb.append(s.charAt(i));
        }

        return sb.toString();
    }
```

## 注解

一般性的找规律题。

按照生成的顺序，发现首行和末行都是以`2 * nRows - 2`增加的。

中间`nRow - 2`行，在`2 * nRow - 2`步数增加的情况下，加入`2 * nRows - 2 - 2 * (nRow - 2)`小步数增加。

