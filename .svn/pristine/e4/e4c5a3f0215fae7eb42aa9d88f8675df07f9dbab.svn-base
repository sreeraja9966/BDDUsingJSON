package com.sysnik.selenium.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.context.annotation.Scope;



/**
 * @Modified @author tamanna.mujawar (Added Column FIX_OR_FLOAT, BENCHMARK, INT_OFFSET on @Date 19/12/2019)
 */
@Entity
@Scope(value = "prototype")
@Table(name = "LOAN_MASTER")
public class LoanMasterEntity implements Serializable {
    
    /**
     * 
     */
    private static final long serialVersionUID = -6101062346634356268L;
    
    public LoanMasterEntity() {
        
    }
    
    @Id
    @Column(name = "ACC_ID")
    private BigInteger accId;
    
    @Column(name = "INSTALL_AMT", precision = 17, scale = 2)
    private BigDecimal installmentAmt;
    
    @Column(name = "INSTALL_FREQ")
    private String installFreq;
    
    @Column(name = "DRAWING_POWER", precision = 17, scale = 2)
    private BigDecimal drawingPower;
    
    @Column(name = "FIRST_DISBURSEMENT_DT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date firstDisDt;
    
    @Column(name = "SANCTIONED_AMT", precision = 17, scale = 2)
    private BigDecimal sanctionedAmt;
    
    @Column(name = "PA_RESERVE", precision = 17, scale = 2)
    private BigDecimal paReserve;
    
    @Column(name = "INT_PAYABLE", precision = 17, scale = 2)
    private BigDecimal intPay;
    
    @Column(name = "PENAL_INT_DUE", precision = 17, scale = 2)
    private BigDecimal penalInterestDue;
    
    @Column(name = "OVERDUE_AMT", precision = 17, scale = 2)
    private BigDecimal overdueAmt;
    
    @Column(name = "REPAYEMENT_TYPE")
    private String equalInst;
    
    @Column(name = "DISBURSED_AMT", precision = 17, scale = 2)
    private BigDecimal disAmt;
    
    @Column(name = "INT_DUE", precision = 17, scale = 2)
    private BigDecimal intDue;
    
    @Column(name = "EXPIRY_DT")
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date expiryDt;
    
    @Column(name = "PENAL_ROI", precision = 9, scale = 6)
    private BigDecimal penalRoi;
    
    @Column(name = "INT_CAPITALISED", precision = 17, scale = 2)
    private BigDecimal intCapitalised;
    
    @Column(name = "INT_RECEIVABLE", precision = 17, scale = 2)
    private BigDecimal intRecv;
    
    @Column(name = "NPA_INTEREST", precision = 17, scale = 2)
    private BigDecimal npaIntr;
    
    @Column(name = "SANCTION_DT")
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date sanctionDt;
    
    @Column(name = "SANCTION_ADVICENUM")
    private String sanctionAdvc;
    
    @Column(name = "SANCTION_AUTHORITY")
    private String sanctAuth;
    
    @Column(name = "GRACE_DAYS")
    private int graceDays;
    
    @Column(name = "PERIOD_IN_MONTHS")
    private int period;
    
    @Column(name = "NPA_DT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date npaDt;
    
    @Column(name = "MARGIN_AMT", precision = 9, scale = 6)
    private BigDecimal marginAmt;
    
    @Column(name = "NPA_CLASSIFICATION")
    private String npaClassification;
    
    @Column(name = "MORATORIUM_FOR_PRINCIPAL")
    private int moratoriumPrinciple;
    
    @Column(name = "MORATORIUM_FOR_INT")
    private int moratoriumInterest;
    
    @Column(name = "SUBSIDY_AMT", precision = 17, scale = 2)
    private BigDecimal subsidyAmt;
    
    @Column(name = "SECURIED_YN")
    private String securied;
    
    @Column(name = "SECURITY_VALUE", precision = 17, scale = 2)
    private BigDecimal securityVal;
    
    @Column(name = "INT_RATE", precision = 9, scale = 6)
    private BigDecimal intRoi;
    
    @Column(name = "INSTALMENT_START_DATE")
    private Date instalmentStartDate;
    
    @Column(name = "ADHOC_LIM", precision = 17, scale = 2)
    private BigDecimal adhocLim;
    
    @Column(name = "IDEAL_BALANCE", precision = 17, scale = 2, nullable = true,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal idealBal;
    
    @Column(name = "FIX_OR_FLOAT", length = 1)
    private String fixOrFloat;
    
    @Column(name = "BENCHMARK_ID", length = 20)
    private String benchMark;
    
    @Column(name = "INT_OFFSET", precision = 9, scale = 6, nullable = false)
    private BigDecimal intOffSet = BigDecimal.ZERO;
    
    public BigInteger getAccId() {
        return accId;
    }
    
    public void setAccId(BigInteger accId) {
        this.accId = accId;
    }
    
    public BigDecimal getInstallmentAmt() {
        return installmentAmt;
    }
    
    public void setInstallmentAmt(BigDecimal installmentAmt) {
        this.installmentAmt = installmentAmt;
    }
    
    public String getInstallFreq() {
        return installFreq;
    }
    
    public void setInstallFreq(String installFreq) {
        this.installFreq = installFreq;
    }
    
    public BigDecimal getDrawingPower() {
        return drawingPower;
    }
    
    public void setDrawingPower(BigDecimal drawingPower) {
        this.drawingPower = drawingPower;
    }
    
    public Date getFirstDisDt() {
        return firstDisDt;
    }
    
    public void setFirstDisDt(Date firstDisDt) {
        this.firstDisDt = firstDisDt;
    }
    
    public BigDecimal getSanctionedAmt() {
        return sanctionedAmt;
    }
    
    public void setSanctionedAmt(BigDecimal sanctionedAmt) {
        this.sanctionedAmt = sanctionedAmt;
    }
    
    public BigDecimal getPaReserve() {
        return paReserve;
    }
    
    public void setPaReserve(BigDecimal paReserve) {
        this.paReserve = paReserve;
    }
    
    public BigDecimal getIntPay() {
        return intPay;
    }
    
    public void setIntPay(BigDecimal intPay) {
        this.intPay = intPay;
    }
    
    public BigDecimal getPenalInterestDue() {
        return penalInterestDue;
    }
    
    public void setPenalInterestDue(BigDecimal penalInterestDue) {
        this.penalInterestDue = penalInterestDue;
    }
    
    public BigDecimal getOverdueAmt() {
        return overdueAmt;
    }
    
    public void setOverdueAmt(BigDecimal overdueAmt) {
        this.overdueAmt = overdueAmt;
    }
    
    public String getEqualInst() {
        return equalInst;
    }
    
    public void setEqualInst(String equalInst) {
        this.equalInst = equalInst;
    }
    
    public BigDecimal getDisAmt() {
        return disAmt;
    }
    
    public void setDisAmt(BigDecimal disAmt) {
        this.disAmt = disAmt;
    }
    
    public BigDecimal getIntDue() {
        return intDue;
    }
    
    public void setIntDue(BigDecimal intDue) {
        this.intDue = intDue;
    }
    
    public Date getExpiryDt() {
        return expiryDt;
    }
    
    public void setExpiryDt(Date expiryDt) {
        this.expiryDt = expiryDt;
    }
    
    public BigDecimal getPenalRoi() {
        return penalRoi;
    }
    
    public void setPenalRoi(BigDecimal penalRoi) {
        this.penalRoi = penalRoi;
    }
    
    public BigDecimal getIntCapitalised() {
        return intCapitalised;
    }
    
    public void setIntCapitalised(BigDecimal intCapitalised) {
        this.intCapitalised = intCapitalised;
    }
    
    public BigDecimal getIntRecv() {
        return intRecv;
    }
    
    public void setIntRecv(BigDecimal intRecv) {
        this.intRecv = intRecv;
    }
    
    public BigDecimal getNpaIntr() {
        return npaIntr;
    }
    
    public void setNpaIntr(BigDecimal npaIntr) {
        this.npaIntr = npaIntr;
    }
    
    public Date getSanctionDt() {
        return sanctionDt;
    }
    
    public void setSanctionDt(Date sanctionDt) {
        this.sanctionDt = sanctionDt;
    }
    
    public String getSanctionAdvc() {
        return sanctionAdvc;
    }
    
    public void setSanctionAdvc(String sanctionAdvc) {
        this.sanctionAdvc = sanctionAdvc;
    }
    
    public String getSanctAuth() {
        return sanctAuth;
    }
    
    public void setSanctAuth(String sanctAuth) {
        this.sanctAuth = sanctAuth;
    }
    
    public int getGraceDays() {
        return graceDays;
    }
    
    public void setGraceDays(int graceDays) {
        this.graceDays = graceDays;
    }
    
    public int getPeriod() {
        return period;
    }
    
    public void setPeriod(int period) {
        this.period = period;
    }
    
    public Date getNpaDt() {
        return npaDt;
    }
    
    public void setNpaDt(Date npaDt) {
        this.npaDt = npaDt;
    }
    
    public BigDecimal getMarginAmt() {
        return marginAmt;
    }
    
    public void setMarginAmt(BigDecimal marginAmt) {
        this.marginAmt = marginAmt;
    }
    
    public String getNpaClassification() {
        return npaClassification;
    }
    
    public void setNpaClassification(String npaClassification) {
        this.npaClassification = npaClassification;
    }
    
    public int getMoratoriumPrinciple() {
        return moratoriumPrinciple;
    }
    
    public void setMoratoriumPrinciple(int moratoriumPrinciple) {
        this.moratoriumPrinciple = moratoriumPrinciple;
    }
    
    public int getMoratoriumInterest() {
        return moratoriumInterest;
    }
    
    public void setMoratoriumInterest(int moratoriumInterest) {
        this.moratoriumInterest = moratoriumInterest;
    }
    
    public BigDecimal getSubsidyAmt() {
        return subsidyAmt;
    }
    
    public void setSubsidyAmt(BigDecimal subsidyAmt) {
        this.subsidyAmt = subsidyAmt;
    }
    
    public String getSecuried() {
        return securied;
    }
    
    public void setSecuried(String securied) {
        this.securied = securied;
    }
    
    public BigDecimal getSecurityVal() {
        return securityVal;
    }
    
    public void setSecurityVal(BigDecimal securityVal) {
        this.securityVal = securityVal;
    }
    
    public BigDecimal getIntRoi() {
        return intRoi;
    }
    
    public void setIntRoi(BigDecimal intRoi) {
        this.intRoi = intRoi;
    }
    
    public Date getInstalmentStartDate() {
        return instalmentStartDate;
    }
    
    public void setInstalmentStartDate(Date instalmentStartDate) {
        this.instalmentStartDate = instalmentStartDate;
    }
    
    public BigDecimal getAdhocLim() {
        return adhocLim;
    }
    
    public void setAdhocLim(BigDecimal adhocLim) {
        this.adhocLim = adhocLim;
    }
    
    public BigDecimal getIdealBal() {
        return idealBal;
    }
    
    public void setIdealBal(BigDecimal idealBal) {
        this.idealBal = idealBal;
    }
    
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
    public String getFixOrFloat() {
        return fixOrFloat;
    }
    
    public void setFixOrFloat(String fixOrFloat) {
        this.fixOrFloat = fixOrFloat;
    }
    
    public String getBenchMark() {
        return benchMark;
    }
    
    public void setBenchMark(String benchMark) {
        this.benchMark = benchMark;
    }
    
    public BigDecimal getIntOffSet() {
        return intOffSet;
    }
    
    public void setIntOffSet(BigDecimal intOffSet) {
        this.intOffSet = intOffSet;
    }
    
    @Override
    public String toString() {
        return "LoanMasterEntity [accId=" + accId + ", installmentAmt=" + installmentAmt + ", installFreq="
                + installFreq + ", drawingPower=" + drawingPower + ", firstDisDt=" + firstDisDt + ", sanctionedAmt="
                + sanctionedAmt + ", paReserve=" + paReserve + ", intPay=" + intPay + ", penalInterestDue="
                + penalInterestDue + ", overdueAmt=" + overdueAmt + ", equalInst=" + equalInst + ", disAmt=" + disAmt
                + ", intDue=" + intDue + ", expiryDt=" + expiryDt + ", penalRoi=" + penalRoi + ", intCapitalised="
                + intCapitalised + ", intRecv=" + intRecv + ", npaIntr=" + npaIntr + ", sanctionDt=" + sanctionDt
                + ", sanctionAdvc=" + sanctionAdvc + ", sanctAuth=" + sanctAuth + ", graceDays=" + graceDays
                + ", period=" + period + ", npaDt=" + npaDt + ", marginAmt=" + marginAmt + ", npaClassification="
                + npaClassification + ", moratoriumPrinciple=" + moratoriumPrinciple + ", moratoriumInterest="
                + moratoriumInterest + ", subsidyAmt=" + subsidyAmt + ", securied=" + securied + ", securityVal="
                + securityVal + ", intRoi=" + intRoi + ", instalmentStartDate=" + instalmentStartDate + ", adhocLim="
                + adhocLim + ", idealBal=" + idealBal + ", fixOrFloat=" + fixOrFloat + ", benchMark=" + benchMark
                + ", intOffSet=" + intOffSet + "]";
    }
    
}
