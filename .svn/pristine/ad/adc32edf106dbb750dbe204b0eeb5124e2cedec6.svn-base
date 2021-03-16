
package com.sysnik.selenium.entity;

import java.io.Serializable;
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

@Table(name = "SP_INSTRUCTION_DETAILS")

public class SpInstructionDetailsEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	public SpInstructionDetailsEntity() {

	}

	@Id

	@Column(name = "ID", length = 10)

	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sp_instruction_seq")

	@SequenceGenerator(name = "sp_instruction_seq", sequenceName = "sp_instruction_seq", allocationSize = 1)
	private BigInteger id;

	@Column(name = "BANK_CODE", length = 20)
	private String bankCode;

	@Column(name = "CUST_ID", length = 20)
	private BigInteger custId;

	@Column(name = "ACC_ID", length = 20)
	private BigInteger accId;

	@Column(name = "APPLICABLE_FOR", length = 1)
	private String applicableFor;

	@Column(name = "INSTRUCTION_DETAILS", length = 500)
	private String instructionDetails;

	@Column(name = "ENTERED_BY", length = 20)
	private String enteredBy;

	@Column(name = "EXPIRY_DATE")

	@Temporal(TemporalType.TIMESTAMP)

	private Date expiryDate;

	@Column(name = "AUTH_BY", length = 20)
	private String authgBy;

	@Column(name = "ENTERED_DATE")
  
  @Temporal(TemporalType.DATE) // @JsonFormat(pattern = "yyyy-MM-dd", timezone
   private Date enteredDate;

	@Column(name = "REVOKE_BY", length = 20)
	private String revokeBy;

	@Column(name = "REVOKE_AUTH_BY", length = 20)
	private String revokeAuthBy;

	@Column(name = "REVOKE_DATE")

	@Temporal(TemporalType.TIMESTAMP)

	private Date revokeDate;

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

	public BigInteger getCustId() {
		return custId;
	}

	public void setCustId(BigInteger custId) {
		this.custId = custId;
	}

	public BigInteger getAccId() {
		return accId;
	}

	public void setAccId(BigInteger accId) {
		this.accId = accId;
	}

	public String getApplicableFor() {
		return applicableFor;
	}

	public void setApplicableFor(String applicableFor) {
		this.applicableFor = applicableFor;
	}

	public String getInstructionDetails() {
		return instructionDetails;
	}

	public void setInstructionDetails(String instructionDetails) {
		this.instructionDetails = instructionDetails;
	}

	public String getEnteredBy() {
		return enteredBy;
	}

	public void setEnteredBy(String enteredBy) {
		this.enteredBy = enteredBy;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public String getAuthgBy() {
		return authgBy;
	}

	public void setAuthgBy(String authgBy) {
		this.authgBy = authgBy;
	}

	public Date getEnteredDate() {
		return enteredDate;
	}

	public void setEnteredDate(Date enteredDate) {
		this.enteredDate = enteredDate;
	}

	public String getRevokeBy() {
		return revokeBy;
	}

	public void setRevokeBy(String revokeBy) {
		this.revokeBy = revokeBy;
	}

	public String getRevokeAuthBy() {
		return revokeAuthBy;
	}

	public void setRevokeAuthBy(String revokeAuthBy) {
		this.revokeAuthBy = revokeAuthBy;
	}

	public Date getRevokeDate() {
		return revokeDate;
	}

	public void setRevokeDate(Date revokeDate) {
		this.revokeDate = revokeDate;
	}

	@Override
	public String toString() {
		return "SpInstructionDetailsEntity [id=" + id + ", bankCode=" + bankCode + ", custId=" + custId + ", accId="
				+ accId + ", applicableFor=" + applicableFor + ", instructionDetails=" + instructionDetails
				+ ", enteredBy=" + enteredBy + ", expiryDate=" + expiryDate + ", authgBy=" + authgBy + ", enteredDate="
				+ enteredDate + ", revokeBy=" + revokeBy + ", revokeAuthBy=" + revokeAuthBy + ", revokeDate="
				+ revokeDate + "]";
	}

}
