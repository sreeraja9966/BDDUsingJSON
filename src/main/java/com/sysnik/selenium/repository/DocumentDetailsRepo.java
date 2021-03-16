package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.DocumentDetailsEntity;

public interface DocumentDetailsRepo extends CrudRepository<DocumentDetailsEntity, Integer> {
    
    DocumentDetailsEntity findById(BigInteger id);
    
    List<DocumentDetailsEntity> findByCustAccId(BigInteger custAccId);
    
    List<DocumentDetailsEntity> findByCustAccIdAndStatus(BigInteger custAccId, String status);
    
    DocumentDetailsEntity findByDocId(Integer docId);
    
}
