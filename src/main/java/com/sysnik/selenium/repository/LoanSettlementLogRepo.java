package com.sysnik.selenium.repository;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.CategoryInterestEntity;
import com.sysnik.selenium.entity.DepIntRateEntity;
import com.sysnik.selenium.entity.LoanSettlementLogEntity;

public interface LoanSettlementLogRepo extends CrudRepository<LoanSettlementLogEntity, Integer> {

	LoanSettlementLogEntity findByAccId(BigInteger accId);
}
