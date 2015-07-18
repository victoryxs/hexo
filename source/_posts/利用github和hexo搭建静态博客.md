title: 利用github和hexo搭建静态博客
tags: [hexo,blog]
date: 2015-07-09 20:22:55
categories: hexo
description: 终于有空闲时间可以好好整理一下整个博客的搭建过程，长话短说，once upon a time ~ ~

---

# 安装过程参考

>+ [Hexo在github上构建免费的Web应用](http://blog.fens.me/hexo-blog-github/)
>+ [Hexo官网](https://hexo.io/)
>+ [Hexo Next主题](https://github.com/iissnan/hexo-theme-next)
>+ [动动手指，给你的Hexo站点添加最近访客（多说篇）](http://www.arao.me/2015/hexo-next-theme-optimize-duoshuo/)
>+ [Hexo自动添加ReadMore标记](http://twiceyuan.com/2014/05/25/hexo%E8%87%AA%E5%8A%A8%E6%B7%BB%E5%8A%A0readmore%E6%A0%87%E8%AE%B0/)

# 部署到github

hexo d 报错 `ERROR deployer not found:github`

错误原因：未安装hexo的git插件

```
npm install hexo-deployer-git --save
```
站点_config.yml配置 `Note:每一个键值对中间有空格`

```
deploy:
	type: git
	reposity: git@github.com:victoryxs/victoryxs.github.io.git
	branch: master
```

# Next主题

## 站点_config.yml

主要添加了`feed` `sitemap` `wordcount`插件，设置了sidebar的`avatar` `friend_link` `social_link`以及配置了`多说评论`，

>参考：

>+ [Next wiki](https://github.com/iissnan/hexo-theme-next/wiki)

```
# Hexo Configuration
## Docs: http://hexo.io/docs/configuration.html
## Source: https://github.com/hexojs/hexo/

# Site
title: Just a Blog But a Life
subtitle: Victoryxs  Blog 
description: 记录生活学习的点点滴滴
author: Victoryxs
language: zh-Hans
email: victoryxs@qq.com
timezone: 

# URL
## If your site is put in a subdirectory, set url as 'http://yoursite.com/child' and root as '/child/'
url: http://yoursite.com
root: /
permalink: :year/:month/:day/:title/
permalink_defaults:

# Directory
source_dir: source
public_dir: public
tag_dir: tags
archive_dir: archives
category_dir: categories
code_dir: downloads/code
i18n_dir: :lang
skip_render:

# Writing
new_post_name: :title.md # File name of new posts
default_layout: post
titlecase: false # Transform title into titlecase
external_link: true # Open external links in new tab
filename_case: 0
render_drafts: false
post_asset_folder: false
relative_link: false
future: true
highlight:
  enable: true
  line_number: true
  auto_detect: true
  tab_replace:

# Category & Tag
default_category: uncategorized
category_map:
tag_map:

# Date / Time format
## Hexo uses Moment.js to parse and display date
## You can customize the date format as defined in
## http://momentjs.com/docs/#/displaying/format/
date_format: YYYY-MM-DD
time_format: HH:mm:ss

# Pagination
## Set per_page to 0 to disable pagination
per_page: 5
pagination_dir: page

# Extensions
## Plugins: http://hexo.io/plugins/
## Themes: http://hexo.io/themes/
theme: next
Plugins:
- hexo-generator-feed
- hexo-generator-sitemap
- hexo-wordcount

# Feed Atom
feed:
  type: atom
  path: atom.xml
  limit: 20

#sitemap
sitemap:
  path: sitemap.xml

#duoshuo
duoshuo_shortname: victoryxs

#cemiantouxiang
avatar: /images/avatar.jpg

# Social links
social:
  Github: https://github.com/victoryxs
  Twitter: https://twitter.com/victoryxs
  Weibo: http://weibo.com/1628261543

 # title, chinese available
links_title: 友情链接
# links
links:
  MacTalk: http://macshuo.com/
  Mac玩儿法: http://www.waerfa.com/
  nikola: http://nikola.gitcafe.io/

#blog create time
since: 2015

# Deployment
## Docs: http://hexo.io/docs/deployment.html
deploy:
  type: git
  repository: git@github.com:victoryxs/victoryxs.github.io.git
  branch: master

```

## 主题_config.yml

添加了`guestbook` `categories` `about` `tags` `腾讯公益404`，修改了代码高亮显示模式，添加了mathjax的latex支持

>参考

>+ [Next wiki](https://github.com/iissnan/hexo-theme-next/wiki)
>+ [动动手指，给你的Hexo站点添加最近访客（多说篇）](http://www.arao.me/2015/hexo-next-theme-optimize-duoshuo/)


```
# when running hexo in a subdirectory (e.g. domain.tld/blog), remove leading slashes ( "/archives" -> "archives" )
menu:
  home: /
  categories: /categories
  about: /about
  archives: /archives
  tags: /tags
  #commonweal: /404.html
  guestbook: /guestbook

# Place your favicon.ico to /source directory.
favicon: /favicon.ico

# Set default keywords (Use a comma to separate)
keywords: "Hexo,next"

# Set rss to false to disable feed link.
# Leave rss as empty to use site's feed link.
# Set rss to specific value if you have burned your feed already.
rss: atom.xml

# Icon fonts
# Place your font into next/source/fonts, specify directory-name and font-name here
# Avialable: default | linecons | fifty-shades | feather
icon_font: default
#icon_font: fifty-shades
#icon_font: feather
#icon_font: linecons

# Code Highlight theme
# Available value: normal | night | night eighties | night blue | night bright
# https://github.com/chriskempson/tomorrow-theme
highlight_theme: night eighties


# MathJax Support
mathjax: true


# Schemes
# scheme: Mist


# Sidebar, available value:
#  - post    expand on posts automatically. Default.
#  - always  expand for all pages automatically
#  - hide    expand only when click on the sidebar toggle icon.
#sidebar: post
sidebar: always
#sidebar: hide


# Automatically scroll page to section which is under <!-- more --> mark.
scroll_to_more: true


# Automatically add list number to toc.
toc_list_number: true


# Use Lato font
# Note: this option is avialable only when the language is not `zh-Hans`
use_font_lato: true


## DO NOT EDIT THE FOLLOWING SETTINGS
## UNLESS YOU KNOW WHAT YOU ARE DOING

# Use velocity to animate everything.
use_motion: true

# Fancybox
fancybox: true

# Static files
vendors: vendors
css: css
js: js
images: images

# Theme version
version: 0.4.3

```
# 插件
## wordcount插件

>[Hexo文章计数插件WordCount](http://blog.willin.wang/posts/2015/hexo-wordcount/)

安装

```
npm i --save hexo-wordcount
```

使用

修改`victoryxs.github.io/themes/layout/_macro/post.swig`文件


```
  <div class="post-meta">
        <span class="post-time">
          {{ __('post.posted') }} {{ date(post.date, config.date_format) }}
        </span>
        {% if post.categories and post.categories.length %}
          <span class="post-category">
            &nbsp; | &nbsp; {{ __('post.in') }}
            {% for cat in post.categories %}
              <a href="{{ url_for(cat.path) }}">{{ cat.name }}</a>

              {% set cat_length = post.categories.length %}
              {% if cat_length > 1 and loop.index !== cat_length %}
                {{ __('symbol.comma') }}
              {% endif %}

            {% endfor %}
          </span>
        {% endif %}

      ---代码添加处---

      <span id="busuanzi_container_page_pv">
      &nbsp; | &nbsp; 热度<span id="busuanzi_value_page_pv"></span>°C
      </span>

        {% if post.comments %}
          {% if (config.duoshuo and config.duoshuo.shortname) or config.duoshuo_shortname %}
            <span class="post-comments-count">
            &nbsp; | &nbsp;
            <a href="{{ url_for(post.path) }}#comments" >
              <span class="post-comments-count ds-thread-count" data-thread-key="{{ post.path }}"></span>
            </a>
          </span>
          {% elseif config.disqus_shortname %}
            <span class="post-comments-count">
            &nbsp; | &nbsp;
            <a href="{{ url_for(post.path) }}#comments" >
              <span class="post-comments-count disqus-comment-count" data-disqus-identifier="{{ post.path }}"></span>
            </a>
          </span>
          {% endif %}
        {% endif %}
      </div>
```

在上图代码添加处，添加代码

```
<span class="post-count">
&nbsp; | &nbsp;{{ __('post.wordcount') }}{{ wordcount(post.content) }}
</span>
```

## 添加fork me on Github

在`victoryxs.github.io/themes/next/layout/_layout.swig`

```

<body>
  {% include '_partials/old-browsers.swig' %}

  <div class="container one-column {% block page_class %}{% endblock %}">
    <div class="headband"></div>

---代码添加处---
    <div id="header" class="header">
      <div class="header-inner">
        {% include '_partials/header.swig' %}
      </div>
    </div>

```
在上图代码添加处添加

```
    <!-- add Fork me on Github -->
<a href="https://github.com/victoryxs"><img style="position: absolute; top: 500; left: 0; border: 0;" src="https://camo.githubusercontent.com/8b6b8ccc6da3aa5722903da7b58eb5ab1081adee/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f6c6566745f6f72616e67655f6666373630302e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_left_orange_ff7600.png"></a>

    <!-- add Fork me on Github-->

```

## 添加站点统计（不蒜子）

在`victoryxs.github.io/themes/next/layout/_partials/footer.swig`中的末尾添加下面的js引用

```
	<!-- busuanzi -->
	<script async src="https://dn-lbstatics.qbox.me/	busuanzi/2.3/busuanzi.pure.mini.js">
	</script>
	<!-- busuanzi -->
```
在footer模板中添加访问量,原谅哥偷懒，没有写单独的css

```
	<div class="copyright">
 	<span id="busuanzi_container_site_uv">
 	 本站访客数<span id="busuanzi_value_site_uv"></span>人次
	</span>
	</div>
```
## 单篇文章阅读量

由于不蒜子不提供首页单页面和站点统计，所以对index页面做部分修改

```
	{% if is_index %}
	<div class="post-meta">
        <span class="post-time">
          {{ __('post.posted') }} {{ date(post.date, 	config.date_format) }}
        </span>

        {% if post.categories and 	post.categories.length %}
          <span class="post-category">
            &nbsp; | &nbsp; {{ __('post.in') }}
            {% for cat in post.categories %}
   <a href="{{ url_for(cat.path) }}">{{ cat.name }}</a>
   {% set cat_length = post.categories.length %}
              {% if cat_length > 1 and loop.index !== cat_length %}
                {{ __('symbol.comma') }}
              {% endif %}

            {% endfor %}
          </span>
        {% endif %}

      <span class="post-count">
      &nbsp; | &nbsp;{{ __('post.wordcount') }}{{ wordcount(post.content) }}
      </span>
      </div>
      {% endif %}

```

然后在非首页的post-meta中添加阅读量，有没有觉得热度这个名字起得特别接地气

```
<span id="busuanzi_container_page_pv">
&nbsp; | &nbsp; 热度<span id="busuanzi_value_page_pv"></span>°C</span>
```

# Hexo模板系统

Hexo的基本原理就是根据解析_post中的md格式文件，参照md文件中的布局类型根据模板解析。

Hexo使用node.js模板文件，例如ejs，swig，doT，Jade。Hexo中有post、page、photo等不同布局，选用的布局类型会在md文件中声明。

处理流程：Hexo首先解析md文件，然后根据layout.swig判断布局类型，再转发给其他的布局文件。

![简要流程](http://cl.ly/bvGa/hexo_ejs_1.png)

