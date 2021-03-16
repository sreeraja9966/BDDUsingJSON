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
@Table(name = "INVENTORY_BOOKWISE")
public class InventoryBookwiseEntity implements Serializable {
    
    private static final long serialVersionUID = 3051877110944747220L;
    
    @Id
   
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "INVENTORY_BOOKWISE_SEQ_GEN")
    @SequenceGenerator(name = "INVENTORY_BOOKWISE_SEQ_GEN", sequenceName = "INVENTORY_BOOKWISE_SEQ", allocationSize = 1)
    private BigInteger id;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "ENTERED_BRANCH", length = 20, nullable = false)
    private String enteredBranch;
    
    @Column(name = "INSTRUMENT_TYPE", length = 5, nullable = false)
    private String instrumentType;
    
    @Column(name = "LOT_DATE", nullable = false)
    
   
    private Date lotDate;
    
    @Column(name = "SERIES", length = 20, nullable = true)
    private String series;
    
    @Column(name = "BATCHNO", length = 20, nullable = false)
    private BigInteger batchNo;
    
    @Column(name = "OWNER_BRANCH", length = 20, nullable = false)
    private String ownerBranch;
    
    @Column(name = "NOOFLEAVES", length = 5, nullable = false)
    private Integer noOfLeaves;
    
    @Column(name = "STARTNO", length = 5, nullable = false)
    private Integer startNo;
    
    @Column(name = "ENDNO", length = 5, nullable = false)
    private Integer endNo;
    
    @Column(name = "SUFFIX", length = 20, nullable = true)
    private String suffix;
    
    @Column(name = "REMARK", length = 100, nullable = false)
    private String remark;
    
    @Column(name = "BOOKSTATUS", length = 1, nullable = false)
    private String bookStatus;
    
    @Column(name = "ENTERED_BY", length = 20, nullable = false)
    private String enteredBy;
    
    @Column(name = "AUTH_BY", length = 20, nullable = true)
    private String authBy;
    
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
    
    public String getEnteredBranch() {
        return enteredBranch;
    }
    
    public void setEnteredBranch(String enteredBranch) {
        this.enteredBranch = enteredBranch;
    }
    
    public String getInstrumentType() {
        return instrumentType;
    }
    
    public void setInstrumentType(String instrumentType) {
        this.instrumentType = instrumentType;
    }
    
    public Date getLotDate() {
        return lotDate;
    }
    
    public void setLotDate(Date lotDate) {
        this.lotDate = lotDate;
    }
    
    public String getSeries() {
        return series;
    }
    
    public void setSeries(String series) {
        this.series = series;
    }
    
    public BigInteger getBatchNo() {
        return batchNo;
    }
    
    public void setBatchNo(BigInteger batchNo) {
        this.batchNo = batchNo;
    }
    
    public String getOwnerBranch() {
        return ownerBranch;
    }
    
    public void setOwnerBranch(String ownerBranch) {
        this.ownerBranch = ownerBranch;
    }
    
    public Integer getNoOfLeaves() {
        return noOfLeaves;
    }
    
    public void setNoOfLeaves(Integer noOfLeaves) {
        this.noOfLeaves = noOfLeaves;
    }
    
    public Integer getStartNo() {
        return startNo;
    }
    
    public void setStartNo(Integer startNo) {
        this.startNo = startNo;
    }
    
    public Integer getEndNo() {
        return endNo;
    }
    
    public void setEndNo(Integer endNo) {
        this.endNo = endNo;
    }
    
    public String getSuffix() {
        return suffix;
    }
    
    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }
    
    public String getRemark() {
        return remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
    
    public String getBookStatus() {
        return bookStatus;
    }
    
    public void setBookStatus(String bookStatus) {
        this.bookStatus = bookStatus;
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
    
}
