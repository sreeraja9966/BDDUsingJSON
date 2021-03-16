package com.sysnik.selenium.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.LoanDisbursementEntity;
import com.sysnik.selenium.entity.RepaymentScheduleEntity;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.RepaymentScheduleRepo;

@Service("RepaymentScheduleService")
public class RepaymentScheduleService extends TestBase {
    
    @Autowired
    private RepaymentScheduleRepo rsrepo;
    
    private AccountMasterEntity accMaster;
    private LoanDisbursementEntity loanDisb;
    private List<RepaymentScheduleEntity> repaySchedule;
    
    public List<RepaymentScheduleEntity> getLoanRepaymentScheduleData(String accNumber) {
        List<RepaymentScheduleEntity> repaymentScheduleList = new ArrayList<RepaymentScheduleEntity>();
        accMaster = accountService.getAccountMasterDetailsByAccNo(accNumber);
        
        repaymentScheduleList = rsrepo.findByAccId(accMaster.getAccId());
        
        return repaymentScheduleList;
        
    }
    
}
