package com.sysnik.selenium.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.TransactionEntity;

public interface TransactionRepo extends CrudRepository<TransactionEntity, Integer> {
	TransactionEntity findByVoucherNumberAndAccountNumber(Long voucherNumber,String accountNumber);
	List<TransactionEntity> findByVoucherNumberAndTransactionType(Long voucherNumber,String transactionType);
}
