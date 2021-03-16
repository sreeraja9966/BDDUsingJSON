package com.sysnik.selenium.entity;

import java.math.BigInteger;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "CHEQUE_BOOK_REQUEST")

public class ChequeBookRequestEntity {
    
    @Id
    @Column(name = "ID", nullable = false, unique = true)
    private int id;
    
    @Column(name = "ACC_ID")
    
    private BigInteger accID;
    
    public void setAccID(BigInteger accID) {
        this.accID = accID;
    }
    
    @Column(name = "SOURCE")
    
    private String source;
    
    @Column(name = "RECEIVED_DT")
    
    @CreationTimestamp
    private Date receivedTime;
    
    @Column(name = "NO_OF_LEAVES")
    private Integer numberOfLeaves;
    
    @Column(name = "NO_OF_BOOKS")
    private Integer numberOfBooks;
    
    @Column(name = "STATUS")
    private String status;
    
    @Column(name = "MODE_OF_DELIVERY")
    
    private String modeOfDelivery;
    
    @Column(name = "TERMINAL_ID")
    
    private String terminalId;
    
    @Column(name = "SERVICE_DT")
    // @Temporal(TemporalType.DATE)
    // @JsonFormat(pattern = "yyyy/MM/dd")
    private Date dateOfService;
    
    @Column(name = "REJECTION_DT")
    // @Temporal(TemporalType.TIMESTAMP)
    // @JsonFormat(pattern = "yyyy/MM/dd hh:mm:ss")
    private Date dateOfRejection;
    
    @Column(name = "REASON_FOR_REJECTION")
    private String reasonForRejection;
    
    @Column(name = "UPDATED_BY")
    private BigInteger updatedBy;
    
    @Column(name = "INST_TYPE")
    private String instType;
    
    public String getInstType() {
        return instType;
    }
    
    public void setInstType(String instType) {
        this.instType = instType;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getSource() {
        return source;
    }
    
    public void setSource(String source) {
        this.source = source;
    }
    
    public Date getReceivedTime() {
        return receivedTime;
    }
    
    public void setReceivedTime(Date receivedTime) {
        this.receivedTime = receivedTime;
    }
    
    public Integer getNumberOfLeaves() {
        return numberOfLeaves;
    }
    
    public void setNumberOfLeaves(Integer numberOfLeaves) {
        this.numberOfLeaves = numberOfLeaves;
    }
    
    public Integer getNumberOfBooks() {
        return numberOfBooks;
    }
    
    public void setNumberOfBooks(Integer numberOfBooks) {
        this.numberOfBooks = numberOfBooks;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getModeOfDelivery() {
        return modeOfDelivery;
    }
    
    public void setModeOfDelivery(String modeOfDelivery) {
        this.modeOfDelivery = modeOfDelivery;
    }
    
    public String getTerminalId() {
        return terminalId;
    }
    
    public void setTerminalId(String terminalId) {
        this.terminalId = terminalId;
    }
    
    public Date getDateOfService() {
        return dateOfService;
    }
    
    public void setDateOfService(Date dateOfService) {
        this.dateOfService = dateOfService;
    }
    
    public Date getDateOfRejection() {
        return dateOfRejection;
    }
    
    public void setDateOfRejection(Date dateOfRejection) {
        this.dateOfRejection = dateOfRejection;
    }
    
    public String getReasonForRejection() {
        return reasonForRejection;
    }
    
    public void setReasonForRejection(String reasonForRejection) {
        this.reasonForRejection = reasonForRejection;
    }
    
    public BigInteger getUpdatedBy() {
        return updatedBy;
    }
    
    public void setUpdatedBy(BigInteger updatedBy) {
        this.updatedBy = updatedBy;
    }
    
    public BigInteger getAccID() {
        return accID;
    }
    
    public ChequeBookRequestEntity() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public ChequeBookRequestEntity(int id, BigInteger accID, String source, Date receivedTime,
            Integer numberOfLeaves, Integer numberOfBooks, String status, String modeOfDelivery, String terminalId,
            Date dateOfService, Date dateOfRejection, String reasonForRejection, BigInteger updatedBy,
            String instType) {
        super();
        this.id = id;
        this.accID = accID;
        this.source = source;
        this.receivedTime = receivedTime;
        this.numberOfLeaves = numberOfLeaves;
        this.numberOfBooks = numberOfBooks;
        this.status = status;
        this.modeOfDelivery = modeOfDelivery;
        this.terminalId = terminalId;
        this.dateOfService = dateOfService;
        this.dateOfRejection = dateOfRejection;
        this.reasonForRejection = reasonForRejection;
        this.updatedBy = updatedBy;
        this.instType = instType;
    }
    
}
