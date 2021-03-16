@LoanDisbWithDenom
Feature: Loan Disbursement Functionality

@LoanDisbWithDenom @setUp 
Scenario Outline: 1.Loan Disbursement Screen Setup
Scenario : 1.Loan Disbursement Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Loan Disbursement Screen

Examples:
|parentReport|
|Loan Disbursement With Denom|

############################################################### First Loan Disbursement Entry ########################################################################################

@LoanDisbWithDenom  @withDenom
Scenario Outline: 2.Loan Disbursement Entry of First Schedule With Denom Y
Scenario : 2.Loan Disbursement Entry of First Schedule With Denom Y
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
|First Loan Disbursement Entry with AW Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104000000032|23/03/2020|23/02/2020|50,000.00|No|Cash|1|First|Loan repayment schedule fetched successfully.|AWLoanDisbFirstVouchNumWithDenom|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|50000.00|-50000.00|0.00|0.00|N|Entry|W|
|First Loan Disbursement Entry with CP Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104100000215|23/03/2020|23/02/2020|5,000.00|No|Cash|2|First|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNumWithDenom|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|5000.00|-5000.00|0.00|0.00|N|Entry|W|
|First Loan Disbursement Entry with RI Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104200000041|23/03/2020|23/02/2020|20,000.00|No|Cash|3|First|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNumWithDenom|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|20000.00|-20000.00|0.00|0.00|N|Entry|W|
|First Loan Disbursement Entry with RC Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105910000122|23/03/2020|23/02/2020|50,000.00|No|Cash|4|First|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNumWithDenom|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|50000.00|-50000.00|0.00|0.00|N|Entry|W|
|First Loan Disbursement Entry with CL Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105920000187|23/03/2020|23/02/2020|1,00,000.00|No|Cash|5|First|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNumWithDenom|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|100000.00|-100000.00|0.00|0.00|N|Entry|W|

|Loan Disb. Entry For Withdrawal Payment Rejection with AW Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104000000030|23/03/2020|23/02/2020|3,00,000.00|No|Cash|6|First|Loan repayment schedule fetched successfully.|AWLoanDisbVouchNumWithDenomRejection|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|300000.00|-300000.00|0.00|0.00|N|Entry|W|
|Loan Disb. Entry For Withdrawal Payment Rejection with CP Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104100000213|23/03/2020|23/02/2020|10,000.00|No|Cash|7|First|Loan repayment schedule fetched successfully.|CPLoanDisbVouchNumWithDenomRejection|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|10000.00|-10000.00|0.00|0.00|N|Entry|W|
|Loan Disb. Entry For Withdrawal Payment Rejection with RI Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104200000039|23/03/2020|23/02/2020|70,000.00|No|Cash|8|First|Loan repayment schedule fetched successfully.|RILoanDisbVouchNumWithDenomRejection|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|70000.00|-70000.00|0.00|0.00|N|Entry|W|
|Loan Disb. Entry For Withdrawal Payment Rejection with RC Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105910000120|23/03/2020|23/02/2020|4,00,000.00|No|Cash|9|First|Loan repayment schedule fetched successfully.|RCLoanDisbVouchNumWithDenomRejection|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|400000.00|-400000.00|0.00|0.00|N|Entry|W|
|Loan Disb. Entry For Withdrawal Payment Rejection with CL Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105920000185|23/03/2020|23/02/2020|2,00,000.00|No|Cash|10|First|Loan repayment schedule fetched successfully.|CLLoanDisbVouchNumWithDenomRejection|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|200000.00|-200000.00|0.00|0.00|N|Entry|W|

|First Loan Disb. Entry For Rejection with AW Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104000000027|23/03/2020|23/02/2020|4,00,000.00|No|Cash|11|First|Loan repayment schedule fetched successfully.|AWLoanDisbFirstVouchNumWithDenomReject|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|400000.00|-400000.00|0.00|0.00|N|Entry|W|
|First Loan Disb. Entry For Rejection with CP Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104100000211|23/03/2020|23/02/2020|30,000.00|No|Cash|12|First|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNumWithDenomReject|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|30000.00|-30000.00|0.00|0.00|N|Entry|W|
|First Loan Disb. Entry For Rejection with RI Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104200000037|23/03/2020|23/02/2020|60,000.00|No|Cash|13|First|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNumWithDenomReject|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|60000.00|-60000.00|0.00|0.00|N|Entry|W|
|First Loan Disb. Entry For Rejection with RC Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105910000118|23/03/2020|23/02/2020|1,00,000.00|No|Cash|14|First|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNumWithDenomReject|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|100000.00|-100000.00|0.00|0.00|N|Entry|W|
|First Loan Disb. Entry For Rejection with CL Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105920000182|23/03/2020|23/02/2020|80,000.00|No|Cash|15|First|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNumWithDenomReject|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|80000.00|-80000.00|0.00|0.00|N|Entry|W|

############################################################### First Loan Disbursement Entry Auth ########################################################################################

@LoanDisbWithDenom  @withDenom
Scenario Outline: 3.Loan Disbursement Entry of First Schedule Authorization With Denom Y
Scenario : 3.Loan Disbursement Entry of First Schedule Authorization With Denom Y
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
Then verify TOKENMASTER table status col "C" where "<Token>"
Then verify LOAN_MASTER table where accNo "<accNo>" and remark "<Remark>" and disbDateDb "<disbDateDb>" and disbAmountDb "<disbAmountDbDenom>"
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>" with Denom Y
Then verify Transaction_Details table TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>"
Then verify REPAYMENT_SCHEDULE table where accNo "<accNo>" and remark "<Remark>" and scenario "<VouchNumStoreInCache>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|DisbursementDate|DisbursementAmount|Margin|PaymentMode|Remark|Token|AmortizationSuccessMsg|VouchNumStoreInCache|successMessage|disbDateDb|disbAmountDb|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|TransType|disbAmountDbDenom|
|Auth Of First Loan Disbursement Entry Of AW Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104000000032|23/02/2020|50,000.00|No|Cash|First|1|Loan repayment schedule fetched successfully.|AWLoanDisbFirstVouchNumWithDenom|Successfully Authorized Loan Disbursement Entry.|2020-02-23|50000.00|-50000.00|0.00|0.00|N|Auth|W|0.00|
|Auth Of First Loan Disbursement Entry Of CP Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104100000215|23/02/2020|5,000.00|No|Cash|First|2|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNumWithDenom|Successfully Authorized Loan Disbursement Entry.|2020-02-23|5000.00|-5000.00|0.00|0.00|N|Auth|W|0.00|
|Auth Of First Loan Disbursement Entry Of RI Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104200000041|23/02/2020|20,000.00|No|Cash|First|3|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNumWithDenom|Successfully Authorized Loan Disbursement Entry.|2020-02-23|20000.00|-20000.00|0.00|0.00|N|Auth|W|0.00|
|Auth Of First Loan Disbursement Entry Of RC Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105910000122|23/02/2020|50,000.00|No|Cash|First|4|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNumWithDenom|Successfully Authorized Loan Disbursement Entry.|2020-02-23|50000.00|-50000.00|0.00|0.00|N|Auth|W|0.00|
|Auth Of First Loan Disbursement Entry Of CL Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105920000187|23/02/2020|1,00,000.00 |No|Cash|First|5|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNumWithDenom|Successfully Authorized Loan Disbursement Entry.|2020-02-23|100000.00|-100000.00|0.00|0.00|N|Auth|W|0.00|

|Auth Of Loan Disb. Rejection Entry Of AW Int Post Type For Withdrawal Payment|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104000000030|23/02/2020|3,00,000.00|No|Cash|First|6|Loan repayment schedule fetched successfully.|AWLoanDisbVouchNumWithDenomRejection|Successfully Authorized Loan Disbursement Entry.|2020-02-23|300000.00|-300000.00|0.00|0.00|N|Auth|W|0.00|
|Auth Of Loan Disb. Rejection Entry Of CP Int Post Type For Withdrawal Payment|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104100000213|23/02/2020|10,000.00|No|Cash|First|7|Loan repayment schedule fetched successfully.|CPLoanDisbVouchNumWithDenomRejection|Successfully Authorized Loan Disbursement Entry.|2020-02-23|10000.00|-10000.00|0.00|0.00|N|Auth|W|0.00|
|Auth Of Loan Disb. Rejection Entry Of RI Int Post Type For Withdrawal Payment|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104200000039|23/02/2020|70,000.00|No|Cash|First|8|Loan repayment schedule fetched successfully.|RILoanDisbVouchNumWithDenomRejection|Successfully Authorized Loan Disbursement Entry.|2020-02-23|70000.00|-70000.00|0.00|0.00|N|Auth|W|0.00|
|Auth Of Loan Disb. Rejection Entry Of RC Int Post Type For Withdrawal Payment|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105910000120|23/02/2020|4,00,000.00|No|Cash|First|9|Loan repayment schedule fetched successfully.|RCLoanDisbVouchNumWithDenomRejection|Successfully Authorized Loan Disbursement Entry.|2020-02-23|400000.00|-400000.00|0.00|0.00|N|Auth|W|0.00|
|Auth Of Loan Disb. Rejection Entry Of CL Int Post Type For Withdrawal Payment|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105920000185|23/02/2020|2,00,000.00|No|Cash|First|10|Loan repayment schedule fetched successfully.|CLLoanDisbVouchNumWithDenomRejection|Successfully Authorized Loan Disbursement Entry.|2020-02-23|200000.00|-200000.00|0.00|0.00|N|Auth|W|0.00|


@LoanDisbWithDenom 
Scenario Outline: 4.Withdrawal Payment Entry Deno_Master
Scenario : 4.Denom Master Verification
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then verify DENO_MASTER Table Denom_Rate "<DenomRateUiXpath>" where bankCode "<bankcode>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|DenomRateUiXpath|bankcode|
|Denom Master Ui Verification|Payment Withdrawal|Menu_CashPayment|//div[@id='userwiseDenominationModel']|101|


@LoanDisbWithDenom
Scenario Outline: 5.Withdrawal Payment Entry Userwise_Denom
Scenario : 5.Userwise_Denom Verification
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then Verify UserwiseDenom table with "<DenomRateUiXpath>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|DenomRateUiXpath|
|Userwise_Denom Ui Verification|Payment Withdrawal|Menu_CashPayment|//div[@id='userwiseDenominationModel']|

########################################################### First Loan Disb. Withdrawal Payment Entry Auth ########################################################################################

@LoanDisbWithDenom  @withDenom
Scenario Outline: 6.Withdrawal Payment Entry of First Loan Disb. Entry
Scenario : 6.Withdrawal Payment Entry of First Loan Disb. Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters voucher num "<VouchNumStoreInCache>" on Withdrawal Payment Entry Screen
Then user verify voucher number "<VouchNumStoreInCache>" & token Num "<Token>" & Voucher Amount "<VoucherAmount>" on Ui
When user enter denominations "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then user click on Submit button of Withdrawal Payment Entry Screen
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then verify LOAN_MASTER table where accNo "<accNo>" and remark "<Remark>" and disbDateDb "<disbDateDb>" and disbAmountDb "<disbAmountDbDenom>"
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>"
Then verify Transactions table after Auth TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>" and flow "<Flow>" with Denom Y
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|VouchNumStoreInCache|Token|VoucherAmount|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|accNo|Remark|disbDateDb|disbAmountDbDenom|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|disbAmountDb|TransType|
|Payment Withdrawal of First Loan Disb. of AW|Payment Withdrawal|Menu_CashPayment|AWLoanDisbFirstVouchNumWithDenom|1|50000|0|0|0|0|0|0|0|0|0|0|100|0|0|0|0|0|0|0|101210104000000032|First|2020-02-23|50000.00|0.00|-50000.00|-50000.00|Y|CashPaymentAuth|50000.00|W|
|Payment Withdrawal of First Loan Disb. of CP|Payment Withdrawal|Menu_CashPayment|CPLoanDisbFirstVouchNumWithDenom|2|5000|0|0|0|0|0|0|0|0|0|2|2|0|0|0|0|0|0|0|101210104100000215|First|2020-02-23|5000.00|0.00|-5000.00|-5000.00|Y|CashPaymentAuth|5000.00|W|
|Payment Withdrawal of First Loan Disb. of RI|Payment Withdrawal|Menu_CashPayment|RILoanDisbFirstVouchNumWithDenom|3|20000|0|0|0|0|0|0|0|0|0|10|0|0|0|0|0|0|0|0|101210104200000041|First|2020-02-23|20000.00|0.00|-20000.00|-20000.00|Y|CashPaymentAuth|20000.00|W|
|Payment Withdrawal of First Loan Disb. of RC|Payment Withdrawal|Menu_CashPayment|RCLoanDisbFirstVouchNumWithDenom|4|50000|0|0|0|0|0|0|0|0|0|0|100|0|0|0|0|0|0|0|101210105910000122|First|2020-02-23|50000.00|0.00|-50000.00|-50000.00|Y|CashPaymentAuth|50000.00|W|
|Payment Withdrawal of First Loan Disb. of CL|Payment Withdrawal|Menu_CashPayment|CLLoanDisbFirstVouchNumWithDenom|5|100000|0|0|0|0|0|0|0|0|0|25|100|0|0|0|0|0|0|0|101210105920000187|First|2020-02-23|100000.00|0.00|-100000.00|-100000.00|Y|CashPaymentAuth|100000.00|W|



########################################################### Loan Disb. Withdrawal Payment Rejection ########################################################################################


Scenario Outline: 7.Withdrawal Payment Rejection of Loan Disb. Entry
Scenario : 7.Withdrawal Payment Rejection of Loan Disb. Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters voucher num "<VouchNumStoreInCache>" on Withdrawal Payment Entry Screen
Then user verify voucher number "<VouchNumStoreInCache>" & token Num "<Token>" & Voucher Amount "<VoucherAmount>" on Ui
When user enter denominations "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then user click on Reject button of Withdrawal Payment Entry Screen
Then user finds successMessage "<successMessage>"
Then verify LOAN_MASTER table where accNo "<accNo>" and remark "<Remark>" and disbDateDb "<disbDateDb>" and disbAmountLoanMstDb "<disbAmountLoanMstDb>" and flow "<Flow>"
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>"
Then verify Transactions table after Auth TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>" and flow "<Flow>" with Denom Y
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|VouchNumStoreInCache|Token|VoucherAmount|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|accNo|Remark|disbDateDb|disbAmountDbDenom|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|disbAmountDb|TransType|disbAmountLoanMstDb|successMessage|
|Payment Withdrawal Rejection of Loan Disb. of AW|Payment Withdrawal|Menu_CashPayment|AWLoanDisbVouchNumWithDenomRejection|6|300000|0|0|0|0|0|0|0|0|0|0|100|0|0|0|0|0|0|0|101210104000000030|First|2020-02-23|300000.00|0.00|0.00|0.00|N|CashPaymentReject|300000.00|W|0.00|Successfully Rejected.|
|Payment Withdrawal Rejection of Loan Disb. of CP|Payment Withdrawal|Menu_CashPayment|CPLoanDisbVouchNumWithDenomRejection|7|10000|0|0|0|0|0|0|0|0|0|2|2|0|0|0|0|0|0|0|101210104100000213|First|2020-02-23|10000.00|0.00|0.00|0.00|N|CashPaymentReject|10000.00|W|0.00|Successfully Rejected.|
|Payment Withdrawal Rejection of Loan Disb. of RI|Payment Withdrawal|Menu_CashPayment|RILoanDisbVouchNumWithDenomRejection|8|70000|0|0|0|0|0|0|0|0|0|10|0|0|0|0|0|0|0|0|101210104200000039|First|2020-02-23|70000.00|0.00|0.00|0.00|N|CashPaymentReject|70000.00|W|0.00|Successfully Rejected.|
|Payment Withdrawal Rejection of Loan Disb. of RC|Payment Withdrawal|Menu_CashPayment|RCLoanDisbVouchNumWithDenomRejection|9|400000|0|0|0|0|0|0|0|0|0|0|100|0|0|0|0|0|0|0|101210105910000120|First|2020-02-23|400000.00|0.00|0.00|0.00|N|CashPaymentReject|400000.00|W|0.00|Successfully Rejected.|
|Payment Withdrawal Rejection of Loan Disb. of CL|Payment Withdrawal|Menu_CashPayment|CLLoanDisbVouchNumWithDenomRejection|10|200000|0|0|0|0|0|0|0|0|0|25|100|0|0|0|0|0|0|0|101210105920000185|First|2020-02-23|200000.00|0.00|0.00|0.00|N|CashPaymentReject|200000.00|W|0.00|Successfully Rejected.|


############################################################### Loan Disbursement Entry Rejection ########################################################################################


Scenario Outline: 8.Loan Disbursement Entry of Schedule Rejection With Denom Y
Scenario : 8.Loan Disbursement Entry of Schedule Rejection With Denom Y
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
Then verify LOAN_MASTER table where accNo "<accNo>" and remark "<Remark>" and disbDateDb "<disbDateDb>" and disbAmountLoanMstDb "<disbAmountLoanMstDb>" and flow "<Flow>"
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>"
Then verify Transaction_Details table TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>"
Then verify Transactions table after Auth TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>" and flow "<Flow>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|DisbursementDate|DisbursementAmount|Margin|PaymentMode|Remark|Token|AmortizationSuccessMsg|VouchNumStoreInCache|successMessage|disbDateDb|disbAmountDb|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|TransType|disbAmountLoanMstDb|
|Rejection Of Loan Disb. Entry Of AW Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104000000027|23/02/2020|4,00,000.00|No|Cash|First|11|Loan repayment schedule fetched successfully.|AWLoanDisbFirstVouchNumWithDenomReject|Successfully Rejected Loan Disbursement Entry.|2020-02-23|400000.00|0.00|0.00|0.00|N|Reject|W|0.00|
|Rejection Of Loan Disb. Entry Of CP Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104100000211|23/02/2020|30,000.00|No|Cash|First|12|Loan repayment schedule fetched successfully.|CPLoanDisbFirstVouchNumWithDenomReject|Successfully Rejected Loan Disbursement Entry.|2020-02-23|30000.00|0.00|0.00|0.00|N|Reject|W|0.00|
|Rejection Of Loan Disb. Entry Of RI Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104200000037|23/02/2020|60,000.00|No|Cash|First|13|Loan repayment schedule fetched successfully.|RILoanDisbFirstVouchNumWithDenomReject|Successfully Rejected Loan Disbursement Entry.|2020-02-23|60000.00|0.00|0.00|0.00|N|Reject|W|0.00|
|Rejection Of Loan Disb. Entry Of RC Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105910000118|23/02/2020|1,00,000.00|No|Cash|First|14|Loan repayment schedule fetched successfully.|RCLoanDisbFirstVouchNumWithDenomReject|Successfully Rejected Loan Disbursement Entry.|2020-02-23|100000.00|0.00|0.00|0.00|N|Reject|W|0.00|
|Rejection Of Loan Disb. Entry Of CL Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105920000182|23/02/2020|80,000.00|No|Cash|First|15|Loan repayment schedule fetched successfully.|CLLoanDisbFirstVouchNumWithDenomReject|Successfully Rejected Loan Disbursement Entry.|2020-02-23|80000.00|0.00|0.00|0.00|N|Reject|W|0.00|

############################################################### Second Loan Disbursement Entry ####################################################################################################################################################################################################################################################################################################################################



Scenario Outline: 9.Loan Disbursement Entry of Second Schedule With Denom Y
Scenario : 9.Loan Disbursement Entry of Second Schedule With Denom Y
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
|Second Loan Disbursement Entry with AW Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104000000032|23/03/2020|23/02/2020|80,000.00|No|Cash|1|Second|Loan repayment schedule fetched successfully.|AWLoanDisbSecondVouchNumWithDenom|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|80000.00|-80000.00|0.00|0.00|N|Entry|W|
|Second Loan Disbursement Entry with CP Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104100000215|23/03/2020|23/02/2020|9,000.00|No|Cash|2|Second|Loan repayment schedule fetched successfully.|CPLoanDisbSecondVouchNumWithDenom|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|9000.00|-9000.00|0.00|0.00|N|Entry|W|
|Second Loan Disbursement Entry with RI Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210104200000041|23/03/2020|23/02/2020|8,000.00|No|Cash|3|Second|Loan repayment schedule fetched successfully.|RILoanDisbSecondVouchNumWithDenom|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|8000.00|-8000.00|0.00|0.00|N|Entry|W|
|Second Loan Disbursement Entry with RC Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105910000122|23/03/2020|23/02/2020|3,00,000.00|No|Cash|4|Second|Loan repayment schedule fetched successfully.|RCLoanDisbSecondVouchNumWithDenom|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|300000.00|-300000.00|0.00|0.00|N|Entry|W|
|Second Loan Disbursement Entry with CL Int Post Type|Loan Disbursement Entry|Menu_LoanDisbursementEntry|101210105920000187|23/03/2020|23/02/2020|2,00,000.00|No|Cash|5|Second|Loan repayment schedule fetched successfully.|CLLoanDisbSecondVouchNumWithDenom|LoanDisbursementScreen_modelVoucherNum|Successfully Disbursed Schedule.|2020-02-23|200000.00|-200000.00|0.00|0.00|N|Entry|W|

############################################################### Second Loan Disbursement Entry Auth ########################################################################################



Scenario Outline: 10.Loan Disbursement Entry of Second Schedule Authorization With Denom Y
Scenario : 10.Loan Disbursement Entry of Second Schedule Authorization With Denom Y
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
Then verify TOKENMASTER table status col "C" where "<Token>"
Then verify LOAN_MASTER table where accNo "<accNo>" and remark "<Remark>" and disbDateDb "<disbDateDb>" and disbAmountDb "<disbAmountDbDenom>"
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>" with Denom Y
Then verify Transaction_Details table TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>"
Then verify REPAYMENT_SCHEDULE table where accNo "<accNo>" and remark "<Remark>" and scenario "<VouchNumStoreInCache>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|DisbursementDate|DisbursementAmount|Margin|PaymentMode|Remark|Token|AmortizationSuccessMsg|VouchNumStoreInCache|successMessage|disbDateDb|disbAmountDb|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|TransType|disbAmountDbDenom|
|Auth Of Second Loan Disb. Entry Of AW Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104000000032|23/02/2020|80,000.00|No|Cash|Second|1|Loan repayment schedule fetched successfully.|AWLoanDisbSecondVouchNumWithDenom|Successfully Authorized Loan Disbursement Entry.|2020-02-23|80000.00|-80000.00|0.00|0.00|N|Auth|W|50000.00|
|Auth Of Second Loan Disb. Entry Of CP Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104100000215|23/02/2020|9,000.00|No|Cash|Second|2|Loan repayment schedule fetched successfully.|CPLoanDisbSecondVouchNumWithDenom|Successfully Authorized Loan Disbursement Entry.|2020-02-23|9000.00|-9000.00|0.00|0.00|N|Auth|W|5000.00|
|Auth Of Second Loan Disb. Entry Of RI Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210104200000041|23/02/2020|8,000.00|No|Cash|Second|3|Loan repayment schedule fetched successfully.|RILoanDisbSecondVouchNumWithDenom|Successfully Authorized Loan Disbursement Entry.|2020-02-23|8000.00|-8000.00|0.00|0.00|N|Auth|W|20000.00|
|Auth Of Second Loan Disb. Entry Of RC Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105910000122|23/02/2020|3,00,000.00|No|Cash|Second|4|Loan repayment schedule fetched successfully.|RCLoanDisbSecondVouchNumWithDenom|Successfully Authorized Loan Disbursement Entry.|2020-02-23|300000.00|-300000.00|0.00|0.00|N|Auth|W|50000.00|
|Auth Of Second Loan Disb. Entry Of CL Int Post Type|Loan Disbursement Authorization|Menu_LoanDisbursementEntryAuth|101210105920000187|23/02/2020|2,00,000.00 |No|Cash|Second|5|Loan repayment schedule fetched successfully.|CLLoanDisbSecondVouchNumWithDenom|Successfully Authorized Loan Disbursement Entry.|2020-02-23|200000.00|-200000.00|0.00|0.00|N|Auth|W|100000.00|



########################################################### Second Loan Disb. Withdrawal Payment Entry Auth ################################################################################################################################################################


Scenario Outline: 11.Withdrawal Payment Entry of Second Loan Disb. Entry Auth
Scenario : 11.Withdrawal Payment Entry of Second Loan Disb. Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters voucher num "<VouchNumStoreInCache>" on Withdrawal Payment Entry Screen
Then user verify voucher number "<VouchNumStoreInCache>" & token Num "<Token>" & Voucher Amount "<VoucherAmount>" on Ui
When user enter denominations "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then user click on Submit button of Withdrawal Payment Entry Screen
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then verify LOAN_MASTER table where accNo "<accNo>" and remark "<Remark>" and disbDateDb "<disbDateDb>" and disbAmountDb "<disbAmountDbDenom>"
Then verify ACCOUNT_MASTER table where accNo "<accNo>" and remark "<Remark>" and ShadowBal "<ShadowBal>" and AvailableBal "<AvailableBal>" and LedgerBal "<LedgerBal>" and ProdInstYN "<ProdInstYN>" after Auth and flow "<Flow>"
Then verify Transaction_Header table TRANS_AMT "<disbAmountDb>" where voucher num "<VouchNumStoreInCache>" and transType "<TransType>" and flow "<Flow>"
Then verify Transactions table after Auth TRANS_AMT "<disbAmountDb>" accNo "<accNo>"  where voucher_num "<VouchNumStoreInCache>" and tranType "<TransType>" and flow "<Flow>" with Denom Y
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|VouchNumStoreInCache|Token|VoucherAmount|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|accNo|Remark|disbDateDb|disbAmountDbDenom|ShadowBal|AvailableBal|LedgerBal|ProdInstYN|Flow|disbAmountDb|TransType|
|Payment Withdrawal of Second Loan Disb. of AW|Payment Withdrawal|Menu_CashPayment|AWLoanDisbSecondVouchNumWithDenom|1|80000|0|0|0|0|0|0|0|0|0|0|0|400|0|0|0|0|0|0|101210104000000032|Second|2020-02-23|130000.00|0.00|-80000.00|-80000.00|Y|CashPaymentAuth|80000.00|W|
|Payment Withdrawal of Second Loan Disb. of CP|Payment Withdrawal|Menu_CashPayment|CPLoanDisbSecondVouchNumWithDenom|2|9000|0|0|0|0|0|0|0|0|0|4|2|0|0|0|0|0|0|0|101210104100000215|Second|2020-02-23|14000.00|0.00|-9000.00|-9000.00|Y|CashPaymentAuth|9000.00|W|
|Payment Withdrawal of Second Loan Disb. of RI|Payment Withdrawal|Menu_CashPayment|RILoanDisbSecondVouchNumWithDenom|3|8000|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0|0|0|0|101210104200000041|Second|2020-02-23|28000.00|0.00|-8000.00|-8000.00|Y|CashPaymentAuth|8000.00|W|
|Payment Withdrawal of Second Loan Disb. of RC|Payment Withdrawal|Menu_CashPayment|RCLoanDisbSecondVouchNumWithDenom|4|300000|0|0|0|0|0|0|0|0|0|150|0|0|0|0|0|0|0|0|101210105910000122|Second|2020-02-23|350000.00|0.00|-300000.00|-300000.00|Y|CashPaymentAuth|300000.00|W|
|Payment Withdrawal of Second Loan Disb. of CL|Payment Withdrawal|Menu_CashPayment|CLLoanDisbSecondVouchNumWithDenom|5|200000|0|0|0|0|0|0|0|0|0|0|400|0|0|0|0|0|0|0|101210105920000187|Second|2020-02-23|300000.00|0.00|-200000.00|-200000.00|Y|CashPaymentAuth|200000.00|W|


@LoanDisbWithDenom @setUp 
Scenario Outline: 12.Loan Disbursement Screen Tearup
Scenario : 12.Loan Disbursement Screen Tearup
Given User Tearup automation for Parent Report
Examples:
|testCase|
||
