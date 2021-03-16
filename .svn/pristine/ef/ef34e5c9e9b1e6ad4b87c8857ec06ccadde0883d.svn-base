package com.sysnik.selenium.entity;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.context.annotation.Scope;



@Entity
@Table(name = "FREEZE_DETAILS")
public class FreezeDetailsEntity implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    public FreezeDetailsEntity() {
        super();
    }
    
    @Id
    @Column(name = "ID", length = 10)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "freeze_details_seq")
    @SequenceGenerator(name = "freeze_details_seq", sequenceName = "freeze_details_seq", allocationSize = 1)
    
    private BigInteger Id;
    
    @Column(name = "BANK_CODE", length = 20)
    private String bankCode;
    
    @Column(name = "CUST_ID", length = 20)
    private BigInteger custId;
    
    @Column(name = "ACC_ID", length = 20)
    private BigInteger accId;
    
    @Column(name = "FREEZE_STATUS", length = 1)
    private String freezeStatus;
    
    @Column(name = "FREEZE_TYPE", length = 1)
    private String freezeType;
    
    @Column(name = "FREEZE_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date freezeDate;
    
    @Column(name = "FREEZE_REASON", length = 30)
    private String freezeReason;
    
    @Column(name = "FREEZE_BY", length = 20)
    private String freezeBy;
    
    @Column(name = "FREEZE_AUTH_BY", length = 20)
    private String freezeAuthBy;
    
    @Column(name = "REVOKE_BY", length = 20)
    private String revokeBy;
    
    @Column(name = "REVOKE_AUTH_BY", length = 20)
    private String revokeAuthBy;
    
    @Column(name = "REVOKE_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date revokeDate;
    
    @Column(name = "BATCH_NO")
    private BigInteger batchNo;
    
    @Column(name = "BRANCH_CODE", length = 20)
    private String branchCode;
    
    public BigInteger getId() {
        return Id;
    }
    
    public void setId(BigInteger id) {
        Id = id;
    }
    
    public String getBankCode() {
        return bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    public BigInteger getCustId() {
        return custId;
    }
    
    public void setCustId(BigInteger custId) {
        this.custId = custId;
    }
    
    public BigInteger getAccId() {
        return accId;
    }
    
    public void setAccId(BigInteger accId) {
        this.accId = accId;
    }
    
    public String getFreezeStatus() {
        return freezeStatus;
    }
    
    public void setFreezeStatus(String freezeStatus) {
        this.freezeStatus = freezeStatus;
    }
    
    public String getFreezeType() {
        return freezeType;
    }
    
    public void setFreezeType(String freezeType) {
        this.freezeType = freezeType;
    }
    
    public Date getFreezeDate() {
        return freezeDate;
    }
    
    public void setFreezeDate(Date freezeDate) {
        this.freezeDate = freezeDate;
    }
    
    public String getFreezeReason() {
        return freezeReason;
    }
    
    public void setFreezeReason(String freezeReason) {
        this.freezeReason = freezeReason;
    }
    
    public String getFreezeBy() {
        return freezeBy;
    }
    
    public void setFreezeBy(String freezeBy) {
        this.freezeBy = freezeBy;
    }
    
    public String getFreezeAuthBy() {
        return freezeAuthBy;
    }
    
    public void setFreezeAuthBy(String freezeAuthBy) {
        this.freezeAuthBy = freezeAuthBy;
    }
    
    public String getRevokeBy() {
        return revokeBy;
    }
    
    public void setRevokeBy(String revokeBy) {
        this.revokeBy = revokeBy;
    }
    
    public String getRevokeAuthBy() {
        return revokeAuthBy;
    }
    
    public void setRevokeAuthBy(String revokeAuthBy) {
        this.revokeAuthBy = revokeAuthBy;
    }
    
    public Date getRevokeDate() {
        return revokeDate;
    }
    
    public void setRevokeDate(Date revokeDate) {
        this.revokeDate = revokeDate;
    }
    
    public BigInteger getBatchNo() {
        return batchNo;
    }
    
    public void setBatchNo(BigInteger batchNo) {
        this.batchNo = batchNo;
    }
    
    public String getBranchCode() {
        return branchCode;
    }
    
    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }
    
    @Override
    public String toString() {
        return "FreezeDetailsEntity [Id=" + Id + ", bankCode=" + bankCode + ", custId=" + custId + ", accId=" + accId
                + ", freezeStatus=" + freezeStatus + ", freezeType=" + freezeType + ", freezeDate=" + freezeDate
                + ", freezeReason=" + freezeReason + ", freezeBy=" + freezeBy + ", freezeAuthBy=" + freezeAuthBy
                + ", revokeBy=" + revokeBy + ", revokeAuthBy=" + revokeAuthBy + ", revokeDate=" + revokeDate
                + ", batchNo=" + batchNo + ", branchCode=" + branchCode + "]";
    }
}
