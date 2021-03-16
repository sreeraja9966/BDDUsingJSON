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

@Entity
@Table(name = "LOAN_SETTLEMENT_LOG")
public class LoanSettlementLogEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "loan_settlement_log_seq")
    @SequenceGenerator(name = "loan_settlement_log_seq", sequenceName = "loan_settlement_log_seq", allocationSize = 1)
    @Column(name = "ID")
    private BigInteger id;
    
    @Column(name = "ACC_ID", nullable = false)
    private BigInteger accId;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "BRANCH_CODE", length = 20, nullable = false)
    private String branchCode;
    
    @Column(name = "ACTUAL_INT_AMT", nullable = false)
    private BigDecimal actualInterestAmount;
    
    @Column(name = "INT_WAIVER_AMT", nullable = false)
    private BigDecimal interestWaiverAmount;
    
    @Column(name = "PREV_RECIEVABLE_AMT", nullable = false)
    private BigDecimal prevRecievableAmount;
    
    @Column(name = "RECIEVABLE_AMT", nullable = false)
    private BigDecimal recievableAmount;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    @Column(name = "ENTER_BY", length = 10, nullable = false)
    private String enterBy;
    
    @Column(name = "ENTERED_DT")
    private Date enteredDate;
    
    @Column(name = "AUTH_BY", length = 10)
    private String authBy;
    
    public BigInteger getId() {
        return id;
    }
    
    public void setId(BigInteger id) {
        this.id = id;
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
    
    public String getBranchCode() {
        return branchCode;
    }
    
    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }
    
    public BigDecimal getActualInterestAmount() {
        return actualInterestAmount;
    }
    
    public void setActualInterestAmount(BigDecimal actualInterestAmount) {
        this.actualInterestAmount = actualInterestAmount;
    }
    
    public BigDecimal getInterestWaiverAmount() {
        return interestWaiverAmount;
    }
    
    public void setInterestWaiverAmount(BigDecimal interestWaiverAmount) {
        this.interestWaiverAmount = interestWaiverAmount;
    }
    
    public BigDecimal getPrevRecievableAmount() {
        return prevRecievableAmount;
    }
    
    public void setPrevRecievableAmount(BigDecimal prevRecievableAmount) {
        this.prevRecievableAmount = prevRecievableAmount;
    }
    
    public BigDecimal getRecievableAmount() {
        return recievableAmount;
    }
    
    public void setRecievableAmount(BigDecimal recievableAmount) {
        this.recievableAmount = recievableAmount;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getEnterBy() {
        return enterBy;
    }
    
    public void setEnterBy(String enterBy) {
        this.enterBy = enterBy;
    }
    
    public Date getEnteredDate() {
        return enteredDate;
    }
    
    public void setEnteredDate(Date enteredDate) {
        this.enteredDate = enteredDate;
    }
    
    public String getAuthBy() {
        return authBy;
    }
    
    public void setAuthBy(String authBy) {
        this.authBy = authBy;
    }
    
    @Override
    public String toString() {
        return "LoanSettlementLogEntity [id=" + id + ", accId=" + accId + ", bankCode=" + bankCode + ", branchCode="
                + branchCode + ", actualInterestAmount=" + actualInterestAmount + ", interestWaiverAmount="
                + interestWaiverAmount + ", prevRecievableAmount=" + prevRecievableAmount + ", recievableAmount="
                + recievableAmount + ", status=" + status + ", enterBy=" + enterBy + ", enteredDate=" + enteredDate
                + ", authBy=" + authBy + "]";
    }
    
}
