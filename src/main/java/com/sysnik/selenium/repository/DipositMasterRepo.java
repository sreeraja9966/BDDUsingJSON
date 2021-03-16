package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.DepositMasterEntity;

public interface DipositMasterRepo extends CrudRepository<DepositMasterEntity, Integer> {
	DepositMasterEntity findByAccId(BigInteger bigInteger);
}
