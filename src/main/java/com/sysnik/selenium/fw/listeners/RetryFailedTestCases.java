package com.sysnik.selenium.fw.listeners;


	import org.apache.log4j.Logger;
import org.testng.IRetryAnalyzer;
	import org.testng.ITestResult;

import com.sysnik.selenium.fw.helper.WebTableHelper;

	public class RetryFailedTestCases implements IRetryAnalyzer {
		private static final Logger log = Logger.getLogger(RetryFailedTestCases.class);
	    private int retryCnt = 0;
	    //You could mentioned maxRetryCnt (Maximiun Retry Count) as per your requirement. Here I took 2, If any failed testcases then it runs two times
	    private int maxRetryCnt = 2;
	    
	    //This method will be called everytime a test fails. It will return TRUE if a test fails and need to be retried, else it returns FALSE
	    public boolean retry(ITestResult result) {
	        if (retryCnt < maxRetryCnt) {
	            log.info("Retrying " + result.getName() + " again and the count is " + (retryCnt+1));
	            retryCnt++;
	            return true;
	        }
	        return false;
	    }
	   
	
}
