package com.sysnik.selenium.service;

import java.math.BigInteger;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.BankParametersEntity;
import com.sysnik.selenium.entity.SIMasterEntity;
import com.sysnik.selenium.fw.helper.AssertionHelper;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.repository.BankParametersRepo;
import com.sysnik.selenium.repository.SIMasterRepo;

@Service("BankParametersService")
public class BankParametersService {
@Autowired
BankParametersRepo bankParameterRepo;

private BankParametersEntity bankParameter;


public String getTDSImpYN(String bankCode) {
	return bankParameterRepo.findByBankCode(bankCode).getTdsImplYesno();
}


}
