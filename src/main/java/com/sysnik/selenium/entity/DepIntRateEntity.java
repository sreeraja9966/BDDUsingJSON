package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity

@Table(name = "DEP_INT_RATES")
public class DepIntRateEntity {
	@Id

	@Column(name = "ID", nullable = false, unique = true)
	private Integer id;

	@Column(name = "BANK_CODE", nullable = false)
	private String bankCode;

	@Column(name = "EFF_DATE", nullable = false)
	private Date effDate;

	@Column(name = "PRODUCT_CODE", nullable = false)
	private int productCode;

	@Column(name = "FROM_AMT", nullable = false)
	private BigDecimal fromAmt;

	@Column(name = "TO_AMT", nullable = false)
	private BigDecimal toAmt;

	@Column(name = "INT_RATE", nullable = false)
	private BigDecimal intRate;

	@Column(name = "FROM_DAYS")
	private int fromDays;

	@Column(name = "TO_DAYS")
	private int toDays;

	@Column(name = "FROM_MONTH")
	private int fromMonth;

	@Column(name = "TO_MONTH")
	private int toMonth;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public Date getEffDate() {
		return effDate;
	}

	public void setEffDate(Date effDate) {
		this.effDate = effDate;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public BigDecimal getFromAmt() {
		return fromAmt;
	}

	public void setFromAmt(BigDecimal fromAmt) {
		this.fromAmt = fromAmt;
	}

	public BigDecimal getToAmt() {
		return toAmt;
	}

	public void setToAmt(BigDecimal toAmt) {
		this.toAmt = toAmt;
	}

	public BigDecimal getIntRate() {
		return intRate;
	}

	public void setIntRate(BigDecimal intRate) {
		this.intRate = intRate;
	}

	public int getFromDays() {
		return fromDays;
	}

	public void setFromDays(int fromDays) {
		this.fromDays = fromDays;
	}

	public int getToDays() {
		return toDays;
	}

	public void setToDays(int toDays) {
		this.toDays = toDays;
	}

	public int getFromMonth() {
		return fromMonth;
	}

	public void setFromMonth(int fromMonth) {
		this.fromMonth = fromMonth;
	}

	public int getToMonth() {
		return toMonth;
	}

	public void setToMonth(int toMonth) {
		this.toMonth = toMonth;
	}

}
