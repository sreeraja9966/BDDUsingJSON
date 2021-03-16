package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.BlackListMasterEntity;

public interface BlackListMasterRepo extends CrudRepository<BlackListMasterEntity, Integer> {
    
    BlackListMasterEntity findByCustomerId(BigInteger customerId);
    
    BlackListMasterEntity findById(BigInteger id);
}
