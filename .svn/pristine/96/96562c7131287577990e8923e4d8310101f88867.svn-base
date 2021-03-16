package com.sysnik.selenium.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@Entity
@Table(name = "INSTRUMENT_TYPES")
@Scope(value = "prototype")
@EntityListeners(AuditingEntityListener.class)
@EnableJpaAuditing
public class InstrumentTypesEntity implements Serializable {
   
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "instrument_types_seq_gen")
    @SequenceGenerator(name = "instrument_types_seq_gen", sequenceName = "instrument_types_seq", allocationSize = 1)
    @Column(name = "ID", nullable = false)
    private long id;
    
    @Column(name = "BANK_CODE", nullable = false)
    private String bankCode;
    
    @Column(name = "INST_TYPE", nullable = false)
    private String instType;
    
    @Column(name = "DESCRIPTION", nullable = false, length = 10)
    private String description;
    
    @Column(name = "PROD_TYPE", nullable = false, length = 10)
    private String prodType;
    
    
    @Column(name = "SERIES_REQUIRED", length = 1)
    private String seriesRequired;
    
    @Column(name = "SUFFIX_REQUIRED", length = 1)
    private String suffixRequired;
    
    @Column(name = "INVENTORY_REQUIRED", length = 1)
    private String inventoryRequired;
    
    @Column(name = "BRANCH_WISE", length = 1, nullable = false)
    private String branchWise;

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

    public String getInstType() {
        return instType;
    }

    public void setInstType(String instType) {
        this.instType = instType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProdType() {
        return prodType;
    }

    public void setProdType(String prodType) {
        this.prodType = prodType;
    }

    public String getSeriesRequired() {
        return seriesRequired;
    }

    public void setSeriesRequired(String seriesRequired) {
        this.seriesRequired = seriesRequired;
    }

    public String getSuffixRequired() {
        return suffixRequired;
    }

    public void setSuffixRequired(String suffixRequired) {
        this.suffixRequired = suffixRequired;
    }

    public String getInventoryRequired() {
        return inventoryRequired;
    }

    public void setInventoryRequired(String inventoryRequired) {
        this.inventoryRequired = inventoryRequired;
    }

    public String getBranchWise() {
        return branchWise;
    }

    public void setBranchWise(String branchWise) {
        this.branchWise = branchWise;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    @Override
    public String toString() {
        return "InstrumentTypesEntity [id=" + id + ", bankCode=" + bankCode + ", instType=" + instType
                + ", description=" + description + ", prodType=" + prodType + ", seriesRequired=" + seriesRequired
                + ", suffixRequired=" + suffixRequired + ", inventoryRequired=" + inventoryRequired + ", branchWise="
                + branchWise + "]";
    }
    
    
    
    
  
}