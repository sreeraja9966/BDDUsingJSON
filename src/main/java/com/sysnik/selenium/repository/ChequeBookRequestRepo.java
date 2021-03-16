package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.ChequeBookRequestEntity;

public interface ChequeBookRequestRepo  extends CrudRepository<ChequeBookRequestEntity, Integer> {
	ChequeBookRequestEntity findByAccID(BigInteger accID);
	
} 

