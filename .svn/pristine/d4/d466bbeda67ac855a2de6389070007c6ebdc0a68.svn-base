package com.sysnik.selenium.workspace;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class MatAmtCalCulation {

	public static void main(String[] args) {

		
		
		
		BigDecimal principal=new BigDecimal(5000);
		BigDecimal intRate=new BigDecimal(7.75);
		
		BigDecimal period=new BigDecimal(12);
		BigDecimal divisor=new BigDecimal(1200);
		BigDecimal half=new BigDecimal(12);
		BigDecimal matAmt=new BigDecimal(0);
		BigDecimal matAmt2=null;
		
		for(int i=1;i<=period.divide(half).intValue();i++) {
		 matAmt=(principal.multiply(intRate).multiply(half)).divide(divisor);

		 if(i<period.divide(half).intValue()) {
		 principal=matAmt.add(principal);
		 }
		}
		
		System.out.println(matAmt.add(principal).setScale(0,RoundingMode.HALF_UP));
		
		
	}
	
}
