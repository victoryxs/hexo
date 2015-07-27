title: '每日一题:Length-of-Last-Word'
date: 2015-07-27 12:37:22
tags: [code,leetcode]
categories: code
description: 每天一道Leetcode
---

## 题目
>Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.

>If the last word does not exist, return 0.

>Note: A word is defined as a character sequence consists of non-space characters only.

>For example, 
Given s = "Hello World",
return 5.

## 解答

```
public class Solution {
    public int lengthOfLastWord(String s) {
        s = s.trim();
        s = s.toLowerCase();
        int length = 0;
        
        if (s.length() == 0) {
            return 0;
        }
       
        for (int i = s.length() - 1; i >= 0; i--) {
            char ch = s.charAt(i);
            if (ch >= 'a' && ch <= 'z') {
                length++;
            }
            else if (ch == ' ') {
                break;
            }else {
                return 0;
            }
        }
        return length;
    }
}
```

## 注解
用`split()`切词，然后对字符数组最后一个判断，效率有点低。

直接从最后一位开始遍历，遇到空格就返回`length`，遇到字符就让length加1，遇到非字符和空格就返回`0`。


## 反思(转载)


在java.lang包中有String.split()方法的原型是：

`public String[] split(String regex, int limit)`

split函数是用于使用特定的切割符(regex)来分隔字符串成一个字符串数组，函数返回是一个数组。在其中每个出现regex的位置都要进行分解。

需要注意是有以下几点:

+ regex是可选项。字符串或正则表达式对象，它标识了分隔字符串时使用的是一个还是多个字符。如果忽略该选项，返回包含整个字符串的单一元素数组。
+ limit也是可选项。该值用来限制返回数组中的元素个数。
+ 要注意转义字符：“.”和“|”都是转义字符，必须得加"\\"。同理：*和+也是如此的。
+ 如果用“.”作为分隔的话，必须是如下写法:String.split("\\."),这样才能正确的分隔开，不能用String.split(".");如果用“|”作为分隔的话，必须是如下写法:String.split("\\|"),这样才能正确的分隔开，不能用String.split("|");
+ 如果在一个字符串中有多个分隔符，可以用“|”作为连字符，比如：“acountId=? and act_id =? or extra=?”,把三个都分隔出来，可以用
String.split("and|or");

split函数结果与regex密切相关，常见的几种情况如下所示：

```
public class SplitTest {
	public static void main(String[] args) {
		String str1 = "a-b";		
		String str2 = "a-b-";
		String str3 = "-a-b";
		String str4 = "-a-b-";
		String str5 = "a";
		String str6 = "-";
		String str7 = "--";
		String str8 = "";
		
		split(str1);
		split(str2);
		split(str3);
		split(str4);
		split(str5);
		split(str6);
		split(str7);
		split(str8);
	}
	public static void split(String demo){
		String[] array = demo.split("-");
		int len = array.length;
		System.out.print("\"" + demo + "\" 分割后的长度为：" + len);
		if(len >= 0)
		{
			System.out.print(",分割后的结果为：");
			for(int i=0; i<len; i++)
			{
				System.out.print(" \""+array[i]+"\"");
			}			
		}
		System.out.println();
	}
}
```
---
运行结果为：

"a-b" 分割后的长度为：2,分割后的结果为:"a" "b"

"a-b-" 分割后的长度为：2,分割后的结果为:"a" "b"

"-a-b" 分割后的长度为：3,分割后的结果为:"" "a" "b"

"-a-b-" 分割后的长度为：3,分割后的结果为:"" "a" "b"

"a" 分割后的长度为：1,分割后的结果为:"a"

"-" 分割后的长度为：0,分割后的结果为:

"--" 分割后的长度为：0,分割后的结果为:

"" 分割后的长度为：1,分割后的结果为:""

由此可以得出来：

+ 当字符串只包含分隔符时，返回数组没有元素；
+ 当字符串不包含分隔符时，返回数组只包含一个元素（该字符串本身）；
+ 字符串最尾部出现的分隔符可以看成不存在，不影响字符串的分隔；
+ 字符串最前端出现的分隔符将分隔出一个空字符串以及剩下的部分的正常分隔；

