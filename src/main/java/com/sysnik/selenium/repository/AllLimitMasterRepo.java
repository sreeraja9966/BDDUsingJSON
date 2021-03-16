package com.sysnik.selenium.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.AllLimitMasterEntity;

public interface AllLimitMasterRepo extends CrudRepository<AllLimitMasterEntity, Integer>{
	List<AllLimitMasterEntity> findByLimitTypeInAndValueInAndTransCodeAndActivity(List<String> limitType,List<String> value,String transCode,String activity);
}
