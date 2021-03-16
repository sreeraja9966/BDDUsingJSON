package com.sysnik.selenium.entity;

import java.io.Serializable;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.context.annotation.Scope;

@Entity
@Scope(value = "prototype")
@Table(name = "DEPOSIT_RENEWAL_HISTORY")
public class DepositRenewalHistoryEntity implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = 8553025291167950031L;
    
    public DepositRenewalHistoryEntity() {
        
    }
    
    public DepositRenewalHistoryEntity(BigInteger id, BigInteger accId, Date openDt, Date lastIntPaidDate,
            BigDecimal installAmt, Integer depPeriodMonths, Integer depPeriodDays, BigDecimal intRate,
            BigDecimal intPayable, BigDecimal intPaid, BigDecimal renewROI, Integer noOfInstall, BigDecimal matAmt,
            BigDecimal proviAmt, Integer certNo, BigDecimal tdsPayable, BigDecimal cashInterest,
            BigDecimal tdsReceivable, Integer noOfRenewals, Date maturityDt, Date nextIntPostDt, String installFreq,
            String autoRenew, String renewalOption, String intPaymentFreq, String depIntCalType, String flexiDeposit,
            String custCategory, String intType, BigDecimal additionalIntRate, BigDecimal intDue,
            BigDecimal tdsDeducted, String status, String enteredBy, String authBy, String partRenew) {
        super();
        Id = id;
        this.accId = accId;
        this.openDt = openDt;
        this.lastIntPaidDate = lastIntPaidDate;
        this.installAmt = installAmt;
        this.depPeriodMonths = depPeriodMonths;
        this.depPeriodDays = depPeriodDays;
        this.intRate = intRate;
        this.intPayable = intPayable;
        this.intPaid = intPaid;
        this.renewROI = renewROI;
        this.noOfInstall = noOfInstall;
        this.matAmt = matAmt;
        this.proviAmt = proviAmt;
        this.certNo = certNo;
        this.tdsPayable = tdsPayable;
        this.cashInterest = cashInterest;
        this.tdsReceivable = tdsReceivable;
        this.noOfRenewals = noOfRenewals;
        this.maturityDt = maturityDt;
        this.nextIntPostDt = nextIntPostDt;
        this.installFreq = installFreq;
        this.autoRenew = autoRenew;
        this.renewalOption = renewalOption;
        this.intPaymentFreq = intPaymentFreq;
        this.depIntCalType = depIntCalType;
        this.flexiDeposit = flexiDeposit;
        this.custCategory = custCategory;
        this.intType = intType;
        this.additionalIntRate = additionalIntRate;
        this.intDue = intDue;
        this.tdsDeducted = tdsDeducted;
        this.status = status;
        this.enteredBy = enteredBy;
        this.authBy = authBy;
        this.partRenew = partRenew;
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "DEPOSIT_RENEWAL_HISTORY_GEN")
    @SequenceGenerator(name = "DEPOSIT_RENEWAL_HISTORY_GEN", sequenceName = "DEPOSIT_RENEWAL_HISTORY_SEQ",
            allocationSize = 1)
    @Column(name = "ID", nullable = false, unique = true, length = 10)
    private BigInteger Id;
    
    @Column(name = "ACC_ID", nullable = false, length = 20)
    BigInteger accId;
    
    @Column(name = "OPEN_DATE", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date openDt;
    
    @Column(name = "LAST_INT_PAID_DATE", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date lastIntPaidDate;
    
    @Column(name = "INSTALL_AMT", precision = 17, scale = 2)
    private BigDecimal installAmt;
    
    @Column(name = "DEP_PERIOD_MONTHS", length = 3)
    private Integer depPeriodMonths;
    
    @Column(name = "DEP_PERIOD_DAYS", length = 4)
    private Integer depPeriodDays;
    
    @Column(name = "INT_RATE", precision = 9, scale = 6, nullable = false)
    private BigDecimal intRate;
    
    @Column(name = "INT_PAYABLE", precision = 17, scale = 2)
    private BigDecimal intPayable;
    
    @Column(name = "INT_PAID", precision = 17, scale = 2)
    private BigDecimal intPaid;
    
    @Column(name = "RENEW_ROI", precision = 9, scale = 6)
    private BigDecimal renewROI;
    
    @Column(name = "NO_OF_INSTALL", length = 3)
    private Integer noOfInstall;
    
    @Column(name = "MAT_AMT", precision = 17, scale = 2)
    private BigDecimal matAmt;
    
    @Column(name = "PROVI_AMT", precision = 17, scale = 2)
    private BigDecimal proviAmt;
    
    @Column(name = "CERT_NO", length = 10)
    private Integer certNo;
    
    @Column(name = "TDS_PAYABLE", precision = 17, scale = 2)
    private BigDecimal tdsPayable;
    
    @Column(name = "CASH_INTEREST", precision = 17, scale = 2)
    private BigDecimal cashInterest;
    
    @Column(name = "TDS_RECEIVABLE", precision = 17, scale = 2)
    private BigDecimal tdsReceivable;
    
    @Column(name = "NO_OF_RENEWALS", length = 3)
    private Integer noOfRenewals;
    
    @Column(name = "MATURITY_DT")
    
    private Date maturityDt;
    
    @Column(name = "NEXT_INT_POST_DT")
    
    private Date nextIntPostDt;
    
    @Column(name = "INSTALL_FREQ", length = 2)
    private String installFreq;
    
    @Column(name = "AUTORENEW", length = 1)
    private String autoRenew;
    
    @Column(name = "RENEWAL_OPTION", length = 1)
    private String renewalOption;
    
    @Column(name = "INT_PAYMENT_FREQ", length = 2)
    private String intPaymentFreq;
    
    @Column(name = "DEP_INT_CAL_TYPE", length = 1)
    private String depIntCalType;
    
    @Column(name = "FLEXI_DEPOSIT", length = 1)
    private String flexiDeposit;
    
    @Column(name = "CUST_CATEGORY", length = 10, nullable = false)
    private String custCategory;
    
    @Column(name = "INT_TYPE", length = 1)
    private String intType;
    
    @Column(name = "ADDITIONAL_INT_RATE", precision = 8, scale = 6)
    private BigDecimal additionalIntRate;
    
    @Column(name = "INT_DUE", precision = 17, scale = 2)
    private BigDecimal intDue;
    
    @Column(name = "TDS_DEDUCTED", precision = 17, scale = 2)
    private BigDecimal tdsDeducted;
    
    @Column(name = "STATUS", length = 1)
    private String status;
    
    @Column(name = "ENTERED_BY", length = 20)
    private String enteredBy;
    
    @Column(name = "AUTH_BY", length = 20)
    private String authBy;
    
    @Column(name = "PART_RENEW", length = 1, nullable = false)
    private String partRenew;
    
    @Column(name = "RENEWAL_ACC_ID", nullable = true, length = 20)
    BigInteger renewalAccId;
    
    @Column(name = "INTCAPITALIZE")
    BigDecimal intCapitalize;
    
    public BigDecimal getIntCapitalize() {
        return intCapitalize;
    }
    
    public void setIntCapitalize(BigDecimal intCapitalize) {
        this.intCapitalize = intCapitalize;
    }
    
    public Date getLastIntPaidDate() {
        return lastIntPaidDate;
    }
    
    public void setLastIntPaidDate(Date lastIntPaidDate) {
        this.lastIntPaidDate = lastIntPaidDate;
    }
    
    public BigInteger getId() {
        return Id;
    }
    
    public void setId(BigInteger id) {
        Id = id;
    }
    
    public BigInteger getAccId() {
        return accId;
    }
    
    public void setAccId(BigInteger accId) {
        this.accId = accId;
    }
    
    public Date getOpenDt() {
        return openDt;
    }
    
    public void setOpenDt(Date openDt) {
        this.openDt = openDt;
    }
    
    public BigDecimal getInstallAmt() {
        return installAmt;
    }
    
    public void setInstallAmt(BigDecimal installAmt) {
        this.installAmt = installAmt;
    }
    
    public Integer getDepPeriodMonths() {
        return depPeriodMonths;
    }
    
    public void setDepPeriodMonths(Integer depPeriodMonths) {
        this.depPeriodMonths = depPeriodMonths;
    }
    
    public Integer getDepPeriodDays() {
        return depPeriodDays;
    }
    
    public void setDepPeriodDays(Integer depPeriodDays) {
        this.depPeriodDays = depPeriodDays;
    }
    
    public BigDecimal getIntRate() {
        return intRate;
    }
    
    public void setIntRate(BigDecimal intRate) {
        this.intRate = intRate;
    }
    
    public BigDecimal getIntPayable() {
        return intPayable;
    }
    
    public void setIntPayable(BigDecimal intPayable) {
        this.intPayable = intPayable;
    }
    
    public BigDecimal getIntPaid() {
        return intPaid;
    }
    
    public void setIntPaid(BigDecimal intPaid) {
        this.intPaid = intPaid;
    }
    
    public BigDecimal getRenewROI() {
        return renewROI;
    }
    
    public void setRenewROI(BigDecimal renewROI) {
        this.renewROI = renewROI;
    }
    
    public Integer getNoOfInstall() {
        return noOfInstall;
    }
    
    public void setNoOfInstall(Integer noOfInstall) {
        this.noOfInstall = noOfInstall;
    }
    
    public BigDecimal getMatAmt() {
        return matAmt;
    }
    
    public void setMatAmt(BigDecimal matAmt) {
        this.matAmt = matAmt;
    }
    
    public BigDecimal getProviAmt() {
        return proviAmt;
    }
    
    public void setProviAmt(BigDecimal proviAmt) {
        this.proviAmt = proviAmt;
    }
    
    public Integer getCertNo() {
        return certNo;
    }
    
    public void setCertNo(Integer certNo) {
        this.certNo = certNo;
    }
    
    public BigDecimal getTdsPayable() {
        return tdsPayable;
    }
    
    public void setTdsPayable(BigDecimal tdsPayable) {
        this.tdsPayable = tdsPayable;
    }
    
    public BigDecimal getCashInterest() {
        return cashInterest;
    }
    
    public void setCashInterest(BigDecimal cashInterest) {
        this.cashInterest = cashInterest;
    }
    
    public BigDecimal getTdsReceivable() {
        return tdsReceivable;
    }
    
    public void setTdsReceivable(BigDecimal tdsReceivable) {
        this.tdsReceivable = tdsReceivable;
    }
    
    public Integer getNoOfRenewals() {
        return noOfRenewals;
    }
    
    public void setNoOfRenewals(Integer noOfRenewals) {
        this.noOfRenewals = noOfRenewals;
    }
    
    public Date getMaturityDt() {
        return maturityDt;
    }
    
    public void setMaturityDt(Date maturityDt) {
        this.maturityDt = maturityDt;
    }
    
    public Date getNextIntPostDt() {
        return nextIntPostDt;
    }
    
    public void setNextIntPostDt(Date nextIntPostDt) {
        this.nextIntPostDt = nextIntPostDt;
    }
    
    public String getInstallFreq() {
        return installFreq;
    }
    
    public void setInstallFreq(String installFreq) {
        this.installFreq = installFreq;
    }
    
    public String getAutoRenew() {
        return autoRenew;
    }
    
    public void setAutoRenew(String autoRenew) {
        this.autoRenew = autoRenew;
    }
    
    public String getRenewalOption() {
        return renewalOption;
    }
    
    public void setRenewalOption(String renewalOption) {
        this.renewalOption = renewalOption;
    }
    
    public String getIntPaymentFreq() {
        return intPaymentFreq;
    }
    
    public void setIntPaymentFreq(String intPaymentFreq) {
        this.intPaymentFreq = intPaymentFreq;
    }
    
    public String getDepIntCalType() {
        return depIntCalType;
    }
    
    public void setDepIntCalType(String depIntCalType) {
        this.depIntCalType = depIntCalType;
    }
    
    public String getFlexiDeposit() {
        return flexiDeposit;
    }
    
    public void setFlexiDeposit(String flexiDeposit) {
        this.flexiDeposit = flexiDeposit;
    }
    
    public String getCustCategory() {
        return custCategory;
    }
    
    public void setCustCategory(String custCategory) {
        this.custCategory = custCategory;
    }
    
    public String getIntType() {
        return intType;
    }
    
    public void setIntType(String intType) {
        this.intType = intType;
    }
    
    public BigDecimal getAdditionalIntRate() {
        return additionalIntRate;
    }
    
    public void setAdditionalIntRate(BigDecimal additionalIntRate) {
        this.additionalIntRate = additionalIntRate;
    }
    
    public BigDecimal getIntDue() {
        return intDue;
    }
    
    public void setIntDue(BigDecimal intDue) {
        this.intDue = intDue;
    }
    
    public BigDecimal getTdsDeducted() {
        return tdsDeducted;
    }
    
    public void setTdsDeducted(BigDecimal tdsDeducted) {
        this.tdsDeducted = tdsDeducted;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getEnteredBy() {
        return enteredBy;
    }
    
    public void setEnteredBy(String enteredBy) {
        this.enteredBy = enteredBy;
    }
    
    public String getAuthBy() {
        return authBy;
    }
    
    public void setAuthBy(String authBy) {
        this.authBy = authBy;
    }
    
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
    public String getPartRenew() {
        return partRenew;
    }
    
    public void setPartRenew(String partRenew) {
        this.partRenew = partRenew;
    }
    
    public BigInteger getRenewalAccId() {
        return renewalAccId;
    }
    
    public void setRenewalAccId(BigInteger renewalAccId) {
        this.renewalAccId = renewalAccId;
    }
    
    @Override
    public String toString() {
        return "DepositRenewalHistoryEntity [Id=" + Id + ", accId=" + accId + ", openDt=" + openDt
                + ", lastIntPaidDate=" + lastIntPaidDate + ", installAmt=" + installAmt + ", depPeriodMonths="
                + depPeriodMonths + ", depPeriodDays=" + depPeriodDays + ", intRate=" + intRate + ", intPayable="
                + intPayable + ", intPaid=" + intPaid + ", renewROI=" + renewROI + ", noOfInstall=" + noOfInstall
                + ", matAmt=" + matAmt + ", proviAmt=" + proviAmt + ", certNo=" + certNo + ", tdsPayable=" + tdsPayable
                + ", cashInterest=" + cashInterest + ", tdsReceivable=" + tdsReceivable + ", noOfRenewals="
                + noOfRenewals + ", maturityDt=" + maturityDt + ", nextIntPostDt=" + nextIntPostDt + ", installFreq="
                + installFreq + ", autoRenew=" + autoRenew + ", renewalOption=" + renewalOption + ", intPaymentFreq="
                + intPaymentFreq + ", depIntCalType=" + depIntCalType + ", flexiDeposit=" + flexiDeposit
                + ", custCategory=" + custCategory + ", intType=" + intType + ", additionalIntRate=" + additionalIntRate
                + ", intDue=" + intDue + ", tdsDeducted=" + tdsDeducted + ", status=" + status + ", enteredBy="
                + enteredBy + ", authBy=" + authBy + ", partRenew=" + partRenew + ", renewalAccId=" + renewalAccId
                + "]";
    }
    
}
