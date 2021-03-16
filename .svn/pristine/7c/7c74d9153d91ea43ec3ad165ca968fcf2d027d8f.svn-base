package com.sysnik.selenium.repository;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.sysnik.selenium.entity.LienEarMarkEntity;

public interface LienmarkRepo extends CrudRepository<LienEarMarkEntity, Integer> {
    List<LienEarMarkEntity> findByDepositAccIdAndLoanAccIdAndStatus(BigInteger depositAccId, BigInteger loanAccId,
            String status);
    
    LienEarMarkEntity findByDepositAccIdAndLoanAccId(BigInteger depositAccId, BigInteger loanAccId);
    
    @Query(value = "SELECT sum(lien_amt) FROM LIEN_EARMARK WHERE status in('E','A') and DEPOSIT_ACC_ID =:depositAccId AND LOAN_ACC_ID =:loanAccId GROUP BY DEPOSIT_ACC_ID,LOAN_ACC_ID",
            nativeQuery = true)
    BigDecimal getTotalLienAmount(@Param("depositAccId") BigInteger depositAccId,
            @Param("loanAccId") BigInteger loanAccId);
}
