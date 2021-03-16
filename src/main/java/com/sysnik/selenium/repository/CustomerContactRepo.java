package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.CustomerContactEntity;

public interface CustomerContactRepo extends CrudRepository<CustomerContactEntity, Integer> {
    
    List<CustomerContactEntity> findByCustId(BigInteger custId);
    
    List<CustomerContactEntity> findByCustIdInAndContactTypeIn(BigInteger custId, List<String> contactType);
    
}
