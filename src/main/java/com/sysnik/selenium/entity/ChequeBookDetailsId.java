package com.sysnik.selenium.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ChequeBookDetailsId implements Serializable {
    @Column(name = "CHEQUE_BOOK_ID")
    int cheqbookId;
    
    @Column(name = "INSTR_NO")
    int instNo;
    
    public int getCheqbookId() {
        return cheqbookId;
    }
    
    public void setCheqbookId(int cheqbookId) {
        this.cheqbookId = cheqbookId;
    }
    
    public int getInstNo() {
        return instNo;
    }
    
    public void setInstNo(int instNo) {
        this.instNo = instNo;
    }
    
}
