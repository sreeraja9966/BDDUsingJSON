package com.sysnik.selenium.repository;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.AccountMasterEntity;
import com.sysnik.selenium.entity.InventoryBookwiseEntity;
import com.sysnik.selenium.entity.InventoryBookwiseLogEntity;

public interface INVENTORYBOOKWISELogRepo extends CrudRepository<InventoryBookwiseLogEntity, Integer> {
	InventoryBookwiseLogEntity  findByBatchNoAndSeriesAndStartNo(BigInteger batchNo,String series,Integer startNo);
}
