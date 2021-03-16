package model;

import java.util.List;

public class FdAccountOpeningData {
    private String scenario;
    private Product productDetails;
    private Cust custDetails;
    private String natureOfAcc;
    private List<OtherOperatorDetails> otherOperatorDetails;
    private String operatingInst;
    private DepMaster depDetails;
    private String autoRenewal;
    private String creditAccountNoForAutoRenewal;
    private String autoRenewalWithInt;
    
    private String smsFacility;
    private String emailFacility;
    private String sucessMessage;
    private List<FDIntDetails> fdIntDetails;
    
    public String getScenario() {
        return scenario;
    }
    
    public void setScenario(String scenario) {
        this.scenario = scenario;
    }
    
    public Product getProductDetails() {
        return productDetails;
    }
    
    public void setProductDetails(Product productDetails) {
        this.productDetails = productDetails;
    }
    
    public Cust getCustDetails() {
        return custDetails;
    }
    
    public void setCustDetails(Cust custDetails) {
        this.custDetails = custDetails;
    }
    
    public String getNatureOfAcc() {
        return natureOfAcc;
    }
    
    public void setNatureOfAcc(String natureOfAcc) {
        this.natureOfAcc = natureOfAcc;
    }
    
    public List<OtherOperatorDetails> getOtherOperatorDetails() {
        return otherOperatorDetails;
    }
    
    public void setOtherOperatorDetails(List<OtherOperatorDetails> otherOperatorDetails) {
        this.otherOperatorDetails = otherOperatorDetails;
    }
    
    public String getOperatingInst() {
        return operatingInst;
    }
    
    public void setOperatingInst(String operatingInst) {
        this.operatingInst = operatingInst;
    }
    
    public DepMaster getDepDetails() {
        return depDetails;
    }
    
    public void setDepDetails(DepMaster depDetails) {
        this.depDetails = depDetails;
    }
    
    public String getAutoRenewal() {
        return autoRenewal;
    }
    
    public void setAutoRenewal(String autoRenewal) {
        this.autoRenewal = autoRenewal;
    }
    
    public String getCreditAccountNoForAutoRenewal() {
        return creditAccountNoForAutoRenewal;
    }
    
    public void setCreditAccountNoForAutoRenewal(String creditAccountNoForAutoRenewal) {
        this.creditAccountNoForAutoRenewal = creditAccountNoForAutoRenewal;
    }
    
    public String getAutoRenewalWithInt() {
        return autoRenewalWithInt;
    }
    
    public void setAutoRenewalWithInt(String autoRenewalWithInt) {
        this.autoRenewalWithInt = autoRenewalWithInt;
    }
    
    public String getSmsFacility() {
        return smsFacility;
    }
    
    public void setSmsFacility(String smsFacility) {
        this.smsFacility = smsFacility;
    }
    
    public String getEmailFacility() {
        return emailFacility;
    }
    
    public void setEmailFacility(String emailFacility) {
        this.emailFacility = emailFacility;
    }
    
    public String getSucessMessage() {
        return sucessMessage;
    }
    
    public void setSucessMessage(String sucessMessage) {
        this.sucessMessage = sucessMessage;
    }
    
    public List<FDIntDetails> getFdIntDetails() {
        return fdIntDetails;
    }
    
    public void setFdIntDetails(List<FDIntDetails> fdIntDetails) {
        this.fdIntDetails = fdIntDetails;
    }
    
    @Override
    public String toString() {
        return "FdAccountOpeningData [scenario=" + scenario + ", productDetails=" + productDetails + ", custDetails="
                + custDetails + ", natureOfAcc=" + natureOfAcc + ", otherOperatorDetails=" + otherOperatorDetails
                + ", operatingInst=" + operatingInst + ", depDetails=" + depDetails + ", autoRenewal=" + autoRenewal
                + ", creditAccountNoForAutoRenewal=" + creditAccountNoForAutoRenewal + ", autoRenewalWithInt="
                + autoRenewalWithInt + ", smsFacility=" + smsFacility + ", emailFacility=" + emailFacility
                + ", sucessMessage=" + sucessMessage + ", fdIntDetails=" + fdIntDetails + "]";
    }
    
}
