package model;

import java.util.List;

public class FDRenewalData {
    private String scenario;
    private AccMasterModel accDetails;
    private DepMaster depDetails;
    private List<LoanMaster> loanAccList;
    private TDSDetails tdsDetails;
    private RenewalDetails renewalDetails;
    private ModelOfTransferModel modeOfTransferDetails;
    private String payableAmount;
    private String totalPayableAmount;
    private String successMessag;
    private TransactionHeaderModel transHeader;
    private String cacheKey;
    private String renewalAccCacheKey;
    private DenominationModel denomModel;
    
    public DenominationModel getDenomModel() {
        return denomModel;
    }
    
    public void setDenomModel(DenominationModel denomModel) {
        this.denomModel = denomModel;
    }
    
    public String getRenewalAccCacheKey() {
        return renewalAccCacheKey;
    }
    
    public void setRenewalAccCacheKey(String renewalAccCacheKey) {
        this.renewalAccCacheKey = renewalAccCacheKey;
    }
    
    public String getCacheKey() {
        return cacheKey;
    }
    
    public void setCacheKey(String cacheKey) {
        this.cacheKey = cacheKey;
    }
    
    public TransactionHeaderModel getTransHeader() {
        return transHeader;
    }
    
    public void setTransHeader(TransactionHeaderModel transHeader) {
        this.transHeader = transHeader;
    }
    
    public String getSuccessMessag() {
        return successMessag;
    }
    
    public void setSuccessMessag(String successMessag) {
        this.successMessag = successMessag;
    }
    
    public String getTotalPayableAmount() {
        return totalPayableAmount;
    }
    
    public void setTotalPayableAmount(String totalPayableAmount) {
        this.totalPayableAmount = totalPayableAmount;
    }
    
    public String getScenario() {
        return scenario;
    }
    
    public void setScenario(String scenario) {
        this.scenario = scenario;
    }
    
    public String getPayableAmount() {
        return payableAmount;
    }
    
    public void setPayableAmount(String payableAmount) {
        this.payableAmount = payableAmount;
    }
    
    public DepMaster getDepDetails() {
        return depDetails;
    }
    
    public void setDepDetails(DepMaster depDetails) {
        this.depDetails = depDetails;
    }
    
    public List<LoanMaster> getLoanAccList() {
        return loanAccList;
    }
    
    public void setLoanAccList(List<LoanMaster> loanAccList) {
        this.loanAccList = loanAccList;
    }
    
    public TDSDetails getTdsDetails() {
        return tdsDetails;
    }
    
    public void setTdsDetails(TDSDetails tdsDetails) {
        this.tdsDetails = tdsDetails;
    }
    
    public RenewalDetails getRenewalDetails() {
        return renewalDetails;
    }
    
    public void setRenewalDetails(RenewalDetails renewalDetails) {
        this.renewalDetails = renewalDetails;
    }
    
    public ModelOfTransferModel getModeOfTransferDetails() {
        return modeOfTransferDetails;
    }
    
    public void setModeOfTransferDetails(ModelOfTransferModel modeOfTransferDetails) {
        this.modeOfTransferDetails = modeOfTransferDetails;
    }
    
    public AccMasterModel getAccDetails() {
        return accDetails;
    }
    
    public void setAccDetails(AccMasterModel accDetails) {
        this.accDetails = accDetails;
    }
    
    @Override
    public String toString() {
        return "FDRenewalData [scenario=" + scenario + ", accDetails=" + accDetails + ", depDetails=" + depDetails
                + ", loanAccList=" + loanAccList + ", tdsDetails=" + tdsDetails + ", renewalDetails=" + renewalDetails
                + ", modeOfTransferDetails=" + modeOfTransferDetails + ", payableAmount=" + payableAmount
                + ", totalPayableAmount=" + totalPayableAmount + ", successMessag=" + successMessag + ", transHeader="
                + transHeader + ", cacheKey=" + cacheKey + ", renewalAccCacheKey=" + renewalAccCacheKey
                + ", denomModel=" + denomModel + "]";
    }
    
}
