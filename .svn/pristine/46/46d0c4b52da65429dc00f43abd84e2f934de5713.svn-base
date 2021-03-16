package com.sysnik.selenium.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;

@Entity
@Scope(scopeName = "prototype")
@Table(name = "CHARGES_TYPE_DETAILS")
public class ChargesTypeDetailsEntity implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    public ChargesTypeDetailsEntity() {
        super();
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CHARGES_TYPE_DETAILS_gen")
    @SequenceGenerator(name = "CHARGES_TYPE_DETAILS_gen", sequenceName = "CHARGES_TYPE_DETAILS_SEQ", allocationSize = 1)
    @Column(name = "ID", length = 10, nullable = false)
    private BigInteger id;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "CHARGE_TYPE_ID", nullable = false)
    private BigInteger chargeTypeId;
    
    @Column(name = "AMOUNT", precision = 21, scale = 6, nullable = true)
    private BigDecimal amount;
    
    @Column(name = "FROM_AMT", precision = 21, scale = 6, nullable = true)
    private BigDecimal fromAmt;
    
    @Column(name = "TO_AMT", precision = 21, scale = 6, nullable = true)
    private BigDecimal toAmt;
    
    @Column(name = "PERCENTAGE", precision = 3, scale = 2, nullable = true)
    private BigDecimal percentage;
    
    @Column(name = "MIN_AMOUNT", precision = 21, scale = 6, nullable = true)
    private BigDecimal minAmount;
    
    @Column(name = "MAX_AMOUNT", precision = 21, scale = 6, nullable = true)
    private BigDecimal maxAmount;
    
    @Column(name = "METHOD_DETAILS", length = 20, nullable = true)
    private String methodDetails;
    
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
    
    public BigInteger getChargeTypeId() {
        return chargeTypeId;
    }
    
    public void setChargeTypeId(BigInteger chargeTypeId) {
        this.chargeTypeId = chargeTypeId;
    }
    
    public BigDecimal getAmount() {
        return amount;
    }
    
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
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
    
    public BigDecimal getPercentage() {
        return percentage;
    }
    
    public void setPercentage(BigDecimal percentage) {
        this.percentage = percentage;
    }
    
    public BigDecimal getMinAmount() {
        return minAmount;
    }
    
    public void setMinAmount(BigDecimal minAmount) {
        this.minAmount = minAmount;
    }
    
    public BigDecimal getMaxAmount() {
        return maxAmount;
    }
    
    public void setMaxAmount(BigDecimal maxAmount) {
        this.maxAmount = maxAmount;
    }
    
    public String getMethodDetails() {
        return methodDetails;
    }
    
    public void setMethodDetails(String methodDetails) {
        this.methodDetails = methodDetails;
    }
    
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
    @Override
    public String toString() {
        return "ChargesTypeDetailsEntity [id=" + id + ", bankCode=" + bankCode + ", chargeTypeId=" + chargeTypeId
                + ", amount=" + amount + ", fromAmt=" + fromAmt + ", toAmt=" + toAmt + ", percentage=" + percentage
                + ", minAmount=" + minAmount + ", maxAmount=" + maxAmount + ", methodDetails=" + methodDetails + "]";
    }
    
}
