package com.sysnik.selenium.workspace;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.sysnik.selenium.fw.helper.DropDownHelper;
import com.sysnik.selenium.fw.helper.SeleniumHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.stepConfiguraiton.CommonDefnitions;
import com.sysnik.selenium.stepConfiguraiton.LoginSteps;

public class Main extends TestBase{

	/*
	 * long walk=0; long Run=1; void Walking(int newValue) { walk=newValue; } void
	 * Running(int inc) { Run=Run+inc; } void Jogging(int inc) { Run=Run+inc; } void
	 * status() { System.out.println("Run -> "+Run+"\t Walk -> "+walk); } public
	 * static void main(String[] args) { Main obj1 = new Main(); Main obj2 = new
	 * Main(); obj1.Running(200); obj1.Walking(1000); obj1.Jogging(350);
	 * obj1.status(); obj2.Running(750); obj2.Walking(200); obj2.status(); }
	 */

	/*
	 * public static void main(String[] args) { int n=5; for(int i=0;i<n;i++) {
	 * for(int j=0;j<n;j++) { if((i+j)%2!=0) { System.out.print("S++"); } else {
	 * System.out.print(" "); } } System.out.println("");
	 * 
	 * } }
	 */

	/*
	 * public static void main(String[] args) { for (int a = 1; a < 5; a++) { String
	 * stringChars = ""; int x = 80; // ##ASCII value for (int b = 1; b <= a; b++) {
	 * stringChars = stringChars + (char) x + " + "; //
	 * System.out.println(stringChars); x++; } System.out.println("## " +
	 * stringChars.substring(2, stringChars.length()) + " ##"); } }
	 */
	public static void main(String[] args) throws Throwable {
		 LoginSteps name = new LoginSteps();
		 name.with("http://172.16.0.39:91/cbs");
		 name.enter_the_and("", "", "bank@123");
		 name.click_on_login();
		 CommonDefnitions name1 = new CommonDefnitions();
		 name1.user_is_on_screen("customer", "//a[@href='#full/customer_enrolment']");
		 d.findElement(By.id("addressDetails")).click();
		 DropDownHelper ddH = new DropDownHelper();
		 SeleniumHelper selH = new SeleniumHelper();
		 ddH.SelectUsingVisibleText("//select[@id='type']"," Unspecified");
		 
		 selH.enterText("//input[@id='address1']","Raja");
		 ddH.SelectUsingVisibleText("//select[@id='countryCode']","India");
		 selH.enterText("//input[@id='postalCode']","583201");
		 Thread.sleep(3000);
		 ddH.SelectUsingVisibleText("//select[@id='stateCode']","Karnataka");
		 ddH.SelectUsingVisibleText("//select[@id='cityVillage']","Bellari");
		 selH.clickElement("//input[@name='addRecord']");
		 Thread.sleep(3000);
ddH.SelectUsingVisibleText("//select[@id='type']","Business");
		 
		 selH.enterText("//input[@id='address1']","Raja");
		 ddH.SelectUsingVisibleText("//select[@id='countryCode']","India");
		 selH.enterText("//input[@id='postalCode']","583201");
		 Thread.sleep(3000);
		 ddH.SelectUsingVisibleText("//select[@id='stateCode']","Karnataka");
		 ddH.SelectUsingVisibleText("//select[@id='cityVillage']","Bellari");
		 selH.clickElement("//input[@name='addRecord']");
		 Thread.sleep(3000);
ddH.SelectUsingVisibleText("//select[@id='type']","Unspecified");
		 
		 selH.enterText("//input[@id='address1']","Raja");
		 ddH.SelectUsingVisibleText("//select[@id='countryCode']","India");
		 selH.enterText("//input[@id='postalCode']","583201");
		 Thread.sleep(3000);
		 ddH.SelectUsingVisibleText("//select[@id='stateCode']","Karnataka");
		 ddH.SelectUsingVisibleText("//select[@id='cityVillage']","Bellari");
		 selH.clickElement("//input[@name='addRecord']");
		 Thread.sleep(3000);
		List<WebElement>f= d.findElements(By.xpath("//div[@id='addressDetails']/table/tbody/tr/td[1]"));
		List<WebElement>r= d.findElements(By.xpath("//div[@id='addressDetails']/table/thead/tr/th"));
		System.out.println("******************************"+f.size());
		System.out.println("******************************"+r.size());
		for(WebElement ele:f) {
			System.out.println(ele.getText());
		}
	}
	
}
