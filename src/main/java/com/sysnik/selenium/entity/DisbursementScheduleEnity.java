package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.context.annotation.Scope;

@Entity
@Scope(value = "prototype")
@Table(name = "LOAN_DISB_SCHEDULE")
public class DisbursementScheduleEnity {
    
    public DisbursementScheduleEnity() {
        super();
    }
    
    public DisbursementScheduleEnity(BigInteger id, String bankCode, BigInteger accId, Date entryDate, Date disbDate,
            BigDecimal disbAmt, String remark, String status, String enteredBy, String authBy, String isDisbursed) {
        super();
        this.id = id;
        this.bankCode = bankCode;
        this.accId = accId;
        this.entryDate = entryDate;
        this.disbDate = disbDate;
        this.disbAmt = disbAmt;
        this.remark = remark;
        this.status = status;
        this.enteredBy = enteredBy;
        this.authBy = authBy;
        this.isDisbursed = isDisbursed;
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "LOAN_DISB_SCHEDULE_SEQ_GEN")
    @Column(name = "ID", nullable = false, unique = true, length = 10)
    private BigInteger id;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "ACC_ID", nullable = false, length = 20)
    BigInteger accId;
    
    @Column(name = "ENTRY_DATE", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date entryDate;
    
    @Column(name = "DISB_DATE", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date disbDate;
    
    @Column(name = "DISB_AMOUNT", precision = 21, scale = 6, nullable = false,
            columnDefinition = "numeric(21,6) default '00000.000000'")
    private BigDecimal disbAmt;
    
    @Column(name = "REMARK", length = 50, nullable = false)
    private String remark;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    @Column(name = "ENTERED_BY", length = 20)
    private String enteredBy;
    
    @Column(name = "AUTH_BY", length = 20)
    private String authBy;
    
    @Column(name = "IS_DISBURESED", length = 1, nullable = false)
    private String isDisbursed;
    
    public BigInteger getId() {
        return id;
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
    
    public BigInteger getAccId() {
        return accId;
    }
    
    public void setAccId(BigInteger accId) {
        this.accId = accId;
    }
    
    public Date getEntryDate() {
        return entryDate;
    }
    
    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
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
    
    public String getRemark() {
        return remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
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
    
    public String getIsDisbursed() {
        return isDisbursed;
    }
    
    public void setIsDisbursed(String isDisbursed) {
        this.isDisbursed = isDisbursed;
    }
    
    @Override
    public String toString() {
        return "DisbursementScheduleEnity [id=" + id + ", bankCode=" + bankCode + ", accId=" + accId + ", entryDate="
                + entryDate + ", disbDate=" + disbDate + ", disbAmt=" + disbAmt + ", remark=" + remark + ", status="
                + status + ", enteredBy=" + enteredBy + ", authBy=" + authBy + ", isDisbursed=" + isDisbursed + "]";
    }
    
}
