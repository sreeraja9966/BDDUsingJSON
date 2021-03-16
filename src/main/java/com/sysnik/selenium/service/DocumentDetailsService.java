package com.sysnik.selenium.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.selenium.entity.CustomerMasterEntity;
import com.sysnik.selenium.entity.DocumentDetailsEntity;
import com.sysnik.selenium.entity.DocumentMasterEntity;
import com.sysnik.selenium.fw.helper.FilloExcelDataGetter;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.CustomerAccountRepo;
import com.sysnik.selenium.repository.CustomerMasterRepo;
import com.sysnik.selenium.repository.DocumentDetailsRepo;
import com.sysnik.selenium.repository.DocumentMasteRepo;

@Service("DocumentDetailsService")
public class DocumentDetailsService extends TestBase {
    
    FilloExcelDataGetter filloExcelDataGetter = new FilloExcelDataGetter();
    
    @Autowired
    private CustomerMasterRepo cmrepo;
    @Autowired
    private DocumentDetailsRepo ddrepo;
    @Autowired
    private CustomerAccountRepo carepo;
    @Autowired
    private DocumentMasteRepo dmrepo;
    
    private CustomerMasterEntity customerMaster;
    
    public List<String> getCustomerDocDescriptionForUI(String custNumber) {
        List<String> documentList = new ArrayList<>();
        List<DocumentDetailsEntity> docDetails = new ArrayList<>();
        List<DocumentMasterEntity> docMaster = new ArrayList<>();
        Date currentDate = branchParametersService.getBnrachLiveDate(property.getProperty("BranchCode"));
        
        customerMaster = cmrepo.findByCustNumber(custNumber);
        if (customerMaster.getStatus().equals("A")) {
            docDetails = ddrepo.findByCustAccIdAndStatus(customerMaster.getCustId(), "A");
        } else {
            docDetails = ddrepo.findByCustAccIdAndStatus(customerMaster.getCustId(), "E");
        }
        int i = 0;
        for (DocumentDetailsEntity docEntry : docDetails) {
            if (null == docEntry.getDocExpDate() || !currentDate.equals(docEntry.getDocExpDate())) {
                docMaster.add(dmrepo.findByDocId(docEntry.getDocId().longValue()));
                
                documentList.add(docMaster.get(i).getDescription());
                i++;
            }
            
        }
        
        return documentList;
    }
    
}
