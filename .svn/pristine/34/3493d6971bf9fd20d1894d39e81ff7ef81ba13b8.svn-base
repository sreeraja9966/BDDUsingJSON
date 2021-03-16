package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.OrganizationOperatorDetailsEntity;

public interface OrganizationOperatorDetailsRepo extends CrudRepository<OrganizationOperatorDetailsEntity, Integer> {
    
    List<OrganizationOperatorDetailsEntity> findByCustId(BigInteger custId);
    
}
