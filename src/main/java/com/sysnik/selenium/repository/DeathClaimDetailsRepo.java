package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.DeathClaimDetailsEntity;

public interface DeathClaimDetailsRepo extends CrudRepository<DeathClaimDetailsEntity, Integer> {
    
    List<DeathClaimDetailsEntity> findByCustId(BigInteger custId);
    
    List<DeathClaimDetailsEntity> findByDathMarkId(BigInteger dathMarkId);
    
}
