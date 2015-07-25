title: 取代PPT的mdpress
date: 2015-07-25 18:26:44
tags: [tools, mdpress]
categories: tools
description: 最近发现一款神器impress.js，然后特别想将markdown和impress.js结合起来，结果就发现了这货**mdpress**。
---

## 缘起

还在用PPT吗？孩子，你快被淘汰了。impress.js绝对是你的不二选择。

impress.js 是国外一位开发者受 Prezi 启发，采用CSS3与JavaScript语言完成的一个可供开发者使用的表现层框架(演示工具)。现在普通开发者可以利用impress.js自己开发出类似效果的演示工具，但性能比基于FLASH的Prezi更优。其功能包括画布的无限旋转与缩放，任意角度放置任意大小的文字，CSS3 3D效果支持等。同时，也支持传统 PowerPoint 形式的幻灯演示。

> [impress.js github库](https://github.com/bartaz/impress.js)

> [官方demo](http://bartaz.github.com/impress.js)

## 安装

还是这句话，windows用户洗洗睡吧。Mac用户使用`sudo gem install mdpress`。Ubuntu用户首先安装需要的包`sudo apt-get install gem ruby-1.9.1-dev`，然后安装mdpress`sudo gem install mdpress`。

## 使用

1. 创建一个md文件，格式参考[mdpress full userage](http://egonschiele.github.io/mdpress/)
2. 跳转到该文件目录下，使用`mdpress filename.md`生成。
3. 在该目录下，你会发现一个与md文件同名的文件夹，点击其中的`index.html`文件展示。

## 注意

在该项目git库的issues存在`issues#41`,解决方法：

> Hi,
it seems it does not work with current redcarpet. As a workaround, I have installed redcarpet 3.1.2 manually and it works.

>I'll try to make a fix later.

>Best regards
>Josef

首先使用`gem uninstall redcarpet --v=3.3.2`删除`redcarpet 3.3.2`依赖库 ， 然后使用`gem install redcarpet -v 3.1.2`安装`redcarpet 3.1.2`依赖库。当然作者应该也会尽快修复这个问题的。









