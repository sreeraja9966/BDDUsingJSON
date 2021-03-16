package com.sysnik.selenium.testCases.setUp;

import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeSuite;

import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.ConvertPropertyFileToMap;
import com.sysnik.selenium.fw.helper.DbHelper;
import com.sysnik.selenium.fw.helper.EmailHelper;
import com.sysnik.selenium.fw.helper.FilloExcelDataGetter;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.helper.SeleniumHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

public class SuiteSetUp extends TestBase {
    ReportHelper reportHelper = new ReportHelper();
    EmailHelper emailHelper = new EmailHelper();
    DbHelper dbHelper = new DbHelper();
    SeleniumHelper seleniumHelper = new SeleniumHelper();
    FilloExcelDataGetter filloExcelDataGetter = new FilloExcelDataGetter();
    AssertionHelper assertionHelper = new AssertionHelper();
    ConvertPropertyFileToMap convertPropertyFileToMap = new ConvertPropertyFileToMap();
    
    @BeforeSuite(groups = { "Regression", "All" })
    public void setReport() {
        reportHelper.setReportName("Automation");
        strartBrowser(
                filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet("select * from Login where Sno='1'", "Browser"));
        reportHelper.appendToExstingReport("Login ");
        reportHelper.ChildTest("Login Verification");
        
        reportHelper.writeLogInCaseOfPassInChildTest(
                filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet("select * from Login where Sno='1'", "Browser")
                        + " Browser Started");
        
        d.navigate()
                .to(filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet("select * from Login where Sno='1'", "URL"));
        
        d.navigate().refresh();
        d.navigate().refresh();
        d.navigate().refresh();
        try {
            Thread.sleep(10000);
        } catch (InterruptedException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        d.navigate().refresh();
        d.navigate().refresh();
        d.navigate().refresh();
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        d.navigate().refresh();
        d.navigate().refresh();
        d.navigate().refresh();
        d.navigate().refresh();
        d.navigate().refresh();
        d.navigate().refresh();
        seleniumHelper.enterText("Login_BankCode", filloExcelDataGetter
                .getDataFromaColumnOfAnExcellSheet("select * from Login where Sno='1'", "BankCode"));
        seleniumHelper.enterText("Login_userId",
                filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet("select * from Login where Sno='1'", "UserID"));
        seleniumHelper.enterText("Login_password", filloExcelDataGetter
                .getDataFromaColumnOfAnExcellSheet("select * from Login where Sno='1'", "Password"));
        seleniumHelper.clickElement("Login_loginButton");
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        /*
         * assertionHelper.verifyTextEquals("Verifying Menu Name on Landing Page", "//a[@href='#menucustomer']",
         * "Customer");
         */
        dbHelper.connectionEstablishmentWithDb();
        reportHelper.endChild();
        reportHelper.appendChild();
        reportHelper.endParent();
        reportHelper.writeLogToReport();
        
        /*
         * d.navigate().refresh(); d.navigate().refresh();
         */
        // filloExcelDataGetter.connectedToExcelDataFile();
        /*
         * d.manage().window().setSize(new Dimension(1440,900)); d.manage().window().fullscreen(); try { String line;
         * Process p = Runtime.getRuntime().exec (System.getenv("windir") +"\\system32\\"+"tasklist.exe");
         * BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream())); while ((line =
         * input.readLine()) != null) { System.out.println(line); //<-- Parse data here. } input.close(); } catch
         * (Exception err) { err.printStackTrace(); } log.info(d.getTitle()); try { Robot robo=new Robot();
         * robo.keyPress(KeyEvent.VK_ALT); robo.keyPress(KeyEvent.VK_TAB); robo.keyRelease(KeyEvent.VK_ALT);
         * robo.keyRelease(KeyEvent.VK_TAB);
         * 
         * 
         * 
         * while(!"CBS [ V3 ]".trim().equalsIgnoreCase(d.getTitle())) {
         * log.info("WHILE LOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOP");
         * 
         * robo.keyPress(KeyEvent.VK_ALT); robo.keyPress(KeyEvent.VK_TAB); robo.keyRelease(KeyEvent.VK_ALT);
         * robo.keyRelease(KeyEvent.VK_TAB); }
         * log.info(d.getTitle()+"erfdahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh456" + "64"); } catch (AWTException e)
         * { // TODO Auto-generated catch block e.printStackTrace(); }
         */
    }
    
    @AfterSuite
    public void tearDownThings() {
        filloExcelDataGetter.closeExcelConnection();
        // dbHelper.closeDbConnection();
        // emailHelper.sendReport("sriraja.garlapati@sysnik.com", "Sprint 3 TestCases",
        // "Sprint 3 Automation Report");
    }
}
