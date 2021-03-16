package com.sysnik.selenium.entity;

import java.io.Serializable;
import java.math.BigInteger;

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
@Table(name = "BENEFICIARY_DETAILS")
public class BeneficiaryDetailsEntity implements Serializable {
    
    private static final long serialVersionUID = -6073429642117222655L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "beneficiary_id_seq")
    @SequenceGenerator(name = "beneficiary_id_seq", sequenceName = "beneficiary_id_seq", allocationSize = 1,
            initialValue = 1)
    @Column(name = "BENEFICIARY_ID", length = 10, nullable = false)
    private BigInteger beneficiaryId;
    
    @Column(name = "BENEF_ACC_NO", length = 20, nullable = true)
    private String benefAccountNo;
    
    @Column(name = "CUST_NUMBER")
    private String custNumber;
    
    @Column(name = "BENEF_NAME")
    private String benefName;
    
    @Column(name = "BENEF_ADDRESS1", length = 50, nullable = true)
    private String benefAddress1;
    
    @Column(name = "BENEF_ADDRESS2", length = 50, nullable = true)
    private String benefAddress2;
    
    @Column(name = "BENEF_ADDRESS3", length = 50, nullable = true)
    private String benefAddress3;
    
    @Column(name = "BENEF_CITY_CODE", length = 3, nullable = true)
    private String benefCityCode;
    
    @Column(name = "BENEF_BANK_CODE", length = 20, nullable = true)
    private String benefBankCode;
    
    @Column(name = "BENEF_BRANCH_CODE", length = 20, nullable = true)
    private String benefBranchCode;
    
    @Column(name = "BENEF_PIN_CODE", length = 3, nullable = false)
    private String benefPinCode;
    
    @Column(name = "BENEF_CONTACT_NO", length = 20, nullable = false)
    private String benifContactNo;
    
    @Column(name = "BENEF_ACTYPE", length = 10)
    private String benefAcType;
    
    @Column(name = "BENEF_BANKNAME", length = 45)
    private String benefbankName;
    
    @Column(name = "BENEF_MAILID", length = 25)
    private String benefMailId;
    
    @Column(name = "BENEF_IFSC", length = 25, nullable = false)
    private String benefIfsc;
    
    @Column(name = "BENEF_CITY_NAME", length = 45)
    private String benefCityName;
    
    @Column(name = "BENEF_BRANCH_NAME", length = 45)
    private String benefBranchName;
    
    public BigInteger getBeneficiaryId() {
        return beneficiaryId;
    }
    
    public void setBeneficiaryId(BigInteger beneficiaryId) {
        this.beneficiaryId = beneficiaryId;
    }
    
    public String getBenefAccountNo() {
        return benefAccountNo;
    }
    
    public void setBenefAccountNo(String benefAccountNo) {
        this.benefAccountNo = benefAccountNo;
    }
    
    public String getCustNumber() {
        return custNumber;
    }
    
    public void setCustNumber(String custNumber) {
        this.custNumber = custNumber;
    }
    
    public String getBenefName() {
        return benefName;
    }
    
    public void setBenefName(String benefName) {
        this.benefName = benefName;
    }
    
    public String getBenefAddress1() {
        return benefAddress1;
    }
    
    public void setBenefAddress1(String benefAddress1) {
        this.benefAddress1 = benefAddress1;
    }
    
    public String getBenefAddress2() {
        return benefAddress2;
    }
    
    public void setBenefAddress2(String benefAddress2) {
        this.benefAddress2 = benefAddress2;
    }
    
    public String getBenefAddress3() {
        return benefAddress3;
    }
    
    public void setBenefAddress3(String benefAddress3) {
        this.benefAddress3 = benefAddress3;
    }
    
    public String getBenefCityCode() {
        return benefCityCode;
    }
    
    public void setBenefCityCode(String benefCityCode) {
        this.benefCityCode = benefCityCode;
    }
    
    public String getBenefBankCode() {
        return benefBankCode;
    }
    
    public void setBenefBankCode(String benefBankCode) {
        this.benefBankCode = benefBankCode;
    }
    
    public String getBenefBranchCode() {
        return benefBranchCode;
    }
    
    public void setBenefBranchCode(String benefBranchCode) {
        this.benefBranchCode = benefBranchCode;
    }
    
    public String getBenefPinCode() {
        return benefPinCode;
    }
    
    public void setBenefPinCode(String benefPinCode) {
        this.benefPinCode = benefPinCode;
    }
    
    public String getBenifContactNo() {
        return benifContactNo;
    }
    
    public void setBenifContactNo(String benifContactNo) {
        this.benifContactNo = benifContactNo;
    }
    
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
    public String getBenefAcType() {
        return benefAcType;
    }
    
    public void setBenefAcType(String benefAcType) {
        this.benefAcType = benefAcType;
    }
    
    public String getBenefbankName() {
        return benefbankName;
    }
    
    public void setBenefbankName(String benefbankName) {
        this.benefbankName = benefbankName;
    }
    
    public String getBenefMailId() {
        return benefMailId;
    }
    
    public void setBenefMailId(String benefMailId) {
        this.benefMailId = benefMailId;
    }
    
    public String getBenefIfsc() {
        return benefIfsc;
    }
    
    public void setBenefIfsc(String benefIfsc) {
        this.benefIfsc = benefIfsc;
    }
    
    public String getBenefCityName() {
        return benefCityName;
    }
    
    public void setBenefCityName(String benefCityName) {
        this.benefCityName = benefCityName;
    }
    
    public String getBenefBranchName() {
        return benefBranchName;
    }
    
    public void setBenefBranchName(String benefBranchName) {
        this.benefBranchName = benefBranchName;
    }
    
    @Override
    public String toString() {
        return "BeneficiaryDetailsEntity [beneficiaryId=" + beneficiaryId + ", benefAccountNo=" + benefAccountNo
                + ", custNumber=" + custNumber + ", benefName=" + benefName + ", benefAddress1=" + benefAddress1
                + ", benefAddress2=" + benefAddress2 + ", benefAddress3=" + benefAddress3 + ", benefCityCode="
                + benefCityCode + ", benefBankCode=" + benefBankCode + ", benefBranchCode=" + benefBranchCode
                + ", benefPinCode=" + benefPinCode + ", benifContactNo=" + benifContactNo + "]";
    }
    
}
