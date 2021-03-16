package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.RepaymentScheduleEntity;

public interface RepaymentScheduleRepo extends CrudRepository<RepaymentScheduleEntity, Integer> {
    
    List<RepaymentScheduleEntity> findByAccId(BigInteger accId);
}