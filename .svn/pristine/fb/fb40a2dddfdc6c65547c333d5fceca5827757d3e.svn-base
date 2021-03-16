package com.sysnik.selenium.entity;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "DEATH_CLAIM_DETAILS")
public class DeathClaimDetailsEntity implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    public DeathClaimDetailsEntity() {
        
    }
    
    @Id
    @Column(name = "ID", length = 10)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "death_Claim_seq")
    @SequenceGenerator(name = "death_Claim_seq", sequenceName = "death_Claim_seq", allocationSize = 1)
    
    private BigInteger id;
    
    @Column(name = "DEATH_MARK_ID", length = 10)
    private BigInteger dathMarkId;
    
    @Column(name = "BANK_CODE", length = 20)
    private String bankCode;
    
    @Column(name = "CUST_ID", length = 20)
    private BigInteger custId;
    
    @Column(name = "ACC_ID", length = 20)
    private BigInteger accId;
    
    @Column(name = "NOMINEE_REGIST_NO", length = 20)
    private BigInteger nomineeRegistNo;
    
    @Column(name = "CLAIM_STATUS", length = 1)
    private String claimStatus;
    
    @Column(name = "CLAIM_AMT", precision = 18, scale = 2)
    private BigDecimal claimAmt;
    
    @Column(name = "CLAIM_APPROVED_BY", length = 5)
    private String claimApprovedBy;
    
    @Column(name = "CLAIM_BENIFICIARY", length = 30)
    private String claimbenificiary;
    
    @Column(name = "CLAIM_SETTLED_DATE")
    @Temporal(TemporalType.TIMESTAMP)
   // @JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Kolkata", locale = "en-IN")
    private Date claimSettledDate;
    
    @Column(name = "CLAIM_SETTLED_USER", length = 20)
    private String claimSettledUser;
    
    @Column(name = "CLAIM_SETTLED_OFFICER", length = 20)
    private String claimSettledOfficer;
    
    public BigInteger getId() {
        return id;
    }
    
    public void setId(BigInteger id) {
        this.id = id;
    }
    
    public BigInteger getDathMarkId() {
        return dathMarkId;
    }
    
    public void setDathMarkId(BigInteger dathMarkId) {
        this.dathMarkId = dathMarkId;
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
    
    public BigInteger getNomineeRegistNo() {
        return nomineeRegistNo;
    }
    
    public void setNomineeRegistNo(BigInteger nomineeRegistNo) {
        this.nomineeRegistNo = nomineeRegistNo;
    }
    
    public String getClaimStatus() {
        return claimStatus;
    }
    
    public void setClaimStatus(String claimStatus) {
        this.claimStatus = claimStatus;
    }
    
    public BigDecimal getClaimAmt() {
        return claimAmt;
    }
    
    public void setClaimAmt(BigDecimal claimAmt) {
        this.claimAmt = claimAmt;
    }
    
    public String getClaimApprovedBy() {
        return claimApprovedBy;
    }
    
    public void setClaimApprovedBy(String claimApprovedBy) {
        this.claimApprovedBy = claimApprovedBy;
    }
    
    public String getClaimbenificiary() {
        return claimbenificiary;
    }
    
    public void setClaimbenificiary(String claimbenificiary) {
        this.claimbenificiary = claimbenificiary;
    }
    
    public Date getClaimSettledDate() {
        return claimSettledDate;
    }
    
    public void setClaimSettledDate(Date claimSettledDate) {
        this.claimSettledDate = claimSettledDate;
    }
    
    public String getClaimSettledUser() {
        return claimSettledUser;
    }
    
    public void setClaimSettledUser(String claimSettledUser) {
        this.claimSettledUser = claimSettledUser;
    }
    
    public String getClaimSettledOfficer() {
        return claimSettledOfficer;
    }
    
    public void setClaimSettledOfficer(String claimSettledOfficer) {
        this.claimSettledOfficer = claimSettledOfficer;
    }
    
}
