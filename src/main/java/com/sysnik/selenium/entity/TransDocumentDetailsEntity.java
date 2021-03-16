package com.sysnik.selenium.entity;

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
@Scope(value = "prototype")
@Table(name = "TRANS_DOCUMENT_DETAILS")
public class TransDocumentDetailsEntity {
    
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "trans_document_details_seq")
    @SequenceGenerator(name = "trans_document_details_seq", sequenceName = "trans_document_details_seq",
            allocationSize = 1)
    private BigInteger id;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "BRANCH_CODE", length = 20, nullable = false)
    private String branchCode;
    
    @Column(name = "ENTERED_DATE", nullable = false)
    private Date enteredDate;
    
    @Column(name = "VOUCHER_NO")
    private BigInteger voucherNumber;
    
    @Column(name = "TRANS_TYPE", length = 1)
    private String transType;
    
    @Column(name = "TRANS_MODE", length = 20)
    private String transCode;
    
    @Column(name = "DOC_ID", nullable = false)
    private Integer docId;
    
    @Column(name = "DOC_ENTERED_DATE")
    private Date docEnteredDate;
    
    @Column(name = "DOC_ISSUE_DATE")
    private Date docIssueDate;
    
    @Column(name = "DOC_EXP_DATE")
    private Date docExpiryDate;
    
    @Column(name = "DOC_NUMBER", length = 30)
    private String docNumer;
    
    @Column(name = "DOC_UPLOAD", length = 1)
    private String docUpload;
    
    @Column(name = "DOC_DETAILS", length = 50)
    private String docDetails;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    @Column(name = "ENTERED_BY", nullable = false)
    private String enteredBy;
    
    @Column(name = "AUTH_BY")
    private String authBy;
    
    @Column(name = "ENTERED_BRANCH", length = 20)
    private String enteredBranch;
    
    @Column(name = "PAGE_NO", length = 20)
    private Integer pageNo;
    
    @Column(name = "LOCATION", length = 100)
    private String location;
    
    @Column(name = "IMAGE_NAME", length = 100)
    private String imageName;
    
    @Column(name = "DOC_HOLDER_NAME", length = 100, nullable = false)
    private String docHolderName;
    
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
    
    public String getBranchCode() {
        return branchCode;
    }
    
    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }
    
    public Date getEnteredDate() {
        return enteredDate;
    }
    
    public void setEnteredDate(Date enteredDate) {
        this.enteredDate = enteredDate;
    }
    
    public BigInteger getVoucherNumber() {
        return voucherNumber;
    }
    
    public void setVoucherNumber(BigInteger voucherNumber) {
        this.voucherNumber = voucherNumber;
    }
    
    public String getTransType() {
        return transType;
    }
    
    public void setTransType(String transType) {
        this.transType = transType;
    }
    
    public String getTransCode() {
        return transCode;
    }
    
    public void setTransCode(String transCode) {
        this.transCode = transCode;
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
    
    public Date getDocExpiryDate() {
        return docExpiryDate;
    }
    
    public void setDocExpiryDate(Date docExpiryDate) {
        this.docExpiryDate = docExpiryDate;
    }
    
    public String getDocNumer() {
        return docNumer;
    }
    
    public void setDocNumer(String docNumer) {
        this.docNumer = docNumer;
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
    
    public String getEnteredBranch() {
        return enteredBranch;
    }
    
    public void setEnteredBranch(String enteredBranch) {
        this.enteredBranch = enteredBranch;
    }
    
    public Integer getPageNo() {
        return pageNo;
    }
    
    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }
    
    public String getLocation() {
        return location;
    }
    
    public void setLocation(String location) {
        this.location = location;
    }
    
    public String getImageName() {
        return imageName;
    }
    
    public void setImageName(String imageName) {
        this.imageName = imageName;
    }
    
    public String getDocHolderName() {
        return docHolderName;
    }
    
    public void setDocHolderName(String docHolderName) {
        this.docHolderName = docHolderName;
    }
    
    @Override
    public String toString() {
        return "AbcEntity [id=" + id + ", bankCode=" + bankCode + ", branchCode=" + branchCode + ", enteredDate="
                + enteredDate + ", voucherNumber=" + voucherNumber + ", transType=" + transType + ", transCode="
                + transCode + ", docId=" + docId + ", docEnteredDate=" + docEnteredDate + ", docIssueDate="
                + docIssueDate + ", docExpiryDate=" + docExpiryDate + ", docNumer=" + docNumer + ", docUpload="
                + docUpload + ", docDetails=" + docDetails + ", status=" + status + ", enteredBy=" + enteredBy
                + ", authBy=" + authBy + ", enteredBranch=" + enteredBranch + ", pageNo=" + pageNo + ", location="
                + location + ", imageName=" + imageName + ", docHolderName=" + docHolderName + "]";
    }
}