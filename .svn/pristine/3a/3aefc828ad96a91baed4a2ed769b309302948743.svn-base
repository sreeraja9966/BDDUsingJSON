package com.sysnik.selenium.repository;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.InstrumentTypesEntity;

public interface InstrumentTypesRepo extends CrudRepository<InstrumentTypesEntity, Integer> {
    
    InstrumentTypesEntity findByInstTypeAndProdType(String instType, String prodType);
    
    InstrumentTypesEntity findByProdTypeAndDescription(String prodType, String description);
    
}
