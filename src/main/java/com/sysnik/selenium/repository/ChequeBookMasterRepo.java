package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.ChequeBookMasterEntity;

public interface ChequeBookMasterRepo extends CrudRepository<ChequeBookMasterEntity, Integer> {
    List<ChequeBookMasterEntity> findByAccIDAndStatus(BigInteger accID, String status);
    
    ChequeBookMasterEntity findByAccID(BigInteger accID);
    
    ChequeBookMasterEntity findById(int id);
    
}
