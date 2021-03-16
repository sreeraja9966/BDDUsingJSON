package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "FD_INT_DETAILS")

public class FixedDepositIntDetailsEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "fd_int_details_gen")
    @SequenceGenerator(name = "fd_int_details_gen", sequenceName = "fd_int_details_seq", allocationSize = 1)
    @Column(name = "ID")
    private BigInteger id;
    
    @Column(name = "ACC_ID")
    private BigInteger accountID;
    
    @Column(name = "DEPOSIT_AMOUNT")
    private BigDecimal depositAmount;
    
    @Column(name = "INT_RATE")
    private BigDecimal interestRate;
    
    @Column(name = "INT_DATE")
    @JsonFormat(pattern = "yyyy/MM/dd hh:mm:ss")
    private Date interestDate;
    
    @Column(name = "INT_AMOUNT")
    private BigDecimal interestAmount;
    
    @Column(name = "INT_CALC_TYPE")
    private String interestCalculationType;
    
    @Column(name = "STATUS")
    private String status;
    
    public BigInteger getId() {
        return id;
    }
    
    public void setId(BigInteger id) {
        this.id = id;
    }
    
    public BigInteger getAccountID() {
        return accountID;
    }
    
    public void setAccountID(BigInteger accountID) {
        this.accountID = accountID;
    }
    
    public BigDecimal getDepositAmount() {
        return depositAmount;
    }
    
    public void setDepositAmount(BigDecimal depositAmount) {
        this.depositAmount = depositAmount;
    }
    
    public BigDecimal getInterestRate() {
        return interestRate;
    }
    
    public void setInterestRate(BigDecimal interestRate) {
        this.interestRate = interestRate;
    }
    
    public Date getInterestDate() {
        return interestDate;
    }
    
    public void setInterestDate(Date interestDate) {
        this.interestDate = interestDate;
    }
    
    public BigDecimal getInterestAmount() {
        return interestAmount;
    }
    
    public void setInterestAmount(BigDecimal interestAmount) {
        this.interestAmount = interestAmount;
    }
    
    public String getInterestCalculationType() {
        return interestCalculationType;
    }
    
    public void setInterestCalculationType(String interestCalculationType) {
        this.interestCalculationType = interestCalculationType;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    @Override
    public String toString() {
        return "FixedDepositIntDetailsEntity [id=" + id + ", accountID=" + accountID + ", depositAmount="
                + depositAmount + ", interestRate=" + interestRate + ", interestDate=" + interestDate
                + ", interestAmount=" + interestAmount + ", interestCalculationType=" + interestCalculationType
                + ", status=" + status + "]";
    }
}
