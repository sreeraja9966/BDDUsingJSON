package com.sysnik.selenium.entity;

import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name = "customer_account")
public class CustomerAccountEntity {
	@Id

	@Column(name = "ID")
	private Integer id;

	@Column(name = "BANK_CODE")
	private String bankCode;

	@Column(name = "BRANCH_CODE")
	private String branchCode;

	@Column(name = "PRD_ID")
	private Integer prodID;

	@Column(name = "ACC_ID")
	private BigInteger accId;

	@Column(name = "ACC_NO")
	private String accNo;
	
	@Column(name = "USER_ACC_NO")
	private String userAccNo;

	@Column(name = "CUST_ID")
	private BigInteger custId;

	@Column(name = "OPERATOR")
	private String operator;

	@Column(name = "BENEFICARY")
	private String beneficary;

	@Column(name = "PART_OFF")
	private String partOff;

	@Column(name = "AUTH_SIG")
	private String authSig;

	public Integer getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Integer getProdID() {
		return prodID;
	}

	public void setProdID(int prodID) {
		this.prodID = prodID;
	}

	public BigInteger getAccId() {
		return accId;
	}

	public void setAccId(BigInteger accId) {
		this.accId = accId;
	}

	public BigInteger getCustId() {
		return custId;
	}

	public void setCustId(BigInteger custId) {
		this.custId = custId;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}
	public String getUserAccNo() {
		return userAccNo;
	}

	public void setUserAccNo(String accNo) {
		this.userAccNo = userAccNo;
	}
	public String getBeneficary() {
		return beneficary;
	}

	public void setBeneficary(String beneficary) {
		this.beneficary = beneficary;
	}

	public String getPartOff() {
		return partOff;
	}

	public void setPartOff(String partOff) {
		this.partOff = partOff;
	}

	public String getAuthSig() {
		return authSig;
	}

	public void setAuthSig(String authSig) {
		this.authSig = authSig;
	}

	@Override
	public String toString() {
		return "CustomerAccountEntity [id=" + id + ", bankCode=" + bankCode + ", branchCode=" + branchCode + ", prodID="
				+ prodID + ", accId=" + accId + ", custId=" + custId + ", operator=" + operator + ", beneficary="
				+ beneficary + ", partOff=" + partOff + ", authSig=" + authSig + "]";
	}
}
