package com.sysnik.selenium.repository;

import java.math.BigDecimal;
import java.sql.Date;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.CategoryInterestEntity;
import com.sysnik.selenium.entity.DepIntRateEntity;

public interface DepIntRateRepo extends CrudRepository<DepIntRateEntity, Integer> {

	DepIntRateEntity findByProductCodeAndFromAmtLessThanEqualAndToAmtGreaterThanEqualAndFromDaysLessThanEqualAndToDaysGreaterThanEqualAndFromMonthLessThanEqualAndToMonthGreaterThanEqualAndEffDateLessThanEqual(
			int prdCode,BigDecimal fromAmt,BigDecimal toAmt,int fromDays,int toDays,int fromMonth,int toMonth,Date effDate);

}
