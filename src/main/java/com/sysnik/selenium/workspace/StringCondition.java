package com.sysnik.selenium.workspace;

import java.util.Arrays;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class StringCondition {
	public static void main(String[] args) {
//	String n="2020-02-01";
//	String x=n.charAt(4)+"";
//	if("-".equals(x)) {
//		System.out.println("ssssssssssss");
//	}
//	System.out.println(n.indexOf(4));
//

		/*
		 * String splitedQuires[] =
		 * "select TOP 1 account_Master.acc_no from account_Master JOIN CUST_MASTER ON ACCOUNT_MASTER.cust_id=CUST_MASTER.cust_id JOIN CUSTOMER_ACCOUNT ON ACCOUNT_MASTER.ACC_ID =CUSTOMER_ACCOUNT.ACC_ID  WHERE ACCOUNT_MASTER.STATUS ='A' AND  ACCOUNT_MASTER.ACC_TYPE ='SB' AND ACCOUNT_MASTER.FREEZE='N' AND CUST_MASTER.STATUS='A' AND CUST_MASTER.FREEZE='T'  and account_master.SHADOW_BAL=0 and account_master.BRANCH_CODE=2101 and account_master.available_bal>5000 @ UPDATE CUST_MASTER  SET FREEZE ='T' WHERE CUST_ID IN (select TOP 1 account_Master.cust_id from account_Master JOIN CUST_MASTER ON ACCOUNT_MASTER.cust_id=CUST_MASTER.cust_id JOIN CUSTOMER_ACCOUNT ON ACCOUNT_MASTER.ACC_ID =CUSTOMER_ACCOUNT.ACC_ID  WHERE ACCOUNT_MASTER.STATUS ='A' AND ACCOUNT_MASTER.ACC_TYPE ='SB' AND ACCOUNT_MASTER.FREEZE='N' AND CUST_MASTER.STATUS='A' AND CUST_MASTER.FREEZE='N' and account_master.SHADOW_BAL=0 and account_master.BRANCH_CODE=2101 AND AVAILABLE_BAL > 5000)"
		 * .split(Pattern.quote("@")); String query1 = splitedQuires[0]; if
		 * (query1.equals(null)) { if (splitedQuires[1].contains("&")) { String
		 * secondSplit[] = splitedQuires[1].split("&"); for (String queries :
		 * secondSplit) { System.out.println(queries); } } else {
		 * System.out.println(splitedQuires[1]); }
		 * 
		 * }
		 */
		
		/*
		 * String r="dontbestaticanywhere"; if(r.contains("static")) {
		 * System.out.println("ssssssss"); } else { System.out.println("NNNNN"); }
		 */
		
		String seq[]="a,b,c,d".split(",");
		System.out.println(seq);
		
		for(String s:seq) {
			System.out.println(s);
		}
		
		String[] movies= {"A","B","C"};
		List<String>a=Arrays.asList(movies);
		System.out.println(a);
		Thunder(null);
		WebDriver d=new ChromeDriver();
		d.findElement(By.xpath(""));
		
	}
	public static void Thunder(Object obj) {
		System.out.println("Object");
	}
	public static void Thunder(String str) {
		System.out.println("String");
	}
}
