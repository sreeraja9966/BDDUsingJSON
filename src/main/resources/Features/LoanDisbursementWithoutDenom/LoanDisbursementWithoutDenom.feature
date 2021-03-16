@LoanDisbWithoutDenom
Feature: Loan Disbursement Functionality

@LoanDisbWithoutDenom @setUp
Scenario Outline: 1.Loan Disbursement Screen Setup
Scenario : 1.Loan Disbursement Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Loan Disbursement Screen

Examples:
|parentReport|
|Loan Disbursement Without Denom|

############################################################### First Loan Disbursement Entry With Cash Mode ########################################################################################


Scenario Outline: 2.Loan Disbursement Entry of First Schedule
Scenario : 2.Loan Disbursement Entry of First Schedule
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters accNo "<accNo>" on Loan Disbursement Screen
Then user verify firstPaymentDue "<firstPaymentDue>" and Disbursement Date "<DisbursementDate>" and Disbursement Amount "<DisbursementAmount>"
And user select margin Yes or No "<Margin>"
And user select disbursement through Cash or Transfer "<PaymentMode>"
And user verify transaction amount same as Disbursement Amount "<DisbursementAmount>"
And user enters token number "<Token>"
And user enters remark "<Remark>"
And user click on Amortization Schedule button "<AmortizationSuccessMsg>" 
And user click on verify button of Loan Disbursement screen
And user click on confirm button
Then store number on model with name "<VouchNumStoreInCache>" and "<VouchNumKeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify LOAN_DISB_SCHEDULE table where accNo "<accNo>" and remark "<Remark>" and flow "<Flow>"
Then verify LOAN_DISBURSEMENT table where accNo "<accNo>" and voucher Number "<VouchNumStoreInCache>" and remark "<Remark>" and Disbursement Date "<disbDateDb>" and Disbursement Amount "<disbAmountDb>"
Then verify TOKEN_MASTER table where token number "<Token>"
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>"
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>"
Then verify Transaction_Details table TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>"
Then verify REPAYMENT_SCHEDULE and REPAYMENT_SCHEDULE_TEMP table where accNo "<accNo>" and remark "<Remark>" and scenario "<VouchNumStoreInCache>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|firstPaymentDue|DisbursementDate|DisbursementAmount|Margin|PaymentMode|Token|Remark|AmortizationSuccessMsg|VouchNumStoreInCache|VouchNumKeyInCache|successMessage|disbDateDb|disbAmountDb|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|TransType|
|First Loan Disbursement Entry with AW Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104000000027|23/03/2020|23/02/2020|4,00,000.00|No|Cash|1|First|Loan repayment schedule fetched successfully.|AWLoanDisbFirstVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|400000.00|-400000.00|0.00|0.00|N|Entry|W|
|First Loan Disbursement Entry with CP Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104100000211|23/03/2020|23/02/2020|30,000.00|No|Cash|2|First|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|30000.00|-30000.00|0.00|0.00|N|Entry|W|
|First Loan Disbursement Entry with RI Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104200000037|23/03/2020|23/02/2020|60,000.00|No|Cash|3|First|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|60000.00|-60000.00|0.00|0.00|N|Entry|W|
|First Loan Disbursement Entry with RC Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105910000118|23/03/2020|23/02/2020|1,00,000.00|No|Cash|4|First|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|100000.00|-100000.00|0.00|0.00|N|Entry|W|
|First Loan Disbursement Entry with CL Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105920000182|23/03/2020|23/02/2020|80,000.00|No|Cash|5|First|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|80000.00|-80000.00|0.00|0.00|N|Entry|W|

|Loan Disbursement Entry of AW for Rejection|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104000000030|23/03/2020|23/02/2020|3,00,000.00|No|Cash|6|First|Loan repayment schedule fetched successfully.|AWLoanDisbFirstVouchNumRejection|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|300000.00|-300000.00|0.00|0.00|N|Entry|W|
|Loan Disbursement Entry of CP for Rejection|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104100000213|23/03/2020|23/02/2020|10,000.00|No|Cash|7|First|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNumRejection|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|10000.00|-10000.00|0.00|0.00|N|Entry|W|
|Loan Disbursement Entry of RI for Rejection|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104200000039|23/03/2020|23/02/2020|70,000.00|No|Cash|8|First|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNumRejection|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|70000.00|-70000.00|0.00|0.00|N|Entry|W|
|Loan Disbursement Entry of RC for Rejection|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105910000120|23/03/2020|23/02/2020|4,00,000.00|No|Cash|9|First|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNumRejection|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|400000.00|-400000.00|0.00|0.00|N|Entry|W|
|Loan Disbursement Entry of CL for Rejection|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105920000185|23/03/2020|23/02/2020|2,00,000.00|No|Cash|10|First|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNumRejection|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|200000.00|-200000.00|0.00|0.00|N|Entry|W|


############################################################### First Loan Disbursement Entry Auth ########################################################################################

@LoanDisbWithoutDenom
Scenario Outline: 3.Loan Disbursement Entry of First Schedule Authorization
Scenario : 3.Loan Disbursement Entry of First Schedule Authorization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select accNo "<accNo>" from Loan Disbursement Auth Screen
And user select voucher number from dropdown "<VouchNumStoreInCache>"
Then user verify Disbursement Date "<DisbursementDate>" and Disbursement Amount "<DisbursementAmount>" and margin "<Margin>" and paymentMode "<PaymentMode>" and remark "<Remark>"
And user click on Amortization Schedule button "<AmortizationSuccessMsg>"
And user click on verify button of Loan Disbursement screen
And user click on confirm button
Then user finds successMessage "<successMessage>"
Then verify LOAN_DISBURSEMENT table where accNo "<accNo>" and voucher Number "<VouchNumStoreInCache>" and remark "<Remark>" and flow "<Flow>"
Then verify TOKEN_MASTER table where token number "<Token>" after auth
Then verify LOAN_MASTER table where accNo "<accNo>" and remark "<Remark>" and disbDateDb "<disbDateDb>" and disbAmountDb "<disbAmountDb>"
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>"
Then verify Transaction_Details table TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>"
Then verify Transactions table after Auth TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>" and flow "<Flow>"
Then verify REPAYMENT_SCHEDULE table where accNo "<accNo>" and remark "<Remark>" and scenario "<VouchNumStoreInCache>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|DisbursementDate|DisbursementAmount|Margin|PaymentMode|Remark|Token|AmortizationSuccessMsg|VouchNumStoreInCache|successMessage|disbDateDb|disbAmountDb|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|TransType|
|Auth Of First Loan Disbursement Entry Of AW Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104000000027|23/02/2020|4,00,000.00|No|Cash|First|1|Loan repayment schedule fetched successfully.|AWLoanDisbFirstVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|400000.00|0.00|-400000.00|-400000.00|Y|Auth|W|
|Auth Of First Loan Disbursement Entry Of CP Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104100000211|23/02/2020|30,000.00|No|Cash|First|2|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|30000.00|0.00|-30000.00|-30000.00|Y|Auth|W|
|Auth Of First Loan Disbursement Entry Of RI Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104200000037|23/02/2020|60,000.00|No|Cash|First|3|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|60000.00|0.00|-60000.00|-60000.00|Y|Auth|W|
|Auth Of First Loan Disbursement Entry Of RC Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105910000118|23/02/2020|1,00,000.00|No|Cash|First|4|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|100000.00|0.00|-100000.00|-100000.00|Y|Auth|W|
|Auth Of First Loan Disbursement Entry Of CL Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105920000182|23/02/2020|80,000.00|No|Cash|First|5|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|80000.00|0.00|-80000.00|-80000.00|Y|Auth|W|


############################################################### Second Loan Disbursement Entry ######################################################################################################################

@LoanDisbWithoutDenom
Scenario Outline: 4.Loan Disbursement Entry of Second Schedule
Scenario : 4.Loan Disbursement Entry of Second Schedule
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters accNo "<accNo>" on Loan Disbursement Screen
Then user verify firstPaymentDue "<firstPaymentDue>" and Disbursement Date "<DisbursementDate>" and Disbursement Amount "<DisbursementAmount>"
And user select margin Yes or No "<Margin>"
And user select disbursement through Cash or Transfer "<PaymentMode>"
And user verify transaction amount same as Disbursement Amount "<DisbursementAmount>"
And user enters token number "<Token>"
And user enters remark "<Remark>"
And user click on Amortization Schedule button "<AmortizationSuccessMsg>"  
And user click on verify button of Loan Disbursement screen
And user click on confirm button
Then store number on model with name "<VouchNumStoreInCache>" and "<VouchNumKeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify LOAN_DISB_SCHEDULE table where accNo "<accNo>" and remark "<Remark>" and flow "<Flow>"
Then verify LOAN_DISBURSEMENT table where accNo "<accNo>" and voucher Number "<VouchNumStoreInCache>" and remark "<Remark>" and Disbursement Date "<disbDateDb>" and Disbursement Amount "<disbAmountDb>"
Then verify TOKEN_MASTER table where token number "<Token>"
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>"
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>"
Then verify Transaction_Details table TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>"
Then verify REPAYMENT_SCHEDULE and REPAYMENT_SCHEDULE_TEMP table where accNo "<accNo>" and remark "<Remark>" and scenario "<VouchNumStoreInCache>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|firstPaymentDue|DisbursementDate|DisbursementAmount|Margin|PaymentMode|Token|Remark|AmortizationSuccessMsg|VouchNumStoreInCache|VouchNumKeyInCache|successMessage|disbDateDb|disbAmountDb|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|TransType|
|Second Loan Disbursement Entry with AW Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104000000027|23/03/2020|23/02/2020|80,000.00|No|Cash|1|Second|Loan repayment schedule fetched successfully.|AWLoanDisbSecondVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|80000.00|-80000.00|0.00|0.00|N|Entry|W|
|Second Loan Disbursement Entry with CP Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104100000211|23/03/2020|23/02/2020|9,000.00|No|Cash|2|Second|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|9000.00|-9000.00|0.00|0.00|N|Entry|W|
|Second Loan Disbursement Entry with RI Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104200000037|23/03/2020|23/02/2020|8,000.00|No|Cash|3|Second|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|8000.00|-8000.00|0.00|0.00|N|Entry|W|
|Second Loan Disbursement Entry with RC Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105910000118|23/03/2020|23/02/2020|3,00,000.00|No|Cash|4|Second|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|300000.00|-300000.00|0.00|0.00|N|Entry|W|
|Second Loan Disbursement Entry with CL Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105920000182|23/03/2020|23/02/2020|2,00,000.00|No|Cash|5|Second|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|200000.00|-200000.00|0.00|0.00|N|Entry|W|



############################################################### Second Loan Disbursement Entry Auth ##########################################################################################################################################################################################################################################################################################

@LoanDisbWithoutDenom
Scenario Outline: 5.Loan Disbursement Entry of Second Schedule Authorization
Scenario : 5.Loan Disbursement Entry of Second Schedule Authorization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select accNo "<accNo>" from Loan Disbursement Auth Screen
And user select voucher number from dropdown "<VouchNumStoreInCache>"
Then user verify Disbursement Date "<DisbursementDate>" and Disbursement Amount "<DisbursementAmount>" and margin "<Margin>" and paymentMode "<PaymentMode>" and remark "<Remark>"
And user click on Amortization Schedule button "<AmortizationSuccessMsg>"
And user click on verify button of Loan Disbursement screen
And user click on confirm button
Then user finds successMessage "<successMessage>"
Then verify LOAN_DISBURSEMENT table where accNo "<accNo>" and voucher Number "<VouchNumStoreInCache>" and remark "<Remark>" and flow "<Flow>"
Then verify TOKEN_MASTER table where token number "<Token>" after auth
Then verify LOAN_MASTER table where accNo "<accNo>" and remark "<Remark>" and disbDateDb "<disbDateDb>" and disbAmountDb "<disbAmountDb>"
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb1>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>"
Then verify Transaction_Details table TRANS_AMT "<disbAmountDb1>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>"
Then verify Transactions table after Auth TRANS_AMT "<disbAmountDb1>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>" and flow "<Flow>"
Then verify REPAYMENT_SCHEDULE table where accNo "<accNo>" and remark "<Remark>" and scenario "<VouchNumStoreInCache>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|DisbursementDate|DisbursementAmount|Margin|PaymentMode|Remark|Token|AmortizationSuccessMsg|VouchNumStoreInCache|successMessage|disbDateDb|disbAmountDb|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|TransType|disbAmountDb1|
|Auth Of Second Loan Disbursement Entry Of AW Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104000000027|23/02/2020|80,000.00|No|Cash|Second|1|Loan repayment schedule fetched successfully.|AWLoanDisbSecondVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|480000.00|0.00|-80000.00|-80000.00|Y|Auth|W|80000.00|
|Auth Of Second Loan Disbursement Entry Of CP Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104100000211|23/02/2020|9,000.00|No|Cash|Second|2|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|39000.00|0.00|-9000.00|-9000.00|Y|Auth|W|9000.00|
|Auth Of Second Loan Disbursement Entry Of RI Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104200000037|23/02/2020|8,000.00|No|Cash|Second|3|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|68000.00|0.00|-8000.00|-8000.00|Y|Auth|W|8000.00|
|Auth Of Second Loan Disbursement Entry Of RC Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105910000118|23/02/2020|3,00,000.00|No|Cash|Second|4|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|400000.00|0.00|-300000.00|-300000.00|Y|Auth|W|300000.00|
|Auth Of Second Loan Disbursement Entry Of CL Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105920000182|23/02/2020|2,00,000.00|No|Cash|Second|5|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|280000.00|0.00|-200000.00|-200000.00|Y|Auth|W|200000.00|


############################################################### Loan Disbursement Entry Rejection ########################################################################################

@LoanDisbWithoutDenom
Scenario Outline: 6.Loan Disbursement Entry of First Schedule Rejection
Scenario : 6.Loan Disbursement Entry of First Schedule Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select accNo "<accNo>" from Loan Disbursement Auth Screen
And user select voucher number from dropdown "<VouchNumStoreInCache>"
Then user verify Disbursement Date "<DisbursementDate>" and Disbursement Amount "<DisbursementAmount>" and margin "<Margin>" and paymentMode "<PaymentMode>" and remark "<Remark>"
And user click on Amortization Schedule button "<AmortizationSuccessMsg>"
And user click on Reject button of Loan Disbursement screen
Then user finds successMessage "<successMessage>"
Then verify LOAN_DISB_SCHEDULE table where accNo "<accNo>" and remark "<Remark>" and flow "<Flow>"
Then verify LOAN_DISBURSEMENT table where accNo "<accNo>" and voucher Number "<VouchNumStoreInCache>" and remark "<Remark>" and flow "<Flow>" 
Then verify TOKEN_MASTER table where token number "<Token>" after auth
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>" 
Then verify Transaction_Details table TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>"
Then verify Transactions table after Auth TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>" and flow "<Flow>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|DisbursementDate|DisbursementAmount|Margin|PaymentMode|Remark|Token|AmortizationSuccessMsg|VouchNumStoreInCache|successMessage|disbDateDb|disbAmountDb|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|TransType|
|Rejection Of Loan Disbursement Entry Of AW Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104000000030|23/02/2020|3,00,000.00|No|Cash|First|1|Loan repayment schedule fetched successfully.|AWLoanDisbFirstVouchNumRejection|Successfully Rejected Loan Disbursement Entry.|2020-02-23|300000.00|0.00|0.00|0.00|N|Reject|W|
|Rejection Of Loan Disbursement Entry Of CP Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104100000213|23/02/2020|10,000.00|No|Cash|First|2|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNumRejection|Successfully Rejected Loan Disbursement Entry.|2020-02-23|10000.00|0.00|0.00|0.00|N|Reject|W|
|Rejection Of Loan Disbursement Entry Of RI Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104200000039|23/02/2020|70,000.00|No|Cash|First|3|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNumRejection|Successfully Rejected Loan Disbursement Entry.|2020-02-23|70000.00|0.00|0.00|0.00|N|Reject|W|
|Rejection Of Loan Disbursement Entry Of RC Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105910000120|23/02/2020|4,00,000.00|No|Cash|First|4|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNumRejection|Successfully Rejected Loan Disbursement Entry.|2020-02-23|400000.00|0.00|0.00|0.00|N|Reject|W|
|Rejection Of Loan Disbursement Entry Of CL Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105920000185|23/02/2020|2,00,000.00|No|Cash|First|5|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNumRejection|Successfully Rejected Loan Disbursement Entry.|2020-02-23|200000.00|0.00|0.00|0.00|N|Reject|W|


############################################################### First Loan Disbursement Entry With Transfer Mode ########################################################################################


Scenario Outline: 2.Loan Disbursement Entry of First Schedule
Scenario : 2.Loan Disbursement Entry of First Schedule
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters accNo "<accNo>" on Loan Disbursement Screen
Then user verify firstPaymentDue "<firstPaymentDue>" and Disbursement Date "<DisbursementDate>" and Disbursement Amount "<DisbursementAmount>"
And user select margin Yes or No "<Margin>"
And user select disbursement through Cash or Transfer "<PaymentMode>"
And user enters transfer account number "<TransferAccNo>"
Then verify account holder name On Ui "<AccountHolderName>"
And user verify transaction amount same as Disbursement Amount "<DisbursementAmount>" of transfer
And user enters remark "<Remark>" of transfer
Then click on Add Record Button of Loan disb entry screen
And user click on Amortization Schedule button "<AmortizationSuccessMsg>" 
And user click on verify button of Loan Disbursement screen
And user click on confirm button
Then store number on model with name "<VouchNumStoreInCache>" and "<VouchNumKeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify LOAN_DISB_SCHEDULE table where accNo "<accNo>" and remark "<Remark>" and flow "<Flow>"
Then verify LOAN_DISBURSEMENT table where accNo "<accNo>" and voucher Number "<VouchNumStoreInCache>" and remark "<Remark>" and Disbursement Date "<disbDateDb>" and Disbursement Amount "<disbAmountDb>"
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>"
Then verify ACCOUNT_MASTER table where transfer accNo "<TransferAccNo>" and remark "<Remark>" and TransferAccShadowBal "<TransferAccShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>" of Transfer Account Number
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>"
Then verify Transaction_Details table TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>"
Then verify REPAYMENT_SCHEDULE and REPAYMENT_SCHEDULE_TEMP table where accNo "<accNo>" and remark "<Remark>" and scenario "<VouchNumStoreInCache>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|firstPaymentDue|DisbursementDate|DisbursementAmount|Margin|PaymentMode|TransferAccNo|AccountHolderName|Remark|AmortizationSuccessMsg|VouchNumStoreInCache|VouchNumKeyInCache|successMessage|disbDateDb|disbAmountDb|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|TransferAccShadowBal|Flow|TransType|
|First Loan Disbursement Entry of Transfer Mode with AW Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104000000064|23/03/2020|23/02/2020|50,000.00|No|Transfer|101210101100000923|SAGAR RAM PAWAR|First|Loan repayment schedule fetched successfully.|AWLoanDisbFirstVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|50000.00|-50000.00|0.00|0.00|N|50000.00|Entry|T|
|First Loan Disbursement Entry of Transfer Mode with CP Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104100000253|23/03/2020|23/02/2020|5,000.00|No|Transfer|101210101100000924|SAGAR RAM PAWAR|First|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|5000.00|-5000.00|0.00|0.00|N|5000.00|Entry|T|
|First Loan Disbursement Entry of Transfer Mode with RI Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104200000075|23/03/2020|23/02/2020|20,000.00|No|Transfer|101210101100000925|SAGAR RAM PAWAR|First|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|20000.00|-20000.00|0.00|0.00|N|20000.00|Entry|T|
|First Loan Disbursement Entry of Transfer Mode with RC Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105910000152|23/03/2020|23/02/2020|50,000.00|No|Transfer|101210101100000926|SAGAR RAM PAWAR|First|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|50000.00|-50000.00|0.00|0.00|N|50000.00|Entry|T|
|First Loan Disbursement Entry of Transfer Mode with CL Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105920000215|23/03/2020|23/02/2020|1,00,000.00|No|Transfer|101210101100000927|SAGAR RAM PAWAR|First|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNum|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|100000.00|-100000.00|0.00|0.00|N|100000.00|Entry|T|

|Loan Disbursement Entry of Transfer Mode with AW Int Post Type For Rejection|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104000000063|23/03/2020|23/02/2020|50,000.00|No|Transfer|101210101100000928|SAGAR RAM PAWAR|First|Loan repayment schedule fetched successfully.|AWLoanDisbFirstVouchNumReject|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|50000.00|-50000.00|0.00|0.00|N|50000.00|Entry|T|
|Loan Disbursement Entry of Transfer Mode with CP Int Post Type For Rejection|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104100000250|23/03/2020|23/02/2020|5,000.00|No|Transfer|101210101100000929|SAGAR RAM PAWAR|First|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNumReject|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|5000.00|-5000.00|0.00|0.00|N|5000.00|Entry|T|
|Loan Disbursement Entry of Transfer Mode with RI Int Post Type For Rejection|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104200000074|23/03/2020|23/02/2020|20,000.00|No|Transfer|101210101100000930|SAGAR RAM PAWAR|First|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNumReject|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|20000.00|-20000.00|0.00|0.00|N|20000.00|Entry|T|
|Loan Disbursement Entry of Transfer Mode with RC Int Post Type For Rejection|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105910000151|23/03/2020|23/02/2020|50,000.00|No|Transfer|101210101100000931|SAGAR RAM PAWAR|First|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNumReject|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|50000.00|-50000.00|0.00|0.00|N|50000.00|Entry|T|
|Loan Disbursement Entry of Transfer Mode with CL Int Post Type For Rejection|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105920000216|23/03/2020|23/02/2020|1,00,000.00|No|Transfer|101210101100000932|SAGAR RAM PAWAR|First|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNumReject|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|100000.00|-100000.00|0.00|0.00|N|100000.00|Entry|T|


############################################################### First Loan Disbursement Entry Auth With Transfer Mode ########################################################################################################################################################################################################################################################################################################################################


Scenario Outline: 3.Loan Disbursement Entry of First Schedule Authorization
Scenario : 3.Loan Disbursement Entry of First Schedule Authorization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select accNo "<accNo>" from Loan Disbursement Auth Screen
And user select voucher number from dropdown "<VouchNumStoreInCache>"
Then user verify Disbursement Date "<DisbursementDate>" and Disbursement Amount "<DisbursementAmount>" and margin "<Margin>" and paymentMode "<PaymentMode>" and remark "<Remark>"
Then user verify  transfer account number "<TransferAccNo>" & account holder name "<AccountHolderName>" & amount "<DisbursementAmount>" & remark "<Remark>" On Ui Of Auth Screen
And user click on Amortization Schedule button "<AmortizationSuccessMsg>"
And user click on verify button of Loan Disbursement screen
And user click on confirm button
Then user finds successMessage "<successMessage>"
Then verify LOAN_DISBURSEMENT table where accNo "<accNo>" and voucher Number "<VouchNumStoreInCache>" and remark "<Remark>" and flow "<Flow>"
Then verify LOAN_MASTER table where accNo "<accNo>" and remark "<Remark>" and disbDateDb "<disbDateDb>" and disbAmountDb "<disbAmountDb>"
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify ACCOUNT_MASTER table where transfer accNo "<TransferAccNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<TransferAvailableBal>" and LedgerBal "<TransferLedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>"
Then verify Transaction_Details table TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>"
Then verify Transactions table after Auth TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>" and flow "<Flow>"
Then verify REPAYMENT_SCHEDULE table where accNo "<accNo>" and remark "<Remark>" and scenario "<VouchNumStoreInCache>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|DisbursementDate|DisbursementAmount|Margin|PaymentMode|Remark|AmortizationSuccessMsg|VouchNumStoreInCache|successMessage|disbDateDb|disbAmountDb|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|TransType|TransferAccNo|AccountHolderName|TransferAvailableBal|TransferLedgerBal|
|Auth Of First Loan Disbursement Entry Of Transfer Mode for AW Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104000000064|23/02/2020|50,000.00|No|Transfer|First|Loan repayment schedule fetched successfully.|AWLoanDisbFirstVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|50000.00|0.00|-50000.00|-50000.00|Y|Auth|T|101210101100000923|SAGAR RAM PAWAR|50000.00|50000.00|
|Auth Of First Loan Disbursement Entry Of Transfer Mode for CP Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104100000253|23/02/2020|5,000.00|No|Transfer|First|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|5000.00|0.00|-5000.00|-5000.00|Y|Auth|T|101210101100000924|SAGAR RAM PAWAR|5000.00|5000.00|
|Auth Of First Loan Disbursement Entry Of Transfer Mode for RI Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104200000075|23/02/2020|20,000.00|No|Transfer|First|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|20000.00|0.00|-20000.00|-20000.00|Y|Auth|T|101210101100000925|SAGAR RAM PAWAR|20000.00|20000.00|
|Auth Of First Loan Disbursement Entry Of Transfer Mode for RC Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105910000152|23/02/2020|50,000.00|No|Transfer|First|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|50000.00|0.00|-50000.00|-50000.00|Y|Auth|T|101210101100000926|SAGAR RAM PAWAR|50000.00|50000.00|
|Auth Of First Loan Disbursement Entry Of Transfer Mode for CL Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105920000215|23/02/2020|1,00,000.00|No|Transfer|First|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNum|Successfully Authorized Loan Disbursement Entry.|2020-02-23|100000.00|0.00|-100000.00|-100000.00|Y|Auth|T|101210101100000927|SAGAR RAM PAWAR|100000.00|100000.00|


############################################################### Second Loan Disbursement Entry With Transfer Mode ######################################################################################################################

Scenario Outline: 4.Loan Disbursement Entry of Second Schedule
Scenario : 4.Loan Disbursement Entry of Second Schedule
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters accNo "<accNo>" on Loan Disbursement Screen
Then user verify firstPaymentDue "<firstPaymentDue>" and Disbursement Date "<DisbursementDate>" and Disbursement Amount "<DisbursementAmount>"
And user select margin Yes or No "<Margin>"
And user select disbursement through Cash or Transfer "<PaymentMode>"
And user enters transfer account number "<TransferAccNo>"
Then verify account holder name On Ui "<AccountHolderName>"
And user verify transaction amount same as Disbursement Amount "<DisbursementAmount>" of transfer
And user enters remark "<Remark>" of transfer
Then click on Add Record Button of Loan disb entry screen
And user click on Amortization Schedule button "<AmortizationSuccessMsg>" 
And user click on verify button of Loan Disbursement screen
And user click on confirm button
Then store number on model with name "<VouchNumStoreInCache>" and "<VouchNumKeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify LOAN_DISB_SCHEDULE table where accNo "<accNo>" and remark "<Remark>" and flow "<Flow>"
Then verify LOAN_DISBURSEMENT table where accNo "<accNo>" and voucher Number "<VouchNumStoreInCache>" and remark "<Remark>" and Disbursement Date "<disbDateDb>" and Disbursement Amount "<disbAmountDb>"
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>"
Then verify ACCOUNT_MASTER table where transfer accNo "<TransferAccNo>" and remark "<Remark>" and TransferAccShadowBal "<TransferAccShadowBal>" and AvailableBal "<TransferAvailableBal>" and LedgerBal "<TransferLedgerBal>" and ProdInstYN "<ProdInstYN>" of Transfer Account Number
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>"
Then verify Transaction_Details table TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>"
Then verify REPAYMENT_SCHEDULE and REPAYMENT_SCHEDULE_TEMP table where accNo "<accNo>" and remark "<Remark>" and scenario "<VouchNumStoreInCache>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|firstPaymentDue|DisbursementDate|DisbursementAmount|Margin|PaymentMode|TransferAccNo|AccountHolderName|Remark|AmortizationSuccessMsg|VouchNumStoreInCache|VouchNumKeyInCache|successMessage|disbDateDb|disbAmountDb|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|TransType|TransferAccShadowBal|TransferAvailableBal|TransferLedgerBal|
|Second Loan Disbursement Entry Of Transfer Mode for AW Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104000000064|23/03/2020|23/02/2020|80,000.00|No|Transfer|101210101100000923|SAGAR RAM PAWAR|Second|Loan repayment schedule fetched successfully.|AWLoanDisbSecondVouchNumTransfer|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|80000.00|-80000.00|-50000.00|-50000.00|Y|Entry|T|80000.00|50000.00|50000.00|
|Second Loan Disbursement Entry Of Transfer Mode for CP Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104100000253|23/03/2020|23/02/2020|9,000.00|No|Transfer|101210101100000924|SAGAR RAM PAWAR|Second|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNumTransfer|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|9000.00|-9000.00|-5000.00|-5000.00|Y|Entry|T|9000.00|5000.00|5000.00|
|Second Loan Disbursement Entry Of Transfer Mode for RI Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104200000075|23/03/2020|23/02/2020|8,000.00|No|Transfer|101210101100000925|SAGAR RAM PAWAR|Second|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNumTransfer|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|8000.00|-8000.00|-20000.00|-20000.00|Y|Entry|T|8000.00|20000.00|20000.00|
|Second Loan Disbursement Entry Of Transfer Mode for RC Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105910000152|23/03/2020|23/02/2020|3,00,000.00|No|Transfer|101210101100000926|SAGAR RAM PAWAR|Second|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNumTransfer|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|300000.00|-300000.00|-50000.00|-50000.00|Y|Entry|T|300000.00|50000.00|50000.00|
|Second Loan Disbursement Entry Of Transfer Mode for CL Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105920000215|23/03/2020|23/02/2020|2,00,000.00|No|Transfer|101210101100000927|SAGAR RAM PAWAR|Second|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNumTransfer|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|200000.00|-200000.00|-100000.00|-100000.00|Y|Entry|T|200000.00|100000.00|100000.00|



############################################################### Second Loan Disbursement Entry Auth With Transfer Mode #############################################################################################################################################################################################################################################################################################

Scenario Outline: 5.Loan Disbursement Entry of Second Schedule Authorization
Scenario : 5.Loan Disbursement Entry of Second Schedule Authorization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select accNo "<accNo>" from Loan Disbursement Auth Screen
And user select voucher number from dropdown "<VouchNumStoreInCache>"
Then user verify Disbursement Date "<DisbursementDate>" and Disbursement Amount "<DisbursementAmount>" and margin "<Margin>" and paymentMode "<PaymentMode>" and remark "<Remark>"
Then user verify  transfer account number "<TransferAccNo>" & account holder name "<AccountHolderName>" & amount "<DisbursementAmount>" & remark "<Remark>" On Ui Of Auth Screen
And user click on Amortization Schedule button "<AmortizationSuccessMsg>"
And user click on verify button of Loan Disbursement screen
And user click on confirm button
Then user finds successMessage "<successMessage>"
Then verify LOAN_DISBURSEMENT table where accNo "<accNo>" and voucher Number "<VouchNumStoreInCache>" and remark "<Remark>" and flow "<Flow>"
Then verify LOAN_MASTER table where accNo "<accNo>" and remark "<Remark>" and disbDateDb "<disbDateDb>" and disbAmountDb "<disbAmountDb>"
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify ACCOUNT_MASTER table where transfer accNo "<TransferAccNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<TransferAvailableBal>" and LedgerBal "<TransferLedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb1>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>"
Then verify Transaction_Details table TRANS_AMT "<disbAmountDb1>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>"
Then verify Transactions table after Auth TRANS_AMT "<disbAmountDb1>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>" and flow "<Flow>"
Then verify REPAYMENT_SCHEDULE table where accNo "<accNo>" and remark "<Remark>" and scenario "<VouchNumStoreInCache>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|DisbursementDate|DisbursementAmount|Margin|PaymentMode|Remark|AmortizationSuccessMsg|VouchNumStoreInCache|successMessage|disbDateDb|disbAmountDb|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|TransType|disbAmountDb1|TransferAccNo|TransferAvailableBal|TransferLedgerBal|AccountHolderName|
|Auth Of Second Loan Disbursement Entry Of Transfer Mode for AW Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104000000064|23/02/2020|80,000.00|No|Transfer|Second|Loan repayment schedule fetched successfully.|AWLoanDisbSecondVouchNumTransfer|Successfully Authorized Loan Disbursement Entry.|2020-02-23|130000.00|0.00|-130000.00|-130000.00|Y|Auth|T|80000.00|101210101100000923|130000.00|130000.00|SAGAR RAM PAWAR|
|Auth Of Second Loan Disbursement Entry Of Transfer Mode for CP Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104100000253|23/02/2020|9,000.00|No|Transfer|Second|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNumTransfer|Successfully Authorized Loan Disbursement Entry.|2020-02-23|14000.00|0.00|-14000.00|-14000.00|Y|Auth|T|9000.00|101210101100000924|14000.00|14000.00|SAGAR RAM PAWAR|
|Auth Of Second Loan Disbursement Entry Of Transfer Mode for RI Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104200000075|23/02/2020|8,000.00|No|Transfer|Second|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNumTransfer|Successfully Authorized Loan Disbursement Entry.|2020-02-23|28000.00|0.00|-28000.00|-28000.00|Y|Auth|T|8000.00|101210101100000925|28000.00|28000.00|SAGAR RAM PAWAR|
|Auth Of Second Loan Disbursement Entry Of Transfer Mode for RC Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105910000152|23/02/2020|3,00,000.00|No|Transfer|Second|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNumTransfer|Successfully Authorized Loan Disbursement Entry.|2020-02-23|350000.00|0.00|-350000.00|-350000.00|Y|Auth|T|300000.00|101210101100000926|350000.00|350000.00|SAGAR RAM PAWAR|
|Auth Of Second Loan Disbursement Entry Of Transfer Mode for CL Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105920000215|23/02/2020|2,00,000.00|No|Transfer|Second|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNumTransfer|Successfully Authorized Loan Disbursement Entry.|2020-02-23|300000.00|0.00|-300000.00|-300000.00|Y|Auth|T|200000.00|101210101100000927|300000.00|300000.00|SAGAR RAM PAWAR|


############################################################### Loan Disbursement Entry Rejection With Transfer Mode ########################################################################################################################################################################################################################################################################################################################################


Scenario Outline: 3.Loan Disbursement Entry of First Schedule Rejection
Scenario : 3.Loan Disbursement Entry of First Schedule Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select accNo "<accNo>" from Loan Disbursement Auth Screen
And user select voucher number from dropdown "<VouchNumStoreInCache>"
Then user verify Disbursement Date "<DisbursementDate>" and Disbursement Amount "<DisbursementAmount>" and margin "<Margin>" and paymentMode "<PaymentMode>" and remark "<Remark>"
Then user verify  transfer account number "<TransferAccNo>" & account holder name "<AccountHolderName>" & amount "<DisbursementAmount>" & remark "<Remark>" On Ui Of Auth Screen
And user click on Amortization Schedule button "<AmortizationSuccessMsg>"
And user click on Reject button of Loan Disbursement screen
Then user finds successMessage "<successMessage>"
Then verify LOAN_DISB_SCHEDULE table where accNo "<accNo>" and remark "<Remark>" and flow "<Flow>"
Then verify LOAN_DISBURSEMENT table where accNo "<accNo>" and voucher Number "<VouchNumStoreInCache>" and remark "<Remark>" and flow "<Flow>" 
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify ACCOUNT_MASTER table where transfer accNo "<TransferAccNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<TransferAvailableBal>" and LedgerBal "<TransferLedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>" 
Then verify Transaction_Details table TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>"
Then verify Transactions table after Auth TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>" and flow "<Flow>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|DisbursementDate|DisbursementAmount|Margin|PaymentMode|Remark|AmortizationSuccessMsg|VouchNumStoreInCache|successMessage|disbDateDb|disbAmountDb|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|TransType|TransferAccNo|AccountHolderName|TransferAvailableBal|TransferLedgerBal|
|Rejection Of Loan Disbursement Entry Of Transfer Mode for AW Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104000000063|23/02/2020|50,000.00|No|Transfer|First|Loan repayment schedule fetched successfully.|AWLoanDisbFirstVouchNumReject|Successfully Rejected Loan Disbursement Entry.|2020-02-23|50000.00|0.00|0.00|0.00|N|Reject|T|101210101100000928|SAGAR RAM PAWAR|0.00|0.00|
|Rejection Of Loan Disbursement Entry Of Transfer Mode for CP Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104100000250|23/02/2020|5,000.00|No|Transfer|First|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNumReject|Successfully Rejected Loan Disbursement Entry.|2020-02-23|5000.00|0.00|0.00|0.00|N|Reject|T|101210101100000929|SAGAR RAM PAWAR|0.00|0.00|
|Rejection Of Loan Disbursement Entry Of Transfer Mode for RI Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104200000074|23/02/2020|20,000.00|No|Transfer|First|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNumReject|Successfully Rejected Loan Disbursement Entry.|2020-02-23|20000.00|0.00|0.00|0.00|N|Reject|T|101210101100000930|SAGAR RAM PAWAR|0.00|0.00|
|Rejection Of Loan Disbursement Entry Of Transfer Mode for RC Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105910000151|23/02/2020|50,000.00|No|Transfer|First|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNumReject|Successfully Rejected Loan Disbursement Entry.|2020-02-23|50000.00|0.00|0.00|0.00|N|Reject|T|101210101100000931|SAGAR RAM PAWAR|0.00|0.00|
|Rejection Of Loan Disbursement Entry Of Transfer Mode for CL Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105920000216|23/02/2020|1,00,000.00|No|Transfer|First|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNumReject|Successfully Rejected Loan Disbursement Entry.|2020-02-23|100000.00|0.00|0.00|0.00|N|Reject|T|101210101100000932|SAGAR RAM PAWAR|0.00|0.00|

