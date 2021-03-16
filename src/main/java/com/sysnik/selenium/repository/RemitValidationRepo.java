package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.RemitValidationEntity;

public interface RemitValidationRepo extends CrudRepository<RemitValidationEntity, Integer> {
    
    RemitValidationEntity findByRemitId(BigInteger remitId);
    
    RemitValidationEntity findByRemittanceSrNo(String remittanceSrNo);
}
