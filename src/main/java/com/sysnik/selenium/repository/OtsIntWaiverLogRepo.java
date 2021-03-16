package com.sysnik.selenium.repository;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.CategoryInterestEntity;
import com.sysnik.selenium.entity.DepIntRateEntity;
import com.sysnik.selenium.entity.OtsIntWaiverLogEntity;

public interface OtsIntWaiverLogRepo extends CrudRepository<OtsIntWaiverLogEntity, Integer> {
	OtsIntWaiverLogEntity findByAccId(BigInteger accId);
}
