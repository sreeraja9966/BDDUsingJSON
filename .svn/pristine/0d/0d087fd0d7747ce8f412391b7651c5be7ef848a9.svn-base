package com.sysnik.selenium.stepConfiguraiton;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.CacheHelper;
import com.sysnik.selenium.fw.helper.CommonMethodsForVerifications;
import com.sysnik.selenium.fw.helper.ConvertPropertyFileToMap;
import com.sysnik.selenium.fw.helper.DbHelper;
import com.sysnik.selenium.fw.helper.DropDownHelper;
import com.sysnik.selenium.fw.helper.FindElement;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.helper.RobotHelper;
import com.sysnik.selenium.fw.helper.SeleniumHelper;
import com.sysnik.selenium.fw.helper.WaitingHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class BankReconFileUploadstepDef extends TestBase {
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    FindElement findElement = AutomationObjectFactory.getFindElementInstance();
    SeleniumHelper seleniumHelper = AutomationObjectFactory.getSeleniumHelperInstance();
    ConvertPropertyFileToMap convertPropertyFileToMap = AutomationObjectFactory.getConvertPropertyFileToMapInstance();
    RobotHelper robotHelper = AutomationObjectFactory.getRobotHelperInstance();
    DropDownHelper dropDownHelper = AutomationObjectFactory.getDropDownHelperInstance();
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    CacheHelper cacheHelper = AutomationObjectFactory.getCacheHelperInstance();
    DbHelper dbHelper = AutomationObjectFactory.getDbHelperInstance();
    CommonMethodsForVerifications commonMethodsForVerifications = AutomationObjectFactory
            .getCommonMethodsForVerificationsInstance();
    WaitingHelper waitingHelper = AutomationObjectFactory.getWaitingHelperInstance();
    
    @Then("^setup BRFileUploadScreen$")
    public void setup_BRFileUploadScreen() throws Throwable {
        dbHelper.executeQuery("Delete from RECONC_TRANSACTION");
        dbHelper.executeQuery("UPDATE GROUP_MASTER SET RECON_UPTO ='2018-08-22'");
    }
    
    @Then("^verify \"([^\"]*)\" \"([^\"]*)\" is read only format$")
    public void verify_is_read_only_format(String arg1, String arg2) throws Throwable {
        assertionHelper.verifyTwoTexts("Verifying Recon Data Till Date",
                seleniumHelper.getTextFromAnElement("BankReconciliationFileUpload_reconUpToDate"), arg1);
        assertionHelper.verifyTwoTexts("Verifying Last Data uploaded Till Date",
                seleniumHelper.getTextFromAnElement("BankReconciliationFileUpload_uploadedUpTodate"), arg2);
    }
    
    @When("^user select Browse option select text file from \"([^\"]*)\" for \"([^\"]*)\"$")
    public void user_select_Browse_option_select_text_file_from(String arg1, String arg2) throws Throwable {
        dbHelper.executeQuery("UPDATE FILE_FORMAT_DETAILS SET HEADER_COL_SEPERATION_TYPE='" + arg2
                + "', DATA_COL_SEPERATION_TYPE='" + arg2 + "' WHERE STORY_TYPE ='RECON_UPLOAD'");
        seleniumHelper.clickElement("BankReconciliationFileUpload_uploadedUpTodate");
        robotHelper.pressTab();
        robotHelper.pressEnter();
        
        try {
            robotHelper.fileUploadUsingRobot(relativePath() + arg1);
        } catch (Exception e) {
            reportHelper.writeLogInCaseOfFail("File not Found in the mentioned path=====>" + relativePath() + arg1);
        }
    }
    
    @Then("^display two record\"([^\"]*)\"is display$")
    public void display_two_record_is_display(String arg1) throws Throwable {
        
    }
    
    @When("^user click on confirm button on model in Bank Reconcilation screen$")
    public void user_click_on_confirm_button_on_model_in_Bank_Reconcilation_screen() throws Throwable {
        seleniumHelper.clickElement("BankReconciliationFileUpload_ConfrimButton");
    }
    
    @When("^user click on Submit button on Bank Reconcilation file upload screen$")
    public void user_click_on_Submit_button_on_Bank_Reconcilation_file_upload_screen() throws Throwable {
        seleniumHelper.clickElement("BankReconciliationFileUpload_SubmitButton");
        waitingHelper.sleep(2500);
    }
    
    @Then("^verify Reconc Transaction table status col with \"([^\"]*)\"$")
    public void verify_Reconc_Transaction_table_status_col_with(String arg1) throws Throwable {
        
    }
    
}
