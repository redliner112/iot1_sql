package com.iot1.sql.test;

public class PrintMsg implements IprintMsg{

	@Override
	public void hello() {
		System.out.println("hello1");
	}
	@Override
	public void hello1() {
		System.out.println("hello2");
	}
	@Override
	public void hello2() {
		System.out.println("hello3");
		
	}

}
