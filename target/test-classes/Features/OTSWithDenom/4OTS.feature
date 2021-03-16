Feature: One Time Settelment Functionality 

@OTS @setUp
Scenario Outline: 1.One Time Settelment Entry Screen Setup
Scenario : 1.Instrument Inventory Entry Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup otsScreen
Examples:
|parentReport|
|OTS|

@OTS
Scenario Outline: 2.Loan Account with change ROI

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters loan "<accNo>"
When user click on General Info tab
Then verify following on ots screen "<CustomerName>" "<AccOpenDate>" "<ExpDate>" "<AvailableBal>" "<SancAmt>" "<Period>" "<OverDueAmt>" "<ReceivableAmt>"
When user click on Account Info tab
Then verify "<ROI>" "<PenalROI>" "<IntDue>" "<AssetsClassification>" "<PAReserve>" "<PenalInt>" "<NPAInt>" "<IntReceivable>" "<PayableAmt>"
When user click on Interest Calculation Tab
And user select "<NewInterestCalcultion>" as Y  
And user select From Date "<FromDate>" To Date "<ToDate>"
And user select "<InterestCalType>" simple or compound 
And user enters new Rate of interest "<NewROI>"
And click on ADD record button
And observe "<TotalInt>" "<IntWaiver>" "<TotalReceivableAmt>"
When user select "<ModeOfPayableRceivableAmt>"
Then observe transaction amount "<TotalReceivableAmt>"

And user enters Remark "<Remark>"
When user click on submit on ots Screen
And user click on voucherDisplayConfirm button
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then user finds successMessage "<successMessage2>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<accNo>"
Then verify Transaction_Header table TRANS_AMT "<TotalReceivableAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Header table child voucher col TRANS_AMT "<TotalIntPulsWavierInt>" where Parentvoucher_num "<StoreInCache>"
Then verify Transaction_Details table TRANS_AMT "<TotalReceivableAmt>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify Transaction_Details table child voucher CreditAmount with Debit amount where child Voucher is "<StoreInCache>" 
Then verify LOAN_SETTLEMENT_LOG table col ACTUAL_INT_AMT "<IntDue>" INT_WAIVER_AMT "<IntWaiver>" RECIEVABLE_AMT "<TotalReceivableAmt>" Status "<status>" where accNo "<accNo>"
Then verify OTS_INT_WAIVER_LOG table col INT_TYPE "<InterestCalType>" FROM_DATE "<FromDate>" TO_DATE "<ToDate>" where accNo "<accNo>"

And user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|CustomerName|AccOpenDate|ExpDate|AvailableBal|SancAmt|Period|OverDueAmt|ReceivableAmt|ROI|PenalROI|IntDue|AssetsClassification|PAReserve|PenalInt|NPAInt|IntReceivable|PayableAmt|NewInterestCalcultion|FromDate|ToDate|InterestCalType|NewROI|TotalInt|IntWaiver|TotalReceivableAmt| ModeOfPayableRceivableAmt| TokenNo|Remark|StoreInCache|successMessage|successMessage2|KeyInCache|tranType|TotalIntPulsWavierInt|status|ShadowBal|
|Loan Account with change ROI|One Time Settlement|Menu_OneTimeSettlementEntry|101210102000000392|Automation customer G|23/06/2019|23/06/2020|-50,000.00|1,00,000.00|12|00|51,000|7.50|2.00|1000.00|STD|0.00|0.00|0.00|0|0.00|Y|01/07/2019|22/02/2020|Simple|2|105.53|894.47|50105.53|Cash|5|Settlement|LoanAccountwithchangeROI|Account Closed Successfully.|Successfully fetched OTS Waiver Records.|OneTimeSettlementEntry_ModelNumber|D|1894.47|E|50000|
|Loan Account with change ROI Entry For Rejection|One Time Settlement|Menu_OneTimeSettlementEntry|101210102000000416|Automation customer G|23/06/2019|23/06/2020|-50,000.00|1,00,000.00|12|00|51,000|7.50|2.00|1000.00|STD|0.00|0.00|0.00|0|0.00|Y|01/07/2019|22/02/2020|Simple|2|105.53|894.47|50105.53|Cash|5|Settlement|LoanAccountwithchangeROIRejection|Account Closed Successfully.|Successfully fetched OTS Waiver Records.|OneTimeSettlementEntry_ModelNumber|D|1894.47|E|50000|


@OTS
Scenario Outline: 6. Loan Account with change ROI authorization
Given user opens a testCase "<testCase>"
Given user Enter FromDenom for "<StoreInCache>" with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then verify Transaction_Header table after Denom TRANS_AMT "<TotalReceivableAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Given User is on "<MenuName>" "<MenuPath>"screen
When user selects loanAcc in OTS Auth Screen "<accNo>"
When user click on General Info tab
Then verify following on ots screen "<CustomerName>" "<AccOpenDate>" "<ExpDate>" "<AvailableBalonUI>" "<SancAmt>" "<Period>" "<OverDueAmt>" "<ReceivableAmt>"
When user click on Account Info tab
Then verify "<ROI>" "<PenalROI>" "<IntDue>" "<AssetsClassification>" "<PAReserve>" "<PenalInt>" "<NPAInt>" "<IntReceivable>" "<PayableAmt>"
When user click on Interest Calculation Tab
Then observe "<TotalInt>" "<IntWaiver>" "<TotalReceivableAmt>"
When user click on ots auth button
And user click on voucherDisplayConfirm button
Then user finds successMessage "<successMessage>"
Then verify LOAN_SETTLEMENT_LOG table col ACTUAL_INT_AMT "<IntDue>" INT_WAIVER_AMT "<IntWaiver>" RECIEVABLE_AMT "<TotalReceivableAmt>" Status "<status>" where accNo "<accNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<AvailableBal>" where accNo "<accNo>"
Then verify OTS_INT_WAIVER_LOG table col INT_TYPE "<InterestCalType>" FROM_DATE "<FromDate>" TO_DATE "<ToDate>" where accNo "<accNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<TotalReceivableAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
And user closes testCase

Examples:
|testCase|StoreInCache|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|MenuName|MenuPath|accNo|CustomerName|AccOpenDate|ExpDate|AvailableBal|SancAmt|Period|OverDueAmt|ReceivableAmt|ROI|PenalROI|IntDue|AssetsClassification|PAReserve|PenalInt|NPAInt|IntReceivable|PayableAmt|NewInterestCalcultion|FromDate|ToDate|InterestCalType|NewROI|TotalInt|IntWaiver|TotalReceivableAmt| ModeOfPayableRceivableAmt| TokenNo|Remark|StoreInCache|successMessage|successMessage2|KeyInCache|tranType|TotalIntPulsWavierInt|status|AvailableBalonUI|
|Loan Account with change ROI authorization|LoanAccountwithchangeROI|26|0|0|0|0|0|0|105|53|0|4|0|0|0|0|0|0|0|One Time Settlement|Menu_OneTimeSettlementAuth|101210102000000392|Automation customer G|23/06/2019|23/06/2020|0|1,00,000.00|12|00|51,000|7.50|2.00|1000.00|STD|0.00|0.00|0.00|0|0.00|Y|01/07/2019|22/02/2020|Simple|2|105.53|894.47|50105.53|Cash|5|Settlement|LoanAccountwithchangeROI|Successfully Authorized Account Closing.|Successfully fetched OTS Waiver Records.|OneTimeSettlementEntry_ModelNumber|D|1894.47|A|-50000|


@OTS
Scenario Outline: Loan Account with change ROI Rejection
Given user opens a testCase "<testCase>"
Given user Enter FromDenom for "<StoreInCache>" with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then verify Transaction_Header table after Denom TRANS_AMT "<TotalReceivableAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Given User is on "<MenuName>" "<MenuPath>"screen
When user selects loanAcc in OTS Auth Screen "<accNo>"
When user click on General Info tab
Then verify following on ots screen "<CustomerName>" "<AccOpenDate>" "<ExpDate>" "<AvailableBalonUI>" "<SancAmt>" "<Period>" "<OverDueAmt>" "<ReceivableAmt>"
When user click on Account Info tab
Then verify "<ROI>" "<PenalROI>" "<IntDue>" "<AssetsClassification>" "<PAReserve>" "<PenalInt>" "<NPAInt>" "<IntReceivable>" "<PayableAmt>"
When user click on Interest Calculation Tab
Then observe "<TotalInt>" "<IntWaiver>" "<TotalReceivableAmt>"
When user click on ots reject button
Then user finds successMessage "<successMessage>"
Then verify LOAN_SETTLEMENT_LOG table col ACTUAL_INT_AMT "<IntDue>" INT_WAIVER_AMT "<IntWaiver>" RECIEVABLE_AMT "<TotalReceivableAmt>" Status "<status>" where accNo "<accNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<accNo>"
Then verify OTS_INT_WAIVER_LOG table col INT_TYPE "<InterestCalType>" FROM_DATE "<FromDate>" TO_DATE "<ToDate>" where accNo "<accNo>"
Then verify Transaction_Header table after Rejection TRANS_AMT "<TotalReceivableAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>" while Reject
And user closes testCase

Examples:
|testCase|StoreInCache|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|MenuName|MenuPath|accNo|CustomerName|AccOpenDate|ExpDate|AvailableBal|SancAmt|Period|OverDueAmt|ReceivableAmt|ROI|PenalROI|IntDue|AssetsClassification|PAReserve|PenalInt|NPAInt|IntReceivable|PayableAmt|NewInterestCalcultion|FromDate|ToDate|InterestCalType|NewROI|TotalInt|IntWaiver|TotalReceivableAmt| ModeOfPayableRceivableAmt| TokenNo|Remark|StoreInCache|successMessage|successMessage2|KeyInCache|tranType|TotalIntPulsWavierInt|status|AvailableBalonUI|ShadowBal|
|Loan Account with change ROI Rejection|LoanAccountwithchangeROIRejection|26|0|0|0|0|0|0|105|53|0|4|0|0|0|0|0|0|0|One Time Settlement|Menu_OneTimeSettlementAuth|101210102000000416|Automation customer G|23/06/2019|23/06/2020|-50000|1,00,000.00|12|00|51,000|7.50|2.00|1000.00|STD|0.00|0.00|0.00|0|0.00|Y|01/07/2019|22/02/2020|Simple|2|105.53|894.47|50105.53|Cash|5|Settlement|LoanAccountwithchangeROI|Successfully Rejected Account Closing.|Successfully fetched OTS Waiver Records.|OneTimeSettlementEntry_ModelNumber|D|1894.47|R|-50000|0|

@OTS
Scenario Outline: 2.Loan Account with manual waiver

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters loan "<accNo>"
When user click on General Info tab
Then verify following on ots screen "<CustomerName>" "<AccOpenDate>" "<ExpDate>" "<AvailableBal>" "<SancAmt>" "<Period>" "<OverDueAmt>" "<ReceivableAmt>"
When user click on Account Info tab
Then verify "<ROI>" "<PenalROI>" "<IntDue>" "<AssetsClassification>" "<PAReserve>" "<PenalInt>" "<NPAInt>" "<IntReceivable>" "<PayableAmt>"
When user click on Interest Calculation Tab
And user select "<NewInterestCalcultion>" as Y  
And user enters Interest waiver amount "<IntWaiver>"
Then observe receivable amount "<TotalReceivableAmt>"
When user select "<ModeOfPayableRceivableAmt>"
Then observe transaction amount "<TotalReceivableAmt>"

And user enters Remark "<Remark>"
When user click on submit on ots Screen
And user click on voucherDisplayConfirm button
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<accNo>"
Then verify Transaction_Header table TRANS_AMT "<TotalReceivableAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Header table child voucher col TRANS_AMT "<TotalIntPulsWavierInt>" where Parentvoucher_num "<StoreInCache>"
Then verify Transaction_Details table TRANS_AMT "<TotalReceivableAmt>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify Transaction_Details table child voucher CreditAmount with Debit amount where child Voucher is "<StoreInCache>" 
Then verify LOAN_SETTLEMENT_LOG table col ACTUAL_INT_AMT "<IntDue>" INT_WAIVER_AMT "<IntWaiver>" RECIEVABLE_AMT "<TotalReceivableAmt>" Status "<status>" where accNo "<accNo>"
And user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|CustomerName|AccOpenDate|ExpDate|AvailableBal|SancAmt|Period|OverDueAmt|ReceivableAmt|ROI|PenalROI|IntDue|AssetsClassification|PAReserve|PenalInt|NPAInt|IntReceivable|PayableAmt|NewInterestCalcultion|IntWaiver|TotalReceivableAmt| ModeOfPayableRceivableAmt| TokenNo|Remark|StoreInCache|successMessage|successMessage2|KeyInCache|tranType|TotalIntPulsWavierInt|status|ShadowBal|
|with manual waiver|One Time Settlement|Menu_OneTimeSettlementEntry|101210102000000394|Automation customer G|23/06/2019|23/06/2020|-50,000.00|1,00,000.00|12|00|51,000|7.50|2.00|1000.00|STD|0.00|0.00|0.00|0|0.00|N|1000|50000|Cash|5|Settlement|withmanualwaiver|Account Closed Successfully.|Successfully fetched OTS Waiver Records.|OneTimeSettlementEntry_ModelNumber|D|2000|E|50000|
|with manual waiver Entry For Rejection|One Time Settlement|Menu_OneTimeSettlementEntry|101210102000000417|Automation customer G|23/06/2019|23/06/2020|-50,000.00|1,00,000.00|12|00|51,000|7.50|2.00|1000.00|STD|0.00|0.00|0.00|0|0.00|N|1000|50000|Cash|5|Settlement|withmanualwaiverRejection|Account Closed Successfully.|Successfully fetched OTS Waiver Records.|OneTimeSettlementEntry_ModelNumber|D|2000|E|50000|

@OTS
Scenario Outline: 1.Loan Account with manual waiver Authorization

Given user opens a testCase "<testCase>"
Given user Enter FromDenom for "<StoreInCache>" with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user selects loanAcc in OTS Auth Screen "<accNo>"
When user click on General Info tab
Then verify following on ots screen "<CustomerName>" "<AccOpenDate>" "<ExpDate>" "<AvailableBalonUI>" "<SancAmt>" "<Period>" "<OverDueAmt>" "<ReceivableAmt>"
When user click on Account Info tab
Then verify "<ROI>" "<PenalROI>" "<IntDue>" "<AssetsClassification>" "<PAReserve>" "<PenalInt>" "<NPAInt>" "<IntReceivable>" "<PayableAmt>"
When user click on Interest Calculation Tab
When user click on ots auth button
And user click on voucherDisplayConfirm button
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<AvailableBal>" where accNo "<accNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<TotalReceivableAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify LOAN_SETTLEMENT_LOG table col ACTUAL_INT_AMT "<IntDue>" INT_WAIVER_AMT "<IntWaiver>" RECIEVABLE_AMT "<TotalReceivableAmt>" Status "<status>" where accNo "<accNo>"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
And user closes testCase

Examples:
|testCase|StoreInCache|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|MenuName|MenuPath|accNo|CustomerName|AccOpenDate|ExpDate|AvailableBal|SancAmt|Period|OverDueAmt|ReceivableAmt|ROI|PenalROI|IntDue|AssetsClassification|PAReserve|PenalInt|NPAInt|IntReceivable|PayableAmt|NewInterestCalcultion|IntWaiver|TotalReceivableAmt| ModeOfPayableRceivableAmt| TokenNo|Remark|StoreInCache|successMessage|successMessage2|KeyInCache|tranType|TotalIntPulsWavierInt|status|AvailableBalonUI|
|Loan Account with manual waiver Authorization|withmanualwaiver|25|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|One Time Settlement|Menu_OneTimeSettlementAuth|101210102000000394|Automation customer G|23/06/2019|23/06/2020|0|1,00,000.00|12|00|51,000|7.50|2.00|1000.00|STD|0.00|0.00|0.00|0|0.00|N|1000|50000|Cash|5|Settlement|withmanualwaiver|Successfully Authorized Account Closing.|Successfully fetched OTS Waiver Records.|OneTimeSettlementEntry_ModelNumber|D|2000|A|-50000|


@OTS
Scenario Outline: 1.Loan Account with manual waiver Rejection

Given user opens a testCase "<testCase>"
Given user Enter FromDenom for "<StoreInCache>" with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user selects loanAcc in OTS Auth Screen "<accNo>"
When user click on General Info tab
Then verify following on ots screen "<CustomerName>" "<AccOpenDate>" "<ExpDate>" "<AvailableBal>" "<SancAmt>" "<Period>" "<OverDueAmt>" "<ReceivableAmt>"
When user click on Account Info tab
Then verify "<ROI>" "<PenalROI>" "<IntDue>" "<AssetsClassification>" "<PAReserve>" "<PenalInt>" "<NPAInt>" "<IntReceivable>" "<PayableAmt>"
When user click on Interest Calculation Tab
When user click on ots reject button
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<accNo>"
Then verify Transaction_Header table after Rejection TRANS_AMT "<TotalReceivableAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify LOAN_SETTLEMENT_LOG table col ACTUAL_INT_AMT "<IntDue>" INT_WAIVER_AMT "<IntWaiver>" RECIEVABLE_AMT "<TotalReceivableAmt>" Status "<status>" where accNo "<accNo>"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>" while Reject 
And user closes testCase

Examples:
|testCase|StoreInCache|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|MenuName|MenuPath|accNo|CustomerName|AccOpenDate|ExpDate|AvailableBal|SancAmt|Period|OverDueAmt|ReceivableAmt|ROI|PenalROI|IntDue|AssetsClassification|PAReserve|PenalInt|NPAInt|IntReceivable|PayableAmt|NewInterestCalcultion|IntWaiver|TotalReceivableAmt| ModeOfPayableRceivableAmt| TokenNo|Remark|StoreInCache|successMessage|successMessage2|KeyInCache|tranType|TotalIntPulsWavierInt|status|ShadowBal|
|Loan Account with manual waiver Rejection|withmanualwaiverRejection|25|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|One Time Settlement|Menu_OneTimeSettlementAuth|101210102000000417|Automation customer G|23/06/2019|23/06/2020|-50000|1,00,000.00|12|00|51,000|7.50|2.00|1000.00|STD|0.00|0.00|0.00|0|0.00|N|1000|50000|Cash|5|Settlement|withmanualwaiver|Successfully Rejected Account Closing.|Successfully fetched OTS Waiver Records.|OneTimeSettlementEntry_ModelNumber|D|2000|R|0|




@OTS

Scenario Outline: 4.Loan Account with Transfer Mode

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters loan "<accNo>"
When user click on General Info tab
Then verify following on ots screen "<CustomerName>" "<AccOpenDate>" "<ExpDate>" "<AvailableBal>" "<SancAmt>" "<Period>" "<OverDueAmt>" "<ReceivableAmt>"
When user click on Account Info tab
Then verify "<ROI>" "<PenalROI>" "<IntDue>" "<AssetsClassification>" "<PAReserve>" "<PenalInt>" "<NPAInt>" "<IntReceivable>" "<PayableAmt>"
When user click on Interest Calculation Tab
And user select "<NewInterestCalcultion>" as Y  
And user enters Interest waiver amount "<IntWaiver>"
Then observe receivable amount "<TotalReceivableAmt>"
When user select "<ModeOfPayableRceivableAmt>"
When user enter transfer account Number in ModeOfPayable Screen "<TransferAccNo>"
And observe name of account holder in ModeOfPayable Screen "<NameOfAccHolder>"
Then observe transfer transaction amount "<TotalReceivableAmt>"
When user enters TransferRemark "<Remark>"
And click on ADD record button in ModeOfPayable Screen
When user click on submit on ots Screen
And user click on voucherDisplayConfirm button
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<accNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<TrasferAccBalnc>" and ShadowBal "<TrasferAccShadwBalnc>" where accNo "<TransferAccNo>"
Then verify Transaction_Header table TRANS_AMT "<TotalReceivableAmtInHeader>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details table TRANS_AMT "<TotalReceivableAmt>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify Transaction_Details table TRANS_AMT "<TotalReceivableAmt>" accNo "<TransferAccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify LOAN_SETTLEMENT_LOG table col ACTUAL_INT_AMT "<IntDue>" INT_WAIVER_AMT "<IntWaiver>" RECIEVABLE_AMT "<TotalReceivableAmt>" Status "<status>" where accNo "<accNo>"
And user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|CustomerName|AccOpenDate|ExpDate|AvailableBal|SancAmt|Period|OverDueAmt|ReceivableAmt|ROI|PenalROI|IntDue|AssetsClassification|PAReserve|PenalInt|NPAInt|IntReceivable|PayableAmt|NewInterestCalcultion|IntWaiver|TotalReceivableAmt| ModeOfPayableRceivableAmt| TokenNo|Remark|StoreInCache|successMessage|successMessage2|KeyInCache|tranType|TotalIntPulsWavierInt|status|TransferAccNo|NameOfAccHolder|TrasferAccBalnc|TotalReceivableAmtInHeader|ShadowBal|TrasferAccShadwBalnc|
|Loan Account with Transfer Mode|One Time Settlement|Menu_OneTimeSettlementEntry|101210102000000393|Automation customer G|23/06/2019|23/06/2020|-50,000.00|1,00,000.00|12|00|51,000|7.50|2.00|1000.00|STD|0.00|0.00|0.00|0|0.00|N|1000|50000|transfer|5|Settlement|LoanAccountwithTransferMode|Account Closed Successfully.|Successfully fetched OTS Waiver Records.|OneTimeSettlementEntry_ModelNumber|T|2000|E|101210101100000836|Automation customer G|50000|52000|50000|-50000|
|Loan Account with Transfer Mode Rejection Entry|One Time Settlement|Menu_OneTimeSettlementEntry|101210102000000418|Automation customer G|23/06/2019|23/06/2020|-50,000.00|1,00,000.00|12|00|51,000|7.50|2.00|1000.00|STD|0.00|0.00|0.00|0|0.00|N|1000|50000|transfer|5|Settlement|LoanAccountwithTransferModeRejection|Account Closed Successfully.|Successfully fetched OTS Waiver Records.|OneTimeSettlementEntry_ModelNumber|T|2000|E|101210101100000859|Automation customer G|50000|52000|50000|-50000|
@OTS
Scenario Outline: 1.Loan Account with Transfer Mode Authorization

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user selects loanAcc in OTS Auth Screen "<accNo>"
When user click on General Info tab
Then verify following on ots screen "<CustomerName>" "<AccOpenDate>" "<ExpDate>" "<AvailableBalOnUI>" "<SancAmt>" "<Period>" "<OverDueAmt>" "<ReceivableAmt>"
When user click on Account Info tab
Then verify "<ROI>" "<PenalROI>" "<IntDue>" "<AssetsClassification>" "<PAReserve>" "<PenalInt>" "<NPAInt>" "<IntReceivable>" "<PayableAmt>"
When user click on Interest Calculation Tab
When user click on ots auth button
And user click on voucherDisplayConfirm button
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<AvailableBal>" where accNo "<accNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<TrasferAccBalnc>" and ShadowBal "<TrasferAccBalnc>" where accNo "<TransferAccNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<TotalReceivableAmtInHeader>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify LOAN_SETTLEMENT_LOG table col ACTUAL_INT_AMT "<IntDue>" INT_WAIVER_AMT "<IntWaiver>" RECIEVABLE_AMT "<TotalReceivableAmt>" Status "<status>" where accNo "<accNo>"
And user closes testCase


Examples:
|testCase|MenuName|MenuPath|accNo|CustomerName|AccOpenDate|ExpDate|AvailableBal|SancAmt|Period|OverDueAmt|ReceivableAmt|ROI|PenalROI|IntDue|AssetsClassification|PAReserve|PenalInt|NPAInt|IntReceivable|PayableAmt|NewInterestCalcultion|IntWaiver|TotalReceivableAmt| ModeOfPayableRceivableAmt| TokenNo|Remark|StoreInCache|successMessage|successMessage2|KeyInCache|tranType|TotalIntPulsWavierInt|status|TransferAccNo|NameOfAccHolder|TrasferAccBalnc|TotalReceivableAmtInHeader|AvailableBalOnUI|
|Loan Account with Transfer Mode Authorization|One Time Settlement|Menu_OneTimeSettlementAuth|101210102000000393|Automation customer G|23/06/2019|23/06/2020|0|1,00,000.00|12|00|51,000|7.50|2.00|1000.00|STD|0.00|0.00|0.00|0|0.00|N|1000|50000|transfer|5|Settlement|LoanAccountwithTransferMode|Successfully Authorized Account Closing.|Successfully fetched OTS Waiver Records.|OneTimeSettlementEntry_ModelNumber|T|2000|A|101210101100000836|Automation customer G|0|52000|-50000|
@OTS
Scenario Outline: 1.Loan Account with Transfer Mode Rejection

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user selects loanAcc in OTS Auth Screen "<accNo>"
When user click on General Info tab
Then verify following on ots screen "<CustomerName>" "<AccOpenDate>" "<ExpDate>" "<AvailableBalOnUI>" "<SancAmt>" "<Period>" "<OverDueAmt>" "<ReceivableAmt>"
When user click on Account Info tab
Then verify "<ROI>" "<PenalROI>" "<IntDue>" "<AssetsClassification>" "<PAReserve>" "<PenalInt>" "<NPAInt>" "<IntReceivable>" "<PayableAmt>"
When user click on Interest Calculation Tab
When user click on ots reject button
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<accNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<TrasferAccBalnc>" and ShadowBal "<ShadowBal>" where accNo "<TransferAccNo>"
Then verify Transaction_Header table after Rejection TRANS_AMT "<TotalReceivableAmtInHeader>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify LOAN_SETTLEMENT_LOG table col ACTUAL_INT_AMT "<IntDue>" INT_WAIVER_AMT "<IntWaiver>" RECIEVABLE_AMT "<TotalReceivableAmt>" Status "<status>" where accNo "<accNo>"
And user closes testCase


Examples:
|testCase|MenuName|MenuPath|accNo|CustomerName|AccOpenDate|ExpDate|AvailableBal|SancAmt|Period|OverDueAmt|ReceivableAmt|ROI|PenalROI|IntDue|AssetsClassification|PAReserve|PenalInt|NPAInt|IntReceivable|PayableAmt|NewInterestCalcultion|IntWaiver|TotalReceivableAmt| ModeOfPayableRceivableAmt| TokenNo|Remark|StoreInCache|successMessage|successMessage2|KeyInCache|tranType|TotalIntPulsWavierInt|status|TransferAccNo|NameOfAccHolder|TrasferAccBalnc|TotalReceivableAmtInHeader|AvailableBalOnUI|ShadowBal|
|Loan Account with Transfer Mode Rejection|One Time Settlement|Menu_OneTimeSettlementAuth|101210102000000418|Automation customer G|23/06/2019|23/06/2020|-50000|1,00,000.00|12|00|51,000|7.50|2.00|1000.00|STD|0.00|0.00|0.00|0|0.00|N|1000|50000|transfer|5|Settlement|LoanAccountwithTransferModeRejection|Successfully Rejected Account Closing.|Successfully fetched OTS Waiver Records.|OneTimeSettlementEntry_ModelNumber|T|2000|R|101210101100000859|Automation customer G|50000|52000|-50000|0|








@OTS
Scenario Outline: 5.Check Validation Message with savings account

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters loan "<accNo>"
Then verify validation Message on Get Call "GetCallValidationXpath" "<ValidationMessage>"

Examples:
|testCase|MenuName|MenuPath|accNo|ValidationMessage|GetCallValidationXpath|
|Check Validation Message with savings account|One Time Settlement|Menu_OneTimeSettlementEntry|101210101100000816|Can't Proceed, Enter valid Loan Account|Common_GetCallValidationMessage|

@OTS @setUp
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||