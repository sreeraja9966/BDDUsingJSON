package com.sysnik.selenium.stepConfiguraiton;

import java.util.ArrayList;
import java.util.List;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AddressEntity;
import com.sysnik.selenium.entity.AuthTempEntity;
import com.sysnik.selenium.entity.CustomerContactEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.ModificationAuditLogEntity;
import com.sysnik.selenium.entity.OrganizationOperatorDetailsEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.CacheHelper;
import com.sysnik.selenium.fw.helper.CommonMethodsForVerifications;
import com.sysnik.selenium.fw.helper.ConvertPropertyFileToMap;
import com.sysnik.selenium.fw.helper.DateHelper;
import com.sysnik.selenium.fw.helper.DbHelper;
import com.sysnik.selenium.fw.helper.DropDownHelper;
import com.sysnik.selenium.fw.helper.FindElement;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.helper.RobotHelper;
import com.sysnik.selenium.fw.helper.SeleniumHelper;
import com.sysnik.selenium.fw.helper.WaitingHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

import cucumber.api.java.en.Then;

public class CustomerModification extends TestBase {
    
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
    DateHelper dateHelper = AutomationObjectFactory.getDateHelperInstance();
    
    private CustomerMasterEntity custMaster;
    private AuthTempEntity authTemp;
    private AddressEntity address;
    
    @Then("^setup Customer Modification Screen$")
    public void setup_Customer_Modification_Screen() throws Throwable {
        
        dbHelper.executeQuery(
                "DELETE FROM AUTH_TEMP WHERE ACC_ID IN (4557,4504,4505,4503,4506,4507,4508,4509,4510,4567,4569,4568,4572,4570,4571,4512,4511,4513,4514,4515,4516,4517,4518,4574,4575,4576,4577,4578)");
        dbHelper.executeQuery(
                "DELETE FROM MODIFICATION_AUDIT_LOG WHERE ACCOUNT_CUST_ID IN (4557,4504,4505,4503,4506,4507,4508,4509,4510,4568,4567,4569,4572,4570,4571,4512,4511,4513,4514,4515,4516,4517,4518,4574,4575,4576,4577,4578)");
        dbHelper.executeQuery(
                "UPDATE CUST_MASTER SET STATUS='A' WHERE STATUS='M' AND CUST_ID IN (4557,4504,4505,4503,4506,4507,4508,4509,4568,4510,4567,4569,4572,4570,4571,4512,4511,4513,4514,4515,4516,4517,4518,4574,4575,4576,4577,4578)");
    }
    
    @Then("^user enters customer number \"([^\"]*)\" on Customer Modification Screen$")
    public void user_enters_customer_number_on_Customer_Modification_Screen(String arg1) throws Throwable {
        
        seleniumHelper.enterText("CustomerModificationScreen_custNumber", arg1);
    }
    
    @Then("^user click on Others Details Tab of Entry$")
    public void user_click_on_Others_Details_Tab_of_Entry() throws Throwable {
        
        seleniumHelper.clickElement("CustomerModificationScreen_customerProfessionalDetailsTab");
    }
    
    @Then("^user click on Professional Details Tab of Entry$")
    public void user_click_on_Professional_Details_Tab_of_Entry() throws Throwable {
        
        seleniumHelper.clickElement("CustomerModificationScreen_customerOtherDetailsTab");
    }
    
    @Then("^user select Gross Income from dropdown \"([^\"]*)\"$")
    public void user_select_Gross_Income_from_dropdown(String arg1) throws Throwable {
        dbHelper.executeQuery("UPDATE CUST_MASTER SET GROSSINCOME='B1' WHERE CUST_ID=4508");
        dropDownHelper.SelectUsingVisibleText("CustomerModificationScreen_grossIncome", arg1);
    }
    
    @Then("^user click on Personal Details Tab$")
    public void user_click_on_Personal_Details_Tab() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_customerPersonalDetailsTab");
    }
    
    @Then("^user select married marital status from \"([^\"]*)\" dropdown$")
    public void user_select_married_marital_status_from_dropdown(String arg1) throws Throwable {
        dbHelper.executeQuery("UPDATE CUST_MASTER SET MARITAL_STATUS='S' WHERE CUST_ID='4505'");
        dropDownHelper.SelectUsingVisibleText("CustomerModificationScreen_maritalStatus", arg1);
    }
    
    @Then("^user click on Documents Details Tab$")
    public void user_click_on_Documents_Details_Tab() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_customerdocumentDetailsTab");
    }
    
    @Then("^user click on modify button$")
    public void user_click_on_modify_button() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_modifyButton");
        waitingHelper.sleep(3000);
    }
    
    @Then("^user select TDS EXEMPTION Yes or No \"([^\"]*)\"$")
    public void user_select_TDS_EXEMPTION_Yes_or_No(String arg1) throws Throwable {
        dbHelper.executeQuery("UPDATE CUST_MASTER SET TDS_EXEMPTION='N' WHERE CUST_ID in (4572,4507)");
        seleniumHelper.clickElement("CustomerModificationScreen_tdsExemptionY");
    }
    
    @Then("^user select TDSEXEMPTIONReason from dropdown \"([^\"]*)\"$")
    public void user_select_TDSEXEMPTIONReason_from_dropdown(String arg1) throws Throwable {
        
        dropDownHelper.SelectUsingVisibleText("CustomerModificationScreen_tDSReson", arg1);
    }
    
    @Then("^user click on Address Details Tab$")
    public void user_click_on_Address_Details_Tab() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_addressDetailsTab");
        waitingHelper.sleep(3000);
    }
    
    @Then("^user click on reject button$")
    public void user_click_on_reject_button() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_RejectButton");
    }
    
    @Then("^user click on Address Details table old data$")
    public void user_click_on_Address_Details_table_old_data() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_tableData");
        waitingHelper.sleep(3000);
    }
    
    @Then("^user select Address Type from dropdown \"([^\"]*)\"$")
    public void user_select_Address_Type_from_dropdown(String arg1) throws Throwable {
        dbHelper.executeQuery("UPDATE ADDRESS SET TYPE='R' WHERE CUST_ID in (4570,4509)");
        dropDownHelper.SelectUsingVisibleText("CustomerModificationScreen_type", arg1);
    }
    
    @Then("^user enters line(\\d+) address \"([^\"]*)\"$")
    public void user_enters_line_address(int arg1, String arg2) throws Throwable {
        seleniumHelper.enterText("CustomerModificationScreen_address1", arg2);
    }
    
    @Then("^user click on update button$")
    public void user_click_on_update_button() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_updateAddressButton");
        waitingHelper.sleep(4000);
    }
    
    @Then("^user click on Contact Details Tab$")
    public void user_click_on_Contact_Details_Tab() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_contactDetailsTab");
    }
    
    @Then("^user click on Contact Information table \"([^\"]*)\" old data$")
    public void user_click_on_Contact_Information_table_old_data(String arg1) throws Throwable {
        dbHelper.executeQuery(
                "UPDATE CUST_CONTACT SET VALUE='sysnik@gmail.com' WHERE CUST_ID in (4571,4510) and CONTACT_TYPE='EMAIL'");
        if ("1".equals(arg1)) {
            seleniumHelper.clickElement("CustomerModificationScreen_contact1");
            waitingHelper.sleep(3000);
        } else {
            seleniumHelper.clickElement("CustomerModificationScreen_contact2");
            waitingHelper.sleep(3000);
        }
    }
    
    @Then("^verify Constitution value \"([^\"]*)\" & \"([^\"]*)\" of Ui$")
    public void verify_Constitution_value_of_Ui(String arg1, String arg2) throws Throwable {
        
        assertionHelper.verifyTwoTexts("Validate Customer Old Value of Constitution On Ui ",
                dropDownHelper.getSelectedValue("CustomerModificationScreen_oldconstitution1"), arg1);
        assertionHelper.verifyTwoTexts("Validate Customer New Value of Constitution On Ui ",
                dropDownHelper.getSelectedValue("CustomerModificationScreen_constitution"), arg2);
    }
    
    @Then("^user enters updated email value \"([^\"]*)\"$")
    public void user_enters_updated_email_value(String arg1) throws Throwable {
        seleniumHelper.enterText("CustomerModificationScreen_contactnumber", arg1);
    }
    
    @Then("^user enters updated mobile value \"([^\"]*)\"$")
    public void user_enters_updated_mobile_value(String arg1) throws Throwable {
        seleniumHelper.enterText("CustomerModificationScreen_contactnumber", arg1);
    }
    
    @Then("^user click on update button of email$")
    public void user_click_on_update_button_of_email() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_updateContactButton");
    }
    
    @Then("^user enters postal address \"([^\"]*)\"$")
    public void user_enters_postal_address(String arg1) throws Throwable {
        seleniumHelper.enterText("CustomerModificationScreen_postalCode", arg1);
    }
    
    @Then("^user click on update button of mobile$")
    public void user_click_on_update_button_of_mobile() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_updateContactButton");
    }
    
    @Then("^user enters FirstName \"([^\"]*)\" & MiddleName \"([^\"]*)\" & LastName \"([^\"]*)\"$")
    public void user_enters_FirstName_MiddleName_LastName(String arg1, String arg2, String arg3) throws Throwable {
        dbHelper.executeQuery(
                "UPDATE CUST_MASTER SET CUST_FIRST_NAME='introducer', CUST_MIDDLE_NAME='Customer', CUST_LAST_NAME='G', FATHER_SPOUSE_FNAME='introducer', FATHER_SPOUSE_LNAME='G', CUST_NAME='introducer customer G', FATHER_SPOUSE_NAME='Gopi Krishna Garlapati' WHERE CUST_ID='4504'");
        seleniumHelper.enterText("CustomerModificationScreen_custFirstName", arg1);
        seleniumHelper.enterText("CustomerModificationScreen_custMiddleName", arg2);
        seleniumHelper.enterText("CustomerModificationScreen_custLastName", arg3);
    }
    
    @Then("^user verify Customer full Name on Ui$")
    public void user_verify_Customer_full_Name_on_Ui() throws Throwable {
        assertionHelper.verifyTextEquals("Verifying Customer Full Name On Ui ", "CustomerModificationScreen_custName",
                "Sahil Sandesh Kadam");
    }
    
    @Then("^user enters FatherFirstName \"([^\"]*)\" & FatherLastName \"([^\"]*)\"$")
    public void user_enters_FatherFirstName_FatherLastName(String arg1, String arg2) throws Throwable {
        seleniumHelper.enterText("CustomerModificationScreen_fatherSpouseFname", arg1);
        seleniumHelper.enterText("CustomerModificationScreen_fatherSpouseLname", arg2);
    }
    
    @Then("^user verify father full Name on Ui$")
    public void user_verify_father_full_Name_on_Ui() throws Throwable {
        assertionHelper.verifyTextEquals("Verifying Customer Full Name On Ui ",
                "CustomerModificationScreen_fatherSpouseName", "Sandesh Krishna Kadam");
    }
    
    @Then("^user click on Professional Details Tab$")
    public void user_click_on_Professional_Details_Tab() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_customerProfessionalDetailsTab");
    }
    
    @Then("^user select residential status from dropdown \"([^\"]*)\"$")
    public void user_select_residential_status_from_dropdown(String arg1) throws Throwable {
        dbHelper.executeQuery("UPDATE CUST_MASTER SET RESIDENTIAL='R' WHERE CUST_ID=4506");
        dropDownHelper.SelectUsingVisibleText("CustomerModificationScreen_residential", arg1);
    }
    
    @Then("^user click on Others Details Tab$")
    public void user_click_on_Others_Details_Tab() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_customerOtherDetailsTab");
    }
    
    @Then("^user select Form(\\d+)/(\\d+) and select form (\\d+)$")
    public void user_select_Form_and_select_form(int arg1, int arg2, int arg3) throws Throwable {
        dbHelper.executeQuery(
                "UPDATE CUST_MASTER SET PAN_NO='KMYTP8935E', FORMS_60_61=NULL, RISK_GRADE='L' WHERE CUST_ID=4503");
        waitingHelper.sleep(3000);
        seleniumHelper.clickElement("CustomerModificationScreen_form6061");
        seleniumHelper.clickElement("CustomerModificationScreen_forms60610");
    }
    
    @Then("^user select risk grade from dropdown \"([^\"]*)\"$")
    public void user_select_risk_grade_from_dropdown(String arg1) throws Throwable {
        
        dropDownHelper.SelectUsingVisibleText("CustomerModificationScreen_RiskGrade", arg1);
    }
    
    @Then("^user click on Orgnization Details Tab$")
    public void user_click_on_Orgnization_Details_Tab() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_organizationDetailsTab");
    }
    
    @Then("^user click on Others Details Tab for Non Ind\\. Customer$")
    public void user_click_on_Others_Details_Tab_for_Non_Ind_Customer() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_otherDetailsTab");
    }
    
    @Then("^user select Private Ltd Company Constitution from \"([^\"]*)\" dropdown$")
    public void user_select_Private_Ltd_Company_Constitution_from_dropdown(String arg1) throws Throwable {
        dbHelper.executeQuery("UPDATE CUST_MASTER SET CONSTITUTION='PROP' WHERE CUST_ID=4567");
        dropDownHelper.SelectUsingVisibleText("CustomerModificationScreen_constitution", arg1);
    }
    
    @Then("^user click on Operator Details Tab$")
    public void user_click_on_Operator_Details_Tab() throws Throwable {
        dbHelper.executeQuery(
                "UPDATE ORGANISATION_OPERATOR_DETAILS SET OPR_TYPE='P', OPR_ID=4575 WHERE CUST_ID in (4574)");
        waitingHelper.sleep(3000);
        seleniumHelper.clickElement("CustomerModificationScreen_kartaPartnersDetails");
    }
    
    @Then("^user click on Operator Details Table Data Row(\\d+)$")
    public void user_click_on_Operator_Details_Table_Data_Row(int arg1) throws Throwable {
        
        seleniumHelper.clickElement("CustomerModificationScreen_kartaPartnersTableDetails");
    }
    
    @Then("^user enters other operator number \"([^\"]*)\"$")
    public void user_enters_other_operator_number(String arg1) throws Throwable {
        seleniumHelper.enterText("CustomerModificationScreen_operatorNumber", arg1);
    }
    
    @Then("^user select Director operator type from \"([^\"]*)\" dropdown$")
    public void user_select_Director_operator_type_from_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("CustomerModificationScreen_operatorType", arg1);
    }
    
    @Then("^verify Operator value \"([^\"]*)\" & \"([^\"]*)\" on Ui$")
    public void verify_Operator_value_on_Ui(String arg1, String arg2) throws Throwable {
        
        assertionHelper.verifyTextEquals("Verify Operator Number on Ui ", "CustomerModificationScreen_operatorNum",
                arg1);
        assertionHelper.verifyTextEquals("Verify Operator Name on Ui ", "CustomerModificationScreen_operatorName",
                arg2);
    }
    
    @Then("^user click on update button of operator$")
    public void user_click_on_update_button_of_operator() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_updateOperatorButton");
        waitingHelper.sleep(3000);
    }
    
    @Then("^user click on authorize button$")
    public void user_click_on_authorize_button() throws Throwable {
        seleniumHelper.clickElement("CustomerModificationScreen_authorizeButton");
    }
    
    @Then("^verify cust_master table status \"([^\"]*)\" & cust Number \"([^\"]*)\" & flow \"([^\"]*)\" & scenario \"([^\"]*)\"$")
    public void verify_cust_master_table_status_cust_Number_flow_scenario(String arg1, String arg2, String arg3,
            String arg4) throws Throwable {
        custMaster = customerMasterService.findCustNumber(arg2);
        if ("Entry".equalsIgnoreCase(arg3)) {
            assertionHelper.verifyTwoTexts("Verifying Cust_Master Table Status ", custMaster.getStatus(), arg1);
        } else {
            assertionHelper.verifyTwoTexts("Verifying Cust_Master Table Status ", custMaster.getStatus(), arg1);
            
            if ("maritalStatus".equalsIgnoreCase(arg4)) {
                assertionHelper.verifyTwoTexts("Verifying Cust_Master Table Modified Marital Status ",
                        custMaster.getMaritalStatus(), "M");
            }
            if ("nameChange".equalsIgnoreCase(arg4)) {
                assertionHelper.verifyTwoTexts("Verifying Cust_Master Table Modified Cust First Name ",
                        custMaster.getCustFirstName(), "Sahil");
                assertionHelper.verifyTwoTexts("Verifying Cust_Master Table Modified Cust Middle Name ",
                        custMaster.getCustMiddleName(), "Sandesh");
                assertionHelper.verifyTwoTexts("Verifying Cust_Master Table Modified Cust Last Name ",
                        custMaster.getCustLastName(), "Kadam");
                assertionHelper.verifyTwoTexts("Verifying Cust_Master Table Modified Father/Spouse First Name ",
                        custMaster.getFatherSpouseFname(), "Sandesh");
                assertionHelper.verifyTwoTexts("Verifying Cust_Master Table Modified Father/Spouse Last Name ",
                        custMaster.getFatherSpouseLname(), "Kadam");
            }
            if ("form60".equalsIgnoreCase(arg4)) {
                assertionHelper.verifyTwoTexts("Validate Form6061 Value in Cust_Master Table: ",
                        custMaster.getForms6061(), "0");
                assertionHelper.verifyTwoTexts("Validate Risk Grade in Cust_Master Table: ", custMaster.getRiskGrade(),
                        "H");
            }
            if ("residential".equalsIgnoreCase(arg4)) {
                assertionHelper.verifyTwoTexts("Validate Customer Residential Status Value in Cust_Master Table: ",
                        custMaster.getResidential(), "D");
            }
            if ("tds".equalsIgnoreCase(arg4)) {
                
                assertionHelper.verifyTwoTexts("Validate Customer TDS Exemption Value in Cust_Master Table: ",
                        custMaster.getTdsExemption(), "Y");
                assertionHelper.verifyTwoTexts("Validate Customer TDS Exemption Reason Value in Cust_Master Table: ",
                        custMaster.getTdsExmptResCd(), "B");
            }
            if ("grossIncome".equalsIgnoreCase(arg4)) {
                assertionHelper.verifyTwoTexts("Validate Customer Gross Income Value in Cust_Master Table: ",
                        custMaster.getGrossIncome(), "10");
            }
            
            if ("address".equalsIgnoreCase(arg4)) {
                
                custMaster = customerMasterService.findCustNumber(arg2);
                address = addressService.findByCustNumber(arg2);
                
                assertionHelper.verifyTwoTexts("Validate Customer ID in Address Table: ",
                        address.getCustId().toString(), custMaster.getCustId().toString());
                assertionHelper.verifyTwoTexts("Validate Address Type in Address Table: ", address.getType(), "RO");
                assertionHelper.verifyTwoTexts("Validate Address 1 in Address Table: ", address.getAddress1(),
                        "Om Chambers Bhosari");
                assertionHelper.verifyTwoTexts("Validate Country Code in Address Table: ", address.getCountryCode(),
                        "IN");
                assertionHelper.verifyTwoTexts("Validate State Code in Address Table: ", address.getStateCode(), "MH");
                assertionHelper.verifyTwoTexts("Validate City Village in Address Table: ", address.getCityVillage(),
                        "Pune");
            }
            
            if ("contact".equalsIgnoreCase(arg4)) {
                custMaster = customerMasterService.findCustNumber(arg2);
                List<CustomerContactEntity> custContactList = new ArrayList<>();
                custContactList = customerContactService.findByCustId(custMaster.getCustId());
                
                assertionHelper.verifyTwoTexts("Validate Customer ID in Customer Contact Table: ",
                        custContactList.get(0).getCustId().toString(), custMaster.getCustId().toString());
                for (CustomerContactEntity custContact : custContactList) {
                    
                    if (custContact.getContactType().equalsIgnoreCase("EMAIL")) {
                        if (custContact.getValue().equalsIgnoreCase("sarika.shingate@sysnik.com"))
                            assertionHelper.verifyTwoTexts(
                                    "Validate Customer Modified Email Value in Cust_Contact Table: ",
                                    custContact.getValue(), "sarika.shingate@sysnik.com");
                    }
                    if (custContact.getContactType().equalsIgnoreCase("MOB")) {
                        if (custContact.getValue().equalsIgnoreCase("9822567832"))
                            assertionHelper.verifyTwoTexts(
                                    "Validate Customer Modified Mobile Value in Cust_Contact Table: ",
                                    custContact.getValue(), "9822567832");
                    }
                }
                
            }
            if ("operator".equalsIgnoreCase(arg4)) {
                custMaster = customerMasterService.findCustNumber(arg2);
                List<OrganizationOperatorDetailsEntity> OrgOperatorDetailsList = new ArrayList<>();
                OrgOperatorDetailsList = organizationOperatorDetailsService.findByCustNumber(arg2);
                
                assertionHelper.verifyTwoTexts("Validate Operator ID in ORGANISATION_OPERATOR_DETAILS Table: ",
                        OrgOperatorDetailsList.get(0).getOperatorId().toString(), "4568");
                assertionHelper.verifyTwoTexts("Validate Operator Status in ORGANISATION_OPERATOR_DETAILS Table: ",
                        OrgOperatorDetailsList.get(0).getStatus(), "A");
                assertionHelper.verifyTwoTexts("Validate Operator Name in ORGANISATION_OPERATOR_DETAILS Table: ",
                        OrgOperatorDetailsList.get(0).getOperatorName(), custMaster.getCustName());
                
                assertionHelper.verifyTwoTexts("Validate Operator Type in ORGANISATION_OPERATOR_DETAILS Table: ",
                        OrgOperatorDetailsList.get(0).getOperatorType(), "D");
            }
            
            if ("constitution".equalsIgnoreCase(arg4)) {
                assertionHelper.verifyTwoTexts("Validate Customer Constitution Value in Cust_Master Table: ",
                        custMaster.getConstitution(), "PRLC");
            }
        }
        
    }
    
    @Then("^verify cust_master table status \"([^\"]*)\" & cust Number \"([^\"]*)\" & flow \"([^\"]*)\" After Rejection$")
    public void verify_cust_master_table_status_cust_Number_flow_After_Rejection(String arg1, String arg2, String arg3)
            throws Throwable {
        custMaster = customerMasterService.findCustNumber(arg2);
        if ("Rejection".equalsIgnoreCase(arg3)) {
            assertionHelper.verifyTwoTexts("Verifying Cust_Master Table Status After Rejection: ",
                    custMaster.getStatus(), arg1);
        }
    }
    
    @Then("^verify Old \"([^\"]*)\" & New \"([^\"]*)\" & Reason \"([^\"]*)\" value of TDS on Ui$")
    public void verify_Old_New_Reason_value_of_TDS_on_Ui(String arg1, String arg2, String arg3) throws Throwable {
        
        assertionHelper.verifyTextEquals("Validate Customer Old TDS Exemption Flag On Ui ",
                "CustomerModificationScreen_oldtdsExemption1N", arg1);
        assertionHelper.verifyTextEquals("Validate Customer New TDS Exemption Flag On Ui ",
                "CustomerModificationScreen_tdsExemptionY", arg2);
        waitingHelper.sleep(3000);
        assertionHelper.verifyTwoTexts("Validate Customer TDS Exemption Reason On Ui ",
                dropDownHelper.getSelectedValue("CustomerModificationScreen_tDSReson"), arg3);
        
    }
    
    @Then("^verify Old \"([^\"]*)\" & New \"([^\"]*)\" value of Gross Income on Ui$")
    public void verify_Old_New_value_of_Gross_Income_on_Ui(String arg1, String arg2) throws Throwable {
        
        assertionHelper.verifyTwoTexts("Validate Customer Old Value of Gross Income On Ui ",
                dropDownHelper.getSelectedValue("CustomerModificationScreen_OldgrossIncome"), arg1);
        
        assertionHelper.verifyTwoTexts("Validate Customer New Value of Gross Income On Ui ",
                dropDownHelper.getSelectedValue("CustomerModificationScreen_grossIncome"), arg2);
    }
    
    @Then("^verify AddressType \"([^\"]*)\" & Line(\\d+)Address \"([^\"]*)\" value of Address on Ui$")
    public void verify_AddressType_Line_Address_value_of_Address_on_Ui(String arg1, int arg2, String arg3)
            throws Throwable {
        waitingHelper.sleep(3000);
        assertionHelper.verifyTextEquals("Validate Customer Address Type On Ui ",
                "CustomerModificationScreen_addressType", arg1);
        assertionHelper.verifyTextEquals("Validate Customer Detailed Address On Ui ",
                "CustomerModificationScreen_addressDetails", arg3);
    }
    
    @Then("^verify Email \"([^\"]*)\" & Mobile \"([^\"]*)\" value of Contact Details on Ui$")
    public void verify_Email_Mobile_value_of_Contact_Details_on_Ui(String arg1, String arg2) throws Throwable {
        
        assertionHelper.verifyTextEquals("Validate Customer Address Type On Ui ",
                "CustomerModificationScreen_contactEmail", arg1);
        assertionHelper.verifyTextEquals("Validate Customer Detailed Address On Ui ",
                "CustomerModificationScreen_contactMobile", arg2);
    }
    
    @Then("^verify auth_temp table where cust Number \"([^\"]*)\"$")
    public void verify_auth_temp_table_where_cust_Number(String arg1) throws Throwable {
        authTemp = authTempService.findByCustNumber(arg1);
        assertionHelper.verifyTwoTexts("Verifying Cust_ID Of Auth_Temp Table with Cust_Master Table  ",
                custMaster.getCustId().toString(), authTemp.getAccId().toString());
        assertionHelper.verifyTwoTexts("Validate Effective Date in Auth_Temp Table ",
                authTemp.getEffectiveDate().toString(),
                branchParametersService.getBnrachLiveDate(property.getProperty("BranchCode")).toString());
        
        assertionHelper.verifyTwoTexts("Validate Modified Branch in Auth_Temp Table ", authTemp.getModifiedBranch(),
                branchParametersService.getBrachCode(property.getProperty("BranchCode")));
    }
    
    @Then("^verify modification_audit_log table where cust Number \"([^\"]*)\" & flow \"([^\"]*)\"$")
    public void verify_modification_audit_log_table_where_cust_Number_flow(String arg1, String arg2) throws Throwable {
        authTemp = authTempService.findByCustNumber(arg1);
        List<ModificationAuditLogEntity> modAuditLogList = new ArrayList<>();
        modAuditLogList = modificationAuditLogService.findByCustNumber(arg1);
        
        if ("Entry".equalsIgnoreCase(arg2)) {
            assertionHelper.verifyTwoTexts("Verifying Modification_audit_Log table status ",
                    modAuditLogList.get(0).getStatus(), "E");
            assertionHelper.verifyTwoTexts("Verifying Modification_audit_Log table Cust_ID With Auth Temp Table ",
                    modAuditLogList.get(0).getAccountCustId().toString(), authTemp.getAccId().toString());
            assertionHelper.verifyTwoTexts("Validate Modified IP in Modification_Audit_Log Table ",
                    modAuditLogList.get(0).getModifiedIp(), getSystemIP());
        }
        if ("Rejection".equalsIgnoreCase(arg2)) {
            assertionHelper.verifyTwoTexts("Validate Status in Modification_Audit_Log Table After Rejection: ",
                    modAuditLogList.get(0).getStatus(), "R");
        }
        if ("Auth".equalsIgnoreCase(arg2)) {
            assertionHelper.verifyTwoTexts("Verifying Modification_audit_Log table status ",
                    modAuditLogList.get(0).getStatus(), "A");
        }
        
    }
    
    @Then("^user select country \"([^\"]*)\" from dropdown$")
    public void user_select_country_from_dropdown(String arg1) throws Throwable {
        dropDownHelper.SelectUsingVisibleText("CustomerModificationScreen_countryCode", arg1);
    }
    
    @Then("^user select customer number \"([^\"]*)\" & \"([^\"]*)\" from dropdown on Customer Modification Auth Screen$")
    public void user_select_customer_number_from_dropdown_on_Customer_Modification_Auth_Screen(String arg1, String arg2)
            throws Throwable {
        String AuthCustNumber = arg1 + " - " + arg2;
        dropDownHelper.SelectUsingVisibleText("CustomerModificationScreen_authCustNumber", AuthCustNumber);
        waitingHelper.sleep(3000);
    }
    
    @Then("^verify Old \"([^\"]*)\" & New \"([^\"]*)\" value of marital status on Ui$")
    public void verify_Old_New_value_of_marital_status_on_Ui(String arg1, String arg2) throws Throwable {
        assertionHelper.verifyTwoTexts("Verify Old Value of Marital Status ",
                dropDownHelper.getSelectedValue("CustomerModificationScreen_oldMaritalStatus"), arg1);
        
        assertionHelper.verifyTwoTexts("Verify New Value of Marital Status ",
                dropDownHelper.getSelectedValue("CustomerModificationScreen_newMaritalStatus"), arg2);
    }
    
    @Then("^verify AddressType \"([^\"]*)\" & AddressDeatils \"([^\"]*)\" & PostalCode \"([^\"]*)\" value of Address on Ui$")
    public void verify_AddressType_AddressDeatils_PostalCode_value_of_Address_on_Ui(String arg1, String arg2,
            String arg3) throws Throwable {
        assertionHelper.verifyTextEquals("Verify Address Type of Customer ",
                "CustomerModificationScreen_authAddressType", arg1);
        assertionHelper.verifyTextEquals("Verify Address Details of Customer ",
                "CustomerModificationScreen_authAddressDetails", arg2);
        assertionHelper.verifyTextEquals("Verify Postal Address of Customer ",
                "CustomerModificationScreen_authPostalCode", arg3);
    }
    
    @Then("^verify Old \"([^\"]*)\" & New \"([^\"]*)\" value of customer & father old name \"([^\"]*)\" & father new name \"([^\"]*)\" name on Ui$")
    public void verify_Old_New_value_of_customer_father_old_name_father_new_name_name_on_Ui(String arg1, String arg2,
            String arg3, String arg4) throws Throwable {
        assertionHelper.verifyTextEquals("Verify Old Value of Customer Name ", "CustomerModificationScreen_oldcustName",
                arg1);
        assertionHelper.verifyTextEquals("Verify New Value of Customer Name ", "CustomerModificationScreen_newcustName",
                arg2);
        assertionHelper.verifyTextEquals("Verify Old Value of Customer Father Name ",
                "CustomerModificationScreen_oldfatherSpouseName", arg3);
        assertionHelper.verifyTextEquals("Verify New Value of Customer Father Name ",
                "CustomerModificationScreen_newfatherSpouseName", arg4);
    }
    
    @Then("^verify Old \"([^\"]*)\" & New \"([^\"]*)\" value of PAN & risk Grade \"([^\"]*)\" & \"([^\"]*)\" on Ui$")
    public void verify_Old_New_value_of_PAN_risk_Grade_on_Ui(String arg1, String arg2, String arg3, String arg4)
            throws Throwable {
        waitingHelper.sleep(3000);
        assertionHelper.verifyTextEquals("Verify Old Value of PAN/Declaration ",
                "CustomerModificationScreen_PanAvailable", arg1);
        assertionHelper.verifyTextEquals("Verify New Value of PAN/Declaration ", "CustomerModificationScreen_form6061",
                arg2);
        assertionHelper.verifyTwoTexts("Verify Old Value of Risk Grade On Ui ",
                dropDownHelper.getSelectedValue("CustomerModificationScreen_oldriskGrade"), arg3);
        assertionHelper.verifyTwoTexts("Verify New Value of Risk Grade On Ui ",
                dropDownHelper.getSelectedValue("CustomerModificationScreen_newriskGrade"), arg4);
    }
    
    @Then("^verify Old \"([^\"]*)\" & New \"([^\"]*)\" value of residential on Ui$")
    public void verify_Old_New_value_of_residential_on_Ui(String arg1, String arg2) throws Throwable {
        waitingHelper.sleep(3000);
        assertionHelper.verifyTwoTexts("Verify Old Value of Residential ",
                dropDownHelper.getSelectedValue("CustomerModificationScreen_oldResidential"), arg1);
        assertionHelper.verifyTwoTexts("Verify New Value of Residential ",
                dropDownHelper.getSelectedValue("CustomerModificationScreen_residential"), arg2);
    }
    
}
