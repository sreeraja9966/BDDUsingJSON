package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.ChargesTypeDetailsEntity;

public interface ChargesTypeDetailsRepo extends CrudRepository<ChargesTypeDetailsEntity, Integer> {
    
    ChargesTypeDetailsEntity findByChargeTypeId(BigInteger chargeTypeId);
    
}
