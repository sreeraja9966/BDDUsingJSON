package com.sysnik.selenium.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.entity.GroupMasterEntity;
import com.sysnik.selenium.fw.helper.ReportHelper;
import com.sysnik.selenium.fw.testBase.TestBase;
import com.sysnik.selenium.repository.GroupMasterRepo;

@Service("GroupMasterService")
public class GroupMasterService extends TestBase {
    
    @Autowired
    GroupMasterRepo groupMasterRepo;
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public GroupMasterEntity getGroupMasterByGroupName(String groupName) {
        GroupMasterEntity gm = new GroupMasterEntity();
        gm = groupMasterRepo.findByGroupName(groupName);
        if (gm.equals(null)) {
            reportHelper
                    .writeLogInCaseOfFailInChildTest("Record not found in Group Master with groupName::" + groupName);
            return null;
        } else {
            return gm;
        }
    }
    
}
