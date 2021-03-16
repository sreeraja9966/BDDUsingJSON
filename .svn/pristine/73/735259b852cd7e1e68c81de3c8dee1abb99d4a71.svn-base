package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.ChequeBookInventoryEntity;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.ChequeBookInventoryRepo;

@Service("ChequeBookInventoryService")
public class ChequeBookInventoryService extends TestBase {
    
    @Autowired
    private ChequeBookInventoryRepo cbirepo;
    
    private ChequeBookInventoryEntity chequeBookInventory;
    
    public Integer getChequeBookInventoryDetails(String PrdType) {
        
        chequeBookInventory = cbirepo.findByPrdType(PrdType);
        Integer LastCheqNum = chequeBookInventory.getLastChqNo();
        return LastCheqNum;
    }
    
}