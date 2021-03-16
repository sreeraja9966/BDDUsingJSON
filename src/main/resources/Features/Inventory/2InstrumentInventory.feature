Feature: Instrument Inventory Functionality 

@InstrumentInventory @setUp @sanity
Scenario Outline: 1.Instrument Inventory Entry Screen Setup
Scenario : 1.Instrument Inventory Entry Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup instrument inventory screen

Examples:
|parentReport|
|Instrument Inventory| 

@InstrumentInventory @sanity
Scenario Outline: 2.Duplicate Instrument Inventory Entry
Scenario : 2.Duplicate Instrument Inventory Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user select "<InstrumentType>" from Instrument Type dropdown
Then Verify "<InventroyBranchwise>" in Inventroy Branch-wise filed
When user select "<NoOfInstrument>" from Number Of Instrument dropdown
And user entres "<QuantityOfBook>" 
And user select "<Prefix>" from Prefix dropdown
And user select "<Sufix>" from Sufix dropdown
When user entres startNumber "<StartNumber>"
Then Verify "<EndNumber>"  in End number filed
When user entres Remarks "<Remarks>"
And user click on submitButton
Then user finds validationMessage"<ErrorMessage>"
And user closes testCase

Examples:
|testCase|MenuName|MenuPath|InstrumentType|InventroyBranchwise|NoOfInstrument|QuantityOfBook|Prefix|Sufix|StartNumber|EndNumber|Remarks|ErrorMessage|
|Duplicate Instrument Inventory Entry|Instrument Inventory|Menu_InstrumentInventoryEntry|10 - Saving Account|Head office wise|10|1|SBCH1 - Saving Bank Check series 1|/2020 - Saving Bank Check series 1|1|10|Instrument Inventory Entry Done by BM| Inventory already exists for entered start number and end number.|

@InstrumentInventory @sanity
Scenario Outline: 3.Instrument Inventory Entry
Scenario : 3.Instrument Inventory Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user select "<InstrumentType>" from Instrument Type dropdown
Then Verify "<InventroyBranchwise>" in Inventroy Branch-wise filed
When user select "<NoOfInstrument>" from Number Of Instrument dropdown
And user entres "<QuantityOfBook>" 
And user select "<Prefix>" from Prefix dropdown
And user select "<Sufix>" from Sufix dropdown
When user entres startNumber "<StartNumber>"
Then Verify "<EndNumber>"  in End number filed
When user entres Remarks "<Remarks>"
And user click on submitButton
Then store number on model with name "<StoreinCache>"
Then user finds successMessage "<successMessage>"
Then verify INVENTORYBOOKWISE tables status column "<col1Value>" where series "<valueOfcondition1>" and bacthNo "<StoreinCache>" and startNo "<StartNumber>" 


Examples:
|testCase|MenuName|MenuPath|InstrumentType|InventroyBranchwise|NoOfInstrument|QuantityOfBook|Prefix|Sufix|StartNumber|EndNumber|Remarks|StoreinCache|successMessage|col1Value|valueOfcondition1|
| Instrument Inventory Entry|Instrument Inventory|Menu_InstrumentInventoryEntry|10 - Saving Account|Head office wise|10|1|SBCH1 - Saving Bank Check series 1|/2020 - Saving Bank Check series 1|11230|11239|Instrument Inventory Entry Done by BM|InstrumentInventory|Successfully done the instrument entry.|E|SBCH1|
@InstrumentInventory @sanity
Scenario Outline: 4.Instrument Inventory Authorization
Scenario : 4.Instrument Inventory Authorization
Given User is on "<MenuName>" "<MenuPath>"screen

And user opens a testCase "<testCase>"
Then Verify "<Instr.Type>" on Instrument Type filed
Then Verify "<Inventry Branch Wise>" in Inventry Branch Wise filed
Then Verify Batch No in Batch Number filed"<ValueFromCache>"
Then Verify "<Quant.of Books>" in Quantity Of Book filed
Then Verify "<No.of Instrum.>" in Number of Instrument  filed
Then Verify "<Prefix>" in Prefix filed
Then Verify "<Sufix>" in Sufix filed
Then Verify "<StartNumber>" in Start Number filed
Then Verify "<EndNumber>" in End Number filed
Then Verify "<Remarks>" in Remarks filed
And user select Authorize checkbox from available record on screen
When user click on Authorize
Then user finds successMessage "<successMessage>"
Then verify INVENTORYBOOKWISE tables status column "<col1Value>" where series "<valueOfcondition1>" and bacthNo "<ValueFromCache>" and startNo "<StartNumber>" 


Examples:
|testCase|MenuName|MenuPath|Instr.Type|Inventry Branch Wise|ValueFromCache|Quant.of Books|No.of Instrum.|Prefix|Sufix|StartNumber|EndNumber|Remarks|successMessage|col1Value|valueOfcondition1|
|Instrument Inventory Authorization|Instrument Inventory|Menu_InstrumentInventoryAuth|Saving Account|Head Office Wise|InstrumentInventory|1|10|SBCH1|/2020|11230|11239|Instrument Inventory Entry Done by BM|Successfully authorized instrument Inventory.|A|SBCH1|

@InstrumentInventory @sanity
Scenario Outline: 5.Instrument Inventory Rejection
Scenario : 5.Instrument Inventory Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user select "<InstrumentType>" from Instrument Type dropdown
Then Verify "<InventroyBranchwise>" in Inventroy Branch-wise filed
When user select "<NoOfInstrument>" from Number Of Instrument dropdown
And user entres "<QuantityOfBook>" 
And user select "<Prefix>" from Prefix dropdown
And user select "<Sufix>" from Sufix dropdown
When user entres startNumber "<StartNumber>"
Then Verify "<EndNumber>"  in End number filed
When user entres Remarks "<Remarks>"
And user click on submitButton
Then store number on model with name "<StoreinCache>"
Then user finds successMessage "<successMessage>"
Given User is on Instrument Inventory Authorization screen
Then user select Authorize checkbox from available record on screen
When user click on RejectButton
And user select "<RejectionReason>" from Reason Type  dropdown
When user click on RejectionSave
Then user finds "<RejectionMessage>"
Then verify INVENTORYBOOKWISELog tables status column "<col1Value>" where series "<valueOfcondition1>" and bacthNo "<StoreinCache>" and startNo "<StartNumber>"
And user closes testCase

Examples:
|testCase|MenuName|MenuPath|InstrumentType|InventroyBranchwise|NoOfInstrument|QuantityOfBook|Prefix|Sufix|StartNumber|EndNumber|Remarks|StoreinCache|successMessage|RejectionReason|RejectionMessage|col1Value|valueOfcondition1|
| Instrument Inventory Rejection|Instrument Inventory|Menu_InstrumentInventoryEntry|10 - Saving Account|Head office wise|10|1|SBCH1 - Saving Bank Check series 1|/2020 - Saving Bank Check series 1|5000000|5000009|Instrument Inventory Entry Done by BM|InstrumentEntryForRejection|Successfully done the instrument entry.|Invalid Start & End no |Successfully rejected instrument Inventory.|A|SBCH1|

@InstrumentInventory @setUp @sanity
Scenario Outline: 5.Instrument Inventory Entry Screen Tearup
Scenario : 5.Instrument Inventory Entry Screen Tearup
Given User Tearup automation for Parent Report
Examples:
|testCase|
||

