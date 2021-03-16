package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "DEPOSIT_INTEREST_HISTORY")
public class DepositIntpaymentHistoryEntity {
    
    public DepositIntpaymentHistoryEntity() {
        super();
        
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "dep_int_history")
    @SequenceGenerator(name = "dep_int_history", sequenceName = "deposit_int_historyseq", allocationSize = 1)
    @Column(name = "ID", nullable = false)
    private BigInteger id;
    
    @Column(name = "ACC_ID", nullable = false)
    private BigInteger accId;
    
    @Column(name = "NEW_INTEREST", precision = 17, scale = 2, columnDefinition = "numeric(17,2) default '00000.00'",
            nullable = false)
    private BigDecimal interestAmount;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    @Column(name = "ENTERED_DATE", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date enteredDate;
    
    @Column(name = "ENTERED_BY", length = 20, nullable = false)
    private String enteredBy;
    
    /*
     * @Column(name = "AUTH_BY", length = 20, nullable = true) private String authBy;
     */
    @Column(name = "TRANSCODE", length = 20, nullable = false)
    private String transCode;
    
    @Column(name = "CUST_ID", length = 20, nullable = false)
    private BigInteger customerId;
    
    public BigInteger getId() {
        return id;
    }
    
    public void setId(BigInteger id) {
        this.id = id;
    }
    
    public BigInteger getAccId() {
        return accId;
    }
    
    public void setAccId(BigInteger accId) {
        this.accId = accId;
    }
    
    public BigDecimal getInterestAmount() {
        return interestAmount;
    }
    
    public void setInterestAmount(BigDecimal interestAmount) {
        this.interestAmount = interestAmount;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Date getEnteredDate() {
        return enteredDate;
    }
    
    public void setEnteredDate(Date enteredDate) {
        this.enteredDate = enteredDate;
    }
    
    public String getEnteredBy() {
        return enteredBy;
    }
    
    public void setEnteredBy(String enteredBy) {
        this.enteredBy = enteredBy;
    }
    
    /*
     * public String getAuthBy() { return authBy; }
     */
    /*
     * public void setAuthBy(String authBy) { this.authBy = authBy; }
     */
    public String getTransCode() {
        return transCode;
    }
    
    public void setTransCode(String transCode) {
        this.transCode = transCode;
    }
    
    public BigInteger getCustomerId() {
        return customerId;
    }
    
    public void setCustomerId(BigInteger customerId) {
        this.customerId = customerId;
    }
    
}
