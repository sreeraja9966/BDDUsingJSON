package com.sysnik.selenium.repository;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.DocumentMasterEntity;

public interface DocumentMasteRepo extends CrudRepository<DocumentMasterEntity, Integer> {
    
    DocumentMasterEntity findByDocId(Long docId);
}