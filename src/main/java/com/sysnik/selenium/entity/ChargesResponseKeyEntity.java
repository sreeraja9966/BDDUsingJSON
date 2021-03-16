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
@Scope(scopeName = "prototype")
@Table(name = "CHARGES_RESPONSE_KEY")
public class ChargesResponseKeyEntity implements Serializable {
    
    public ChargesResponseKeyEntity() {
        super();
    }
    
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CHARGES_RESPONSE_KEY_gen")
    @SequenceGenerator(name = "CHARGES_RESPONSE_KEY_gen", sequenceName = "CHARGES_RESPONSE_KEY_SEQ", allocationSize = 1)
    @Column(name = "ID", nullable = false)
    private BigInteger id;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "CHARGE_TYPE_ID", length = 20, nullable = false)
    private BigInteger chargeTypeId;
    
    @Column(name = "TRANS_CODE", length = 16, nullable = true)
    private String transCode;
    
    @Column(name = "KEY_DETAILS", length = 30, nullable = false)
    private String keyDetails;
    
    @Column(name = "DISPLAY_NAME", length = 16, nullable = false)
    private String displayName;
    
    @Column(name = "POSTING_TRCODE_GL", length = 16, nullable = true)
    private String postingTrcodeGl;
    
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
    
    public BigInteger getChargeTypeId() {
        return chargeTypeId;
    }
    
    public void setChargeTypeId(BigInteger chargeTypeId) {
        this.chargeTypeId = chargeTypeId;
    }
    
    public String getTransCode() {
        return transCode;
    }
    
    public void setTransCode(String transCode) {
        this.transCode = transCode;
    }
    
    public String getKeyDetails() {
        return keyDetails;
    }
    
    public void setKeyDetails(String keyDetails) {
        this.keyDetails = keyDetails;
    }
    
    public String getDisplayName() {
        return displayName;
    }
    
    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }
    
    public String getPostingTrcodeGl() {
        return postingTrcodeGl;
    }
    
    public void setPostingTrcodeGl(String postingTrcodeGl) {
        this.postingTrcodeGl = postingTrcodeGl;
    }
    
    @Override
    public String toString() {
        return "ChargesResponseKeyEntity [id=" + id + ", bankCode=" + bankCode + ", chargeTypeId=" + chargeTypeId
                + ", transCode=" + transCode + ", keyDetails=" + keyDetails + ", displayName=" + displayName + "]";
    }
    
}
