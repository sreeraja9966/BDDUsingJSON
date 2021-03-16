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

//import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Scope(value = "prototype")
@Table(name = "DEATH_MARKING")
public class DeathMarkingEntity implements Serializable {
    
    private static final long serialVersionUID = -6101062346634356268L;
    
    public DeathMarkingEntity() {
        
    }
    
    @Id
    @Column(name = "ID", length = 10)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "death_marking_seq")
    @SequenceGenerator(name = "death_marking_seq", sequenceName = "death_marking_seq", allocationSize = 1)
    private BigInteger id;
    
    @Column(name = "BANK_CODE", length = 20)
    private String bankCode;
    
    @Column(name = "CUST_ID", length = 20)
    private BigInteger custId;
    
    @Column(name = "DEATH_DATE")
    @Temporal(TemporalType.TIMESTAMP)
  //  @JsonFormat(pattern = "yyyy/MM/dd")
    private Date deathDate;
    
    @Column(name = "CLAIM_DATE")
    @Temporal(TemporalType.TIMESTAMP)
  //  @JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Kolkata", locale = "en-IN")
    private Date claimDate;
    
    @Column(name = "CLAIMANT_NAME", length = 30)
    private String claimantName;
    
    @Column(name = "CLAIMANT_ADD", length = 50)
    private String claimantAddress;
    
    @Column(name = "CLAIMANT_CONTACT", length = 50)
    private String claimantContact;
    
    @Column(name = "CLAIMANT_CUSTID", length = 20)
    private BigInteger claimantCustId;
    
    @Column(name = "REMARK", length = 50)
    private String remark;
    
    @Column(name = "STATUS", length = 1)
    private String status;
    
    @Column(name = "ENTERED_BY", length = 20)
    private String enteredBy;
    
    @Column(name = "AUTH_BY", length = 20)
    private String authgBy;
    
    public BigInteger getId() {
        return id;
    }
    
    public void setId(BigInteger ID) {
        id = ID;
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
    
    public Date getDeathDate() {
        return deathDate;
    }
    
    public void setDeathDate(Date deathDate) {
        this.deathDate = deathDate;
    }
    
    public Date getClaimDate() {
        return claimDate;
    }
    
    public void setClaimDate(Date claimDate) {
        this.claimDate = claimDate;
    }
    
    public String getClaimantName() {
        return claimantName;
    }
    
    public void setClaimantName(String claimantName) {
        this.claimantName = claimantName;
    }
    
    public String getClaimantAddress() {
        return claimantAddress;
    }
    
    public void setClaimantAddress(String claimantAddress) {
        this.claimantAddress = claimantAddress;
    }
    
    public String getClaimantContact() {
        return claimantContact;
    }
    
    public void setClaimantContact(String claimantContact) {
        this.claimantContact = claimantContact;
    }
    
    public BigInteger getClaimantCustId() {
        return claimantCustId;
    }
    
    public void setClaimantCustId(BigInteger claimantCustId) {
        this.claimantCustId = claimantCustId;
    }
    
    public String getRemark() {
        return remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getEnteredBy() {
        return enteredBy;
    }
    
    public void setEnteredBy(String enteredBy) {
        this.enteredBy = enteredBy;
    }
    
    public String getAuthgBy() {
        return authgBy;
    }
    
    public void setAuthgBy(String authgBy) {
        this.authgBy = authgBy;
    }
    
}
