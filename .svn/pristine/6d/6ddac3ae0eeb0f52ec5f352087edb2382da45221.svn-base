package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class ProductEntity {
    
    @Id
    @Column(name = "PRD_ID", nullable = false)
    private Integer prodId;
    
    @Column(name = "MAX_PERIOD_DAYS", nullable = false)
    private int max_period_days;
    
    @Column(name = "MIN_PERIOD_DAYS", nullable = false)
    private int min_period_days;
    
    @Column(name = "MAX_PERIOD_MONTHS", nullable = false)
    private int max_period_months;
    
    @Column(name = "MIN_PERIOD_MONTHS", nullable = false)
    private int min_period_months;
    
    @Column(name = "MIN_AMT", precision = 17, scale = 2, nullable = false)
    private BigDecimal minAmt;
    
    @Column(name = "MAX_AMT", precision = 17, scale = 2, nullable = false)
    private BigDecimal maxAmt;
    
    @Column(name = "INT_RATE", precision = 9, scale = 6, nullable = false)
    private BigDecimal intRate;
    
    @Column(name = "PEN_INT_RATE", precision = 9, scale = 6, nullable = false)
    private BigDecimal penIntRate;
    
    @Column(name = "PRD_NAME", nullable = false)
    private String prodName;
    
    @Column(name = "PRD_ABRV_NAME", nullable = false)
    private String prodAbrvName;
    
    @Column(name = "RELEASE_DT", nullable = false)
    
    private Date releaseDate;
    
    @Column(name = "INTRO_REQ", nullable = false)
    private String introReq;
    
    @Column(name = "STATUS", nullable = false)
    private String status;
    
    @Column(name = "CHQ_FACILITY", nullable = false)
    private String chequeFacility;
    
    @Column(name = "SMS_FACILITY", nullable = false)
    private String smsFacility;
    
    @Column(name = "EMAIL_FACILITY", nullable = false)
    private String emailFacility;
    
    @Column(name = "ATM_FACILITY", nullable = false)
    private String atmFacility;
    
    @Column(name = "CURRENCY", nullable = false)
    private String currency;
    
    @Column(name = "PRD_TYPE")
    private String prdType;
    
    @Column(name = "BANK_CODE", nullable = false)
    private String bankCode;
    
    @Column(name = "INT_TYPE", length = 1)
    private String intType;
    
    @Column(name = "TRANS_POST_METHOD", length = 2)
    private String transPostingMethod;
    
    @Column(name = "INT_POST_TYPE", length = 2)
    private String interestPostingType;
    
    @Column(name = "SERVICE_NAME", length = 20)
    private String serviceName;
    
    @Column(name = "TDS_APPLICABLE", length = 1)
    private String tdsApplicable;
    
    @Column(name = "INT_PAY_FREQ", length = 1)
    private String interestPaymentFreq;
    
    @Column(name = "TRANS_ALLOWED", length = 1, nullable = false)
    private String transAllowed;
    
    @Column(name = "TD_GRACE_DAYS", length = 3)
    private int tdGraceDays;
    
    @Column(name = "PART_WITHDRAWAL_ALLOWED", length = 1)
    private String partWithdrawlAllowed;
    
    @Column(name = "PART_WITHDRAWAL_PERCENT", precision = 8, scale = 6)
    private BigDecimal partWithdrawalPercent;
    
    @Column(name = "PROV_OR_CAP", length = 1)
    private String provOrCap;
    
    @Column(name = "ADHOC_LIM_OFFSET", precision = 17, scale = 2, columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal adhocLimitOffset;
    
    @Column(name = "IN_OPERATIVE_MONTHS")
    private int inOperativeMonths;
    
    @Column(name = "IN_OPERATIVE_DAYS")
    private int inOperativeDays;
    
    @Column(name = "SPECIAL_PRODUCT", precision = 21, scale = 6)
    private BigDecimal specialProduct;
    
    @Column(name = "RENEWAL_COUNT")
    private Integer renewalCount;
    
    @Column(name = "AUTORENEW", length = 1)
    private String autoRenew;
    
    @Column(name = "SLB_OR_TIERED", length = 1)
    private String slabOrTiered;
    
    @Column(name = "GAURANTOR_REQ", length = 1)
    private String gaurantorRequired;
    
    @Column(name = "NO_OF_GAURANTOR")
    private Integer numberOfGuarantor;
    
    @Column(name = "FLEXI_APPLICABLE", length = 1, nullable = false)
    private String flexiApplicable;
    
    public String getAutoRenew() {
        return autoRenew;
    }
    
    public void setAutoRenew(String autoRenew) {
        this.autoRenew = autoRenew;
    }
    
    public Integer getRenewalCount() {
        return renewalCount;
    }
    
    public void setRenewalCount(Integer renewalCount) {
        this.renewalCount = renewalCount;
    }
    
    public BigDecimal getSpecialProduct() {
        return specialProduct;
    }
    
    public void setSpecialProduct(BigDecimal specialProduct) {
        this.specialProduct = specialProduct;
    }
    
    public int getTdGraceDays() {
        return tdGraceDays;
    }
    
    public void setTdGraceDays(int tdGraceDays) {
        this.tdGraceDays = tdGraceDays;
    }
    
    public String getInterestPaymentFreq() {
        return interestPaymentFreq;
    }
    
    public void setInterestPaymentFreq(String interestPaymentFreq) {
        this.interestPaymentFreq = interestPaymentFreq;
    }
    
    public String getServiceName() {
        return serviceName;
    }
    
    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }
    
    public String getTransPostingMethod() {
        return transPostingMethod;
    }
    
    public void setTransPostingMethod(String transPostingMethod) {
        this.transPostingMethod = transPostingMethod;
    }
    
    public String getInterestPostingType() {
        return interestPostingType;
    }
    
    public void setInterestPostingType(String interestPostingType) {
        this.interestPostingType = interestPostingType;
    }
    
    public String getPrdType() {
        return prdType;
    }
    
    public void setPrdType(String prdType) {
        this.prdType = prdType;
    }
    
    public Integer getProd_id() {
        return prodId;
    }
    
    public void setProd_id(int prod_id) {
        this.prodId = prod_id;
    }
    
    public int getMax_period_days() {
        return max_period_days;
    }
    
    public void setMax_period_days(int max_period_days) {
        this.max_period_days = max_period_days;
    }
    
    public int getMin_period_days() {
        return min_period_days;
    }
    
    public void setMin_period_days(int min_period_days) {
        this.min_period_days = min_period_days;
    }
    
    public int getMax_period_months() {
        return max_period_months;
    }
    
    public void setMax_period_months(int max_period_months) {
        this.max_period_months = max_period_months;
    }
    
    public int getMin_period_months() {
        return min_period_months;
    }
    
    public void setMin_period_months(int min_period_months) {
        this.min_period_months = min_period_months;
    }
    
    public BigDecimal getMinAmt() {
        return minAmt;
    }
    
    public void setMinAmt(BigDecimal minAmt) {
        this.minAmt = minAmt;
    }
    
    public BigDecimal getMaxAmt() {
        return maxAmt;
    }
    
    public void setMaxAmt(BigDecimal maxAmt) {
        this.maxAmt = maxAmt;
    }
    
    public BigDecimal getIntRate() {
        return intRate;
    }
    
    public void setIntRate(BigDecimal intRate) {
        this.intRate = intRate;
    }
    
    public BigDecimal getPenIntRate() {
        return penIntRate;
    }
    
    public void setPenIntRate(BigDecimal penIntRate) {
        this.penIntRate = penIntRate;
    }
    
    public String getProdName() {
        return prodName;
    }
    
    public void setProdName(String prodName) {
        this.prodName = prodName;
    }
    
    public String getProdAbrvName() {
        return prodAbrvName;
    }
    
    public void setProdAbrvName(String prodAbrvName) {
        this.prodAbrvName = prodAbrvName;
    }
    
    public Date getReleaseDate() {
        return releaseDate;
    }
    
    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }
    
    public String getIntroReq() {
        return introReq;
    }
    
    public void setIntroReq(String introReq) {
        this.introReq = introReq;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getChequeFacility() {
        return chequeFacility;
    }
    
    public void setChequeFacility(String chequeFacility) {
        this.chequeFacility = chequeFacility;
    }
    
    public String getSmsFacility() {
        return smsFacility;
    }
    
    public void setSmsFacility(String smsFacility) {
        this.smsFacility = smsFacility;
    }
    
    public String getEmailFacility() {
        return emailFacility;
    }
    
    public void setEmailFacility(String emailFacility) {
        this.emailFacility = emailFacility;
    }
    
    public String getAtmFacility() {
        return atmFacility;
    }
    
    public void setAtmFacility(String atmFacility) {
        this.atmFacility = atmFacility;
    }
    
    public String getCurrency() {
        return currency;
    }
    
    public void setCurrency(String currency) {
        this.currency = currency;
    }
    
    public String getBankCode() {
        return bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    public String getIntType() {
        return intType;
    }
    
    public void setIntType(String intType) {
        this.intType = intType;
    }
    
    public String getTdsApplicable() {
        return tdsApplicable;
    }
    
    public void setTdsApplicable(String tdsApplicable) {
        this.tdsApplicable = tdsApplicable;
    }
    
    public String getTransAllowed() {
        return transAllowed;
    }
    
    public void setTransAllowed(String transAllowed) {
        this.transAllowed = transAllowed;
    }
    
    public String getPartWithdrawlAllowed() {
        return partWithdrawlAllowed;
    }
    
    public void setPartWithdrawlAllowed(String partWithdrawlAllowed) {
        this.partWithdrawlAllowed = partWithdrawlAllowed;
    }
    
    public BigDecimal getPartWithdrawalPercent() {
        return partWithdrawalPercent;
    }
    
    public void setPartWithdrawalPercent(BigDecimal partWithdrawalPercent) {
        this.partWithdrawalPercent = partWithdrawalPercent;
    }
    
    /**
     * @return the provOrCap
     */
    public String getProvOrCap() {
        return provOrCap;
    }
    
    /**
     * @param provOrCap
     *            the provOrCap to set
     */
    public void setProvOrCap(String provOrCap) {
        this.provOrCap = provOrCap;
    }
    
    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#toString()
     */
    
    public BigDecimal getAdhocLimitOffset() {
        return adhocLimitOffset;
    }
    
    public void setAdhocLimitOffset(BigDecimal adhocLimitOffset) {
        this.adhocLimitOffset = adhocLimitOffset;
    }
    
    public int getInOperativeMonths() {
        return inOperativeMonths;
    }
    
    public void setInOperativeMonths(int inOperativeMonths) {
        this.inOperativeMonths = inOperativeMonths;
    }
    
    public int getInOperativeDays() {
        return inOperativeDays;
    }
    
    public void setInOperativeDays(int inOperativeDays) {
        this.inOperativeDays = inOperativeDays;
    }
    
    public String getSlabOrTiered() {
        return slabOrTiered;
    }
    
    public void setSlabOrTiered(String slabOrTiered) {
        this.slabOrTiered = slabOrTiered;
    }
    
    public String getGaurantorRequired() {
        return gaurantorRequired;
    }
    
    public void setGaurantorRequired(String gaurantorRequired) {
        this.gaurantorRequired = gaurantorRequired;
    }
    
    public Integer getNumberOfGuarantor() {
        return numberOfGuarantor;
    }
    
    public void setNumberOfGuarantor(Integer numberOfGuarantor) {
        this.numberOfGuarantor = numberOfGuarantor;
    }
    
    public String getFlexiApplicable() {
        return flexiApplicable;
    }
    
    public void setFlexiApplicable(String flexiApplicable) {
        this.flexiApplicable = flexiApplicable;
    }
    
    @Override
    public String toString() {
        return "ProductEntity [prod_id=" + prodId + ", max_period_days=" + max_period_days + ", min_period_days="
                + min_period_days + ", max_period_months=" + max_period_months + ", min_period_months="
                + min_period_months + ", minAmt=" + minAmt + ", maxAmt=" + maxAmt + ", intRate=" + intRate
                + ", penIntRate=" + penIntRate + ", prodName=" + prodName + ", prodAbrvName=" + prodAbrvName
                + ", releaseDate=" + releaseDate + ", introReq=" + introReq + ", status=" + status + ", chequeFacility="
                + chequeFacility + ", smsFacility=" + smsFacility + ", emailFacility=" + emailFacility
                + ", atmFacility=" + atmFacility + ", currency=" + currency + ", prdType=" + prdType + ", bankCode="
                + bankCode + ", intType=" + intType + ", transPostingMethod=" + transPostingMethod
                + ", interestPostingType=" + interestPostingType + ", serviceName=" + serviceName + ", tdsApplicable="
                + tdsApplicable + ", interestPaymentFreq=" + interestPaymentFreq + ", transAllowed=" + transAllowed
                + ", tdGraceDays=" + tdGraceDays + ", partWithdrawlAllowed=" + partWithdrawlAllowed
                + ", partWithdrawalPercent=" + partWithdrawalPercent + ", provOrCap=" + provOrCap
                + ", adhocLimitOffset=" + adhocLimitOffset + ", inOperativeMonths=" + inOperativeMonths
                + ", inOperativeDays=" + inOperativeDays + ", specialProduct=" + specialProduct + ", renewalCount="
                + renewalCount + ", autoRenew=" + autoRenew + ", slabOrTiered=" + slabOrTiered + ", gaurantorRequired="
                + gaurantorRequired + ", numberOfGuarantor=" + numberOfGuarantor + "]";
    }
    
}
