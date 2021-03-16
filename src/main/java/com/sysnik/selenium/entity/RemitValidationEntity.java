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
@Table(name = "INSTRUMENT_REVALIDATION")
public class RemitValidationEntity implements Serializable {
    
    private static final long serialVersionUID = -6073429642117222655L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "remit_revalidate_seq")
    @SequenceGenerator(name = "remit_revalidate_seq", sequenceName = "remit_revalidate_seq", allocationSize = 1)
    @Column(name = "ID", length = 10, nullable = false)
    private BigInteger id;
    
    @Column(name = "REMIT_ID", length = 10, nullable = false)
    private BigInteger remitId;
    
    @Column(name = "REMITTANCE_SRNO", length = 30, nullable = false)
    private String remittanceSrNo;
    
    @Column(name = "REVAL_DATE", nullable = false)
    //@JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Kolkata", locale = "en-IN")
    private Date revalidateDate;
    
    @Column(name = "ENTERED_BY", length = 10, nullable = false)
    private String enteredBy;
    
    @Column(name = "AUTH_BY", length = 10, nullable = true)
    private String authBy;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    public BigInteger getId() {
        return id;
    }
    
    public void setId(BigInteger id) {
        this.id = id;
    }
    
    public BigInteger getRemitId() {
        return remitId;
    }
    
    public void setRemitId(BigInteger remitId) {
        this.remitId = remitId;
    }
    
    public String getRemittanceSrNo() {
        return remittanceSrNo;
    }
    
    public void setRemittanceSrNo(String remittanceSrNo) {
        this.remittanceSrNo = remittanceSrNo;
    }
    
    public Date getRevalidateDate() {
        return revalidateDate;
    }
    
    public void setRevalidateDate(Date revalidateDate) {
        this.revalidateDate = revalidateDate;
    }
    
    public String getEnteredBy() {
        return enteredBy;
    }
    
    public void setEnteredBy(String enteredBy) {
        this.enteredBy = enteredBy;
    }
    
    public String getAuthBy() {
        return authBy;
    }
    
    public void setAuthBy(String authBy) {
        this.authBy = authBy;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    @Override
    public String toString() {
        return "RemitValidationEntity [id=" + id + ", remitId=" + remitId + ", remittanceSrNo=" + remittanceSrNo
                + ", revalidateDate=" + revalidateDate + ", enteredBy=" + enteredBy + ", authBy=" + authBy + ", status="
                + status + "]";
    }
    
}
