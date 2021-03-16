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
@Table(name = "CUST_CONTACT")
public class CustomerContactEntity implements Serializable {
    
    /**
     * 
     */
    private static final long serialVersionUID = 6049321921871993428L;
    
    public CustomerContactEntity() {
        
    }
    
    @Id
    @Column(name = "ID", length = 10)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cust_contact_gen")
    @SequenceGenerator(name = "cust_contact_gen", sequenceName = "cust_contact_seq", allocationSize = 1)
    long id;
    
    @Column(name = "BANK_CODE", nullable = false, length = 20)
    String bankCode;
    
    @Column(name = "CUST_ID", nullable = false, length = 20)
    BigInteger custId;
    
    @Column(name = "CONTACT_TYPE", nullable = false, length = 5)
    String contactType;
    
    @Column(name = "CONTACT_ID", nullable = false, length = 3)
    int contactId;
    
    @Column(name = "VALUE", nullable = false, length = 50)
    String value;
    
    public long getId() {
        return id;
    }
    
    public void setId(long id) {
        this.id = id;
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
    
    public String getContactType() {
        return contactType;
    }
    
    public void setContactType(String contactType) {
        this.contactType = contactType;
    }
    
    public int getContactId() {
        return contactId;
    }
    
    public void setContactId(int contactId) {
        this.contactId = contactId;
    }
    
    public String getValue() {
        return value;
    }
    
    public void setValue(String value) {
        this.value = value;
    }
    
}
