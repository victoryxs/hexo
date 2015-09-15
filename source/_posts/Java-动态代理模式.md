title: Java 动态代理模式
date: 2015-08-13 22:11:34
tags: [DesignPattern,Proxy]
categories: DesignPattern
description: Java动态代理模式解析
---

首先我们看一段代码

```
public interface BusinessProcessor{
    public void processBusiness();
}

public class BusinessProcessorImpl implements BusinessProcessor{
    public void processBusiness(){
        System.out.println("processing business...");
    }
}


import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class BusinessProcessorHandler implements InvocationHandler{
    private Object target = null;
    
    BusinessProcessorHandler(Object target){
        this.target = target;
    }
    
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable{
        System.out.println("You can do something here before process your business");
        Object result = method.invoke(target, args);
        System.out.println("You can do something here after process your business");
        return result;
    }
}


public class Test {
     public static void main(String[] args) {
         BusinessProcessorImpl bpimpl = new BusinessProcessorImpl();
         BusinessProcessorHandler handler = new BusinessProcessorHandler(bpimpl);
         BusinessProcessor bp = (BusinessProcessor)Proxy.newProxyInstance(bpimpl.getClass().getClassLoader(),bpimpl.getClass().getInterfaces(), handler);
         bp.processBusiness();
    }
}

```


