package com.sysnik.selenium.repository;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.BankParametersEntity;
import com.sysnik.selenium.entity.BranchParametersEntity;

public interface BranchParametersRepo extends CrudRepository<BranchParametersEntity, Integer> {
	BranchParametersEntity findByBranchCode(String branchCode);
}
