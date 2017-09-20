package com.iot1.sql.common.test;


import static org.junit.Assert.assertEquals;


import org.junit.Test;

public class CalTest {

   @Test
   public void testPlus(){
      Cal c = new Cal();
      int result = c.plus(20, 20);
      assertEquals("20+20=40", 40, result);
   }
}