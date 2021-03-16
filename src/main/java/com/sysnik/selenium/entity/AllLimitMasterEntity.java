package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "ALL_LIMIT_MASTER")
public class AllLimitMasterEntity {
    @Id
    @Column(name = "ID", nullable = false, unique = true, length = 10)
    BigInteger id;
    
    @Column(name = "LMT_TYPE")
    private String limitType;
    
    @Column(name = "VALUE")
    private String value;
    
    @Column(name = "TRANSCODE", nullable = false, length = 16)
    private String transCode;
    
    @Column(name = "FREQ_ID", nullable = false)
    private BigInteger freqId;
    
    @Column(name = "CURRENCY", nullable = false, length = 3)
    private String currency;
    
    @Column(name = "LMT_VAL")
    private BigDecimal limitValue;
    
    @Column(name = "UN_UTILISED_LIMIT")
    private BigDecimal unUtilisedLimit;
    
    @Column(name = "MAX_COUNT", nullable = false)
    BigInteger maxCount;
    
    @Column(name = "UN_UTILISED_COUNT", nullable = false)
    BigInteger unUtilisedCount;
    
    @Column(name = "ACT_COUNT", nullable = false)
    BigInteger actCount;
    
    @Column(name = "STATUS", length = 1)
    private String status;
    
    @Column(name = "DESCRIPTION", nullable = false, length = 30)
    private String description;
    
    @Column(name = "ACTIVITY", nullable = false, length = 30)
    private String activity;
    
    @Column(name = "CUMM_OR_PER_INST", length = 1)
    private String cumOrperInst;
    
    @Column(name = "BANK_CODE", length = 20)
    private String bankCode;
    
    public BigInteger getId() {
        return id;
    }
    
    public void setId(BigInteger id) {
        this.id = id;
    }
    
    public String getLimitType() {
        return limitType;
    }
    
    public void setLimitType(String limitType) {
        this.limitType = limitType;
    }
    
    public String getValue() {
        return value;
    }
    
    public void setValue(String value) {
        this.value = value;
    }
    
    public String getTransCode() {
        return transCode;
    }
    
    public void setTransCode(String transCode) {
        this.transCode = transCode;
    }
    
    public BigInteger getFreqId() {
        return freqId;
    }
    
    public void setFreqId(BigInteger freqId) {
        this.freqId = freqId;
    }
    
    public String getCurrency() {
        return currency;
    }
    
    public void setCurrency(String currency) {
        this.currency = currency;
    }
    
    public BigDecimal getLimitValue() {
        return limitValue;
    }
    
    public void setLimitValue(BigDecimal limitValue) {
        this.limitValue = limitValue;
    }
    
    public BigDecimal getUnUtilisedLimit() {
        return unUtilisedLimit;
    }
    
    public void setUnUtilisedLimit(BigDecimal unUtilisedLimit) {
        this.unUtilisedLimit = unUtilisedLimit;
    }
    
    public BigInteger getMaxCount() {
        return maxCount;
    }
    
    public void setMaxCount(BigInteger maxCount) {
        this.maxCount = maxCount;
    }
    
    public BigInteger getUnUtilisedCount() {
        return unUtilisedCount;
    }
    
    public void setUnUtilisedCount(BigInteger unUtilisedCount) {
        this.unUtilisedCount = unUtilisedCount;
    }
    
    public BigInteger getActCount() {
        return actCount;
    }
    
    public void setActCount(BigInteger actCount) {
        this.actCount = actCount;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getActivity() {
        return activity;
    }
    
    public void setActivity(String activity) {
        this.activity = activity;
    }
    
    public String getCumOrperInst() {
        return cumOrperInst;
    }
    
    public void setCumOrperInst(String cumOrperInst) {
        this.cumOrperInst = cumOrperInst;
    }
    
    public String getBankCode() {
        return bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
   
    
    @Override
    public String toString() {
        return "AllLimitMasterEntity [id=" + id + ", limitType=" + limitType + ", value=" + value + ", transCode="
                + transCode + ", freqId=" + freqId + ", currency=" + currency + ", limitValue=" + limitValue
                + ", unUtilisedLimit=" + unUtilisedLimit + ", maxCount=" + maxCount + ", unUtilisedCount="
                + unUtilisedCount + ", actCount=" + actCount + ", status=" + status + ", description=" + description
                + ", activity=" + activity + ", cumOrperInst=" + cumOrperInst + ", bankCode=" + bankCode + "]";
    }
    

}
