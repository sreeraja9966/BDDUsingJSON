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
@Table(name = "INVENTORY_LEAVES")
public class InventoryLeavesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "INVENTORY_LEAVES_SEQ")
    @SequenceGenerator(name = "INVENTORY_LEAVES_SEQ", sequenceName = "INVENTORY_LEAVES_SEQ", allocationSize = 1)
    @Column(name = "ID")
    private BigInteger id;
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    @Column(name = "INSTRUMENT_TYPE", length = 5, nullable = false)
    private String instrumentType;
    @Column(name = "NOOFLEAVES", nullable = false)
    private int noOfLeaves;
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
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
    public int getNoOfLeaves() {
        return noOfLeaves;
    }
    public void setNoOfLeaves(int noOfLeaves) {
        this.noOfLeaves = noOfLeaves;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    
   
}
