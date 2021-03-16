package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.TransactionDenominationEntity;

public interface TransactionDenominationRepo extends CrudRepository<TransactionDenominationEntity, Integer> {
List<TransactionDenominationEntity> findByTransIdOrderByTransTypeDesc(BigInteger transId);
}
