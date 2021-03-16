package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.DepositIntpaymentHistoryEntity;

public interface DEPOSITINTERESTHISTORYRepo extends CrudRepository<DepositIntpaymentHistoryEntity, Integer> {
    List<DepositIntpaymentHistoryEntity> findByAccIdOrderByIdDesc(BigInteger accId);
    
}
