package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.AccountMasterEntity;

public interface AccountMasterRepo extends CrudRepository<AccountMasterEntity, Integer> {
    AccountMasterEntity findByAccNo(String accNo);
    
    AccountMasterEntity findByAccId(BigInteger accId);
    
    List<AccountMasterEntity> findByCustId(BigInteger custId);
    
}
