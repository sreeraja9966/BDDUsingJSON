package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "SI_MASTER")
public class SIMasterEntity {
	@Id
	@Column(name = "SI_NUMBER", nullable = false)

	private BigInteger siNumber;


	@Column(name = "BANK_CODE", nullable = false, length = 20)

	private String bankCode;

	
	@Column(name = "BRANCH_CODE", nullable = false, length = 20)

	private String branchCode;

	@Column(name = "TRANS_AMT", nullable = true, precision = 19, scale = 2)

	private BigDecimal transAmt;

	@Column(name = "BASE_AMT_DR", nullable = true, precision = 19, scale = 2)
	private BigDecimal baseAmtDr;

	@Column(name = "BASE_AMT_CR", nullable = true, precision = 19, scale = 2)
	private BigDecimal baseAmtCr;

	@Column(name = "MIN_AMT", nullable = true, precision = 19, scale = 2)
	private BigDecimal minAmt;

	@Column(name = "MAX_AMT", nullable = true, precision = 19, scale = 2)
	private BigDecimal maxAmt;

	@Column(name = "FIRST_DUE_DT", nullable = false)

	private Date firstDueDate;

	@Column(name = "NEXT_DUE_DT", nullable = false)

	private Date nextDueDate;

	@Column(name = "EXPIRY_DT", nullable = false)

	private Date expiryDt;

	@Column(name = "LAST_EXCU_DT", nullable = true)

	private Date lastExDt;

	@Column(name = "ENTERED_DT", nullable = false)

	private Date enteredDt;

	@Column(name = "SI_CANCELLED_DT", nullable = true)

	private Date siCancelledDate;

	@Column(name = "SI_TYPE", nullable = false, length = 1)
	private String siType;

	@Column(name = "STATUS", nullable = false, length = 1)
	private String status;

	@Column(name = "AUTO_PASS_YESNO", nullable = false, length = 1)
	private String autoPass;

	@Column(name = "BAL_FREEZE_YESNO", nullable = false, length = 1)
	private String balFreeze;

	@Column(name = "SI_FREQUENCY", nullable = false, length = 3)

	private String siFrequency;

	@Column(name = "FROM_ACCID", nullable = false, length = 20)
	private BigInteger fromAccId;

	@Column(name = "TO_ACCID", nullable = false, length = 20)
	private BigInteger toAccId;

	@Column(name = "GRACE_DAYS", nullable = false, length = 3)
	private int graceDays;

	@Column(name = "FROM_NARATION", nullable = false, length = 50)

	private String fromNaration;

	@Column(name = "TO_NARATION", nullable = false, length = 50)

	private String toNaration;

	@Column(name = "ENTERED_BY", nullable = false, length = 20)

	private String enteredBy;

	@Column(name = "AUTH_BY", nullable = true, length = 20)

	private String authBy;

	@Column(name = "CANCELLED_BY", nullable = true, length = 20)

	private String cancelledBy;

	@Column(name = "REASON", nullable = true, length = 50)

	private String reasonCode;

	@Column(name = "FDSI_TYPE", nullable = true, length = 50)

	private String fdSiType;

	@Column(name = "BENEFICIARY_ACC_NO", nullable = true, length = 50)

	private String beneficiaryAccNo;

	@Column(name = "BENEFICIARY_IFSC", nullable = true, length = 50)

	private String beneficiaryIfsc;

	@Column(name = "BENEFICIARY_BANK", nullable = true, length = 50)

	private String beneficiaryBank;

	@Column(name = "BENEFICIARY_BRANCH", nullable = true, length = 50)

	private String beneficiaryBranch;

	@Column(name = "BENEFICIARY_NAME", nullable = true, length = 50)

	private String beneficiaryName;

	@Column(name = "BENEFICIARY_ACC_TYPE", nullable = true, length = 02)

	private String beneficiaryAccType;

	@Column(name = "PAYMENT_TYPE", length = 20)

	private String paymentType;

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getFdSiType() {
		return fdSiType;
	}

	public void setFdSiType(String fdSiType) {
		this.fdSiType = fdSiType;
	}

	public String getBeneficiaryAccNo() {
		return beneficiaryAccNo;
	}

	public void setBeneficiaryAccNo(String beneficiaryAccNo) {
		this.beneficiaryAccNo = beneficiaryAccNo;
	}

	public String getBeneficiaryIfsc() {
		return beneficiaryIfsc;
	}

	public void setBeneficiaryIfsc(String beneficiaryIfsc) {
		this.beneficiaryIfsc = beneficiaryIfsc;
	}

	public String getBeneficiaryBank() {
		return beneficiaryBank;
	}

	public void setBeneficiaryBank(String beneficiaryBank) {
		this.beneficiaryBank = beneficiaryBank;
	}

	public String getBeneficiaryBranch() {
		return beneficiaryBranch;
	}

	public void setBeneficiaryBranch(String beneficiaryBranch) {
		this.beneficiaryBranch = beneficiaryBranch;
	}

	public String getBeneficiaryName() {
		return beneficiaryName;
	}

	public void setBeneficiaryName(String beneficiaryName) {
		this.beneficiaryName = beneficiaryName;
	}

	public int getGraceDays() {
		return graceDays;
	}

	public void setGraceDays(int graceDays) {
		this.graceDays = graceDays;
	}

	public Date getSiCancelledDate() {
		return siCancelledDate;
	}

	public void setSiCancelledDate(Date siCancelledDate) {
		this.siCancelledDate = siCancelledDate;
	}

	public BigInteger getSiNumber() {
		return siNumber;
	}

	public void setSiNumber(BigInteger siNumber) {
		this.siNumber = siNumber;
	}

	public BigDecimal getTransAmt() {
		return transAmt;
	}

	public void setTransAmt(BigDecimal transAmt) {
		this.transAmt = transAmt;
	}

	public BigDecimal getBaseAmtDr() {
		return baseAmtDr;
	}

	public void setBaseAmtDr(BigDecimal baseAmtDr) {
		this.baseAmtDr = baseAmtDr;
	}

	public String getReasonCode() {
		return reasonCode;
	}

	public void setReasonCode(String reasonCode) {
		this.reasonCode = reasonCode;
	}

	public BigDecimal getBaseAmtCr() {
		return baseAmtCr;
	}

	public void setBaseAmtCr(BigDecimal baseAmtCr) {
		this.baseAmtCr = baseAmtCr;
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

	public Date getFirstDueDate() {
		return firstDueDate;
	}

	public void setFirstDueDate(Date firstDueDate) {
		this.firstDueDate = firstDueDate;
	}

	public Date getNextDueDate() {
		return nextDueDate;
	}

	public void setNextDueDate(Date nextDueDate) {
		this.nextDueDate = nextDueDate;
	}

	public Date getExpiryDt() {
		return expiryDt;
	}

	public void setExpiryDt(Date expiryDt) {
		this.expiryDt = expiryDt;
	}

	public Date getLastExDt() {
		return lastExDt;
	}

	public void setLastExDt(Date lastExDt) {
		this.lastExDt = lastExDt;
	}

	public Date getEnteredDt() {
		return enteredDt;
	}

	public void setEnteredDt(Date enteredDt) {
		this.enteredDt = enteredDt;
	}

	public String getSiType() {
		return siType;
	}

	public void setSiType(String string) {
		this.siType = string;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String string) {
		this.status = string;
	}

	public String getAutoPass() {
		return autoPass;
	}

	public void setAutoPass(String string) {
		this.autoPass = string;
	}

	public String getBalFreeze() {
		return balFreeze;
	}

	public void setBalFreeze(String string) {
		this.balFreeze = string;
	}

	public String getSiFrequency() {
		return siFrequency;
	}

	public void setSiFrequency(String siFrequency) {
		this.siFrequency = siFrequency;
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

	public BigInteger getFromAccId() {
		return fromAccId;
	}

	public void setFromAccId(BigInteger fromAccId) {
		this.fromAccId = fromAccId;
	}

	public BigInteger getToAccId() {
		return toAccId;
	}

	public void setToAccId(BigInteger toAccId) {
		this.toAccId = toAccId;
	}

	public String getFromNaration() {
		return fromNaration;
	}

	public void setFromNaration(String fromNaration) {
		this.fromNaration = fromNaration;
	}

	public String getToNaration() {
		return toNaration;
	}

	public void setToNaration(String toNaration) {
		this.toNaration = toNaration;
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

	public String getCancelledBy() {
		return cancelledBy;
	}

	public void setCancelledBy(String cancelledBy) {
		this.cancelledBy = cancelledBy;
	}

	public String getBeneficiaryAccType() {
		return beneficiaryAccType;
	}

	public void setBeneficiaryAccType(String beneficiaryAccType) {
		this.beneficiaryAccType = beneficiaryAccType;
	}

	@Override
	public String toString() {
		return "StandingInstructionEntity [siNumber=" + siNumber + ", transAmt=" + transAmt + ", baseAmtDr=" + baseAmtDr
				+ ", baseAmtCr=" + baseAmtCr + ", minAmt=" + minAmt + ", maxAmt=" + maxAmt + ", firstDueDate="
				+ firstDueDate + ", nextDueDate=" + nextDueDate + ", expiryDt=" + expiryDt + ", lastExDt=" + lastExDt
				+ ", enteredDt=" + enteredDt + ", siCancelledDate=" + siCancelledDate + ", siType=" + siType
				+ ", status=" + status + ", autoPass=" + autoPass + ", balFreeze=" + balFreeze + ", siFrequency="
				+ siFrequency + ", bankCode=" + bankCode + ", branchCode=" + branchCode + ", fromAccId=" + fromAccId
				+ ", toAccId=" + toAccId + ", graceDays=" + graceDays + ", fromNaration=" + fromNaration
				+ ", toNaration=" + toNaration + ", enteredBy=" + enteredBy + ", authBy=" + authBy + ", cancelledBy="
				+ cancelledBy + ", reasonCode=" + reasonCode + ", fdSiType=" + fdSiType + ", beneficiaryAccNo="
				+ beneficiaryAccNo + ", beneficiaryIfsc=" + beneficiaryIfsc + ", beneficiaryBank=" + beneficiaryBank
				+ ", beneficiaryBranch=" + beneficiaryBranch + ", beneficiaryName=" + beneficiaryName
				+ ", beneficiaryAccType=" + beneficiaryAccType + "]";
	}
}
