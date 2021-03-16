package com.sysnik.selenium.repository;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.RtgsNeftOutwardEntity;

public interface RtgsNeftOutwardRepo extends CrudRepository<RtgsNeftOutwardEntity, Integer> {
    
    RtgsNeftOutwardEntity findByAccNumber(String accNumber);
    
}
