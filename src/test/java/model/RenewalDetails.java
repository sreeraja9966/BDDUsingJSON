package model;

public class RenewalDetails {
    private String renewalProduct;
    private String renewalAmount;
    private String renewalWith;
    private String renewaDate;
    private String renewalPeriodInMonths;
    private String renewalPeriodInDays;
    private String renewalROI;
    private String renewalAdtionalROI;
    private String renewalMatAmt;
    private String renewalMatDate;
    
    public String getRenewalProduct() {
        return renewalProduct;
    }
    
    public void setRenewalProduct(String renewalProduct) {
        this.renewalProduct = renewalProduct;
    }
    
    public String getRenewalAmount() {
        return renewalAmount;
    }
    
    public void setRenewalAmount(String renewalAmount) {
        this.renewalAmount = renewalAmount;
    }
    
    public String getRenewalWith() {
        return renewalWith;
    }
    
    public void setRenewalWith(String renewalWith) {
        this.renewalWith = renewalWith;
    }
    
    public String getRenewaDate() {
        return renewaDate;
    }
    
    public void setRenewaDate(String renewaDate) {
        this.renewaDate = renewaDate;
    }
    
    public String getRenewalPeriodInMonths() {
        return renewalPeriodInMonths;
    }
    
    public void setRenewalPeriodInMonths(String renewalPeriodInMonths) {
        this.renewalPeriodInMonths = renewalPeriodInMonths;
    }
    
    public String getRenewalPeriodInDays() {
        return renewalPeriodInDays;
    }
    
    public void setRenewalPeriodInDays(String renewalPeriodInDays) {
        this.renewalPeriodInDays = renewalPeriodInDays;
    }
    
    public String getRenewalROI() {
        return renewalROI;
    }
    
    public void setRenewalROI(String renewalROI) {
        this.renewalROI = renewalROI;
    }
    
    public String getRenewalAdtionalROI() {
        return renewalAdtionalROI;
    }
    
    public void setRenewalAdtionalROI(String renewalAdtionalROI) {
        this.renewalAdtionalROI = renewalAdtionalROI;
    }
    
    public String getRenewalMatAmt() {
        return renewalMatAmt;
    }
    
    public void setRenewalMatAmt(String renewalMatAmt) {
        this.renewalMatAmt = renewalMatAmt;
    }
    
    public String getRenewalMatDate() {
        return renewalMatDate;
    }
    
    public void setRenewalMatDate(String renewalMatDate) {
        this.renewalMatDate = renewalMatDate;
    }
    
    @Override
    public String toString() {
        return "RenewalDetails [renewalProduct=" + renewalProduct + ", renewalAmount=" + renewalAmount
                + ", renewalWith=" + renewalWith + ", renewaDate=" + renewaDate + ", renewalPeriodInMonths="
                + renewalPeriodInMonths + ", renewalPeriodInDays=" + renewalPeriodInDays + ", renewalROI=" + renewalROI
                + ", renewalAdtionalROI=" + renewalAdtionalROI + ", renewalMatAmt=" + renewalMatAmt
                + ", renewalMatDate=" + renewalMatDate + "]";
    }
    
}
