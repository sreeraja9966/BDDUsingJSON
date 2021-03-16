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
@Table(name = "ADDRESS")
public class AddressEntity implements Serializable {
    
    /**
     * 
     */
    private static final long serialVersionUID = 7667524834745723032L;
    
    public AddressEntity() {
        super();
        
    }
    
    public AddressEntity(BigInteger id, String bankCode, BigInteger custId, String type, String address1,
            String address2, String address3, String countryCode, String stateCode) {
        super();
        this.id = id;
        this.bankCode = bankCode;
        this.custId = custId;
        this.type = type;
        this.address1 = address1;
        this.address2 = address2;
        this.address3 = address3;
        this.countryCode = countryCode;
        this.stateCode = stateCode;
    }
    
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ADDRESS_SEQ_GEN")
    @SequenceGenerator(name = "ADDRESS_SEQ_GEN", sequenceName = "ADDRESS_SEQ", allocationSize = 1)
    private BigInteger id;
    
    @Column(name = "BANK_CODE", length = 20)
    private String bankCode;
    
    @Column(name = "CUST_ID", length = 5)
    private BigInteger custId;
    
    @Column(name = "TYPE", length = 5)
    private String type;
    
    @Column(name = "ADDRESS1", length = 50)
    private String address1;
    
    @Column(name = "ADDRESS2", length = 50)
    private String address2;
    
    @Column(name = "ADDRESS3", length = 50)
    private String address3;
    
    @Column(name = "COUNTRY_CODE", length = 5)
    private String countryCode;
    
    @Column(name = "STATE_CODE", length = 5)
    private String stateCode;
    
    @Column(name = "CITY_VILLAGE", length = 6)
    private String cityVillage;
    
    @Column(name = "POSTAL_CODE", length = 10)
    private String postalCode;
    
    public String getCityVillage() {
        return cityVillage;
    }
    
    public void setCityVillage(String cityVillage) {
        this.cityVillage = cityVillage;
    }
    
    public String getPostalCode() {
        return postalCode;
    }
    
    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }
    
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
    
    public BigInteger getCustId() {
        return custId;
    }
    
    public void setCustId(BigInteger custId) {
        this.custId = custId;
    }
    
    public String getType() {
        return type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    
    public String getAddress1() {
        return address1;
    }
    
    public void setAddress1(String address1) {
        this.address1 = address1;
    }
    
    public String getAddress2() {
        return address2;
    }
    
    public void setAddress2(String address2) {
        this.address2 = address2;
    }
    
    public String getAddress3() {
        return address3;
    }
    
    public void setAddress3(String address3) {
        this.address3 = address3;
    }
    
    public String getCountryCode() {
        return countryCode;
    }
    
    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }
    
    public String getStateCode() {
        return stateCode;
    }
    
    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }
    
}
