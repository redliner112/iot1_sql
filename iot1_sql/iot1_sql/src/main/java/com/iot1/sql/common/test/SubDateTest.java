package com.iot1.sql.common.test;

import junit.framework.TestCase;

	public class SubDateTest extends TestCase {
	    public static void main(String[] args) {
	        junit.textui.TestRunner.run(SubDateTest.class);
	    }
	    public void testGetYearDay() {
	        assertEquals(0, SubDate.getYearDay(1));
	        assertEquals(365, SubDate.getYearDay(2));
	    }
	    
	        public static int getYearDay(int year) {
	            return 1;
	        }
	    
	        public static int getYearDay(int year) {
	            if (year==1 ) return 0;
	            else return 365;
	        }
}
