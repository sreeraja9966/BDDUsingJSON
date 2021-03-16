
package com.sysnik.selenium.entity;

import java.io.Serializable;
import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;

@Entity

@Scope("prototype")

@Table(name = "BlACK_LIST_DETAILS")

public class BlackListDetailsEntity implements Serializable {
    
    private static final long serialVersionUID = 1665322559272841249L;
    
    public BlackListDetailsEntity() {
        
    }
    
    @Id
    
    @Column(name = "ID", nullable = false)
    private BigInteger Id;
    
    @Column(name = "BLACK_LIST_ID", nullable = false)
    private BigInteger blackListId;
    
    @Column(name = "PROOF_TYPE", nullable = false)
    private String proofType;
    
    @Column(name = "PROOF_DETAILS", nullable = false)
    private String proofDetails;
    
    @Column(name = "STATUS", nullable = false)
    private String status;
    
    @Column(name = "DOC_ID", nullable = false)
    private Long docId;
    
    public BigInteger getId() {
        return Id;
    }
    
    public void setId(BigInteger id) {
        Id = id;
    }
    
    public BigInteger getBlackListId() {
        return blackListId;
    }
    
    public void setBlackListId(BigInteger blackListId) {
        this.blackListId = blackListId;
    }
    
    public String getProofType() {
        return proofType;
    }
    
    public void setProofType(String proofType) {
        this.proofType = proofType;
    }
    
    public String getProofDetails() {
        return proofDetails;
    }
    
    public void setProofDetails(String proofDetails) {
        this.proofDetails = proofDetails;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Long getDocId() {
        return docId;
    }
    
    public void setDocId(Long docId) {
        this.docId = docId;
    }
    
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
    @Override
    public String toString() {
        return "BlackListDetailsEntity [Id=" + Id + ", blackListId=" + blackListId + ", proofType=" + proofType
                + ", proofDetails=" + proofDetails + ", status=" + status + ", docId=" + docId + "]";
    }
    
}
