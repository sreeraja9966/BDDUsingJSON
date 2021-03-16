package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.TdsDeductedDetailsEntity;

public interface TdsDeductedDetailsRepo extends CrudRepository<TdsDeductedDetailsEntity, Integer> {
    TdsDeductedDetailsEntity findByAccId(BigInteger accId);
}
