package com.sysnik.selenium.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.sysnik.selenium.entity.ModificationAuditLogEntity;

public interface ModificationAuditLogRepo extends CrudRepository<ModificationAuditLogEntity, Integer> {
    
    List<ModificationAuditLogEntity> findByAccountCustId(Long accountCustId);
}
