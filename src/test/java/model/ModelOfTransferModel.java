package model;

public class ModelOfTransferModel {
    
    private String paymentMode;
    private String tokenNo;
    private String remarks;
    private String transactionAmount;
    
    public String getPaymentMode() {
        return paymentMode;
    }
    
    public String getTransactionAmount() {
        return transactionAmount;
    }
    
    public void setTransactionAmount(String transactionAmount) {
        this.transactionAmount = transactionAmount;
    }
    
    public void setPaymentMode(String paymentMode) {
        this.paymentMode = paymentMode;
    }
    
    public String getTokenNo() {
        return tokenNo;
    }
    
    public void setTokenNo(String tokenNo) {
        this.tokenNo = tokenNo;
    }
    
    public String getRemarks() {
        return remarks;
    }
    
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    
    @Override
    public String toString() {
        return "ModelOfTransferModel [paymentMode=" + paymentMode + ", tokenNo=" + tokenNo + ", remarks=" + remarks
                + ", transactionAmount=" + transactionAmount + "]";
    }
    
}
