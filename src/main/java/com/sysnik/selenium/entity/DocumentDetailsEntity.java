package com.sysnik.selenium.entity;

import java.io.Serializable;
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

import org.springframework.context.annotation.Scope;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@Entity
@Scope(value = "prototype")
@Table(name = "DOCUMENTS_DETAILS")
@EntityListeners(AuditingEntityListener.class)
@EnableJpaAuditing
public class DocumentDetailsEntity implements Serializable {
    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "documents_details_gen")
    @SequenceGenerator(name = "documents_details_gen", sequenceName = "DOCUMENTS_DETAILS_SEQ", allocationSize = 1)
    @Column(name = "ID", nullable = false)
    private Long id;
    
    @Column(name = "CUST_ACC", nullable = false)
    private String custAcc;
    
    @Column(name = "CUST_ACC_ID", nullable = false)
    private BigInteger custAccId;
    
    @Column(name = "DOC_ID", nullable = false)
    private Integer docId;
    
    @Column(name = "DOC_ENTERED_DATE", nullable = false)
    private Date docEnteredDate;
    
    @Column(name = "DOC_ISSUE_DATE")
    private Date docIssueDate;
    
    @Column(name = "DOC_EXP_DATE")
    private Date docExpDate;
    
    @Column(name = "DOC_NUMBER")
    private String docNumber;
    
    @Column(name = "DOC_UPLOAD")
    private String docUpload;
    
    @Column(name = "DOC_DETAILS")
    private String docDetails;
    
    @Column(name = "STATUS", nullable = false)
    private String status;
    
    @Column(name = "ENTERED_BY", nullable = false)
    private String enteredBy;
    
    @Column(name = "AUTH_BY")
    private String authBy;
    
    @Column(name = "ENTERED_BRANCH")
    private String enteredBranch;
    
    public String getEnteredBranch() {
        return enteredBranch;
    }
    
    public void setEnteredBranch(String enteredBranch) {
        this.enteredBranch = enteredBranch;
    }
    
    public Long getID() {
        return id;
    }
    
    public void setID(Long ID) {
        id = ID;
    }
    
    public String getCustAcc() {
        return custAcc;
    }
    
    public void setCustAcc(String custAcc) {
        this.custAcc = custAcc;
    }
    
    public BigInteger getCustAccId() {
        return custAccId;
    }
    
    public void setCustAccId(BigInteger custAccId) {
        this.custAccId = custAccId;
    }
    
    public Integer getDocId() {
        return docId;
    }
    
    public void setDocId(Integer docId) {
        this.docId = docId;
    }
    
    public Date getDocEnteredDate() {
        return docEnteredDate;
    }
    
    public void setDocEnteredDate(Date docEnteredDate) {
        this.docEnteredDate = docEnteredDate;
    }
    
    public Date getDocIssueDate() {
        return docIssueDate;
    }
    
    public void setDocIssueDate(Date docIssueDate) {
        this.docIssueDate = docIssueDate;
    }
    
    public Date getDocExpDate() {
        return docExpDate;
    }
    
    public void setDocExpDate(Date docExpDate) {
        this.docExpDate = docExpDate;
    }
    
    public String getDocNumber() {
        return docNumber;
    }
    
    public void setDocNumber(String docNumber) {
        this.docNumber = docNumber;
    }
    
    public String getDocUpload() {
        return docUpload;
    }
    
    public void setDocUpload(String docUpload) {
        this.docUpload = docUpload;
    }
    
    public String getDocDetails() {
        return docDetails;
    }
    
    public void setDocDetails(String docDetails) {
        this.docDetails = docDetails;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
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
    
    @Override
    public String toString() {
        return "DocumentDetailsEntity [ID=" + id + ",custAcc=" + custAcc + ", custAccId=" + custAccId + ", docId="
                + docId + ", docEnteredDate=" + docEnteredDate + ", docIssueDate=" + docIssueDate + ", docExpDate="
                + docExpDate + ", docNumber=" + docNumber + ", docUpload=" + docUpload + ", docDetails=" + docDetails
                + ", status=" + status + ", enteredBy=" + enteredBy + ", authBy=" + authBy + "]";
    }
    
}
