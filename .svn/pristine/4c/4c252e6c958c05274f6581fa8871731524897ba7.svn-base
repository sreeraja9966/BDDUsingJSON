package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.SpInstructionDetailsEntity;

public interface SpInstructionDetailsRepo extends CrudRepository<SpInstructionDetailsEntity, Integer> {
    
    List<SpInstructionDetailsEntity> findByCustId(BigInteger custId);
}
