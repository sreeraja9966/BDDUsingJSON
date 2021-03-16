package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.RepaymentScheduleTempEntity;

public interface RepaymentScheduleTempRepo extends CrudRepository<RepaymentScheduleTempEntity, Integer> {
    
    List<RepaymentScheduleTempEntity> findByAccId(BigInteger accId);
}
