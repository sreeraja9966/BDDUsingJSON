package model;

public class LoanMaster {
    private String loanAccNo;
    private String availableBal;
    
    @Override
    public String toString() {
        return "Acc [loanAccNo=" + loanAccNo + ", availableBal=" + availableBal + "]";
    }
    
    public String getloanAccNo() {
        return loanAccNo;
    }
    
    public void setloanAccNo(String loanAccNo) {
        this.loanAccNo = loanAccNo;
    }
    
    public String getAvailableBal() {
        return availableBal;
    }
    
    public void setAvailableBal(String availableBal) {
        this.availableBal = availableBal;
    }
    
}
