package com.sysnik.selenium.service;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.fw.helper.FilloExcelDataGetter;
import com.sysnik.selenium.repository.BranchParametersRepo;
import com.sysnik.selenium.repository.CategoryInterestRepo;
import com.sysnik.selenium.repository.CustomerAccountRepo;
import com.sysnik.selenium.repository.CustomerMasterRepo;
import com.sysnik.selenium.repository.ProductRepo;

@Service("CategoryInterestService")
public class CategoryInterestService {

	@Autowired
	private CategoryInterestRepo catIntRepo;
	@Autowired
	private CustomerMasterRepo custMasterRepo;
	@Autowired
	private ProductRepo prdRepo;
	@Autowired
	private BranchParametersRepo branchParameterRepo;
	

	public BigDecimal getIntRateByCustNumber(String custNumber, String prdName) {
				
		try {
			return catIntRepo
					.findByCatCodeAndPrdIdAndEffDateLessThanEqual(
							custMasterRepo.findByCustNumber(custNumber).getCustCategory(),
							prdRepo.findByProdNameAndBankCode(prdName,"101")
									.getProd_id(),
							branchParameterRepo.findByBranchCode("2101").getCurrentDate())
					.getAdditionalIntRate();
		} catch (Exception e) {
			return new BigDecimal(0);		}
	}

}
