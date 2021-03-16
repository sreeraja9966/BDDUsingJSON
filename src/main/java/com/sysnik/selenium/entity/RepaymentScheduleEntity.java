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
@Table(name = "REPAYMENT_SCHEDULE")
public class RepaymentScheduleEntity implements Serializable {
    
    private static final long serialVersionUID = -7641608715997116350L;
    
    public RepaymentScheduleEntity() {
        super();
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "repayment_gen")
    @SequenceGenerator(name = "repayment_gen", sequenceName = "REPAYMENT_SCHEDULE_SEQ", allocationSize = 1)
    @Column(name = "ID", length = 20, nullable = false)
    private BigInteger id;
    
    @Column(name = "BANK_CODE", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "BRANCH_CODE", length = 20, nullable = false)
    private String branchCode;
    
    @Column(name = "PRD_ID", length = 5, nullable = false)
    private Integer prdId;
    
    @Column(name = "ACC_ID", length = 20, nullable = false)
    private BigInteger accId;
    
    @Column(name = "INSTALLMENT_NO", length = 5, nullable = false)
    private Integer installmentNo;
    
    @Column(name = "PAYMENT_DATE", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date paymentDate;
    
    @Column(name = "OPENING_BAL", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal openingBal;
    
    @Column(name = "INSTALL_AMT", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal installAmt;
    
    @Column(name = "PRINCIPLE_AMT", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal principleAmt;
    
    @Column(name = "INTREST_AMT", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal interestAmt;
    
    @Column(name = "CLOSING_BAL", precision = 17, scale = 2, nullable = false,
            columnDefinition = "numeric(17,2) default '00000.00'")
    private BigDecimal closingBal;
    
    @Column(name = "INSTALLMENTTYPE", length = 20, nullable = false)
    private String installmentType;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    @Column(name = "ENTERED_DATE", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date enteredDt;
    
    @Column(name = "ENTERED_BY", length = 10, nullable = false)
    private String enteredBy;
    
    @Column(name = "AUTH_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date authDt;
    
    @Column(name = "AUTH_BY", length = 10)
    private String authBy;
    
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
    
    public Integer getPrdId() {
        return prdId;
    }
    
    public void setPrdId(Integer prdId) {
        this.prdId = prdId;
    }
    
    public BigInteger getAccId() {
        return accId;
    }
    
    public void setAccId(BigInteger accId) {
        this.accId = accId;
    }
    
    public Integer getInstallmentNo() {
        return installmentNo;
    }
    
    public void setInstallmentNo(Integer installmentNo) {
        this.installmentNo = installmentNo;
    }
    
    public Date getPaymentDate() {
        return paymentDate;
    }
    
    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }
    
    public BigDecimal getOpeningBal() {
        return openingBal;
    }
    
    public void setOpeningBal(BigDecimal openingBal) {
        this.openingBal = openingBal;
    }
    
    public BigDecimal getInstallAmt() {
        return installAmt;
    }
    
    public void setInstallAmt(BigDecimal installAmt) {
        this.installAmt = installAmt;
    }
    
    public BigDecimal getPrincipleAmt() {
        return principleAmt;
    }
    
    public void setPrincipleAmt(BigDecimal principleAmt) {
        this.principleAmt = principleAmt;
    }
    
    public BigDecimal getInterestAmt() {
        return interestAmt;
    }
    
    public void setInterestAmt(BigDecimal interestAmt) {
        this.interestAmt = interestAmt;
    }
    
    public BigDecimal getClosingBal() {
        return closingBal;
    }
    
    public void setClosingBal(BigDecimal closingBal) {
        this.closingBal = closingBal;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
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
    
    public Date getAuthDt() {
        return authDt;
    }
    
    public void setAuthDt(Date authDt) {
        this.authDt = authDt;
    }
    
    public String getAuthBy() {
        return authBy;
    }
    
    public void setAuthBy(String authBy) {
        this.authBy = authBy;
    }
    
    public String getInstallmentType() {
        return installmentType;
    }
    
    public void setInstallmentType(String installmentType) {
        this.installmentType = installmentType;
    }
    
    @Override
    public String toString() {
        return "RepaymentScheduleEntity [id=" + id + ", bankCode=" + bankCode + ", branchCode=" + branchCode
                + ", prdId=" + prdId + ", accId=" + accId + ", installmentNo=" + installmentNo + ", paymentDate="
                + paymentDate + ", openingBal=" + openingBal + ", installAmt=" + installAmt + ", principleAmt="
                + principleAmt + ", interestAmt=" + interestAmt + ", closingBal=" + closingBal + ", installmentType="
                + installmentType + ", status=" + status + ", enteredDt=" + enteredDt + ", enteredBy=" + enteredBy
                + ", authDt=" + authDt + ", authBy=" + authBy + "]";
    }
    
}
