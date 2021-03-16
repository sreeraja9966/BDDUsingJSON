package com.sysnik.selenium.fw.helper;

import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.fw.testBase.TestBase;

public class DropDownHelper extends TestBase {
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    private static final Logger log = Logger.getLogger(DropDownHelper.class);
    FindElement findElement = AutomationObjectFactory.getFindElementInstance();
    SeleniumHelper seleniumHelper = AutomationObjectFactory.getSeleniumHelperInstance();
    FilloExcelDataGetter filloExcelDataGetter = AutomationObjectFactory.getFilloExcelDataGetterInstance();
    ConvertPropertyFileToMap convertPropertyFileToMap = AutomationObjectFactory.getConvertPropertyFileToMapInstance();
    
    public void selectByElement(String elements, String text) {
        
        try {
            String element = convertPropertyFileToMap.getPropertyFromMap(elements, xpathLocatorMap);
            WebElement ele = findElement.searchClickableElement(By.xpath(element));
            Select select = new Select(ele);
            List<WebElement> elementList = select.getOptions();
            List<String> valueList = new LinkedList<String>();
            log.info(elementList.size() + "=====================> size of dropdown list");
            for (WebElement dropEle : elementList) {
                
                log.info(dropEle.getText() + "**********" + text);
                //valueList.add(dropEle.getText());
                if (text.trim().equalsIgnoreCase(dropEle.getText().trim())) {
                    SelectUsingVisibleText(element, dropEle.getText());
                }
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public void selectByElementDependsOnAPI(String elements, String text) {
        
        try {
            Thread.sleep(10000);
            String element = convertPropertyFileToMap.getPropertyFromMap(elements, xpathLocatorMap);
            WebElement ele = findElement.searchClickableElement(By.xpath(element));
            Select select = new Select(ele);
            List<WebElement> elementList = select.getOptions();
            List<String> valueList = new LinkedList<String>();
            log.info(elementList.size() + "=====================> size of dropdown list");
            for (WebElement dropEle : elementList) {
                
                //log.info(dropEle.getText());
                //valueList.add(dropEle.getText());
                if (text.equalsIgnoreCase(dropEle.getText().trim())) {
                    SelectUsingVisibleText(element, dropEle.getText());
                }
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public String getSelectedValue(String xpath) {
        
        xpath = convertPropertyFileToMap.getPropertyFromMap(xpath, xpathLocatorMap);
        WebElement element = findElement.searchClickableElement(By.xpath(xpath));
        Select select = new Select(element);
        List<WebElement> elementList = select.getAllSelectedOptions();
        for (WebElement e : elementList) {
            log.info(e.getText() + "**************");
        }
        List<String> valueList = new LinkedList<String>();
        log.info(elementList.size() + "=====================> size of dropdown list");
        String value = select.getFirstSelectedOption().getText();
        log.info("WebELement : " + element + " Value : " + value);
        return value;
    }
    
    public void SelectUsingIndex(String element, int index) {
        element = convertPropertyFileToMap.getPropertyFromMap(element, xpathLocatorMap);
        
        try {
            WebElement ele = findElement.searchClickableElement(By.xpath(element));
            Select select = new Select(ele);
            select.selectByIndex(index);
            log.info("Locator : " + element + " Value : " + index);
            
        } catch (Exception e) {
            reportHelper.addScreenShotInCaseOfFailInReportInChild(index + ":: not found in the dropdown");
            log.error(e);
            
        }
    }
    
    public void SelectUsingVisibleText(String element, String text) {
        
        element = convertPropertyFileToMap.getPropertyFromMap(element, xpathLocatorMap);
        try {
            WebElement ele = findElement.searchClickableElement(By.xpath(element));
            Select select = new Select(ele);
            List<WebElement> selEle = select.getAllSelectedOptions();
            log.info(selEle.size() + "***********");
            for (WebElement e : selEle) {
                log.info(e.getText());
            }
            select.selectByVisibleText(text);
            log.info("Locator : " + element + " Value : " + text);
            reportHelper.writeLogInCaseOfPassInChildTest(text + " Selected from:  " + element);
            
        } catch (Exception e) {
            reportHelper.writeLogInCaseOfFailInChildTest(text + "not found:  " + element);
            reportHelper.addScreenShotInCaseOfFailInReportInChild(text + ":: not found in the dropdown");
            log.error(e);
            
        }
    }
    
    public void SelectUsingVisibleTextWithExcelText(String element, String excelQuery, String fieldName) {
        element = convertPropertyFileToMap.getPropertyFromMap(element, xpathLocatorMap);
        
        String text = filloExcelDataGetter.getDataFromaColumnOfAnExcellSheet(excelQuery, fieldName);
        try {
            WebElement ele = findElement.searchClickableElement(By.xpath(element));
            
            Select select = new Select(ele);
            select.selectByVisibleText(text);
            log.info("Locator : " + element + " Value : " + text);
            
        } catch (Exception e) {
            reportHelper.addScreenShotInCaseOfFailInReportInChild(text + ":: not found in the dropdown");
            log.error(e);
            
        }
    }
    
    public List<String> getAllDropDownValues(WebElement locator) {
        Select select = new Select(locator);
        List<WebElement> elementList = select.getOptions();
        List<String> valueList = new LinkedList<String>();
        
        for (WebElement element : elementList) {
            log.info(element.getText());
            valueList.add(element.getText());
        }
        return valueList;
    }
    public void waitUntilSelectOptionsPopulated(String xpath) {
        xpath = convertPropertyFileToMap.getPropertyFromMap(xpath, xpathLocatorMap);
        WebDriverWait wait = new WebDriverWait(d, 15);
        try {
			wait.until(ExpectedConditions
			        .presenceOfNestedElementsLocatedBy
			        (By.xpath(xpath), By.tagName("option")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
    }
}
