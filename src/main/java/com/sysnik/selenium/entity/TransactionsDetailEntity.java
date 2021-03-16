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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "TRANSACTION_DETAILS")
public class TransactionsDetailEntity {
	
	@Column(name = "TRANS_NO")
	private long transactionNumber;

	@Id
	@Column(name = "SEQ_GEN", nullable = false, length = 10)
	private long sequenceGenerator;
	
	@Column(name = "ID", insertable = false, updatable = false)
	private BigInteger id;

	@Column(name = "PROD_ID")
	private int productId;

	@Column(name = "ACC_NO")
	private String accountNumber;

	@Column(name = "TRANS_AMT")
	private BigDecimal transactionAmount;

	@Column(name = "CURRENCY")
	private String currency;

	@Column(name = "INSTR_TYPE")
	private String instrumentType;

	@Column(name = "INSTR_NO")
	private long instrumentNumber;

	@Column(name = "INSTR_DT")
	
	private Date instrumentDate;

	@Column(name = "REMARK")
	private String remark;

	@Column(name = "DEPOSITOR_NAME")
	private String nameOfDepositor;

	@Column(name = "IDENTITY_DETAIL")
	private String identityDetail;

	
	@Column(name = "TRANS_MODE")
	private String transactionMode;

	@Column(name = "DR_CR")
	private String drCr;

	@Column(name = "LAST_UPDATE_COUNT", length = 20, nullable = false)
	private BigInteger lastUpdateCount;

	@Column(name = "IBT_SEQ_ID")
	private BigInteger ibtSeqId;

	@Column(name = "RECON_SEQ_ID")
	private BigInteger reconSeqId;

	public BigInteger getReconSeqId() {
		return reconSeqId;
	}

	public void setReconSeqId(BigInteger reconSeqId) {
		this.reconSeqId = reconSeqId;
	}

	public BigInteger getIbtSeqId() {
		return ibtSeqId;
	}

	public void setIbtSeqId(BigInteger ibtSeqId) {
		this.ibtSeqId = ibtSeqId;
	}

	public BigInteger getLastUpdateCount() {
		return lastUpdateCount;
	}

	public void setLastUpdateCount(BigInteger lastUpdateCount) {
		this.lastUpdateCount = lastUpdateCount;
	}

	public String getTransactionMode() {
		return transactionMode;
	}

	public void setTransactionMode(String transactionMode) {
		this.transactionMode = transactionMode;
	}

	public long getTransactionNumber() {
		return transactionNumber;
	}

	public void setTransactionNumber(long transactionNumber) {
		this.transactionNumber = transactionNumber;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public BigDecimal getTransactionAmount() {
		return transactionAmount;
	}

	public void setTransactionAmount(BigDecimal transactionAmount) {
		this.transactionAmount = transactionAmount;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getInstrumentType() {
		return instrumentType;
	}

	public void setInstrumentType(String instrumentType) {
		this.instrumentType = instrumentType;
	}

	public long getInstrumentNumber() {
		return instrumentNumber;
	}

	public void setInstrumentNumber(long instrumentNumber) {
		this.instrumentNumber = instrumentNumber;
	}

	public Date getInstrumentDate() {
		return instrumentDate;
	}

	public void setInstrumentDate(Date instrumentDate) {
		this.instrumentDate = instrumentDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getNameOfDepositor() {
		return nameOfDepositor;
	}

	public void setNameOfDepositor(String nameOfDepositor) {
		this.nameOfDepositor = nameOfDepositor;
	}

	public String getIdentityDetail() {
		return identityDetail;
	}

	public void setIdentityDetail(String identityDetail) {
		this.identityDetail = identityDetail;
	}

	public long getSequenceGenerator() {
		return sequenceGenerator;
	}

	public void setSequenceGenerator(long sequenceGenerator) {
		this.sequenceGenerator = sequenceGenerator;
	}

	public BigInteger getId() {
		return id;
	}

	public void setId(BigInteger id) {
		this.id = id;
	}

	public String getDrCr() {
		return drCr;
	}

	public void setDrCr(String drCr) {
		this.drCr = drCr;
	}

	@Override
	public String toString() {
		return "TransactionsDetailEntity [transactionNumber=" + transactionNumber + ", sequenceGenerator="
				+ sequenceGenerator + ", id=" + id + ", productId=" + productId + ", accountNumber=" + accountNumber
				+ ", transactionAmount=" + transactionAmount + ", currency=" + currency + ", instrumentType="
				+ instrumentType + ", instrumentNumber=" + instrumentNumber + ", instrumentDate=" + instrumentDate
				+ ", remark=" + remark + ", nameOfDepositor=" + nameOfDepositor + ", identityDetail=" + identityDetail
				+ ", transactionMode=" + transactionMode + ", drCr=" + drCr + ", lastUpdateCount=" + lastUpdateCount
				+ ", ibtSeqId=" + ibtSeqId + "]";
	}

}
