package com.sysnik.selenium.entity;

import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@EntityListeners(AuditingEntityListener.class)
@Table(name = "CHEQUE_BOOK_MASTER")
public class ChequeBookMasterEntity {
    
    @Id
    @Column(name = "ID", nullable = false)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CHEQUE_BOOK_MASTER_SEQ_GEN")
    @SequenceGenerator(name = "CHEQUE_BOOK_MASTER_SEQ_GEN", sequenceName = "CHEQUE_BOOK_MASTER_SEQ", allocationSize = 1)
    private int id;
    
    @Column(name = "ACC_ID")
    private BigInteger accID;
    
    @Column(name = "STATUS")
    private String status;
    
    @Column(name = "FROM_NO", nullable = false)
    private int fromNo;
    
    @Column(name = "TO_NUMBER", nullable = false)
    private int endNo;
    
    @Column(name = "ISSUE_DT", nullable = false)
    @CreationTimestamp
    // @JsonFormat(pattern = "yyyy/MM/dd hh:mm:ss")
    private Date dateOfIssue;
    
    @Column(name = "ENTERED_BY", nullable = false)
    @CreatedBy
    private String enteredBy;
    
    @Column(name = "AUTH_BY")
    private String authorizeBy;
    
    @Column(name = "BRANCH_CODE", length = 20, nullable = false)
    private String branchCode;
    
    @Column(name = "INST_TYPE")
    private String instType;
    
    @Column(name = "CHARGES_VOUCH_NO")
    private Integer chargesVouchNo;
    
    @Column(name = "CHARGES_BATCH_NO")
    private BigInteger chargesBatchNo;
    
    @Column(name = "CHEQUE_BATCH_NO")
    private BigInteger chequeBatchNo;
    
    public Integer getChargesVouchNo() {
        return chargesVouchNo;
    }
    
    public void setChargesVouchNo(Integer chargesVouchNo) {
        this.chargesVouchNo = chargesVouchNo;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public BigInteger getAccID() {
        return accID;
    }
    
    public void setAccId(BigInteger accID) {
        this.accID = accID;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public int getFromNo() {
        return fromNo;
    }
    
    public void setFromNo(int fromNo) {
        this.fromNo = fromNo;
    }
    
    public int getEndNo() {
        return endNo;
    }
    
    public void setEndNo(int endNo) {
        this.endNo = endNo;
    }
    
    public Date getDateOfIssue() {
        return dateOfIssue;
    }
    
    public void setDateOfIssue(Date dateOfIssue) {
        this.dateOfIssue = dateOfIssue;
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
    
    public String getBranchCode() {
        return branchCode;
    }
    
    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }
    
    public String getInstType() {
        return instType;
    }
    
    public void setInstType(String instType) {
        this.instType = instType;
    }
    
    public BigInteger getChargesBatchNo() {
        return chargesBatchNo;
    }
    
    public void setChargesBatchNo(BigInteger chargesBatchNo) {
        this.chargesBatchNo = chargesBatchNo;
    }
    
    public BigInteger getChequeBatchNo() {
        return chequeBatchNo;
    }
    
    public void setChequeBatchNo(BigInteger chequeBatchNo) {
        this.chequeBatchNo = chequeBatchNo;
    }
    
    @Override
    public String toString() {
        return "ChequeBookEntity [id=" + id + ", accID=" + accID + ", status=" + status + ", fromNo=" + fromNo
                + ", endNo=" + endNo + ", dateOfIssue=" + dateOfIssue + ", enteredBy=" + enteredBy + ", authorizeBy="
                + authorizeBy + ", branchCode=" + branchCode + ", instType=" + instType + ", chargesVouchNo="
                + chargesVouchNo + "]";
    }
    
}
