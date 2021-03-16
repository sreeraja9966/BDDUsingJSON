package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Time;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "TRANSACTION_HEADER")
public class TransactionHeaderEntity {
	@Id
    @Column(name = "ID", nullable = false, length = 10)
    private Long id;
    
    @Column(name = "BANK_CODE")
    private String bankCode;
    
    @Column(name = "BRANCH_CODE")
    private String branchCode;
    
    @Column(name = "TRANS_TYPE")
    private String transType;
    
    @Column(name = "VOUCH_NO")
    private Long voucherNumber;
    
    @Column(name = "TOKEN_NO")
    private Integer tokenNumber;
    
    @Column(name = "TRANS_DT")
    private Date transactionDate;
    
    @Column(name = "TRANS_TIME")
    @CreationTimestamp
    private Time transactionTime;
    
    @Column(name = "TRANS_AMT")
    private BigDecimal transactionAmount;
    
    @Column(name = "CURRENCY")
    private String currency;
    
    @Column(name = "TRANS_COUNT")
    private Long transactionCount;
    
    @Column(name = "STATUS")
    
    private String status;
    
    @Column(name = "AUTH_DTT")
    private Date authorizationTime;
    
    @Column(name = "OPERATOR_ID")
    private String operatorId;
    
    @Column(name = "AUTH_ID")
    private String authorizeId;
    
    @Column(name = "OPERATOR_IP")
    private String operatorIp;
    
    @Column(name = "AUTHORIZE_IP")
    private String authorizeIp;
    
    @Column(name = "PARENT_VOUCH_NO")
    private Long parentVoucherNumber;
    
    
    
    public Long getId() {
        return id;
    }
    
    public void setId(long id) {
        this.id = id;
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
    
    public String getTransType() {
        return transType;
    }
    
    public void setTransType(String transType) {
        this.transType = transType;
    }
    
    public Long getVoucherNumber() {
        return voucherNumber;
    }
    
    public void setVoucherNumber(long voucherNumber) {
        this.voucherNumber = voucherNumber;
    }
    
    public Integer getTokenNumber() {
        return tokenNumber;
    }
    
    public void setTokenNumber(int tokenNumber) {
        this.tokenNumber = tokenNumber;
    }
    
    public Date getTransactionDate() {
        return transactionDate;
    }
    
    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }
    
    public BigDecimal getTransactionAmount() {
        return transactionAmount;
    }
    
    public void setTransactionAmount(BigDecimal transactionAmount) {
        this.transactionAmount = transactionAmount;
    }
    
    public String getCurrency() {
        return currency;
    }
    
    public void setCurrency(String currency) {
        this.currency = currency;
    }
    
    public Long getTransactionCount() {
        return transactionCount;
    }
    
    public void setTransactionCount(long transactionCount) {
        this.transactionCount = transactionCount;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Date getAuthorizationTime() {
        return authorizationTime;
    }
    
    public void setAuthorizationTime(Date authorizationTime) {
        this.authorizationTime = authorizationTime;
    }
    
    public String getOperatorId() {
        return operatorId;
    }
    
    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId;
    }
    
    public String getAuthorizeId() {
        return authorizeId;
    }
    
    public void setAuthorizeId(String authorizeId) {
        this.authorizeId = authorizeId;
    }
    
    public String getOperatorIp() {
        return operatorIp;
    }
    
    public void setOperatorIp(String operatorIp) {
        this.operatorIp = operatorIp;
    }
    
    public String getAuthorizeIp() {
        return authorizeIp;
    }
    
    public void setAuthorizeIp(String authorizeIp) {
        this.authorizeIp = authorizeIp;
    }
    
    
    
    public Time getTransactionTime() {
        return transactionTime;
    }
    
    public void setTransactionTime(Time transactionTime) {
        this.transactionTime = transactionTime;
    }
    
    public Long getParentVoucherNumber() {
        return parentVoucherNumber;
    }
    
    public void setParentVoucherNumber(Long parentVoucherNumber) {
        this.parentVoucherNumber = parentVoucherNumber;
    }
    
    @Override
    public String toString() {
        return "TransactionHeaderEntity [id=" + id + ", bankCode=" + bankCode + ", branchCode=" + branchCode
                + ", transType=" + transType + ", voucherNumber=" + voucherNumber + ", tokenNumber=" + tokenNumber
                + ", transactionDate=" + transactionDate + ", transactionTime=" + transactionTime
                + ", transactionAmount=" + transactionAmount + ", currency=" + currency + ", transactionCount="
                + transactionCount + ", status=" + status + ", authorizationTime=" + authorizationTime + ", operatorId="
                + operatorId + ", authorizeId=" + authorizeId + ", operatorIp=" + operatorIp + ", authorizeIp="
                + authorizeIp + " , parentVoucherNumber=" + parentVoucherNumber + ", transactionsDetailEntity="
                 + "]";
    }
}
