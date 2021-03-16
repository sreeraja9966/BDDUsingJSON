package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.AddressEntity;

public interface AddressRepo extends CrudRepository<AddressEntity, Integer> {
    
    AddressEntity findByCustIdAndType(BigInteger custId, String type);
    
}
