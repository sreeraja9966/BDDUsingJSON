package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.ProductEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.ProductRepo;

@Service("ProductService")
public class ProductService {
    @Autowired
    private ProductRepo productRepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public ProductEntity findProductDetailsUsindPrdId(int prdId) {
        ProductEntity productEntity = productRepo.findByProdId(prdId);
        if ((productEntity) != null) {
            return productEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record not found in products table with prdId " + prdId);
            return null;
        }
        
    }
    
    public ProductEntity findProductDetailsUsingProdNameAndBankCode(String prodName) {
        ProductEntity productEntity = productRepo.findByProdNameAndBankCode(prodName, "101");
        if ((productEntity) != null) {
            return productEntity;
        } else {
            reportHelper.writeLogInCaseOfFailInChildTest("Record not found in products table with prdname " + prodName);
            return null;
        }
        
    }
    
    public String findIntTypeByProdName(String prodName) {
        return productRepo.findByProdNameAndBankCode(prodName, "101").getIntType();
    }
    
}
