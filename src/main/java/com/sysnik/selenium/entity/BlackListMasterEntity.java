
package com.sysnik.selenium.entity;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.context.annotation.Scope;

@Entity

@Scope("prototype")

@Table(name = "BlACK_LIST_MASTER")

public class BlackListMasterEntity implements Serializable {

	private static final long serialVersionUID = 3584716262299734651L;

	public BlackListMasterEntity() {

	}

	@Id

	

	@Column(name = "ID", nullable = false)
	private BigInteger id;

	@Column(name = "BANK_CODE", nullable = false)
	private String bankCode;

	@Column(name = "DT_OF_BIRTH")

	@Temporal(TemporalType.DATE)

	
	private Date dob;

	@Column(name = "CUST_ID")
	private BigInteger customerId;

	@Column(name = "CUST_NAME")
	private String customerName;

	@Column(name = "ALIAS_NAME")
	private String aliasName;

	@Column(name = "CUST_TYPE", nullable = false)
	private String custType;

	@Column(name = "COUNTRY")
	private String country;

	@Column(name = "NATIONALITY")
	private String nationality;

	@Column(name = "REASON", nullable = false)
	private String reason;

	@Column(name = "ENTERED_BY")
	private String enteredBy;

	@Column(name = "AUTH_BY")
	private String authBy;

	@Column(name = "ENTERED_DATE")

	@Temporal(TemporalType.DATE)

	private Date enteredDate;

	@Column(name = "STATUS", nullable = false)
	private String status;

	@Column(name = "GROUP_LIST_TYPE")
	private String groupListType;

	public BigInteger getID() {
		return id;
	}

	public void setID(BigInteger ID) {
		this.id = ID;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public BigInteger getCustomerId() {
		return customerId;
	}

	public void setCustomerId(BigInteger customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getAliasName() {
		return aliasName;
	}

	public void setAliasName(String aliasName) {
		this.aliasName = aliasName;
	}

	public String getCustType() {
		return custType;
	}

	public void setCustType(String custType) {
		this.custType = custType;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
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

	public Date getEnteredDate() {
		return enteredDate;
	}

	public void setEnteredDate(Date enteredDate) {
		this.enteredDate = enteredDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getGroupListType() {
		return groupListType;
	}

	public void setGroupListType(String groupListType) {
		this.groupListType = groupListType;
	}

	@Override
	public String toString() {
		return "BlackListMasterEntity [ID=" + id + ", bankCode=" + bankCode + ", dob=" + dob + ", customerId="
				+ customerId + ", customerName=" + customerName + ", aliasName=" + aliasName + ", custType=" + custType
				+ ", country=" + country + ", nationality=" + nationality + ", reason=" + reason + ", enteredBy="
				+ enteredBy + ", authBy=" + authBy + ", enteredDate=" + enteredDate + ", status=" + status
				+ ", groupListType=" + groupListType + "]";
	}

}
