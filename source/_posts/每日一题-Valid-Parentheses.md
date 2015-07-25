title: '每日一题:Valid-Parentheses'
date: 2015-07-24 18:24:27
tags: [code, leetcode]
categories: code
description: 每日一题，LeetCode.一时兴起，再来一题.
---

## 题目
>Given a string containing just the characters `'('`, `')'`, `'{'`, `'}'`, `'['` and `']'`, determine if the input string is valid.

>The brackets must close in the correct order, `"()"` and `"()[]{}"` are all valid but `"(]"` and `"([)]"` are not.

## 解答
```
public boolean isValid(String s) {
        Stack<Character> stack = new Stack<Character>();

        for(int i = 0; i < s.length(); i++){
            char ch = s.charAt(i);
            switch (ch){
                case '{':
                case '(':
                case '[': stack.push(ch) ; continue;
                case ')': if(stack.isEmpty() || stack.pop().charValue() != '(') return false; else continue;
                case ']': if(stack.isEmpty() || stack.pop().charValue() != '[') return false; else continue;
                case '}': if(stack.isEmpty() || stack.pop().charValue() != '{') return false; else continue;
                default:
            }
        }

        if(stack.isEmpty())
        {
            return true;
        }
        else{
            return false;
        }
    }
```

## 注解

利用堆栈的特性，每次遇到`{` `[` `(`就入栈，遇到`}` `]` `)`就出栈，匹配当前的字符。

特别注意下面两种情况：

+ `input: "]]]"`，这个通过遇到相对应字符时判断堆栈是否为空，为空就直接返回`false`.
+ `input: "[[["`，这个通过最后判断堆栈是否为空，一旦不为空就返回`false`.

## 反思

+ Java集合类中Stack的用法:

    ```
    package java.util;
        
    public class Stack<E> extends Vector<E> {
    // 版本ID。这个用于版本升级控制，这里不须理会！
    private static final long serialVersionUID = 1224463164541339165L;
        
    // 构造函数
    public Stack() {
    }
        
    // push函数：将元素存入栈顶
    public E push(E item) {
        // 将元素存入栈顶。
        // addElement()的实现在Vector.java中
        addElement(item);
        
        return item;
    }
        
    // pop函数：返回栈顶元素，并将其从栈中删除
    public synchronized E pop() {
        E    obj;
        int    len = size();
        
        obj = peek();
        // 删除栈顶元素，removeElementAt()的实现在Vector.java中
        removeElementAt(len - 1);
        
        return obj;
    }
        
    // peek函数：返回栈顶元素，不执行删除操作
    public synchronized E peek() {
        int    len = size();
        
        if (len == 0)
            throw new EmptyStackException();
        // 返回栈顶元素，elementAt()具体实现在Vector.java中
        return elementAt(len - 1);
    }
        
    // 栈是否为空
    public boolean empty() {
        return size() == 0;
    }
        
    // 查找“元素o”在栈中的位置：由栈底向栈顶方向数
    public synchronized int search(Object o) {
        // 获取元素索引，elementAt()具体实现在Vector.java中
        int i = lastIndexOf(o);
        
        if (i >= 0) {
            return size() - i;
        }
        return -1;
    }
    }
    ```

+ Java包装类

    | 基本类型 | 包装类 |
    |:-------|:-----:|
    |byte | Byte |
    |boolean | Boolean| 
    |short|Short|
    |char|Character|
    |int|Integer|
    |long|Long|
    |float|Float|
    |double|Double|




