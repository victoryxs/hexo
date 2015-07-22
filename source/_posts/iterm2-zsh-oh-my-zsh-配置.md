title: iterm2+zsh+oh my zsh 配置
date: 2015-07-22 18:13:02
tags: [tools,iterm2,zsh]
categories: tools
description: mac OS X下 iterm2、zsh 和 oh my zsh 的配置。
---

## iterm2

![iterm2](http://static.oschina.net/uploads/img/201412/17101432_iOgu.jpg)

### 安装
[iterm2官网](http://www.iterm2.com/)
[官方文档](http://www.iterm2.com/documentation.html)

### 特性

+ 全键盘操作，无鼠标文本选择 `Cmd+f`
+ 快捷分屏 `Cmd+d` `Cmd+Shift+d` `Cmd+[` `Cmd+]`
+ 热键窗口，一键开启iterm2 
+ 交换Cmd和Option键，满足个人习惯
+ 支持标记和跳转到标记 `Cmd+Shift+M` `Cmd+Shift+J`
+ 支持表达式搜索
+ 自动补全 `Cmd+;`
+ 粘贴历史 `Cmd+Shift+H`
+ 立即重放 `Cmd+Opt+B`
+ 全屏 `Cmd+Enter` 
+ 整合tmux

### 快捷键

+ ⌘ + 数字在各 tab 标签直接来回切换
+ 选择即复制 + 鼠标中键粘贴，这个很实用
+ ⌘ + f 所查找的内容会被自动复制
+ ⌘ + d 横着分屏 / ⌘ + shift + d 竖着分屏
+ ⌘ + r = clear，而且只是换到新一屏，不会想 clear 一样创建一个空屏
+ ctrl + u 清空当前行，无论光标在什么位置
+ 输入开头命令后 按 ⌘ + ; 会自动列出输入过的命令
+ ⌘ + shift + h 会列出剪切板历史
+ ⌘← / ⌘→ 到一行命令最左边/最右边 ，这个功能同 C+a / C+e
+ ⌥← / ⌥→ 按单词前移/后移，相当与 C+f / C+b，其实这个功能在Iterm中已经预定义好了，⌥f / ⌥b，看个人习惯了

### tmux 整合

`brew install tmux`，然后在oh my zsh的配置文件.zshrc中的plugins 中添加tmux插件

## zsh
![zsh](http://pic4.zhimg.com/b691b3fa0ffb6d6c90761a98d3afab1b_b.jpg)

[终极 Shell--ZSH](http://zhuanlan.zhihu.com/mactalk/19556676)

### 安装
1. 查看本机自带shell
`cat /etc/shells`

2. 安装
mac用户跳过，Redhat用户 `sudo yum install zsh`，Ubuntu用户 `sudo apt-get install zsh`

3. 设置zsh为默认shell
`chsh -s /bin/zsh`

### 特性
+ 兼容bash shell
+ 输入Commnd，按住上下键查看匹配的 shell 命令
+ 智能拼写纠正
+ 各种补全，`Tab+Tab`触发路径、命令和命令参数
+ 只能跳转，利用`z`和`autojump`实现
+ `d` `..` `.` 文件目录跳转补充
+ `ls -l **/*.sh` 递归显示当前目录下的shell文件
+ 强大的alias系统 

    我的别名，参考MacTalk的配置

    ```
    alias cls='clear'
    alias ll='ls -l'
    alias vi='vim'
    alias javac="javac -J-Dfile.encoding=utf8"
    alias grep="grep --color=auto"
    alias -s html=vi   # 在命令行直接输入后缀为 html 的文件名，会在 TextMate 中打开
    alias -s py=vi       # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
    alias -s js=vi
    alias -s c=vi
    alias -s java=vi
    alias -s txt=vi
    alias -s gz='tar -xzvf'
    alias -s tgz='tar -xzvf'
    alias -s zip='unzip'
    alias -s bz2='tar -xjvf'
    ```
+ 插件，结合Oh my zsh实现

## oh my zsh

![oh my zsh](http://ohmyz.sh/img/OMZLogo_BnW.png)

[oh my zsh官网](http://ohmyz.sh/)

### 安装

自动安装

`wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh`

手动安装

```
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```

### 主题

上个图

![agnoster](https://cloud.githubusercontent.com/assets/2618447/6316862/70f58fb6-ba03-11e4-82c9-c083bf9a6574.png)

1. 安装 Powerline
    [Powerline 官网](http://powerline.readthedocs.org/en/latest/installation.html)

    如果你的终端能够正常执行pip指令，那么直接执行下面的指令可以完成安装

    `pip install powerline-status`

    如果没有，则先执行安装pip指令

    `sudo easy_install pip`

2. 下载安装字体库

    + 将工程下载下来后cd到install.sh文件所在目录

    + 执行指令安装字体库

        执行./install.sh指令安装所有Powerline字体

    + 安装完成后提示所有字体均已下载到/Users/superdanny/Library/Fonts路径下

        `All Powerline fonts installed to /Users/superdanny/Library/Fonts`

3. 设置iterm2的Regular Font和Non-ASCII Font

    安装完字体库之后，把iTerm 2的设置里的Profile中的Text 选项卡中里的Regular Font和Non-ASCII Font的字体都设置成 Powerline的字体，我这里设置的字体是12pt Meslo LG S DZ Regular for Powerline
    
4. 配色方案

    + 安装配色方案

        进入刚刚下载的工程的solarized/iterm2-colors-solarized 下双击 Solarized Dark.itermcolors 和 Solarized Light.itermcolors 两个文件就可以把配置文件导入到 iTerm2 里

    + 配置配色方案

        通过load presets选择刚刚安装的配色主题即可
        
5. 使用agnoster主题
    + 下载agnoster主题
        
        到下载的工程里面运行install文件,主题将安装到~/.oh-my-zsh/themes目录下

    + 设置该主题
        
        进入~/.zshrc打开.zshrc文件，然后将ZSH_THEME后面的字段改为agnoster。ZSH_THEME="agnoster"（agnoster即为要设置的主题）
        
6. 增加指令高亮效果 zsh-syntax-highlighting

    指令高亮效果作用是当用户输入正确命令时指令会绿色高亮，错误时命令红色高亮

    + cd到.zshrc所在目录

    + 执行指令将工程克隆到当前目录

      `git clone git://github.com/zsh-users/zsh-syntax-highlighting.git`

    + 打开.zshrc文件，在最后添加下面内容

      `source XXX/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh`,保存文件。

    + cd ~/.oh-my-zsh/custom/plugins

    + 再次打开.zshrc文件，在最后面添加下面内容
    
      `plugins=(zsh-syntax-highlighting)`,保存文件。
      
### 插件

oh my zsh的插件在`~/.oh-my-zsh/plugins`目录下，默认有100多种。

贴出我的配置

`plugins=(git autojump osx mvn gradle z)`

其中：

1. osx：tab 增强，quick-look filename 可以直接预览文件，man-preview grep 可以生成 grep手册 的pdf 版本等。

2. autojump：autojump是zsh下最强悍的插件。
    + brew安装
      
      `brew install autojump`
      
    + 若无法安装，利用
      
      `wget https://github.com/downloads/joelthelion/autojump/autojump_v21.1.2.tar.g`,解压缩后进入目录，执行`./install.sh`.
      
    + 最后把以下代码加入.zshrc：
      
      `[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh`
      
## fish shell

![fish](http://fishshell.com/assets/img/Terminal_Logo_CRT_Small.png)

[fishshell 官网](http://fishshell.com/)

### 安装

`brew install fish`

### 切换

`chsh -s /bin/fish`

### 特点

傻瓜式shell编程，相对应的现在有oh my fish，博客反馈不错，哪天装了试试。






