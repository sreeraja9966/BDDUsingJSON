package com.sysnik.selenium.entity;

import java.io.Serializable;
import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.context.annotation.Scope;

@Entity
@Scope("prototype")
@Table(name = "INVENTORY")
public class ChequeBookInventoryEntity implements Serializable {
    
    private static final long serialVersionUID = 3584716262299734651L;
    
    public ChequeBookInventoryEntity() {
        
    }
    
    @Id
    @GenericGenerator(name = "gen", strategy = "increment")
    @Column(name = "ID", nullable = false)
    private BigInteger ID;
    
    @Column(name = "BRANCH_CODE", nullable = false)
    private String branchCode;
    
    @Column(name = "BANK_CODE", nullable = false)
    private String bankCode;
    
    @Column(name = "PRD_ID", nullable = false)
    private int prdId;
    
    @Column(name = "PRD_TYPE")
    private String prdType;
    
    @Column(name = "PRD_FROM_NO")
    private Integer prdFromNo;
    
    @Column(name = "PRD_TO_NUMBER")
    private Integer prdToNo;
    
    @Column(name = "STATUS", nullable = false)
    private String status;
    
    @Column(name = "LAST_CHQ_NO")
    private Integer lastChqNo;
    
    @Column(name = "NO_OF_LEAVES")
    private Integer noOfLeaves;
    
    @Transient
    private Integer lastChqNoTemp;
    
    public Integer getLastChqNoTemp() {
        return lastChqNoTemp;
    }
    
    public void setLastChqNoTemp(Integer lastChqNoTemp) {
        this.lastChqNoTemp = lastChqNoTemp;
    }
    
    public BigInteger getID() {
        return ID;
    }
    
    public void setID(BigInteger iD) {
        ID = iD;
    }
    
    public String getBranchCode() {
        return branchCode;
    }
    
    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }
    
    public String getBankCode() {
        return bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    public int getPrdId() {
        return prdId;
    }
    
    public void setPrdId(int prdId) {
        this.prdId = prdId;
    }
    
    public String getPrdType() {
        return prdType;
    }
    
    public void setPrdType(String prdType) {
        this.prdType = prdType;
    }
    
    public Integer getPrdFromNo() {
        return prdFromNo;
    }
    
    public void setPrdFromNo(Integer prdFromNo) {
        this.prdFromNo = prdFromNo;
    }
    
    public Integer getPrdToNo() {
        return prdToNo;
    }
    
    public void setPrdToNo(Integer prdToNo) {
        this.prdToNo = prdToNo;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Integer getLastChqNo() {
        return lastChqNo;
    }
    
    public void setLastChqNo(Integer lastChqNo) {
        this.lastChqNo = lastChqNo;
    }
    
    public Integer getNoOfLeaves() {
        return noOfLeaves;
    }
    
    public void setNoOfLeaves(Integer noOfLeaves) {
        this.noOfLeaves = noOfLeaves;
    }
    
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
    @Override
    public String toString() {
        return "ChequeBookInventoryEntity [ID=" + ID + ", branchCode=" + branchCode + ", bankCode=" + bankCode
                + ", prdId=" + prdId + ", prdType=" + prdType + ", prdFromNo=" + prdFromNo + ", prdToNo=" + prdToNo
                + ", status=" + status + ", lastChqNo=" + lastChqNo + ", noOfLeaves=" + noOfLeaves + "]";
    }
    
}
