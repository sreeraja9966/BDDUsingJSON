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
@Table(name = "LIEN_EARMARK")
public class LienEarMarkEntity implements Serializable {
    
    private static final long serialVersionUID = -9195178870962974538L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "LIEN_EARMARK_gen")
    @SequenceGenerator(name = "LIEN_EARMARK_gen", sequenceName = "LIEN_EARMARK_SEQ", allocationSize = 1)
    @Column(name = "ID", nullable = false, length = 10)
    private int id;
    
    @Column(name = "TYPE", nullable = false, length = 1)
    private String type;
    
    @Column(name = "DEPOSIT_ACC_ID", length = 20, nullable = false)
    private BigInteger depositAccId;
    
    @Column(name = "LIEN_AMT", precision = 17, scale = 2, nullable = false)
    private BigDecimal lienAmt;
    
    @Column(name = "LIEN_DATE", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date lienDate;
    
    @Column(name = "LIEN_NOTE_REMARK", length = 50)
    private String lienNoteRemarks;
    
    @Column(name = "LIEN_REVOKE_REMARK", length = 50)
    private String lienRevokeRemarks;
    
    @Column(name = "LOAN_ACC_ID", length = 20, nullable = false)
    private BigInteger loanAccId;
    
    @Column(name = "STATUS", nullable = false, length = 1)
    private String status;
    
    @Column(name = "RELEASE_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    
    private Date releaseDate;
    
    @Column(name = "ENTERED_BY", nullable = false, length = 20)
    private String enteredBy;
    
    @Column(name = "AUTH_BY", length = 20)
    private String authBy;
    
    @Column(name = "REL_BY", length = 20)
    private String relBy;
    
    @Column(name = "REL_AUTH_BY", length = 20)
    private String relAuthBy;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getType() {
        return type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    
    public BigInteger getDepositAccId() {
        return depositAccId;
    }
    
    public void setDepositAccId(BigInteger depositAccId) {
        this.depositAccId = depositAccId;
    }
    
    public BigDecimal getLienAmt() {
        return lienAmt;
    }
    
    public void setLienAmt(BigDecimal lienAmt) {
        this.lienAmt = lienAmt;
    }
    
    public Date getLienDate() {
        return lienDate;
    }
    
    public void setLienDate(Date lienDate) {
        this.lienDate = lienDate;
    }
    
    public String getLienNoteRemarks() {
        return lienNoteRemarks;
    }
    
    public void setLienNoteRemarks(String lienNoteRemarks) {
        this.lienNoteRemarks = lienNoteRemarks;
    }
    
    public String getLienRevokeRemarks() {
        return lienRevokeRemarks;
    }
    
    public void setLienRevokeRemarks(String lienRevokeRemarks) {
        this.lienRevokeRemarks = lienRevokeRemarks;
    }
    
    public BigInteger getLoanAccId() {
        return loanAccId;
    }
    
    public void setLoanAccId(BigInteger loanAccId) {
        this.loanAccId = loanAccId;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Date getReleaseDate() {
        return releaseDate;
    }
    
    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
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
    
    public String getRelBy() {
        return relBy;
    }
    
    public void setRelBy(String relBy) {
        this.relBy = relBy;
    }
    
    public String getRelAuthBy() {
        return relAuthBy;
    }
    
    public void setRelAuthBy(String relAuthBy) {
        this.relAuthBy = relAuthBy;
    }
}