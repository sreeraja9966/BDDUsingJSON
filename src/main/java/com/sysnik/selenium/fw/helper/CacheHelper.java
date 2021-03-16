package com.sysnik.selenium.fw.helper;

import java.util.Map;

import org.openqa.selenium.By;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.fw.testBase.TestBase;

public class CacheHelper extends TestBase {
    FindElement findElement = AutomationObjectFactory.getFindElementInstance();
    
    ConvertPropertyFileToMap convertPropertyFileToMap = AutomationObjectFactory.getConvertPropertyFileToMapInstance();
    
    public void setCache(String key, String xpath, Map<String, String> cacheMap) {
        
        SeleniumHelper seleniumHelper = new SeleniumHelper();
        String reqText = seleniumHelper.getTextFromAnElement(xpath);
        
        cacheMap.put(key, reqText);
        
    }
    
    public void setCacheWithOnlyNumbers(String key, String xpath, Map<String, String> cacheMap) {
        
        String req = findElement.searchClickableElement(By.xpath(xpath)).getText();
        req = req.replaceAll("[^0-9]", "");
        cacheMap.put(key, req);
        
    }
    
    public void setCacheWithaString(String key, String value, Map<String, String> cacheMap) {
        
        String reqText = value;
        
        cacheMap.put(key.trim(), reqText.trim());
        
    }
    
    /**
     * While using getCache method & setCache method both should be called from same object, different objects will
     * clear the HashMap and getCache returns NULL value
     * 
     * @param key
     * @return
     */
    public String getCache(String key, Map<String, String> cacheMap) {
        
        return cacheMap.get(key.trim());
    }
}
