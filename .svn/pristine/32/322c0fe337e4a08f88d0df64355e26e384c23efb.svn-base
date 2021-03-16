package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "account_master")
public class AccountMasterEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "acc_gen")
    @SequenceGenerator(name = "acc_gen", sequenceName = "account_master_seq", allocationSize = 1)
    @Column(name = "ACC_ID", length = 20, nullable = false)
    private BigInteger accId;
    
    @Column(name = "PRD_ID", length = 5, nullable = false)
    private int prdId;
    
    @Column(name = "LEDGER_BAL", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal ledgerBal;
    
    @Column(name = "AVAILABLE_BAL", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal availableBal;
    
    @Column(name = "UNCLEAR_BAL_DR", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal unclearBalDr;
    
    @Column(name = "UNCLEAR_BAL_CR", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal unclearBalCr;
    
    @Column(name = "SHADOW_BAL", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal shadowBal;
    
    @Column(name = "DAYS_OPENING_BAL", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal daysOpeningBal;
    
    @Column(name = "CUST_ID", length = 20, nullable = false)
    private BigInteger custId;
    
    @Column(name = "FREEZE_AMT", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal freezeAmt;
    
    @Column(name = "INTRODUCER_ID", length = 20)
    private BigInteger introducerId;
    
    @Column(name = "OPEN_DT", nullable = false)
    
    private Date openDt;
    
    @Column(name = "CLOSE_DT")
    
    private Date closeDt;
    
    @Column(name = "ENTERED_DT", nullable = false)
    
    private Date enteredDt;
    
    @Column(name = "LAST_INT_PAY_DT")
    
    private Date lastIntPayDt;
    
    @Column(name = "SMS_FACILITY", length = 1, nullable = false)
    private String smsFacility;
    
    @Column(name = "EMAIL_FACILITY", length = 1, nullable = false)
    private String emailFacility;
    
    @Column(name = "ATM_FACILITY", length = 1, nullable = false)
    private String atmFacility;
    
    @Column(name = "CHQ_HOLDER", length = 1, nullable = false)
    private String chqHolder;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    @Column(name = "FREEZE", length = 1)
    private String freeze;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "BRANCH_CODE", length = 20, nullable = false)
    private String branchCode;
    
    @Column(name = "HOME_BRANCH", length = 20, nullable = false)
    private String homeBranch;
    
    @Column(name = "ACC_TYPE", length = 20, nullable = false)
    private String accType;
    
    @Column(name = "ACC_NO", length = 20, nullable = false)
    private String accNo;
    
    @Column(name = "NATURE_OF_ACC", length = 20, nullable = false)
    private String natureOfAcc;
    
    @Column(name = "OPERATING_INSTR", length = 20, nullable = false)
    private String operatingInstr;
    
    @Column(name = "ENTERED_BY", length = 10, nullable = false)
    private String enteredBy;
    
    @Column(name = "AUTH_BY", length = 10)
    private String authBy;
    
    @Column(name = "LAST_UPDATE_COUNT", length = 20, nullable = false)
    private BigInteger lastUpdateCount;
    
    @Column(name = "FREEZE_UPTO")
    private Date freezeUpto;
    
    @Column(name = "LAST_TRANS_DT")
    
    private Date lastTransDt;
    
    @Column(name = "PROD_INSERT_YN", length = 1)
    private String prodInsertYesNo;
    
    @Column(name = "LAST_INT_PAID", precision = 9, scale = 6, nullable = true)
    private BigDecimal lastIntPaid = BigDecimal.ZERO;
    
    @Column(name = "REJ_REASON", length = 50)
    private String reason;
    
    public BigInteger getLastUpdateCount() {
        return lastUpdateCount;
    }
    
    public void setLastUpdateCount(BigInteger lastUpdateCount) {
        this.lastUpdateCount = lastUpdateCount;
    }
    
    public int getPrdId() {
        return prdId;
    }
    
    public void setPrdId(int prdId) {
        this.prdId = prdId;
    }
    
    public BigInteger getAccId() {
        return accId;
    }
    
    public void setAccId(BigInteger accId) {
        this.accId = accId;
    }
    
    public BigDecimal getLedgerBal() {
        return ledgerBal;
    }
    
    public void setLedgerBal(BigDecimal ledgerBal) {
        this.ledgerBal = ledgerBal;
    }
    
    public BigDecimal getAvailableBal() {
        return availableBal;
    }
    
    public void setAvailableBal(BigDecimal availableBal) {
        this.availableBal = availableBal;
    }
    
    public BigDecimal getUnclearBalDr() {
        return unclearBalDr;
    }
    
    public void setUnclearBalDr(BigDecimal unclearBalDr) {
        this.unclearBalDr = unclearBalDr;
    }
    
    public BigDecimal getUnclearBalCr() {
        return unclearBalCr;
    }
    
    public void setUnclearBalCr(BigDecimal unclearBalCr) {
        this.unclearBalCr = unclearBalCr;
    }
    
    public BigDecimal getShadowBal() {
        return shadowBal;
    }
    
    public void setShadowBal(BigDecimal shadowBal) {
        this.shadowBal = shadowBal;
    }
    
    public BigDecimal getDaysOpeningBal() {
        return daysOpeningBal;
    }
    
    public void setDaysOpeningBal(BigDecimal daysOpeningBal) {
        this.daysOpeningBal = daysOpeningBal;
    }
    
    public BigInteger getCustId() {
        return custId;
    }
    
    public void setCustId(BigInteger custId) {
        this.custId = custId;
    }
    
    public BigDecimal getFreezeAmt() {
        return freezeAmt;
    }
    
    public void setFreezeAmt(BigDecimal freezeAmt) {
        this.freezeAmt = freezeAmt;
    }
    
    public BigInteger getIntroducerId() {
        return introducerId;
    }
    
    public void setIntroducerId(BigInteger introducerId) {
        this.introducerId = introducerId;
    }
    
    public Date getOpenDt() {
        return openDt;
    }
    
    public void setOpenDt(Date openDt) {
        this.openDt = openDt;
    }
    
    public Date getCloseDt() {
        return closeDt;
    }
    
    public void setCloseDt(Date closeDt) {
        this.closeDt = closeDt;
    }
    
    public Date getEnteredDt() {
        return enteredDt;
    }
    
    public void setEnteredDt(Date enteredDt) {
        this.enteredDt = enteredDt;
    }
    
    public Date getLastIntPayDt() {
        return lastIntPayDt;
    }
    
    public void setLastIntPayDt(Date lastIntPayDt) {
        this.lastIntPayDt = lastIntPayDt;
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
    
    public String getChqHolder() {
        return chqHolder;
    }
    
    public void setChqHolder(String chqHolder) {
        this.chqHolder = chqHolder;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getFreeze() {
        return freeze;
    }
    
    public void setFreeze(String freeze) {
        this.freeze = freeze;
    }
    
    public String getBankCode() {
        return bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    public String getBranchCode() {
        return branchCode;
    }
    
    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }
    
    public String getHomeBranch() {
        return homeBranch;
    }
    
    public void setHomeBranch(String homeBranch) {
        this.homeBranch = homeBranch;
    }
    
    public String getAccType() {
        return accType;
    }
    
    public void setAccType(String accType) {
        this.accType = accType;
    }
    
    public String getAccNo() {
        return accNo;
    }
    
    public void setAccNo(String accNo) {
        this.accNo = accNo;
    }
    
    public String getNatureOfAcc() {
        return natureOfAcc;
    }
    
    public void setNatureOfAcc(String natureOfAcc) {
        this.natureOfAcc = natureOfAcc;
    }
    
    public String getOperatingInstr() {
        return operatingInstr;
    }
    
    public void setOperatingInstr(String operatingInstr) {
        this.operatingInstr = operatingInstr;
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
    
    public Date getFreezeUpto() {
        return freezeUpto;
    }
    
    public void setFreezeUpto(Date freezeUpto) {
        this.freezeUpto = freezeUpto;
    }
    
    public Date getLastTransDt() {
        return lastTransDt;
    }
    
    public void setLastTransDt(Date lastTransDt) {
        this.lastTransDt = lastTransDt;
    }
    
    public String getProdInsertYesNo() {
        return prodInsertYesNo;
    }
    
    public void setProdInsertYesNo(String prodInsertYesNo) {
        this.prodInsertYesNo = prodInsertYesNo;
    }
    
    public BigDecimal getLastIntPaid() {
        return lastIntPaid == null ? BigDecimal.ZERO : lastIntPaid;
    }
    
    public void setLastIntPaid(BigDecimal lastIntPaid) {
        this.lastIntPaid = lastIntPaid == null ? BigDecimal.ZERO : lastIntPaid;
    }
    
    public String getReason() {
        return reason;
    }
    
    public void setReason(String reason) {
        this.reason = reason;
    }
    
    @Override
    public String toString() {
        return "AccountMasterEntity [accId=" + accId + ", prdId=" + prdId + ", ledgerBal=" + ledgerBal
                + ", availableBal=" + availableBal + ", unclearBalDr=" + unclearBalDr + ", unclearBalCr=" + unclearBalCr
                + ", shadowBal=" + shadowBal + ", daysOpeningBal=" + daysOpeningBal + ", custId=" + custId
                + ", freezeAmt=" + freezeAmt + ", introducerId=" + introducerId + ", openDt=" + openDt + ", closeDt="
                + closeDt + ", enteredDt=" + enteredDt + ", lastIntPayDt=" + lastIntPayDt + ", smsFacility="
                + smsFacility + ", emailFacility=" + emailFacility + ", atmFacility=" + atmFacility + ", chqHolder="
                + chqHolder + ", status=" + status + ", freeze=" + freeze + ", bankCode=" + bankCode + ", branchCode="
                + branchCode + ", homeBranch=" + homeBranch + ", accType=" + accType + ", accNo=" + accNo
                + ", natureOfAcc=" + natureOfAcc + ", operatingInstr=" + operatingInstr + ", enteredBy=" + enteredBy
                + ", authBy=" + authBy + ", lastUpdateCount=" + lastUpdateCount + ", freezeUpto=" + freezeUpto
                + ", lastTransDt=" + lastTransDt + ", prodInsertYesNo=" + prodInsertYesNo + ", lastIntPaid="
                + lastIntPaid + "]";
    }
    
}
