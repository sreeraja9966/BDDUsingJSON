package com.sysnik.selenium.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.TransactionHeaderEntity;

public interface TransactionHeaderRepo extends CrudRepository<TransactionHeaderEntity, Integer> {
    
    TransactionHeaderEntity findByVoucherNumberAndTransType(Long voucherNumber, String transType);
    
    TransactionHeaderEntity findByParentVoucherNumber(Long parentVoucherNumber);
    
    List<TransactionHeaderEntity> findByParentVoucherNumberAndTransType(Long parentVoucherNumber, String transType);
    
    TransactionHeaderEntity findById(Long id);
}
