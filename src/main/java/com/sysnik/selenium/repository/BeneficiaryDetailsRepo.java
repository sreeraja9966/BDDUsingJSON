package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.BeneficiaryDetailsEntity;

public interface BeneficiaryDetailsRepo extends CrudRepository<BeneficiaryDetailsEntity, Integer> {
    BeneficiaryDetailsEntity findByBeneficiaryId(BigInteger beneficiaryId);
    
    BeneficiaryDetailsEntity findByBenefAccountNo(String benefAccountNo);
}
