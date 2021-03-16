package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.sysnik.selenium.entity.ChequeBookDetailEntity;

public interface ChequeBookDetailRepo extends CrudRepository<ChequeBookDetailEntity, Integer> {
    ChequeBookDetailEntity findByChequeBookId(Integer chequeBookId);
    
    ChequeBookDetailEntity findByInstrumentNoAndTransId(String instrumentNo, BigInteger transId);
    
    @Query(value = "select * from CHEQUE_BOOK_DETAIL e where e.CHEQUE_BOOK_ID=:chequeBookId", nativeQuery = true)
    
    List<ChequeBookDetailEntity> findByCheqId(@Param(value = "chequeBookId") Integer chequeBookId);
    
    List<ChequeBookDetailEntity> findByInstrumentNo(String instrumentNo);
}
