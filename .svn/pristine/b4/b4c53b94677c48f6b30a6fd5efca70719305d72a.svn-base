package com.sysnik.selenium.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "USERWISE_DENOM")
public class UserWiseDenomEntity {

	@Column(name = "DENOM_RATE", precision = 17, scale = 2, nullable = false)
	private BigDecimal denomRate;

	@Column(name = "DENOM_QTY", precision = 5, nullable = false)
	private int denomQty;

	@Column(name = "DENOM_VALUE", precision = 17, scale = 2, nullable = false)
	private BigDecimal denomValue;

	@Id
	@Column(name = "DENOM_CODE", length = 3, nullable = false)
	private String denomCode;

	
	@Column(name = "BANK_CODE", length = 20, nullable = false)
	private String bankCode;

	
	@Column(name = "USER_ID", length = 20, nullable = false)
	private String userId;

	public BigDecimal getDenomRate() {
		return denomRate;
	}

	public void setDenomRate(BigDecimal denomRate) {
		this.denomRate = denomRate;
	}

	public int getDenomQty() {
		return denomQty;
	}

	public void setDenomQty(int denomQty) {
		this.denomQty = denomQty;
	}

	public BigDecimal getDenomValue() {
		return denomValue;
	}

	public void setDenomValue(BigDecimal denomValue) {
		this.denomValue = denomValue;
	}

	public String getDenomCode() {
		return denomCode;
	}

	public void setDenomCode(String denomCode) {
		this.denomCode = denomCode;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "UserwiseDenominationEntity [denomRate=" + denomRate + ", denomQty=" + denomQty + ", denomValue="
				+ denomValue + ", denomCode=" + denomCode + ", bankCode=" + bankCode + ", userId=" + userId + "]";
	}

}
