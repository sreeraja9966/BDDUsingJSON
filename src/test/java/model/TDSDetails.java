package model;

public class TDSDetails {
    private String tdsDeducted;
    private String tdsAmount;
    private String tdsRecovery;
    private String tdsPayable;
    private String tdsRecoverable;
    
    public String gettdsDeducted() {
        return tdsDeducted;
    }
    
    public void settdsDeducted(String tdsDeducted) {
        this.tdsDeducted = tdsDeducted;
    }
    
    public String getTdsAmount() {
        return tdsAmount;
    }
    
    public void setTdsAmount(String tdsAmount) {
        this.tdsAmount = tdsAmount;
    }
    
    public String getTdsRecovery() {
        return tdsRecovery;
    }
    
    public void setTdsRecovery(String tdsRecovery) {
        this.tdsRecovery = tdsRecovery;
    }
    
    public String getTdsPayable() {
        return tdsPayable;
    }
    
    public void setTdsPayable(String tdsPayable) {
        this.tdsPayable = tdsPayable;
    }
    
    public String getTdsRecoverable() {
        return tdsRecoverable;
    }
    
    public void setTdsRecoverable(String tdsRecoverable) {
        this.tdsRecoverable = tdsRecoverable;
    }
    
    @Override
    public String toString() {
        return "tdsDeducted [tdsDeducted=" + tdsDeducted + ", tdsAmount=" + tdsAmount + ", tdsRecovery=" + tdsRecovery
                + ", tdsPayable=" + tdsPayable + ", tdsRecoverable=" + tdsRecoverable + "]";
    }
    
}