package com.my.org.erp.example.util;

import java.util.ArrayList;
import java.util.List;

public class ArrayList4 {
  public static void main(String args[]) throws Exception {

    List<String> list = new ArrayList<String>();
    list.add("A");
    list.add("B");
    list.add("C");
    List<String> list2 = new ArrayList<String>();
    list2.add("X");
    list2.add("Y");
    list2.add("Z");
    list.addAll(list2);
    list.addAll(1, list2);

    System.out.println(list);
  }
}
