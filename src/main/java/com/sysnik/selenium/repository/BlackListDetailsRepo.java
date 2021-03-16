package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.BlackListDetailsEntity;

public interface BlackListDetailsRepo extends CrudRepository<BlackListDetailsEntity, Integer> {
    
    BlackListDetailsEntity findByBlackListId(BigInteger blackListId);
    
    BlackListDetailsEntity findByDocId(Long docId);
}
