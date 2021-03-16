package com.sysnik.selenium.stepConfiguraiton;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;

import com.sysnik.selenium.fw.testBase.TestBase;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;

public class Test extends TestBase {
	@Given("^user enter$")
	public void user_enter(DataTable arg1) throws Throwable {
	 List< List<String>> l=arg1.asLists(String.class);
	  for(List<String> e:l)
	 log.info(e+"************************************");
	}
	@Given("^user clicks$")
	public void user_c() throws Throwable {
	 
	  log.info("Click"+"************************************");
	}
	@Given("^user ends$")
	public void user_e(DataTable arg1) throws Throwable {
	 List< Map<String,String>> l=arg1.asMaps(String.class, String.class);
	 
	 log.info(l+"************************************");
	 d.findElement(By.xpath("")).submit();
	}
}
