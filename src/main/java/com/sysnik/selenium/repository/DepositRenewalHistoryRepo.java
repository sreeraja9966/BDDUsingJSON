package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.DepositRenewalHistoryEntity;

public interface DepositRenewalHistoryRepo extends CrudRepository<DepositRenewalHistoryEntity, Integer> {
    DepositRenewalHistoryEntity findByAccIdAndStatus(BigInteger accId, String status);
    
    List<DepositRenewalHistoryEntity> findByAccId(BigInteger accId);
}
