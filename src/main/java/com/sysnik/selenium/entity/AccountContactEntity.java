package com.sysnik.selenium.entity;

import java.io.Serializable;
import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;

@Entity
@Scope(value = "prototype")
@Table(name = "AC_CONTACT")
public class AccountContactEntity implements Serializable {
    
    private static final long serialVersionUID = 8177096731420768947L;
    
    public AccountContactEntity() {
        
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "acc_con_gen")
    @SequenceGenerator(name = "acc_con_gen", sequenceName = "account_contact_seq", allocationSize = 1)
    @Column(name = "ID", nullable = false, unique = true, length = 10)
    long id;
    
    @Column(name = "ACC_ID", nullable = false, length = 20)
    BigInteger accId;
    
    @Column(name = "CONTACT_ID", nullable = false, length = 10)
    long contactId;
    
    @Column(name = "BANK_CODE", nullable = false, length = 20)
    String bankCode;
    
    @Column(name = "CONTACT_TYPE", nullable = false, length = 5)
    String contactType;
    
    public long getId() {
        return id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
    
    public BigInteger getAccId() {
        return accId;
    }
    
    public void setAccId(BigInteger accId) {
        this.accId = accId;
    }
    
    public long getContactId() {
        return contactId;
    }
    
    public void setContactId(long contactId) {
        this.contactId = contactId;
    }
    
    public String getBankCode() {
        return bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    public String getContactType() {
        return contactType;
    }
    
    public void setContactType(String contactType) {
        this.contactType = contactType;
    }
    
    @Override
    public String toString() {
        return "AccountContactEntity [id=" + id + ", accId=" + accId + ", contactId=" + contactId + ", bankCode="
                + bankCode + ", contactType=" + contactType + "]";
    }
    
}
