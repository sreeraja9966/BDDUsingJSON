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

/**
 * @author nilam.birdawade
 */
@Entity
@Scope(scopeName = "prototype")
@Table(name = "REMIT_PARAMETER")
public class RemitParameterEntity implements Serializable {
    
    /**
     * 
     */
    private static final long serialVersionUID = -71549147388755771L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "remit_parameter_seq")
    @SequenceGenerator(name = "remit_parameter_seq", sequenceName = "remit_parameter_seq", allocationSize = 1)
    @Column(name = "ID", length = 10, nullable = false)
    private BigInteger id;
    
    @Column(name = "STALE_PERIOD", length = 4, nullable = false)
    private int stalePeriod;
    
    @Column(name = "REVALID_PERIOD", length = 4, nullable = false)
    private int revalidPeriod;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "BRANCH_CODE", length = 20, nullable = false)
    private String branchCode;
    
    @Column(name = "REMITTANCE_TYPE", length = 2, nullable = false)
    private String remittanceType;
    
    @Column(name = "RECON_AT_BANK", length = 1, nullable = false)
    private String reconAtBank;
    
    @Column(name = "RECON_AT_BRANCH", length = 1, nullable = false)
    private String reconAtBranch;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    @Column(name = "ADVICE", length = 1, nullable = false)
    private String advice;
    
    @Column(name = "BRANCH_ACCOUNT_ID", length = 20, nullable = false)
    private String branchAccountId;
    
    @Column(name = "HO_ACCOUNT_ID", length = 20, nullable = false)
    private String hoAccountId;
    
    @Column(name = "ADVICE_ACCOUNT_ID", length = 20, nullable = false)
    private String adviceAccountId;
    
    @Column(name = "AUTO_PRINT_SRNO", length = 1, nullable = false)
    private String autoPrintSrno;
    
    @Column(name = "PAP_YN", length = 1, nullable = false)
    private String payableAtParYN;
    
    @Column(name = "CITY_CODE", length = 3, nullable = false)
    private String cityCode;
    
    @Column(name = "BANK_ID", length = 20, nullable = false)
    private String bankId;
    
    public BigInteger getId() {
        return id;
    }
    
    public void setId(BigInteger id) {
        this.id = id;
    }
    
    public int getStalePeriod() {
        return stalePeriod;
    }
    
    public void setStalePeriod(int stalePeriod) {
        this.stalePeriod = stalePeriod;
    }
    
    public int getRevalidPeriod() {
        return revalidPeriod;
    }
    
    public void setRevalidPeriod(int revalidPeriod) {
        this.revalidPeriod = revalidPeriod;
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
    
    public String getRemittanceType() {
        return remittanceType;
    }
    
    public void setRemittanceType(String remittanceType) {
        this.remittanceType = remittanceType;
    }
    
    public String getReconAtBank() {
        return reconAtBank;
    }
    
    public void setReconAtBank(String reconAtBank) {
        this.reconAtBank = reconAtBank;
    }
    
    public String getReconAtBranch() {
        return reconAtBranch;
    }
    
    public void setReconAtBranch(String reconAtBranch) {
        this.reconAtBranch = reconAtBranch;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getAdvice() {
        return advice;
    }
    
    public void setAdvice(String advice) {
        this.advice = advice;
    }
    
    public String getBranchAccountId() {
        return branchAccountId;
    }
    
    public void setBranchAccountId(String branchAccountId) {
        this.branchAccountId = branchAccountId;
    }
    
    public String getHoAccountId() {
        return hoAccountId;
    }
    
    public void setHoAccountId(String hoAccountId) {
        this.hoAccountId = hoAccountId;
    }
    
    public String getAdviceAccountId() {
        return adviceAccountId;
    }
    
    public void setAdviceAccountId(String adviceAccountId) {
        this.adviceAccountId = adviceAccountId;
    }
    
    public String getAutoPrintSrno() {
        return autoPrintSrno;
    }
    
    public void setAutoPrintSrno(String autoPrintSrno) {
        this.autoPrintSrno = autoPrintSrno;
    }
    
    public String getPayableAtParYN() {
        return payableAtParYN;
    }
    
    public void setPayableAtParYN(String payableAtParYN) {
        this.payableAtParYN = payableAtParYN;
    }
    
    public String getCityCode() {
        return cityCode;
    }
    
    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }
    
    public String getBankId() {
        return bankId;
    }
    
    public void setBankId(String bankId) {
        this.bankId = bankId;
    }
    
    @Override
    public String toString() {
        return "RemitParameterEntity [id=" + id + ", stalePeriod=" + stalePeriod + ", revalidPeriod=" + revalidPeriod
                + ", bankCode=" + bankCode + ", branchCode=" + branchCode + ", remittanceType=" + remittanceType
                + ", reconAtBank=" + reconAtBank + ", reconAtBranch=" + reconAtBranch + ", status=" + status
                + ", advice=" + advice + ", branchAccountId=" + branchAccountId + ", hoAccountId=" + hoAccountId
                + ", adviceAccountId=" + adviceAccountId + ", autoPrintSrno=" + autoPrintSrno + ", payableAtParYN="
                + payableAtParYN + ", cityCode=" + cityCode + ", bankId=" + bankId + "]";
    }
}
