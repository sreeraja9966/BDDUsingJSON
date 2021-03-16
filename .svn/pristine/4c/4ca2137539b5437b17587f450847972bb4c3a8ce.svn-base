package com.sysnik.selenium.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.DenomMasterEntity;
import com.sysnik.selenium.entity.UserWiseDenomEntity;

public interface UserWiseDenomRepo extends CrudRepository<UserWiseDenomEntity, String>{
List<UserWiseDenomEntity> findByBankCodeAndUserIdOrderByDenomRateDesc(String bankCode,String userId);
}
