
package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sysnik.selenium.entity.AadharMapperEntity;

@Repository
public interface AadharMapperRepo extends CrudRepository<AadharMapperEntity, Integer> {
    AadharMapperEntity findByAccId(BigInteger accId);
}
