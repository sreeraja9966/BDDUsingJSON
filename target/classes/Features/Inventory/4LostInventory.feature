Feature: Mark Lost Instrument Inventory Functionality 

@LostInventory @setUp @sanity
Scenario Outline: 1.Lost Instrument Inventory Entry Screen Setup
Scenario : 1.Instrument Inventory Entry Screen Setup
Given User starts a parentReport "<parentReport>"
Examples:
|parentReport|
|Lost Instrument Inventory| 
@LostInventory @sanity
Scenario Outline:1. Mark Lost Inventory Entry for Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user select "<InstrumentType>" from Instrument Type dropdown
Then Verify "<InventroyBranchwise>" in Inventroy Branch-wise filed
When user select "<Prefix>" from Prefix dropdown
And user select "<Sufix>" from Sufix dropdown
And user select "<StartNumber>" from StartNumber dropdown on Lost screen
And user select "<EndNumber>" from End Number dropdown on Lost screen
And user entres "<Remarks>" enter remark on Lost screen
And user click on submit button on Lost screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify INVENTORYBOOKWISE tables status column "<col1Value>" where series "<valueOfcondition1>" and startNo "<StartNumber>"
Then verify INVENTORYBOOKWISELog tables status column "<col2Value>" where series "<valueOfcondition1>" and bacthNo "<StoreInCache>" and startNo "<StartNumber>"
And user closes testCase

Examples:
|testCase|MenuName|MenuPath|InstrumentType|InventroyBranchwise|Prefix|Sufix|StartNumber|EndNumber|Remarks|successMessage|StoreInCache|KeyInCache|col1Value|valueOfcondition1|col2Value|
|Mark Lost Inventory Entry for Rejection|Mark Lost Inventory|Menu_MarkLostInventoryEntry|10 - Saving Account|Head Office Wise|SBCH1 - Saving Bank Check series 1|/2020 - Saving Bank Check series 1|11230|11239|Lost Inventory|Successfully lost marked instrument inventory.|MarKLostInventoryforRejection|MarkLostInventory_ModelValue|M|SBCH1|E|
 @LostInventory @sanity
Scenario Outline: Mark Lost Inventory Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then Verify "<InstrumentType>" on Instrument Type filed on Mark Lost Inventory
Then Verify "<InventryBranchWise>" in Inventry Branch Wise filed on Mark Lost Inventory
Then Verify Batch No in Batch Number filed"<ValueFromCache>" on Mark Lost Inventory
Then Verify "<Prefix>" in Prefix filed on Mark Lost Inventory
Then Verify "<Sufix>" in Sufix filed on Mark Lost Inventory
Then Verify "<StartNumber>" in Start Number filed on Mark Lost Inventory
Then Verify "<EndNumber>" in End Number filed on Mark Lost Inventory
Then Verify "<Remarks>" in Remarks filed on Mark Lost Inventory
When user select Authorize checkbox from available record on Lost Auth screen
When user click on Rejection on Mark Lost Auth screen
And user select "<RejectionReason>" from Reason Type  dropdown
When user click on RejectionSave
Then user finds "<RejectionMessage>"
Then verify INVENTORYBOOKWISE tables status column "<col1Value>" where series "<valueOfcondition1>" and startNo "<StartNumber>"
Then verify INVENTORYBOOKWISELog tables status column "<col2Value>" where series "<valueOfcondition1>" and bacthNo "<ValueFromCache>" and startNo "<StartNumber>"
And user closes testCase

Examples:
|testCase|MenuName|MenuPath|InstrumentType|InventryBranchWise|ValueFromCache|Prefix|Sufix|StartNumber|EndNumber|Remarks|successMessage|col1Value|valueOfcondition1|col2Value|RejectionReason|RejectionMessage|
|Mark Lost Inventory Rejection|Mark Lost Inventory|Menu_MarkLostInventoryAuth|10 - Saving Account|Head Office Wise|MarKLostInventoryforRejection|SBCH1|/2020|11230|11239|Lost Inventory|Successfully authorized lost instrument Inventory.|A|SBCH1|R|Other|Successfully rejected lost instrument Inventory.|

 
@LostInventory @sanity
Scenario Outline:1. Mark Lost Inventory Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user select "<InstrumentType>" from Instrument Type dropdown
Then Verify "<InventroyBranchwise>" in Inventroy Branch-wise filed
When user select "<Prefix>" from Prefix dropdown
And user select "<Sufix>" from Sufix dropdown
And user select "<StartNumber>" from StartNumber dropdown on Lost screen
And user select "<EndNumber>" from End Number dropdown on Lost screen
And user entres "<Remarks>" enter remark on Lost screen
And user click on submit button on Lost screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify INVENTORYBOOKWISE tables status column "<col1Value>" where series "<valueOfcondition1>" and startNo "<StartNumber>"
Then verify INVENTORYBOOKWISELog tables status column "<col2Value>" where series "<valueOfcondition1>" and bacthNo "<StoreInCache>" and startNo "<StartNumber>"
And user closes testCase

Examples:
|testCase|MenuName|MenuPath|InstrumentType|InventroyBranchwise|Prefix|Sufix|StartNumber|EndNumber|Remarks|successMessage|StoreInCache|KeyInCache|col1Value|valueOfcondition1|col2Value|
|Mark Lost Inventory Entry|Mark Lost Inventory|Menu_MarkLostInventoryEntry|10 - Saving Account|Head Office Wise|SBCH1 - Saving Bank Check series 1|/2020 - Saving Bank Check series 1|11230|11239|Lost Inventory|Successfully lost marked instrument inventory.|MarKLostInventory|MarkLostInventory_ModelValue|M|SBCH1|E|

@LostInventory @sanity
Scenario Outline: Mark Lost Inventory Authorization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then Verify "<InstrumentType>" on Instrument Type filed on Mark Lost Inventory
Then Verify "<InventryBranchWise>" in Inventry Branch Wise filed on Mark Lost Inventory
Then Verify Batch No in Batch Number filed"<ValueFromCache>" on Mark Lost Inventory
Then Verify "<Prefix>" in Prefix filed on Mark Lost Inventory
Then Verify "<Sufix>" in Sufix filed on Mark Lost Inventory
Then Verify "<StartNumber>" in Start Number filed on Mark Lost Inventory
Then Verify "<EndNumber>" in End Number filed on Mark Lost Inventory
Then Verify "<Remarks>" in Remarks filed on Mark Lost Inventory
When user select Authorize checkbox from available record on Lost Auth screen
When user click on Authorize on Mark Lost Auth screen
Then user finds successMessage "<successMessage>"
Then verify INVENTORYBOOKWISE tables status column "<col1Value>" where series "<valueOfcondition1>" and startNo "<StartNumber>"
Then verify INVENTORYBOOKWISELog tables status column "<col2Value>" where series "<valueOfcondition1>" and bacthNo "<ValueFromCache>" and startNo "<StartNumber>"
And user closes testCase

Examples:
|testCase|MenuName|MenuPath|InstrumentType|InventryBranchWise|ValueFromCache|Prefix|Sufix|StartNumber|EndNumber|Remarks|successMessage|col1Value|valueOfcondition1|col2Value|
|Mark Lost Inventory Authorization|Mark Lost Inventory|Menu_MarkLostInventoryAuth|10 - Saving Account|Head Office Wise|MarKLostInventory|SBCH1|/2020|11230|11239|Lost Inventory|Successfully authorized lost instrument Inventory.|L|SBCH1|A|

@LostInventory @setUp @sanity
Scenario Outline: 5.Mark Lost Instrument Inventory Entry Screen Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||