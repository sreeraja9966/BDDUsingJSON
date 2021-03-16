package com.sysnik.selenium.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;

@Entity
@Scope("prototype")
@Table(name = "GROUP_MASTER")
public class GroupMasterEntity implements Serializable {
    
    @Id
    @Column(name = "SR_NO")
    private Integer serialNo;
    
    @Column(name = "BANK_CODE")
    private String bankCode;
    
    @Column(name = "GROUP_ID")
    private Integer groupId;
    
    @Column(name = "GROUP_NAME")
    private String groupName;
    
    @Column(name = "RECON_UPTO")
    private Date reconUpToDate;
    
    @Column(name = "STATUS")
    private String status;
    
    @Column(name = "AUTO_RECON_FLAG")
    private String autoReconFlag;
    
    public String getAutoReconFlag() {
        return autoReconFlag;
    }
    
    public void setAutoReconFlag(String autoReconFlag) {
        this.autoReconFlag = autoReconFlag;
    }
    
    public Integer getSerialNo() {
        return serialNo;
    }
    
    public void setSerialNo(Integer serialNo) {
        this.serialNo = serialNo;
    }
    
    public String getBankCode() {
        return bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    public Integer getGroupId() {
        return groupId;
    }
    
    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }
    
    public String getGroupName() {
        return groupName;
    }
    
    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
    
    public Date getReconUpToDate() {
        return reconUpToDate;
    }
    
    public void setReconUpToDate(Date reconUpToDate) {
        this.reconUpToDate = reconUpToDate;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    @Override
    public String toString() {
        return "GroupMasterEntity [serialNo=" + serialNo + ", bankCode=" + bankCode + ", groupId=" + groupId
                + ", groupName=" + groupName + ", reconUpToDate=" + reconUpToDate + ", status=" + status + "]";
    }
    
}
