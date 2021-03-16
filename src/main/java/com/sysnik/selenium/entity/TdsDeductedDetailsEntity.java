package com.sysnik.selenium.entity;

import java.io.Serializable;
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

import org.springframework.context.annotation.Scope;

@Entity
@Scope(value = "prototype")
@Table(name = "TDS_DEDUCTED_DETAILS")
public class TdsDeductedDetailsEntity implements Serializable {
    
    private static final long serialVersionUID = -1661154880533311122L;
    
    public TdsDeductedDetailsEntity() {
        super();
        
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "TDS_DEDUCTED_DETAILS_gen")
    @SequenceGenerator(name = "TDS_DEDUCTED_DETAILS_gen", sequenceName = "TDS_DEDUCTED_DETAILS_SEQ", allocationSize = 1)
    @Column(name = "ID", nullable = false)
    private BigInteger id;
    
    @Column(name = "CUST_ID", nullable = false)
    private BigInteger custId;
    
    @Column(name = "ACC_ID", nullable = false)
    private BigInteger accId;
    
    @Column(name = "TRANSCODE", length = 16, nullable = false)
    private String transCode;
    
    @Column(name = "NEW_INTEREST", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal newInterest;
    
    @Column(name = "TDS_AMT", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal tdsAmt;
    
    @Column(name = "FIN_YEAR", length = 8, nullable = false)
    private String finYear;
    
    @Column(name = "ENTERED_DATE", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date enteredDt;
    
    @Column(name = "ENTERED_BY", length = 20, nullable = false)
    private String enteredBy;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    public BigInteger getId() {
        return id;
    }
    
    public void setId(BigInteger id) {
        this.id = id;
    }
    
    public BigInteger getCustId() {
        return custId;
    }
    
    public void setCustId(BigInteger custId) {
        this.custId = custId;
    }
    
    public BigInteger getAccId() {
        return accId;
    }
    
    public void setAccId(BigInteger accId) {
        this.accId = accId;
    }
    
    public String getTransCode() {
        return transCode;
    }
    
    public void setTransCode(String transCode) {
        this.transCode = transCode;
    }
    
    public BigDecimal getNewInterest() {
        return newInterest;
    }
    
    public void setNewInterest(BigDecimal newInterest) {
        this.newInterest = newInterest;
    }
    
    public BigDecimal getTdsAmt() {
        return tdsAmt;
    }
    
    public void setTdsAmt(BigDecimal tdsAmt) {
        this.tdsAmt = tdsAmt;
    }
    
    public String getFinYear() {
        return finYear;
    }
    
    public void setFinYear(String finYear) {
        this.finYear = finYear;
    }
    
    public Date getEnteredDt() {
        return enteredDt;
    }
    
    public void setEnteredDt(Date enteredDt) {
        this.enteredDt = enteredDt;
    }
    
    public String getEnteredBy() {
        return enteredBy;
    }
    
    public void setEnteredBy(String enteredBy) {
        this.enteredBy = enteredBy;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    @Override
    public String toString() {
        return "TdsDeductedDetailsEntity [id=" + id + ", custId=" + custId + ", accId=" + accId + ", transCode="
                + transCode + ", newInterest=" + newInterest + ", tdsAmt=" + tdsAmt + ", finYear=" + finYear
                + ", enteredDt=" + enteredDt + ", enteredBy=" + enteredBy + ", status=" + status + "]";
    }
    
}
