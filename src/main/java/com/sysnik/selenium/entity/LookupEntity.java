package com.sysnik.selenium.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="lookup")
public class LookupEntity {
	@Id
  
    @Column(name = "ID", length = 10, nullable = false)
    private int id;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
   
    private String bankCode;
    
    @Column(name = "TYPE", length = 20, nullable = false)
   
    private String type;
    
    @Column(name = "SRL", length = 3, nullable = false)
   
    private String srl;
    
    @Column(name = "CODE", length = 20, nullable = false)
   
    private String code;
    
    @Column(name = "DESCRIPTION", length = 50, nullable = false)
   
    private String description;
    
    @Column(name = "REFERENCE", length = 3, nullable = true)
    private int reference;
    
    @Column(name = "ORDER_BY", length = 3, nullable = true)
    private int orderBy;
    
    @Column(name = "ALIAS", length = 20, nullable = true)
    private String alias;
    
    @Column(name = "LANGUAGE", length = 10, nullable = false)
    private String language;
    
    public String getType() {
        return type;
    }
    
    public void setType(String type) {
        this.type = type;
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
    
    public String getSrl() {
        return srl;
    }
    
    public void setSrl(String srl) {
        this.srl = srl;
    }
    
    public String getCode() {
        return code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public int getReference() {
        return reference;
    }
    
    public void setReference(int reference) {
        this.reference = reference;
    }
    
    public int getOrderBy() {
        return orderBy;
    }
    
    public void setOrderBy(int orderBy) {
        this.orderBy = orderBy;
    }
    
    public String getAlias() {
        return alias;
    }
    
    public void setAlias(String alias) {
        this.alias = alias;
    }
    
    public String getLanguage() {
        return language;
    }
    
    public void setLanguage(String language) {
        this.language = language;
    }
    
    @Override
    public String toString() {
        return "LookUpEntity [id=" + id + ", bankCode=" + bankCode + ", type=" + type + ", srl=" + srl + ", code="
                + code + ", description=" + description + ", reference=" + reference + ", orderBy=" + orderBy
                + ", alias=" + alias + ", language=" + language + "]";
    }
}
