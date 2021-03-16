package com.sysnik.selenium.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@Entity
@Scope(value = "prototype")
@Table(name = "DOCUMENT_MASTER")
@EntityListeners(AuditingEntityListener.class)
@EnableJpaAuditing
public class DocumentMasterEntity implements Serializable {
    
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "BANK_CODE", nullable = false)
    private String bankCode;
    
    @Column(name = "DOC_ID", nullable = false)
    private Long docId;
    
    @Column(name = "DESCRIPTION", nullable = false)
    private String description;
    
    @Column(name = "RELATED_TO", nullable = false)
    private String relatedTo;
    
    @Column(name = "DOC_TYPE", nullable = false)
    private String docType;
    
    @Column(name = "DOC_ISSUE_DATE", nullable = false)
    private String docIssueDate;
    
    @Column(name = "DOC_EXP_DATE", nullable = false)
    private String docExpDate;
    
    @Column(name = "DOC_NUMBER", nullable = false)
    private String docNumber;
    
    @Column(name = "DOC_UPLOAD", nullable = false)
    private String docUpload;
    
    @Column(name = "DOC_DETAILS", nullable = false)
    private String docDetails;
    
    @Column(name = "VALIDATION_PATTERN")
    private String validationPattern;
    
    public String getBankCode() {
        return bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    public Long getDocId() {
        return docId;
    }
    
    public void setDocId(Long docId) {
        this.docId = docId;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getRelatedTo() {
        return relatedTo;
    }
    
    public void setRelatedTo(String relatedTo) {
        this.relatedTo = relatedTo;
    }
    
    public String getDocType() {
        return docType;
    }
    
    public void setDocType(String docType) {
        this.docType = docType;
    }
    
    public String getDocIssueDate() {
        return docIssueDate;
    }
    
    public void setDocIssueDate(String docIssueDate) {
        this.docIssueDate = docIssueDate;
    }
    
    public String getDocExpDate() {
        return docExpDate;
    }
    
    public void setDocExpDate(String docExpDate) {
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
    
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
    public String getValidationPattern() {
        return validationPattern;
    }
    
    public void setValidationPattern(String validationPattern) {
        this.validationPattern = validationPattern;
    }
    
    @Override
    public String toString() {
        return "DocumentMasterEntity [bankCode=" + bankCode + ", docId=" + docId + ", description=" + description
                + ", relatedTo=" + relatedTo + ", docType=" + docType + ", docIssueDate=" + docIssueDate
                + ", docExpDate=" + docExpDate + ", docNumber=" + docNumber + ", docUpload=" + docUpload
                + ", docDetails=" + docDetails + ", validationPattern=" + validationPattern + "]";
    }
    
}
