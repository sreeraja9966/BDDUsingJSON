package com.sysnik.selenium.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Time;
import java.util.Date;

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
@Table(name = "REMIT_INSTRUMENT")
public class RemitInstrumentEntity implements Serializable {
    
    private static final long serialVersionUID = -6073429642117222655L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "remit_instrument_seq")
    @SequenceGenerator(name = "remit_instrument_seq", sequenceName = "remit_instrument_seq", allocationSize = 1)
    @Column(name = "ID", length = 10, nullable = false)
    private BigInteger id;
    
    @Column(name = "STATUS", length = 2, nullable = false)
    private String status;
    
    @Column(name = "REMITTANCE_AMOUNT", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal remittanceAmount;
    
    @Column(name = "BENEF_ID", length = 10, nullable = false)
    private BigInteger beneficiaryId;
    
    @Column(name = "ORIG_VOUCHER_ID", length = 10, nullable = false)
    private BigInteger origVoucherId; // originatVoucherId
    
    @Column(name = "RESP_VOUCHER_ID", length = 10, nullable = false)
    private BigInteger respondVoucherId;
    
    @Column(name = "CREATE_DT", nullable = false)
   // @JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Kolkata", locale = "en-IN")
    private Date createDate;
    
    @Column(name = "STALE_DT", nullable = false)
   // @JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Kolkata", locale = "en-IN")
    private Date staleDate;
    
    @Column(name = "REVALID_DT", nullable = true)
   // @JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Kolkata", locale = "en-IN")
    private Date revalidDate;
    
    @Column(name = "RESPONDED_DT", nullable = true)
   // @JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Kolkata", locale = "en-IN")
    private Date respondedDate;
    
    @Column(name = "CANCEL_DT", nullable = true)
   // @JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Kolkata", locale = "en-IN")
    private Date cancelDate;
    
    @Column(name = "STOPPED_DT", nullable = true)
    //@JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Kolkata", locale = "en-IN")
    private Date stoppedDate;
    
    @Column(name = "STOPPED_REVOKE_DT", nullable = true)
  //  @JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Kolkata", locale = "en-IN")
    private Date stoppedRevokeDate;
    
    @Column(name = "ADVICE_DT", nullable = true)
    //@JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Kolkata", locale = "en-IN")
    private Date adviceDate;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "BRANCH_CODE", length = 20, nullable = false)
    private String branchCode;
    
    @Column(name = "REMITTANCE_SRNO", length = 30, nullable = false)
    private String remittanceSrNo;
    
    @Column(name = "REMITTANCE_TYPE", length = 2, nullable = false)
    private String remittanceType;
    
    @Column(name = "ORIG_RESP", length = 1, nullable = false)
    private String origResp;
    
    @Column(name = "PAY_MODE", length = 2, nullable = false)
    private String payMode;
    
    @Column(name = "ADVICE", length = 1, nullable = false)
    private String advice;
    
    @Column(name = "DR_ACCOUNT_NO", length = 20, nullable = true)
    private String drAccountNo;
    
    @Column(name = "BENEF_CITY_CODE", length = 3, nullable = false)
    private String beneficiaryCityCode;
    
    @Column(name = "BENEF_BANK_CODE", length = 3, nullable = false)
    private String beneficiaryBankCode;
    
    @Column(name = "BENEF_BRANCH_CODE", length = 4, nullable = false)
    private String beneficiaryBranchCode;
    
    @Column(name = "DR_CR_FLAG", length = 1, nullable = false)
    private String drCrFlag;
    
    @Column(name = "PRINT_SR_NO", length = 10, nullable = false)
    private String printSrNo;
    
    @Column(name = "PRINT_STATUS", length = 1, nullable = true)
    private String printStatus;
    
    @Column(name = "ENTERED_BY", length = 10, nullable = false)
    private String enteredBy;
    
    @Column(name = "AUTH_BY", length = 10, nullable = true)
    private String authBy;
    
    @Column(name = "DUPLICATE_ISSUED", length = 1, nullable = true)
    private String duplicateIssued;
    
    @Column(name = "DUPLICATE_PRINT_SRNO", length = 10, nullable = true)
    private String duplicatePrintSrNo;
    
    @Column(name = "DUPLICATE_ISSUE_ENTERED_BY", length = 10, nullable = true)
    private String duplicateIssuedEnteredBy;
    
    @Column(name = "DUPLICATE_ISSUE_AUTH_BY", length = 10, nullable = true)
    private String duplicateIssuedAuthBy;
    
    @Column(name = "RESP_ACCOUNT_NO", length = 20, nullable = true)
    private String respAccountNo;
    
    @Column(name = "ADVICE_NO", length = 20, nullable = true)
    private String adviceNo;
    
    @Column(name = "BEN_NAME", length = 50, nullable = true)
    private String beneficiaryName;
    
    @Column(name = "REASON", length = 30, nullable = true)
    private String cancelReason;
    
    @Column(name = "CANCEL_BY", length = 10, nullable = true)
    private String cancelBy;
    
    @Column(name = "CANCEL_AUTH_BY", length = 10, nullable = true)
    private String cancelAuthBy;
    
    @Column(name = "DUP_ISSUE_DATE", length = 10, nullable = true)
    private Date dupIssueDate;
    
    @Column(name = "STOP_TIME", nullable = true)
    private Time stopTime;
    
    @Column(name = "REVOK_STOP_TIME", nullable = true)
    private Time revokeStopTime;
    
    /**
     * @return the id
     */
    public BigInteger getId() {
        return id;
    }
    
    /**
     * @param id
     *            the id to set
     */
    public void setId(BigInteger id) {
        this.id = id;
    }
    
    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }
    
    /**
     * @param status
     *            the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }
    
    /**
     * @return the remittanceAmount
     */
    public BigDecimal getRemittanceAmount() {
        return remittanceAmount;
    }
    
    /**
     * @param remittanceAmount
     *            the remittanceAmount to set
     */
    public void setRemittanceAmount(BigDecimal remittanceAmount) {
        this.remittanceAmount = remittanceAmount;
    }
    
    /**
     * @return the beneficiaryId
     */
    public BigInteger getBeneficiaryId() {
        return beneficiaryId;
    }
    
    /**
     * @param beneficiaryId
     *            the beneficiaryId to set
     */
    public void setBeneficiaryId(BigInteger beneficiaryId) {
        this.beneficiaryId = beneficiaryId;
    }
    
    public BigInteger getOriginatVoucherId() {
        return origVoucherId;
    }
    
    public void setOriginatVoucherId(BigInteger origVoucherId) {
        this.origVoucherId = origVoucherId;
    }
    
    public BigInteger getRespondVoucherId() {
        return respondVoucherId;
    }
    
    public void setRespondVoucherId(BigInteger respondVoucherId) {
        this.respondVoucherId = respondVoucherId;
    }
    
    /**
     * @return the createDate
     */
    public Date getCreateDate() {
        return createDate;
    }
    
    /**
     * @param createDate
     *            the createDate to set
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    /**
     * @return the staleDate
     */
    public Date getStaleDate() {
        return staleDate;
    }
    
    /**
     * @param staleDate
     *            the staleDate to set
     */
    public void setStaleDate(Date staleDate) {
        this.staleDate = staleDate;
    }
    
    /**
     * @return the revalidDate
     */
    public Date getRevalidDate() {
        return revalidDate;
    }
    
    /**
     * @param revalidDate
     *            the revalidDate to set
     */
    public void setRevalidDate(Date revalidDate) {
        this.revalidDate = revalidDate;
    }
    
    /**
     * @return the respondedDate
     */
    public Date getRespondedDate() {
        return respondedDate;
    }
    
    /**
     * @param respondedDate
     *            the respondedDate to set
     */
    public void setRespondedDate(Date respondedDate) {
        this.respondedDate = respondedDate;
    }
    
    /**
     * @return the cancelDate
     */
    public Date getCancelDate() {
        return cancelDate;
    }
    
    /**
     * @param cancelDate
     *            the cancelDate to set
     */
    public void setCancelDate(Date cancelDate) {
        this.cancelDate = cancelDate;
    }
    
    /**
     * @return the stoppedDate
     */
    public Date getStoppedDate() {
        return stoppedDate;
    }
    
    /**
     * @param stoppedDate
     *            the stoppedDate to set
     */
    public void setStoppedDate(Date stoppedDate) {
        this.stoppedDate = stoppedDate;
    }
    
    /**
     * @return the stoppedRevokeDate
     */
    public Date getStoppedRevokeDate() {
        return stoppedRevokeDate;
    }
    
    /**
     * @param stoppedRevokeDate
     *            the stoppedRevokeDate to set
     */
    public void setStoppedRevokeDate(Date stoppedRevokeDate) {
        this.stoppedRevokeDate = stoppedRevokeDate;
    }
    
    /**
     * @return the adviceDate
     */
    public Date getAdviceDate() {
        return adviceDate;
    }
    
    /**
     * @param adviceDate
     *            the adviceDate to set
     */
    public void setAdviceDate(Date adviceDate) {
        this.adviceDate = adviceDate;
    }
    
    /**
     * @return the bankCode
     */
    public String getBankCode() {
        return bankCode;
    }
    
    /**
     * @param bankCode
     *            the bankCode to set
     */
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    /**
     * @return the branchCode
     */
    public String getBranchCode() {
        return branchCode;
    }
    
    /**
     * @param branchCode
     *            the branchCode to set
     */
    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }
    
    /**
     * @return the remittanceSrNo
     */
    public String getRemittanceSrNo() {
        return remittanceSrNo;
    }
    
    /**
     * @param remittanceSrNo
     *            the remittanceSrNo to set
     */
    public void setRemittanceSrNo(String remittanceSrNo) {
        this.remittanceSrNo = remittanceSrNo;
    }
    
    /**
     * @return the remittanceType
     */
    public String getRemittanceType() {
        return remittanceType;
    }
    
    /**
     * @param remittanceType
     *            the remittanceType to set
     */
    public void setRemittanceType(String remittanceType) {
        this.remittanceType = remittanceType;
    }
    
    /**
     * @return the origResp
     */
    public String getOrigResp() {
        return origResp;
    }
    
    /**
     * @param origResp
     *            the origResp to set
     */
    public void setOrigResp(String origResp) {
        this.origResp = origResp;
    }
    
    /**
     * @return the payMode
     */
    public String getPayMode() {
        return payMode;
    }
    
    /**
     * @param payMode
     *            the payMode to set
     */
    public void setPayMode(String payMode) {
        this.payMode = payMode;
    }
    
    /**
     * @return the advice
     */
    public String getAdvice() {
        return advice;
    }
    
    /**
     * @param advice
     *            the advice to set
     */
    public void setAdvice(String advice) {
        this.advice = advice;
    }
    
    /**
     * @return the drAccountNo
     */
    public String getDrAccountNo() {
        return drAccountNo;
    }
    
    /**
     * @param drAccountNo
     *            the drAccountNo to set
     */
    public void setDrAccountNo(String drAccountNo) {
        this.drAccountNo = drAccountNo;
    }
    
    /**
     * @return the beneficiaryCityCode
     */
    public String getBeneficiaryCityCode() {
        return beneficiaryCityCode;
    }
    
    /**
     * @param beneficiaryCityCode
     *            the beneficiaryCityCode to set
     */
    public void setBeneficiaryCityCode(String beneficiaryCityCode) {
        this.beneficiaryCityCode = beneficiaryCityCode;
    }
    
    /**
     * @return the beneficiaryBankCode
     */
    public String getBeneficiaryBankCode() {
        return beneficiaryBankCode;
    }
    
    /**
     * @param beneficiaryBankCode
     *            the beneficiaryBankCode to set
     */
    public void setBeneficiaryBankCode(String beneficiaryBankCode) {
        this.beneficiaryBankCode = beneficiaryBankCode;
    }
    
    /**
     * @return the beneficiaryBranchCode
     */
    public String getBeneficiaryBranchCode() {
        return beneficiaryBranchCode;
    }
    
    /**
     * @param beneficiaryBranchCode
     *            the beneficiaryBranchCode to set
     */
    public void setBeneficiaryBranchCode(String beneficiaryBranchCode) {
        this.beneficiaryBranchCode = beneficiaryBranchCode;
    }
    
    /**
     * @return the drCrFlag
     */
    public String getDrCrFlag() {
        return drCrFlag;
    }
    
    /**
     * @param drCrFlag
     *            the drCrFlag to set
     */
    public void setDrCrFlag(String drCrFlag) {
        this.drCrFlag = drCrFlag;
    }
    
    /**
     * @return the printSrNo
     */
    public String getPrintSrNo() {
        return printSrNo;
    }
    
    /**
     * @param printSrNo
     *            the printSrNo to set
     */
    public void setPrintSrNo(String printSrNo) {
        this.printSrNo = printSrNo;
    }
    
    /**
     * @return the printStatus
     */
    public String getPrintStatus() {
        return printStatus;
    }
    
    /**
     * @param printStatus
     *            the printStatus to set
     */
    public void setPrintStatus(String printStatus) {
        this.printStatus = printStatus;
    }
    
    /**
     * @return the enteredBy
     */
    public String getEnteredBy() {
        return enteredBy;
    }
    
    /**
     * @param enteredBy
     *            the enteredBy to set
     */
    public void setEnteredBy(String enteredBy) {
        this.enteredBy = enteredBy;
    }
    
    /**
     * @return the authBy
     */
    public String getAuthBy() {
        return authBy;
    }
    
    /**
     * @param authBy
     *            the authBy to set
     */
    public void setAuthBy(String authBy) {
        this.authBy = authBy;
    }
    
    /**
     * @return the duplicateIssued
     */
    public String getDuplicateIssued() {
        return duplicateIssued;
    }
    
    /**
     * @param duplicateIssued
     *            the duplicateIssued to set
     */
    public void setDuplicateIssued(String duplicateIssued) {
        this.duplicateIssued = duplicateIssued;
    }
    
    /**
     * @return the duplicatePrintSrNo
     */
    public String getDuplicatePrintSrNo() {
        return duplicatePrintSrNo;
    }
    
    /**
     * @param duplicatePrintSrNo
     *            the duplicatePrintSrNo to set
     */
    public void setDuplicatePrintSrNo(String duplicatePrintSrNo) {
        this.duplicatePrintSrNo = duplicatePrintSrNo;
    }
    
    /**
     * @return the duplicateIssuedEnteredBy
     */
    public String getDuplicateIssuedEnteredBy() {
        return duplicateIssuedEnteredBy;
    }
    
    /**
     * @param duplicateIssuedEnteredBy
     *            the duplicateIssuedEnteredBy to set
     */
    public void setDuplicateIssuedEnteredBy(String duplicateIssuedEnteredBy) {
        this.duplicateIssuedEnteredBy = duplicateIssuedEnteredBy;
    }
    
    /**
     * @return the duplicateIssuedAuthBy
     */
    public String getDuplicateIssuedAuthBy() {
        return duplicateIssuedAuthBy;
    }
    
    /**
     * @param duplicateIssuedAuthBy
     *            the duplicateIssuedAuthBy to set
     */
    public void setDuplicateIssuedAuthBy(String duplicateIssuedAuthBy) {
        this.duplicateIssuedAuthBy = duplicateIssuedAuthBy;
    }
    
    /**
     * @return the respAccountNo
     */
    public String getRespAccountNo() {
        return respAccountNo;
    }
    
    /**
     * @param respAccountNo
     *            the respAccountNo to set
     */
    public void setRespAccountNo(String respAccountNo) {
        this.respAccountNo = respAccountNo;
    }
    
    /**
     * @return the adviceNo
     */
    public String getAdviceNo() {
        return adviceNo;
    }
    
    /**
     * @param adviceNo
     *            the adviceNo to set
     */
    public void setAdviceNo(String adviceNo) {
        this.adviceNo = adviceNo;
    }
    
    /**
     * @return the beneficiaryName
     */
    public String getBeneficiaryName() {
        return beneficiaryName;
    }
    
    /**
     * @param beneficiaryName
     *            the beneficiaryName to set
     */
    public void setBeneficiaryName(String beneficiaryName) {
        this.beneficiaryName = beneficiaryName;
    }
    
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
    /**
     * @return the cancelReason
     */
    public String getCancelReason() {
        return cancelReason;
    }
    
    /**
     * @param cancelReason
     *            the cancelReason to set
     */
    public void setCancelReason(String cancelReason) {
        this.cancelReason = cancelReason;
    }
    
    /**
     * @return the cancelBy
     */
    public String getCancelBy() {
        return cancelBy;
    }
    
    /**
     * @param cancelBy
     *            the cancelBy to set
     */
    public void setCancelBy(String cancelBy) {
        this.cancelBy = cancelBy;
    }
    
    /**
     * @return the cancelAuthBy
     */
    public String getCancelAuthBy() {
        return cancelAuthBy;
    }
    
    /**
     * @param cancelAuthBy
     *            the cancelAuthBy to set
     */
    public void setCancelAuthBy(String cancelAuthBy) {
        this.cancelAuthBy = cancelAuthBy;
    }
    
    public Date getDupIssueDate() {
        return dupIssueDate;
    }
    
    public void setDupIssueDate(Date dupIssueDate) {
        this.dupIssueDate = dupIssueDate;
    }
    
    public Time getStopTime() {
        return stopTime;
    }
    
    public void setStopTime(Time stopTime) {
        this.stopTime = stopTime;
    }
    
    public Time getRevokeStopTime() {
        return revokeStopTime;
    }
    
    public void setRevokeStopTime(Time revokeStopTime) {
        this.revokeStopTime = revokeStopTime;
    }
    
    @Override
    public String toString() {
        return "RemitInstrumentEntity [id=" + id + ", status=" + status + ", remittanceAmount=" + remittanceAmount
                + ", beneficiaryId=" + beneficiaryId + ", origVoucherId=" + origVoucherId + ", respondVoucherId="
                + respondVoucherId + ", createDate=" + createDate + ", staleDate=" + staleDate + ", revalidDate="
                + revalidDate + ", respondedDate=" + respondedDate + ", cancelDate=" + cancelDate + ", stoppedDate="
                + stoppedDate + ", stoppedRevokeDate=" + stoppedRevokeDate + ", adviceDate=" + adviceDate
                + ", bankCode=" + bankCode + ", branchCode=" + branchCode + ", remittanceSrNo=" + remittanceSrNo
                + ", remittanceType=" + remittanceType + ", origResp=" + origResp + ", payMode=" + payMode + ", advice="
                + advice + ", drAccountNo=" + drAccountNo + ", beneficiaryCityCode=" + beneficiaryCityCode
                + ", beneficiaryBankCode=" + beneficiaryBankCode + ", beneficiaryBranchCode=" + beneficiaryBranchCode
                + ", drCrFlag=" + drCrFlag + ", printSrNo=" + printSrNo + ", printStatus=" + printStatus
                + ", enteredBy=" + enteredBy + ", authBy=" + authBy + ", duplicateIssued=" + duplicateIssued
                + ", duplicatePrintSrNo=" + duplicatePrintSrNo + ", duplicateIssuedEnteredBy="
                + duplicateIssuedEnteredBy + ", duplicateIssuedAuthBy=" + duplicateIssuedAuthBy + ", respAccountNo="
                + respAccountNo + ", adviceNo=" + adviceNo + ", beneficiaryName=" + beneficiaryName + ", cancelReason="
                + cancelReason + ", cancelBy=" + cancelBy + ", cancelAuthBy=" + cancelAuthBy + ", dupIssueDate="
                + dupIssueDate + ", stopTime=" + stopTime + ", revokeStopTime=" + revokeStopTime + "]";
    }
}
