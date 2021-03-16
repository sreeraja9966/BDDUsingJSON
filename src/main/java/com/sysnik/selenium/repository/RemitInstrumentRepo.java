package com.sysnik.selenium.repository;

import java.math.BigInteger;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.RemitInstrumentEntity;

public interface RemitInstrumentRepo extends CrudRepository<RemitInstrumentEntity, Integer> {
    
    RemitInstrumentEntity findByRemittanceSrNo(String remittanceSrNo);
    
    RemitInstrumentEntity findByOrigVoucherId(BigInteger origVoucherId);
    
    RemitInstrumentEntity findByRespondVoucherId(BigInteger respondVoucherId);
    
    RemitInstrumentEntity findByOrigVoucherIdAndRemittanceSrNo(BigInteger origVoucherId, String remittanceSrNo);
}
