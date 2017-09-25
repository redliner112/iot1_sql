package com.iot1.sql.test2;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HelloMain {
	
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("test/intel.xml");
		IPrintMsg printMsg = (IPrintMsg) ctx.getBean("printMsg");
		printMsg.hello1();
		printMsg.hello2();

	}	

}
