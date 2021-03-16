package com.sysnik.selenium.repository;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.TokenMasterEntity;

public interface TokenMasterRepo extends CrudRepository<TokenMasterEntity, Integer> {

	TokenMasterEntity findByTokenNumberAndBranchCode(Integer tokenNumber,String branchCode);
}
