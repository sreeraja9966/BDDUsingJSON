package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.CustomerMasterEntity;

public interface CustomerMasterRepo extends CrudRepository<CustomerMasterEntity, Integer> {
    CustomerMasterEntity findByCustId(BigInteger accNo);
    
    CustomerMasterEntity findByCustNumber(String custNumber);
    
}
