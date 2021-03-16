package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.TransDocumentDetailsEntity;

public interface TransDocumentDetailsRepo extends CrudRepository<TransDocumentDetailsEntity, Integer> {
    TransDocumentDetailsEntity findByVoucherNumberAndTransType(BigInteger voucherNumber, String transType);
}
