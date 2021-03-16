package com.sysnik.selenium.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.BlackListDetailsEntity;
import com.sysnik.selenium.entity.BlackListMasterEntity;
import com.sysnik.selenium.entity.CustomerAccountEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.DocumentDetailsEntity;
import com.sysnik.selenium.entity.SpInstructionDetailsEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.FilloExcelDataGetter;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.AccountMasterRepo;
import com.sysnik.selenium.repository.BlackListDetailsRepo;
import com.sysnik.selenium.repository.BlackListMasterRepo;
import com.sysnik.selenium.repository.CustomerAccountRepo;
import com.sysnik.selenium.repository.CustomerMasterRepo;
import com.sysnik.selenium.repository.DocumentDetailsRepo;
import com.sysnik.selenium.repository.SpInstructionDetailsRepo;

@Service("BlackListMasterService")
public class BlackListMasterService extends TestBase {
    
    FilloExcelDataGetter filloExcelDataGetter = new FilloExcelDataGetter();
    
    @Autowired
    private AccountMasterRepo amrepo;
    @Autowired
    private CustomerMasterRepo cmrepo;
    @Autowired
    private CustomerAccountRepo custAccRepo;
    @Autowired
    private BlackListDetailsRepo bldrepo;
    @Autowired
    private BlackListMasterRepo blmrepo;
    @Autowired
    private SpInstructionDetailsRepo spidrepo;
    @Autowired
    private DocumentDetailsRepo ddrepo;
    
    private CustomerMasterEntity customerMaster;
    private List<CustomerAccountEntity> customerAccount;
    private BlackListDetailsEntity blackListDetails;
    private BlackListMasterEntity blackListMaster;
    private DocumentDetailsEntity documentDetails;
    
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    
    public List<String> getCustomerAccountDetailsForUI(String custNumber) {
        List<String> accountMasterList = new ArrayList<>();
        customerMaster = cmrepo.findByCustNumber(custNumber);
        customerAccount = custAccRepo.findByCustIdAndOperator(customerMaster.getCustId(), "A");
        customerAccount.addAll(custAccRepo.findByCustIdAndOperator(customerMaster.getCustId(), "O"));
        
        for (CustomerAccountEntity objcustomerAccount : customerAccount) {
            AccountMasterEntity objAccountMaster = amrepo.findByAccId(objcustomerAccount.getAccId());
            
            if (!objAccountMaster.getStatus().equals("C") && !objAccountMaster.getStatus().equals("D")
                    && !objAccountMaster.getStatus().equals("R") && !objAccountMaster.getStatus().equals("I")) {
                accountMasterList.add(objAccountMaster.getAccType() + "_" + objAccountMaster.getAccNo());
            }
        }
        return accountMasterList;
    }
    
    public void blacklistCustomerEntryVerification(String custNumber) {
        
        customerMaster = cmrepo.findByCustNumber(custNumber);
        blackListMaster = blmrepo.findByCustomerId(customerMaster.getCustId());
        blackListDetails = bldrepo.findByBlackListId(blackListMaster.getID());
        
        assertionHelper.verifyTwoTexts("Validate Customer Status in Cust_Master Table After Blacklist Entry ",
                customerMaster.getStatus(), "B");
        
        assertionHelper.verifyTwoTexts("Verifying Cust ID in Black_List_Master table ",
                customerMaster.getCustId().toString(), blackListMaster.getCustomerId().toString());
        
        assertionHelper.verifyTwoTexts("Validate Black_List_Master table entry status ", blackListMaster.getStatus(),
                "E");
        
        assertionHelper.verifyTwoTexts("Validate Black_List_Master table customer name ", customerMaster.getCustName(),
                blackListMaster.getCustomerName());
        
        assertionHelper.verifyTwoTexts("Validate Black_List_Master table customer Type ", customerMaster.getCustType(),
                blackListMaster.getCustType());
        
        assertionHelper.verifyTwoTexts("Validate Black_List_Master table customer DOB ",
                customerMaster.getDob().toString(), blackListMaster.getDob().toString());
        
        assertionHelper.verifyTwoTexts("Validate Black_List_Master table customer blacklist reason ",
                blackListMaster.getReason(), "FIU Order");
        
    }
    
    public void verifyBlacklistDetailsTableData(String custNumber) {
        
        customerMaster = customerMasterService.getCustomerUsingNumber(custNumber);
        blackListMaster = blmrepo.findByCustomerId(customerMaster.getCustId());
        documentDetails = ddrepo.findByCustAccId(blackListMaster.getCustomerId()).get(0);
        //blackListDetails = bldrepo.findByDocId(documentDetails.getID());
        
        blackListDetails = bldrepo.findByBlackListId(blackListMaster.getID());
        
        assertionHelper.verifyTwoTexts("Validate Black_List_Master table ID with Black_List_Details BlackListId ",
                blackListDetails.getBlackListId().toString(), blackListMaster.getID().toString());
        
        assertionHelper.verifyTwoTexts("Validate Black_List_Details table Status ", blackListDetails.getStatus(), "E");
        
        assertionHelper.verifyTwoTexts("Validate Black_List_Details table customer Doc ID ",
                blackListDetails.getDocId().toString(), documentDetails.getID().toString());
        
        assertionHelper.verifyTwoTexts("Validate Black_List_Details table customer Doc ID ",
                blackListDetails.getProofDetails(), documentDetails.getDocDetails().toString());
    }
    
    public SpInstructionDetailsEntity getSpInstructionDetailsByCustId(String custNumber) {
        List<SpInstructionDetailsEntity> spInstructionDetailsList = new ArrayList<>();
        customerMaster = cmrepo.findByCustNumber(custNumber);
        spInstructionDetailsList = spidrepo.findByCustId(customerMaster.getCustId());
        SpInstructionDetailsEntity id = spInstructionDetailsList.get(spInstructionDetailsList.size() - 1);
        return id;
        
    }
    
    public String getReasonByCustomerId(String custNumber) {
        return blmrepo.findByCustomerId(customerMaster.getCustId()).getReason();
        
    }
    
    public void blacklistCustomerAuthVerification(String custNumber, String Flag) {
        
        customerMaster = cmrepo.findByCustNumber(custNumber);
        blackListMaster = blmrepo.findByCustomerId(customerMaster.getCustId());
        blackListDetails = bldrepo.findByBlackListId(blackListMaster.getID());
        if ("Y".equalsIgnoreCase(Flag)) {
            assertionHelper.verifyTwoTexts("Validate Black_List_Master table status after authorization ",
                    blackListMaster.getStatus(), "A");
            assertionHelper.verifyTwoTexts("Validate Black_List_Details table status after authorization ",
                    blackListDetails.getStatus(), "A");
            
        } else {
            assertionHelper.verifyTwoTexts("Validate Black_List_Master table status after authorization ",
                    blackListMaster.getStatus(), "A");
        }
    }
    
    public void blacklistCustomerRejectVerification(String custNumber, String Flag) {
        customerMaster = cmrepo.findByCustNumber(custNumber);
        blackListMaster = blmrepo.findByCustomerId(customerMaster.getCustId());
        blackListDetails = bldrepo.findByBlackListId(blackListMaster.getID());
        if ("Y".equalsIgnoreCase(Flag)) {
            assertionHelper.verifyTwoTexts("Validate Black_List_Master table status after authorization ",
                    blackListMaster.getStatus(), "R");
            assertionHelper.verifyTwoTexts("Validate Black_List_Details table status after authorization ",
                    blackListDetails.getStatus(), "R");
        } else {
            assertionHelper.verifyTwoTexts("Validate Black_List_Master table status after authorization ",
                    blackListMaster.getStatus(), "R");
        }
        
    }
    
}
