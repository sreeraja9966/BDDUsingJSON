package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "TRANSACTIONS")
public class TransactionEntity {
    @Id
    @Column(name = "ID", nullable = false, length = 10)
    private BigInteger id;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "BRANCH_CODE", length = 20, nullable = false)
    private String branchCode;
    
    @Column(name = "TRANS_MODE", length = 10, nullable = false)
    private String transactionMode;
    
    @Column(name = "TRANS_TYPE", length = 1, nullable = false)
    private String transactionType;
    
    @Column(name = "VOUCH_NO", length = 10, nullable = false)
    private long voucherNumber;
    
    @Column(name = "TRANS_NO", length = 10, nullable = false)
    private long transactionNumber;
    
    @Column(name = "TRANS_DT", nullable = false)
    private Date transactionDate;
    
    @Column(name = "PROD_ID", length = 5, nullable = false)
    private int producutId;
    
    @Column(name = "ACC_NO", length = 20, nullable = false)
    private String accountNumber;
    
    @Column(name = "TRANS_AMT", precision = 19, scale = 2, nullable = false)
    private BigDecimal transactionAmount;
    
    @Column(name = "CURRENCY", length = 10, nullable = false)
    private String currency;
    
    @Column(name = "INSTR_TYPE", length = 15, nullable = true)
    private String instrumentType;
    
    @Column(name = "INSTR_NO", length = 10, nullable = true)
    private long instrumentNumber;
    
    @Column(name = "INSTR_DT", nullable = true)
    private Date instrumentDate;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    @Column(name = "REMARK", length = 150, nullable = false)
    private String remark;
    
    @Column(name = "TOKEN_NO", length = 3, nullable = true)
    private int tokenNumber;
    
    @Column(name = "DEPOSITOR_NAME", length = 50, nullable = true)
    private String nameOfDepositor;
    
    @Column(name = "IDENTITY_DETAIL", length = 100, nullable = true)
    private String identityDetail;
    
    @Column(name = "OPERATOR_ID", length = 10, nullable = false)
    private String operatorId;
    
    @Column(name = "AUTH_ID", length = 10, nullable = true)
    private String authorizeId;
    
    @Column(name = "OPERATOR_IP", length = 23, nullable = false)
    private String operatorIp;
    
    @Column(name = "AUTHORIZE_IP", length = 23, nullable = true)
    private String authorizeIp;
    
    @Column(name = "AFTER_BAL", precision = 19, scale = 2, nullable = false)
    private BigDecimal afterBalance;
    
    @Column(name = "AUTH_DTT", nullable = true)
     private Date authorizeDate;
    
    @Column(name = "DR_CR", length = 1, nullable = true)
    private String drCr;
    
    @Column(name = "RECON_SEQ_ID")
    private BigInteger reconSeqId;
    
    public BigInteger getReconSeqId() {
		return reconSeqId;
	}

	public void setReconSeqId(BigInteger reconSeqId) {
		this.reconSeqId = reconSeqId;
	}

	public BigInteger getId() {
        return id;
    }
    
    public Date getAuthorizeDate() {
        return authorizeDate;
    }
    
    public void setAuthorizeDate(Date authorizeDate) {
        this.authorizeDate = authorizeDate;
    }
    
    public void setId(BigInteger id) {
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
    
    public String getTransactionMode() {
        return transactionMode;
    }
    
    public void setTransactionMode(String transactionMode) {
        this.transactionMode = transactionMode;
    }
    
    public String getTransactionType() {
        return transactionType;
    }
    
    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }
    
    public long getVoucherNumber() {
        return voucherNumber;
    }
    
    public void setVoucherNumber(long voucherNumber) {
        this.voucherNumber = voucherNumber;
    }
    
    public long getTransactionNumber() {
        return transactionNumber;
    }
    
    public void setTransactionNumber(long transactionNumber) {
        this.transactionNumber = transactionNumber;
    }
    
    public Date getTransactionDate() {
        return transactionDate;
    }
    
    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }
    
    public int getProducutId() {
        return producutId;
    }
    
    public void setProducutId(int producutId) {
        this.producutId = producutId;
    }
    
    public String getAccountNumber() {
        return accountNumber;
    }
    
    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
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
    
    public String getInstrumentType() {
        return instrumentType;
    }
    
    public void setInstrumentType(String instrumentType) {
        this.instrumentType = instrumentType;
    }
    
    public long getInstrumentNumber() {
        return instrumentNumber;
    }
    
    public void setInstrumentNumber(long instrumentNumber) {
        this.instrumentNumber = instrumentNumber;
    }
    
    public Date getInstrumentDate() {
        return instrumentDate;
    }
    
    public void setInstrumentDate(Date instrumentDate) {
        this.instrumentDate = instrumentDate;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getRemark() {
        return remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
    
    public int getTokenNumber() {
        return tokenNumber;
    }
    
    public void setTokenNumber(int tokenNumber) {
        this.tokenNumber = tokenNumber;
    }
    
    public String getNameOfDepositor() {
        return nameOfDepositor;
    }
    
    public void setNameOfDepositor(String nameOfDepositor) {
        this.nameOfDepositor = nameOfDepositor;
    }
    
    public String getIdentityDetail() {
        return identityDetail;
    }
    
    public void setIdentityDetail(String identityDetail) {
        this.identityDetail = identityDetail;
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
    
    public BigDecimal getAfterBalance() {
        return afterBalance;
    }
    
    public void setAfterBalance(BigDecimal afterBalance) {
        this.afterBalance = afterBalance;
    }
    
    /**
     * @return the drCr
     */
    public String getDrCr() {
        return drCr;
    }
    
    /**
     * @param drCr
     *            the drCr to set
     */
    public void setDrCr(String drCr) {
        this.drCr = drCr;
    }
    
    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "TransactionEntity [id=" + id + ", bankCode=" + bankCode + ", branchCode=" + branchCode
                + ", transactionMode=" + transactionMode + ", transactionType=" + transactionType + ", voucherNumber="
                + voucherNumber + ", transactionNumber=" + transactionNumber + ", transactionDate=" + transactionDate
                + ", producutId=" + producutId + ", accountNumber=" + accountNumber + ", transactionAmount="
                + transactionAmount + ", currency=" + currency + ", instrumentType=" + instrumentType
                + ", instrumentNumber=" + instrumentNumber + ", instrumentDate=" + instrumentDate + ", status=" + status
                + ", remark=" + remark + ", tokenNumber=" + tokenNumber + ", nameOfDepositor=" + nameOfDepositor
                + ", identityDetail=" + identityDetail + ", operatorId=" + operatorId + ", authorizeId=" + authorizeId
                + ", operatorIp=" + operatorIp + ", authorizeIp=" + authorizeIp + ", afterBalance=" + afterBalance
                + ", authorizeDate=" + authorizeDate + ", drCr=" + drCr + "]";
    }
    

}
