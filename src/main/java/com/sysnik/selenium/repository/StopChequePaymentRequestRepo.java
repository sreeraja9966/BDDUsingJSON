package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.StopChequePaymentRequestEntity;

public interface StopChequePaymentRequestRepo extends CrudRepository<StopChequePaymentRequestEntity, Integer> {
    StopChequePaymentRequestEntity findByAccID(BigInteger accID);
    
}
