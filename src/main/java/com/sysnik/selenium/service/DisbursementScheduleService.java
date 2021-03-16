package com.sysnik.selenium.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.DisbursementScheduleEnity;
import com.sysnik.selenium.entity.LoanMasterEntity;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.DisbursementScheduleRepo;
import com.sysnik.selenium.repository.LoanMasterRepo;

@Service("DisbursementScheduleService")
public class DisbursementScheduleService extends TestBase {
    
    @Autowired
    private LoanMasterRepo lmrepo;
    
    @Autowired
    private DisbursementScheduleRepo dsrepo;
    
    private AccountMasterEntity accMaster;
    private LoanMasterEntity loanMaster;
    private DisbursementScheduleEnity disSchedule;
    
    public List<DisbursementScheduleEnity> getDisbScheduleData(String accNumber) {
        
        List<DisbursementScheduleEnity> disScheduleList = new ArrayList<DisbursementScheduleEnity>();
        accMaster = accountService.getAccountMasterDetailsByAccNo(accNumber);
        loanMaster = lmrepo.findByAccId(accMaster.getAccId());
        disScheduleList = dsrepo.findByAccId(accMaster.getAccId());
        return disScheduleList;
    }
    
    public Date getDisbScheduleDate(String accNumber) {
        
        List<DisbursementScheduleEnity> disScheduleList = new ArrayList<DisbursementScheduleEnity>();
        accMaster = accountService.getAccountMasterDetailsByAccNo(accNumber);
        loanMaster = lmrepo.findByAccId(accMaster.getAccId());
        disScheduleList = dsrepo.findByAccId(loanMaster.getAccId());
        return disScheduleList.get(0).getDisbDate();
    }
    
    public BigDecimal getDisbScheduleAmount(String accNumber) {
        
        List<DisbursementScheduleEnity> disScheduleList = new ArrayList<DisbursementScheduleEnity>();
        accMaster = accountService.getAccountMasterDetailsByAccNo(accNumber);
        loanMaster = lmrepo.findByAccId(accMaster.getAccId());
        disScheduleList = dsrepo.findByAccId(loanMaster.getAccId());
        for (int i = 0; i < disScheduleList.size(); i++) {
            
            if (i == 1) {
                disScheduleList.remove(0);
                disSchedule = dsrepo.findByAccIdAndId(accMaster.getAccId(), disScheduleList.get(0).getId());
            } else {
                disSchedule = dsrepo.findByAccIdAndId(accMaster.getAccId(), disScheduleList.get(i).getId());
                
            }
        }
        
        return disSchedule.getDisbAmt();
        
    }
}
