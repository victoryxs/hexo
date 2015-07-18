title: FoldingText工具
date: 2015-07-09 10:03:55
categories: tools
tags: [tools,FoldingText]
description: FoldingText 文本编辑工具的使用
---

## User Guide



- Edit > Select > Expand Selection (Option-Command-Up)



- Edit > Select > Contract Selection (Option-Command-Down)



- Edit > Select > Undo Selection (Control-Z)



- Edit > Select > Redo Selection (Control-Shift-Z)



- Organize > Move Left (Command-[)



- Organize > Move Right (Command-])



- Organize > Move Up (Option-Command-[)



- Organize > Move Down (Option-Command-[)



- Organize > Move Branch Left (Control-Option-Left)



- Organize > Move Branch Right (Control-Option-Right)



- Organize > Move Branch Up (Control-Option-Up)



- Organize > Move Branch Down (Control-Option-Down)



- To open the command mode use the shortcut Command-'.



- To create a property, type the property name (single word) followed by " : " (space, colon, space) on its own line.



***

##Node Path



FoldingText是一个基于markdown语法的`#`级层组织的树形结构文档编辑器，其中的Node Path就像文档结构树的每个节点，其表现的形式类似文件系统的地址。



```

/myheading/subhead

```

###Node Path结构



```

//myheading/subhead

```

表示匹配所有一级标题是myheading的node path



```

/myheading//subheand

```

表示匹配myheading下所有subhead的node path



```

/myheading//subhead/@done/..*

```

表示匹配myheading下的subhead下@done的父类标题



```

/myheading///subhead

```

表示连同父标题一同显示



```

/myheading/ancestor::*

```

表示显示匹配断言的父节点



```

/myheading/ancestor-or-self::*

```

表示显示断言本身和它的父节点



```

/myheading/descendant::*

```

表示显示断言的后代



```

/myheading/descendant-or-self::*

```

表示显示断言的后代和本身



```

/myheading/following::*

```

表示显示断言后的所有节点



```

/myheading/following-sibling::*

```

表示断言后的所有兄弟节点



```

/myheading/preceding::*

```

表示显示断言前的所有节点



```

/myheading/preceding-sibling::*

```

表示显示断言前的所有兄弟节点



```

/myheading/child::*

```

表示显示断言的孩子节点



```

/myheading/parent::*

```

表示显示断言的父节点



```

/myheading/self::*

```

表示显示断言本身



```

/myheading/filter-descendants::*

```

表示连同后代节点一同显示



###Node Path操作

`union`交集

`intersect`并集

`except`除去



###Node Path断言

```

@<attribute> <relation> <search>

```

#### attribute

1. 内置属性



+ `type`： `heading`;`ordered`;`unordered`;`blockquote`;`codeblock`;`linkdef`;`property`;`body`;`term`;`definition`;`horizontalrule`;`empty`;



+ `line`



+ `mode`



+ `modeContext`



+ `id`



+ `property`



2. 标签属性



@priority(1)



```

@priority = 1

```



3. line的内置属性



```

@line:strong

@line:text

```



4. Property属性



```

@property:myproperty = with value

```



####relation

`=` `!=` `<` `>` `<=` `>=` `beginswith` `endswith` `matches` `contains`



```

@line contains [modifier] value

```

其中的modifer是修饰预，主要包括：



+ `i`:转化为小写字母，默认修饰符

+ `s`:不做任何修改

+ `n`:数字模式比较

+ `d`:日期模式比较



####value

如果是特殊的符号，必须用`""`包裹



```

@line contains "="

```

####布尔表达式

`and` `or` `not`



###结果分片

`[0]`的使用



```

/project//task not @done[0]

```

返回每一个project目录下第一个未完成的任务



```

(//task not @done)[0]

```

返回第一个未完成的任务



`[start:end]`



`[start:]`



`[:end]`



`[:]`



`[index]`

***

##相关资料

[FoldingText, 伪装成 markdown 编辑器的 outliner](http://www.v2ex.com/t/123024)



[FoldingText Support](http://support.foldingtext.com/)



[FoldingText概述](https://velocityofrelease.wordpress.com/2014/06/13/foldingtext-2-%E6%A6%82%E8%AB%96/#foldingtext-2-概論)


