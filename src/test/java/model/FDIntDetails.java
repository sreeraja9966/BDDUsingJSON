package model;

public class FDIntDetails {
    private String depositAmount;
    private String interestDate;
    private String interestAmount;
    
    public String getDepositAmount() {
        return depositAmount;
    }
    
    public void setDepositAmount(String depositAmount) {
        this.depositAmount = depositAmount;
    }
    
    public String getInterestDate() {
        return interestDate;
    }
    
    public void setInterestDate(String interestDate) {
        this.interestDate = interestDate;
    }
    
    public String getInterestAmount() {
        return interestAmount;
    }
    
    public void setInterestAmount(String interestAmount) {
        this.interestAmount = interestAmount;
    }
    
    @Override
    public String toString() {
        return "FDIntDetails [depositAmount=" + depositAmount + ", interestDate=" + interestDate + ", interestAmount="
                + interestAmount + "]";
    }
    
}
