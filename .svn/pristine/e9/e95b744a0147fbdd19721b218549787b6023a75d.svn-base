package com.sysnik.selenium.entity;

import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "AADHAR_MAPPER")
public class AadharMapperEntity {
    
    @Id
    @Column(name = "ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "AADHAR_MAPPER_SEQ")
    @SequenceGenerator(name = "AADHAR_MAPPER_SEQ", sequenceName = "AADHAR_MAPPER_SEQ", allocationSize = 1)
    private BigInteger id;
    
    @Column(name = "CUST_ID", nullable = false)
    private BigInteger custId;
    
    @Column(name = "ACC_ID", nullable = false)
    private BigInteger accId;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "AADHAR", length = 12, nullable = false)
    private String aadhar;
    
    @Column(name = "ENTRY_DATE", nullable = false)
    private Date entryDate;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    @Column(name = "ENTERED_BY", length = 10, nullable = false)
    private String enteredBy;
    
    @Column(name = "AUTH_BY", length = 10)
    private String authBy;
    
    @Column(name = " NPCI_REJECTION_CODE", length = 12, nullable = false)
    private String npciRejectionCode;
    
    @Column(name = "CANCEL_DATE", nullable = false)
    private Date cancelDate;
    
    public BigInteger getId() {
        return id;
    }
    
    public void setId(BigInteger id) {
        this.id = id;
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
    
    public String getBankCode() {
        return bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    public String getAadhar() {
        return aadhar;
    }
    
    public void setAadhar(String aadhar) {
        this.aadhar = aadhar;
    }
    
    public Date getEntryDate() {
        return entryDate;
    }
    
    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getEnteredBy() {
        return enteredBy;
    }
    
    public void setEnteredBy(String enteredBy) {
        this.enteredBy = enteredBy;
    }
    
    public String getAuthBy() {
        return authBy;
    }
    
    public void setAuthBy(String authBy) {
        this.authBy = authBy;
    }
    
    public String getNpciRejectionCode() {
        return npciRejectionCode;
    }
    
    public void setNpciRejectionCode(String npciRejectionCode) {
        this.npciRejectionCode = npciRejectionCode;
    }
    
    public Date getCancelDate() {
        return cancelDate;
    }
    
    public void setCancelDate(Date cancelDate) {
        this.cancelDate = cancelDate;
    }
    
}
