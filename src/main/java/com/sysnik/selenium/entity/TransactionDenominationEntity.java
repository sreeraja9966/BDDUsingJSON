package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TRANS_DENOM")
public class TransactionDenominationEntity {
    
    @Column(name = "DENOM_QTY", length = 5, nullable = false)
    private int denomQty;
    
    @Id
    @Column(name = "ID", length = 10, nullable = false)
    private long id;
    
    @Column(name = "VOUCHER_NUM", length = 10, nullable = false)
    private long voucherNumber;
    
    @Column(name = "DENOM_RATE", precision = 17, scale = 2, nullable = false)
    private BigDecimal denomRate;
    
    @Column(name = "DENOM_AMT", precision = 17, scale = 2, nullable = false)
    private BigDecimal denomAmount;
    
    @Column(name = "TRANS_AMT", precision = 17, scale = 2, nullable = false)
    private BigDecimal transactionAmount;
    
    @Column(name = "TRANS_DTT", nullable = false)
    private Date transactionDateTime;
    
    @Column(name = "TRANS_TYPE", length = 1, nullable = false)
    private String transType;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    @Column(name = "DENOM_CODE", length = 3, nullable = false)
    private String denomCode;
    
    @Column(name = "USER_ID", length = 20, nullable = false)
    private String userId;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "TRANS_ID", nullable = false, length = 10)
    private BigInteger transId;
    
    @Column(name = "BRANCH_CODE", length = 20, nullable = false)
    private String branchCode;
    
    public int getDenomQty() {
        return denomQty;
    }
    
    public void setDenomQty(int denomQty) {
        this.denomQty = denomQty;
    }
    
    public long getId() {
        return id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
    
    public long getVoucherNumber() {
        return voucherNumber;
    }
    
    public void setVoucherNumber(long voucherNumber) {
        this.voucherNumber = voucherNumber;
    }
    
    public BigDecimal getDenomRate() {
        return denomRate;
    }
    
    public void setDenomRate(BigDecimal denomRate) {
        this.denomRate = denomRate;
    }
    
    public BigDecimal getDenomAmount() {
        return denomAmount;
    }
    
    public void setDenomAmount(BigDecimal denomAmount) {
        this.denomAmount = denomAmount;
    }
    
    public BigDecimal getTransactionAmount() {
        return transactionAmount;
    }
    
    public void setTransactionAmount(BigDecimal transactionAmount) {
        this.transactionAmount = transactionAmount;
    }
    
    public Date getTransactionDateTime() {
        return transactionDateTime;
    }
    
    public void setTransactionDateTime(Date transactionDateTime) {
        this.transactionDateTime = transactionDateTime;
    }
    
    public String getTransType() {
        return transType;
    }
    
    public void setTransType(String transType) {
        this.transType = transType;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getDenomCode() {
        return denomCode;
    }
    
    public void setDenomCode(String denomCode) {
        this.denomCode = denomCode;
    }
    
    public String getUserId() {
        return userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    public String getBankCode() {
        return bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    public String getBranchCode() {
        return branchCode;
    }
    
    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }
    
    public BigInteger getTransId() {
        return transId;
    }
    
    public void setTransId(BigInteger transId) {
        this.transId = transId;
    }
    
    @Override
    public String toString() {
        return "TransactionDenominationEntity [denomQty=" + denomQty + ", id=" + id + ", voucherNumber=" + voucherNumber
                + ", denomRate=" + denomRate + ", denomAmount=" + denomAmount + ", transactionAmount="
                + transactionAmount + ", transactionDateTime=" + transactionDateTime + ", transType=" + transType
                + ", status=" + status + ", denomCode=" + denomCode + ", userId=" + userId + ", bankCode=" + bankCode
                + ", transId=" + transId + ", branchCode=" + branchCode + "]";
    }

}
