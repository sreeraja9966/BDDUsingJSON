package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.LookupEntity;
import com.sysnik.selenium.entity.SIMasterEntity;

public interface LookupRepo extends CrudRepository<LookupEntity, Integer>{

	
	LookupEntity findByCodeAndType(String toAccId,String Type);
}
