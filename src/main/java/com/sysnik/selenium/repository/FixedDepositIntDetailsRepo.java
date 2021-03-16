package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.FixedDepositIntDetailsEntity;



public interface FixedDepositIntDetailsRepo extends CrudRepository<FixedDepositIntDetailsEntity, Integer>{

	List<FixedDepositIntDetailsEntity> findByAccountIDOrderByIdAsc(BigInteger accountID);
}
