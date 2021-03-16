package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity

@Table(name = "CLOSED_ACCOUNTS")
public class ClosedAccountsEntity {
    
    /**
     * 
     */
    private static final long serialVersionUID = 8177096731420768947L;
    
    public ClosedAccountsEntity() {
        
    }
    
    @Id
    @Column(name = "ACC_ID", nullable = false, length = 20)
    BigInteger accId;
    
    @Column(name = "CLOSE_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date closeDt;
    
    /*
     * @Column(name = "CLOSE_BY", length = 10) private String closeBy;
     */
    
    @Column(name = "AUTH_BY", length = 10)
    private String authBy;
    
    @Column(name = "REASON", length = 10)
    private String reason;
    
    @Column(name = "CLOSER_AMT", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal closerAmount;
    
    public BigInteger getAccId() {
        return accId;
    }
    
    public void setAccId(BigInteger accId) {
        this.accId = accId;
    }
    
    public Date getCloseDt() {
        return closeDt;
    }
    
    public void setCloseDt(Date closeDt) {
        this.closeDt = closeDt;
    }
    
    /*
     * public String getCloseBy() { return closeBy; }
     * 
     * public void setCloseBy(String closeBy) { this.closeBy = closeBy; }
     */
    
    public String getAuthBy() {
        return authBy;
    }
    
    public void setAuthBy(String authBy) {
        this.authBy = authBy;
    }
    
    public String getReason() {
        return reason;
    }
    
    public void setReason(String reason) {
        this.reason = reason;
    }
    
    public BigDecimal getCloserAmount() {
        return closerAmount;
    }
    
    public void setCloserAmount(BigDecimal closerAmount) {
        this.closerAmount = closerAmount;
    }
    
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
    @Override
    public String toString() {
        return "ClosedAccountsEntity [accId=" + accId + ", closeDt=" + closeDt + ", authBy=" + authBy + ", reason="
                + reason + ", closerAmount=" + closerAmount + "]";
    }
    
}
