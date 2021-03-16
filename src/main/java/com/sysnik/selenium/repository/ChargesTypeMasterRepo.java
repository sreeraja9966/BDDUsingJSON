package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.ChargesTypeMasterEntity;

public interface ChargesTypeMasterRepo extends CrudRepository<ChargesTypeMasterEntity, Integer> {
    
    ChargesTypeMasterEntity findById(BigInteger id);
    
    ChargesTypeMasterEntity findByChargeCode(String chargeCode);
}