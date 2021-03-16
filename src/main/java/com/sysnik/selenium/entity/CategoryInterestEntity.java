package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity

@Table(name = "CAT_INT_RATES")
public class CategoryInterestEntity {
    
   
    public CategoryInterestEntity() {
        
    }
    
    @Id
    @Column(name = "ID", nullable = false, unique = true, length = 10)
    private int id;
    
    @Column(name = "ADDITIONAL_INT_RATE", nullable = false)
    private BigDecimal additionalIntRate;
    
    @Column(name = "EFF_DATE", nullable = false)
    private Date effDate;
    
    @Column(name = "BANK_CODE", nullable = false)
    private String bankCode;
    
    @Column(name = "CAT_CODE", nullable = false)
    private String catCode;
    
    @Column(name = "PRD_ID", nullable = false)
    private int prdId;
    
    public int getPrdId() {
        return prdId;
    }
    
    public void setPrdId(int prdId) {
        this.prdId = prdId;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public BigDecimal getAdditionalIntRate() {
        return additionalIntRate;
    }
    
    public void setAdditionalIntRate(BigDecimal additionalIntRate) {
        this.additionalIntRate = additionalIntRate;
    }
    
    public Date getEffDate() {
        return effDate;
    }
    
    public void setEffDate(Date effDate) {
        this.effDate = effDate;
    }
    
    public String getBankCode() {
        return bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    public String getCatCode() {
        return catCode;
    }
    
    public void setCatCode(String catCode) {
        this.catCode = catCode;
    }
    
    public CategoryInterestEntity(int id, BigDecimal additionalIntRate, Date effDate, String bankCode, String catCode) {
        super();
        this.id = id;
        this.additionalIntRate = additionalIntRate;
        this.effDate = effDate;
        this.bankCode = bankCode;
        this.catCode = catCode;
    }
}