package com.sysnik.selenium.repository;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.RemitParameterEntity;

public interface RemitParameterRepo extends CrudRepository<RemitParameterEntity, Integer> {
    
    RemitParameterEntity findByRemittanceType(String remittanceType);
    
    RemitParameterEntity findByRemittanceTypeAndPayableAtParYN(String remittanceType, String payableAtParYN);
}
