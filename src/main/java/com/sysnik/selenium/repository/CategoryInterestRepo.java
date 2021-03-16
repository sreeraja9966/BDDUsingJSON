package com.sysnik.selenium.repository;

import java.sql.Date;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.CategoryInterestEntity;

public interface CategoryInterestRepo extends CrudRepository<CategoryInterestEntity, Integer>{
	
	CategoryInterestEntity findByCatCodeAndPrdIdAndEffDateLessThanEqual(String catCode,int prdId,Date effDate);

}
