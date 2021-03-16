package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.SIMasterEntity;

public interface SIMasterRepo extends CrudRepository<SIMasterEntity, Integer> {
    
    SIMasterEntity findByFromAccId(BigInteger fromAccId);
    
    SIMasterEntity findByToAccId(BigInteger toAccId);
    
    SIMasterEntity findBySiNumberAndBranchCode(BigInteger siNumber, String branchCode);
}
