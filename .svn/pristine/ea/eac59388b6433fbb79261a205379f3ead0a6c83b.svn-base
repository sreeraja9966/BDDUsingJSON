package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.ProductEntity;
import com.sysnik.selenium.entity.SIMasterEntity;

public interface ProductRepo extends CrudRepository<ProductEntity, Integer>{

	ProductEntity findByProdId(int prod_id);
	
	ProductEntity findByProdNameAndBankCode(String prodName,String bankCode);
	
}
