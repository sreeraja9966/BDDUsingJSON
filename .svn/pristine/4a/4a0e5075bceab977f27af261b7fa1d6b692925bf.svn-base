package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.FlexiUnitParameterEntity;
import com.sysnik.selenium.entity.ProductEntity;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.FlexiUnitParameterRepo;
import com.sysnik.selenium.repository.ProductRepo;

@Service("FlexiUnitParameterService")
public class FlexiUnitParameterService extends TestBase {
    
    @Autowired
    private FlexiUnitParameterRepo fuprepo;
    @Autowired
    private ProductRepo prepo;
    
    private FlexiUnitParameterEntity flexiUnitParam;
    private ProductEntity product;
    
    public FlexiUnitParameterEntity getFlexiUnitParameterData(int prdId) {
        product = prepo.findByProdId(prdId);
        flexiUnitParam = fuprepo.findByBasePrdId(product.getProd_id());
        return flexiUnitParam;
        
    }
}
