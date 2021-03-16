package com.sysnik.selenium.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "DENO_MASTER")
public class DenomMasterEntity {
	@Id
    @Column(name = "DENOM_CODE", length = 3, nullable = false)
    private String denomCode;
    
    @Column(name = "DENOM_RATE", precision = 17, scale = 2, nullable = false)
    private BigDecimal denomRate;
    
    @Column(name = "DNOM_CURRENCY", length = 3, nullable = false)
    private String denomCurrency;
    
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "DENOM_DISC", length = 30, nullable = false)
    private String denomDisc;
    
    public String getDenomCode() {
        return denomCode;
    }
    
    public void setDenomCode(String denomCode) {
        this.denomCode = denomCode;
    }
    
    public BigDecimal getDenomRate() {
        return denomRate;
    }
    
    public void setDenomRate(BigDecimal denomRate) {
        this.denomRate = denomRate;
    }
    
    public String getDenomCurrency() {
        return denomCurrency;
    }
    
    public void setDenomCurrency(String denomCurrency) {
        this.denomCurrency = denomCurrency;
    }
    
    public String getBankCode() {
        return bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    public String getDenomDisc() {
        return denomDisc;
    }
    
    public void setDenomDisc(String denomDisc) {
        this.denomDisc = denomDisc;
    }
    
    public String keyBankCode_DenomCode() {
    	return this.bankCode+"_"+this.denomCode;
    }
    
    
    @Override
    public String toString() {
        return "DenoMasterEntity [denomCode=" + denomCode + ", denomRate=" + denomRate + ", denomCurrency="
                + denomCurrency + ", bankCode=" + bankCode + ", denomDisc=" + denomDisc + "]";
    }
}
