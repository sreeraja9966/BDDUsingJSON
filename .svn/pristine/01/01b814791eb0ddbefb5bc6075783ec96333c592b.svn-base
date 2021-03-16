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
@Table(name = "AUTH_TEMP")
public class AuthTempEntity implements Serializable {
    
    /**
     * 
     */
    private static final long serialVersionUID = -4458131296858472557L;
    
    public AuthTempEntity() {
        super();
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "acc_temp_gen")
    @SequenceGenerator(name = "acc_temp_gen", sequenceName = "auth_temp_seq", allocationSize = 1)
    @Column(name = "ID", nullable = false, length = 10)
    private int id;
    
    @Column(name = "BANK_CODE", nullable = false, length = 20)
    
    private String bankCode;
    
    @Column(name = "MODIFIED_BRANCH", nullable = true, length = 20)
    
    private String modifiedBranch;
    
    @Column(name = "USER_ID", nullable = false, length = 20)
    
    private String userID;
    
    @Column(name = "EFFECTIVE_DATE", nullable = true)
    @Temporal(value = TemporalType.DATE)
    private Date effectiveDate;
    
    @Column(name = "TRANS_CODE", nullable = false, length = 12)
    
    private String transCode;
    
    @Column(name = "ACC_ID", nullable = false)
    private BigInteger accId;
    
    @Column(name = "AUTH_DETAILS_OLD", nullable = false, length = 5000)
    
    private String authDetailsOld;
    
    @Column(name = "AUTH_DETAILS_NEW", nullable = false, length = 5000)
    
    private String authDetailsNew;
    
    public String getModifiedBranch() {
        return modifiedBranch;
    }
    
    public void setModifiedBranch(String modifiedBranch) {
        this.modifiedBranch = modifiedBranch;
    }
    
    public int getId() {
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
    
    public String getUserID() {
        return userID;
    }
    
    public void setUserID(String userID) {
        this.userID = userID;
    }
    
    public Date getEffectiveDate() {
        return effectiveDate;
    }
    
    public void setEffectiveDate(Date effectiveDate) {
        this.effectiveDate = effectiveDate;
    }
    
    public String getTransCode() {
        return transCode;
    }
    
    public void setTransCode(String transCode) {
        this.transCode = transCode;
    }
    
    public BigInteger getAccId() {
        return accId;
    }
    
    public void setAccId(BigInteger accId) {
        this.accId = accId;
    }
    
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
    public String getAuthDetailsOld() {
        return authDetailsOld;
    }
    
    public void setAuthDetailsOld(String authDetailsOld) {
        this.authDetailsOld = authDetailsOld;
    }
    
    public String getAuthDetailsNew() {
        return authDetailsNew;
    }
    
    public void setAuthDetailsNew(String authDetailsNew) {
        this.authDetailsNew = authDetailsNew;
    }
    
    @Override
    public String toString() {
        return "AuthTempEntity [id=" + id + ", bankCode=" + bankCode + ", userID=" + userID + ", effectiveDate="
                + effectiveDate + ", transCode=" + transCode + ", accId=" + accId + ", authDetailsOld=" + authDetailsOld
                + ", authDetailsNew=" + authDetailsNew + "]";
    }
    
}