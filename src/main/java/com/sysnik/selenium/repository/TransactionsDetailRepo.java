package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.sysnik.selenium.entity.TransactionsDetailEntity;

public interface TransactionsDetailRepo extends CrudRepository<TransactionsDetailEntity, BigInteger> {
    TransactionsDetailEntity findByIdAndAccountNumber(BigInteger id, String accountNumber);
    
    @Query("from TransactionsDetailEntity t where t.id=:id")
    List<TransactionsDetailEntity> getTransactionDetailsById(@Param("id") BigInteger id);
    
    List<TransactionsDetailEntity> findByIdAndDrCr(BigInteger id, String drCr);
    
}
