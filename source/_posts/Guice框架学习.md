title: Guice框架学习
date: 2015-08-09 09:01:17
tags: [Framework,Guice]
categories: Framework
description: Guice框架的概述以及自己写的Demo。
---

## 概念

1. UML类图常见关系(转载)

    > [设计模式之UML类图的常见关系](http://www.cnblogs.com/zxj159/p/3399654.html)
    
    + 泛化关系(继承实现)
    
    泛化关系是继承和实现的关系。具体表现就是类和类的继承，接口和接口的继承以及类对接口的实现。
    
    ![泛化关系](http://images.cnitblog.com/blog/362290/201310/31171722-c9602d76cfdf41f3a528648095c91401.png)
    
    + 依赖关系(局部调用)
    
    依赖关系表示为一个类使用另一个类，这种使用关系是具有偶然性的、临时性的、非常弱的，一个类的变化会影响到另一个类，是use a关系，如果类A依赖于类B,那么类B可以是类A的局部变量，或类A方法的参数，或静态方法的调用。
    
    ![依赖关系](http://images.cnitblog.com/blog/362290/201310/31165559-4779e58a18e04d1da67a62a8c98cd63d.png)
    
    + 关联关系(全局调用)
    
    关联关系是一种强依赖关系，这种关系不存在依赖关系的偶然性，关系也不是临时的，是长期的，稳定的。双方的关系是平等的，可以单向关联也可以是双向关联。假如类A关联了类B,则类B是类A的全局变量（注意是全局变量，再看看上面的依赖关系），大多数关联都是单向关联，这比较容易维护，关于关联，在生活中我们常会说，类A持有类B的引用。
    
    ![关联关系](http://images.cnitblog.com/blog/362290/201310/31165613-3faec54ba2f94c589a43b224431a8fcc.png)
    
    + 聚合关系(setter方法)
    
    聚合关系是特殊的关联关系，是一种强的关联关系，他体现的是整体与部分关系，即has-a的关系，但是整体和部分是可以分离的，注意，是可以分离的。普通关联关系的两个类处于同一层次上，是平级的，而聚合关系的两个类处于不同的层次，一个是整体，一个是部分。同时，是一种弱的“拥有”关系。体现的是A对象可以包含B对象，但B对象不是A对象的必要的组成部分。具体表现为，如果A由B聚合成，表现为A包含有B的全局对象，但是B对象可以不在A创建的时刻创建，这句话非常有意义，它在代码中通常体现成依赖注入的setter方法，即A对象可以随时创建B对象，再想想这不就体现了整体和部分是可以分离了吗？创建整体的时候可以不创建部分。
    
    ![聚合关系](http://images.cnitblog.com/blog/362290/201310/31165626-ce36baaf7c2b44c9a997288184d65dd5.png)
    
    + 组合关系(构造器方法)
    
    组合关系也是特殊的关联关系，它体现一种contains a（拥有）关系，这种关系是比聚合还要强，也称为强聚合。体现了严格的整体和部分关系，两者是不可分割的，它们的生命周期是一致的。如果A由B组成，那么A就包含B的全局变量，并在创建A的同时创建B，在代码上我们通常是使用构造函数进行实现，也是依赖注入中构造函数的实现。
    
    ![组合关系](http://images.cnitblog.com/blog/362290/201310/31165647-2a0c584f1c5a4573a2b59f4ceceeee2b.png)
    
    + 总结
    
    依赖和关联是Class A度Class B持有引用的关系，而聚合和组合关系是Class A拥有Class B的关系
    
    依赖和关联的区别在依赖是一种弱引用，而关联关系是一种强引用。具体的表现为：依赖关系为局部变量，而关联关系是全部变量
    
    聚合和组合的区别在聚合是一种弱拥有，而组合是一种强拥有。具体的表示为：setter方法是可用可不用的，而构造器方法是随着类的创建而创建的。

2. DI(依赖注入)和IOC(控制反转)

    > [设计模式之初识IoC/DI](http://www.cnblogs.com/zxj159/p/3425168.html)

    简单点说就是IoC/DI容器通过构造方法、setter方法和接口方法将外部资源注入对象。
    
    + 参与对象：对象、IoC/DI容器、对象的外部资源
    + 创建过程：
    
    ![创建过程](http://images.cnitblog.com/blog/362290/201311/15131057-90c485a85176402293fc27fc8e5d1d2a.png)
    
    + 创建形式：构造函数注入、setter方法注入、接口注入
    
        - setter方法注入
        ![setter方法注入](http://images.cnitblog.com/blog/362290/201310/31165626-ce36baaf7c2b44c9a997288184d65dd5.png)
        
        - 构造函数注入
        ![构造函数注入](http://images.cnitblog.com/blog/362290/201310/31165647-2a0c584f1c5a4573a2b59f4ceceeee2b.png)
        
        - 接口注入
        
        ```
        public interface InjectFinder {
            void injectFinder(MovieFinder finder);
        }
    
        class MovieLister: InjectFinder
        {
            private MovieFinder finder;
            public void injectFinder(MovieFinder finder) {
                this.finder = finder;
            }
        }
        ```
        
    > 名词解释
    
    > 依赖注入是应用程序依赖于DI容器创建并注入它所需要的外部资源。
    
    > 控制反转是IoC容器控制应用程序，反向地向应用程序注入其需要的外部资源。


## DI容器 Google Guice

> Google Guice (pronounced "juice") is an open source software framework for the Java platform released by Google under the Apache License. It provides support for dependency injection using annotations to configure Java objects. Dependency injection is a design pattern whose core principle is to separate behavior from dependency resolution.

> Guice allows implementation classes to be bound programmatically to an interface, then injected into constructors, methods or fields using an `@Inject` annotation. When more than one implementation of the same interface is needed, the user can create custom annotations that identify an implementation, then use that annotation when injecting it.

> From Wikipedia Google Guice

Google Guice是一个Google发布的基于Java平台的DI容器(框架)。它将实现类通过一个`Module`文件绑定在接口上，然后通过适用`@Inject`标签来实现构造器注入、方法注入和属性注入。

相关介绍及其使用如下：

[Guice Demo github](https://github.com/victoryxs/GuiceDemo/tree/master/src/main)







