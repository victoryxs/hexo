title: IntelliJ IDEA14 教程
date: 2015-07-23 11:03:32
tags: [tools,IntelliJ IDEA]
categories: tools
description: IntelliJ IDEA在Mac OSX上的使用教程
---

##参考文献
>[官方文档](https://www.jetbrains.com/idea/help/basics-and-installation.html)


## 安装篇


1. 在[JetBrains官网](https://www.jetbrains.com/idea/download/index.html)下载最新版的IDEA 14,主要有社区版和旗舰版.强烈推荐旗舰版，福利码生成器源码见[百度网盘](http://pan.baidu.com/s/1i38d23F)
2. 安装`.dmg`文件.
3. 安装Apple Java 6或者Oracle Java7/8.
   
   >**注意:** 对于Java 7/8用户来说，复制`/Applications/IntelliJ IDEA14.app/Contents/bin`下的`idea.properties`到`~/Library/Preferences/IntelliJ IDEA14`下；修改`idea.properties`中参数`JVMVersion`的值为`1.7*`或者`1.8*`。
   
4. 启动.

## 相关概念

### 工程（Project）

> A project is an organizational unit that represents a complete software solution.

**目录格式**

`.idea`目录下包含一系列的XML格式的配置文件，例如：`comilper.xml` `encodings.xml` `modules.xml`根据命名代表工程的具体的功能的配置参数（名字、地址等）。

`worksapce.xml`保存了你的个人配置信息，包括你系统、VCS和历史设置的信息，这个文件不能被共享。

**文件格式**

`.ipr`保存了核心的工程信息。

`.iws`保存了个人的工作空间设置，该文件类型不能被版本控制软件控制。

### 模块

> A module is a discrete unit of functionality which you can compile, run, test and debug independently.

`.iml`模块文件存放一个模块的配置信息，被放置在一个`Content Root`下。可以被共享。











