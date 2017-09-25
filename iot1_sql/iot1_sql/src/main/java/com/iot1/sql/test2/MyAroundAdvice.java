package com.iot1.sql.test2;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class MyAroundAdvice 	{
	@Around("execution(* com.iot1.sql.test.PrintMsg.hello1(..))")
	public void setAdvice(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("메소드 실행전 hello");
		Object ret = pjp.proceed();
		System.out.println("메소드 실행후 hello");
	}

}
