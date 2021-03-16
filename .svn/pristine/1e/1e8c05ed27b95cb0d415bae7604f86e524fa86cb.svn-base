package com.sysnik.selenium.entity;

import java.io.Serializable;
import java.math.BigDecimal;
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

@Entity
@Table(name = "RTGS_NEFT_OUTWARD")
public class RtgsNeftOutwardEntity implements Serializable {
    
    private static final long serialVersionUID = 3351624276337266105L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "rn_seq")
    @SequenceGenerator(name = "rn_seq", sequenceName = "rtgs_neft_seq", allocationSize = 1)
    @Column(name = "ID", length = 10, nullable = false, unique = true)
    private Integer id;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    @Column(name = "TXN_TYPE", length = 2, nullable = false)
    private String txnType;
    
    @Column(name = "BANK", length = 3, nullable = false)
    private String bank;
    
    @Column(name = "HO_IFSC", length = 11, nullable = true)
    private String hoIfsc;
    
    @Column(name = "IFSC", length = 11, nullable = true)
    private String ifsc;
    
    @Column(name = "BRANCH", length = 4, nullable = false)
    private String branch;
    
    @Column(name = "CUSTOMER_NAME", length = 100, nullable = true)
    private String accountHolderName;
    
    @Column(name = "ACC_NUMBER", length = 35, nullable = false)
    private String accNumber;
    
    @Column(name = "TXN_AMOUNT", precision = 21, scale = 2)
    private BigDecimal txnAmount;
    
    @Column(name = "TXN_DATE", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date txnDate = new Date();
    
    @Column(name = "PROCESS_DATE", nullable = true)
    @Temporal(TemporalType.DATE)
    private Date processDate;
    
    @Column(name = "TXN_DATE_TIME", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date txnDateTime = new Date();
    
    @Column(name = "NEFT_BATCH_NO", nullable = true)
    private Integer neftBatchNo;
    
    @Column(name = "VOUCHER_NO", length = 10, nullable = true)
    private Integer voucherNo;
    
    @Column(name = "ORIG_UTR_NO", length = 28, nullable = false, unique = true)
    private String orgUtrNo;
    
    @Column(name = "ORIG_BIZ_MSG_ID", length = 35, nullable = false)
    private String orgBizMsgIdr;
    
    @Column(name = "ORIG_MSG_ID", length = 35, nullable = true)
    private String orgMsgId;
    
    @Column(name = "ORIG_TXN_ID", length = 35, nullable = false)
    private String orgTxnId;
    
    @Column(name = "RET_VOUCHER_NO", length = 35, nullable = true)
    private Integer retVoucherNo;
    
    @Column(name = "RET_UTR", length = 22, nullable = true)
    private String retUtrNo;
    
    @Column(name = "RET_BIZ_MSG_ID", length = 35, nullable = true)
    private String retBizMsgIdr;
    
    @Column(name = "RET_MSG_ID", length = 35, nullable = true)
    private String retMsgId;
    
    @Column(name = "RET_TXN_ID", length = 35, nullable = true)
    private String retTxnId;
    
    @Column(name = "OUTWARD_XML", length = 500, nullable = true)
    private String outwardMessage;
    
    @Column(name = "OUTWARD_RET_XML", length = 500, nullable = true)
    private String owRetMesssage;
    
    @Column(name = "BENEF_ID", length = 10, nullable = true)
    private Integer benefId;
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getTxnType() {
        return txnType;
    }
    
    public void setTxnType(String txnType) {
        this.txnType = txnType;
    }
    
    public String getBank() {
        return bank;
    }
    
    public void setBank(String bank) {
        this.bank = bank;
    }
    
    public String getHoIfsc() {
        return hoIfsc;
    }
    
    public void setHoIfsc(String hoIfsc) {
        this.hoIfsc = hoIfsc;
    }
    
    public String getIfsc() {
        return ifsc;
    }
    
    public void setIfsc(String ifsc) {
        this.ifsc = ifsc;
    }
    
    public String getBranch() {
        return branch;
    }
    
    public void setBranch(String branch) {
        this.branch = branch;
    }
    
    public String getAccountHolderName() {
        return accountHolderName;
    }
    
    public void setAccountHolderName(String accountHolderName) {
        this.accountHolderName = accountHolderName;
    }
    
    public String getAccNumber() {
        return accNumber;
    }
    
    public void setAccNumber(String accNumber) {
        this.accNumber = accNumber;
    }
    
    public BigDecimal getTxnAmount() {
        return txnAmount;
    }
    
    public void setTxnAmount(BigDecimal txnAmount) {
        this.txnAmount = txnAmount;
    }
    
    public Date getTxnDate() {
        return txnDate;
    }
    
    public void setTxnDate(Date txnDate) {
        this.txnDate = txnDate;
    }
    
    public Date getProcessDate() {
        return processDate;
    }
    
    public void setProcessDate(Date processDate) {
        this.processDate = processDate;
    }
    
    public Date getTxnDateTime() {
        return txnDateTime;
    }
    
    public void setTxnDateTime(Date txnDateTime) {
        this.txnDateTime = txnDateTime;
    }
    
    public Integer getNeftBatchNo() {
        return neftBatchNo;
    }
    
    public void setNeftBatchNo(Integer neftBatchNo) {
        this.neftBatchNo = neftBatchNo;
    }
    
    public Integer getVoucherNo() {
        return voucherNo;
    }
    
    public void setVoucherNo(Integer voucherNo) {
        this.voucherNo = voucherNo;
    }
    
    public String getOrgUtrNo() {
        return orgUtrNo;
    }
    
    public void setOrgUtrNo(String orgUtrNo) {
        this.orgUtrNo = orgUtrNo;
    }
    
    public String getOrgBizMsgIdr() {
        return orgBizMsgIdr;
    }
    
    public void setOrgBizMsgIdr(String orgBizMsgIdr) {
        this.orgBizMsgIdr = orgBizMsgIdr;
    }
    
    public String getOrgMsgId() {
        return orgMsgId;
    }
    
    public void setOrgMsgId(String orgMsgId) {
        this.orgMsgId = orgMsgId;
    }
    
    public String getOrgTxnId() {
        return orgTxnId;
    }
    
    public void setOrgTxnId(String orgTxnId) {
        this.orgTxnId = orgTxnId;
    }
    
    public Integer getRetVoucherNo() {
        return retVoucherNo;
    }
    
    public void setRetVoucherNo(Integer retVoucherNo) {
        this.retVoucherNo = retVoucherNo;
    }
    
    public String getRetUtrNo() {
        return retUtrNo;
    }
    
    public void setRetUtrNo(String retUtrNo) {
        this.retUtrNo = retUtrNo;
    }
    
    public String getRetBizMsgIdr() {
        return retBizMsgIdr;
    }
    
    public void setRetBizMsgIdr(String retBizMsgIdr) {
        this.retBizMsgIdr = retBizMsgIdr;
    }
    
    public String getRetMsgId() {
        return retMsgId;
    }
    
    public void setRetMsgId(String retMsgId) {
        this.retMsgId = retMsgId;
    }
    
    public String getRetTxnId() {
        return retTxnId;
    }
    
    public void setRetTxnId(String retTxnId) {
        this.retTxnId = retTxnId;
    }
    
    public String getOutwardMessage() {
        return outwardMessage;
    }
    
    public void setOutwardMessage(String outwardMessage) {
        this.outwardMessage = outwardMessage;
    }
    
    public String getOwRetMesssage() {
        return owRetMesssage;
    }
    
    public void setOwRetMesssage(String owRetMesssage) {
        this.owRetMesssage = owRetMesssage;
    }
    
    public Integer getBenefId() {
        return benefId;
    }
    
    public void setBenefId(Integer benefId) {
        this.benefId = benefId;
    }
    
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
}