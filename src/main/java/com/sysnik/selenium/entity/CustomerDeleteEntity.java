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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.context.annotation.Scope;

@Entity
@Scope(value = "prototype")
@Table(name = "CUSTOMER_DELETE")
public class CustomerDeleteEntity implements Serializable {
    
    private static final long serialVersionUID = -6101062346634356268L;
    
    public CustomerDeleteEntity() {
        
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cust_delete_gen")
    @SequenceGenerator(name = "cust_delete_gen", sequenceName = "customer_delete_seq", allocationSize = 1)
    @Column(name = "ID", nullable = false, length = 10)
    private int id;
    
    @Column(name = "CUST_ID")
    private BigInteger custId;
    
    @Column(name = "STATUS")
    private String status;
    
    @Column(name = "DATE_OF_DELETE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateOfDelete;
    
    @Column(name = "ENTERED_BY")
    private String enteredBy;
    
    @Column(name = "AUTHORIZE_BY")
    private String authorizeBy;
    
    @Column(name = "PREVIOUS_STAT")
    private String previousStat;
    
    @Column(name = "REASON_FOR_DELETE")
    private String reasonForDelete;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public BigInteger getCustId() {
        return custId;
    }
    
    public void setCustId(BigInteger custId) {
        this.custId = custId;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Date getDateOfDelete() {
        return dateOfDelete;
    }
    
    public void setDateOfDelete(Date dateOfDelete) {
        this.dateOfDelete = dateOfDelete;
    }
    
    public String getEnteredBy() {
        return enteredBy;
    }
    
    public void setEnteredBy(String enteredBy) {
        this.enteredBy = enteredBy;
    }
    
    public String getAuthorizeBy() {
        return authorizeBy;
    }
    
    public void setAuthorizeBy(String authorizeBy) {
        this.authorizeBy = authorizeBy;
    }
    
    public String getPreviousStat() {
        return previousStat;
    }
    
    public void setPreviousStat(String previousStat) {
        this.previousStat = previousStat;
    }
    
    public String getReasonForDelete() {
        return reasonForDelete;
    }
    
    public void setReasonForDelete(String reasonForDelete) {
        this.reasonForDelete = reasonForDelete;
    }
    
    @Override
    public String toString() {
        return "CustomerDeleteEntity [id=" + id + ", custId=" + custId + ", status=" + status + ", dateOfDelete="
                + dateOfDelete + ", enteredBy=" + enteredBy + ", authorizeBy=" + authorizeBy + ", previousStat="
                + previousStat + "]";
    }
    
}