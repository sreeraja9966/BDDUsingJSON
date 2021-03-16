package com.sysnik.selenium.entity;

import java.io.Serializable;
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
@Table(name = "CHARGES_TYPE_MASTER")
public class ChargesTypeMasterEntity implements Serializable {
    
    public ChargesTypeMasterEntity() {
        super();
    }
    
    private static final long serialVersionUID = -2931226817269976641L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CHARGES_TYPE_MASTER_gen")
    @SequenceGenerator(name = "CHARGES_TYPE_MASTER_gen", sequenceName = "CHARGES_TYPE_MASTER_SEQ", allocationSize = 1)
    @Column(name = "ID", length = 10, nullable = false)
    private BigInteger id;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "METHOD_DESCRIPTION", length = 20, nullable = false)
    private String methodDescription;
    
    @Column(name = "CURRENCY", length = 7, nullable = false)
    private String currency;
    
    @Column(name = "RECOVERY_METHOD", length = 7, nullable = false)
    private String recoveryMethod;
    
    @Column(name = "POSTING_METHOD", length = 7, nullable = false)
    private String postingMethod;
    
    @Column(name = "EDITABLE", length = 1, nullable = false)
    private String editable;
    
    @Column(name = "EXECUTION_ON", length = 7, nullable = false)
    private String executionOn;
    
    @Column(name = "ROUNDING", nullable = false)
    private BigInteger rounding;
    
    @Column(name = "CHARGE_CODE", length = 20, nullable = false)
    private String chargeCode;
    
    public String getChargeCode() {
        return chargeCode;
    }
    
    public void setChargeCode(String chargeCode) {
        this.chargeCode = chargeCode;
    }
    
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
    
    public String getMethodDescription() {
        return methodDescription;
    }
    
    public void setMethodDescription(String methodDescription) {
        this.methodDescription = methodDescription;
    }
    
    public String getCurrency() {
        return currency;
    }
    
    public void setCurrency(String currency) {
        this.currency = currency;
    }
    
    public String getRecoveryMethod() {
        return recoveryMethod;
    }
    
    public void setRecoveryMethod(String recoveryMethod) {
        this.recoveryMethod = recoveryMethod;
    }
    
    public String getPostingMethod() {
        return postingMethod;
    }
    
    public void setPostingMethod(String postingMethod) {
        this.postingMethod = postingMethod;
    }
    
    public String getEditable() {
        return editable;
    }
    
    public void setEditable(String editable) {
        this.editable = editable;
    }
    
    public String getExecutionOn() {
        return executionOn;
    }
    
    public void setExecutionOn(String executionOn) {
        this.executionOn = executionOn;
    }
    
    public BigInteger getRounding() {
        return rounding;
    }
    
    public void setRounding(BigInteger rounding) {
        this.rounding = rounding;
    }
    
    @Override
    public String toString() {
        return "ChargesTypeMasterEntity [id=" + id + ", bankCode=" + bankCode + ", methodDescription="
                + methodDescription + ", currency=" + currency + ", recoveryMethod=" + recoveryMethod
                + ", postingMethod=" + postingMethod + ", editable=" + editable + ", executionOn=" + executionOn
                + ", rounding=" + rounding + "]";
    }
    
}