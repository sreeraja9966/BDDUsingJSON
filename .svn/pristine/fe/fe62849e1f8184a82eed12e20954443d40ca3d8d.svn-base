package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.InventoryBookwiseEntity;

public interface INVENTORYBOOKWISERepo extends CrudRepository<InventoryBookwiseEntity, Integer> {
    InventoryBookwiseEntity findByBatchNoAndSeriesAndStartNo(BigInteger batchNo, String series, Integer startNo);
    
    InventoryBookwiseEntity findBySeriesAndStartNo(String series, Integer startNo);
}
