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

import org.springframework.context.annotation.Scope;

@Entity
@Scope(scopeName = "prototype")
@Table(name = "CHARGES_OWNER_LINK")
public class ChargesOwnerLinkEntity implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    public ChargesOwnerLinkEntity() {
        super();
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CHARGES_OWNER_LINK_gen")
    @SequenceGenerator(name = "CHARGES_OWNER_LINK_gen", sequenceName = "CHARGES_OWNER_LINK_SEQ", allocationSize = 1)
    @Column(name = "ID", nullable = false)
    private BigInteger id;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "CHARGE", length = 20, nullable = false)
    private String charge;
    
    @Column(name = "CHARGE_TYPE_ID", nullable = false)
    private BigInteger chargeTypeId;
    
    @Column(name = "CHARGE_DETAIL_ID", nullable = false)
    private BigInteger chargeDetailId;
    
    @Column(name = "OWNER_ID", length = 7, nullable = false)
    private String ownerId;
    
    @Column(name = "OWNER_DETAILS", length = 30, nullable = false)
    private String ownerDetails;
    
    @Column(name = "FREQUENCY", length = 20, nullable = false)
    private String frequency;
    
    @Column(name = "LAST_APP_DATE", nullable = true)
    private Date lastAppDate;
    
    @Column(name = "EFFECTIVE_DATE", nullable = true)
    private Date effectiveDate;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    @Column(name = "NEXT_APP_DATE", nullable = true)
    private Date nextAppDate;
    
    @Column(name = "IDEAL_DATE", nullable = true)
    private Date idealDate;
    
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
    
    public String getCharge() {
        return charge;
    }
    
    public void setCharge(String charge) {
        this.charge = charge;
    }
    
    public BigInteger getChargeTypeId() {
        return chargeTypeId;
    }
    
    public void setChargeTypeId(BigInteger chargeTypeId) {
        this.chargeTypeId = chargeTypeId;
    }
    
    public String getOwnerId() {
        return ownerId;
    }
    
    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }
    
    public String getOwnerDetails() {
        return ownerDetails;
    }
    
    public void setOwnerDetails(String ownerDetails) {
        this.ownerDetails = ownerDetails;
    }
    
    public String getFrequency() {
        return frequency;
    }
    
    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }
    
    public Date getLastAppDate() {
        return lastAppDate;
    }
    
    public void setLastAppDate(Date lastAppDate) {
        this.lastAppDate = lastAppDate;
    }
    
    public Date getEffectiveDate() {
        return effectiveDate;
    }
    
    public void setEffectiveDate(Date effectiveDate) {
        this.effectiveDate = effectiveDate;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public BigInteger getChargeDetailId() {
        return chargeDetailId;
    }
    
    public void setChargeDetailId(BigInteger chargeDetailId) {
        this.chargeDetailId = chargeDetailId;
    }
    
    public Date getNextAppDate() {
        return nextAppDate;
    }
    
    public void setNextAppDate(Date nextAppDate) {
        this.nextAppDate = nextAppDate;
    }
    
    public Date getIdealDate() {
        return idealDate;
    }
    
    public void setIdealDate(Date idealDate) {
        this.idealDate = idealDate;
    }
    
    @Override
    public String toString() {
        return "ChargesOwnerLinkEntity [id=" + id + ", bankCode=" + bankCode + ", charge=" + charge + ", chargeTypeId="
                + chargeTypeId + ", chargeDetailId=" + chargeDetailId + ", ownerId=" + ownerId + ", ownerDetails="
                + ownerDetails + ", frequency=" + frequency + ", lastAppDate=" + lastAppDate + ", effectiveDate="
                + effectiveDate + ", status=" + status + "]";
    }
}
