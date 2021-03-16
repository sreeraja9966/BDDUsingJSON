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

/**
 * @author shashank.paranjape
 */
@Entity
@Table(name = "OTS_INT_WAIVER_LOG")
public class OtsIntWaiverLogEntity {
    
    @Id
    @Column(name = "ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "OTS_INT_WAIVER_LOG_SEQ")
    @SequenceGenerator(name = "OTS_INT_WAIVER_LOG_SEQ", sequenceName = "OTS_INT_WAIVER_LOG_SEQ", allocationSize = 1)
    private BigInteger id;
    
    @Column(name = "OTS_ID", nullable = false)
    private BigInteger otsId;
    
    @Column(name = "ACC_ID", nullable = false)
    private BigInteger accId;
    
    @Column(name = "FROM_DATE", nullable = false)
    private Date fromDate;
    
    @Column(name = "TO_DATE", nullable = false)
    private Date toDate;
    
    @Column(name = "INT_TYPE", nullable = false)
    private String intType;
    
    @Column(name = "INT_RATE", nullable = false)
    private BigDecimal intRate;
    
    @Column(name = "INTEREST_AMOUNT", nullable = false)
    private BigDecimal interestAmount;
    
    @Column(name = "ENTERED_DT", nullable = false)
    private Date enteredDate;
    
    @Column(name = "ENTERED_BY", nullable = false)
    private String enteredBy;
    
    @Column(name = "INT_CALCULATED")
    private BigDecimal intCalculated;
    
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
    
    public Date getFromDate() {
        return fromDate;
    }
    
    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }
    
    public Date getToDate() {
        return toDate;
    }
    
    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }
    
    public String getIntType() {
        return intType;
    }
    
    public void setIntType(String intType) {
        this.intType = intType;
    }
    
    public BigDecimal getIntRate() {
        return intRate;
    }
    
    public void setIntRate(BigDecimal intRate) {
        this.intRate = intRate;
    }
    
    public BigDecimal getInterestAmount() {
        return interestAmount;
    }
    
    public void setInterestAmount(BigDecimal interestAmount) {
        this.interestAmount = interestAmount;
    }
    
    public Date getEnteredDate() {
        return enteredDate;
    }
    
    public void setEnteredDate(Date enteredDate) {
        this.enteredDate = enteredDate;
    }
    
    public String getEnteredBy() {
        return enteredBy;
    }
    
    public void setEnteredBy(String enteredBy) {
        this.enteredBy = enteredBy;
    }
    
    public BigInteger getOtsId() {
        return otsId;
    }
    
    public void setOtsId(BigInteger otsId) {
        this.otsId = otsId;
    }
    
    public BigDecimal getIntCalculated() {
        return intCalculated;
    }
    
    public void setIntCalculated(BigDecimal intCalculated) {
        this.intCalculated = intCalculated;
    }
    
    @Override
    public String toString() {
        return "OtsIntWaiverLogEntity [id=" + id + ", otsId=" + otsId + ", accId=" + accId + ", fromDate=" + fromDate
                + ", toDate=" + toDate + ", intType=" + intType + ", intRate=" + intRate + ", interestAmount="
                + interestAmount + ", enteredDate=" + enteredDate + ", enteredBy=" + enteredBy + ", intCalculated="
                + intCalculated + "]";
    }
}