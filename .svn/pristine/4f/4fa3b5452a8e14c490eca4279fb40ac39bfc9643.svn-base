package com.sysnik.selenium.entity;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;

@Entity
@Scope("prototype")
@Table(name = "CHEQUE_BOOK_DETAIL")

public class ChequeBookDetailEntity implements Serializable {
    
    private static final long serialVersionUID = -1129949319078541051L;
    
    public ChequeBookDetailEntity() {
        
    }
    
    @Column(name = "CHEQUE_BOOK_ID")
    private Integer chequeBookId;
    @Id
    @Basic
    @Column(name = "INSTR_NO")
    private String instrumentNo;
    
    @Basic
    @Column(name = "STATUS")
    private String status;
    
    @Basic
    @Column(name = "TRANS_ID")
    private BigInteger transId;
    
    @Column(name = "PAID_DATE")
    private Date paidDate;
    
    public Integer getChequeBookId() {
        return chequeBookId;
    }
    
    public void setChequeBookId(Integer chequeBookId) {
        this.chequeBookId = chequeBookId;
    }
    
    public String getInstrumentNo() {
        return instrumentNo;
    }
    
    public void setInstrumentNo(String instrumentNo) {
        this.instrumentNo = instrumentNo;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public BigInteger getTransId() {
        return transId;
    }
    
    public void setTransId(BigInteger transId) {
        this.transId = transId;
    }
    
    public Date getPaidDate() {
        return paidDate;
    }
    
    public void setPaidDate(Date paidDate) {
        this.paidDate = paidDate;
    }
    
    @Override
    public String toString() {
        return "ChequeBookDetailEntity [chequeBookId=" + chequeBookId + ", instrumentNo=" + instrumentNo + ", status="
                + status + ", transId=" + transId + ", paidDate=" + paidDate + "]";
    }
    
}
