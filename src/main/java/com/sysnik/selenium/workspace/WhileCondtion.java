package com.sysnik.selenium.workspace;

import java.util.HashSet;
import java.util.TreeSet;

public class WhileCondtion {
public static void main(String[] args) {

		      HashSet<String> hashSet = new HashSet<String>();
		      TreeSet<String> treeSet = new TreeSet<String>();
		      hashSet.add("Good");
		      hashSet.add("For");
		      hashSet.add("Health");
		      //Add Duplicate Element
		      System.out.println(hashSet.add(null));
//		      System.out.println(treeSet.add(null));
		      System.out.println("HashSet: ");
		      for (String temp : hashSet) {
		         System.out.println(temp);
		     
		}
	}
	

public static boolean alert() {
	return false;
}
}
