package com.sysnik.selenium.service;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.repository.BranchParametersRepo;
import com.sysnik.selenium.repository.CustomerMasterRepo;
import com.sysnik.selenium.repository.DepIntRateRepo;
import com.sysnik.selenium.repository.ProductRepo;

@Service("DepIntRateService")
public class DepIntRateService {
    
    @Autowired
    private DepIntRateRepo depIntRepo;
    @Autowired
    private CustomerMasterRepo custMasterRepo;
    @Autowired
    private ProductRepo prdRepo;
    @Autowired
    private BranchParametersRepo branchParameterRepo;
    
    public BigDecimal getIntRateByProductCode(String prdName, BigDecimal fromAmt, BigDecimal toAmt, int fromDays,
            int toDays, int fromMonth, int toMonth) {
        
        return depIntRepo
                .findByProductCodeAndFromAmtLessThanEqualAndToAmtGreaterThanEqualAndFromDaysLessThanEqualAndToDaysGreaterThanEqualAndFromMonthLessThanEqualAndToMonthGreaterThanEqualAndEffDateLessThanEqual(
                        prdRepo.findByProdNameAndBankCode(prdName, "101").getProd_id(), fromAmt, toAmt, fromDays,
                        toDays, fromMonth, toMonth, branchParameterRepo.findByBranchCode("2101").getCurrentDate())
                .getIntRate();
        
    }
    
}
