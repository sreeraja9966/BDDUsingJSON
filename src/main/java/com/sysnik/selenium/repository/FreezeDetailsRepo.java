package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.FreezeDetailsEntity;

public interface FreezeDetailsRepo extends CrudRepository<FreezeDetailsEntity, Integer> {
    
    FreezeDetailsEntity findByAccId(BigInteger accId);
    
    List<FreezeDetailsEntity> findByCustId(BigInteger custId);
    
    FreezeDetailsEntity findByCustIdAndFreezeStatusAndFreezeType(BigInteger custId, String freezeStatus,
            String freezeType);
    
    List<FreezeDetailsEntity> findByCustIdAndFreezeReason(BigInteger custId, String freezeReason);
}
