package com.sysnik.selenium.entity;

import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;



@Entity
@Table(name = "STOP_PAYMENT_CHEQUE")
@EntityListeners(AuditingEntityListener.class)
@EnableJpaAuditing
public class StopChequePaymentAuthEntity {
    @Id
    @GenericGenerator(name = "sequence", strategy = "sequence",
            parameters = { @org.hibernate.annotations.Parameter(name = "sequenceName", value = "sequence"),
                    @org.hibernate.annotations.Parameter(name = "allocationSize", value = "1"), })
    
    @GeneratedValue(generator = "sequence", strategy = GenerationType.SEQUENCE)
    @Column(name = "ID")
    private int id;
    
    @Column(name = "ACC_ID")
    private BigInteger accID;
    
    @Column(name = "INSTRUMENT_TYPE")
    private String instrumentType;
    
    @Column(name = "START_NUMBER")
    private int startNo;
    
    @Column(name = "END_NUMBER")
    private int endNo;
    
    @Column(name = "INSTRUMENT_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date instrumentDate;
    
    @Column(name = "INSTRUMENT_AMT")
    private double instrumentAmt;
    
    @Column(name = "PAYEE_NAME")
    private String payeeName;
    
    @Column(name = "STOP_REASON")
    private String stopReson;
    
    @Column(name = "STOP_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date stopDate;
    
    @Column(name = "ENTERED_BY")
    private String enteredBy;
    
    @Column(name = "AUTHORIZE_BY")
    private String authorizeBy;
    
    @Column(name = "REVOKE_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date revokeDate;
    
    @Column(name = "REVOKE_BY")
    private String revokeBy;
    
    @Column(name = "REVOKE_AUTH_BY")
    private String revokeAuthBy;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public BigInteger getAccID() {
        return accID;
    }
    
    public void setAccID(BigInteger accID) {
        this.accID = accID;
    }
    
    public String getInstrumentType() {
        return instrumentType;
    }
    
    public void setInstrumentType(String instrumentType) {
        this.instrumentType = instrumentType;
    }
    
    public int getStartNo() {
        return startNo;
    }
    
    public void setStartNo(int i) {
        this.startNo = i;
    }
    
    public int getEndNo() {
        return endNo;
    }
    
    public void setEndNo(int endNo) {
        this.endNo = endNo;
    }
    
    public Date getInstrumentDate() {
        return instrumentDate;
    }
    
    public void setInstrumentDate(Date instrumentDate) {
        this.instrumentDate = instrumentDate;
    }
    
    public double getInstrumentAmt() {
        return instrumentAmt;
    }
    
    public void setInstrumentAmt(double instrumentAmt) {
        this.instrumentAmt = instrumentAmt;
    }
    
    public String getPayeeName() {
        return payeeName;
    }
    
    public void setPayeeName(String payeeName) {
        this.payeeName = payeeName;
    }
    
    public String getStopReson() {
        return stopReson;
    }
    
    public void setStopReson(String stopReson) {
        this.stopReson = stopReson;
    }
    
    public Date getStopDate() {
        return stopDate;
    }
    
    public void setStopDate(Date stopDate) {
        this.stopDate = stopDate;
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
    
    public Date getRevokeDate() {
        return revokeDate;
    }
    
    public void setRevokeDate(Date revokeDate) {
        this.revokeDate = revokeDate;
    }
    
    public String getRevokeBy() {
        return revokeBy;
    }
    
    public void setRevokeBy(String revokeBy) {
        this.revokeBy = revokeBy;
    }
    
    public String getRevokeAuthBy() {
        return revokeAuthBy;
    }
    
    public void setRevokeAuthBy(String revokeAuthBy) {
        this.revokeAuthBy = revokeAuthBy;
    }
    
    @Override
    public String toString() {
        return "StopChequebookAuthorizeEntity [id=" + id + ", accID=" + accID + ", instrumentType=" + instrumentType
                + ", startNo=" + startNo + ", endNo=" + endNo + ", instrumentDate=" + instrumentDate
                + ", instrumentAmt=" + instrumentAmt + ", payeeName=" + payeeName + ", stopReson=" + stopReson
                + ", stopDate=" + stopDate + ", enteredBy=" + enteredBy + ", authorizeBy=" + authorizeBy
                + ", revokeDate=" + revokeDate + ", revokeBy=" + revokeBy + ", revokeAuthBy=" + revokeAuthBy + "]";
    }
    
}
