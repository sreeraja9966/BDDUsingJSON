package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.LoanDisbursementEntity;

public interface LoanDisbursementRepo extends CrudRepository<LoanDisbursementEntity, Integer> {
    
    LoanDisbursementEntity findByAccIdAndVoucherNo(BigInteger accId, BigInteger voucherNo);
    
    LoanDisbursementEntity findByAccId(BigInteger accId);
    
}
