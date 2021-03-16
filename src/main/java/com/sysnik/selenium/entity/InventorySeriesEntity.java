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
@Table(name = "INVENTORY_SERIES")
public class InventorySeriesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "INVENTORY_SERIES_SEQ")
    @SequenceGenerator(name = "INVENTORY_SERIES_SEQ", sequenceName = "INVENTORY_SERIES_SEQ", allocationSize = 1)
    @Column(name = "ID")
    private BigInteger id;
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    @Column(name = "INSTRUMENT_TYPE", length = 5, nullable = false)
    private String instrumentType;
    @Column(name = "SERIES", length = 20, nullable = false)
    private String series;
    @Column(name = "DESCRIPTION", length = 50, nullable = true)
    private String description;
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
    
    public String getSeries() {
        return series;
    }
    
    public void setSeries(String series) {
        this.series = series;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
}
