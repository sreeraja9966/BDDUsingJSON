package com.sysnik.selenium.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.UserWiseDenomEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.UserWiseDenomRepo;

@Service("UserWiseDenomService")
public class UserWiseDenomService {
    @Autowired
    private UserWiseDenomRepo userWiseDenomRepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public List<Integer> getDenomQtyByBankCodeAnduserId(String bankCode, String userId) {
        List<UserWiseDenomEntity> userWiseDenom = userWiseDenomRepo
                .findByBankCodeAndUserIdOrderByDenomRateDesc(bankCode, userId);
        if (userWiseDenom.size() > 0) {
            List<Integer> denomQty = new ArrayList<>();
            for (UserWiseDenomEntity denomRate : userWiseDenom) {
                denomQty.add(denomRate.getDenomQty());
            }
            return denomQty;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record not found in userWiseDenom with " + bankCode + " & " + userId);
            return null;
        }
        
    }
    
    public List<BigDecimal> getDenomRateByBankCodeAnduserId(String bankCode, String userId) {
        List<UserWiseDenomEntity> userWiseDenom = userWiseDenomRepo
                .findByBankCodeAndUserIdOrderByDenomRateDesc(bankCode, userId);
        List<BigDecimal> denomRate = new ArrayList<>();
        if (userWiseDenom.size() > 0) {
            for (UserWiseDenomEntity denomQty : userWiseDenom) {
                denomRate.add(denomQty.getDenomRate());
            }
            return denomRate;
            
        }
        
        else {
            reportHelper.writeLogInCaseOfFailInChildTest(
                    "Record not found in userWiseDenom with " + bankCode + " & " + userId);
            return null;
        }
    }
}