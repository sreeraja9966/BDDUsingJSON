package com.sysnik.selenium.entity;

import java.math.BigDecimal;
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
@Scope(value = "prototype")
@Table(name = "LOAN_DISBURSEMENT")
public class LoanDisbursementEntity {
    
    public LoanDisbursementEntity() {
        super();
    }
    
    public LoanDisbursementEntity(BigInteger id, String bankCode, String branchCode, int prdId, BigInteger accId,
            BigInteger scheduleId, Date disbDate, BigDecimal disbAmt, BigInteger voucherNo, String status,
            String enteredBy, String authBy, BigInteger marginVoucherNo, String marginBranch, Date marginTrnDate,
            String marginTransactionType, String transactionType) {
        super();
        id = id;
        this.bankCode = bankCode;
        this.branchCode = branchCode;
        this.prdId = prdId;
        this.accId = accId;
        this.scheduleId = scheduleId;
        this.disbDate = disbDate;
        this.disbAmt = disbAmt;
        this.voucherNo = voucherNo;
        this.status = status;
        this.enteredBy = enteredBy;
        this.authBy = authBy;
        this.marginVoucherNo = marginVoucherNo;
        this.marginBranch = marginBranch;
        this.marginTrnDate = marginTrnDate;
        this.marginTransactionType = marginTransactionType;
        this.transactionType = transactionType;
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "LOAN_DISB_SCHEDULE_SEQ_GEN")
    @SequenceGenerator(name = "LOAN_DISB_SCHEDULE_SEQ_GEN", sequenceName = "LOAN_DISB_SCHEDULE_SEQ", allocationSize = 1)
    @Column(name = "ID", nullable = false, unique = true, length = 10)
    private BigInteger id;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "BRANCH_CODE", length = 20, nullable = false)
    private String branchCode;
    
    @Column(name = "PROD_ID", length = 5, nullable = false)
    private int prdId;
    
    @Column(name = "ACC_ID", nullable = false, length = 20)
    BigInteger accId;
    
    @Column(name = "SCHEDULE_ID", nullable = false)
    private BigInteger scheduleId;
    
    @Column(name = "DISB_DATE", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date disbDate;
    
    @Column(name = "DISB_AMOUNT", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal disbAmt;
    
    @Column(name = "VOUCH_NO", nullable = false)
    private BigInteger voucherNo;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    @Column(name = "ENTERED_BY", length = 20)
    private String enteredBy;
    
    @Column(name = "AUTH_BY", length = 20)
    private String authBy;
    
    @Column(name = "MARGINVOUCH_NO")
    private BigInteger marginVoucherNo;
    
    @Column(name = "MARGIN_BRANCH", length = 20)
    private String marginBranch;
    
    @Column(name = "MARGINTRN_DT")
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date marginTrnDate;
    
    @Column(name = "MARGINTRN_TYPE", length = 1, nullable = false)
    private String marginTransactionType;
    
    @Column(name = "TRANS_TYPE", length = 1, nullable = false)
    private String transactionType;
    
    public BigInteger getId() {
        return id;
    }
    
    public void setId(BigInteger ID) {
        id = ID;
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
    
    public int getPrdId() {
        return prdId;
    }
    
    public void setPrdId(int prdId) {
        this.prdId = prdId;
    }
    
    public BigInteger getAccId() {
        return accId;
    }
    
    public void setAccId(BigInteger accId) {
        this.accId = accId;
    }
    
    public BigInteger getScheduleId() {
        return scheduleId;
    }
    
    public void setScheduleId(BigInteger scheduleId) {
        this.scheduleId = scheduleId;
    }
    
    public Date getDisbDate() {
        return disbDate;
    }
    
    public void setDisbDate(Date disbDate) {
        this.disbDate = disbDate;
    }
    
    public BigDecimal getDisbAmt() {
        return disbAmt;
    }
    
    public void setDisbAmt(BigDecimal disbAmt) {
        this.disbAmt = disbAmt;
    }
    
    public BigInteger getVoucherNo() {
        return voucherNo;
    }
    
    public void setVoucherNo(BigInteger voucherNo) {
        this.voucherNo = voucherNo;
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
    
    public BigInteger getMarginVoucherNo() {
        return marginVoucherNo;
    }
    
    public void setMarginVoucherNo(BigInteger marginVoucherNo) {
        this.marginVoucherNo = marginVoucherNo;
    }
    
    public String getMarginBranch() {
        return marginBranch;
    }
    
    public void setMarginBranch(String marginBranch) {
        this.marginBranch = marginBranch;
    }
    
    public Date getMarginTrnDate() {
        return marginTrnDate;
    }
    
    public void setMarginTrnDate(Date marginTrnDate) {
        this.marginTrnDate = marginTrnDate;
    }
    
    public String getMarginTransactionType() {
        return marginTransactionType;
    }
    
    public void setMarginTransactionType(String marginTransactionType) {
        this.marginTransactionType = marginTransactionType;
    }
    
    public String getTransactionType() {
        return transactionType;
    }
    
    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }
    
    @Override
    public String toString() {
        return "LoanDisbursementEntity [Id=" + id + ", bankCode=" + bankCode + ", branchCode=" + branchCode + ", prdId="
                + prdId + ", accId=" + accId + ", scheduleId=" + scheduleId + ", disbDate=" + disbDate + ", disbAmt="
                + disbAmt + ", voucherNo=" + voucherNo + ", status=" + status + ", enteredBy=" + enteredBy + ", authBy="
                + authBy + ", marginVoucherNo=" + marginVoucherNo + ", marginBranch=" + marginBranch
                + ", marginTrnDate=" + marginTrnDate + ", marginTransactionType=" + marginTransactionType
                + ", transactionType=" + transactionType + "]";
    }
    
}
