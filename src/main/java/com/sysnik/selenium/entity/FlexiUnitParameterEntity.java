package com.sysnik.selenium.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonProperty;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.context.annotation.Scope;

@Entity
@Scope("prototype")
@Table(name = "FLEXI_UNIT_PARAMETER")
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class FlexiUnitParameterEntity implements Serializable {
    
    private static final long serialVersionUID = 833353446899654303L;
    
    @Id
    @JsonProperty("id")
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "FLEXI_UNIT_PARAMETER_SEQ_GEN")
    @SequenceGenerator(name = "FLEXI_UNIT_PARAMETER_SEQ_GEN", sequenceName = "FLEXI_UNIT_PARAMETER_SEQ",
            allocationSize = 1)
    private BigInteger id;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "PRD_ID", nullable = false)
    private int prdId;
    
    @Column(name = "BASE_PRD_ID", nullable = false)
    private int basePrdId;
    
    @Column(name = "PENAL_INT_APPL", nullable = false)
    private String penalIntAppl;
    
    @Column(name = "UNIT_OF_PERIOD", nullable = false)
    private String unitOfPeriod;
    
    @Column(name = "PERIOD_IN_DAYS")
    private Integer periodInDays;
    
    @Column(name = "PERIOD_IN_MONTHS")
    private Integer periodInMonths;
    
    @Column(name = "CUT_OFF_LIMIT", precision = 21, scale = 6, nullable = false)
    private BigDecimal cutOffLimit;
    
    @Column(name = "MAX_FLEXI_AMOUNT", precision = 21, scale = 6, nullable = false)
    private BigDecimal maxFlexiAmount;
    
    @Column(name = "AMOUNT_PER_UNIT", precision = 21, scale = 6, nullable = false)
    private BigDecimal amountPerUnit;
    
    @Column(name = "SWEEP_OUT_METHOD", nullable = false)
    private String sweepOutMethod;
    
    @Column(name = "AUTO_SWEEP_OUT", nullable = false)
    private String autoSweepOut;
    
    @Column(name = "UNITWISE_ROI", nullable = false)
    private String unitwiseRoi;
    
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
    
    public int getPrdId() {
        return prdId;
    }
    
    public void setPrdId(int prdId) {
        this.prdId = prdId;
    }
    
    public int getBasePrdId() {
        return basePrdId;
    }
    
    public void setBasePrdId(int basePrdId) {
        this.basePrdId = basePrdId;
    }
    
    public String getPenalIntAppl() {
        return penalIntAppl;
    }
    
    public void setPenalIntAppl(String penalIntAppl) {
        this.penalIntAppl = penalIntAppl;
    }
    
    public String getUnitOfPeriod() {
        return unitOfPeriod;
    }
    
    public void setUnitOfPeriod(String unitOfPeriod) {
        this.unitOfPeriod = unitOfPeriod;
    }
    
    public Integer getPeriodInDays() {
        return periodInDays;
    }
    
    public void setPeriodInDays(Integer periodInDays) {
        this.periodInDays = periodInDays;
    }
    
    public Integer getPeriodInMonths() {
        return periodInMonths;
    }
    
    public void setPeriodInMonths(Integer periodInMonths) {
        this.periodInMonths = periodInMonths;
    }
    
    public BigDecimal getCutOffLimit() {
        return cutOffLimit;
    }
    
    public void setCutOffLimit(BigDecimal cutOffLimit) {
        this.cutOffLimit = cutOffLimit;
    }
    
    public BigDecimal getMaxFlexiAmount() {
        return maxFlexiAmount;
    }
    
    public void setMaxFlexiAmount(BigDecimal maxFlexiAmount) {
        this.maxFlexiAmount = maxFlexiAmount;
    }
    
    public BigDecimal getAmountPerUnit() {
        return amountPerUnit;
    }
    
    public void setAmountPerUnit(BigDecimal amountPerUnit) {
        this.amountPerUnit = amountPerUnit;
    }
    
    public String getSweepOutMethod() {
        return sweepOutMethod;
    }
    
    public void setSweepOutMethod(String sweepOutMethod) {
        this.sweepOutMethod = sweepOutMethod;
    }
    
    public String getAutoSweepOut() {
        return autoSweepOut;
    }
    
    public void setAutoSweepOut(String autoSweepOut) {
        this.autoSweepOut = autoSweepOut;
    }
    
    public String getUnitwiseRoi() {
        return unitwiseRoi;
    }
    
    public void setUnitwiseRoi(String unitwiseRoi) {
        this.unitwiseRoi = unitwiseRoi;
    }
    
    @Override
    public String toString() {
        return "FlexiUnitParameterEntity [id=" + id + ", bankCode=" + bankCode + ", prdId=" + prdId + ", basePrdId="
                + basePrdId + ", penalIntAppl=" + penalIntAppl + ", unitOfPeriod=" + unitOfPeriod + ", periodInDays="
                + periodInDays + ", periodInMonths=" + periodInMonths + ", cutOffLimit=" + cutOffLimit
                + ", maxFlexiAmount=" + maxFlexiAmount + ", amountPerUnit=" + amountPerUnit + ", sweepOutMethod="
                + sweepOutMethod + ", autoSweepOut=" + autoSweepOut + "]";
    }
    
}