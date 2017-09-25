package com.iot1.sql.test;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.aop.framework.ProxyFactory;
public class HelloMain {
	public static void main(String[]args){
		IprintMsg target = new PrintMsg();
		
		ProxyFactory pf = new ProxyFactory();
		pf.addAdvice(new MyAroundAdvice());
		pf.setTarget(target);
		IprintMsg proxy = (IprintMsg) pf.getProxy();
		
		proxy.hello();
		proxy.hello1();
		proxy.hello2();
	}

}
