Feature: CBS Login Functionality 

@login @sanity
Scenario Outline: Verification CBS Login


Given  user open chrome browser with "<url>"		
Given User Should get logoutFrom Cbs application


When Enter "<bankcode>" the "<Username>" and "<Password>"			


Then click on login

Examples:
|url|bankcode|Username|Password|
|http://172.16.0.135:92/cbs|101|1|Sysnik@123|
