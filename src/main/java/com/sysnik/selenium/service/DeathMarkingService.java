package com.sysnik.selenium.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.CustomerAccountEntity;
import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.DeathClaimDetailsEntity;
import com.sysnik.selenium.entity.DeathMarkingEntity;
import com.sysnik.selenium.entity.FreezeDetailsEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.AccountMasterRepo;
import com.sysnik.selenium.repository.CustomerAccountRepo;
import com.sysnik.selenium.repository.CustomerMasterRepo;
import com.sysnik.selenium.repository.DeathClaimDetailsRepo;
import com.sysnik.selenium.repository.DeathMarkingRepo;
import com.sysnik.selenium.repository.FreezeDetailsRepo;

@Service("DeathMarkingService")
public class DeathMarkingService extends TestBase {
    
    @Autowired
    private CustomerMasterRepo cmrepo;
    @Autowired
    private CustomerAccountRepo carepo;
    @Autowired
    private AccountMasterRepo amrepo;
    @Autowired
    private FreezeDetailsRepo fdrepo;
    @Autowired
    private DeathMarkingRepo dmrepo;
    @Autowired
    private DeathClaimDetailsRepo dcdrepo;
    
    private CustomerMasterEntity custMaster;
    private DeathMarkingEntity deathMark;
    private DeathClaimDetailsEntity deathClaimDetails;
    private List<CustomerAccountEntity> custAccount;
    private AccountMasterEntity accMaster;
    AssertionHelper assertionHelper = AutomationObjectFactory.getAssertionHelperInstance();
    
    public List<String> getCustomerAccountDetailsForUI(String custNumber) {
        List<String> accountMasterList = new ArrayList<>();
        custMaster = cmrepo.findByCustNumber(custNumber);
        custAccount = carepo.findByCustIdAndOperator(custMaster.getCustId(), "A");
        
        for (CustomerAccountEntity objcustomerAccount : custAccount) {
            AccountMasterEntity objAccountMaster = amrepo.findByAccId(objcustomerAccount.getAccId());
            
            accountMasterList.add(objAccountMaster.getAccType() + "_" + objAccountMaster.getAccNo());
        }
        return accountMasterList;
    }
    
    public List<AccountMasterEntity> getDeceasedCustomerAccountDetails(String custNumber) {
        List<AccountMasterEntity> accountMasterList = new ArrayList<>();
        custMaster = cmrepo.findByCustNumber(custNumber);
        custAccount = carepo.findByCustIdAndOperator(custMaster.getCustId(), "A");
        
        for (CustomerAccountEntity objcustomerAccount : custAccount) {
            AccountMasterEntity objAccountMaster = amrepo.findByAccId(objcustomerAccount.getAccId());
            accountMasterList.add(objAccountMaster);
        }
        return accountMasterList;
    }
    
    public List<FreezeDetailsEntity> getDeceasedFrezzeDetailsByCustId(String custNumber) {
        List<FreezeDetailsEntity> freezeDetailsList = new ArrayList<>();
        custMaster = cmrepo.findByCustNumber(custNumber);
        freezeDetailsList = fdrepo.findByCustIdAndFreezeReason(custMaster.getCustId(), "Death");
        return freezeDetailsList;
    }
    
    public List<DeathClaimDetailsEntity> getDeceasedDeathClaimDetailsByCustId(String custNumber) {
        List<DeathClaimDetailsEntity> deathClaimDetailsList = new ArrayList<>();
        custMaster = cmrepo.findByCustNumber(custNumber);
        deathMark = dmrepo.findByCustId(custMaster.getCustId());
        deathClaimDetailsList = dcdrepo.findByDathMarkId(deathMark.getId());
        return deathClaimDetailsList;
    }
    
    public void deathMarkEntryVerification(String custNumber, String claimant) {
        
        custMaster = cmrepo.findByCustNumber(custNumber);
        List<AccountMasterEntity> accMasterList = new ArrayList<>();
        accMasterList = amrepo.findByCustId(custMaster.getCustId());
        deathMark = dmrepo.findByCustId(custMaster.getCustId());
        List<DeathClaimDetailsEntity> deathClaimDetailsList = new ArrayList<>();
        deathClaimDetailsList = deathMarkingService.getDeceasedDeathClaimDetailsByCustId(custNumber);
        
        assertionHelper.verifyTwoTexts("Validate Customer Status in Cust_Master Table After Blacklist Entry ",
                custMaster.getStatus(), "D");
        
        assertionHelper.verifyTwoTexts("Verifying Cust ID in DEATH_MARKING Table ", custMaster.getCustId().toString(),
                deathMark.getCustId().toString());
        
        assertionHelper.verifyTwoTexts("Validate Customer Status in DEATH_MARKING Table ", deathMark.getStatus(), "E");
        
        if ("Existing Customer".equalsIgnoreCase(claimant)) {
            assertionHelper.verifyTwoTexts("Validate Customer Claimant Name in DEATH_MARKING Table ",
                    deathMark.getClaimantName(), "SAGAR RAM PAWAR");
            
            assertionHelper.verifyTwoTexts("Validate Customer Claimant Customer ID in DEATH_MARKING Table ",
                    deathMark.getClaimantCustId().toString(), "4806");
        } else {
            assertionHelper.verifyTwoTexts("Validate Customer Claimant Name in DEATH_MARKING Table ",
                    deathMark.getClaimantName(), "SAGAR JOSHI");
            
            assertionHelper.verifyTwoTexts("Validate Customer Claimant Address in DEATH_MARKING Table ",
                    deathMark.getClaimantAddress(), "145 Om Colony, Near Dange Chowk, Pune 411030");
            
            assertionHelper.verifyTwoTexts("Validate Customer Claimant Contact in DEATH_MARKING Table ",
                    deathMark.getClaimantContact(), "9855345689");
        }
        
        assertionHelper.verifyTwoTexts("Validate Customer Claimant Remark in DEATH_MARKING Table ",
                deathMark.getRemark(), "Dead");
        
        assertionHelper.verifyTwoTexts("Validate Death Date in DEATH_MARKING Table  ",
                deathMark.getDeathDate().toString(), "2013-10-25" + " 00:00:00.0");
        
        assertionHelper.verifyTwoTexts("Validate Claim Date in DEATH_MARKING Table  ",
                deathMark.getClaimDate().toString(),
                branchParametersService.getBnrachLiveDate(property.getProperty("BranchCode")).toString()
                        + " 00:00:00.0");
        
        for (DeathClaimDetailsEntity objDeathClaim : deathClaimDetailsList) {
            
            assertionHelper.verifyTwoTexts("Validate Death Mark ID with DEATH_MARKING Table ",
                    objDeathClaim.getDathMarkId().toString(), deathMark.getId().toString());
            
            assertionHelper.verifyTwoTexts("Validate Customer ID in DEATH_CLAIM_DETAILS Table ",
                    deathMark.getCustId().toString(), objDeathClaim.getCustId().toString());
            
            assertionHelper.verifyTwoTexts("Validate Customer Status in DEATH_CLAIM_DETAILS Table ",
                    objDeathClaim.getClaimStatus(), "E");
            
            assertionHelper.verifyTwoTexts("Validate Customer Claimant Name in DEATH_CLAIM_DETAILS Table ",
                    deathMark.getClaimantName(), objDeathClaim.getClaimbenificiary());
            
            for (AccountMasterEntity objAccMaster : accMasterList) {
                if (objAccMaster.getAccId().equals(objDeathClaim.getAccId())) {
                    assertionHelper.verifyTwoTexts("Validate Customer ACC_ID in DEATH_CLAIM_DETAILS Table ",
                            objDeathClaim.getAccId().toString(), objAccMaster.getAccId().toString());
                    
                    assertionHelper.verifyTwoTexts("Validate Customer Claim Amount in DEATH_CLAIM_DETAILS Table ",
                            objDeathClaim.getClaimAmt().toString(), objAccMaster.getAvailableBal().toString());
                }
            }
        }
        
    }
    
    public void validateDeathMarkAndDeathDetailsTableDataAfterAuth(String custNumber, String flow) {
        
        custMaster = cmrepo.findByCustNumber(custNumber);
        deathMark = dmrepo.findByCustId(custMaster.getCustId());
        List<AccountMasterEntity> accMasterList = new ArrayList<>();
        accMasterList = deathMarkingService.getDeceasedCustomerAccountDetails(custNumber);
        List<DeathClaimDetailsEntity> deathClaimDetailsList = new ArrayList<>();
        deathClaimDetailsList = deathMarkingService.getDeceasedDeathClaimDetailsByCustId(custNumber);
        
        if ("Auth".equalsIgnoreCase(flow)) {
            assertionHelper.verifyTwoTexts("Validate Customer Status in Cust_Master Table ", custMaster.getStatus(),
                    "D");
            assertionHelper.verifyTwoTexts("Validate Customer Status in DEATH_MARKING Table ", deathMark.getStatus(),
                    "A");
            
            for (DeathClaimDetailsEntity objDeathClaim : deathClaimDetailsList) {
                assertionHelper.verifyTwoTexts("Validate Customer Status in DEATH_CLAIM_DETAILS Table ",
                        objDeathClaim.getClaimStatus(), "A");
            }
            
        }
        if ("Reject".equalsIgnoreCase(flow)) {
            assertionHelper.verifyTwoTexts("Validate Customer Status in Cust_Master Table ", custMaster.getStatus(),
                    "A");
            assertionHelper.verifyTwoTexts("Validate Customer Status in DEATH_MARKING Table ", deathMark.getStatus(),
                    "R");
            for (DeathClaimDetailsEntity objDeathClaim : deathClaimDetailsList) {
                assertionHelper.verifyTwoTexts("Validate Customer Status in DEATH_CLAIM_DETAILS Table ",
                        objDeathClaim.getClaimStatus(), "R");
            }
            for (AccountMasterEntity objAccMaster : accMasterList) {
                assertionHelper.verifyTwoTexts("Account Status in Account_Master Table After Authorization of AccId "
                        + objAccMaster.getAccId(), objAccMaster.getStatus(), "A");
                assertionHelper
                        .verifyTwoTexts("Account Freeze Value in Account_Master Table After Authorization of AccId "
                                + objAccMaster.getAccId(), objAccMaster.getFreeze(), "N");
            }
            
        }
    }
    
}
