package com.sysnik.selenium.entity;

import java.io.Serializable;
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
@Table(name = "MODIFICATION_AUDIT_LOG")
public class ModificationAuditLogEntity implements Serializable {
    
    private static final long serialVersionUID = 6454172951195420782L;
    
    public ModificationAuditLogEntity() {
        super();
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "mod_aud_gen")
    @SequenceGenerator(name = "mod_aud_gen", sequenceName = "modification_audit_log_seq", allocationSize = 1)
    @Column(name = "id", length = 10, nullable = false)
    private Long id;
    
    @Column(name = "bank_code", length = 20, nullable = false)
    private String bankCode;
    
    @Column(name = "user_id", length = 20, nullable = false)
    private String user_id;
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "effective_date", nullable = false)
    private Date effectiveDate;
    
    @Column(name = "account_cust_id", length = 20, nullable = true)
    private Long accountCustId;
    
    @Column(name = "trans_code", length = 12, nullable = false)
    private String transCode;
    
    @Column(name = "table_name", length = 30, nullable = false)
    private String tableName;
    
    @Column(name = "column_name", length = 30, nullable = false)
    private String columnName;
    
    @Column(name = "old_value", length = 50, nullable = false)
    private String oldValue;
    
    @Column(name = "new_value", length = 50, nullable = false)
    private String newValue;
    
    @Column(name = "modified_by", length = 20, nullable = false)
    private String modifiedBy;
    
    @Column(name = "modified_ip", length = 23, nullable = false)
    private String modifiedIp;
    
    @Column(name = "auth_by", length = 20, nullable = true)
    private String AuthBy;
    
    @Column(name = "auth_ip", length = 23, nullable = true)
    private String AuthIp;
    
    @Column(name = "status", length = 1, nullable = false)
    private String Status;
    
    @Column(name = "MODIFIED_BRANCH", nullable = true, length = 20)
    private String modifiedBranch;
    
    public Long getId() {
        return id;
    }
    
    public String getBankCode() {
        return bankCode;
    }
    
    public String getUser_id() {
        return user_id;
    }
    
    public Date getEffectiveDate() {
        return effectiveDate;
    }
    
    public String getTransCode() {
        return transCode;
    }
    
    public String getTableName() {
        return tableName;
    }
    
    public String getColumnName() {
        return columnName;
    }
    
    public String getOldValue() {
        return oldValue;
    }
    
    public String getNewValue() {
        return newValue;
    }
    
    public String getModifiedBy() {
        return modifiedBy;
    }
    
    public String getModifiedIp() {
        return modifiedIp;
    }
    
    public String getAuthBy() {
        return AuthBy;
    }
    
    public String getAuthIp() {
        return AuthIp;
    }
    
    public String getStatus() {
        return Status;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    
    public void setEffectiveDate(Date effectiveDate) {
        this.effectiveDate = effectiveDate;
    }
    
    public Long getAccountCustId() {
        return accountCustId;
    }
    
    public void setAccountCustId(Long accountCustId) {
        this.accountCustId = accountCustId;
    }
    
    public void setTransCode(String transCode) {
        this.transCode = transCode;
    }
    
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
    
    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }
    
    public void setOldValue(String oldValue) {
        this.oldValue = oldValue;
    }
    
    public void setNewValue(String newValue) {
        this.newValue = newValue;
    }
    
    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
    
    public void setModifiedIp(String modifiedIp) {
        this.modifiedIp = modifiedIp;
    }
    
    public void setAuthBy(String authBy) {
        AuthBy = authBy;
    }
    
    public void setAuthIp(String authIp) {
        AuthIp = authIp;
    }
    
    public void setStatus(String status) {
        Status = status;
    }
    
    public String getModifiedBranch() {
        return modifiedBranch;
    }
    
    public void setModifiedBranch(String modifiedBranch) {
        this.modifiedBranch = modifiedBranch;
    }
    
}
