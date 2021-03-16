package com.sysnik.selenium.apiActions;

import org.json.JSONObject;

import com.sysnik.selenium.fw.helper.DateHelper;
import com.sysnik.selenium.fw.testBase.TestBase;

import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class LogoutUserApi extends TestBase {
    DateHelper dateHelper = new DateHelper();
    
    public void logOutUserApiCall() {
        RestAssured.baseURI = property.getProperty("TomcatURL");
        RequestSpecification request = RestAssured.given();
        
        JSONObject requestParams = new JSONObject();
        request.header("Content-Type", "application/json");
        request.header("userId", property.getProperty("LogInUser"));
        request.header("parentBank", property.getProperty("BankCode"));
        request.header("parentBranch", property.getProperty("BranchCode"));
        request.header("usermultiCurrency", "Y");
        request.header("bankmultiCurrency", "Y");
        request.header("todaysDate", dateHelper.convertDbDateToYYYYMMDD(branchParametersService
                .getBnrachDetailsByBranchCode(property.getProperty("BranchCode")).getCurrentDate() + ""));
        request.header("branchmultiCurrency", "Y");
        request.header("transCode", "LogOutAllUsr");
        requestParams.put("intUserId", "1");
        request.body(requestParams + "");
        Response response = null;
        
        try {
            response = request.get("/GlobalController/authenticate/userLogout");
            log.info(response.getBody().asString() + "-----------------");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
}
