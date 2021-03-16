package com.sysnik.selenium.repository;

import java.util.Date;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.ReconTransactionEntity;

public interface ReconTransactionRepo extends CrudRepository<ReconTransactionEntity, Integer> {
    ReconTransactionEntity findByEntryDateAndEnterBy(Date entryDate, String enterBy);
    
}
