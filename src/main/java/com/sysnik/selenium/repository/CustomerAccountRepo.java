package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.CustomerAccountEntity;

public interface CustomerAccountRepo extends CrudRepository<CustomerAccountEntity, Integer> {
    List<CustomerAccountEntity> findByAccId(BigInteger accId);
    
    List<CustomerAccountEntity> findByCustId(BigInteger custId);
    
    List<CustomerAccountEntity> findByCustIdAndOperator(BigInteger custId, String operator);
    
    CustomerAccountEntity findByUserAccNoAndOperator(String userAccNo, String operator);
    CustomerAccountEntity findByAccNoAndOperator(String accNo, String operator);
    
}
