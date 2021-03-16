package com.sysnik.selenium.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.DenomMasterEntity;

public interface DenomMasterRepo extends CrudRepository<DenomMasterEntity, Integer>{
List<DenomMasterEntity> findByBankCodeOrderByDenomRateDesc(String bankCode);
}
