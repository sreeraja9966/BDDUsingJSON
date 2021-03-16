package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity

@Table(name = "sbinterestrates")
public class SbInterestRates {
    @Id
    
    @Column(name = "ID", nullable = false, unique = true)
    private BigInteger id;
    
    @Column(name = "bankCode", nullable = false)
    private String bankCode;
    
    @Column(name = "effective_from", nullable = false)
    private Date effDate;
    @Column(name = "effective_to", nullable = false)
    private Date effToDate;
    @Column(name = "entered_date", nullable = false)
    private Date enterDate;
    @Column(name = "prd_id", nullable = false)
    private int productCode;
    
    @Column(name = "from_amount", nullable = false)
    private BigDecimal fromAmt;
    
    @Column(name = "to_amount", nullable = false)
    private BigDecimal toAmt;
    
    @Column(name = "rate_of_interest", nullable = false)
    private BigDecimal intRate;
    @Column(name = "prematurepenalroi", nullable = false)
    private BigDecimal penalIntRate;
    
    @Column(name = "entered_by", nullable = false)
    private String enterBy;
    
    @Column(name = "from_day")
    private int fromDays;
    
    @Column(name = "to_day")
    private int toDays;
    
    @Column(name = "from_month")
    private int fromMonth;
    
    @Column(name = "to_month")
    private int toMonth;
    
    public BigInteger getId() {
        return id;
    }
    
    public void setId(BigInteger id) {
        this.id = id;
    }
    
    public Date getEffToDate() {
        return effToDate;
    }
    
    public void setEffToDate(Date effToDate) {
        this.effToDate = effToDate;
    }
    
    public Date getEnterDate() {
        return enterDate;
    }
    
    public void setEnterDate(Date enterDate) {
        this.enterDate = enterDate;
    }
    
    public BigDecimal getPenalIntRate() {
        return penalIntRate;
    }
    
    public void setPenalIntRate(BigDecimal penalIntRate) {
        this.penalIntRate = penalIntRate;
    }
    
    public String getEnterBy() {
        return enterBy;
    }
    
    public void setEnterBy(String enterBy) {
        this.enterBy = enterBy;
    }
    
    public String getBankCode() {
        return bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    public Date getEffDate() {
        return effDate;
    }
    
    public void setEffDate(Date effDate) {
        this.effDate = effDate;
    }
    
    public int getProductCode() {
        return productCode;
    }
    
    public void setProductCode(int productCode) {
        this.productCode = productCode;
    }
    
    public BigDecimal getFromAmt() {
        return fromAmt;
    }
    
    public void setFromAmt(BigDecimal fromAmt) {
        this.fromAmt = fromAmt;
    }
    
    public BigDecimal getToAmt() {
        return toAmt;
    }
    
    public void setToAmt(BigDecimal toAmt) {
        this.toAmt = toAmt;
    }
    
    public BigDecimal getIntRate() {
        return intRate;
    }
    
    public void setIntRate(BigDecimal intRate) {
        this.intRate = intRate;
    }
    
    public int getFromDays() {
        return fromDays;
    }
    
    public void setFromDays(int fromDays) {
        this.fromDays = fromDays;
    }
    
    public int getToDays() {
        return toDays;
    }
    
    public void setToDays(int toDays) {
        this.toDays = toDays;
    }
    
    public int getFromMonth() {
        return fromMonth;
    }
    
    public void setFromMonth(int fromMonth) {
        this.fromMonth = fromMonth;
    }
    
    public int getToMonth() {
        return toMonth;
    }
    
    public void setToMonth(int toMonth) {
        this.toMonth = toMonth;
    }
    
    @Override
    public String toString() {
        return "SbInterestRates [id=" + id + ", bankCode=" + bankCode + ", effDate=" + effDate + ", effToDate="
                + effToDate + ", enterDate=" + enterDate + ", productCode=" + productCode + ", fromAmt=" + fromAmt
                + ", toAmt=" + toAmt + ", intRate=" + intRate + ", penalIntRate=" + penalIntRate + ", enterBy="
                + enterBy + ", fromDays=" + fromDays + ", toDays=" + toDays + ", fromMonth=" + fromMonth + ", toMonth="
                + toMonth + ", getId()=" + getId() + ", getEffToDate()=" + getEffToDate() + ", getEnterDate()="
                + getEnterDate() + ", getPenalIntRate()=" + getPenalIntRate() + ", getEnterBy()=" + getEnterBy()
                + ", getBankCode()=" + getBankCode() + ", getEffDate()=" + getEffDate() + ", getProductCode()="
                + getProductCode() + ", getFromAmt()=" + getFromAmt() + ", getToAmt()=" + getToAmt() + ", getIntRate()="
                + getIntRate() + ", getFromDays()=" + getFromDays() + ", getToDays()=" + getToDays()
                + ", getFromMonth()=" + getFromMonth() + ", getToMonth()=" + getToMonth() + ", getClass()=" + getClass()
                + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
    }
}
