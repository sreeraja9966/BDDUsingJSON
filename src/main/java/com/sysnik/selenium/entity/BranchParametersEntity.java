package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity

@Table(name = "BRANCHPARAMETERS")


public class BranchParametersEntity  {
    
   
    @Id
    @Column(name = "BANKCODE", length = 20, nullable = false)
    private String bankCode;
    
    
    @Column(name = "BRANCHCODE", length = 20, nullable = false)
    private String branchCode;
    
    @Column(name = "BRANCHNAME", length = 50, nullable = false)
    private String branchName;
    
    @Column(name = "ADDRESS1", length = 100, nullable = false)
    private String address1;
    
    @Column(name = "ADDRESS2", length = 100, nullable = false)
    private String address2;
    
    @Column(name = "CITY", length = 8, nullable = false)
    private String city;
    
    @Column(name = "PINCODE", length = 8, nullable = false)
    private String pincode;
    
    @Column(name = "STATE", length = 8, nullable = false)
    private String state;
    
    @Column(name = "COUNTRY", length = 8, nullable = false)
    private String country;
    
    @Column(name = "PHONENUMBER", length = 12)
    private int phoneNumber;
    
    @Column(name = "FAXNUMBER", length = 12)
    private int FaxNumber;
    
    @Column(name = "EMAILID", length = 30)
    private String emailId;
    
    @Column(name = "RBILICENCENO", length = 30)
    private String rbiLicenceNo;
    
    @Column(name = "MICRCODE", length = 20, nullable = false)
    private String micrCode;
    
    @Column(name = "PAN", length = 20)
    private String pan;
    
    @Column(name = "TAN", length = 20)
    private String tan;
    
    @Column(name = "DATEOFINCEPTION")
    private Date dateOfInception;
    
    @Column(name = "NOOFUSERS", length = 4)
    private int noOfUsers;
    
    @Column(name = "BRANCHGL", length = 20, nullable = false)
    private String branchGl;
    
    @Column(name = "HOGL", length = 20, nullable = false)
    private String hoGl;
    
    @Column(name = "WEEKLYOFF1")
    private Integer weeklyOff1;
    
    @Column(name = "WEEKLYOFF2")
    private Integer weeklyOff2;
    
    @Column(name = "WEEKLYOFF_TYPE1", length = 1)
    private String weeklyOffType1;
    
    @Column(name = "WEEKLYOFF_TYPE2", length = 1)
    private String weeklyOffType2;
    
    @Column(name = "CLOSEDAYTRANSYN", length = 1, nullable = false)
    private String closeDayTransYN;
    
    @Column(name = "MAKERCHECKER", length = 1, nullable = false)
    private String makerChecker;
    
    @Column(name = "CUSTAUTH", length = 1, nullable = false)
    private String custAuth;
    
    @Column(name = "ACCAUTH", length = 1, nullable = false)
    private String accAuth;
    
    @Column(name = "LASTCUSTID", length = 20)
    private String lastCustId;
    
    @Column(name = "BRANCHLIVEDATE")
    private Date branchLiveDate;
    
    @Column(name = "GSTINCODE", length = 20)
    private String gstInCode;
    
    @Column(name = "CURRENT_DT", nullable = false)
    private Date currentDate;
    
    @Column(name = "IFS_CODE", length = 11)
    private String ifs_Code;
    
    @Column(name = "STATUS", length = 1, nullable = false)
    private String status;
    
    @Column(name = "CHEQUE_STALE_PERIOD")
    private Integer chequeStalePeriod;
    
    @Column(name = "AUTO_AUTH")
    private String autoAuth;
    
    @Column(name = "GO_BY_LEVEL")
    private String goByLevel;
    
    @Column(name = "TOKEN_IMPLEMENTED", length = 1, nullable = false)
    private String tokenImplemented;
    
    @Column(name = "DENOM_YN", length = 1, nullable = false)
    private String denominationYN;
    
    @Column(name = "REM_ALLWD", length = 1, nullable = false)
    private String remAllwdYN;
    
    @Column(name = "IBT_TRANSCODE", length = 20)
    private String ibtTranscode;
    
    @Column(name = "TRANSCODE_HO", length = 20)
    private String tranCodeHO;
    
    @Column(name = "NETWORK", length = 20)
    private String network;
    
    @Column(name = "BRANCH_CLOSE_STATUS", length = 20)
    private String branchCloseStatus;
    
    @Column(name = "DAYEND_STATUS", length = 20)
    private String dayEndStatus;
    
    @Column(name = "CITY_CODE", length = 4, nullable = true)
    private String cityCode;
    
    @Column(name = "AUTORENEW", length = 1)
    private String autorenew;
    
    @Column(name = "RENEW_ACC_WITH_OLD_NEW", length = 1)
    private String renewAccWithOldNew;
    
    @Column(name = "FORCE_DAYEND_YN")
    private String forceDayEndYN;
    
    public String getRenewAccWithOldNew() {
        return renewAccWithOldNew;
    }
    
    public void setRenewAccWithOldNew(String renewAccWithOldNew) {
        this.renewAccWithOldNew = renewAccWithOldNew;
    }
    
    public String getAutorenew() {
        return autorenew;
    }
    
    public void setAutorenew(String autorenew) {
        this.autorenew = autorenew;
    }
    
    public String getIbtTranscode() {
        return ibtTranscode;
    }
    
    public void setIbtTranscode(String ibtTranscode) {
        this.ibtTranscode = ibtTranscode;
    }
    
    public String getTranCodeHO() {
        return tranCodeHO;
    }
    
    public void setTranCodeHO(String tranCodeHO) {
        this.tranCodeHO = tranCodeHO;
    }
    
    public String getAutoAuth() {
        return autoAuth;
    }
    
    public void setAutoAuth(String autoAuth) {
        this.autoAuth = autoAuth;
    }
    
    public String getGoByLevel() {
        return goByLevel;
    }
    
    public void setGoByLevel(String goByLevel) {
        this.goByLevel = goByLevel;
    }
    
    public String getBankCode() {
        return bankCode;
    }
    
    public void setBankCode(String bankCode) {
        this.bankCode = bankCode;
    }
    
    public String getBranchCode() {
        return branchCode;
    }
    
    public void setBranchCode(String branchCode) {
        this.branchCode = branchCode;
    }
    
    public String getBranchName() {
        return branchName;
    }
    
    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }
    
    public String getAddress1() {
        return address1;
    }
    
    public void setAddress1(String address1) {
        this.address1 = address1;
    }
    
    public String getAddress2() {
        return address2;
    }
    
    public void setAddress2(String address2) {
        this.address2 = address2;
    }
    
    public String getCity() {
        return city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }
    
    public String getPincode() {
        return pincode;
    }
    
    public void setPincode(String pincode) {
        this.pincode = pincode;
    }
    
    public String getState() {
        return state;
    }
    
    public void setState(String state) {
        this.state = state;
    }
    
    public String getCountry() {
        return country;
    }
    
    public void setCountry(String country) {
        this.country = country;
    }
    
    public int getPhoneNumber() {
        return phoneNumber;
    }
    
    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    public int getFaxNumber() {
        return FaxNumber;
    }
    
    public void setFaxNumber(int faxNumber) {
        FaxNumber = faxNumber;
    }
    
    public String getEmailId() {
        return emailId;
    }
    
    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }
    
    public String getRbiLicenceNo() {
        return rbiLicenceNo;
    }
    
    public void setRbiLicenceNo(String rbiLicenceNo) {
        this.rbiLicenceNo = rbiLicenceNo;
    }
    
    public String getMicrCode() {
        return micrCode;
    }
    
    public void setMicrCode(String micrCode) {
        this.micrCode = micrCode;
    }
    
    public String getPan() {
        return pan;
    }
    
    public void setPan(String pan) {
        this.pan = pan;
    }
    
    public String getTan() {
        return tan;
    }
    
    public void setTan(String tan) {
        this.tan = tan;
    }
    
    public Date getDateOfInception() {
        return dateOfInception;
    }
    
    public void setDateOfInception(Date dateOfInception) {
        this.dateOfInception = dateOfInception;
    }
    
    public int getNoOfUsers() {
        return noOfUsers;
    }
    
    public void setNoOfUsers(int noOfUsers) {
        this.noOfUsers = noOfUsers;
    }
    
    public String getBranchGl() {
        return branchGl;
    }
    
    public void setBranchGl(String branchGl) {
        this.branchGl = branchGl;
    }
    
    public String getHoGl() {
        return hoGl;
    }
    
    public void setHoGl(String hoGl) {
        this.hoGl = hoGl;
    }
    
    public Integer getWeeklyOff1() {
        return weeklyOff1;
    }
    
    public void setWeeklyOff1(Integer weeklyOff1) {
        this.weeklyOff1 = weeklyOff1;
    }
    
    public Integer getWeeklyOff2() {
        return weeklyOff2;
    }
    
    public void setWeeklyOff2(Integer weeklyOff2) {
        this.weeklyOff2 = weeklyOff2;
    }
    
    public String getWeeklyOffType1() {
        return weeklyOffType1;
    }
    
    public void setWeeklyOffType1(String weeklyOffType1) {
        this.weeklyOffType1 = weeklyOffType1;
    }
    
    public String getWeeklyOffType2() {
        return weeklyOffType2;
    }
    
    public void setWeeklyOffType2(String weeklyOffType2) {
        this.weeklyOffType2 = weeklyOffType2;
    }
    
    public String getCloseDayTransYN() {
        return closeDayTransYN;
    }
    
    public void setCloseDayTransYN(String closeDayTransYN) {
        this.closeDayTransYN = closeDayTransYN;
    }
    
    public String getMakerChecker() {
        return makerChecker;
    }
    
    public void setMakerChecker(String makerChecker) {
        this.makerChecker = makerChecker;
    }
    
    public String getCustAuth() {
        return custAuth;
    }
    
    public void setCustAuth(String custAuth) {
        this.custAuth = custAuth;
    }
    
    public String getAccAuth() {
        return accAuth;
    }
    
    public void setAccAuth(String accAuth) {
        this.accAuth = accAuth;
    }
    
    public String getLastCustId() {
        return lastCustId;
    }
    
    public void setLastCustId(String lastCustId) {
        this.lastCustId = lastCustId;
    }
    
    public Date getBranchLiveDate() {
        return branchLiveDate;
    }
    
    public void setBranchLiveDate(Date branchLiveDate) {
        this.branchLiveDate = branchLiveDate;
    }
    
    public String getGstInCode() {
        return gstInCode;
    }
    
    public void setGstInCode(String gstInCode) {
        this.gstInCode = gstInCode;
    }
    
    public Date getCurrentDate() {
        return currentDate;
    }
    
    public void setCurrentDate(Date currentDate) {
        this.currentDate = currentDate;
    }
    
    public String getIfs_Code() {
        return ifs_Code;
    }
    
    public void setIfs_Code(String ifs_Code) {
        this.ifs_Code = ifs_Code;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public Integer getChequeStalePeriod() {
        return chequeStalePeriod;
    }
    
    public void setChequeStalePeriod(Integer chequeStalePeriod) {
        this.chequeStalePeriod = chequeStalePeriod;
    }
    
    public String getTokenImplemented() {
        return tokenImplemented;
    }
    
    public void setTokenImplemented(String tokenImplemented) {
        this.tokenImplemented = tokenImplemented;
    }
    
    public String getDenominationYN() {
        return denominationYN;
    }
    
    public void setDenominationYN(String denominationYN) {
        this.denominationYN = denominationYN;
    }
    
    public String getRemAllwdYN() {
        return remAllwdYN;
    }
    
    public void setRemAllwdYN(String remAllwdYN) {
        this.remAllwdYN = remAllwdYN;
    }
    
    public String getNetwork() {
        return network;
    }
    
    public void setNetwork(String network) {
        this.network = network;
    }
    
    public String getBranchCloseStatus() {
        return branchCloseStatus;
    }
    
    public void setBranchCloseStatus(String branchCloseStatus) {
        this.branchCloseStatus = branchCloseStatus;
    }
    
    public String getDayEndStatus() {
        return dayEndStatus;
    }
    
    public void setDayEndStatus(String dayEndStatus) {
        this.dayEndStatus = dayEndStatus;
    }
    
    public String getCityCode() {
        return cityCode;
    }
    
    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }
    
    public String getForceDayEndYN() {
        return forceDayEndYN;
    }
    
    public void setForceDayEndYN(String forceDayEndYN) {
        this.forceDayEndYN = forceDayEndYN;
    }
    
    @Override
    public String toString() {
        return "BranchParametersEntity [bankCode=" + bankCode + ", branchCode=" + branchCode + ", branchName="
                + branchName + ", address1=" + address1 + ", address2=" + address2 + ", city=" + city + ", pincode="
                + pincode + ", state=" + state + ", country=" + country + ", phoneNumber=" + phoneNumber
                + ", FaxNumber=" + FaxNumber + ", emailId=" + emailId + ", rbiLicenceNo=" + rbiLicenceNo + ", micrCode="
                + micrCode + ", pan=" + pan + ", tan=" + tan + ", dateOfInception=" + dateOfInception + ", noOfUsers="
                + noOfUsers + ", branchGl=" + branchGl + ", hoGl=" + hoGl + ", weeklyOff1=" + weeklyOff1
                + ", weeklyOff2=" + weeklyOff2 + ", weeklyOffType1=" + weeklyOffType1 + ", weeklyOffType2="
                + weeklyOffType2 + ", closeDayTransYN=" + closeDayTransYN + ", makerChecker=" + makerChecker
                + ", custAuth=" + custAuth + ", accAuth=" + accAuth + ", lastCustId=" + lastCustId + ", branchLiveDate="
                + branchLiveDate + ", gstInCode=" + gstInCode + ", currentDate=" + currentDate + ", ifs_Code="
                + ifs_Code + ", status=" + status + ", chequeStalePeriod=" + chequeStalePeriod + ", autoAuth="
                + autoAuth + ", goByLevel=" + goByLevel + ", tokenImplemented=" + tokenImplemented + ", denominationYN="
                + denominationYN + ", remAllwdYN=" + remAllwdYN + ", ibtTranscode=" + ibtTranscode + ", tranCodeHO="
                + tranCodeHO + ", network=" + network + ", branchCloseStatus=" + branchCloseStatus + ", dayEndStatus="
                + dayEndStatus + ", cityCode=" + cityCode + ", autorenew=" + autorenew + ", renewAccWithOldNew="
                + renewAccWithOldNew + ", forceDayEndYN=" + forceDayEndYN + "]";
    }
    
}
