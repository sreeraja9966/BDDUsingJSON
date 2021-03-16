package model;

import java.util.List;

public class LienNotingData {
    private String scenario;
    private List<LoanMaster> loanAccList;
    private List<DepMaster> depAccNoList;
    private String successMessage;
    private String validationMessage;
    
    public String getScenario() {
        return scenario;
    }
    
    public void setScenario(String scenario) {
        this.scenario = scenario;
    }
    
    public List<LoanMaster> getLoanAccList() {
        return loanAccList;
    }
    
    public void setLoanAccList(List<LoanMaster> loanAccList) {
        this.loanAccList = loanAccList;
    }
    
    public List<DepMaster> getDepAccNoList() {
        return depAccNoList;
    }
    
    public void setDepAccNoList(List<DepMaster> depAccNoList) {
        this.depAccNoList = depAccNoList;
    }
    
    public String getSuccessMessage() {
        return successMessage;
    }
    
    public void setSuccessMessage(String successMessage) {
        this.successMessage = successMessage;
    }
    
    public String getValidationMessage() {
        return validationMessage;
    }
    
    public void setValidationMessage(String validationMessage) {
        this.validationMessage = validationMessage;
    }
    
    @Override
    public String toString() {
        return "LienNotingData [scenario=" + scenario + ", loanAccList=" + loanAccList + ", depAccNoList="
                + depAccNoList + ", successMessage=" + successMessage + ", validationMessage=" + validationMessage
                + "]";
    }
    
}
