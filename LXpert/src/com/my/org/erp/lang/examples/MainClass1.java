package com.my.org.erp.lang.examples;

public class MainClass1 {

	  static void vaTest(String msg, int... v) {
	    System.out.print(msg + v.length + " Contents: ");

	    for (int x : v) {
	      System.out.print(x + " ");
	    }
	    System.out.println();
	  }

	  public static void main(String args[]) {
	    vaTest("One vararg: ", 10);
	    vaTest("Three varargs: ", 1, 2, 3);
	    vaTest("No varargs: ");
	  }
	}
