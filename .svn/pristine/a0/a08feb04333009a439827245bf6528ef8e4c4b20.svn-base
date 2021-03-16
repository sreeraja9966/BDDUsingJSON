package com.sysnik.selenium.entity;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "cust_master")
public class CustomerMasterEntity {
    @Id
    
    @SequenceGenerator(name = "cust_mast_gen", sequenceName = "cust_master_seq", allocationSize = 1)
    @Column(name = "CUST_ID")
    private BigInteger custId;
    
    @Column(name = "GUARDIAN_ID")
    private BigInteger guardId;
    
    @Column(name = "DT_OF_BIRTH")
    
    private Date dob;
    
    @Column(name = "CUST_TYPE")
    private String custType;
    
    @Column(name = "STATUS")
    private String status;
    
    @Column(name = "MARITAL_STATUS")
    private String maritalStatus;
    
    @Column(name = "MINOR")
    private String minor;
    
    @Column(name = "BANK_CODE")
    private String bankCode;
    
    @Column(name = "BRANCH_CODE")
    private String branchCode;
    
    @Column(name = "CUST_NUMBER")
    private String custNumber;
    
    @Column(name = "CUST_NAME")
    private String custName;
    
    @Column(name = "CUST_FIRST_NAME")
    private String custFirstName;
    
    @Column(name = "CUST_MIDDLE_NAME")
    private String custMiddleName;
    
    @Column(name = "CUST_LAST_NAME")
    private String custLastName;
    
    /*
     * @Column(name = "CUST_CATEGORY") private String category;
     */
    
    @Column(name = "FATHER_SPOUSE_NAME")
    private String fatherSpouseName;
    
    @Column(name = "FATHER_SPOUSE_FNAME")
    private String fatherSpouseFname;
    
    @Column(name = "FATHER_SPOUSE_MNAME")
    private String fatherSpouseMname;
    
    @Column(name = "FATHER_SPOUSE_LNAME ")
    private String fatherSpouseLname;
    
    @Column(name = "CUST_NATIONAL_ID")
    private String custNationalId;
    
    @Column(name = "PAN_NO")
    private String panNo;
    
    @Column(name = "CKYC")
    private String ckyc;
    
    @Column(name = "CONSTITUTION")
    private String constitution;
    
    @Column(name = "GSTIN")
    private String gstin;
    
    @Column(name = "RELIGION")
    private String religion;
    
    @Column(name = "OCCUPATION")
    private String occupation;
    
    @Column(name = "EDU_QUALIFICATION")
    private String eduQualification;
    
    @Column(name = "BLOOD_GROUP")
    private String bloodGroup;
    
    @Column(name = "FORMS_60_61")
    private String forms6061;
    
    @Column(name = "RISK_GRADE")
    private String riskGrade;
    
    @Column(name = "MEMBERSHIP_TYPE")
    private String membershipType;
    
    @Column(name = "MEMBER_NUMBER")
    private String memberNumber;
    
    @Column(name = "GENDER")
    private String gender;
    
    @Column(name = "CUST_CATEGORY")
    private String custCategory;
    
    @Column(name = "CASTE")
    private String caste;
    
    @Column(name = "TDS_EXEMPTION")
    private String tdsExemption;
    
    @Column(name = "MEMBER")
    private String member;
    
    @Column(name = "INTRODUCER_IS_CUSTOMER")
    private String introducerIsCustomer;
    
    @Column(name = "INTRODUCER_NAME")
    private String introducerName;
    
    @Column(name = "INTRODUCER_CUSTOMER")
    private String introducerCustomer;
    
    @Column(name = "FREEZE")
    private String freeze;
    
    @Column(name = "ENTERED_BY", length = 10, nullable = false)
    private String enteredBy;
    
    @Column(name = "AUTH_BY", length = 10)
    private String authBy;
    
    @Column(name = "REJ_REASON", length = 50)
    private String reason;
    
    @Column(name = "PREFIX", length = 5)
    private String prefix;
    
    @Column(name = "F_PREFIX", length = 5)
    private String fPrefix;
    
    @Column(name = "MAIDEN_NAME", length = 50)
    private String maidenName;
    
    @Column(name = "RESIDENTIAL", length = 5)
    private String residential;
    
    @Column(name = "GROSSINCOME", length = 5)
    private String grossIncome;
    
    @Column(name = "EMPLOYER", length = 50)
    private String employerDetails;
    
    @Column(name = "DETAILS", length = 50)
    private String freelancerDetails;
    
    @Column(name = "FREEZE_UPTO")
    
    private Date freezeUpto;
    
    @Column(name = "EXPRESS_CUST_YN", length = 1)
    private String expressCustYN;
    
    @Column(name = "CREATION_DATE")
    
    private Date creationDate;
    
    @Column(name = "DOC_REVIEW_DATE")
    
    private Date docReviewDate;
    
    /*
     * @Column(name = "PARTOFF_DOB") private Date partOffDob;
     * 
     * @Column(name = "PARTOFF_CUST_ID") private BigInteger partOffCustId;
     * 
     * @Column(name = "ADDRESSPROOF") private Integer addressProof;
     * 
     * @Column(name = "DOCUMENTDETAILS") private String documentDetails;
     * 
     * @Column(name = "DATE_OF_ESTABLISHMENT") private Date dateOfEstablishement;
     */
    
    @Column(name = "TDS_EXMPT_RES_CD", length = 2)
    private String tdsExmptResCd;
    
    @Column(name = "ADDRESS_FOR_CORRESPONDENCE")
    private String addressForCorrespondence;
    
    @Column(name = "NATIONAL_ID")
    private String nationalId;
    
    public String getAddressForCorrespondence() {
        return addressForCorrespondence;
    }
    
    public void setAddressForCorrespondence(String addressForCorrespondence) {
        this.addressForCorrespondence = addressForCorrespondence;
    }
    
    public void setNationalId(String nationalId) {
        this.nationalId = nationalId;
    }
    
    public String getNationalId() {
        return nationalId;
    }
    
    public String getTdsExmptResCd() {
        return tdsExmptResCd;
    }
    
    public void setTdsExmptResCd(String tdsExmptResCd) {
        this.tdsExmptResCd = tdsExmptResCd;
    }
    
    public Date getCreationDate() {
        return creationDate;
    }
    
    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
    
    public Date getDocReviewDate() {
        return docReviewDate;
    }
    
    public void setDocReviewDate(Date docReviewDate) {
        this.docReviewDate = docReviewDate;
    }
    
    public String getPrefix() {
        return prefix;
    }
    
    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }
    
    public String getfPrefix() {
        return fPrefix;
    }
    
    public void setfPrefix(String fPrefix) {
        this.fPrefix = fPrefix;
    }
    
    public String getMaidenName() {
        return maidenName;
    }
    
    public void setMaidenName(String maidenName) {
        this.maidenName = maidenName;
    }
    
    public String getResidential() {
        return residential;
    }
    
    public void setResidential(String residential) {
        this.residential = residential;
    }
    
    public String getGrossIncome() {
        return grossIncome;
    }
    
    public void setGrossIncome(String grossIncome) {
        this.grossIncome = grossIncome;
    }
    
    public String getEmployerDetails() {
        return employerDetails;
    }
    
    public void setEmployerDetails(String employerDetails) {
        this.employerDetails = employerDetails;
    }
    
    public String getFreelancerDetails() {
        return freelancerDetails;
    }
    
    public void setFreelancerDetails(String freelancerDetails) {
        this.freelancerDetails = freelancerDetails;
    }
    
    public String getReason() {
        return reason;
    }
    
    public void setReason(String reason) {
        this.reason = reason;
    }
    
    public String getEnteredBy() {
        return enteredBy;
    }
    
    public void setEnteredBy(String enteredBy) {
        this.enteredBy = enteredBy;
    }
    
    public String getAuthBy() {
        return authBy;
    }
    
    public void setAuthBy(String authBy) {
        this.authBy = authBy;
    }
    
    @Column(name = "FIN_YEAR_INT")
    private BigDecimal finYearInt;
    
    @Column(name = "UNDER_TDS_LIMIT", length = 1)
    private String underTdsLimit;
    
    public BigInteger getCustId() {
        return custId;
    }
    
    public void setCustId(BigInteger custId) {
        this.custId = custId;
    }
    
    public BigInteger getGuardId() {
        return guardId;
    }
    
    public void setGuardId(BigInteger guardId) {
        this.guardId = guardId;
    }
    
    public Date getDob() {
        return dob;
    }
    
    public void setDob(Date dob) {
        this.dob = dob;
    }
    
    public String getCustType() {
        return custType;
    }
    
    public void setCustType(String custType) {
        this.custType = custType;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getMaritalStatus() {
        return maritalStatus;
    }
    
    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
    }
    
    public String getMinor() {
        return minor;
    }
    
    public void setMinor(String minor) {
        this.minor = minor;
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
    
    public String getCustNumber() {
        return custNumber;
    }
    
    public void setCustNumber(String custNumber) {
        this.custNumber = custNumber;
    }
    
    public String getCustName() {
        return custName;
    }
    
    public void setCustName(String custName) {
        this.custName = custName;
    }
    
    public String getCustFirstName() {
        return custFirstName;
    }
    
    public void setCustFirstName(String custFirstName) {
        this.custFirstName = custFirstName;
    }
    
    public String getCustMiddleName() {
        return custMiddleName;
    }
    
    public void setCustMiddleName(String custMiddleName) {
        this.custMiddleName = custMiddleName;
    }
    
    public String getCustLastName() {
        return custLastName;
    }
    
    public void setCustLastName(String custLastName) {
        this.custLastName = custLastName;
    }
    
    public String getCustCategory() {
        return custCategory;
    }
    
    public void setCustCategory(String custCategory) {
        this.custCategory = custCategory;
    }
    
    public String getFatherSpouseName() {
        return fatherSpouseName;
    }
    
    public void setFatherSpouseName(String fatherSpouseName) {
        this.fatherSpouseName = fatherSpouseName;
    }
    
    public String getFatherSpouseFname() {
        return fatherSpouseFname;
    }
    
    public void setFatherSpouseFname(String fatherSpouseFname) {
        this.fatherSpouseFname = fatherSpouseFname;
    }
    
    public String getFatherSpouseMname() {
        return fatherSpouseMname;
    }
    
    public void setFatherSpouseMname(String fatherSpouseMname) {
        this.fatherSpouseMname = fatherSpouseMname;
    }
    
    public String getFatherSpouseLname() {
        return fatherSpouseLname;
    }
    
    public void setFatherSpouseLname(String fatherSpouseLname) {
        this.fatherSpouseLname = fatherSpouseLname;
    }
    
    public String getCustNationalId() {
        return custNationalId;
    }
    
    public void setCustNationalId(String custNationalId) {
        this.custNationalId = custNationalId;
    }
    
    public String getPanNo() {
        return panNo;
    }
    
    public void setPanNo(String panNo) {
        this.panNo = panNo;
    }
    
    public String getCkyc() {
        return ckyc;
    }
    
    public void setCkyc(String ckyc) {
        this.ckyc = ckyc;
    }
    
    public String getConstitution() {
        return constitution;
    }
    
    public void setConstitution(String constitution) {
        this.constitution = constitution;
    }
    
    public String getGstin() {
        return gstin;
    }
    
    public void setGstin(String gstin) {
        this.gstin = gstin;
    }
    
    public String getReligion() {
        return religion;
    }
    
    public void setReligion(String religion) {
        this.religion = religion;
    }
    
    public String getOccupation() {
        return occupation;
    }
    
    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }
    
    public String getEduQualification() {
        return eduQualification;
    }
    
    public void setEduQualification(String eduQualification) {
        this.eduQualification = eduQualification;
    }
    
    public String getBloodGroup() {
        return bloodGroup;
    }
    
    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }
    
    public String getForms6061() {
        return forms6061;
    }
    
    public void setForms6061(String forms6061) {
        this.forms6061 = forms6061;
    }
    
    public String getRiskGrade() {
        return riskGrade;
    }
    
    public void setRiskGrade(String riskGrade) {
        this.riskGrade = riskGrade;
    }
    
    public String getMembershipType() {
        return membershipType;
    }
    
    public void setMembershipType(String membershipType) {
        this.membershipType = membershipType;
    }
    
    public String getMemberNumber() {
        return memberNumber;
    }
    
    public void setMemberNumber(String memberNumber) {
        this.memberNumber = memberNumber;
    }
    
    public String getGender() {
        return gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    
    /*
     * public String getCategory() { return category; }
     * 
     * public void setCategory(String category) { this.category = category; }
     */
    
    public String getCaste() {
        return caste;
    }
    
    public void setCaste(String caste) {
        this.caste = caste;
    }
    
    public String getTdsExemption() {
        return tdsExemption;
    }
    
    public void setTdsExemption(String tdsExemption) {
        this.tdsExemption = tdsExemption;
    }
    
    public String getMember() {
        return member;
    }
    
    public void setMember(String member) {
        this.member = member;
    }
    
    public String getIntroducerIsCustomer() {
        return introducerIsCustomer;
    }
    
    public void setIntroducerIsCustomer(String introducerIsCustomer) {
        this.introducerIsCustomer = introducerIsCustomer;
    }
    
    public String getIntroducerName() {
        return introducerName;
    }
    
    public void setIntroducerName(String introducerName) {
        this.introducerName = introducerName;
    }
    
    public String getIntroducerCustomer() {
        return introducerCustomer;
    }
    
    public void setIntroducerCustomer(String introducerCustomer) {
        this.introducerCustomer = introducerCustomer;
    }
    
    public BigDecimal getFinYearInt() {
        return finYearInt;
    }
    
    public void setFinYearInt(BigDecimal finYearInt) {
        this.finYearInt = finYearInt;
    }
    
    public String getUnderTdsLimit() {
        return underTdsLimit;
    }
    
    public void setUnderTdsLimit(String underTdsLimit) {
        this.underTdsLimit = underTdsLimit;
    }
    
    public String getFreeze() {
        return freeze;
    }
    
    public void setFreeze(String freeze) {
        this.freeze = freeze;
    }
    
    public Date getFreezeUpto() {
        return freezeUpto;
    }
    
    public void setFreezeUpto(Date freezeUpto) {
        this.freezeUpto = freezeUpto;
    }
    
    public String getExpressCustYN() {
        return expressCustYN;
    }
    
    public void setExpressCustYN(String expressCustYN) {
        this.expressCustYN = expressCustYN;
    }
    
    @Override
    public String toString() {
        return "CustomerMasterEntity [custId=" + custId + ", guardId=" + guardId + ", dob=" + dob + ", custType="
                + custType + ", status=" + status + ", maritalStatus=" + maritalStatus + ", minor=" + minor
                + ", bankCode=" + bankCode + ", branchCode=" + branchCode + ", custNumber=" + custNumber + ", custName="
                + custName + ", custFirstName=" + custFirstName + ", custMiddleName=" + custMiddleName
                + ", custLastName=" + custLastName + ", fatherSpouseName=" + fatherSpouseName + ", fatherSpouseFname="
                + fatherSpouseFname + ", fatherSpouseMname=" + fatherSpouseMname + ", fatherSpouseLname="
                + fatherSpouseLname + ", custNationalId=" + custNationalId + ", panNo=" + panNo + ", ckyc=" + ckyc
                + ", constitution=" + constitution + ", gstin=" + gstin + ", religion=" + religion + ", occupation="
                + occupation + ", eduQualification=" + eduQualification + ", bloodGroup=" + bloodGroup + ", forms6061="
                + forms6061 + ", riskGrade=" + riskGrade + ", membershipType=" + membershipType + ", memberNumber="
                + memberNumber + ", gender=" + gender + ", custCategory=" + custCategory + ", caste=" + caste
                + ", tdsExemption=" + tdsExemption + ", member=" + member + ", introducerIsCustomer="
                + introducerIsCustomer + ", introducerName=" + introducerName + ", introducerCustomer="
                + introducerCustomer + ", freeze=" + freeze + ", enteredBy=" + enteredBy + ", authBy=" + authBy
                + ", reason=" + reason + ", prefix=" + prefix + ", fPrefix=" + fPrefix + ", maidenName=" + maidenName
                + ", residential=" + residential + ", grossIncome=" + grossIncome + ", employerDetails="
                + employerDetails + ", freelancerDetails=" + freelancerDetails + ", freezeUpto=" + freezeUpto
                + ", finYearInt=" + finYearInt + ", underTdsLimit=" + underTdsLimit + "]";
    }
    
}
