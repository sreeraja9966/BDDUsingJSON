package model;

public class AccMasterModel {
    private String accNo;
    private String availableBal;
    
    public String getAvailableBal() {
        return availableBal;
    }
    
    public void setAvailableBal(String availableBal) {
        this.availableBal = availableBal;
    }
    
    public String getAccNo() {
        return accNo;
    }
    
    public void setAccNo(String accNo) {
        this.accNo = accNo;
    }
    
    @Override
    public String toString() {
        return "AccMasterModel [accNo=" + accNo + ", availableBal=" + availableBal + "]";
    }
    
}
