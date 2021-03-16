package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.DisbursementScheduleEnity;

public interface DisbursementScheduleRepo extends CrudRepository<DisbursementScheduleEnity, Integer> {
    
    DisbursementScheduleEnity findByAccIdAndId(BigInteger accId, BigInteger id);
    
    List<DisbursementScheduleEnity> findByAccId(BigInteger accId);
    
}
