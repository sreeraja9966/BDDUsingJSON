
package com.sysnik.selenium.RunnerPackage;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)

@CucumberOptions(features = { "src\\main\\resources\\Features" }, glue = { "com.sysnik.selenium.stepConfiguraiton" },
        tags = { "@login" }, dryRun = false,format = {"pretty", "html:target/Destination"} )
public class TestRunner {
    
}
