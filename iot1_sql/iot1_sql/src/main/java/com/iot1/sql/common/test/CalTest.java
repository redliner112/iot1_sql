package com.iot1.sql.common.test;


import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CalTest {

	   Cal tdd;

	   @Before
	   public void setUpBefore() throws Exception {
	      System.out.println(tdd);
	      tdd = new Cal();
	      System.out.println(tdd);
	   }

	   @Test
	   public void testPlus() {
	      int result = tdd.plus(10, 20);
	      assertEquals("10+20=30",30, result);
	   }

	   @Test
	   public void testMinus() {
	      int result = tdd.minus(20, 10);
	      assertEquals("20-10=10", 10, result);
	   }

	   @Test
	   public void testDivision() {
	      int result = tdd.division(20,10);
	      assertEquals("20/10=2", 2 , result);
	   }

	   @Test
	   public void testMultiple() {
	      int result = tdd.multiple(10, 20);
	      assertEquals("10*20=200", 200, result);
	   }
	   @After
	   public void setUpAfter() throws Exception {
	      System.out.println(tdd);
	      tdd = null;
	   }
	}