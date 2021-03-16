package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.AccountContactEntity;

public interface AccountContactRepo extends CrudRepository<AccountContactEntity, Integer> {
    List<AccountContactEntity> findByContactId(long contactId);
    
    AccountContactEntity findByAccId(BigInteger accId);
    
    List<AccountContactEntity> findByAccIdAndContactType(BigInteger accId, String contactType);
}
