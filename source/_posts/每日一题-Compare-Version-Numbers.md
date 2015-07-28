title: 每日一题:Compare-Version-Numbers
date: 2015-07-28 08:04:21
tags: [code,leetcode]
categories: code
description: 每天一道Leetcode
---

## 题目

>Compare two version numbers version1 and version2.
If version1 > version2 return 1, if version1 < version2 return -1, otherwise return 0.

>You may assume that the version strings are non-empty and contain only digits and the . character.
The . character does not represent a decimal point and is used to separate number sequences.
For instance, 2.5 is not "two and a half" or "half way to version three", it is the fifth second-level revision of the second first-level revision.

>Here is an example of version numbers ordering:

>`0.1 < 1.1 < 1.2 < 13.37`


## 解答

```
public class Solution {
    public int compareVersion(String version1, String version2) {
        String[] v1 = version1.split("\\.");
        String[] v2 = version2.split("\\.");

        int length = (v1.length > v2.length) ? v1.length : v2.length;
        for(int i = 0; i < length; i++){

            int num1 = (v1.length - 1 < i) ? 0 : Integer.parseInt(v1[i]);
            int num2 = (v2.length - 1 < i) ? 0 : Integer.parseInt(v2[i]);

            if(num1 > num2){
                return 1;
            }else if(num2 > num1){
                return -1;
            }
        }
        return 0;
    }
}
```

## 注解

先根据`.`切词，然后依次比较切词数组对应位大小(通过转换为整数).

## 反思

```
public static int parseInt(String s) throws NumberFormatException   
{  
    return parseInt(s,10);  
 }  
```

```
public static int parseInt(String s, int radix)throws NumberFormatException  
{  
    if (s == null) {  
        throw new NumberFormatException("null");  
    }  
  
    if (radix < Character.MIN_RADIX) {          
        //Character.MIN_RADIX=2  
        throw new NumberFormatException("radix " + radix +  
                    " less than Character.MIN_RADIX");  
    }  
  
    if (radix > Character.MAX_RADIX) {          
    //Character.MAN_RADIX=36  
        throw new NumberFormatException("radix " + radix +  
                    " greater than Character.MAX_RADIX");  
    }  
  
    int result = 0;  
    boolean negative = false;  
    int i = 0, max = s.length();  
    int limit;  
    int multmin;  
    int digit;  
  
    if (max > 0) {  
        if (s.charAt(0) == '-') {  
        negative = true;  
        limit = Integer.MIN_VALUE;  
        i++;  
     } else {  
        limit = -Integer.MAX_VALUE;  
     }  
     multmin = limit / radix;  
     if (i < max) {  
        digit = Character.digit(s.charAt(i++),radix);  
        if (digit < 0) {  
            throw NumberFormatException.forInputString(s);  
        } else {  
            result = -digit;  
        }  
     }  
     while (i < max) {  
     // Accumulating negatively avoids surprises near MAX_VALUE  
        digit = Character.digit(s.charAt(i++),radix);  
        if (digit < 0) {  
            throw NumberFormatException.forInputString(s);  
        }  
        if (result < multmin) {  
            throw NumberFormatException.forInputString(s);  
        }  
        result *= radix;  
        if (result < limit + digit) {  
            throw NumberFormatException.forInputString(s);  
        }  
        result -= digit;  
        }  
    } else {  
        throw NumberFormatException.forInputString(s);  
    }  
    if (negative) {  
        if (i > 1) {  
        return result;  
        } else {    /* Only got "-" */  
        throw NumberFormatException.forInputString(s);  
        }  
    } else {  
        return -result;  
    }  
       }  
```
