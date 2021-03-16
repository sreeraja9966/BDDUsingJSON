package model;

public class DepMaster {
    private String intDue;
    private String intPaid;
    private String depAccNo;
    private String intCalType;
    private String depAmount;
    private String depPeriodInMnths;
    private String depPeriodInDays;
    private String intPaymentFreq;
    private String intType;
    private String ROI;
    private String matDate;
    private String matAmount;
    private String adtROI;
    private String monthlyOrQurtInt;
    private String ROIAfterMat;
    private String remaingIntAmt;
    private String afterMatint;
    private String intProvision;
    private String excessIntReceivable;
    private String totalIntPaid;
    
    public String getTotalIntPaid() {
        return totalIntPaid;
    }
    
    public void setTotalIntPaid(String totalIntPaid) {
        this.totalIntPaid = totalIntPaid;
    }
    
    public String getExcessIntReceivable() {
        return excessIntReceivable;
    }
    
    public void setExcessIntReceivable(String excessIntReceivable) {
        this.excessIntReceivable = excessIntReceivable;
    }
    
    public String getROIAfterMat() {
        return ROIAfterMat;
    }
    
    public void setROIAfterMat(String rOIAfterMat) {
        ROIAfterMat = rOIAfterMat;
    }
    
    public String getRemaingIntAmt() {
        return remaingIntAmt;
    }
    
    public void setRemaingIntAmt(String remaingIntAmt) {
        this.remaingIntAmt = remaingIntAmt;
    }
    
    public String getAfterMatint() {
        return afterMatint;
    }
    
    public void setAfterMatint(String afterMatint) {
        this.afterMatint = afterMatint;
    }
    
    public String getIntProvision() {
        return intProvision;
    }
    
    public void setIntProvision(String intProvision) {
        this.intProvision = intProvision;
    }
    
    public String getIntCap() {
        return intCap;
    }
    
    public void setIntCap(String intCap) {
        this.intCap = intCap;
    }
    
    public String getCashIntPayable() {
        return cashIntPayable;
    }
    
    public void setCashIntPayable(String cashIntPayable) {
        this.cashIntPayable = cashIntPayable;
    }
    
    private String intCap;
    private String cashIntPayable;
    
    public String getIntCalType() {
        return intCalType;
    }
    
    public void setIntCalType(String intCalType) {
        this.intCalType = intCalType;
    }
    
    public String getDepAmount() {
        return depAmount;
    }
    
    public void setDepAmount(String depAmount) {
        this.depAmount = depAmount;
    }
    
    public String getDepPeriodInMnths() {
        return depPeriodInMnths;
    }
    
    public void setDepPeriodInMnths(String depPeriodInMnths) {
        this.depPeriodInMnths = depPeriodInMnths;
    }
    
    public String getDepPeriodInDays() {
        return depPeriodInDays;
    }
    
    public void setDepPeriodInDays(String depPeriodInDays) {
        this.depPeriodInDays = depPeriodInDays;
    }
    
    public String getIntPaymentFreq() {
        return intPaymentFreq;
    }
    
    public void setIntPaymentFreq(String intPaymentFreq) {
        this.intPaymentFreq = intPaymentFreq;
    }
    
    public String getIntType() {
        return intType;
    }
    
    public void setIntType(String intType) {
        this.intType = intType;
    }
    
    public String getROI() {
        return ROI;
    }
    
    public void setROI(String rOI) {
        ROI = rOI;
    }
    
    public String getMatDate() {
        return matDate;
    }
    
    public void setMatDate(String matDate) {
        this.matDate = matDate;
    }
    
    public String getMatAmount() {
        return matAmount;
    }
    
    public void setMatAmount(String matAmount) {
        this.matAmount = matAmount;
    }
    
    public String getAdtROI() {
        return adtROI;
    }
    
    public void setAdtROI(String adtROI) {
        this.adtROI = adtROI;
    }
    
    public String getMonthlyOrQurtInt() {
        return monthlyOrQurtInt;
    }
    
    public void setMonthlyOrQurtInt(String monthlyOrQurtInt) {
        this.monthlyOrQurtInt = monthlyOrQurtInt;
    }
    
    private LienEnMarking lienDetails;
    
    public LienEnMarking getLienDetails() {
        return lienDetails;
    }
    
    public void setLienDetails(LienEnMarking lienDetails) {
        this.lienDetails = lienDetails;
    }
    
    public String getIntDue() {
        return intDue;
    }
    
    public void setIntDue(String intDue) {
        this.intDue = intDue;
    }
    
    public String getIntPaid() {
        return intPaid;
    }
    
    public void setIntPaid(String intPaid) {
        this.intPaid = intPaid;
    }
    
    public String getDepAccNo() {
        return depAccNo;
    }
    
    public void setDepAccNo(String depAccNo) {
        this.depAccNo = depAccNo;
    }
    
    @Override
    public String toString() {
        return "DepMaster [intDue=" + intDue + ", intPaid=" + intPaid + ", depAccNo=" + depAccNo + ", intCalType="
                + intCalType + ", depAmount=" + depAmount + ", depPeriodInMnths=" + depPeriodInMnths
                + ", depPeriodInDays=" + depPeriodInDays + ", intPaymentFreq=" + intPaymentFreq + ", intType=" + intType
                + ", ROI=" + ROI + ", matDate=" + matDate + ", matAmount=" + matAmount + ", adtROI=" + adtROI
                + ", monthlyOrQurtInt=" + monthlyOrQurtInt + ", ROIAfterMat=" + ROIAfterMat + ", remaingIntAmt="
                + remaingIntAmt + ", afterMatint=" + afterMatint + ", intProvision=" + intProvision
                + ", excessIntReceivable=" + excessIntReceivable + ", totalIntPaid=" + totalIntPaid + ", intCap="
                + intCap + ", cashIntPayable=" + cashIntPayable + ", lienDetails=" + lienDetails + "]";
    }
    
}
