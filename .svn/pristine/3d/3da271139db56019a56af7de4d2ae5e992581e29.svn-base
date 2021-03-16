package com.sysnik.selenium.entity;

import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "INVENTORY_PRODUCT_LINK")
public class InventoryProductLinkEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "INVENTORY_PRODUCT_LINK_SEQ")
    @SequenceGenerator(name = "INVENTORY_PRODUCT_LINK_SEQ", sequenceName = "INVENTORY_PRODUCT_LINK_SEQ",
            allocationSize = 1)
    @Column(name = "ID")
    private BigInteger id;
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode = "";
    @Column(name = "INSTRUMENT_TYPE", length = 5, nullable = false)
    private String instrumentType = "";
    @Column(name = "PRD_ID", nullable = false)
    private int prdId;
    @Column(name = "ISACTIVE", length = 1, nullable = false)
    private String isActive = "";
    
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
    
    public String getInstrumentType() {
        return instrumentType;
    }
    
    public void setInstrumentType(String instrumentType) {
        this.instrumentType = instrumentType;
    }
    
    public int getPrdId() {
        return prdId;
    }
    
    public void setPrdId(int prdId) {
        this.prdId = prdId;
    }
    
    public String getIsActive() {
        return isActive;
    }
    
    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }
    
}
