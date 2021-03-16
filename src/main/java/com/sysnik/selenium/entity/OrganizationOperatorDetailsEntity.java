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
@Scope(value = "prototype")
@Table(name = "ORGANISATION_OPERATOR_DETAILS")
public class OrganizationOperatorDetailsEntity implements Serializable {
    
    private static final long serialVersionUID = -310681158503829326L;
    
    public OrganizationOperatorDetailsEntity() {
        super();
    }
    
    @Id
    @Column(name = "ID", length = 10)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "org_opr_details_gen")
    @SequenceGenerator(name = "org_opr_details_gen", sequenceName = "organisation_operator_details_seq",
            allocationSize = 1)
    long id;
    
    @Column(name = "CUST_ID", nullable = false, length = 20)
    BigInteger custId;
    
    @Column(name = "OPR_ID", nullable = true, length = 20)
    BigInteger operatorId;
    
    @Column(name = "MOBILE", nullable = true, length = 10)
    String mobile;
    
    @Column(name = "OPR_NAME", nullable = true, length = 50)
    String operatorName;
    
    @Column(name = "OPR_TYPE", nullable = false, length = 5)
    String operatorType;
    
    @Column(name = "ADDRESS_PROOF", nullable = true, length = 20)
    String addressProof;
    
    @Column(name = "IDENTITY_PROOF", nullable = true, length = 20)
    String identityProof;
    
    @Column(name = "STATUS", nullable = false, length = 1)
    String status;
    
    @Column(name = "ADDRESS_PROOF_ID", nullable = false, length = 20)
    Integer addressProofId;
    
    @Column(name = "IDENTITY_PROOF_ID", nullable = false, length = 20)
    Integer identityProofId;
    
    @Column(name = "DOB", nullable = false)
    Date dateOfBirth;
    
    public long getId() {
        return id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
    
    public BigInteger getCustId() {
        return custId;
    }
    
    public void setCustId(BigInteger custId) {
        this.custId = custId;
    }
    
    public BigInteger getOperatorId() {
        return operatorId;
    }
    
    public void setOperatorId(BigInteger operatorId) {
        this.operatorId = operatorId;
    }
    
    public String getMobile() {
        return mobile;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    
    public String getOperatorName() {
        return operatorName;
    }
    
    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }
    
    public String getOperatorType() {
        return operatorType;
    }
    
    public void setOperatorType(String operatorType) {
        this.operatorType = operatorType;
    }
    
    public String getAddressProof() {
        return addressProof;
    }
    
    public void setAddressProof(String addressProof) {
        this.addressProof = addressProof;
    }
    
    public String getIdentityProof() {
        return identityProof;
    }
    
    public void setIdentityProof(String identityProof) {
        this.identityProof = identityProof;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Integer getAddressProofId() {
        return addressProofId;
    }
    
    public void setAddressProofId(Integer addressProofId) {
        this.addressProofId = addressProofId;
    }
    
    public Integer getIdentityProofId() {
        return identityProofId;
    }
    
    public void setIdentityProofId(Integer identityProofId) {
        this.identityProofId = identityProofId;
    }
    
    public Date getDateOfBirth() {
        return dateOfBirth;
    }
    
    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    
    @Override
    public String toString() {
        return "OrganizationOperatorDetailsEntity [id=" + id + ", custId=" + custId + ", operatorId=" + operatorId
                + ", mobile=" + mobile + ", operatorName=" + operatorName + ", operatorType=" + operatorType
                + ", addressProof=" + addressProof + ", identityProof=" + identityProof + ", status=" + status
                + ", addressProofId=" + addressProofId + ", identityProofId=" + identityProofId + ", dateOfBirth="
                + dateOfBirth + "]";
    }
    
}
