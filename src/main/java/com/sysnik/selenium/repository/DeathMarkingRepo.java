package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.DeathMarkingEntity;

public interface DeathMarkingRepo extends CrudRepository<DeathMarkingEntity, Integer> {
    
    DeathMarkingEntity findByCustId(BigInteger custId);
    
    DeathMarkingEntity findById(BigInteger id);
}
